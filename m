Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794820314;
	b=FizZugKoPrzNLw2r5ICTSLuf67JGWlOdHFe/9S+8Pe5UGpi0E52iBFwmUbcysHNA37CZ
	 Z8dEq+h2m1B9rdxQL3qcqNdkjeDmcGgYlhkkDAlwAL03pYYlS/FXzBtV4/61Xea3N5wjW
	 +BMOLhOc+2+Tm4bp6EbYBJXUFbnqPHYogMnyhs+OY3DSpB7QGnWrhtZcFBKTpAWilbaaP
	 ih8TryTZ9yfcAUl9by5i3P4s1sjE/zFJP33oiNA0BYZii0vA9fBo08KlJ1PYCk+ODz4UL
	 SUqooQS5e/GBfgbIT9mjNJ2K37whu88ToVtqT9VLH7+8dWPAkp4FLuXqLG0Yl9IWtqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794820314;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Organization:Content-Transfer-Encoding;
	bh=NrDYEklcNqtXALhiWj2mxwxsxekgaDasLuoDRGoiOmU=;
	b=R5Rb1k8TLel2cD63l5D6JS1PoN/qeBMPUU6ivfKvURmdobdflElZhxkKWyYTVdQN05p2
	 ughLa+GsRsiC5Lh07R4gZAq00mX5YuAOd0PlrtReXhgRsd5Z9Kvssk1lr4U+tmXKLCEXS
	 88e1wnko+pWT3MVkgklVt1kzqrf+09fhiMcP6efB2Ajlh7IW4Kz73VwITIshL6sHp+Aaw
	 NJF8X6/F5mTXWoMyFxw6n6Zzv4hYpjiF91nOWEPIZoze9PZNxUTmNtlMCj0U0bKkbKh+w
	 RUUCCPM7efUs9wKRfsj1h5qN+DBJDbthV3YTHZtJtzrgF7DSnwFNe/rqUTTKt8L+bHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iv8EwE0H;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87572606A323;
	Mon, 16 Nov 2026 09:11:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87572606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iv8EwE0H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794820313; x=1826356313;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=V0qINld4Q/jbv63AGGXVfg5Qb1nzcot1g6RG8D+B2bI=;
  b=iv8EwE0HF+6jfItKuPElj3jsi1Jx7SAyXiq81Y9qhu8lQARuR751YmCE
   PuLuPXliTIRjvnT+z93uTvE2p2xJQTJIs7kwbogAJq7I0q6z+uR3ZL3X9
   Y/td0nDsNUOgunBlSCJmYb2FaqaxtdASZo6xC78B4/WVulux4RvQHsQrv
   yIG9Ur6kplrgXDEKlvF324chQloe6+l8jF0cETYmgfz7Rg8L8QFyj1YKS
   v+XEvYboZqACmONqo4cBogeYKEtjx8E/Cp5lRrxq/P+euvatRLsNXDyIn
   J9gk1IAHRMfSmV6JjaXTguwCqRGde3bpZsnsoaXuhBacu6iazYuLq7vw2
   w==;
X-CSE-ConnectionGUID: uqMAAnA0TjuoU7VQ42k1FQ==
X-CSE-MsgGUID: CQUgHmf5SwC2P0a1p3WoGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3441661"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3441661"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 01:11:52 -0800
X-CSE-ConnectionGUID: UWh9ypXlQsaOXMJK/Z1GcQ==
X-CSE-MsgGUID: jIMoPLvWRfiBfA74S7kVag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9636263"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.93])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 01:11:45 -0800
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
Subject: [PATCH 01/12] drm/atomic: Remove tall tales about tearing vs. "async updates"
Date: Mon, 16 Nov 2026 11:11:19 +0200
Message-ID: <20261116091130.13950-2-ville.syrjala@linux.intel.com>
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

The "async update" stuff has nothing to do with async vs.
sync updates as far as the hardware is concerned (as in
tearing vs. not). What it does is bypass the normal commit
machinery and just let the driver directly perform the
update (as it sees fit) and swap the plane state without
involving the whole crtc commit machinery.

The actual hardware update it does could be an async flip
(as in tearing) or a mailbox flip, depending on how the
driver decides to do it.

I also suspect some drivers abusing this for async flips might
be performing mailbox updates under the hood, which is
very broken because the commits complete in completely random
order and userspace has no idea when the hardware has stopped
scanning out from the old framebuffer. That means userspace
thinks it can start rendering new stuff to what is still the
current hardware scanout buffer. That will lead to incomplete
live rendering appearing on the screen, which is never OK.
Effectively one is performing front buffer rendering at that
point. This kind of fake async flip implementation would
immediately fail igt/kms_async_flips/crc, but that test
requires the driver/hardware to have working CRC support.
To make mailbox updates actually correct we would need
out fences, and a mechanism to signal them in the correct
order.

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
 drivers/gpu/drm/drm_atomic_helper.c      | 9 ++++-----
 include/drm/drm_modeset_helper_vtables.h | 6 ++----
 2 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index ccfe3840d505..f81eb29d9ac8 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -2187,11 +2187,10 @@ EXPORT_SYMBOL(drm_atomic_helper_async_check);
  * @dev: DRM device
  * @state: the driver state object
  *
- * This function commits a state asynchronously, i.e., not vblank
- * synchronized. It should be used on a state only when
- * drm_atomic_async_check() succeeds. Async commits are not supposed to swap
- * the states like normal sync commits, but just do in-place changes on the
- * current state.
+ * This function commits a state asynchronously. It should be used on a state
+ * only when drm_atomic_async_check() succeeds. Async commits are not supposed
+ * to swap the states like normal sync commits, but just do in-place changes
+ * on the current state.
  *
  * TODO: Implement full swap instead of doing in-place changes.
  */
diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
index 60b30cc26940..c2431c08a60a 100644
--- a/include/drm/drm_modeset_helper_vtables.h
+++ b/include/drm/drm_modeset_helper_vtables.h
@@ -1424,8 +1424,7 @@ struct drm_plane_helper_funcs {
 	 * @atomic_async_check:
 	 *
 	 * Drivers should set this function pointer to check if the plane's
-	 * atomic state can be updated in a async fashion. Here async means
-	 * "not vblank synchronized".
+	 * atomic state can be updated in a async fashion.
 	 *
 	 * This hook is called by drm_atomic_async_check() to establish if a
 	 * given update can be committed asynchronously, that is, if it can
@@ -1449,8 +1448,7 @@ struct drm_plane_helper_funcs {
 	 *
 	 * Drivers should set this function pointer to perform asynchronous
 	 * updates of planes, that is, jump ahead of the currently queued
-	 * state and update the plane. Here async means "not vblank
-	 * synchronized".
+	 * state and update the plane.
 	 *
 	 * This hook is called by drm_atomic_helper_async_commit().
 	 *
-- 
2.56.0

