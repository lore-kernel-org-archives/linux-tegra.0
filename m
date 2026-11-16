Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794820396;
	b=dh2D/H+goCcZ2niRsicz2jhmtmA8ZOGdSKweJtm0IaNiK16EUQKMZpL1o7mi0qu9b3Jj
	 9R6iSKJzengMPjpVAqTIF1NHOK2rEbgiUi8uPkV6VmJZtQh0/Lm5HvHAnRqgrfnsEvwOm
	 mmsV/Ata/wZ7c1V5EiQJp9pAkFySx9kNc+6kZ2aNi5ibcEjIFEReOAag7GuyfOaqfAmnc
	 B1YoGmERyg89ym/mj5IwP89NkvJ1CU9djMUxGOMmMVHdKploQse36Wv2WDLvEwNgGrBTA
	 rAS2DwuVOQa25udaPuDgFhDqshuG87yh7S7EvSnjnVsjT9DFS/StaMURLzHXOx3TVhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794820396;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Organization:Content-Transfer-Encoding;
	bh=+s05o3Z++PvkkSKaDZG+iK2O6rHuMjlN4mi0BV4F6NE=;
	b=K3lHBi1FPGBgRszJaJzEYYjgKL3Tg99JfNOWXijb/jnYi8t1TJbqkHGiM+Jo1d8Qw0wx
	 zVH2XNkMpijzUj0dv/6LT3qfnnSanpdaQb9F2lSJ83wL4Lg5YMHLtf5Q8r12inMoEZFp2
	 kP3UTjwS6Ybtmk6jy0GGoBRohKS9VPZ6/BCHto0ed0fI1WbQpnUFZ3bkVx6YEO4elFgI7
	 iYMz3lh9gD9bXhad/0qjE/p/VwiuppZT8mOm6YlTYd2lxNXFSLItoqKro1ThKVujKIY4N
	 Go8+tq7shtMPJnpDr69FtoZTpYgB9ZGV8CO4L5YkqeTMv0ok8bqCf06J5H+KSj3gsTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cSZLirqA;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C98606A880;
	Mon, 16 Nov 2026 09:13:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62C98606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cSZLirqA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794820395; x=1826356395;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/D+gZB7x8GjcPdO0PU9B70UWK1TpI7tltCi9CaP4x9A=;
  b=cSZLirqA/eoSnsU8uACXE8ck72BHJWJTnKEFhAkkDCJIp8ugNIQ7AxJU
   1eFoG0mzw5yfsk7HZwQW+gNUJ6NZ6eKNPhHzNvz/44ajUrS+3di4djThX
   GdSqacL3X3fY4oyW06zUrc/NyYfXsSV7ELQsXWmM0czKPM8nAo/bmvdDz
   usXhECfRK+I+SkGlqg4+7hx/sX6BitzYzBpPLDMrm57UDM7w+uNYNxG4L
   dVMDSWcD0+78lsJrbNA8Vx1hO5hnm7yAsUUI8/srjygsgbCWFFlC9Q57T
   tmnd0YvmQq31cazwCJNl7DgTqWUjnyyF2NRV1eXGfPYKQ6JsCZvbjIZPH
   g==;
X-CSE-ConnectionGUID: ENnxvUY/TpG/t+qoLHF4mA==
X-CSE-MsgGUID: 3up5xweaQSejRXb4ES3Dkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3536806"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3536806"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 01:13:14 -0800
X-CSE-ConnectionGUID: +bcxS3kdTq28Bq5PBU9JWg==
X-CSE-MsgGUID: I/N9GdPeTjWAe8vFg+Z6LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9576813"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.93])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 01:13:06 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	Erwin Springer <aot.lerwin@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
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
Subject: [PATCH 09/12] drm/atomic-helper: Mark drm_atomic_crtc_state_for_each_plane_state() unsafe
Date: Mon, 16 Nov 2026 11:11:27 +0200
Message-ID: <20261116091130.13950-10-ville.syrjala@linux.intel.com>
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

drm_atomic_crtc_state_for_each_plane_state() uses the unsafe
__drm_atomic_get_current_plane_state() under the hood. Mark
it all unsafe and give it a __drm prefix to make it doubly
clear that it's a footgun waiting to happen.

I want the old name for a slightly different (safer) purpose.

