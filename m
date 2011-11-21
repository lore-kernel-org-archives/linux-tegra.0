From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/5] arm/dt: tegra: Remove /chosen node
Date: Mon, 21 Nov 2011 14:44:08 -0700
Message-ID: <1321911851-10091-2-git-send-email-swarren@nvidia.com>
References: <1321911851-10091-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1321911851-10091-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The command-lines present in the existing /chosen node are not necessarily
correct for all users. Ideally, we should simply use the command-line
supplied by the boot-loader.

In fact, using the boot-loader's cmdline is quite easy; either the
bootloader fully supports DT, in which case it can modify the DT passed
to the kernel to include its command-line, or CONFIG_APPENDED_DTB can
be used in conjunction with CONFIG_ARM_ATAG_DTB_COMPAT, and the kernel
will substitute the bootloader's command-line into the DT.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra-harmony.dts   |    4 ----
 arch/arm/boot/dts/tegra-paz00.dts     |    4 ----
 arch/arm/boot/dts/tegra-seaboard.dts  |    4 ----
 arch/arm/boot/dts/tegra-trimslice.dts |    4 ----
 arch/arm/boot/dts/tegra-ventana.dts   |    4 ----
 5 files changed, 0 insertions(+), 20 deletions(-)

diff --git a/arch/arm/boot/dts/tegra-harmony.dts b/arch/arm/boot/dts/tegra-harmony.dts
index a802324..ca6fa10 100644
--- a/arch/arm/boot/dts/tegra-harmony.dts
+++ b/arch/arm/boot/dts/tegra-harmony.dts
@@ -6,10 +6,6 @@
 	model = "NVIDIA Tegra2 Harmony evaluation board";
 	compatible = "nvidia,harmony", "nvidia,tegra20";
 
-	chosen {
-		bootargs = "vmalloc=192M video=tegrafb console=ttyS0,115200n8 root=/dev/mmcblk0p2 rw rootwait";
-	};
-
 	memory@0 {
 		reg = < 0x00000000 0x40000000 >;
 	};
diff --git a/arch/arm/boot/dts/tegra-paz00.dts b/arch/arm/boot/dts/tegra-paz00.dts
index 1cd0cfe..4f6a8aa 100644
--- a/arch/arm/boot/dts/tegra-paz00.dts
+++ b/arch/arm/boot/dts/tegra-paz00.dts
@@ -6,10 +6,6 @@
 	model = "Toshiba AC100 / Dynabook AZ";
 	compatible = "compal,paz00", "nvidia,tegra20";
 
-	chosen {
-		bootargs = "console=ttyS0,115200n8 root=/dev/mmcblk0p1";
-	};
-
 	memory@0 {
 		reg = <0x00000000 0x20000000>;
 	};
diff --git a/arch/arm/boot/dts/tegra-seaboard.dts b/arch/arm/boot/dts/tegra-seaboard.dts
index 60724e4..d1ada26 100644
--- a/arch/arm/boot/dts/tegra-seaboard.dts
+++ b/arch/arm/boot/dts/tegra-seaboard.dts
@@ -6,10 +6,6 @@
 	model = "NVIDIA Seaboard";
 	compatible = "nvidia,seaboard", "nvidia,tegra20";
 
-	chosen {
-		bootargs = "vmalloc=192M video=tegrafb console=ttyS0,115200n8 root=/dev/mmcblk1p3 rw rootwait";
-	};
-
 	memory {
 		device_type = "memory";
 		reg = < 0x00000000 0x40000000 >;
diff --git a/arch/arm/boot/dts/tegra-trimslice.dts b/arch/arm/boot/dts/tegra-trimslice.dts
index 95117d3..cf8e561 100644
--- a/arch/arm/boot/dts/tegra-trimslice.dts
+++ b/arch/arm/boot/dts/tegra-trimslice.dts
@@ -6,10 +6,6 @@
 	model = "Compulab TrimSlice board";
 	compatible = "compulab,trimslice", "nvidia,tegra20";
 
-	chosen {
-		bootargs = "vmalloc=192M video=tegrafb console=ttyS0,115200n8 root=/dev/mmcblk0p1 rw rootwait";
-	};
-
 	memory@0 {
 		reg = < 0x00000000 0x40000000 >;
 	};
diff --git a/arch/arm/boot/dts/tegra-ventana.dts b/arch/arm/boot/dts/tegra-ventana.dts
index 2af12fa..1c09485 100644
--- a/arch/arm/boot/dts/tegra-ventana.dts
+++ b/arch/arm/boot/dts/tegra-ventana.dts
@@ -6,10 +6,6 @@
 	model = "NVIDIA Tegra2 Ventana evaluation board";
 	compatible = "nvidia,ventana", "nvidia,tegra20";
 
-	chosen {
-		bootargs = "vmalloc=192M video=tegrafb console=ttyS0,115200n8 root=/dev/ram rdinit=/sbin/init";
-	};
-
 	memory {
 		reg = < 0x00000000 0x40000000 >;
 	};
-- 
1.7.0.4
