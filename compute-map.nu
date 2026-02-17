#!/usr/bin/env nu
# ═══════════════════════════════════════════════════════════
# Lensmen Stack — Compute Allocation & Model Registry
# Source of truth: pulled live from API + openclaw models
# Updated: 2026-02-17
# ═══════════════════════════════════════════════════════════

print "
╔══════════════════════════════════════════════════════════╗
║    🔭  COMPUTE ALLOCATION — VERIFIED MODELS  🔭        ║
║    Source: live API pull + openclaw models command       ║
╚══════════════════════════════════════════════════════════╝
"

# ── VERIFIED MODEL REGISTRY (from live API pull) ──────────
print "▸ AI STUDIO API — AVAILABLE MODELS (free tier, API key)"
print ([[model display_name tier];
  ["gemini-2.5-pro"          "Gemini 2.5 Pro"          "Flagship"  ]
  ["gemini-2.5-flash"        "Gemini 2.5 Flash"        "Fast"      ]
  ["gemini-2.5-flash-lite"   "Gemini 2.5 Flash-Lite"   "Tiny"      ]
  ["gemini-2.0-flash"        "Gemini 2.0 Flash"        "Fast"      ]
  ["gemini-2.0-flash-lite"   "Gemini 2.0 Flash-Lite"   "Tiny"      ]
  ["gemini-3-pro-preview"         "Gemini 3 Pro Preview"     "Next-gen"  ]
  ["gemini-3-flash-preview"       "Gemini 3 Flash Preview"   "Next-gen"  ]
  ["gemini-3-pro-image-preview"   "Nano Banana Pro"          "Image gen" ]
  ["gemini-2.5-flash-image"       "Nano Banana"              "Image gen" ]
  ["gemini-embedding-001"         "Gemini Embedding 001"     "Embedding" ]
] | table)

print "\n▸ ANTIGRAVITY OAUTH — AVAILABLE MODELS (OpenClaw provider)"
print ([[provider_model actual_model quota];
  ["google-antigravity/gemini-3-flash"      "gemini-3-flash-preview"   "OAuth (daily reset)"          ]
  ["google-antigravity/gemini-3-pro-high"   "gemini-3-pro-preview"    "OAuth (daily reset)"          ]
  ["claude-opus-4-5-thinking"               "Claude Opus 4.5"         "80% remaining · resets in ~2h"]
  ["claude-sonnet-4-5"                      "Claude Sonnet 4.5"       "80% remaining · resets in ~2h"]
] | table)

print "\n▸ OPENCODE ZEN — AVAILABLE MODELS (API key)"
print ([[provider_model type];
  ["opencode/kimi-k2.5-free"  "Free tier · last resort fallback"]
] | table)

print "\n▸ GEMINI CLI SWARM — DEFAULT MODEL"
print ([[model note];
  ["Gemini 2.5 (Auto)"  "CLI auto-selects · typically 2.5 Flash or 2.5 Pro based on task"]
] | table)

# ── DEDICATED LANES ───────────────────────────────────────
print "\n▸ DEDICATED LANES — 1 ACCOUNT = 1 OWNER"
print ([[lane owner account models_available];
  ["A"  "OpenClaw (Jarvis)"  "Antigravity OAuth (jcharlesassets)" "gemini-3-flash · gemini-3-pro · claude-opus · claude-sonnet"]
  ["B"  "Swarm: Foghorn"     "foghornbullhorn@gmail.com"          "Gemini 2.5 Auto (flash/pro)"                               ]
  ["C"  "Swarm: JCharles"    "cuarzosclaudia@gmail.com"           "Gemini 2.5 Auto (flash/pro)"                               ]
  ["D"  "Swarm: Kimbal"      "kimbal.arisian@gmail.com"           "Gemini 2.5 Auto (flash/pro)"                               ]
  ["E"  "Swarm: CDMX"        "elem.agiqua@gmail.com"              "Gemini 2.5 Auto (flash/pro)"                               ]
  ["F"  "Agent Memory"       "AI Studio Key (jcharlesassets)"     "gemini-2.0-flash · gemini-embedding-001"                    ]
  ["G"  "Last Resort"        "OpenCode Zen Key"                   "kimi-k2.5-free"                                             ]
] | table)

# ── TASK SIZE → MODEL (verified names) ───────────────────
print "\n▸ TASK SIZING — RIGHT TOOL FOR THE JOB"
print ([[size examples model why];
  ["XS"  "grep · format · lint · summarize"          "gemini-2.0-flash-lite"   "Cheapest · fastest · no thinking"  ]
  ["S"   "Single file edit · simple Q&A"             "gemini-2.5-flash-lite"   "Light reasoning · fast"            ]
  ["M"   "Multi-file feature · bug fix · refactor"   "gemini-2.5-flash"        "Solid all-rounder"                 ]
  ["L"   "Architecture · complex debug · planning"   "gemini-2.5-pro"          "Deep reasoning · large context"    ]
  ["XL"  "System design · doom loop recovery"        "gemini-3-pro-preview"    "Next-gen reasoning"                ]
  ["∞"   "Human stakes · critical decisions"         "claude-opus-4-5-thinking" "Maximum power (Antigravity only)" ]
] | table)

# ── OPENCLAW CASCADES (current config) ───────────────────
print "\n▸ OPENCLAW CASCADE (current openclaw.json)"
print ([[priority model provider status];
  ["Primary"    "google-antigravity/gemini-3-flash"     "Antigravity OAuth"  "✅ Active"         ]
  ["Fallback 1" "google-antigravity/gemini-3-pro-high"  "Antigravity OAuth"  "✅ Active"         ]
  ["Fallback 2" "opencode/kimi-k2.5-free"               "OpenCode Zen"       "✅ Active"         ]
  ["Available"  "claude-opus-4-5-thinking"               "Antigravity OAuth"  "🔓 Not configured"]
  ["Available"  "claude-sonnet-4-5"                      "Antigravity OAuth"  "🔓 Not configured"]
] | table)

# ── ANTI-CONTENTION ──────────────────────────────────────
print "\n▸ ANTI-CONTENTION RULES"
print ([[rule description];
  ["1 account = 1 owner"        "No two services share an OAuth account"                     ]
  ["Ant Farm → swarm nodes"     "Workers dispatch to B/C/D/E lanes, never touch Lane A"      ]
  ["Agent Memory = own API key" "Embeddings on Lane F, never competes with reasoning"        ]
  ["Cascade DOWN not UP"        "On rate limit: drop to cheaper model, don't retry same one" ]
  ["XS tasks ≠ pro models"      "Don't burn flagship compute on file reads"                  ]
] | table)

# ── GAP ──────────────────────────────────────────────────
print "\n▸ ⚠️  GAP: Claudia node (port 3003)"
print ([[issue fix];
  ["Shares cuarzosclaudia account with JCharles"           "Create 5th Google account for exclusive use"  ]
  ["Claude models available but not in OpenClaw cascade"   "Add claude-sonnet-4-5 as fallback if desired" ]
] | table)

print "
╔══════════════════════════════════════════════════════════╗
║  7 compute sources · 7 dedicated lanes · 6 task tiers   ║
║  Gemini 2.0→2.5→3 + Claude Opus/Sonnet + Kimi           ║
║  ~€20/mo. Embarrassing abundance of riches. 🎸           ║
╚══════════════════════════════════════════════════════════╝
"