Everyone really should stop using this, and find a better
way to do things.

Cc: Miguel Ojeda <ojeda@kernel.org>
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
 .clang-format                                 |  2 +-
 drivers/gpu/drm/arm/malidp_crtc.c             |  6 +++---
 drivers/gpu/drm/i915/display/i9xx_wm.c        |  2 +-
 drivers/gpu/drm/i915/display/intel_display.h  |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      |  2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c     |  2 +-
 drivers/gpu/drm/tegra/dc.c                    |  6 +++---
 drivers/gpu/drm/vc4/vc4_hvs.c                 |  2 +-
 include/drm/drm_atomic.h                      |  6 +++---
 include/drm/drm_atomic_helper.h               | 12 ++++++++----
 11 files changed, 25 insertions(+), 21 deletions(-)

diff --git a/.clang-format b/.clang-format
index 395292ab2ac6..db707fd6a684 100644
--- a/.clang-format
+++ b/.clang-format
@@ -160,7 +160,7 @@ ForEachMacros:
   - 'do_for_each_ftrace_op'
   - 'drm_atomic_crtc_for_each_plane'
   - 'drm_atomic_crtc_state_for_each_plane'
-  - 'drm_atomic_crtc_state_for_each_plane_state'
+  - '__drm_atomic_crtc_state_for_each_plane_state_unsafe'
   - 'drm_atomic_for_each_plane_damage'
   - 'drm_client_for_each_connector_iter'
   - 'drm_client_for_each_modeset'
