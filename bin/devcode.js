#!/usr/bin/env node

const { execFileSync } = require('child_process');
const path = require('path');
const fs = require('fs');

// Get the target folder (first argument or current directory)
const targetFolder = process.argv[2] || '.';

// Resolve to absolute path
const absolutePath = path.resolve(targetFolder);

// Verify the directory exists
if (!fs.existsSync(absolutePath)) {
  console.error(`Error: Directory not found: ${absolutePath}`);
  process.exit(1);
}

// Determine platform and select appropriate script
const isWindows = process.platform === 'win32';
const scriptName = isWindows ? 'devcode.ps1' : 'devcode.sh';
const scriptPath = path.join(__dirname, '..', 'scripts', scriptName);

// Verify script exists
if (!fs.existsSync(scriptPath)) {
  console.error(`Error: Script not found: ${scriptPath}`);
  process.exit(1);
}

try {
  if (isWindows) {
    // Execute PowerShell script
    execFileSync(
      'powershell',
      ['-ExecutionPolicy', 'Bypass', '-File', scriptPath, absolutePath],
      { stdio: 'inherit' }
    );
  } else {
    // Execute bash script
    execFileSync(
      'bash',
      [scriptPath, absolutePath],
      { stdio: 'inherit' }
    );
  }
} catch (error) {
  // Error already displayed by child process
  process.exit(error.status || 1);
}
