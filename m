From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 3/5] usb: xhci: tegra: Add genpd support
Date: Wed, 26 Sep 2018 13:27:36 +0100
Message-ID: <1537964858-30332-4-git-send-email-jonathanh@nvidia.com>
References: <1537964858-30332-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1537964858-30332-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, Kevin Hilman <khilman@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman <mathias.nyman@intel.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

The generic power-domain framework has been updated to allow devices
that require more than one power-domain to create a new device for
each power-domain required and then link these new power-domain
devices to the consumer device.

Update the Tegra xHCI driver to use the new APIs provided by the
generic power-domain framework so we can use the generic power-domain
framework for managing the xHCI controllers power-domains. Please
note that to maintain backward compatibility with older device-tree
blobs these new generic power-domain APIs are only used if the
'power-domains' property is present and otherwise we fall back to
using the legacy Tegra APIs for managing the power-domains.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/usb/host/xhci-tegra.c | 88 +++++++++++++++++++++++++++++++++++++------
 1 file changed, 77 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index 4b463e5202a4..335d9d7e515e 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -18,6 +18,7 @@
 #include <linux/phy/tegra/xusb.h>
 #include <linux/platform_device.h>
 #include <linux/pm.h>
+#include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
@@ -194,6 +195,11 @@ struct tegra_xusb {
 	struct reset_control *host_rst;
 	struct reset_control *ss_rst;
 
+	struct device *genpd_dev_host;
+	struct device *genpd_dev_ss;
+	struct device_link *genpd_dl_host;
+	struct device_link *genpd_dl_ss;
+
 	struct phy **phys;
 	unsigned int num_phys;
 
@@ -928,6 +934,60 @@ static int tegra_xusb_load_firmware(struct tegra_xusb *tegra)
 	return 0;
 }
 
+static void tegra_xusb_powerdomain_remove(struct device *dev,
+					  struct tegra_xusb *tegra)
+{
+	if (tegra->genpd_dl_ss)
+		device_link_del(tegra->genpd_dl_ss);
+	if (tegra->genpd_dl_host)
+		device_link_del(tegra->genpd_dl_host);
+	if (tegra->genpd_dev_ss)
+		dev_pm_domain_detach(tegra->genpd_dev_ss, true);
+	if (tegra->genpd_dev_host)
+		dev_pm_domain_detach(tegra->genpd_dev_host, true);
+}
+
+static int tegra_xusb_powerdomain_init(struct device *dev,
+				       struct tegra_xusb *tegra)
+{
+	int err;
+
+	tegra->genpd_dev_host = genpd_dev_pm_attach_by_name(dev, "xusb_host");
+	if (IS_ERR(tegra->genpd_dev_host)) {
+		err = PTR_ERR(tegra->genpd_dev_host);
+		dev_err(dev, "failed to get host pm-domain: %d\n", err);
+		return err;
+	}
+
+	tegra->genpd_dev_ss = genpd_dev_pm_attach_by_name(dev, "xusb_ss");
+	if (IS_ERR(tegra->genpd_dev_ss)) {
+		tegra_xusb_powerdomain_remove(dev, tegra);
+		err = PTR_ERR(tegra->genpd_dev_ss);
+		dev_err(dev, "failed to get superspeed pm-domain: %d\n", err);
+		return err;
+	}
+
+	tegra->genpd_dl_host = device_link_add(dev, tegra->genpd_dev_host,
+					       DL_FLAG_PM_RUNTIME |
+					       DL_FLAG_STATELESS);
+	if (!tegra->genpd_dl_host) {
+		tegra_xusb_powerdomain_remove(dev, tegra);
+		dev_err(dev, "adding host device link failed!\n");
+		return -ENODEV;
+	}
+
+	tegra->genpd_dl_ss = device_link_add(dev, tegra->genpd_dev_ss,
+					     DL_FLAG_PM_RUNTIME |
+					     DL_FLAG_STATELESS);
+	if (!tegra->genpd_dl_ss) {
+		tegra_xusb_powerdomain_remove(dev, tegra);
+		dev_err(dev, "adding superspeed device link failed!\n");
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
 static int tegra_xusb_probe(struct platform_device *pdev)
 {
 	struct tegra_xusb_mbox_msg msg;
@@ -1038,7 +1098,11 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 		goto put_padctl;
 	}
 
-	if (!pdev->dev.pm_domain) {
+	if (of_property_read_bool(pdev->dev.of_node, "power-domains")) {
+		err = tegra_xusb_powerdomain_init(&pdev->dev, tegra);
+		if (err)
+			goto put_padctl;
+	} else {
 		tegra->host_rst = devm_reset_control_get(&pdev->dev,
 							 "xusb_host");
 		if (IS_ERR(tegra->host_rst)) {
@@ -1069,9 +1133,10 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 							tegra->host_clk,
 							tegra->host_rst);
 		if (err) {
+			tegra_powergate_power_off(TEGRA_POWERGATE_XUSBA);
 			dev_err(&pdev->dev,
 				"failed to enable XUSBC domain: %d\n", err);
-			goto disable_xusba;
+			goto put_padctl;
 		}
 	}
 
@@ -1079,7 +1144,7 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 				       sizeof(*tegra->supplies), GFP_KERNEL);
 	if (!tegra->supplies) {
 		err = -ENOMEM;
-		goto disable_xusbc;
+		goto put_powerdomains;
 	}
 
 	for (i = 0; i < tegra->soc->num_supplies; i++)
@@ -1089,7 +1154,7 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 				      tegra->supplies);
 	if (err) {
 		dev_err(&pdev->dev, "failed to get regulators: %d\n", err);
-		goto disable_xusbc;
+		goto put_powerdomains;
 	}
 
 	for (i = 0; i < tegra->soc->num_types; i++)
@@ -1099,7 +1164,7 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 				   sizeof(*tegra->phys), GFP_KERNEL);
 	if (!tegra->phys) {
 		err = -ENOMEM;
-		goto disable_xusbc;
+		goto put_powerdomains;
 	}
 
 	for (i = 0, k = 0; i < tegra->soc->num_types; i++) {
@@ -1115,7 +1180,7 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 					"failed to get PHY %s: %ld\n", prop,
 					PTR_ERR(phy));
 				err = PTR_ERR(phy);
-				goto disable_xusbc;
+				goto put_powerdomains;
 			}
 
 			tegra->phys[k++] = phy;
@@ -1126,7 +1191,7 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 				    dev_name(&pdev->dev));
 	if (!tegra->hcd) {
 		err = -ENOMEM;
-		goto disable_xusbc;
+		goto put_powerdomains;
 	}
 
 	/*
@@ -1222,12 +1287,13 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 disable_rpm:
 	pm_runtime_disable(&pdev->dev);
 	usb_put_hcd(tegra->hcd);
-disable_xusbc:
-	if (!pdev->dev.pm_domain)
+put_powerdomains:
+	if (of_property_read_bool(pdev->dev.of_node, "power-domains")) {
+		tegra_xusb_powerdomain_remove(&pdev->dev, tegra);
+	} else {
 		tegra_powergate_power_off(TEGRA_POWERGATE_XUSBC);
-disable_xusba:
-	if (!pdev->dev.pm_domain)
 		tegra_powergate_power_off(TEGRA_POWERGATE_XUSBA);
+	}
 put_padctl:
 	tegra_xusb_padctl_put(tegra->padctl);
 	return err;
-- 
2.7.4
