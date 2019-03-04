From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] mailbox: tegra-hsp: mark suspend function as __maybe_unused
Date: Mon,  4 Mar 2019 21:26:05 +0100
Message-ID: <20190304202610.1759671-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

We get a warning about this being unused when CONFIG_PM is disabled:

drivers/mailbox/tegra-hsp.c:782:12: error: 'tegra_hsp_resume' defined but not used [-Werror=unused-function]

Fixes: 9a63f0f40599 ("mailbox: tegra-hsp: Add suspend/resume support")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/mailbox/tegra-hsp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mailbox/tegra-hsp.c b/drivers/mailbox/tegra-hsp.c
index e443f6a2ec4b..11fc9fd6a94a 100644
--- a/drivers/mailbox/tegra-hsp.c
+++ b/drivers/mailbox/tegra-hsp.c
@@ -779,7 +779,7 @@ static int tegra_hsp_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int tegra_hsp_resume(struct device *dev)
+static int __maybe_unused tegra_hsp_resume(struct device *dev)
 {
 	struct tegra_hsp *hsp = dev_get_drvdata(dev);
 	unsigned int i;
-- 
2.20.0
