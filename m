From: Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH v2 2/2] bus: tegra-aconnect: add system sleep callbacks
Date: Wed, 13 Mar 2019 10:11:59 +0530
Message-ID: <1552452119-6574-2-git-send-email-spujar@nvidia.com>
References: <1552452119-6574-1-git-send-email-spujar@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1552452119-6574-1-git-send-email-spujar@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: treding@nvidia.com, jonathanh@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Sameer Pujar <spujar@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

pm_runtime_force_suspend() and pm_runtime_force_resume() are used as system
sleep noirq suspend and resume callbacks. If the driver is active till late
suspend, where runtime PM cannot run, force suspend is essential for the
device. This makes sure that the device is put into low power state during
system wide PM transitions to sleep states.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 drivers/bus/tegra-aconnect.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/bus/tegra-aconnect.c b/drivers/bus/tegra-aconnect.c
index 9349157..ac58142 100644
--- a/drivers/bus/tegra-aconnect.c
+++ b/drivers/bus/tegra-aconnect.c
@@ -94,6 +94,8 @@ static int tegra_aconnect_runtime_suspend(struct device *dev)
 static const struct dev_pm_ops tegra_aconnect_pm_ops = {
 	SET_RUNTIME_PM_OPS(tegra_aconnect_runtime_suspend,
 			   tegra_aconnect_runtime_resume, NULL)
+	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				      pm_runtime_force_resume)
 };
 
 static const struct of_device_id tegra_aconnect_of_match[] = {
-- 
2.7.4
