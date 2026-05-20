# Power Profile Toggle

A lightweight bash daemon that automatically toggles between Linux power profiles with simple start/stop controls and automatic cooling management.

## Features

- 🔄 Automatically toggles between `balanced` and `performance` power profiles
- 🚀 Runs silently in the background
- 🎮 Simple start/stop commands
- 🌡️ Optional temperature monitoring with auto-cooling
- 📦 No external dependencies - pure bash

## Prerequisites

- Linux system with `power-profiles-daemon` installed
- Bash shell

## Installation

```bash
git clone https://github.com/yourusername/power-profile-toggle.git
cd power-profile-toggle
chmod +x power_toggle.sh
# Start in background
./power_toggle.sh start

# Stop background process
./power_toggle.sh stop

# Run in foreground (original behavior)
./power_toggle.sh

# Check if running
./power_toggle.sh status
