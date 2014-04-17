module deimos.cef1.life_span_handler;

// Copyright (c) 2012 Marshall A. Greenblatt. All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are
// met:
//
//    * Redistributions of source code must retain the above copyright
// notice, this list of conditions and the following disclaimer.
//    * Redistributions in binary form must reproduce the above
// copyright notice, this list of conditions and the following disclaimer
// in the documentation and/or other materials provided with the
// distribution.
//    * Neither the name of Google Inc. nor the name Chromium Embedded
// Framework nor the names of its contributors may be used to endorse
// or promote products derived from this software without specific prior
// written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
// "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
// LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
// A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
// OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
// SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
// LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
// DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
// THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//
// ---------------------------------------------------------------------------
//
// This file was generated by the CEF translator tool and should not edited
// by hand. See the translator.README.txt file in the tools directory for
// more information.
//

// #ifndef CEF_INCLUDE_CAPI_CEF_LIFE_SPAN_HANDLER_CAPI_H_
// #pragma once

// #ifdef __cplusplus
extern(C) {
// #endif

import deimos.cef1.base;


///
// Implement this structure to handle events related to browser life span. The
// functions of this structure will be called on the UI thread.
///
struct cef_life_span_handler_t {
  ///
  // Base structure.
  ///
  cef_base_t base;

  ///
  // Called before a new popup window is created. The |parentBrowser| parameter
  // will point to the parent browser window. The |popupFeatures| parameter will
  // contain information about the style of popup window requested. Return false
  // (0) to have the framework create the new popup window based on the
  // parameters in |windowInfo|. Return true (1) to cancel creation of the popup
  // window. By default, a newly created popup window will have the same client
  // and settings as the parent window. To change the client for the new window
  // modify the object that |client| points to. To change the settings for the
  // new window modify the |settings| structure.
  ///
  extern(System) int function(cef_life_span_handler_t* self, cef_browser_t* parentBrowser, const(cef_popup_features_t)* popupFeatures, cef_window_info_t* windowInfo, const(cef_string_t)* url, cef_client_t** client, cef_browser_settings_t* settings) on_before_popup;

  ///
  // Called after a new window is created.
  ///
  extern(System) void function(cef_life_span_handler_t* self, cef_browser_t* browser) on_after_created;

  ///
  // Called when a modal window is about to display and the modal loop should
  // begin running. Return false (0) to use the default modal loop
  // implementation or true (1) to use a custom implementation.
  ///
  extern(System) int function(cef_life_span_handler_t* self, cef_browser_t* browser) run_modal;

  ///
  // Called when a window has recieved a request to close. Return false (0) to
  // proceed with the window close or true (1) to cancel the window close. If
  // this is a modal window and a custom modal loop implementation was provided
  // in run_modal() this callback should be used to restore the opener window to
  // a usable state.
  ///
  extern(System) int function(cef_life_span_handler_t* self, cef_browser_t* browser) do_close;

  ///
  // Called just before a window is closed. If this is a modal window and a
  // custom modal loop implementation was provided in run_modal() this callback
  // should be used to exit the custom modal loop.
  ///
  extern(System) void function(cef_life_span_handler_t* self, cef_browser_t* browser) on_before_close;
}


// #ifdef __cplusplus
}
// #endif

// #endif CEF_INCLUDE_CAPI_CEF_LIFE_SPAN_HANDLER_CAPI_H_