From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [patch 2/2] pinctrl: tegra-xusb: testing wrong variable in probe()
Date: Thu, 31 Jul 2014 18:23:08 +0300
Message-ID: <20140731152308.GE31539@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <kernel-janitors-owner@vger.kernel.org>
Content-Disposition: inline
Sender: kernel-janitors-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org, kernel-janitors@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

There is a cut and paste bug so we test the wrong variable.  "err" is
never less than zero at this point.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/pinctrl/pinctrl-tegra-xusb.c b/drivers/pinctrl/pinctrl-tegra-xusb.c
index 419a047..e641b42 100644
--- a/drivers/pinctrl/pinctrl-tegra-xusb.c
+++ b/drivers/pinctrl/pinctrl-tegra-xusb.c
@@ -930,7 +930,8 @@ static int tegra_xusb_padctl_probe(struct platform_device *pdev)
 
 	padctl->provider = devm_of_phy_provider_register(&pdev->dev,
 							 tegra_xusb_padctl_xlate);
-	if (err < 0) {
+	if (IS_ERR(padctl->provider)) {
+		err = PTR_ERR(padctl->provider);
 		dev_err(&pdev->dev, "failed to register PHYs: %d\n", err);
 		goto unregister;
 	}
