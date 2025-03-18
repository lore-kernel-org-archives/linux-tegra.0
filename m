Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DDEF19F47E
	for <linux-tegra@vger.kernel.org>; Tue, 18 Mar 2025 06:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742279749; cv=none; b=FG2B/ZtWGKckNMp4BZOsDK1HQEZk7psFtZoGl7OS+1LTlncTsuQZ8h4ua2datKnmSpF9pN7efBeCq1zvaD7TzZPpP6R6aIK74Aoc2HnOf240goU0amrXOMmLHX2GzgL/QaybC9GYPczoRuyQ0zyPFWcimyf5VAmlt6ZngbCeMlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742279749; c=relaxed/simple;
	bh=qiaCpBy+1SmlyOwbIiMfkSTOTPtzruPDTBDoTvSsQdE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qix6ImvORs1k8qAVu/HRhzJKHzKakpuSEDrGDGmPECFf//EOr77lwNykrxwrLs/I/lEGTuhOwsw5Q7650+UiF/deHlH3C6WJ0WxYITqzrngcgr6q7EaSJiRMvjaiSag0rM94xFHRpS1tueBOoCf68fJa8Z2IlfhTVKuNsGUeso0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=VfeZ/WcM; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="VfeZ/WcM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=3cFpy
	O0zoxCvQA2gLIyeQFepMdzph3mRX5brkB3Irso=; b=VfeZ/WcM4BZ5HyhCKqBZk
	SfrJqKobeznK5eSpa21uT1bByL1IwmmiYjHFVqGwi3GiIY0D9sFgAueHKI6nK25t
	LHVJ9M1aWIlRWq2gVSoNoFSPxtjKasybo8HI9ncL2Y7VuYgIOzYqDC/HUlha7+RR
	e9liCH4a2MYy58FdwJiT4I=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wDnnuYSFNlnP+WyAA--.9231S2;
	Tue, 18 Mar 2025 14:35:02 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: lumag@kernel.org
Cc: mripard@kernel.org,
	neil.armstrong@linaro.org,
	dri-devel@lists.freedesktop.org,
	dianders@chromium.org,
	jani.nikula@intel.com,
	lyude@redhat.com,
	jonathanh@nvidia.com,
	thierry.reding@gmail.com,
	victor.liu@nxp.com,
	rfoss@kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	Andy Yan <andy.yan@rock-chips.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 1/5] drm/dp: Pull drm_dp_link_power_up/down from Tegra to common drm_dp_helper
Date: Tue, 18 Mar 2025 14:34:35 +0800
Message-ID: <20250318063452.4983-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnnuYSFNlnP+WyAA--.9231S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3XFyfAFW5Ar1xKFyxAry5Jwb_yoW3XrWDpF
	ZxWry8tw4vvw4UXF47tF129rZxua17CFWkKrWxG3s3A3Wjyr98Xa45tr15GFy3JryDCay7
	tFnxCFW7GFWIkw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jFxRDUUUUU=
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBkAIUXmfZEzUB-gABs+

From: Andy Yan <andy.yan@rock-chips.com>

The helper functions drm_dp_link_power_up/down were moved to Tegra
DRM in commit 9a42c7c647a9 ("drm/tegra: Move drm_dp_link helpers to Tegra DRM")".

Now since more and more users are duplicating the same code in their
own drivers, it's time to make them as DRM DP common helpers again.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---

Changes in v2:
- Fix commit message as suggested by Dmitry

 drivers/gpu/drm/display/drm_dp_helper.c | 69 +++++++++++++++++++++++++
 drivers/gpu/drm/tegra/dp.c              | 67 ------------------------
 drivers/gpu/drm/tegra/dp.h              |  2 -
 drivers/gpu/drm/tegra/sor.c             |  4 +-
 include/drm/display/drm_dp_helper.h     |  2 +
 5 files changed, 73 insertions(+), 71 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index dbce1c3f4969..e5dec67e5fca 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -838,6 +838,75 @@ int drm_dp_dpcd_read_phy_link_status(struct drm_dp_aux *aux,
 }
 EXPORT_SYMBOL(drm_dp_dpcd_read_phy_link_status);
 
