From: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: [PATCH] ARM: use "depends on" for SoC configs instead of "if" after
 prompt
Date: Mon, 16 Nov 2015 12:06:10 +0900
Message-ID: <1447643170-23773-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Viresh Kumar <vireshk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, linux-roc
List-Id: linux-tegra@vger.kernel.org

Many ARM sub-architectures use prompts followed by "if" conditional,
but it is wrong.

Please notice the difference between

    config ARCH_FOO
            bool "Foo SoCs" if ARCH_MULTI_V7

and

    config ARCH_FOO
            bool "Foo SoCs"
            depends on ARCH_MULTI_V7

These two are *not* equivalent!

In the former statement, it is not ARCH_FOO, but its prompt that
depends on ARCH_MULTI_V7.  So, it is completely valid that ARCH_FOO
is selected by another, but ARCH_MULTI_V7 is still disabled. As it is
not unmet dependency, Kconfig never warns.  This is probably not what
you want.

The former should be used only when you need to do so, and you really
understand what you are doing.  (In most cases, it should be wrong!)

For enabling/disabling sub-architectures, the latter is always correct.

As a good side effect, this commit fixes some entries over 80 columns
(mach-imx, mach-integrator, mach-mbevu).

Signed-off-by: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
---

I hope this patch is applied to ARM-SOC, but am CCing Kbuild ML
because the correct understanding of Kconfig is required for this patch.


 arch/arm/Kconfig                 |  3 ++-
 arch/arm/mach-alpine/Kconfig     |  3 ++-
 arch/arm/mach-at91/Kconfig       | 15 ++++++++++-----
 arch/arm/mach-axxia/Kconfig      |  3 ++-
 arch/arm/mach-bcm/Kconfig        | 27 ++++++++++++++++++---------
 arch/arm/mach-berlin/Kconfig     |  3 ++-
 arch/arm/mach-cns3xxx/Kconfig    |  3 ++-
 arch/arm/mach-exynos/Kconfig     |  3 ++-
 arch/arm/mach-highbank/Kconfig   |  3 ++-
 arch/arm/mach-hisi/Kconfig       | 12 ++++++++----
 arch/arm/mach-imx/Kconfig        |  6 ++++--
 arch/arm/mach-integrator/Kconfig |  3 ++-
 arch/arm/mach-mediatek/Kconfig   |  3 ++-
 arch/arm/mach-meson/Kconfig      |  3 ++-
 arch/arm/mach-moxart/Kconfig     |  3 ++-
 arch/arm/mach-mvebu/Kconfig      | 24 ++++++++++++++++--------
 arch/arm/mach-picoxcell/Kconfig  |  3 ++-
 arch/arm/mach-prima2/Kconfig     |  3 ++-
 arch/arm/mach-qcom/Kconfig       |  3 ++-
 arch/arm/mach-rockchip/Kconfig   |  3 ++-
 arch/arm/mach-s5pv210/Kconfig    |  3 ++-
 arch/arm/mach-shmobile/Kconfig   |  4 ++--
 arch/arm/mach-socfpga/Kconfig    |  3 ++-
 arch/arm/mach-spear/Kconfig      |  3 ++-
 arch/arm/mach-sti/Kconfig        |  3 ++-
 arch/arm/mach-sunxi/Kconfig      |  3 ++-
 arch/arm/mach-tegra/Kconfig      |  3 ++-
 arch/arm/mach-u300/Kconfig       |  4 ++--
 arch/arm/mach-ux500/Kconfig      |  4 ++--
 arch/arm/mach-vexpress/Kconfig   |  3 ++-
 arch/arm/mach-zx/Kconfig         |  3 ++-
 arch/arm/mach-zynq/Kconfig       |  3 ++-
 32 files changed, 110 insertions(+), 58 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 0365cbb..54fda82 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -794,7 +794,8 @@ config ARCH_MULTI_CPU_AUTO
 endmenu
 
 config ARCH_VIRT
-	bool "Dummy Virtual Machine" if ARCH_MULTI_V7
+	bool "Dummy Virtual Machine"
+	depends on ARCH_MULTI_V7
 	select ARM_AMBA
 	select ARM_GIC
 	select ARM_GIC_V3
diff --git a/arch/arm/mach-alpine/Kconfig b/arch/arm/mach-alpine/Kconfig
index 2c44b93..5c2d54f 100644
--- a/arch/arm/mach-alpine/Kconfig
+++ b/arch/arm/mach-alpine/Kconfig
@@ -1,5 +1,6 @@
 config ARCH_ALPINE
