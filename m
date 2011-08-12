From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [RFC PATCH 09/12] arm/tegra: Convert pinmux driver to a platform
	device
Date: Fri, 12 Aug 2011 16:54:54 -0600
Message-ID: <1313189697-21287-10-git-send-email-swarren@nvidia.com>
References: <1313189697-21287-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1313189697-21287-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/pinmux.c |   21 +++++++++++++++++++++
 1 files changed, 21 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-tegra/pinmux.c b/arch/arm/mach-tegra/pinmux.c
index f80d507..05fa1a3 100644
--- a/arch/arm/mach-tegra/pinmux.c
+++ b/arch/arm/mach-tegra/pinmux.c
@@ -20,6 +20,7 @@
 #include <linux/errno.h>
 #include <linux/spinlock.h>
 #include <linux/io.h>
+#include <linux/platform_device.h>
 
 #include <mach/iomap.h>
 #include <mach/pinmux.h>
@@ -665,6 +666,26 @@ void tegra_pinmux_config_pullupdown_table(const struct tegra_pingroup_config *co
 	}
 }
 
+static int __init tegra_pinmux_probe(struct platform_device *pdev)
+{
+	return 0;
+}
+
+static struct platform_driver tegra_pinmux_driver = {
+	.driver		= {
+		.name	= "tegra-pinmux",
+		.owner	= THIS_MODULE,
+	},
+	.probe		= tegra_pinmux_probe,
+};
+
+static int __init tegra_pinmux_init(void)
+{
+	return platform_driver_register(&tegra_pinmux_driver);
+}
+postcore_initcall(tegra_pinmux_init);
+
+
 #ifdef	CONFIG_DEBUG_FS
 
 #include <linux/debugfs.h>
-- 
1.7.0.4
