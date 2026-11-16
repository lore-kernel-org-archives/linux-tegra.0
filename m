Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794820347;
	b=I/6S3xpHX5VpKyqyvJzzv66gTebAOyADcJKj6oKIvGvjKQjIEQu+b2e4R12mqQRmLmSD
	 Lz1jpSBoU8/zSX0FS63k15ZlaFYm5cj0w3pJsukpRfmynrlKMr1afHNekidZF1Cn6cSjV
	 bHyKcVyJhWU15xh6zVGAeWm/H0srcDSdHtE1XIxRfo4QH1rQpGmn3msDS/CHRIizq0bIL
	 7IIXat7jcKCfZmnaT2YH+hV0sxIO9XlkDZfLNBEMnHwE7R66RExMZo0XR+yIIWwmStIw+
	 mTzNLy9n5mylOnRzr7zuhWnATKc61xoEWtaXQVtbKsRIHUj3LTL/NZPq/yQXB5qECrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794820347;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Organization:Content-Transfer-Encoding;
	bh=TFvQP8aoubAPDYf0wglCKRKdVUTp2ONcSkD8GwBBfng=;
	b=fIXap5Uw9z5zG/IxcdNV5YOd2D+INDbT8WRsglRV0BhOtZFO2Ewr0IfVCWgJgyXhBCkI
	 f7rE6jE990R16PBoI+igtZFVU1kZz+bB1KZvhCSs2gbps03cvzJZda7tmKmOQpH80P3CZ
	 uV8/IJRkJGfbSCbr1J0s+JJxnwocHe4dPr9aWi2ZCOnwUkzTP7ZyKsyxajpbYqFR+U9Yw
	 E/8g0jNTE3z6Zgv5/mHmMKpvEDN3OTKhfCxJ3BFsf5eOjkMuiJEFULK9/d0NeKv/ccrXk
	 LUYPgfAqFCyvYGmzKjcqZHrwkmmVMNezlXEn4RhojZO7PISrQ6pNOdVYLNoVit+xmOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZP+lvUSg;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E1C606A31C;
	Mon, 16 Nov 2026 09:12:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0E1C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZP+lvUSg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794820346; x=1826356346;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JGdJovIRxiswmzQ/OVHyoYBXcmjw0GscVzdw8XDjrRY=;
  b=ZP+lvUSg8DTJpnoYD5wKOwizyoQL7wrVXj617KU2jJW+TZmdLCYFfN93
   mlx7UtjmQRXkOys6ZGj5ipQBgG911kR5oukjUSmfKEcOMknNrVd7nczkG
   vAqGF8nvjJxyAgZeTXLFQEGCWHvJjQ3meQtTloyjSRvAnUf82jXp8oJLb
   N0bR+QZ0rn9lR95G/vvK3FIvFUHEX/wXftQJxPTJtu4rguMqJYqyXCQ7O
   lgvH13BuWUjlJu/1kDsSCgJ4w0dr6ufaHYq8wgYUcmFEMgfjCeF3wWTNY
   9m/VjI2DIMJwqV19yLHsMWlr9DJ3cCyeTbD870aTuV3vQThDOOt9XYRpa
   w==;
X-CSE-ConnectionGUID: PvM+gBdUQ0aFA5DqlLggXg==
X-CSE-MsgGUID: i1iNe94pRSe9CfQZDtGFhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3590916"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3590916"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 01:12:26 -0800
X-CSE-ConnectionGUID: J66DpBJ2RRW4yBSWi6jh6g==
X-CSE-MsgGUID: 0uoTtDp2RV+r35svTUE34g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9826077"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.93])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 01:12:19 -0800
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
Subject: [PATCH 04/12] drm/atomic: Highlight that bypass commits need care
Date: Mon, 16 Nov 2026 11:11:22 +0200
Message-ID: <20261116091130.13950-5-ville.syrjala@linux.intel.com>
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

Document the fact that implementing bypass commits
need actual care and attention to make sure the
effective commit reordering is actually safe.

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
 include/drm/drm_modeset_helper_vtables.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
index d28d8ffc66b4..1036744b9922 100644
--- a/include/drm/drm_modeset_helper_vtables.h
+++ b/include/drm/drm_modeset_helper_vtables.h
@@ -1430,6 +1430,12 @@ struct drm_plane_helper_funcs {
 	 * given update can be committed bypassing the atomic commit machinery.
 	 * That is, if it can jump ahead of the state currently queued for update.
 	 *
+	 * Extreme care is needed to make this safe as the already queued commits
+	 * will not be aware of the bypass commit that overtook them. And the
+	 * state that the bypass commit will observe is the final already queued
+	 * state, not the current state at the point when the bypass commit
+	 * will actually execute.
+	 *
 	 * This function is also abused by drm_atomic_set_property() to determine
 	 * if the plane can be flipped in async. The flip flag is used to
 	 * distinguish if the function is used for just the plane state or for a
-- 
2.56.0