-	bool "Annapurna Labs Alpine platform" if ARCH_MULTI_V7
+	bool "Annapurna Labs Alpine platform"
+	depends on ARCH_MULTI_V7
 	select ARM_AMBA
 	select ARM_GIC
 	select GENERIC_IRQ_CHIP
diff --git a/arch/arm/mach-at91/Kconfig b/arch/arm/mach-at91/Kconfig
index 9267300..8649f03 100644
--- a/arch/arm/mach-at91/Kconfig
+++ b/arch/arm/mach-at91/Kconfig
@@ -9,7 +9,8 @@ menuconfig ARCH_AT91
 
 if ARCH_AT91
 config SOC_SAMA5D2
-	bool "SAMA5D2 family" if ARCH_MULTI_V7
+	bool "SAMA5D2 family"
+	depends on ARCH_MULTI_V7
 	select SOC_SAMA5
 	select CACHE_L2X0
 	select HAVE_FB_ATMEL
@@ -21,7 +22,8 @@ config SOC_SAMA5D2
 	  Select this if ou are using one of Atmel's SAMA5D2 family SoC.
 
 config SOC_SAMA5D3
-	bool "SAMA5D3 family" if ARCH_MULTI_V7
+	bool "SAMA5D3 family"
+	depends on ARCH_MULTI_V7
 	select SOC_SAMA5
 	select HAVE_FB_ATMEL
 	select HAVE_AT91_UTMI
@@ -32,7 +34,8 @@ config SOC_SAMA5D3
 	  This support covers SAMA5D31, SAMA5D33, SAMA5D34, SAMA5D35, SAMA5D36.
 
 config SOC_SAMA5D4
-	bool "SAMA5D4 family" if ARCH_MULTI_V7
+	bool "SAMA5D4 family"
+	depends on ARCH_MULTI_V7
 	select SOC_SAMA5
 	select CACHE_L2X0
 	select HAVE_FB_ATMEL
@@ -44,7 +47,8 @@ config SOC_SAMA5D4
 	  Select this if you are using one of Atmel's SAMA5D4 family SoC.
 
 config SOC_AT91RM9200
-	bool "AT91RM9200" if ARCH_MULTI_V4T
+	bool "AT91RM9200"
+	depends on ARCH_MULTI_V4T
 	select ATMEL_AIC_IRQ
 	select ATMEL_ST
 	select CPU_ARM920T
@@ -56,7 +60,8 @@ config SOC_AT91RM9200
 	  Select this if you are using Atmel's AT91RM9200 SoC.
 
 config SOC_AT91SAM9
-	bool "AT91SAM9" if ARCH_MULTI_V5
+	bool "AT91SAM9"
+	depends on ARCH_MULTI_V5
 	select ATMEL_AIC_IRQ
 	select ATMEL_SDRAMC
 	select CPU_ARM926T
diff --git a/arch/arm/mach-axxia/Kconfig b/arch/arm/mach-axxia/Kconfig
index 8be7e0a..6c6d5e7 100644
--- a/arch/arm/mach-axxia/Kconfig
+++ b/arch/arm/mach-axxia/Kconfig
@@ -1,5 +1,6 @@
 config ARCH_AXXIA
-	bool "LSI Axxia platforms" if (ARCH_MULTI_V7 && ARM_LPAE)
+	bool "LSI Axxia platforms"
+	depends on ARCH_MULTI_V7 && ARM_LPAE
 	select ARCH_DMA_ADDR_T_64BIT
 	select ARM_AMBA
 	select ARM_GIC
diff --git a/arch/arm/mach-bcm/Kconfig b/arch/arm/mach-bcm/Kconfig
index 8c53c55..77116dc 100644
--- a/arch/arm/mach-bcm/Kconfig
+++ b/arch/arm/mach-bcm/Kconfig
@@ -1,5 +1,6 @@
 menuconfig ARCH_BCM
-	bool "Broadcom SoC Support" if ARCH_MULTI_V6_V7
+	bool "Broadcom SoC Support"
+	depends on ARCH_MULTI_V6_V7
 	help
 	  This enables support for Broadcom ARM based SoC chips
 
@@ -27,7 +28,8 @@ config ARCH_BCM_IPROC
 	  Currently supported SoCs are Cygnus.
 
 config ARCH_BCM_CYGNUS
-	bool "Broadcom Cygnus Support" if ARCH_MULTI_V7
+	bool "Broadcom Cygnus Support"
+	depends on ARCH_MULTI_V7
 	select ARCH_BCM_IPROC
 	help
 	  Enable support for the Cygnus family,
