From: YueHaibing <yuehaibing-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: [PATCH -next] memory: tegra: mark PM functions as __maybe_unuse
Date: Mon, 30 Mar 2020 10:33:58 +0800
Message-ID: <20200330023358.30100-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, allison-wcfNWazeolPR7s880joybQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, kstewart-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, info-EcKl7qYKIbxeoWH0uzbU5w@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, yuehaibing-hv44wF8Li93QT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Without this, we get a couple of warnings when CONFIG_PM
is disabled:

drivers/memory/tegra/tegra186.c:1578:12: warning: 'tegra186_mc_resume' defined but not used [-Wunused-function]
 static int tegra186_mc_resume(struct device *dev)
            ^~~~~~~~~~~~~~~~~~
drivers/memory/tegra/tegra186.c:1573:12: warning: 'tegra186_mc_suspend' defined but not used [-Wunused-function]
 static int tegra186_mc_suspend(struct device *dev)
            ^~~~~~~~~~~~~~~~~~~

Fixes: 177602b00641 ("memory: tegra: Add system sleep support")
Signed-off-by: YueHaibing <yuehaibing-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
---
 drivers/memory/tegra/tegra186.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/memory/tegra/tegra186.c b/drivers/memory/tegra/tegra186.c
index 5d53f11ca7b6..e25c954dde2e 100644
--- a/drivers/memory/tegra/tegra186.c
+++ b/drivers/memory/tegra/tegra186.c
@@ -1570,12 +1570,12 @@ static const struct of_device_id tegra186_mc_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, tegra186_mc_of_match);
 
-static int tegra186_mc_suspend(struct device *dev)
+static int __maybe_unused tegra186_mc_suspend(struct device *dev)
 {
 	return 0;
 }
 
-static int tegra186_mc_resume(struct device *dev)
+static int __maybe_unused tegra186_mc_resume(struct device *dev)
 {
 	struct tegra186_mc *mc = dev_get_drvdata(dev);
 
-- 
2.17.1
