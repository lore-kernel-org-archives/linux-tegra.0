From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v3 15/16] usb: chipidea: tegra: Add USB_TEGRA_PHY to driver's dependencies
Date: Sat, 28 Dec 2019 23:33:57 +0300
Message-ID: <20191228203358.23490-16-digetx@gmail.com>
References: <20191228203358.23490-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191228203358.23490-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Chen <Peter.Chen@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Felipe Balbi <balbi@kernel.org>
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Now, when ci_hdrc_tegra kernel module is loaded, the phy_tegra_usb module
is loaded too regardless of kernel's configuration. Previously this
problem was masked because Tegra's EHCI driver is usually enabled in
kernel's config and thus PHY driver was getting loaded because of it, but
now I was making some more thorough testing and noticed that PHY's module
isn't getting auto-loaded without the host driver.

Note that ChipIdea's driver doesn't use any of the exported functions of
phy_tegra_usb module and thus the module needs to be requested explicitly.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/usb/chipidea/Kconfig         | 1 +
 drivers/usb/chipidea/ci_hdrc_tegra.c | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/usb/chipidea/Kconfig b/drivers/usb/chipidea/Kconfig
index ae850b3fddf2..d53db520e209 100644
--- a/drivers/usb/chipidea/Kconfig
+++ b/drivers/usb/chipidea/Kconfig
@@ -7,6 +7,7 @@ config USB_CHIPIDEA
 	select RESET_CONTROLLER
 	select USB_ULPI_BUS
 	select USB_ROLE_SWITCH
+	select USB_TEGRA_PHY if ARCH_TEGRA
 	help
 	  Say Y here if your system has a dual role high speed USB
 	  controller based on ChipIdea silicon IP. It supports:
diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c b/drivers/usb/chipidea/ci_hdrc_tegra.c
index 7455df0ede49..8bc11100245d 100644
--- a/drivers/usb/chipidea/ci_hdrc_tegra.c
+++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
@@ -53,6 +53,12 @@ static int tegra_udc_probe(struct platform_device *pdev)
 	struct tegra_udc *udc;
 	int err;
 
+	if (IS_MODULE(CONFIG_USB_TEGRA_PHY)) {
+		err = request_module("phy_tegra_usb");
+		if (err)
+			return err;
+	}
+
 	udc = devm_kzalloc(&pdev->dev, sizeof(*udc), GFP_KERNEL);
 	if (!udc)
 		return -ENOMEM;
-- 
2.24.0
