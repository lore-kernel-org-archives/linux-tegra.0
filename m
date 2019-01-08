From: Anders Roxell <anders.roxell@linaro.org>
Subject: [PATCH] mailbox: tegra-hsp: mark PM functions as __maybe_unused
Date: Tue,  8 Jan 2019 15:37:13 +0100
Message-ID: <20190108143713.15120-1-anders.roxell@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: jassisinghbrar@gmail.com, thierry.reding@gmail.com, jonathanh@nvidia.com
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Anders Roxell <anders.roxell@linaro.org>
List-Id: linux-tegra@vger.kernel.org

Without CONFIG_PM_SLEEP, we get annoying warnings about unused
functions:

drivers/mailbox/tegra-hsp.c:782:12: warning: ‘tegra_hsp_resume’ defined but not used [-Wunused-function]
 static int tegra_hsp_resume(struct device *dev)
            ^~~~~~~~~~~~~~~~

Mark them as __maybe_unused to shut up the warning and silently drop the
functions without having to add ugly #ifdefs.

Fixes: 9a63f0f40599 ("mailbox: tegra-hsp: Add suspend/resume support")
Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 drivers/mailbox/tegra-hsp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mailbox/tegra-hsp.c b/drivers/mailbox/tegra-hsp.c
index e443f6a2ec4b..b9ce823f79ab 100644
--- a/drivers/mailbox/tegra-hsp.c
+++ b/drivers/mailbox/tegra-hsp.c
@@ -779,7 +779,7 @@ static int tegra_hsp_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int tegra_hsp_resume(struct device *dev)
+static __maybe_unused int tegra_hsp_resume(struct device *dev)
 {
 	struct tegra_hsp *hsp = dev_get_drvdata(dev);
 	unsigned int i;
-- 
2.19.2
