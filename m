From: Arnd Bergmann <arnd@arndb.de>
Subject: [4.4-stable 09/22] ARM: tegra: select USB_ULPI from EHCI rather than
 platform
Date: Tue, 20 Feb 2018 12:54:56 +0100
Message-ID: <20180220115527.1806578-10-arnd@arndb.de>
References: <20180220115527.1806578-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180220115527.1806578-1-arnd@arndb.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: stable@vger.kernel.org
Cc: Alexandre Courbot <gnurou@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Stephen Warren <swarren@wwwdotorg.org>, Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, linux-tegra@vger.kernel.org, Thierry Reding <treding@nvidia.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

commit a262e87ff354f12447bb6268bd63edf7ba1c20e0 upstream.

For historic reasons, the tegra platform selects USB_ULPI from architecture
code, but that hasn't really made sense for a long time, as the only
user of that code is the Tegra EHCI driver that has its own Kconfig
symbol.

This removes the 'select' statements from mach-tegra and drivers/soc/tegra
and adds them with the device driver that actually needs them.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Thierry Reding <treding@nvidia.com>
[arnd: rebased to 4.4-stable]
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-tegra/Kconfig  | 2 --
 arch/arm64/Kconfig.platforms | 2 --
 drivers/usb/host/Kconfig     | 2 ++
 3 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-tegra/Kconfig b/arch/arm/mach-tegra/Kconfig
index 0fa4c5f8b1be..2d43357d4a0a 100644
--- a/arch/arm/mach-tegra/Kconfig
+++ b/arch/arm/mach-tegra/Kconfig
@@ -12,8 +12,6 @@ menuconfig ARCH_TEGRA
 	select ARCH_HAS_RESET_CONTROLLER
 	select RESET_CONTROLLER
 	select SOC_BUS
-	select USB_ULPI if USB_PHY
-	select USB_ULPI_VIEWPORT if USB_PHY
 	help
 	  This enables support for NVIDIA Tegra based systems.
 
diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 4043c35962cc..5edb50772c11 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -90,8 +90,6 @@ config ARCH_TEGRA_132_SOC
 	bool "NVIDIA Tegra132 SoC"
 	depends on ARCH_TEGRA
 	select PINCTRL_TEGRA124
-	select USB_ULPI if USB_PHY
-	select USB_ULPI_VIEWPORT if USB_PHY
 	help
 	  Enable support for NVIDIA Tegra132 SoC, based on the Denver
 	  ARMv8 CPU.  The Tegra132 SoC is similar to the Tegra124 SoC,
diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index 3bb08870148f..95e72d75e0a0 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -220,6 +220,8 @@ config USB_EHCI_TEGRA
        depends on ARCH_TEGRA
        select USB_EHCI_ROOT_HUB_TT
        select USB_PHY
+	select USB_ULPI
+	select USB_ULPI_VIEWPORT
        help
          This driver enables support for the internal USB Host Controllers
          found in NVIDIA Tegra SoCs. The controllers are EHCI compliant.
-- 
2.9.0
