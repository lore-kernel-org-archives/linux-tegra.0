From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v2 4/4] usb: host: ehci-tegra: Remove USB_PHY dependencies from Kconfig
Date: Sun, 17 Dec 2017 20:07:06 +0300
Message-ID: <73bed692785827e01d11859f721e07c29a41510b.1513528011.git.digetx@gmail.com>
References: <36f2956bd89de80d798cdf7317cc58a6a8c0fa36.1513528011.git.digetx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <36f2956bd89de80d798cdf7317cc58a6a8c0fa36.1513528011.git.digetx@gmail.com>
In-Reply-To: <36f2956bd89de80d798cdf7317cc58a6a8c0fa36.1513528011.git.digetx@gmail.com>
References: <36f2956bd89de80d798cdf7317cc58a6a8c0fa36.1513528011.git.digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Felipe Balbi <balbi@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Previously tegra-phy driver was built only when ehci-tegra was, now
tegra-phy has its own Kconfig entry. Remove the USB_PHY dependencies
from ehci-tegra's Kconfig since they aren't useful anymore.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/usb/host/Kconfig | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index 6150bed7cfa8..5042e72c1b76 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -234,9 +234,6 @@ config USB_EHCI_TEGRA
        tristate "NVIDIA Tegra HCD support"
        depends on ARCH_TEGRA
        select USB_EHCI_ROOT_HUB_TT
-       select USB_PHY
-	select USB_ULPI
-	select USB_ULPI_VIEWPORT
        help
          This driver enables support for the internal USB Host Controllers
          found in NVIDIA Tegra SoCs. The controllers are EHCI compliant.
-- 
2.15.1
