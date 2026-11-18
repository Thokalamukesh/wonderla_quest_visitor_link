
#!/bin/bash
set -e

echo "Installing Flutter SDK..."

git clone https://github.com/flutter/flutter.git -b stable --depth 1 /tmp/flutter

export PATH="/tmp/flutter/bin:$PATH"

flutter --version

echo "Getting Flutter dependencies..."
flutter pub get

echo "Building Flutter web..."
flutter build web --release

echo "Flutter web build completed!"