@@ -36,7 +38,8 @@ config ARCH_BCM_CYGNUS
 	  BCM58300, BCM58302, BCM58303, BCM58305.
 
 config ARCH_BCM_NSP
-	bool "Broadcom Northstar Plus SoC Support" if ARCH_MULTI_V7
+	bool "Broadcom Northstar Plus SoC Support"
+	depends on ARCH_MULTI_V7
 	select ARCH_BCM_IPROC
 	select ARM_ERRATA_754322
 	select ARM_ERRATA_775420
@@ -50,7 +53,8 @@ config ARCH_BCM_NSP
 	  NAND flash, SATA and several other IO controllers.
 
 config ARCH_BCM_5301X
-	bool "Broadcom BCM470X / BCM5301X ARM SoC" if ARCH_MULTI_V7
+	bool "Broadcom BCM470X / BCM5301X ARM SoC"
+	depends on ARCH_MULTI_V7
 	select ARCH_BCM_IPROC
 	help
 	  Support for Broadcom BCM470X and BCM5301X SoCs with ARM CPU cores.
@@ -82,7 +86,8 @@ config ARCH_BCM_MOBILE
 	  This enables support for systems based on Broadcom mobile SoCs.
 
 config ARCH_BCM_281XX
-	bool "Broadcom BCM281XX SoC family" if ARCH_MULTI_V7
+	bool "Broadcom BCM281XX SoC family"
+	depends on ARCH_MULTI_V7
 	select ARCH_BCM_MOBILE
 	select HAVE_SMP
 	help
@@ -91,7 +96,8 @@ config ARCH_BCM_281XX
 	  variants.
 
 config ARCH_BCM_21664
-	bool "Broadcom BCM21664 SoC family" if ARCH_MULTI_V7
+	bool "Broadcom BCM21664 SoC family"
+	depends on ARCH_MULTI_V7
 	select ARCH_BCM_MOBILE
 	select HAVE_SMP
 	help
@@ -122,7 +128,8 @@ config ARCH_BCM_MOBILE_SMP
 comment "Other Architectures"
 
 config ARCH_BCM2835
-	bool "Broadcom BCM2835 family" if ARCH_MULTI_V6
+	bool "Broadcom BCM2835 family"
+	depends on ARCH_MULTI_V6
 	select ARCH_REQUIRE_GPIOLIB
 	select ARM_AMBA
 	select ARM_ERRATA_411920
@@ -135,7 +142,8 @@ config ARCH_BCM2835
 	  used in the Raspberry Pi and Roku 2 devices.
 
 config ARCH_BCM_63XX
-	bool "Broadcom BCM63xx DSL SoC" if ARCH_MULTI_V7
+	bool "Broadcom BCM63xx DSL SoC"
+	depends on ARCH_MULTI_V7
 	depends on MMU
 	select ARM_ERRATA_754322
 	select ARM_ERRATA_764369 if SMP
@@ -152,7 +160,8 @@ config ARCH_BCM_63XX
 	  the BCM63138 variant.
 
 config ARCH_BRCMSTB
-	bool "Broadcom BCM7XXX based boards" if ARCH_MULTI_V7
+	bool "Broadcom BCM7XXX based boards"
+	depends on ARCH_MULTI_V7
 	select ARM_GIC
 	select ARM_ERRATA_798181 if SMP
 	select HAVE_ARM_ARCH_TIMER
diff --git a/arch/arm/mach-berlin/Kconfig b/arch/arm/mach-berlin/Kconfig
index 742d53a..ffbfa0b 100644
--- a/arch/arm/mach-berlin/Kconfig
+++ b/arch/arm/mach-berlin/Kconfig
@@ -1,5 +1,6 @@
 menuconfig ARCH_BERLIN
-	bool "Marvell Berlin SoCs" if ARCH_MULTI_V7
+	bool "Marvell Berlin SoCs"
+	depends on ARCH_MULTI_V7
 	select ARCH_HAS_RESET_CONTROLLER
 	select ARCH_REQUIRE_GPIOLIB
 	select ARM_GIC
diff --git a/arch/arm/mach-cns3xxx/Kconfig b/arch/arm/mach-cns3xxx/Kconfig
index 3c22a19..eb14a0f 100644
--- a/arch/arm/mach-cns3xxx/Kconfig
+++ b/arch/arm/mach-cns3xxx/Kconfig
@@ -1,5 +1,6 @@
 menuconfig ARCH_CNS3XXX
