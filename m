From: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [RFC PATCH 09/12] drm: dsi: Add "enter idle" & "exit idle" dcs functions
Date: Mon, 11 May 2015 09:38:28 +0800
Message-ID: <1431308311-4470-10-git-send-email-markz@nvidia.com>
References: <1431308311-4470-1-git-send-email-markz@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431308311-4470-1-git-send-email-markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Signed-off-by: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/drm_mipi_dsi.c | 36 ++++++++++++++++++++++++++++++++++++
 include/drm/drm_mipi_dsi.h     |  2 ++
 2 files changed, 38 insertions(+)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index 2d5ca8eec13a..9bc6ff75eb8f 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -862,6 +862,42 @@ int mipi_dsi_dcs_set_pixel_format(struct mipi_dsi_device *dsi, u8 format)
 }
 EXPORT_SYMBOL(mipi_dsi_dcs_set_pixel_format);
 
+/**
+ * mipi_dsi_dcs_enter_idle_mode()
+ * @dsi: DSI peripheral device
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int mipi_dsi_dcs_enter_idle_mode(struct mipi_dsi_device *dsi)
+{
+	ssize_t err;
+
+	err = mipi_dsi_dcs_write(dsi, MIPI_DCS_ENTER_IDLE_MODE, NULL, 0);
+	if (err < 0)
+		return err;
+
+	return 0;
+}
+EXPORT_SYMBOL(mipi_dsi_dcs_enter_idle_mode);
+
+/**
+ * mipi_dsi_dcs_exit_idle_mode()
+ * @dsi: DSI peripheral device
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int mipi_dsi_dcs_exit_idle_mode(struct mipi_dsi_device *dsi)
+{
+	ssize_t err;
+
+	err = mipi_dsi_dcs_write(dsi, MIPI_DCS_EXIT_IDLE_MODE, NULL, 0);
+	if (err < 0)
+		return err;
+
+	return 0;
+}
+EXPORT_SYMBOL(mipi_dsi_dcs_exit_idle_mode);
+
 static int mipi_dsi_drv_probe(struct device *dev)
 {
 	struct mipi_dsi_driver *drv = to_mipi_dsi_driver(dev->driver);
diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index f1d8d0dbb4f1..d949a8ef389f 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -214,6 +214,8 @@ int mipi_dsi_dcs_set_tear_off(struct mipi_dsi_device *dsi);
 int mipi_dsi_dcs_set_tear_on(struct mipi_dsi_device *dsi,
 			     enum mipi_dsi_dcs_tear_mode mode);
 int mipi_dsi_dcs_set_pixel_format(struct mipi_dsi_device *dsi, u8 format);
+int mipi_dsi_dcs_enter_idle_mode(struct mipi_dsi_device *dsi);
+int mipi_dsi_dcs_exit_idle_mode(struct mipi_dsi_device *dsi);
 
 /**
  * struct mipi_dsi_driver - DSI driver
-- 
2.1.4
