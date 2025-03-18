Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49B591A8F93
	for <linux-tegra@vger.kernel.org>; Tue, 18 Mar 2025 06:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742279753; cv=none; b=IJ7yE/bq0XaJgYwI0yfq5XFMBVlYg0Yiwj0xXi9Ty5onyoMS4ID89ScXpqTcWu0YhJftpRGMYwHTtPQFhEtDefk53t/SW0pAx46ZgJKxl/d5k6UQjSvMJNkdSyS6mJsOSWck40Ap34cLYDeVjqFcxw480zf0jjtZrR/x/jvc80c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742279753; c=relaxed/simple;
	bh=NNW+HtTbr9vza2y9sa/zBG9FqmrKPOyYgTVCbNUDk9g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SfuiqbgF6Yk6XrFszWQDZrdbHEFRkozK1cwXSUbyJQZTPPzmgYQoUQUfAUZIlmRar4wbO7hURFT4yY5aFzQPDFb+9d2cg8HJM+sXpL5qwIwnuDXtTaIygkAn9XTq13Co2J6j/M3hplWieEfuNdvOGLdVIHSzjncPfDWzpItUgZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=jrVtI4od; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="jrVtI4od"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=i6T2F
	0eCFThv3okYLkbuNB4j1ShIXzAcksGCUbz1o6U=; b=jrVtI4odp1oVxAZOXMstF
	n7ndha7qW9yoELihPWOo/V5QqJ0x1wmq+J5sz4AMsVoNPHxsFp4S2JxFBOtVmPNK
	cQ6Q3IwcWlodhLAta6MatmeAf/SBGhNQeHp6Hudm8emUAVS4Z3ySz0yaQJyUyQ2d
	nAhwxUIlthgDnLVasPQSwM=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wDnnuYSFNlnP+WyAA--.9231S6;
	Tue, 18 Mar 2025 14:35:05 +0800 (CST)
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
Subject: [PATCH v2 5/5] drm/bridge: it6505: Switch to common helpers to power up/down dp link
Date: Tue, 18 Mar 2025 14:34:39 +0800
Message-ID: <20250318063452.4983-5-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250318063452.4983-1-andyshrk@163.com>
References: <20250318063452.4983-1-andyshrk@163.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnnuYSFNlnP+WyAA--.9231S6
X-Coremail-Antispam: 1Uf129KBjvJXoWxZw18JF47GFy3AFyDWFWxJFb_yoW5urWfpr
	43X345JwsYqrW7Xw1vyr1xZFsxA3ZrJrZ5JrW7Gw40v3WUX398CayjvwnxGFyUAFyUGr1Y
	vrnF9F1xGF1Ikr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j4ksDUUUUU=
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqAQUXmfZDcXVzgAAsL

From: Andy Yan <andy.yan@rock-chips.com>

Use the common dp link power up/down helpers to avoid duplicating code.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---

(no changes since v1)

 drivers/gpu/drm/bridge/ite-it6505.c | 46 +++--------------------------
 1 file changed, 4 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 8a607558ac89..b05fc82bb667 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -771,40 +771,6 @@ static void it6505_calc_video_info(struct it6505 *it6505)
 			     DRM_MODE_ARG(&it6505->video_info));
 }
 
-static int it6505_drm_dp_link_set_power(struct drm_dp_aux *aux,
-					struct it6505_drm_dp_link *link,
-					u8 mode)
-{
-	u8 value;
-	int err;
-
-	/* DP_SET_POWER register is only available on DPCD v1.1 and later */
-	if (link->revision < DPCD_V_1_1)
-		return 0;
-
-	err = drm_dp_dpcd_readb(aux, DP_SET_POWER, &value);
-	if (err < 0)
-		return err;
-
-	value &= ~DP_SET_POWER_MASK;
-	value |= mode;
-
-	err = drm_dp_dpcd_writeb(aux, DP_SET_POWER, value);
-	if (err < 0)
-		return err;
-
-	if (mode == DP_SET_POWER_D0) {
-		/*
-		 * According to the DP 1.1 specification, a "Sink Device must
-		 * exit the power saving state within 1 ms" (Section 2.5.3.1,
-		 * Table 5-52, "Sink Control Field" (register 0x600).
-		 */
-		usleep_range(1000, 2000);
-	}
-
-	return 0;
-}
-
 static void it6505_clear_int(struct it6505 *it6505)
 {
 	it6505_write(it6505, INT_STATUS_01, 0xFF);
@@ -2578,8 +2544,7 @@ static void it6505_irq_hpd(struct it6505 *it6505)
 		}
 		it6505->auto_train_retry = AUTO_TRAIN_RETRY;
 
-		it6505_drm_dp_link_set_power(&it6505->aux, &it6505->link,
-					     DP_SET_POWER_D0);
+		drm_dp_link_power_up(&it6505->aux, it6505->link.revision);
 		dp_sink_count = it6505_dpcd_read(it6505, DP_SINK_COUNT);
 		it6505->sink_count = DP_GET_SINK_COUNT(dp_sink_count);
 
@@ -2910,8 +2875,7 @@ static enum drm_connector_status it6505_detect(struct it6505 *it6505)
 	}
 
 	if (it6505->hpd_state) {
-		it6505_drm_dp_link_set_power(&it6505->aux, &it6505->link,
-					     DP_SET_POWER_D0);
+		drm_dp_link_power_up(&it6505->aux, it6505->link.revision);
 		dp_sink_count = it6505_dpcd_read(it6505, DP_SINK_COUNT);
 		it6505->sink_count = DP_GET_SINK_COUNT(dp_sink_count);
 		DRM_DEV_DEBUG_DRIVER(dev, "it6505->sink_count:%d branch:%d",
@@ -3233,8 +3197,7 @@ static void it6505_bridge_atomic_enable(struct drm_bridge *bridge,
 	it6505_int_mask_enable(it6505);
 	it6505_video_reset(it6505);
 
-	it6505_drm_dp_link_set_power(&it6505->aux, &it6505->link,
-				     DP_SET_POWER_D0);
+	drm_dp_link_power_up(&it6505->aux, it6505->link.revision);
 }
 
 static void it6505_bridge_atomic_disable(struct drm_bridge *bridge,
@@ -3246,8 +3209,7 @@ static void it6505_bridge_atomic_disable(struct drm_bridge *bridge,
 	DRM_DEV_DEBUG_DRIVER(dev, "start");
 
 	if (it6505->powered) {
-		it6505_drm_dp_link_set_power(&it6505->aux, &it6505->link,
-					     DP_SET_POWER_D3);
+		drm_dp_link_power_down(&it6505->aux, it6505->link.revision);
 		it6505_video_disable(it6505);
 	}
 }
-- 
2.43.0

