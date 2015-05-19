From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 3/3] pinctrl: tegra-xusb: Check that of_match_node returns a valid pointer
Date: Tue, 19 May 2015 15:14:23 +0100
Message-ID: <1432044863-2035-4-git-send-email-jonathanh@nvidia.com>
References: <1432044863-2035-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1432044863-2035-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

of_match_node() will return NULL if no match is found and so check for
this before dereferencing the pointer.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/pinctrl/pinctrl-tegra-xusb.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-tegra-xusb.c b/drivers/pinctrl/pinctrl-tegra-xusb.c
index c61594066e26..0030cfb9c0a8 100644
--- a/drivers/pinctrl/pinctrl-tegra-xusb.c
+++ b/drivers/pinctrl/pinctrl-tegra-xusb.c
@@ -899,6 +899,9 @@ static int tegra_xusb_padctl_probe(struct platform_device *pdev)
 	padctl->dev = &pdev->dev;
 
 	match = of_match_node(tegra_xusb_padctl_of_match, pdev->dev.of_node);
+	if (!match)
+		return -EINVAL;
+
 	padctl->soc = match->data;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-- 
1.9.1

