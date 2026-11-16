Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794820358;
	b=sYZ1dzkp6pjiAyuhXPhI1v+AziZOuS0Za6EobrhKBNfREYt5ll32YAg01d545VfiptqB
	 UOTByls9NJ0MTOzYJdR+TtzP+tqdfn7YynAUedbdboxWYqSL8t/2w17PhfSBKaFvP0WOy
	 lwlbEL8DL8YoB+1fw7dTbnyjOH8KUMCzjDaQA+EYcgE61KnsWHj5ZM1pgMHhXxfdB/oO+
	 EuW+9tYMKtTvMwa65mATJee5rpTpdrwIXqzG6Dl4kbwm5I0t3x08ACaopk8YzcGlUxjHV
	 1dPnuQCOVtAZfV3dzaKX9UMYxKTLlq5DY4vL+7eGHu7ZcCqLm/sXgsGyfMNxhk7G2MA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794820358;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Organization:Content-Transfer-Encoding;
	bh=gljLKtd1DY0BbYFXhcXXIEgEeuG4APBeWpQtrZKf0GA=;
	b=QvIAkStf3sUlfXTh6r1LQy+cQO70Us++Nl0IDY80CMvALj2RzPsxEvCZ2Pi8RUu6f6ce
	 tFe4O+BBuN5lEis93FiLUNUsc9qSyHslV/+gricB9uSUAyTrKNEifuluSIr9LerNpWUVA
	 L9Y/0bpqfskJSYLi7wtDw2IR/JAhYeeeZaw/rIbJmyIg81AkRUsfdGXXxmjvcHZ2p0YIa
	 YV6gfzsGhJ5l8ktkp/2/tGU30O87bT0T/IsndY8rb0s65DRw3vR90HIoOdn1LrXcIaB2V
	 US+jMPwzvM5BeXrqfXCTRmegQCYJbz+nSAvegr77+3nbmPcdraDw+bEp7Zyt4PwgpQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fdhj0z7l;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0E5606A337;
	Mon, 16 Nov 2026 09:12:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F0E5606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fdhj0z7l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794820357; x=1826356357;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RkhyzjuNlXgxmJ1hs/ayERDzfWzK8akCYym0w0pTyDc=;
  b=fdhj0z7lzOaYSJIDDXFaGiMa7TMDQ1nN5DLoX/iOl0hUX1zC3dwAApmT
   o1ZXx3EPaf7TEwKJQLSXbmLtbxmD+7gET61aTVu0jN8jXJ4BnGf0FhJPF
   4rrSP6yi1nViA99m8L3UGia6/07JPfH9gnBrBCKwuYcOf7cY3bao7CdEg
   ci85a+eago+d/qU/3rFREHucWyzmMeib+Pz5GQKMdkpx9CxTbPb7JY/Ux
   5F8l+Ca6mvnvfRdBMT6JLZFeZWi0tZpg+/NjmFkx6GJ31ZuB14iq0oCbu
   dboTPJiaoH15A2AS15LAzPf00QRBzIX9meYqW+8dMZ4bXpBZoqN1tEBDW
   A==;
X-CSE-ConnectionGUID: oVvm2OcVSRK/lPksdnDyxg==
X-CSE-MsgGUID: K1LY1Yz3SiyGr9N47VQmLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3441735"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3441735"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 01:12:36 -0800
X-CSE-ConnectionGUID: eSWWbGsqQsClMOtxH9qrUQ==
X-CSE-MsgGUID: ujhghr56Si+fr6fdGRMLpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9636389"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.93])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 01:12:29 -0800
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
Subject: [PATCH 05/12] drm/atomic/uapi: Eliminate the confusing drm_atomic_check_prop_changes()
Date: Mon, 16 Nov 2026 11:11:23 +0200
Message-ID: <20261116091130.13950-6-ville.syrjala@linux.intel.com>
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

drm_atomic_check_prop_changes() is a very confusing for
many reasons:
- the 'ret' propagation through it is completely non-obvious
- for planes it prints the debug message about rejecting the
  update before we actually decide whether the update needs
  to be rejected or not
- the debug message is also printed if the property doesn't
  exist, which is confusing
- the debug message lacks the KMS object type/ID/name,
  which could be helpful during debugging

