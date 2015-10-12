From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 3/3] drivers/amba: make tegra-ahb.c explicitly non-modular
Date: Sun, 11 Oct 2015 21:35:47 -0400
Message-ID: <1444613747-17715-4-git-send-email-paul.gortmaker@windriver.com>
References: <1444613747-17715-1-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1444613747-17715-1-git-send-email-paul.gortmaker@windriver.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: Alexandre Courbot <gnurou@gmail.com>, Russell King <linux@arm.linux.org.uk>, Stephen Warren <swarren@wwwdotorg.org>, linux-kernel@vger.kernel.org, Paul Gortmaker <paul.gortmaker@windriver.com>, Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

The Kconfig currently controlling compilation of this code is:

drivers/amba/Kconfig:config TEGRA_AHB
drivers/amba/Kconfig:   bool "Enable AHB driver for NVIDIA Tegra SoCs"

...meaning that it currently is not being built as a module by anyone.

Lets remove the couple traces of modularity so that when reading the
driver there is no doubt it is builtin-only.

Since module_platform_driver() uses the same init level priority as
builtin_platform_driver() the init ordering remains unchanged with
this commit.

We also delete the MODULE_LICENSE tag etc. since all that information
is already contained at the top of the file in the comments.

Cc: Russell King <linux@arm.linux.org.uk>
Cc: Stephen Warren <swarren@wwwdotorg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>
Cc: linux-tegra@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/amba/tegra-ahb.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/amba/tegra-ahb.c b/drivers/amba/tegra-ahb.c
index b0b688c481e8..5b53ebfa4f9e 100644
--- a/drivers/amba/tegra-ahb.c
+++ b/drivers/amba/tegra-ahb.c
@@ -22,7 +22,7 @@
 
 #include <linux/err.h>
 #include <linux/kernel.h>
-#include <linux/module.h>
+#include <linux/init.h>
 #include <linux/platform_device.h>
 #include <linux/io.h>
 #include <linux/of.h>
@@ -301,9 +301,4 @@ static struct platform_driver tegra_ahb_driver = {
 		.pm = &tegra_ahb_pm,
 	},
 };
-module_platform_driver(tegra_ahb_driver);
-
-MODULE_AUTHOR("Hiroshi DOYU <hdoyu@nvidia.com>");
-MODULE_DESCRIPTION("Tegra AHB driver");
-MODULE_LICENSE("GPL v2");
-MODULE_ALIAS("platform:" DRV_NAME);
+builtin_platform_driver(tegra_ahb_driver);
-- 
2.6.1