+/**
+ * drm_dp_link_power_up() - power up a DisplayPort link
+ * @aux: DisplayPort AUX channel
+ * @revision: DPCD revision supported on the link
+ *
+ * Returns 0 on success or a negative error code on failure.
+ */
+int drm_dp_link_power_up(struct drm_dp_aux *aux, unsigned char revision)
+{
+	u8 value;
+	int err;
+
+	/* DP_SET_POWER register is only available on DPCD v1.1 and later */
+	if (revision < DP_DPCD_REV_11)
+		return 0;
+
+	err = drm_dp_dpcd_readb(aux, DP_SET_POWER, &value);
+	if (err < 0)
+		return err;
+
+	value &= ~DP_SET_POWER_MASK;
+	value |= DP_SET_POWER_D0;
+
+	err = drm_dp_dpcd_writeb(aux, DP_SET_POWER, value);
+	if (err < 0)
+		return err;
+
+	/*
+	 * According to the DP 1.1 specification, a "Sink Device must exit the
+	 * power saving state within 1 ms" (Section 2.5.3.1, Table 5-52, "Sink
+	 * Control Field" (register 0x600).
+	 */
+	usleep_range(1000, 2000);
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_dp_link_power_up);
+
+/**
+ * drm_dp_link_power_down() - power down a DisplayPort link
+ * @aux: DisplayPort AUX channel
+ * @revision: DPCD revision supported on the link
+ *
+ * Returns 0 on success or a negative error code on failure.
+ */
+int drm_dp_link_power_down(struct drm_dp_aux *aux, unsigned char revision)
+{
+	u8 value;
+	int err;
+
+	/* DP_SET_POWER register is only available on DPCD v1.1 and later */
+	if (revision < DP_DPCD_REV_11)
+		return 0;
+
+	err = drm_dp_dpcd_readb(aux, DP_SET_POWER, &value);
+	if (err < 0)
+		return err;
+
+	value &= ~DP_SET_POWER_MASK;
+	value |= DP_SET_POWER_D3;
+
+	err = drm_dp_dpcd_writeb(aux, DP_SET_POWER, value);
+	if (err < 0)
+		return err;
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_dp_link_power_down);
+
 static int read_payload_update_status(struct drm_dp_aux *aux)
 {
 	int ret;
diff --git a/drivers/gpu/drm/tegra/dp.c b/drivers/gpu/drm/tegra/dp.c
index 08fbd8f151a1..990e744b0923 100644
--- a/drivers/gpu/drm/tegra/dp.c
+++ b/drivers/gpu/drm/tegra/dp.c
@@ -255,73 +255,6 @@ int drm_dp_link_probe(struct drm_dp_aux *aux, struct drm_dp_link *link)
 	return 0;
 }
 
