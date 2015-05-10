From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 5/7] drivers/soc: Convert non-modular tegra/pmc to use builtin_driver_register
Date: Sun, 10 May 2015 15:49:43 -0400
Message-ID: <1431287385-1526-6-git-send-email-paul.gortmaker@windriver.com>
References: <1431287385-1526-1-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1431287385-1526-1-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

This file depends on Kconfig ARCH_TEGRA which is a bool, so
we use the appropriate registration function, which avoids us
relying on an implicit inclusion of <module.h> which we are
doing currently.

While this currently works, we really don't want to be including
the module.h header in non-modular code, which we'd be forced
to do, pending some upcoming code relocation from init.h into
module.h.  So we fix it now by using the non-modular equivalent.

Cc: Stephen Warren <swarren@wwwdotorg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>
Cc: linux-tegra@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/soc/tegra/pmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index c956395cf46f..e3bca1368058 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -1010,7 +1010,7 @@ static struct platform_driver tegra_pmc_driver = {
 	},
 	.probe = tegra_pmc_probe,
 };
-module_platform_driver(tegra_pmc_driver);
+builtin_platform_driver(tegra_pmc_driver);
 
 /*
  * Early initialization to allow access to registers in the very early boot
-- 
2.2.1