Just get rid of the whole drm_atomic_check_prop_changes() and
do things by hand.

Also remove the debug message for the case where the property
doesn't exist as drm_atomic_*_get_property() will already print
its own debug message in that situation.

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
 drivers/gpu/drm/drm_atomic_uapi.c | 51 +++++++++++++++++++------------
 1 file changed, 31 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index eb002799497c..2ea03b4b0be9 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -1194,19 +1194,6 @@ int drm_atomic_connector_commit_dpms(struct drm_atomic_commit *state,
 	return ret;
 }
 
-static int drm_atomic_check_prop_changes(int ret, uint64_t old_val, uint64_t prop_value,
-					 struct drm_property *prop)
-{
-	if (ret != 0 || old_val != prop_value) {
-		drm_dbg_atomic(prop->dev,
-			       "[PROP:%d:%s] No prop can be changed during async flip\n",
-			       prop->base.id, prop->name);
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
 int drm_atomic_set_property(struct drm_atomic_commit *state,
 			    struct drm_file *file_priv,
 			    struct drm_mode_object *obj,
@@ -1235,8 +1222,16 @@ int drm_atomic_set_property(struct drm_atomic_commit *state,
 		if (async_flip) {
 			ret = drm_atomic_connector_get_property(connector, connector_state,
 								prop, &old_val);
-			ret = drm_atomic_check_prop_changes(ret, old_val, prop_value, prop);
-			break;
+			if (ret)
+				break;
+
+			if (old_val != prop_value) {
+				drm_dbg_atomic(prop->dev,
+					       "[PROP:%d:%s] No prop can be changed during async flip\n",
+					       prop->base.id, prop->name);
+				ret = -EINVAL;
+				break;
+			}
 		}
 
 		ret = drm_atomic_connector_set_property(connector,
@@ -1257,8 +1252,16 @@ int drm_atomic_set_property(struct drm_atomic_commit *state,
 		if (async_flip) {
 			ret = drm_atomic_crtc_get_property(crtc, crtc_state,
 							   prop, &old_val);
-			ret = drm_atomic_check_prop_changes(ret, old_val, prop_value, prop);
-			break;
+			if (ret)
+				break;
+
+			if (old_val != prop_value) {
+				drm_dbg_atomic(prop->dev,
+					       "[PROP:%d:%s] No prop can be changed during async flip\n",
+					       prop->base.id, prop->name);
+				ret = -EINVAL;
+				break;
+			}
 		}
 
 		ret = drm_atomic_crtc_set_property(crtc,
@@ -1281,12 +1284,18 @@ int drm_atomic_set_property(struct drm_atomic_commit *state,
 			/* no-op changes are always allowed */
 			ret = drm_atomic_plane_get_property(plane, plane_state,
 							    prop, &old_val);
-			ret = drm_atomic_check_prop_changes(ret, old_val, prop_value, prop);
+			if (ret)
+				break;
 
 			/* fail everything that isn't no-op or a pure flip */
-			if (ret && prop != config->prop_fb_id &&
+			if (old_val != prop_value &&
+			    prop != config->prop_fb_id &&
 			    prop != config->prop_in_fence_fd &&
 			    prop != config->prop_fb_damage_clips) {
+				drm_dbg_atomic(prop->dev,
+					       "[PROP:%d:%s] No prop can be changed during async flip\n",
+					       prop->base.id, prop->name);
+				ret = -EINVAL;
 				break;
 			}
 
@@ -1296,10 +1305,12 @@ int drm_atomic_set_property(struct drm_atomic_commit *state,
 			 * decision. Drivers that want this need to just do
 			 * these checks themselves somewhere.
 			 */
-			if (ret && plane->type != DRM_PLANE_TYPE_PRIMARY) {
+			if (old_val != prop_value && plane->type != DRM_PLANE_TYPE_PRIMARY) {
 				/* ask the driver if this non-primary plane is supported */
 				if (plane_funcs && plane_funcs->atomic_bypass_check)
 					ret = plane_funcs->atomic_bypass_check(plane, state, true);
+				else
+					ret = -EINVAL;
 
 				if (ret) {
 					drm_dbg_atomic(prop->dev,
-- 
2.56.0

