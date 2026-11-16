Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794820429;
	b=qGTkzWZW99poiDLizk2WSXbsldFtDfYLtdsmQRDXi0rxR/oi7F6FjPDjHvI5GOu4PTvd
	 7SETqEbdC7dGtFBUWiu4iSyqqvVkyJ2TfokRu4AzBHXjcFH4Ecw2wNs2EgrvBPYdd7kwU
	 9FnEVcMeyOz+axuTwkjZSHYfSDekkuZjl60Cj6CYjnTDt8g2GOzFWw9A+SkMe/D0vQJRv
	 Xwy5jEspC7IlyqLAejHl0PM5T7T9qKe5NS1mNyQDPYkW8QLqunjweR8l3Y/MU1754pIxr
	 9GRsWUN1tff0wREINzbTdJfaTko8EXU6zlmMp8fRdMdp3ZBdOZNJ0Gn7t2Gjvh9Gnug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794820429;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Organization:Content-Transfer-Encoding;
	bh=q+IeP9KxR1ltj3JOOG9VwsrHbqw44F6E5PTklAlXz8o=;
	b=SLLLYfNHayYPMWfxOxUZkfaperpiSJMBSI6yUFUzb+Jvn7tAOLC9bMDvIqOziSEyYnP7
	 NtGbQUd4wLXjSTMsnNzdTsGq9o8cfKXo5HoITnVehbW+G2bLMWqjhdzvshfA5/m42szxc
	 bllQ15Ro1d0z0UdYfXKe2xtHBlLcajBBUPRA5pz3rIfd+MEgf0KTsZdJdbQHNqAhWicGz
	 fDidzZbiyZ/LMkhosNVVbG3XvFJ7mGsEPHdxkF+40yf+2wYUjqCQ6BNuuL3ypCQGxrCq6
	 LfL6br917Su8aEUBo+b8x6ps6OxPEmvKnIqwoSCC0GHFStJ1eSO53EqbJ9riIzsYP6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dbNL2dqZ;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E5C606A329;
	Mon, 16 Nov 2026 09:13:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0E5C606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dbNL2dqZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794820428; x=1826356428;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6RcgTJRMkf6knyitWUlwWvr0eo1SGio0/PgROTWQTvY=;
  b=dbNL2dqZOhPpk77vkRZJVkE4vKJLyWsmP3DLker4eMFSZv5jO1qzmaKK
   fWjlEYrN47n2ST7NpDyxspVyo2jGf9fa3IXHa7lz4kWRL5+5uyTVkqmd3
   uaZDzL1ByPOHD7W3QTDZ01aDTA8cEJQin1peJkXIaL4qj8ww+Sz/3+tC4
   JBbaNtdM78TjgmqNUkJYapd3CLe1Lss6l1uw4qFXoTEow5j4Sdo85DdOQ
   EqBbf07Zx1OhvCnMI3m1hVHwWBn1s+BtzXQc4uaRBIurmzndTWariIoMr
   DRv5023BQfcrMZmsXyssh1hNfxpxt6jD6S440XX3MMwu9CPKzNcWvDaF0
   A==;
X-CSE-ConnectionGUID: UXPvN6JsRAyIHUIDmlzRiQ==
X-CSE-MsgGUID: pIbIlFFqQJS6jQA49+5NQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3458233"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3458233"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 01:13:47 -0800
X-CSE-ConnectionGUID: bvoRwiFQRNi3Az4Cm0njaA==
X-CSE-MsgGUID: pGwRFgaZQoqDY1QJ87JxXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9692160"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.93])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 01:13:40 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	Erwin Springer <aot.lerwin@gmail.com>,
	amd-gfx@lists.freedesktop.org,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Christopher Snowhill <chris@kode54.net>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Dharma Balasubiramani <dharma.b@microchip.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	freedreno@lists.freedesktop.org,
	Gustavo Padovan <gustavo.padovan@collabora.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	Jianmin Lv <lvjianmin@loongson.cn>,
	linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	Liviu Dudau <liviu.dudau@arm.com>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Manikandan Muralidharan <manikandan.m@microchip.com>,
	Maxime Ripard <mripard@kernel.org>,
	Mingcong Bai <jeffbai@aosc.io>,
	nouveau@lists.freedesktop.org,
	Qianhai Wu <wuqianhai@loongson.cn>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Simon Ser <contact@emersion.fr>,
	wayland-devel@lists.freedesktop.org,
	Xaver Hugl <xaver.hugl@kde.org>,
	Xi Ruoyao <xry111@xry111.site>
