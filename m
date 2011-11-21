From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/5] arm/dt: tegra: Remove /memreserve/ from device-tree files
Date: Mon, 21 Nov 2011 14:44:07 -0700
Message-ID: <1321911851-10091-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

There are no drivers in the kernel at present which can make use of the
memory reserved by /memreserve/, so there is no point reserving it. Remove
/memreserve/ to allow the user more memory. It's also unclear whether any
future driver would actually require /memreserve/, or allocate memory
through some other mechanism.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra-harmony.dts   |    1 -
 arch/arm/boot/dts/tegra-paz00.dts     |    1 -
 arch/arm/boot/dts/tegra-seaboard.dts  |    1 -
 arch/arm/boot/dts/tegra-trimslice.dts |    1 -
 arch/arm/boot/dts/tegra-ventana.dts   |    1 -
 5 files changed, 0 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/tegra-harmony.dts b/arch/arm/boot/dts/tegra-harmony.dts
index 0e225b8..a802324 100644
--- a/arch/arm/boot/dts/tegra-harmony.dts
+++ b/arch/arm/boot/dts/tegra-harmony.dts
@@ -1,6 +1,5 @@
 /dts-v1/;
 
-/memreserve/ 0x1c000000 0x04000000;
 /include/ "tegra20.dtsi"
 
 / {
diff --git a/arch/arm/boot/dts/tegra-paz00.dts b/arch/arm/boot/dts/tegra-paz00.dts
index 15a949f..1cd0cfe 100644
--- a/arch/arm/boot/dts/tegra-paz00.dts
+++ b/arch/arm/boot/dts/tegra-paz00.dts
@@ -1,6 +1,5 @@
 /dts-v1/;
 
-/memreserve/ 0x1c000000 0x04000000;
 /include/ "tegra20.dtsi"
 
 / {
diff --git a/arch/arm/boot/dts/tegra-seaboard.dts b/arch/arm/boot/dts/tegra-seaboard.dts
index 88c682a..60724e4 100644
--- a/arch/arm/boot/dts/tegra-seaboard.dts
+++ b/arch/arm/boot/dts/tegra-seaboard.dts
@@ -1,6 +1,5 @@
 /dts-v1/;
 
-/memreserve/ 0x1c000000 0x04000000;
 /include/ "tegra20.dtsi"
 
 / {
diff --git a/arch/arm/boot/dts/tegra-trimslice.dts b/arch/arm/boot/dts/tegra-trimslice.dts
index d3d0d20..95117d3 100644
--- a/arch/arm/boot/dts/tegra-trimslice.dts
+++ b/arch/arm/boot/dts/tegra-trimslice.dts
@@ -1,6 +1,5 @@
 /dts-v1/;
 
-/memreserve/ 0x1c000000 0x04000000;
 /include/ "tegra20.dtsi"
 
 / {
diff --git a/arch/arm/boot/dts/tegra-ventana.dts b/arch/arm/boot/dts/tegra-ventana.dts
index 3f9abd6..2af12fa 100644
--- a/arch/arm/boot/dts/tegra-ventana.dts
+++ b/arch/arm/boot/dts/tegra-ventana.dts
@@ -1,6 +1,5 @@
 /dts-v1/;
 
-/memreserve/ 0x1c000000 0x04000000;
 /include/ "tegra20.dtsi"
 
 / {
-- 
1.7.0.4
