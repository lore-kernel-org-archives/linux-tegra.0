From: Anders Roxell <anders.roxell-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] memory: tegra: mark PM functions as __maybe_unused
Date: Mon, 27 Apr 2020 19:28:02 +0200
Message-ID: <20200427172802.17569-1-anders.roxell@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Anders Roxell <anders.roxell-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Without this, we get a couple of warnings when CONFIG_PM_SLEEP is
disabled.

../drivers/memory/tegra/tegra186.c:1578:12: warning: ‘tegra186_mc_resume’ defined but not used [-Wunused-function]
 1578 | static int tegra186_mc_resume(struct device *dev)
      |            ^~~~~~~~~~~~~~~~~~
../drivers/memory/tegra/tegra186.c:1573:12: warning: ‘tegra186_mc_suspend’ defined but not used [-Wunused-function]
 1573 | static int tegra186_mc_suspend(struct device *dev)
      |            ^~~~~~~~~~~~~~~~~~~

Fixes: 177602b00641 ("memory: tegra: Add system sleep support")
Signed-off-by: Anders Roxell <anders.roxell-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
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
2.20.1