-	bool "Cavium Networks CNS3XXX family" if ARCH_MULTI_V6
+	bool "Cavium Networks CNS3XXX family"
+	depends on ARCH_MULTI_V6
 	select ARM_GIC
 	select PCI_DOMAINS if PCI
 	help
diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index 3a10f1a..49e8dcf 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -8,7 +8,8 @@
 # Configuration options for the EXYNOS4
 
 menuconfig ARCH_EXYNOS
-	bool "Samsung EXYNOS" if ARCH_MULTI_V7
+	bool "Samsung EXYNOS"
+	depends on ARCH_MULTI_V7
 	select ARCH_HAS_BANDGAP
 	select ARCH_HAS_HOLES_MEMORYMODEL
 	select ARCH_REQUIRE_GPIOLIB
diff --git a/arch/arm/mach-highbank/Kconfig b/arch/arm/mach-highbank/Kconfig
index 31aa866..81110ec 100644
--- a/arch/arm/mach-highbank/Kconfig
+++ b/arch/arm/mach-highbank/Kconfig
@@ -1,5 +1,6 @@
 config ARCH_HIGHBANK
-	bool "Calxeda ECX-1000/2000 (Highbank/Midway)" if ARCH_MULTI_V7
+	bool "Calxeda ECX-1000/2000 (Highbank/Midway)"
+	depends on ARCH_MULTI_V7
 	select ARCH_DMA_ADDR_T_64BIT if ARM_LPAE
 	select ARCH_HAS_HOLES_MEMORYMODEL
 	select ARCH_SUPPORTS_BIG_ENDIAN
diff --git a/arch/arm/mach-hisi/Kconfig b/arch/arm/mach-hisi/Kconfig
index 83061ad..a3b091a 100644
--- a/arch/arm/mach-hisi/Kconfig
+++ b/arch/arm/mach-hisi/Kconfig
@@ -13,7 +13,8 @@ if ARCH_HISI
 menu "Hisilicon platform type"
 
 config ARCH_HI3xxx
-	bool "Hisilicon Hi36xx family" if ARCH_MULTI_V7
+	bool "Hisilicon Hi36xx family"
+	depends on ARCH_MULTI_V7
 	select CACHE_L2X0
 	select HAVE_ARM_SCU if SMP
 	select HAVE_ARM_TWD if SMP
@@ -23,7 +24,8 @@ config ARCH_HI3xxx
 	  Support for Hisilicon Hi36xx SoC family
 
 config ARCH_HIP01
-       bool "Hisilicon HIP01 family" if ARCH_MULTI_V7
+       bool "Hisilicon HIP01 family"
+       depends on ARCH_MULTI_V7
        select HAVE_ARM_SCU if SMP
        select HAVE_ARM_TWD if SMP
        select ARM_GLOBAL_TIMER
@@ -31,7 +33,8 @@ config ARCH_HIP01
          Support for Hisilicon HIP01 SoC family
 
 config ARCH_HIP04
-	bool "Hisilicon HiP04 Cortex A15 family" if ARCH_MULTI_V7
+	bool "Hisilicon HiP04 Cortex A15 family"
+	depends on ARCH_MULTI_V7
 	select ARM_ERRATA_798181 if SMP
 	select HAVE_ARM_ARCH_TIMER
 	select MCPM if SMP
@@ -40,7 +43,8 @@ config ARCH_HIP04
 	  Support for Hisilicon HiP04 SoC family
 
 config ARCH_HIX5HD2
-	bool "Hisilicon X5HD2 family" if ARCH_MULTI_V7
+	bool "Hisilicon X5HD2 family"
+	depends on ARCH_MULTI_V7
 	select CACHE_L2X0
 	select HAVE_ARM_SCU if SMP
 	select HAVE_ARM_TWD if SMP
diff --git a/arch/arm/mach-imx/Kconfig b/arch/arm/mach-imx/Kconfig
index 8ceda28..0ac180f 100644
--- a/arch/arm/mach-imx/Kconfig
+++ b/arch/arm/mach-imx/Kconfig
@@ -1,5 +1,6 @@
 menuconfig ARCH_MXC
-	bool "Freescale i.MX family" if ARCH_MULTI_V4_V5 || ARCH_MULTI_V6_V7 || ARM_SINGLE_ARMV7M
+	bool "Freescale i.MX family"
+	depends on ARCH_MULTI_V4_V5 || ARCH_MULTI_V6_V7 || ARM_SINGLE_ARMV7M
 	select ARCH_REQUIRE_GPIOLIB
 	select ARM_CPU_SUSPEND if PM
 	select CLKSRC_IMX_GPT
