From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: fix another compilation error in 3.1-rc9
Date: Mon, 10 Oct 2011 11:17:21 +0200
Message-ID: <3546151.Ds9gZv0JqE@fb07-iapwap2>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Olof,

sorry for being so late, but here is another last minute patch.

Marc

-----

spi/tegra: fix compilation error in spi-tegra.c
    
This adds the missing #include <linux/module.h> to spi-tegra.c
    
Signed-off-by: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>

diff --git a/drivers/spi/spi-tegra.c b/drivers/spi/spi-tegra.c
index a5a6302..e8cd58f 100644
--- a/drivers/spi/spi-tegra.c
+++ b/drivers/spi/spi-tegra.c
@@ -18,6 +18,7 @@
  */
 
 #include <linux/kernel.h>
+#include <linux/module.h>
 #include <linux/init.h>
 #include <linux/err.h>
 #include <linux/platform_device.h>
