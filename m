From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] host1x: hdmi: Make sure clock is enabled before dumping registers
Date: Tue, 30 Jul 2013 11:35:03 +0300
Message-ID: <1375173303-4275-1-git-send-email-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The debugfs register dumping function did not enable the HDMI clock.
This led to a possible system hang when reading the debugfs entry
while no HDMI cable was connected to the system. This patch makes
sure that the clock is enabled during the read.

Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/host1x/drm/hdmi.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/host1x/drm/hdmi.c b/drivers/gpu/host1x/drm/hdmi.c
index 01097da..bf7f027 100644
--- a/drivers/gpu/host1x/drm/hdmi.c
+++ b/drivers/gpu/host1x/drm/hdmi.c
@@ -904,6 +904,11 @@ static int tegra_hdmi_show_regs(struct seq_file *s, void *data)
 {
 	struct drm_info_node *node = s->private;
 	struct tegra_hdmi *hdmi = node->info_ent->data;
+	int err;
+
+	err = clk_enable(hdmi->clk);
+	if (err)
+		return err;
 
 #define DUMP_REG(name)						\
 	seq_printf(s, "%-56s %#05x %08lx\n", #name, name,	\
@@ -1069,6 +1074,8 @@ static int tegra_hdmi_show_regs(struct seq_file *s, void *data)
 
 #undef DUMP_REG
 
+	clk_disable(hdmi->clk);
+
 	return 0;
 }
 
-- 
1.8.1.5
