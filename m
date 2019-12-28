From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v3 09/16] usb: phy: tegra: Assert reset on ULPI close instead of deasserting it
Date: Sat, 28 Dec 2019 23:33:51 +0300
Message-ID: <20191228203358.23490-10-digetx@gmail.com>
References: <20191228203358.23490-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191228203358.23490-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Chen <Peter.Chen@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Felipe Balbi <balbi@kernel.org>
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Apparently ULPI was meant to be put into reset on PHY's shutdown (which is
active-low state of the GPIO), but there is a typo in the code.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/usb/phy/phy-tegra-usb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
index 0845fc0fb3f8..1ecd9f7900af 100644
--- a/drivers/usb/phy/phy-tegra-usb.c
+++ b/drivers/usb/phy/phy-tegra-usb.c
@@ -308,7 +308,7 @@ static void ulpi_close(struct tegra_usb_phy *phy)
 {
 	int err;
 
-	err = gpio_direction_output(phy->reset_gpio, 1);
+	err = gpio_direction_output(phy->reset_gpio, 0);
 	if (err) {
 		dev_err(phy->u_phy.dev,
 			"ULPI reset GPIO %d direction not asserted: %d\n",
-- 
2.24.0