@@ -596,7 +597,8 @@ choice
 	default VF_USE_ARM_GLOBAL_TIMER
 
 	config VF_USE_ARM_GLOBAL_TIMER
-		bool "Use ARM Global Timer" if ARCH_MULTI_V7
+		bool "Use ARM Global Timer"
+		depends on ARCH_MULTI_V7
 		select ARM_GLOBAL_TIMER
 		select CLKSRC_ARM_GLOBAL_TIMER_SCHED_CLOCK
 		help
diff --git a/arch/arm/mach-integrator/Kconfig b/arch/arm/mach-integrator/Kconfig
index 02d0834..2fa9d11 100644
--- a/arch/arm/mach-integrator/Kconfig
+++ b/arch/arm/mach-integrator/Kconfig
@@ -1,5 +1,6 @@
 config ARCH_INTEGRATOR
-	bool "ARM Ltd. Integrator family" if (ARCH_MULTI_V4T || ARCH_MULTI_V5 || ARCH_MULTI_V6)
+	bool "ARM Ltd. Integrator family"
+	depends on ARCH_MULTI_V4T || ARCH_MULTI_V5 || ARCH_MULTI_V6
 	select ARM_AMBA
 	select ARM_PATCH_PHYS_VIRT if MMU
 	select AUTO_ZRELADDR
diff --git a/arch/arm/mach-mediatek/Kconfig b/arch/arm/mach-mediatek/Kconfig
index aeece17..0abcc51 100644
--- a/arch/arm/mach-mediatek/Kconfig
+++ b/arch/arm/mach-mediatek/Kconfig
@@ -1,5 +1,6 @@
 menuconfig ARCH_MEDIATEK
-	bool "Mediatek MT65xx & MT81xx SoC" if ARCH_MULTI_V7
+	bool "Mediatek MT65xx & MT81xx SoC"
+	depends on ARCH_MULTI_V7
 	select ARM_GIC
 	select PINCTRL
 	select MTK_TIMER
diff --git a/arch/arm/mach-meson/Kconfig b/arch/arm/mach-meson/Kconfig
index 5d56f86..31bdd91 100644
--- a/arch/arm/mach-meson/Kconfig
+++ b/arch/arm/mach-meson/Kconfig
@@ -1,5 +1,6 @@
 menuconfig ARCH_MESON
-	bool "Amlogic Meson SoCs" if ARCH_MULTI_V7
+	bool "Amlogic Meson SoCs"
+	depends on ARCH_MULTI_V7
 	select ARCH_REQUIRE_GPIOLIB
 	select GENERIC_IRQ_CHIP
 	select ARM_GIC
diff --git a/arch/arm/mach-moxart/Kconfig b/arch/arm/mach-moxart/Kconfig
index f49328c..180d9d2 100644
--- a/arch/arm/mach-moxart/Kconfig
+++ b/arch/arm/mach-moxart/Kconfig
@@ -1,5 +1,6 @@
 menuconfig ARCH_MOXART
-	bool "MOXA ART SoC" if ARCH_MULTI_V4
+	bool "MOXA ART SoC"
+	depends on ARCH_MULTI_V4
 	select CPU_FA526
 	select ARM_DMA_MEM_BUFFERABLE
 	select CLKSRC_MMIO
diff --git a/arch/arm/mach-mvebu/Kconfig b/arch/arm/mach-mvebu/Kconfig
index e20fc41..64e3d2c 100644
--- a/arch/arm/mach-mvebu/Kconfig
+++ b/arch/arm/mach-mvebu/Kconfig
@@ -1,5 +1,6 @@
 menuconfig ARCH_MVEBU
-	bool "Marvell Engineering Business Unit (MVEBU) SoCs" if (ARCH_MULTI_V7 || ARCH_MULTI_V5)
+	bool "Marvell Engineering Business Unit (MVEBU) SoCs"
+	depends on ARCH_MULTI_V7 || ARCH_MULTI_V5
 	select ARCH_SUPPORTS_BIG_ENDIAN
 	select CLKSRC_MMIO
 	select GENERIC_IRQ_CHIP
@@ -25,7 +26,8 @@ config MACH_MVEBU_V7
 	select MACH_MVEBU_ANY
 
 config MACH_ARMADA_370
-	bool "Marvell Armada 370 boards" if ARCH_MULTI_V7
+	bool "Marvell Armada 370 boards"
+	depends on ARCH_MULTI_V7
 	select ARMADA_370_CLK
 	select CPU_PJ4B
 	select MACH_MVEBU_V7