diff --git a/drivers/gpu/drm/arm/malidp_crtc.c b/drivers/gpu/drm/arm/malidp_crtc.c
index ec7b9db8b0b4..3c02f7ec92b8 100644
--- a/drivers/gpu/drm/arm/malidp_crtc.c
+++ b/drivers/gpu/drm/arm/malidp_crtc.c
@@ -268,7 +268,7 @@ static int malidp_crtc_atomic_check_scaling(struct drm_crtc *crtc,
 	if (scaling & (scaling - 1))
 		return -EINVAL;
 
-	drm_atomic_crtc_state_for_each_plane_state(plane, pstate, state) {
+	__drm_atomic_crtc_state_for_each_plane_state_unsafe(plane, pstate, state) {
 		struct malidp_plane *mp = to_malidp_plane(plane);
 		u32 phase;
 
@@ -373,7 +373,7 @@ static int malidp_crtc_atomic_check(struct drm_crtc *crtc,
 	 */
 
 	/* first count the number of rotated planes */
-	drm_atomic_crtc_state_for_each_plane_state(plane, pstate, crtc_state) {
+	__drm_atomic_crtc_state_for_each_plane_state_unsafe(plane, pstate, crtc_state) {
 		struct drm_framebuffer *fb = pstate->fb;
 
 		if ((pstate->rotation & MALIDP_ROTATED_MASK) || fb->modifier)
@@ -389,7 +389,7 @@ static int malidp_crtc_atomic_check(struct drm_crtc *crtc,
 		rot_mem_free += hwdev->rotation_memory[1];
 
 	/* now validate the rotation memory requirements */
-	drm_atomic_crtc_state_for_each_plane_state(plane, pstate, crtc_state) {
+	__drm_atomic_crtc_state_for_each_plane_state_unsafe(plane, pstate, crtc_state) {
 		struct malidp_plane *mp = to_malidp_plane(plane);
 		struct malidp_plane_state *ms = to_malidp_plane_state(pstate);
 		struct drm_framebuffer *fb = pstate->fb;
diff --git a/drivers/gpu/drm/i915/display/i9xx_wm.c b/drivers/gpu/drm/i915/display/i9xx_wm.c
index 46bfada7c060..efd1791efd5f 100644
--- a/drivers/gpu/drm/i915/display/i9xx_wm.c
+++ b/drivers/gpu/drm/i915/display/i9xx_wm.c
@@ -2931,7 +2931,7 @@ static int ilk_compute_pipe_wm(struct intel_atomic_state *state,
 
 	pipe_wm = &crtc_state->wm.ilk.optimal;
 
-	intel_atomic_crtc_state_for_each_plane_state(plane, plane_state, crtc_state) {
+	__intel_atomic_crtc_state_for_each_plane_state_unsafe(plane, plane_state, crtc_state) {
 		if (plane->base.type == DRM_PLANE_TYPE_PRIMARY)
 			pristate = plane_state;
 		else if (plane->base.type == DRM_PLANE_TYPE_OVERLAY)
diff --git a/drivers/gpu/drm/i915/display/intel_display.h b/drivers/gpu/drm/i915/display/intel_display.h
index d53b7b4a80e7..43701325b3de 100644
--- a/drivers/gpu/drm/i915/display/intel_display.h
+++ b/drivers/gpu/drm/i915/display/intel_display.h
@@ -307,13 +307,13 @@ enum phy_fia {
 		for_each_if(((old_crtc_state) = intel_atomic_get_old_crtc_state((__state), (crtc)), \
 			     (new_crtc_state) = intel_atomic_get_new_crtc_state((__state), (crtc))))
 
-#define intel_atomic_crtc_state_for_each_plane_state( \
+#define __intel_atomic_crtc_state_for_each_plane_state_unsafe( \
 		  plane, plane_state, \
 		  crtc_state) \
 	for_each_intel_plane_mask(((crtc_state)->uapi.state->dev), (plane), \
 				((crtc_state)->uapi.plane_mask)) \
 		for_each_if ((plane_state = \
-			      to_intel_plane_state(__drm_atomic_get_current_plane_state((crtc_state)->uapi.state, &plane->base))))
+			      to_intel_plane_state(__drm_atomic_get_current_plane_state_unsafe((crtc_state)->uapi.state, &plane->base))))
 
 #define for_each_new_intel_connector_in_state(__state, connector, new_connector_state, __i) \
 	for ((__i) = 0; \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 9fa55904dba1..6f45adb9c7ae 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -65,7 +65,7 @@ static u64 _dpu_core_perf_calc_bw(const struct dpu_perf_cfg *perf_cfg,
 	u64 crtc_plane_bw = 0;
 	u32 bw_factor;
 
-	drm_atomic_crtc_state_for_each_plane_state(plane, plane_state, state)
+	__drm_atomic_crtc_state_for_each_plane_state_unsafe(plane, plane_state, state)
 		crtc_plane_bw += to_dpu_plane_state(plane_state)->plane_fetch_bw;
 
 	bw_factor = perf_cfg->bw_inefficiency_factor;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 77a2d1f6700d..f5cf9cae732e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1568,7 +1568,7 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 	}
 
 	/* FIXME: move this to dpu_plane_atomic_check? */
-	drm_atomic_crtc_state_for_each_plane_state(plane, pstate, crtc_state) {
+	__drm_atomic_crtc_state_for_each_plane_state_unsafe(plane, pstate, crtc_state) {
 		struct dpu_plane_state *dpu_pstate = to_dpu_plane_state(pstate);
 
 		if (IS_ERR_OR_NULL(pstate)) {
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
index 1e1fff37380c..df85027b7ee0 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
@@ -711,7 +711,7 @@ static int mdp5_crtc_atomic_check(struct drm_crtc *crtc,
 
 	DBG("%s: check", crtc->name);
 
-	drm_atomic_crtc_state_for_each_plane_state(plane, pstate, crtc_state) {
+	__drm_atomic_crtc_state_for_each_plane_state_unsafe(plane, pstate, crtc_state) {
 		struct mdp5_plane_state *mdp5_pstate =
 				to_mdp5_plane_state(pstate);
 
diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 9cd6399b85bb..4ce93b2ef300 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -2471,7 +2471,7 @@ tegra_plane_overlap_mask(struct drm_crtc_state *state,
 	if (tegra_plane_is_cursor(plane_state))
 		return 0;
 
-	drm_atomic_crtc_state_for_each_plane_state(plane, other_state, state) {
+	__drm_atomic_crtc_state_for_each_plane_state_unsafe(plane, other_state, state) {
 		rect = plane_state->dst;
 
 		tegra = to_tegra_plane(other_state->plane);
@@ -2529,7 +2529,7 @@ static int tegra_crtc_calculate_memory_bandwidth(struct drm_crtc *crtc,
 	 * overlap. Note that bitmask[plane] includes BIT(plane) in order
 	 * to make further code nicer and simpler.
 	 */
-	drm_atomic_crtc_state_for_each_plane_state(plane, plane_state, new_state) {
+	__drm_atomic_crtc_state_for_each_plane_state_unsafe(plane, plane_state, new_state) {
 		tegra_state = to_const_tegra_plane_state(plane_state);
 		tegra = to_tegra_plane(plane);
 
@@ -2559,7 +2559,7 @@ static int tegra_crtc_calculate_memory_bandwidth(struct drm_crtc *crtc,
 	 * in order to set up latency allowance based on the peak BW, see
 	 * tegra_crtc_update_memory_bandwidth().
 	 */
-	drm_atomic_crtc_state_for_each_plane_state(plane, plane_state, new_state) {
+	__drm_atomic_crtc_state_for_each_plane_state_unsafe(plane, plane_state, new_state) {
 		u32 i, old_peak_bw, new_peak_bw, overlap_bw = 0;
 
 		/*
diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index 537aaa992129..abda0309393b 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -806,7 +806,7 @@ int vc4_hvs_atomic_check(struct drm_crtc *crtc, struct drm_atomic_commit *state)
 	if (hweight32(crtc_state->connector_mask) > 1)
 		return -EINVAL;
 
-	drm_atomic_crtc_state_for_each_plane_state(plane, plane_state, crtc_state) {
+	__drm_atomic_crtc_state_for_each_plane_state_unsafe(plane, plane_state, crtc_state) {
 		u32 plane_dlist_count = vc4_plane_dlist_size(plane_state);
 
 		drm_dbg_driver(dev, "[CRTC:%d:%s] Found [PLANE:%d:%s] with DLIST size: %u\n",
diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index f60a77ad9b9b..b6414229dc8f 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -887,7 +887,7 @@ drm_atomic_get_new_connector_state(const struct drm_atomic_commit *state,
 }
 
 /**
- * __drm_atomic_get_current_plane_state - get current plane state
+ * __drm_atomic_get_current_plane_state_unsafe - get current plane state
  * @state: global atomic state object
  * @plane: plane to grab
  *
@@ -913,8 +913,8 @@ drm_atomic_get_new_connector_state(const struct drm_atomic_commit *state,
  * Read-only pointer to the current plane state.
  */
 static inline const struct drm_plane_state *
-__drm_atomic_get_current_plane_state(const struct drm_atomic_commit *state,
-				     struct drm_plane *plane)
+__drm_atomic_get_current_plane_state_unsafe(const struct drm_atomic_commit *state,
+					    struct drm_plane *plane)
 {
 	struct drm_plane_state *plane_state;
 
diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
index 278560760e6e..06b6dc9bc4be 100644
--- a/include/drm/drm_atomic_helper.h
+++ b/include/drm/drm_atomic_helper.h
@@ -214,7 +214,7 @@ int drm_atomic_helper_page_flip_target(
 	drm_for_each_plane_mask(plane, (crtc_state)->state->dev, (crtc_state)->plane_mask)
 
 /**
- * drm_atomic_crtc_state_for_each_plane_state - iterate over attached planes in new state
+ * __drm_atomic_crtc_state_for_each_plane_state_unsafe - iterate over attached planes in new state
  * @plane: the loop cursor
  * @plane_state: loop cursor for the plane's state, must be const
  * @crtc_state: the incoming CRTC state
@@ -227,12 +227,16 @@ int drm_atomic_helper_page_flip_target(
  * Compared to just drm_atomic_crtc_state_for_each_plane() this also fills in a
  * const plane_state. This is useful when a driver just wants to peek at other
  * active planes on this CRTC, but does not need to change it.
+ *
+ * WARNING:
+ * This is generally unsafe to use. See
+ * __drm_atomic_get_current_plane_state_unsafe() for further details.
  */
-#define drm_atomic_crtc_state_for_each_plane_state(plane, plane_state, crtc_state) \
+#define __drm_atomic_crtc_state_for_each_plane_state_unsafe(plane, plane_state, crtc_state) \
 	drm_for_each_plane_mask(plane, (crtc_state)->state->dev, (crtc_state)->plane_mask) \
 		for_each_if ((plane_state = \
-			      __drm_atomic_get_current_plane_state((crtc_state)->state, \
-								   plane)))
+			      __drm_atomic_get_current_plane_state_unsafe((crtc_state)->state, \
+									  plane)))
 
 /**
  * drm_atomic_plane_enabling - check whether a plane is being enabled
-- 
2.56.0

