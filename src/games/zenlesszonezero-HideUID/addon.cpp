/*
 * Copyright (C) 2024 Carlos Lopez
 * SPDX-License-Identifier: MIT
 */

#define ImTextureID ImU64

#define DEBUG_LEVEL_0

#include <deps/imgui/imgui.h>
#include <include/reshade.hpp>

#include <embed/shaders.h>

#include "../../mods/shader.hpp"
#include "../../mods/swapchain.hpp" 
#include "../../utils/settings.hpp"
#include "./shared.h"

namespace {

// Keep the original shader definition using the macro
renodx::mods::shader::CustomShaders custom_shaders = {
    CustomShaderEntry(0xADA9A730), // Hide UID - YOUR TARGET SHADER
};

ShaderInjectData shader_injection;

// This float will be the toggle's state: 0.f or 1.f
float custom_shader_toggle = 0; 

// The settings list contains ONLY your single toggle
renodx::utils::settings::Settings settings = {
    /*
	new renodx::utils::settings::Setting{
        .key = "UID", // The key MUST match what the CustomShaderEntry macro expects
        .binding = &custom_shader_toggle, 
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 0.f,
        .can_reset = false,
        .label = "Hide UID Toggle", 
        // Assuming: 0 = Patch Active (Hiding), 1 = Patch Inactive (Default UI)
        .labels = {"Enabled (Hide)", "Disabled (Show)"}, 
        .is_global = true,
    },
	*/
};

bool initialized = false;

}

extern "C" __declspec(dllexport) constexpr const char* NAME = "RenoDX - ZZZ Hide UID";
extern "C" __declspec(dllexport) constexpr const char* DESCRIPTION = "RenoDX (Zenless Zone Zero - Hide UID)";

BOOL APIENTRY DllMain(HMODULE h_module, DWORD fdw_reason, LPVOID lpv_reserved) {
    switch (fdw_reason) {
    case DLL_PROCESS_ATTACH:
      if (!reshade::register_addon(h_module)) return FALSE;
      
      initialized = true;
      break;
      
    case DLL_PROCESS_DETACH:
      reshade::unregister_addon(h_module);
      break;
    }

    // 1. Process settings (loads/saves the toggle state)
    //renodx::utils::settings::Use(fdw_reason, &settings);
    
    renodx::mods::shader::Use(fdw_reason, custom_shaders, &shader_injection);

    return TRUE;
}