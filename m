Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794820385;
	b=4jrs7HDmYCgDebJLSsXChFn1+iSeU4HpASD0Kzh6YrWKKKCiBscH3uhHXnOw5Lc9e+3b
	 tESnvfKNuKbE9elegCkqujbSszvphGyZ8YtIlz2GGwC6noALoPVDY4viyMprFKtSCtSM3
	 O/sSHMdwWDmE/u8MRmWkovOJwFip/3u0Mg0ckEsSYFj6GP8IPTiCeFC0gE3vFAkJ/18oT
	 nWSqlaxWTlpRD105hekzLbT2jJgQB+rqmFlvdj6upcxjBvS5bCh0QQY+RWO7h+Gq03nHr
	 CkaHmALAPY/ZgHPdtqp+6RIjtlIw0h8XPt6J4ncgB+demOXSmoxTa3bnLOQW4tEfkNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794820385;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Organization:Content-Transfer-Encoding;
	bh=wfQFJgN09n6YBy/Daf3IIALw6X6KhFq9Ni70FfSI+3Y=;
	b=E7gLcuamwf8tewIJqZDNAMFOaavAdnx1RLlf/zaY/7x26GZgzZvkumhA9uHneb7CZBhR
	 4btX7cMxmZLgd0zqScgTjWtO4VBglbD1Sjy6b11VXyW27M2VUtCcl4ujyhhKp17wLykOT
	 ZkMSIfladDDeczOx8KrYC7FAiU65DagAr0HhbbIzZPTVEwBuAsufWcJlbSYQV40Lp9vWP
	 WXhpd5sHbdNLmEwbAf0zse+lnGeE/jYkGtGIhuoS5Y2arMv2fpgs94cgkFZWY1uYPP9sY
	 2I74EBFQIIre0qJTt/Kbwh4aXb6LyUpXecRu34aP8+zy0T0jVIhtmzFKg9U5KTm7b/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="K7KYmL/+";
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5F4606A329;
	Mon, 16 Nov 2026 09:13:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C5F4606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=K7KYmL/+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794820384; x=1826356384;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=S5+QBdtzFuG1IgfXisOS9Q/+F8LHAa5I2PukkMFG620=;
  b=K7KYmL/+xjJjIzCLOby2YMx8cFhOVAohgbjok0dxd56pyLzYrL+p9tWV
   h3EmuYfLd6rj6MQf4T0GF59olz7x17YAZU2eOB1fqIZtfM4IzvNYMLQUP
   p6EfGhbfjduH1Jc3I13MdKk3S5vOdL6OAqh5q+qIhlU1/sEd9qFmdZYC/
   bBR4YguXYIcP1BEyL/L65ffHuyWun5wmZJ5NeiUrf2ObJyLXGg1bdTMxU
   IzOIeRuURYHfNtkuQJeFumyMx0ucyh43CMv/C8f2Av4Nblz87lVcnaLgE
   F18Hn6gt/xCsmUKA5SUUijKGjZpsKu9LpeJ07gC6uTabYKSIoK/xy73tI
   A==;
X-CSE-ConnectionGUID: hEEoSd9rSpOp+tAGUTTfHQ==
X-CSE-MsgGUID: aWb+PZkYTN6RTKsDTI4Qrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3443475"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3443475"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 01:13:03 -0800
X-CSE-ConnectionGUID: c7lMIM38S3al4Q++ns5YpQ==
X-CSE-MsgGUID: TXHuWpbRTv+ZkikzxiX0lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9909191"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.93])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 01:12:56 -0800
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
Subject: [PATCH 08/12] drm/atomic/uapi: Add a FIXME about colorop vs. async flips
Date: Mon, 16 Nov 2026 11:11:26 +0200
Message-ID: <20261116091130.13950-9-ville.syrjala@linux.intel.com>
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

The colorop stuff in the atomic ioctl handler is completely
missing any async flip handling. Add a FIXME in the hopes
that someone will fix it.

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
 drivers/gpu/drm/drm_atomic_uapi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index cf1edcb242cc..7517950d2e51 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -1352,6 +1352,8 @@ int drm_atomic_set_property(struct drm_atomic_commit *state,
 		struct drm_colorop_state *colorop_state;
 		bool replaced = false;
 
+		/* FIXME async flip checks completely missing here */
+
 		colorop_state = drm_atomic_get_colorop_state(state, colorop);
 		if (IS_ERR(colorop_state)) {
 			ret = PTR_ERR(colorop_state);
-- 
2.56.0

