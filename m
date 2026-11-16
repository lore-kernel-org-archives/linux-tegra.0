Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794820407;
	b=Tm2T+lChTfISKSjoJKah/zXECiW7oryX4XYhclDnP3LWvfLyk9nAolmJWWqkxlethgu8
	 CuBwj9IDm6HevQCi2g2Drr0Wt/tnDnb7Mp8smdvRrHiotcIUId6uNmx3SGPtbOLaM25Aa
	 kPcEsoFxWi6vwIQbw3xBuG9J02HOK6Co7pUCPE/iz7qlFpd8l1MIvQKOh4QZfzagygsFV
	 KBmBd5Rp9M4uhvZU2xKj2jh+KjDrpUkQtNCij8oS4+zY0LG38SDeHtET1hZvENpmbCQlK
	 XGlaX01Zw7XpoRtmQD3IrTetIj90pwzJWx3LwHId2AaQIfkYfJjdzQT3xfRrloCG57Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794820407;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Organization:Content-Transfer-Encoding;
	bh=nU0PWIqePItnPimCcZezWnij/eUXfn1ZWJakZQzqRVw=;
	b=eGEuV3XVhfcWTn/1DEQdxyLjm6vcOrU30yL9vkXrDELOic7XW4VbgdIQ31WCE1aZTN3c
	 oy1M4jIuya85y/Px557lrwjxfUUy4HyekTYypv0eALlLAW2F6k8gtuy2Cx0eyzfsTtKIF
	 AdHNlahbuf5FDo5YQqzN11u3KY5ib4hEtXIAjCeQ8bdb2PfIDTXNoC1W7OQP3Z7lu8i7Z
	 34vOhBmGyt6vduRFppeU8814qR+38QeXIJDphULGn818ZUS99Km8xdlU+zXLoDvvOvHZh
	 oHY5H7iEQs/54rdUCeEewHmsqLolUzgEmFpPJyuxlQRXvTYjldu9W/UF6PBDePedohg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=edbaIGVe;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777C5606A883;
	Mon, 16 Nov 2026 09:13:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 777C5606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=edbaIGVe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794820406; x=1826356406;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=edhm/RUm1gwG1ns28z24sx9rwV2Bz4AIJAEgDfivZos=;
  b=edbaIGVeeLAMucWtoJVU/2RGATgkPjAJEeyv3k+0E3O93Kr4Cdk71War
   Ga6U2lukBVpyEhGqTVo9JFPBPyvjG/r/05W/cw7+aWtOmpp30uZjI63Hf
   3FaDv3KUdOHq4h08hKRgWLfb7Q74UNyXhxK+QzchOPG/xW0YTBdnwJHuN
   WPjnCCL5Kw/Yykx5CuSK4wA5VZwkf0PELmXCVRDG5ysN2siiLeLnbHwbY
   tCUxsJJExXLuRwTrEzwJ+qa4KZ740eoMpOXuQfWHTcBTyeOJ5ki9sp73t
   NhjlO0RADQk61P9qmSVG/bty/MHfun1is9YwNrwWq5w0BFKCWd4oc4RNg
   Q==;
X-CSE-ConnectionGUID: CduKAA8eSWaMPnwmddVJyA==
X-CSE-MsgGUID: WIDV2219RIKOyhnzFDaaEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3579207"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3579207"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 01:13:26 -0800
X-CSE-ConnectionGUID: 9stVJmFCQHClbVwAwSIULg==
X-CSE-MsgGUID: QPpDDzNuR/+FFLzWW1UqMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="10032390"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.93])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 01:13:19 -0800
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
Subject: [PATCH 10/12] drm/i915: Complete no-op "async flips" by hand
Date: Mon, 16 Nov 2026 11:11:28 +0200
Message-ID: <20261116091130.13950-11-ville.syrjala@linux.intel.com>
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

If no planes appear in an async flip commit there will be
no flip done interrupt. Complete the commit by hand in
that case. Shouldn't really matter where we do this exactly,
but just before the wait stuff near the end of the commit
seems reasonable.

This can't happen via the legacy page flip ioctl path,
but nothing prevents fully no-op (as far as planes are
concerned) "async flips" via the atomic ioctl.

TODO: igt tests for atomic+async uapi don't really exist :(

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
 drivers/gpu/drm/i915/display/intel_display.c | 38 ++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index f4d9148efde3..afaaf3fc4646 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -1190,6 +1190,42 @@ static void intel_crtc_disable_flip_done(struct intel_atomic_state *state,
 	}
 }
 
+static void intel_crtc_complete_noop_async_flip(struct intel_crtc_state *crtc_state)
+{
+	struct intel_display *display = to_intel_display(crtc_state);
+	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
+
+	if (!crtc_state->do_async_flip)
+		return;
+
+	/*
+	 * If there are planes actually performing the async flip then
+	 * the commit will be completed via the flip done interrupt
+	 * handler. For a fully no-op "async flip" the commit must
+	 * be completed by hand as no interrupt will be raised.
+	 */
+	if (crtc_state->update_planes)
+		return;
+
+	if (crtc_state->uapi.event) {
+		spin_lock_irq(&display->drm->event_lock);
+		drm_crtc_send_vblank_event(&crtc->base,
+					   crtc_state->uapi.event);
+		spin_unlock_irq(&display->drm->event_lock);
+
+		crtc_state->uapi.event = NULL;
+	}
+}
+
+static void intel_atomic_complete_noop_async_flips(struct intel_atomic_state *state)
+{
+	struct intel_crtc_state *new_crtc_state;
+	struct intel_crtc *crtc;
+
+	for_each_new_intel_crtc_in_state(state, crtc, new_crtc_state)
+		intel_crtc_complete_noop_async_flip(new_crtc_state);
+}
+
 static void intel_crtc_async_flip_disable_wa(struct intel_atomic_state *state,
 					     struct intel_crtc *crtc)
 {
@@ -7852,6 +7888,8 @@ static void intel_atomic_commit_tail(struct intel_atomic_state *state)
 	if (intel_display_power_dc3co_allowed(display))
 		intel_cmtg_program(state);
 
+	intel_atomic_complete_noop_async_flips(state);
+
 	intel_wait_for_vblank_workers(state);
 
 	/* FIXME: We should call drm_atomic_helper_commit_hw_done() here
-- 
2.56.0

