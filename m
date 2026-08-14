Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835DD3F1AB9
	for <linux-tegra@vger.kernel.org>; Fri, 14 Aug 2026 15:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786719603; cv=none; b=O5dKcjO8celGVX9w8LhAFTFsHaI0FshJrrCklTbAmzw8nijrKmKojxTReEAOriEza6/pph4RoGu1P8m0FwktM0lSPcxsEXjlt/BDOQ3N2KsVS/KICVF0CDF/+1Zf4wyAhqlTJWc+7ZDXV3UeXfnrLkTClel4AiGu91IZmuVdY2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786719603; c=relaxed/simple;
	bh=CxGGeZZdhqfUmIxGLuzRlPmMezxWjLaW36xnVdsB+lE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fSflRySFr2HUP3h+0p8E2tfVdsxFqHODdUdlL75SalInnYZbFVnppQytP7Sn48qnl/nXaMrxK85SgigU4ybiaeGTZdgqN2vAR8/6rizqoIiLi0ZaA6NwxCpAw74NqXYqI071HWsgXMH1Oz+kKcP8ROcD4MkEF2RsWdmYLiwns2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PuVDVRwq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PuVDVRwq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 896821F000E9;
	Fri, 14 Aug 2026 15:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786719602;
	bh=ZDYEgnkKqR2e4GhNYCzraNeV9Hpn8q5yFxx6qcZtuBQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=PuVDVRwqf49GNvlFCrj1k9ih+fJ9Fz+Ir0bMLIQmWKAf+qLUq6sfJRa2IMp6SHms3
	 Cs0qYXjSLC70rKzEAxq3QvVfbrkqS4h0hs4F16+tN/qOuPz5QNu+gca+LDPtRxEOoW
	 pEPlBVS60wSXkFpvQ4Xr95Ms+OmtSUEzYSoV2H2z7vrL9zE7FBfdtl3YvOK0euXJ2x
	 KRq/l6K5LSKLJAxi0nVXkKdcWz2W5Kv+32CtlPkVKW/7m7Wi/LqF4YwYOS52NH3aLJ
	 PwkLzUIMtQql29qX7r3jUAlbjCC+DgwH4qYJspnfp9GGkP9jhrrXtZU4vQG4OlPKGU
	 xbgI9YQP2pZ8A==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 14 Aug 2026 16:57:49 +0200
Subject: [PATCH v2 60/61] drm/tegra: Convert to atomic_create_state
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-drm-no-more-plane-reset-v2-60-82d2963dd134@kernel.org>
References: <20260814-drm-no-more-plane-reset-v2-0-82d2963dd134@kernel.org>
In-Reply-To: <20260814-drm-no-more-plane-reset-v2-0-82d2963dd134@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Mikko Perttunen <mperttunen@nvidia.com>, jonathanh@nvidia.com, 
 linux-tegra@vger.kernel.org, mperttunen@nvidia.com, 
 thierry.reding@kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2489; i=mripard@kernel.org;
 h=from:subject:message-id; bh=CxGGeZZdhqfUmIxGLuzRlPmMezxWjLaW36xnVdsB+lE=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFn1OveKUi2CMlek7U46ajn98bu6TLEDYk6tH/0FjUss+
 BPNdu/rmMrCIMzJICumyPJEJuz08vbFVQ72K3/AzGFlAhnCwMUpABO5f4+xTjVKdb/rqmeLjMIC
 PyrNyZAxeZC5M8/V4U70moRsxq5bBxL7HhzTTlwoMKtSWLVS+3oiY0MP95Iew++PYiRnbU+Ye8v
 SpvH4A5Grp0V/fit/v2rKNOnSI4rt/ox+EyS0l7VmpDJ9vgwA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The plane reset implementation creates a custom state subclass, but
only initializes a pristine state without resetting any hardware. This
is equivalent to what atomic_create_state expects. Convert to it.

Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Cc: jonathanh@nvidia.com
Cc: linux-tegra@vger.kernel.org
Cc: mperttunen@nvidia.com
Cc: thierry.reding@kernel.org
---
 drivers/gpu/drm/tegra/plane.c | 28 ++++++++++++----------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/tegra/plane.c b/drivers/gpu/drm/tegra/plane.c
index 0cb30910773f..2148b0c59815 100644
--- a/drivers/gpu/drm/tegra/plane.c
+++ b/drivers/gpu/drm/tegra/plane.c
@@ -22,32 +22,28 @@ static void tegra_plane_destroy(struct drm_plane *plane)
 
 	drm_plane_cleanup(plane);
 	kfree(p);
 }
 
-static void tegra_plane_reset(struct drm_plane *plane)
+static struct drm_plane_state *tegra_plane_atomic_create_state(struct drm_plane *plane)
 {
 	struct tegra_plane *p = to_tegra_plane(plane);
 	struct tegra_plane_state *state;
 	unsigned int i;
 
-	if (plane->state)
-		__drm_atomic_helper_plane_destroy_state(plane->state);
-
-	kfree(plane->state);
-	plane->state = NULL;
-
 	state = kzalloc_obj(*state);
-	if (state) {
-		plane->state = &state->base;
-		plane->state->plane = plane;
-		plane->state->zpos = p->index;
-		plane->state->normalized_zpos = p->index;
+	if (!state)
+		return ERR_PTR(-ENOMEM);
 
-		for (i = 0; i < 3; i++)
-			state->iova[i] = DMA_MAPPING_ERROR;
-	}
+	state->base.plane = plane;
+	state->base.zpos = p->index;
+	state->base.normalized_zpos = p->index;
+
+	for (i = 0; i < 3; i++)
+		state->iova[i] = DMA_MAPPING_ERROR;
+
+	return &state->base;
 }
 
 static struct drm_plane_state *
 tegra_plane_atomic_duplicate_state(struct drm_plane *plane)
 {
@@ -129,11 +125,11 @@ static bool tegra_plane_format_mod_supported(struct drm_plane *plane,
 
 const struct drm_plane_funcs tegra_plane_funcs = {
 	.update_plane = drm_atomic_helper_update_plane,
 	.disable_plane = drm_atomic_helper_disable_plane,
 	.destroy = tegra_plane_destroy,
-	.reset = tegra_plane_reset,
+	.atomic_create_state = tegra_plane_atomic_create_state,
 	.atomic_duplicate_state = tegra_plane_atomic_duplicate_state,
 	.atomic_destroy_state = tegra_plane_atomic_destroy_state,
 	.format_mod_supported = tegra_plane_format_mod_supported,
 };
 

-- 
2.55.0

