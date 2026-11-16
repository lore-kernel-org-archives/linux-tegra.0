Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794820373;
	b=DF1Vx15pL5QZMb9ArkYMoUZAUZtckXvQly5YpZwnZbIJFE2yIoFVgxJV5Wwp++biCw0A
	 Q3aZNKIYvLpOb6CqA5P9alifSXEoEG7V5c59wKQumZ0O7EAC9pQR3mNOx4IfIKzkhPHbo
	 h3YebyN6zHn+1kMajNXDsApkRuGBg1i7mhiFRnyM6jYd9cJRsA69VNj+YneTvXIHoWs5i
	 Gmtcakf6cvJBZ0gmTQ+Uf/Bvz7QnpHZ8NgWWJ1XiEtUuAA2ICD1SWp1Z15x4JBYSNQIrG
	 CoqWScBao6vZQWuO+5IEno9XgGsElJocYM7utbYcQxTVAfaCOHeCWTEEXWmGwBfa5VA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794820373;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Organization:Content-Transfer-Encoding;
	bh=LaPawNG6lVfcrIoq+MIVkHWBmNB3i0kILRqRDxDrrDQ=;
	b=shj+dIzZl39MqUp/oPmsav1m+fNOhvglCoCE3l7x9LJCySpfFYpdkfmdOdd3ydAr9d5Q
	 rKhibKaI2OaFFQB4crBI/UlSw5Nj8euO1ldteGt/vTJbcDPrmGzZKTya4v1XPyN2+g5ag
	 vjRH67RxOFwvbV1R0jOYW8HrKLN7g9l+Jw6PauQOnOfJKhtCRA6IxiexiskAtVAkyWfdh
	 zs0xNGlMn2HJYxjzQz/1DO7BV4bcbrt2TM4RiV1SWZCsEcpbwFLJw/K2lR9B2AZooWCFX
	 +gsxnoct3xePK2H27/lD4T99wo4wFect548qJFnW1RhlTpEpVv0NKmWqC8sWdBTtVgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RPj3y5Vs;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E1B606A31C;
	Mon, 16 Nov 2026 09:12:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51E1B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RPj3y5Vs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794820373; x=1826356373;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lgXiNcTty7xTAzrRCls8eXQdKOJV57lUY6JX7ooMS6s=;
  b=RPj3y5VshtFG5SgaEJ+cweHMvY6kWspgC/uGE9a61Ty6Q7xW87sLnQ5t
   4ivOj0hadsymn+1JOsoH3GtLtYmdMDuLZk6thTTtz0GVHHXcN+kGVrA1m
   q28Aj2ZaUGV5asGQd3YH9v66j4npmd04aJ09/ZPTdDqyAeD4aiL/dMpEy
   f2gm7Ndv3FudA46tsVvMVLbJJAshBfZMG6GS7lEr/rsDZaQnG7dIAypJt
   T4RtqOjd6B+BN5qJxsecxXuGZgbZ5g8RR2kSw1VCmFHfuY0/YZPpffkFW
   bL6Dw7V0QFfIcc7AMyoGhKwj4xQ0GT63zOl12O2eZrO0MezlakjpG09+e
   Q==;
X-CSE-ConnectionGUID: JppDzULDQt+xk5p0Nhrfng==
X-CSE-MsgGUID: JdrZHNtGR1aPwkwdEbGy/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3443432"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3443432"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 01:12:52 -0800
X-CSE-ConnectionGUID: MbF+WPQPQreUpryutwuyyw==
X-CSE-MsgGUID: Mfg8cZhcS0ynPIvV9t4bKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9909164"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.93])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 01:12:45 -0800
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
Subject: [PATCH 07/12] drm/atomic/uapi: Document the non-obvious fence/fb_id prop behaviour
Date: Mon, 16 Nov 2026 11:11:25 +0200
Message-ID: <20261116091130.13950-8-ville.syrjala@linux.intel.com>
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

The atomic async flip checks want to compare the old vs. new
property values. For normal properties that is all perfectly
clear, but for the fence/fb_id properties the old value is
not what one might expect. Add some notes to remind the reader
what is happening.

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
 drivers/gpu/drm/drm_atomic_uapi.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index aad71d3e2105..cf1edcb242cc 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -1225,6 +1225,11 @@ int drm_atomic_set_property(struct drm_atomic_commit *state,
 			if (ret)
 				break;
 
+			/*
+			 * Note that for WRITEBACK_FB_ID and WRITEBACK_OUT_FENCE_PTR
+			 * the old value will always be 0. So any commit that sets either
+			 * property to any other value will not be considered a no-op.
+			 */
 			if (old_val != prop_value) {
 				drm_dbg_atomic(prop->dev,
 					       "[CONNECTOR:%d:%s][PROP:%d:%s] Unsupported property change during async flip\n",
@@ -1256,6 +1261,11 @@ int drm_atomic_set_property(struct drm_atomic_commit *state,
 			if (ret)
 				break;
 
+			/*
+			 * Note that for OUT_FENCE_PTR the old value will always be 0.
+			 * So any commit that sets the property to any other value
+			 * will not be considered a no-op.
+			 */
 			if (old_val != prop_value) {
 				drm_dbg_atomic(prop->dev,
 					       "[CRTC:%d:%s][PROP:%d:%s] Unsupported property change during async flip\n",
@@ -1289,7 +1299,13 @@ int drm_atomic_set_property(struct drm_atomic_commit *state,
 			if (ret)
 				break;
 
-			/* fail everything that isn't no-op or a pure flip */
+			/*
+			 * Fail everything that isn't no-op or a pure flip.
+			 *
+			 * Note that for IN_FENCE_FD the old value will always be -1.
+			 * So any commit that sets the property to any other value
+			 * will not be considered a no-op.
+			 */
 			if (old_val != prop_value &&
 			    prop != config->prop_fb_id &&
 			    prop != config->prop_in_fence_fd &&
-- 
2.56.0

