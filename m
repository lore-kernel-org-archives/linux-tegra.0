From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] pinctrl: tegra: xusb: Silence sparse warnings
Date: Mon, 24 Apr 2017 13:56:49 +0200
Message-ID: <20170424115649.17424-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Commit 53d2a715c240 ("phy: Add Tegra XUSB pad controller support") added
a new driver for the XUSB pad controller that implements a more flexible
devicetree binding. In order to preserve backwards compatibility the old
driver can be probed if the obsolete bindings are detected.

In order to hide the legacy code, these prototypes were defined in a
header private to the new driver. This has the disadvantage of making
the sparse code checker complain about the missing declarations when
compiling the old driver and suggesting to make the functions static.

Avoid these sparse warnings by adding local prototype declarations into
the compatibility driver.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/pinctrl/tegra/pinctrl-tegra-xusb.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c b/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
index 6f68a9eebc58..ebedc2d32411 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
@@ -873,6 +873,10 @@ static const struct of_device_id tegra_xusb_padctl_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, tegra_xusb_padctl_of_match);
 
+/* predeclare these in order to silence sparse */
+int tegra_xusb_padctl_legacy_probe(struct platform_device *pdev);
+int tegra_xusb_padctl_legacy_remove(struct platform_device *pdev);
+
 int tegra_xusb_padctl_legacy_probe(struct platform_device *pdev)
 {
 	struct tegra_xusb_padctl *padctl;
-- 
2.12.0
