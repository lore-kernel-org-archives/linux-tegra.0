Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F98911CAF
	for <linux-tegra@vger.kernel.org>; Tue, 30 Sep 2025 11:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759230089; cv=none; b=kPpxRVgtfcZlGwO6AelJlaVK/E7ntUEPw0bfAOsBvPkgO6LeYCfjzBpKckvCvlIyt0R1D03XyuyldBbqP0IJuxqDd9Ml4zFZteUktRs+ARKL9f3SWlpYZQUtM+MA46kp8GjICa3SSdHLu9qQSqNctHDuaTlIBYnTPjRNZGotQmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759230089; c=relaxed/simple;
	bh=RuuxyxY+VZaZqYLpsuwEKi3/NEGzLlehxntUlWNT4VM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jpaPGYOeGBvG3zw3sfKZsymWmMldrdogj0n6tEXf/NK6ftGw6RLdeSWyDAOx54+v+BUXyvTWXUg9SvTRr71cqh3RUrWuDAzTjsG1IpzICvZ3p58MBdomab7L9wP8Bkm8hlUvwJXLcKmmZdlDEYlnrA0dp0p4ncSwL1T+FMXPS2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DydzS4WF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DydzS4WF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A12CC4CEF7;
	Tue, 30 Sep 2025 11:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759230088;
	bh=RuuxyxY+VZaZqYLpsuwEKi3/NEGzLlehxntUlWNT4VM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DydzS4WFexHVRIvLaaOV8zmGrSgmiMsJvyR0jTwHL5AqO/WaPXxLlr0pH39uoDko9
	 MIMMzeXx/pHuq0lLkcsNkX3ORIn9SUvawxD77jMA/mwT8Nbw+ef77xxZxfJ0SRblDv
	 JH9yhduUD4ULYx97g6+v/X7ChfH+Pu2GDapHQx4MPbm7gb8BDl1gAiE8Dh5mg0Sh1u
	 AV95hT9dzQfHacfeCQBDWuzIpZ1pjOYXxgkObRZc468cPce6IHvotIF9CKfLZCmiM9
	 cmU33RQDzxSH1raWoGCYfLVQEvQKZRl0ZEGQKbXg6crtm6r5Z5JZ4siQbDMqYJUv5e
	 pxZ3ClgUi8eDA==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 30 Sep 2025 12:59:44 +0200
Subject: [PATCH v5 29/39] drm/tegra: Switch to
 drm_atomic_get_new_crtc_state()
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250930-drm-no-more-existing-state-v5-29-eeb9e1287907@kernel.org>
References: <20250930-drm-no-more-existing-state-v5-0-eeb9e1287907@kernel.org>
In-Reply-To: <20250930-drm-no-more-existing-state-v5-0-eeb9e1287907@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1494; i=mripard@kernel.org;
 h=from:subject:message-id; bh=RuuxyxY+VZaZqYLpsuwEKi3/NEGzLlehxntUlWNT4VM=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBm3d+isF32/zCB3TqWyaSfTowMFpdvFmU2OvTsbIiQgu
 6r0jal9x1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZiIoStjw9JVpvuC4zh9E1f6
 ux1Y/Yr5cfezkpUbnsyc3HTEvC3MKFziP1vgs4CkFb0Bk7lkdmTuYazPiszo0wy7Oum6/K2WXLO
 u3ZF1d9JWfmRzV/tS6eguphY2Nzct/NhRSfdfm3XbIo6tuAMA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The tegra atomic_check implementation uses the deprecated
drm_atomic_get_existing_crtc_state() helper.

This hook is called as part of the global atomic_check, thus before the
states are swapped. The existing state thus points to the new state, and
we can use drm_atomic_get_new_crtc_state() instead.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
To: Thierry Reding <thierry.reding@gmail.com>
To: Mikko Perttunen <mperttunen@nvidia.com>
To: Jonathan Hunter <jonathanh@nvidia.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-tegra@vger.kernel.org
---
 drivers/gpu/drm/tegra/dc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 59d5c1ba145a82f62c1835da574867084da98106..0f80da3544c9b3a239c43740c05f007711bc728b 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -1031,11 +1031,11 @@ static int tegra_cursor_atomic_async_check(struct drm_plane *plane, struct drm_a
 	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state, plane);
 	struct drm_crtc_state *crtc_state;
 	int min_scale, max_scale;
 	int err;
 
-	crtc_state = drm_atomic_get_existing_crtc_state(state, new_state->crtc);
+	crtc_state = drm_atomic_get_new_crtc_state(state, new_state->crtc);
 	if (WARN_ON(!crtc_state))
 		return -EINVAL;
 
 	if (!crtc_state->active)
 		return -EINVAL;

-- 
2.51.0