@@ -35,7 +37,8 @@ config MACH_ARMADA_370
 	  on the Marvell Armada 370 SoC with device tree.
 
 config MACH_ARMADA_375
-	bool "Marvell Armada 375 boards" if ARCH_MULTI_V7
+	bool "Marvell Armada 375 boards"
+	depends on ARCH_MULTI_V7
 	select ARM_ERRATA_720789
 	select ARM_ERRATA_753970
 	select ARM_GIC
@@ -50,7 +53,8 @@ config MACH_ARMADA_375
 	  on the Marvell Armada 375 SoC with device tree.
 
 config MACH_ARMADA_38X
-	bool "Marvell Armada 380/385 boards" if ARCH_MULTI_V7
+	bool "Marvell Armada 380/385 boards"
+	depends on ARCH_MULTI_V7
 	select ARM_ERRATA_720789
 	select ARM_ERRATA_753970
 	select ARM_GIC
@@ -65,7 +69,8 @@ config MACH_ARMADA_38X
 	  on the Marvell Armada 380/385 SoC with device tree.
 
 config MACH_ARMADA_39X
-	bool "Marvell Armada 39x boards" if ARCH_MULTI_V7
+	bool "Marvell Armada 39x boards"
+	depends on ARCH_MULTI_V7
 	select ARM_GIC
 	select ARMADA_39X_CLK
 	select CACHE_L2X0
@@ -79,7 +84,8 @@ config MACH_ARMADA_39X
 	  on the Marvell Armada 39x SoC with device tree.
 
 config MACH_ARMADA_XP
-	bool "Marvell Armada XP boards" if ARCH_MULTI_V7
+	bool "Marvell Armada XP boards"
+	depends on ARCH_MULTI_V7
 	select ARMADA_XP_CLK
 	select CPU_PJ4B
 	select MACH_MVEBU_V7
@@ -89,7 +95,8 @@ config MACH_ARMADA_XP
 	  on the Marvell Armada XP SoC with device tree.
 
 config MACH_DOVE
-	bool "Marvell Dove boards" if ARCH_MULTI_V7
+	bool "Marvell Dove boards"
+	depends on ARCH_MULTI_V7
 	select CACHE_L2X0
 	select CPU_PJ4
 	select DOVE_CLK
@@ -103,7 +110,8 @@ config MACH_DOVE
 	  Marvell Dove using flattened device tree.
 
 config MACH_KIRKWOOD
-	bool "Marvell Kirkwood boards" if ARCH_MULTI_V5
+	bool "Marvell Kirkwood boards"
+	depends on ARCH_MULTI_V5
 	select ARCH_REQUIRE_GPIOLIB
 	select CPU_FEROCEON
 	select KIRKWOOD_CLK
diff --git a/arch/arm/mach-picoxcell/Kconfig b/arch/arm/mach-picoxcell/Kconfig
index 62240f6..aef92ba 100644
--- a/arch/arm/mach-picoxcell/Kconfig
+++ b/arch/arm/mach-picoxcell/Kconfig
@@ -1,5 +1,6 @@
 config ARCH_PICOXCELL
-	bool "Picochip PicoXcell" if ARCH_MULTI_V6
+	bool "Picochip PicoXcell"
+	depends on ARCH_MULTI_V6
 	select ARCH_REQUIRE_GPIOLIB
 	select ARM_VIC
 	select DW_APB_TIMER_OF
diff --git a/arch/arm/mach-prima2/Kconfig b/arch/arm/mach-prima2/Kconfig
index 9ab8932..f998eb1 100644
--- a/arch/arm/mach-prima2/Kconfig
+++ b/arch/arm/mach-prima2/Kconfig
@@ -1,5 +1,6 @@
 menuconfig ARCH_SIRF
-	bool "CSR SiRF" if ARCH_MULTI_V7
+	bool "CSR SiRF"
+	depends on ARCH_MULTI_V7
 	select ARCH_HAS_RESET_CONTROLLER
 	select ARCH_REQUIRE_GPIOLIB
 	select GENERIC_IRQ_CHIP
diff --git a/arch/arm/mach-qcom/Kconfig b/arch/arm/mach-qcom/Kconfig
index 2256cd1..7349450 100644
--- a/arch/arm/mach-qcom/Kconfig
+++ b/arch/arm/mach-qcom/Kconfig
@@ -1,5 +1,6 @@
 menuconfig ARCH_QCOM