Subject: [PATCH 12/12] drm/atomic/uapi: Extract {connector,crtc,plane}_async_flip_check()
Date: Mon, 16 Nov 2026 11:11:30 +0200
Message-ID: <20261116091130.13950-13-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261116091130.13950-1-ville.syrjala@linux.intel.com>
References: <20261116091130.13950-1-ville.syrjala@linux.intel.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Transfer-Encoding: 8bit

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Reduce the clutter in drm_atomic_set_property() by
extracting the async flip related checks to
connector,crtc,plane}_async_flip_check().

Cc: amd-gfx@lists.freedesktop.org
Cc: André Almeida <andrealmeid@igalia.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>
Cc: Christopher Snowhill <chris@kode54.net>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Dharma Balasubiramani <dharma.b@microchip.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>
Cc: freedreno@lists.freedesktop.org
Cc: Gustavo Padovan <gustavo.padovan@collabora.com>
Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Cc: Jianmin Lv <lvjianmin@loongson.cn>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
Cc: linux-tegra@vger.kernel.org
Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Maíra Canal <mcanal@igalia.com>
Cc: Manikandan Muralidharan <manikandan.m@microchip.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Mingcong Bai <jeffbai@aosc.io>
Cc: nouveau@lists.freedesktop.org
Cc: Qianhai Wu <wuqianhai@loongson.cn>
Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: Simon Ser <contact@emersion.fr>
Cc: wayland-devel@lists.freedesktop.org
Cc: Xaver Hugl <xaver.hugl@kde.org>
Cc: Xi Ruoyao <xry111@xry111.site>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c | 215 +++++++++++++++++-------------
 1 file changed, 124 insertions(+), 91 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 87181aba1451..65e1be6c4ad5 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -1194,6 +1194,124 @@ int drm_atomic_connector_commit_dpms(struct drm_atomic_commit *state,
 	return ret;
 }
 
