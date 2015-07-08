From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 3/5] host1x: Handle HOST1X class address registers directly
Date: Wed, 8 Jul 2015 14:27:46 +0300
Message-ID: <1436354868-24309-4-git-send-email-mperttunen@nvidia.com>
References: <1436354868-24309-1-git-send-email-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1436354868-24309-1-git-send-email-mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: airlied-cv59FeDIM0c@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This moves handling of address registers in the HOST1X class directly
to the firewall code in host1x's job.c, so that individual clients don't
have to replicate this code. The list of address registers detected also
change from INDCTRL which is not actually an address register to INDOFF
and INDOFF2 which are.

Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/tegra/gr2d.c | 21 ++++++---------------
 drivers/gpu/drm/tegra/gr3d.c | 20 ++++++--------------
 drivers/gpu/host1x/job.c     | 12 +++++++++++-
 3 files changed, 23 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/tegra/gr2d.c b/drivers/gpu/drm/tegra/gr2d.c
index 7e4424f..f048d45 100644
--- a/drivers/gpu/drm/tegra/gr2d.c
+++ b/drivers/gpu/drm/tegra/gr2d.c
@@ -88,23 +88,14 @@ static int gr2d_is_addr_reg(struct device *dev, u32 class, u32 offset, u32 val)
 {
 	struct gr2d *gr2d = dev_get_drvdata(dev);
 
-	switch (class) {
-	case HOST1X_CLASS_HOST1X:
-		if (offset == 0x2b)
-			return 1;
+	if (class != HOST1X_CLASS_GR2D && class != HOST1X_CLASS_GR2D_SB)
+		return 0;
 
-		break;
+	if (offset >= GR2D_NUM_REGS)
+		return 0;
 
-	case HOST1X_CLASS_GR2D:
-	case HOST1X_CLASS_GR2D_SB:
-		if (offset >= GR2D_NUM_REGS)
-			break;
-
-		if (test_bit(offset, gr2d->addr_regs))
-			return 1;
-
-		break;
-	}
+	if (test_bit(offset, gr2d->addr_regs))
+		return 1;
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/tegra/gr3d.c b/drivers/gpu/drm/tegra/gr3d.c
index 9ceaf35..d0dab15 100644
--- a/drivers/gpu/drm/tegra/gr3d.c
+++ b/drivers/gpu/drm/tegra/gr3d.c
@@ -98,22 +98,14 @@ static int gr3d_is_addr_reg(struct device *dev, u32 class, u32 offset, u32 val)
 {
 	struct gr3d *gr3d = dev_get_drvdata(dev);
 
-	switch (class) {
-	case HOST1X_CLASS_HOST1X:
-		if (offset == 0x2b)
-			return 1;
+	if (class != HOST1X_CLASS_GR3D)
+		return 0;
 
-		break;
+	if (offset >= GR3D_NUM_REGS)
+		return 0;
 
-	case HOST1X_CLASS_GR3D:
-		if (offset >= GR3D_NUM_REGS)
-			break;
-
-		if (test_bit(offset, gr3d->addr_regs))
-			return 1;
-
-		break;
-	}
+	if (test_bit(offset, gr3d->addr_regs))
+		return 1;
 
 	return 0;
 }
diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
index 77d977b..0701008 100644
--- a/drivers/gpu/host1x/job.c
+++ b/drivers/gpu/host1x/job.c
@@ -295,10 +295,20 @@ struct host1x_firewall {
 	u32 count;
 };
 
+static int is_addr_reg(struct host1x_firewall *fw, unsigned long offset,
+		       u32 val)
+{
+	if (fw->class == HOST1X_CLASS_HOST1X &&
+		(offset == 0x2c /* INDOFF2 */ || offset == 0x2d /* INDOFF */))
+		return true;
+
+	return fw->job->is_addr_reg(fw->dev, fw->class, offset, val);
+}
+
 static int check_register(struct host1x_firewall *fw,
 			  unsigned long offset, u32 val)
 {
-	if (fw->job->is_addr_reg(fw->dev, fw->class, offset, val)) {
+	if (is_addr_reg(fw, offset, val)) {
 		if (!fw->num_relocs)
 			return -EINVAL;
 
-- 
2.1.4