-	bool "Qualcomm Support" if ARCH_MULTI_V7
+	bool "Qualcomm Support"
+	depends on ARCH_MULTI_V7
 	select ARCH_SUPPORTS_BIG_ENDIAN
 	select ARM_GIC
 	select ARM_AMBA
diff --git a/arch/arm/mach-rockchip/Kconfig b/arch/arm/mach-rockchip/Kconfig
index ae4eb7c..cef42fd 100644
--- a/arch/arm/mach-rockchip/Kconfig
+++ b/arch/arm/mach-rockchip/Kconfig
@@ -1,5 +1,6 @@
 config ARCH_ROCKCHIP
-	bool "Rockchip RK2928 and RK3xxx SOCs" if ARCH_MULTI_V7
+	bool "Rockchip RK2928 and RK3xxx SOCs"
+	depends on ARCH_MULTI_V7
 	select PINCTRL
 	select PINCTRL_ROCKCHIP
 	select ARCH_HAS_RESET_CONTROLLER
diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210/Kconfig
index 330bfc8..13bc982 100644
--- a/arch/arm/mach-s5pv210/Kconfig
+++ b/arch/arm/mach-s5pv210/Kconfig
@@ -8,7 +8,8 @@
 # Configuration options for the S5PV210/S5PC110
 
 config ARCH_S5PV210
-	bool "Samsung S5PV210/S5PC110" if ARCH_MULTI_V7
+	bool "Samsung S5PV210/S5PC110"
+	depends on ARCH_MULTI_V7
 	select ARCH_HAS_HOLES_MEMORYMODEL
 	select ARCH_REQUIRE_GPIOLIB
 	select ARM_VIC
diff --git a/arch/arm/mach-shmobile/Kconfig b/arch/arm/mach-shmobile/Kconfig
index 88734a5..0f25f8f 100644
--- a/arch/arm/mach-shmobile/Kconfig
+++ b/arch/arm/mach-shmobile/Kconfig
@@ -30,8 +30,8 @@ config ARCH_RMOBILE
 	select SYS_SUPPORTS_SH_TMU
 
 menuconfig ARCH_SHMOBILE_MULTI
-	bool "Renesas ARM SoCs" if ARCH_MULTI_V7
-	depends on MMU
+	bool "Renesas ARM SoCs"
+	depends on ARCH_MULTI_V7 && MMU
 	select ARCH_SHMOBILE
 	select HAVE_ARM_SCU if SMP
 	select HAVE_ARM_TWD if SMP
diff --git a/arch/arm/mach-socfpga/Kconfig b/arch/arm/mach-socfpga/Kconfig
index 90efdeb..d0f62ea 100644
--- a/arch/arm/mach-socfpga/Kconfig
+++ b/arch/arm/mach-socfpga/Kconfig
@@ -1,5 +1,6 @@
 menuconfig ARCH_SOCFPGA
-	bool "Altera SOCFPGA family" if ARCH_MULTI_V7
+	bool "Altera SOCFPGA family"
+	depends on ARCH_MULTI_V7
 	select ARCH_SUPPORTS_BIG_ENDIAN
 	select ARM_AMBA
 	select ARM_GIC
diff --git a/arch/arm/mach-spear/Kconfig b/arch/arm/mach-spear/Kconfig
index b6f4bda2..ea9ea95 100644
--- a/arch/arm/mach-spear/Kconfig
+++ b/arch/arm/mach-spear/Kconfig
@@ -3,7 +3,8 @@
 #
 
 menuconfig PLAT_SPEAR
-	bool "ST SPEAr Family" if ARCH_MULTI_V7 || ARCH_MULTI_V5
+	bool "ST SPEAr Family"
+	depends on ARCH_MULTI_V7 || ARCH_MULTI_V5
 	select ARCH_REQUIRE_GPIOLIB
 	select ARM_AMBA
 	select CLKSRC_MMIO
diff --git a/arch/arm/mach-sti/Kconfig b/arch/arm/mach-sti/Kconfig
index 125865d..736abe6 100644
--- a/arch/arm/mach-sti/Kconfig
+++ b/arch/arm/mach-sti/Kconfig
@@ -1,5 +1,6 @@
 menuconfig ARCH_STI
-	bool "STMicroelectronics Consumer Electronics SOCs" if ARCH_MULTI_V7
+	bool "STMicroelectronics Consumer Electronics SOCs"
+	depends on ARCH_MULTI_V7
 	select ARM_GIC
 	select ST_IRQCHIP
 	select ARM_GLOBAL_TIMER
diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
index 4efe2d4..c124d65 100644
--- a/arch/arm/mach-sunxi/Kconfig
+++ b/arch/arm/mach-sunxi/Kconfig
@@ -1,5 +1,6 @@
 menuconfig ARCH_SUNXI
-	bool "Allwinner SoCs" if ARCH_MULTI_V7
+	bool "Allwinner SoCs"
+	depends on ARCH_MULTI_V7
 	select ARCH_REQUIRE_GPIOLIB
 	select ARCH_HAS_RESET_CONTROLLER
 	select CLKSRC_MMIO
diff --git a/arch/arm/mach-tegra/Kconfig b/arch/arm/mach-tegra/Kconfig
index 0fa4c5f..a90f355 100644
--- a/arch/arm/mach-tegra/Kconfig
+++ b/arch/arm/mach-tegra/Kconfig
@@ -1,5 +1,6 @@
 menuconfig ARCH_TEGRA
-	bool "NVIDIA Tegra" if ARCH_MULTI_V7
+	bool "NVIDIA Tegra"
+	depends on ARCH_MULTI_V7
 	select ARCH_REQUIRE_GPIOLIB
 	select ARCH_SUPPORTS_TRUSTED_FOUNDATIONS
 	select ARM_AMBA
diff --git a/arch/arm/mach-u300/Kconfig b/arch/arm/mach-u300/Kconfig
index bc51a71..301a984 100644
--- a/arch/arm/mach-u300/Kconfig
+++ b/arch/arm/mach-u300/Kconfig
@@ -1,6 +1,6 @@
 menuconfig ARCH_U300
-	bool "ST-Ericsson U300 Series" if ARCH_MULTI_V5
-	depends on MMU
+	bool "ST-Ericsson U300 Series"
+	depends on ARCH_MULTI_V5 && MMU
 	select ARCH_REQUIRE_GPIOLIB
 	select ARM_AMBA
 	select ARM_VIC
diff --git a/arch/arm/mach-ux500/Kconfig b/arch/arm/mach-ux500/Kconfig
index c9ac19b..a5c3373 100644
--- a/arch/arm/mach-ux500/Kconfig
+++ b/arch/arm/mach-ux500/Kconfig
@@ -1,6 +1,6 @@
 menuconfig ARCH_U8500
-	bool "ST-Ericsson U8500 Series" if ARCH_MULTI_V7
-	depends on MMU
+	bool "ST-Ericsson U8500 Series"
+	depends on ARCH_MULTI_V7 && MMU
 	select AB8500_CORE
 	select ABX500_CORE
 	select ARCH_REQUIRE_GPIOLIB
diff --git a/arch/arm/mach-vexpress/Kconfig b/arch/arm/mach-vexpress/Kconfig
index 10f9389..398a297 100644
--- a/arch/arm/mach-vexpress/Kconfig
+++ b/arch/arm/mach-vexpress/Kconfig
@@ -1,5 +1,6 @@
 menuconfig ARCH_VEXPRESS
-	bool "ARM Ltd. Versatile Express family" if ARCH_MULTI_V7
+	bool "ARM Ltd. Versatile Express family"
+	depends on ARCH_MULTI_V7
 	select ARCH_REQUIRE_GPIOLIB
 	select ARCH_SUPPORTS_BIG_ENDIAN
 	select ARM_AMBA
diff --git a/arch/arm/mach-zx/Kconfig b/arch/arm/mach-zx/Kconfig
index 7fdc5bf..42e107c 100644
--- a/arch/arm/mach-zx/Kconfig
+++ b/arch/arm/mach-zx/Kconfig
@@ -1,5 +1,6 @@
 menuconfig ARCH_ZX
-	bool "ZTE ZX family" if ARCH_MULTI_V7
+	bool "ZTE ZX family"
+	depends on ARCH_MULTI_V7
 	help
 	  Support for ZTE ZX-based family of processors. TV
 	  set-top-box processor is supported. More will be
diff --git a/arch/arm/mach-zynq/Kconfig b/arch/arm/mach-zynq/Kconfig
index 78e5e00..f287667 100644
--- a/arch/arm/mach-zynq/Kconfig
+++ b/arch/arm/mach-zynq/Kconfig
@@ -1,5 +1,6 @@
 config ARCH_ZYNQ
-	bool "Xilinx Zynq ARM Cortex A9 Platform" if ARCH_MULTI_V7
+	bool "Xilinx Zynq ARM Cortex A9 Platform"
+	depends on ARCH_MULTI_V7
 	select ARCH_SUPPORTS_BIG_ENDIAN
 	select ARM_AMBA
 	select ARM_GIC
-- 
1.9.1
