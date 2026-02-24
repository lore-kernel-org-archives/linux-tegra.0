Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B0F38BF60
	for <linux-tegra@vger.kernel.org>; Tue, 24 Feb 2026 16:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771949447; cv=none; b=ZLaTSuFBX2k0UJDuxNfVfo15WXMxbBBsgcikgH3YyHmUD840Y/M9CXNWH2UBGUK1nwJv2oCEv7zpdHDCujbFkN5JVpTTPtAxsZUFaCVWazgBNgQT9zYeiRTE+2DT21fzUNqxIL6JJ5NZeY+b9deavetOySMXori9YCrhP4gXj/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771949447; c=relaxed/simple;
	bh=xuzE4M4gJA4JvU0QoJ8W46Vzrkz1BXJL0WI5noSRNpU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pruDrcQXyYLA+uyB/z/q/ohIVjmPsbkuJTVT1S+0OjJLikETITXUQBgPSQ8+R0jS/XGXwy2nAdMvylGnK9hGjfYxWeL/eVx0B+1C3aBKVsq3VhWttzMudbbxem9CJ1FlJflbTh5w+kfjoDobNcUXyJQcsh+ddJ9g9s1gLtm6w2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EzeU6rfy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EzeU6rfy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DCA4C2BC9E;
	Tue, 24 Feb 2026 16:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771949447;
	bh=xuzE4M4gJA4JvU0QoJ8W46Vzrkz1BXJL0WI5noSRNpU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=EzeU6rfy+0fIODUYMf+i4SVX9DmhivhodwWOAgr3wPvSQTYQtqkn2aZgnMx9FnJzk
	 fqO9jHE+Rkmge1+MKG68ZsRUIL1D7K8QYlYW5b7ltcFmkSh9UnMkmQUN3oaNCmjLy8
	 L47dbGaf9/lEqEq9MUlP4+Np9MktikXiWXAmUkBg2mjIpmjOst+zlMWgNi4gSeQWZM
	 kevkFPscj3o8ykJHBy7jK+t4aN/TzI6htpqCmuBBdanfIexLtzX3pJ2p1EIC4SioVd
	 B4FiqcsayZPUp5TnaZRtPtBexkjN+HYDW1AGyDauznSy834+MyNhs8kk/Jutz36fVY
	 dfY+PIYJVc31g==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 24 Feb 2026 17:10:28 +0100
Subject: [PATCH v5 3/4] drm/tegra: Switch private_obj initialization to
 atomic_create_state
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-drm-private-obj-reset-v5-3-5a72f8ec9934@kernel.org>
References: <20260224-drm-private-obj-reset-v5-0-5a72f8ec9934@kernel.org>
In-Reply-To: <20260224-drm-private-obj-reset-v5-0-5a72f8ec9934@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2406; i=mripard@kernel.org;
 h=from:subject:message-id; bh=xuzE4M4gJA4JvU0QoJ8W46Vzrkz1BXJL0WI5noSRNpU=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJlzz1aFzOvqOlfFVHLRWjiC78f/1BDL50ZxjOyb7a9Ps
 n1VaryrYyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenAEzkUAVjvc9neesZy/RW6Qiz
 uH4KbeSJdCwXtf01ZdLfS/JFXNu0H5bofmBYlbnQc/rvy0l8Wf6ijA2T+n6kSYc9Pf954ofz3PP
 yDLf+mth5OePRkp/OCbeyNk7h5w+/Ysv99ueFT0Wq9lV6Ry8DAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The tegra driver relies on a drm_private_obj, that is initialized by
allocating and initializing a state, and then passing it to
drm_private_obj_init.

Since we're gradually moving away from that pattern to the more
established one relying on a atomic_create_state implementation, let's
migrate this instance to the new pattern.

Signed-off-by: Maxime Ripard <mripard@kernel.org>

---

Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org
---
 drivers/gpu/drm/tegra/hub.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
index a6fa196c28132ea9839c48639fb3214b32396d02..73190a4b4d0546be6d6cae746ba5d03ab8e98b92 100644
--- a/drivers/gpu/drm/tegra/hub.c
+++ b/drivers/gpu/drm/tegra/hub.c
@@ -823,11 +823,26 @@ static void tegra_display_hub_destroy_state(struct drm_private_obj *obj,
 		to_tegra_display_hub_state(state);
 
 	kfree(hub_state);
 }
 
+static struct drm_private_state *
+tegra_display_hub_create_state(struct drm_private_obj *obj)
+{
+	struct tegra_display_hub_state *hub_state;
+
+	hub_state = kzalloc_obj(*hub_state);
+	if (!hub_state)
+		return ERR_PTR(-ENOMEM);
+
+	__drm_atomic_helper_private_obj_create_state(obj, &hub_state->base);
+
+	return &hub_state->base;
+}
+
 static const struct drm_private_state_funcs tegra_display_hub_state_funcs = {
+	.atomic_create_state = tegra_display_hub_create_state,
 	.atomic_duplicate_state = tegra_display_hub_duplicate_state,
 	.atomic_destroy_state = tegra_display_hub_destroy_state,
 };
 
 static struct tegra_display_hub_state *
@@ -939,17 +954,12 @@ void tegra_display_hub_atomic_commit(struct drm_device *drm,
 static int tegra_display_hub_init(struct host1x_client *client)
 {
 	struct tegra_display_hub *hub = to_tegra_display_hub(client);
 	struct drm_device *drm = dev_get_drvdata(client->host);
 	struct tegra_drm *tegra = drm->dev_private;
-	struct tegra_display_hub_state *state;
 
-	state = kzalloc_obj(*state);
-	if (!state)
-		return -ENOMEM;
-
-	drm_atomic_private_obj_init(drm, &hub->base, &state->base,
+	drm_atomic_private_obj_init(drm, &hub->base, NULL,
 				    &tegra_display_hub_state_funcs);
 
 	tegra->hub = hub;
 
 	return 0;

-- 
2.52.0

