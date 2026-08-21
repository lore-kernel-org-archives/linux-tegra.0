Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48FB9437471
	for <linux-tegra@vger.kernel.org>; Fri, 21 Aug 2026 14:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787323320; cv=none; b=tqdbdT3hNWoYrdnClZp4mOxDlv+Gh34YM5ria9RyIYFods2vblImaAFGOc0jLaccZIBJv/e/Pz0TGP3bT2HhHNHHcwuT2MOfUGdNBNSwBogNjpwF2FpbXHMTZ/1sIxH7AEl9IxEGv8nm9I/bSLDqcaEObbYdixCHFd5BDbUTrTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787323320; c=relaxed/simple;
	bh=9I4/IWn9ABb1+w/1ir3yEJ2utScgtIUlV5Kqic4SkjM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fR1nbaoK7s74WtvsFgT3c7Hnq8fmJci48jPoA6S0ws5/z7xGl39msEk0y8EzFd/cCP/eGsnm2Sd918wYHhvWHaz0koau9jNfjCShjmBrC8ZkHf1MyVQll0pmFh5VnGxpxI89Jtk+xUK75EPsvD88nAczRu1PN9Uc7oL2Atg1htc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hPQR52RN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hPQR52RN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6110D1F000E9;
	Fri, 21 Aug 2026 14:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787323318;
	bh=RP8nolhGm7R7HF6whq9ddWed9BAIPVhEIV/UdhkpT8Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=hPQR52RNG/FrJ1sWYccViHwVzxkBvGdPunlJM8S3ZeSSWd58S71eX/5+1R969E8+y
	 xv2NRp6lGufa3GFdSQrRFh+FPsy5U6srpXM/14ONTj90GuyxCBfTrYdOrNCrdmZz11
	 /Jb/dJmyZop7/W/G5IJUQ5lWFHoeysZHImJ5RPVoh4z4CbHj10tIpa84JPJ35tr93H
	 9w/snFFRmDpO8TMeuB01biUD+Rm4Zb/xLubmrsix3ctXl1NiWMQkNxMV6HMItHYSKP
	 qSvD4O2G246OzUeERvwwcmYnm+tyGzCWGQ1WFnPfmwgNQ1twbwoUY7RT9n25J/mmrq
	 rW0n0lDXxJZ1g==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 21 Aug 2026 16:39:41 +0200
Subject: [PATCH 65/70] drm/tegra: Convert to atomic_create_state
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-drm-no-more-crtc-reset-v1-65-fb793475c05a@kernel.org>
References: <20260821-drm-no-more-crtc-reset-v1-0-fb793475c05a@kernel.org>
In-Reply-To: <20260821-drm-no-more-crtc-reset-v1-0-fb793475c05a@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Thierry Reding <thierry.reding@kernel.org>, linux-tegra@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2510; i=mripard@kernel.org;
 h=from:subject:message-id; bh=9I4/IWn9ABb1+w/1ir3yEJ2utScgtIUlV5Kqic4SkjM=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFkdyaKf5Rskup/G/apV+jXjs/dh9RIDpQcCyq98NhU3Z
 r8ULfDvmMrCIMzJICumyPJEJuz08vbFVQ72K3/AzGFlAhnCwMUpABMx3c1YK/5u7a/ub+EPzLIX
 ZL/gWRKaUmy5ZJ9Fk2fK9EgmS0m+9mCO6/WPVHdd+1y1UfK+wj5WxnqHEgWRL2qy2wQmMDy4mnz
 hhet94+ztn2Zx5db/mdOezHJYrJ9dLCSo6tfCp1cLHvtZfwUA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The tegra crtc implementation provides a custom reset hook. However,
this hook only allocates the state, initializes it with
__drm_atomic_helper_crtc_reset(), and frees the previous state. It
does not perform any hardware reset.

Since this is exactly what the atomic_create_state hook is meant to
do, minus the old state cleanup which the caller handles, convert the
implementation to use atomic_create_state with
__drm_atomic_helper_crtc_state_init() instead.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Thierry Reding <thierry.reding@kernel.org>
Cc: linux-tegra@vger.kernel.org
---
 drivers/gpu/drm/tegra/dc.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 0b3fcc7011b3..6acf49f69903 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -1484,21 +1484,21 @@ static struct drm_plane *tegra_dc_add_planes(struct drm_device *drm,
 static void tegra_dc_destroy(struct drm_crtc *crtc)
 {
 	drm_crtc_cleanup(crtc);
 }
 
-static void tegra_crtc_reset(struct drm_crtc *crtc)
+static struct drm_crtc_state *tegra_crtc_create_state(struct drm_crtc *crtc)
 {
-	struct tegra_dc_state *state = kzalloc_obj(*state);
+	struct tegra_dc_state *state;
 
-	if (crtc->state)
-		tegra_crtc_atomic_destroy_state(crtc, crtc->state);
+	state = kzalloc_obj(*state);
+	if (!state)
+		return ERR_PTR(-ENOMEM);
 
-	if (state)
-		__drm_atomic_helper_crtc_reset(crtc, &state->base);
-	else
-		__drm_atomic_helper_crtc_reset(crtc, NULL);
+	__drm_atomic_helper_crtc_state_init(&state->base, crtc);
+
+	return &state->base;
 }
 
 static struct drm_crtc_state *
 tegra_crtc_atomic_duplicate_state(struct drm_crtc *crtc)
 {
@@ -1903,11 +1903,11 @@ static void tegra_dc_disable_vblank(struct drm_crtc *crtc)
 
 static const struct drm_crtc_funcs tegra_crtc_funcs = {
 	.page_flip = drm_atomic_helper_page_flip,
 	.set_config = drm_atomic_helper_set_config,
 	.destroy = tegra_dc_destroy,
-	.reset = tegra_crtc_reset,
+	.atomic_create_state = tegra_crtc_create_state,
 	.atomic_duplicate_state = tegra_crtc_atomic_duplicate_state,
 	.atomic_destroy_state = tegra_crtc_atomic_destroy_state,
 	.late_register = tegra_dc_late_register,
 	.early_unregister = tegra_dc_early_unregister,
 	.get_vblank_counter = tegra_dc_get_vblank_counter,

-- 
2.55.0