-/**
- * drm_dp_link_power_up() - power up a DisplayPort link
- * @aux: DisplayPort AUX channel
- * @link: pointer to a structure containing the link configuration
- *
- * Returns 0 on success or a negative error code on failure.
- */
-int drm_dp_link_power_up(struct drm_dp_aux *aux, struct drm_dp_link *link)
-{
-	u8 value;
-	int err;
-
-	/* DP_SET_POWER register is only available on DPCD v1.1 and later */
-	if (link->revision < 0x11)
-		return 0;
-
-	err = drm_dp_dpcd_readb(aux, DP_SET_POWER, &value);
-	if (err < 0)
-		return err;
-
-	value &= ~DP_SET_POWER_MASK;
-	value |= DP_SET_POWER_D0;
-
-	err = drm_dp_dpcd_writeb(aux, DP_SET_POWER, value);
-	if (err < 0)
-		return err;
-
-	/*
-	 * According to the DP 1.1 specification, a "Sink Device must exit the
-	 * power saving state within 1 ms" (Section 2.5.3.1, Table 5-52, "Sink
-	 * Control Field" (register 0x600).
-	 */
-	usleep_range(1000, 2000);
-
-	return 0;
-}
-
-/**
- * drm_dp_link_power_down() - power down a DisplayPort link
- * @aux: DisplayPort AUX channel
- * @link: pointer to a structure containing the link configuration
- *
- * Returns 0 on success or a negative error code on failure.
- */
-int drm_dp_link_power_down(struct drm_dp_aux *aux, struct drm_dp_link *link)
-{
-	u8 value;
-	int err;
-
-	/* DP_SET_POWER register is only available on DPCD v1.1 and later */
-	if (link->revision < 0x11)
-		return 0;
-
-	err = drm_dp_dpcd_readb(aux, DP_SET_POWER, &value);
-	if (err < 0)
-		return err;
-
-	value &= ~DP_SET_POWER_MASK;
-	value |= DP_SET_POWER_D3;
-
-	err = drm_dp_dpcd_writeb(aux, DP_SET_POWER, value);
-	if (err < 0)
-		return err;
-
-	return 0;
-}
-
 /**
  * drm_dp_link_configure() - configure a DisplayPort link
  * @aux: DisplayPort AUX channel
diff --git a/drivers/gpu/drm/tegra/dp.h b/drivers/gpu/drm/tegra/dp.h
index cb12ed0c54e7..695060cafac0 100644
--- a/drivers/gpu/drm/tegra/dp.h
+++ b/drivers/gpu/drm/tegra/dp.h
@@ -164,8 +164,6 @@ int drm_dp_link_remove_rate(struct drm_dp_link *link, unsigned long rate);
 void drm_dp_link_update_rates(struct drm_dp_link *link);
 
 int drm_dp_link_probe(struct drm_dp_aux *aux, struct drm_dp_link *link);
-int drm_dp_link_power_up(struct drm_dp_aux *aux, struct drm_dp_link *link);
-int drm_dp_link_power_down(struct drm_dp_aux *aux, struct drm_dp_link *link);
 int drm_dp_link_configure(struct drm_dp_aux *aux, struct drm_dp_link *link);
 int drm_dp_link_choose(struct drm_dp_link *link,
 		       const struct drm_display_mode *mode,
diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index f98f70eda906..21f3dfdcc5c9 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -2666,7 +2666,7 @@ static void tegra_sor_dp_disable(struct drm_encoder *encoder)
 	 * the AUX transactions would just be timing out.
 	 */
 	if (output->connector.status != connector_status_disconnected) {
-		err = drm_dp_link_power_down(sor->aux, &sor->link);
+		err = drm_dp_link_power_down(sor->aux, sor->link.revision);
 		if (err < 0)
 			dev_err(sor->dev, "failed to power down link: %d\n",
 				err);
@@ -2882,7 +2882,7 @@ static void tegra_sor_dp_enable(struct drm_encoder *encoder)
 	else
 		dev_dbg(sor->dev, "link training succeeded\n");
 
-	err = drm_dp_link_power_up(sor->aux, &sor->link);
+	err = drm_dp_link_power_up(sor->aux, sor->link.revision);
 	if (err < 0)
 		dev_err(sor->dev, "failed to power up DP link: %d\n", err);
 
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index 5ae4241959f2..f9dabce484a7 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -566,6 +566,8 @@ int drm_dp_dpcd_read_link_status(struct drm_dp_aux *aux,
 int drm_dp_dpcd_read_phy_link_status(struct drm_dp_aux *aux,
 				     enum drm_dp_phy dp_phy,
 				     u8 link_status[DP_LINK_STATUS_SIZE]);
+int drm_dp_link_power_up(struct drm_dp_aux *aux, unsigned char revision);
+int drm_dp_link_power_down(struct drm_dp_aux *aux, unsigned char revision);
 
 int drm_dp_dpcd_write_payload(struct drm_dp_aux *aux,
 			      int vcpid, u8 start_time_slot, u8 time_slot_count);
-- 
2.43.0

