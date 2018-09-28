From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V2 2/5] usb: xhci: tegra: Power-off power-domains on removal
Date: Fri, 28 Sep 2018 15:11:47 +0100
Message-ID: <1538143910-24400-3-git-send-email-jonathanh@nvidia.com>
References: <1538143910-24400-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1538143910-24400-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Currently the XUSB power domains used by the Tegra xHCI controller are
never powered off on the removal of the driver, however, they will be
powered off on probe failure. Update the removal code to be consistent
with the probe failure path to power off the XUSB power domains.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/usb/host/xhci-tegra.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index 4b463e5202a4..a586a7930a3d 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -1249,6 +1249,11 @@ static int tegra_xusb_remove(struct platform_device *pdev)
 	pm_runtime_put_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 
+	if (!pdev->dev.pm_domain) {
+		tegra_powergate_power_off(TEGRA_POWERGATE_XUSBC);
+		tegra_powergate_power_off(TEGRA_POWERGATE_XUSBA);
+	}
+
 	tegra_xusb_padctl_put(tegra->padctl);
 
 	return 0;
-- 
2.7.4