+static int connector_async_flip_check(struct drm_atomic_commit *state,
+				      struct drm_connector *connector,
+				      struct drm_property *prop,
+				      u64 prop_value, bool *is_noop)
+{
+	const struct drm_connector_state *current_connector_state;
+	u64 old_val = 0;
+	int ret;
+
+	current_connector_state =
+		__drm_atomic_get_current_connector_state(state, connector);
+	if (IS_ERR(current_connector_state))
+		return PTR_ERR(current_connector_state);
+
+	ret = drm_atomic_connector_get_property(connector, current_connector_state,
+						prop, &old_val);
+	if (ret)
+		return ret;
+
+	/*
+	 * Note that for WRITEBACK_FB_ID and WRITEBACK_OUT_FENCE_PTR
+	 * the old value will always be 0. So any commit that sets either
+	 * property to any other value will not be considered a no-op.
+	 */
+	if (old_val != prop_value) {
+		drm_dbg_atomic(prop->dev,
+			       "[CONNECTOR:%d:%s][PROP:%d:%s] Unsupported property change during async flip\n",
+			       connector->base.id, connector->name,
+			       prop->base.id, prop->name);
+		return -EINVAL;
+	}
+
+	*is_noop = old_val == prop_value;
+
+	return 0;
+}
+
+static int crtc_async_flip_check(struct drm_atomic_commit *state,
+				 struct drm_crtc *crtc,
+				 struct drm_property *prop,
+				 u64 prop_value, bool *is_noop)
+{
+	const struct drm_crtc_state *current_crtc_state;
+	u64 old_val = 0;
+	int ret;
+
+	current_crtc_state =
+		__drm_atomic_get_current_crtc_state(state, crtc);
+	if (IS_ERR(current_crtc_state))
+		return PTR_ERR(current_crtc_state);
+
+	ret = drm_atomic_crtc_get_property(crtc, current_crtc_state,
+					   prop, &old_val);
+	if (ret)
+		return ret;
+
+	/*
+	 * Note that for OUT_FENCE_PTR the old value will always be 0.
+	 * So any commit that sets the property to any other value
+	 * will not be considered a no-op.
+	 */
+	if (old_val != prop_value) {
+		drm_dbg_atomic(prop->dev,
+			       "[CRTC:%d:%s][PROP:%d:%s] Unsupported property change during async flip\n",
+			       crtc->base.id, crtc->name,
+			       prop->base.id, prop->name);
+		return -EINVAL;
+	}
+
+	*is_noop = old_val == prop_value;
+
+	return 0;
+}
+
+static int plane_async_flip_check(struct drm_atomic_commit *state,
+				  struct drm_plane *plane,
+				  struct drm_property *prop,
+				  u64 prop_value, bool *is_noop)
+{
+	struct drm_device *dev = plane->dev;
+	struct drm_mode_config *config = &dev->mode_config;
+	const struct drm_plane_state *current_plane_state;
+	u64 old_val = 0;
+	int ret;
+
+	current_plane_state =
+		__drm_atomic_get_current_plane_state(state, plane);
+	if (IS_ERR(current_plane_state))
+		return PTR_ERR(current_plane_state);
+
+	ret = drm_atomic_plane_get_property(plane, current_plane_state,
+					    prop, &old_val);
+	if (ret)
+		return ret;
+
+	/*
+	 * Fail everything that isn't no-op or a pure flip.
+	 *
+	 * Note that for IN_FENCE_FD the old value will always be -1.
+	 * So any commit that sets the property to any other value
+	 * will not be considered a no-op.
+	 */
+	if (old_val != prop_value &&
+	    prop != config->prop_fb_id &&
+	    prop != config->prop_in_fence_fd &&
+	    prop != config->prop_fb_damage_clips) {
+		drm_dbg_atomic(prop->dev,
+			       "[PLANE:%d:%s][PROP:%d:%s] Unsupported property change during async flip\n",
+			       plane->base.id, plane->name,
+			       prop->base.id, prop->name);
+		return -EINVAL;
+	}
+
+	*is_noop = old_val == prop_value;
+
+	return 0;
+}
+
 int drm_atomic_set_property(struct drm_atomic_commit *state,
 			    struct drm_file *file_priv,
 			    struct drm_mode_object *obj,
@@ -1202,7 +1320,6 @@ int drm_atomic_set_property(struct drm_atomic_commit *state,
 			    bool async_flip)
 {
 	struct drm_mode_object *ref;
-	u64 old_val;
 	int ret;
 
 	if (!drm_property_change_valid_get(prop, prop_value, &ref))
@@ -1215,36 +1332,10 @@ int drm_atomic_set_property(struct drm_atomic_commit *state,
 		bool is_noop = false;
 
 		if (async_flip) {
-			const struct drm_connector_state *current_connector_state;
-
-			current_connector_state =
-				__drm_atomic_get_current_connector_state(state, connector);
-			if (IS_ERR(current_connector_state)) {
-				ret = PTR_ERR(current_connector_state);
-				break;
-			}
-
-			ret = drm_atomic_connector_get_property(connector, current_connector_state,
-								prop, &old_val);
+			ret = connector_async_flip_check(state, connector,
+							 prop, prop_value, &is_noop);
 			if (ret)
 				break;
-
-			/*
-			 * Note that for WRITEBACK_FB_ID and WRITEBACK_OUT_FENCE_PTR
-			 * the old value will always be 0. So any commit that sets either
-			 * property to any other value will not be considered a no-op.
-			 */
-			if (old_val != prop_value) {
-				drm_dbg_atomic(prop->dev,
-					       "[CONNECTOR:%d:%s][PROP:%d:%s] Unsupported property change during async flip\n",
-					       connector->base.id, connector->name,
-					       prop->base.id, prop->name);
-				ret = -EINVAL;
-				break;
-			}
-
-			if (old_val == prop_value)
-				is_noop = true;
 		}
 
 		/* No-op connector property changes can be completely skipped */
@@ -1270,36 +1361,10 @@ int drm_atomic_set_property(struct drm_atomic_commit *state,
 		bool is_noop = false;
 
 		if (async_flip) {
-			const struct drm_crtc_state *current_crtc_state;
-
-			current_crtc_state =
-				__drm_atomic_get_current_crtc_state(state, crtc);
-			if (IS_ERR(current_crtc_state)) {
-				ret = PTR_ERR(current_crtc_state);
-				break;
-			}
-
-			ret = drm_atomic_crtc_get_property(crtc, current_crtc_state,
-							   prop, &old_val);
+			ret = crtc_async_flip_check(state, crtc,
+						    prop, prop_value, &is_noop);
 			if (ret)
 				break;
-
-			/*
-			 * Note that for OUT_FENCE_PTR the old value will always be 0.
-			 * So any commit that sets the property to any other value
-			 * will not be considered a no-op.
-			 */
-			if (old_val != prop_value) {
-				drm_dbg_atomic(prop->dev,
-					       "[CRTC:%d:%s][PROP:%d:%s] Unsupported property change during async flip\n",
-					       crtc->base.id, crtc->name,
-					       prop->base.id, prop->name);
-				ret = -EINVAL;
-				break;
-			}
-
-			if (old_val == prop_value)
-				is_noop = true;
 		}
 
 		/*
@@ -1324,46 +1389,14 @@ int drm_atomic_set_property(struct drm_atomic_commit *state,
 	case DRM_MODE_OBJECT_PLANE: {
 		struct drm_plane *plane = obj_to_plane(obj);
 		struct drm_plane_state *plane_state;
-		struct drm_mode_config *config = &plane->dev->mode_config;
 		const struct drm_plane_helper_funcs *plane_funcs = plane->helper_private;
 		bool is_noop = false;
 
 		if (async_flip) {
-			const struct drm_plane_state *current_plane_state;
-
-			current_plane_state =
-				__drm_atomic_get_current_plane_state(state, plane);
-			if (IS_ERR(current_plane_state)) {
-				ret = PTR_ERR(current_plane_state);
-				break;
-			}
-
-			ret = drm_atomic_plane_get_property(plane, current_plane_state,
-							    prop, &old_val);
+			ret = plane_async_flip_check(state, plane,
+						     prop, prop_value, &is_noop);
 			if (ret)
 				break;
-
-			/*
-			 * Fail everything that isn't no-op or a pure flip.
-			 *
-			 * Note that for IN_FENCE_FD the old value will always be -1.
-			 * So any commit that sets the property to any other value
-			 * will not be considered a no-op.
-			 */
-			if (old_val != prop_value &&
-			    prop != config->prop_fb_id &&
-			    prop != config->prop_in_fence_fd &&
-			    prop != config->prop_fb_damage_clips) {
-				drm_dbg_atomic(prop->dev,
-					       "[PLANE:%d:%s][PROP:%d:%s] Unsupported property change during async flip\n",
-					       plane->base.id, plane->name,
-					       prop->base.id, prop->name);
-				ret = -EINVAL;
-				break;
-			}
-
-			if (old_val == prop_value)
-				is_noop = true;
 		}
 
 		/* No-op plane property changes can be fully skipped */
-- 
2.56.0

