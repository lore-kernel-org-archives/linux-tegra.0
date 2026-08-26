Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653E13101A0
	for <linux-tegra@vger.kernel.org>; Wed, 26 Aug 2026 10:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787741684; cv=none; b=PZhbU/y4xALMLsKk8rtqnfaZGrntq6A4Qea8TxKEVwQ65QTSk7KiPtpi0PcZkx38uW97jq/wqrKXQKyt/88q4gLcJqOowESw2p25im1ffcojIJlBjjEZ9t8fz+ZpoVGomQ7Ko7+wQKOq5csxVwDuNhozCTQ2l56+UYwrUd7L62Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787741684; c=relaxed/simple;
	bh=hii+QqfsZRz7TD2Md3QiHEINUckRhxup9/Rc56VL7+I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DyMiK6TrpaTMvACXd2LDCwYNicuXqb9/h326gzBWQUY5ojtkZt4yp/yZFXyb/QnOkhH219dAYh2coGu5OhrK2X7ktdN+NA/6XDfK8XdTniIdl4sdvgOJ4lE5B4XueST7E3jgy9UPjXuP7ZVUksijf/VMKeWmmiFnrt7IUPVa/uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wik+GUOL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wik+GUOL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5DD91F000E9;
	Wed, 26 Aug 2026 10:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787741667;
	bh=zBtPu+db9RSzD3FBUi4xb2NNk9iniOP6mDk0cqAmda4=;
	h=From:To:Cc:Subject:Date;
	b=Wik+GUOLq906uOZTbmIGKVULn7zt46W/+9bvBjXazjucCVYx7DQkKdU2u5V8o2bgg
	 uPSkdET2q6rzHS3Sp6DkCZt12eh2hvpbuosscpHcpZtOCM3i7zJ6J/GqPq8Htgy8c3
	 lFj0BF3L2Y1KDmwTSKwmdXMSbH2JgcqqKMWkm2XOuagdjT9jQDDI2JTo94u+/Z6B5G
	 t/ih6v9QhDO0oOO+Vvu0Yuhz3rn54CL2tUZqL1oXzJVYaLI9Bp+bMNpMsgmB1/6cms
	 4rhfAATGnbLY8lZ5nhW7pTDuRSbyRQQJsrHlB17RTGO5Lf2oEvZ6OWKVVdBaUJvGnK
	 tqNRXIJEXKYnA==
From: Thierry Reding <thierry.reding@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Mikko Perttunen <mperttunen@nvidia.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH] drm/tegra: Add blend mode properties
Date: Wed, 26 Aug 2026 12:54:21 +0200
Message-ID: <20260826105421.1825331-1-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

The default programming in the driver matches the "coverage" blend mode,
so add the corresponding pixel blend mode property to let userspace know
about it.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/dc.c  | 6 ++++++
 drivers/gpu/drm/tegra/hub.c | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 0b3fcc7011b35..fefc3761a4bc7 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -904,6 +904,7 @@ static struct drm_plane *tegra_primary_plane_create(struct drm_device *drm,
 						    struct tegra_dc *dc)
 {
 	unsigned long possible_crtcs = tegra_plane_get_possible_crtcs(drm);
+	unsigned int blend_caps = BIT(DRM_MODE_BLEND_COVERAGE);
 	enum drm_plane_type type = DRM_PLANE_TYPE_PRIMARY;
 	struct tegra_plane *plane;
 	unsigned int num_formats;
@@ -939,6 +940,7 @@ static struct drm_plane *tegra_primary_plane_create(struct drm_device *drm,
 	}
 
 	drm_plane_helper_add(&plane->base, &tegra_plane_helper_funcs);
+	drm_plane_create_blend_mode_property(&plane->base, blend_caps);
 	drm_plane_create_zpos_property(&plane->base, plane->index, 0, 255);
 
 	err = drm_plane_create_rotation_property(&plane->base,
@@ -1209,6 +1211,7 @@ static struct drm_plane *tegra_dc_cursor_plane_create(struct drm_device *drm,
 						      struct tegra_dc *dc)
 {
 	unsigned long possible_crtcs = tegra_plane_get_possible_crtcs(drm);
+	unsigned int blend_caps = BIT(DRM_MODE_BLEND_COVERAGE);
 	struct tegra_plane *plane;
 	unsigned int num_formats;
 	const u32 *formats;
@@ -1252,6 +1255,7 @@ static struct drm_plane *tegra_dc_cursor_plane_create(struct drm_device *drm,
 	}
 
 	drm_plane_helper_add(&plane->base, &tegra_cursor_plane_helper_funcs);
+	drm_plane_create_blend_mode_property(&plane->base, blend_caps);
 	drm_plane_create_zpos_immutable_property(&plane->base, 255);
 
 	return &plane->base;
@@ -1356,6 +1360,7 @@ static struct drm_plane *tegra_dc_overlay_plane_create(struct drm_device *drm,
 						       bool cursor)
 {
 	unsigned long possible_crtcs = tegra_plane_get_possible_crtcs(drm);
+	unsigned int blend_caps = BIT(DRM_MODE_BLEND_COVERAGE);
 	struct tegra_plane *plane;
 	unsigned int num_formats;
 	enum drm_plane_type type;
@@ -1394,6 +1399,7 @@ static struct drm_plane *tegra_dc_overlay_plane_create(struct drm_device *drm,
 	}
 
 	drm_plane_helper_add(&plane->base, &tegra_plane_helper_funcs);
+	drm_plane_create_blend_mode_property(&plane->base, blend_caps);
 	drm_plane_create_zpos_property(&plane->base, plane->index, 0, 255);
 
 	err = drm_plane_create_rotation_property(&plane->base,
diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
index bd442bfd45407..448f49f3a7d7e 100644
--- a/drivers/gpu/drm/tegra/hub.c
+++ b/drivers/gpu/drm/tegra/hub.c
@@ -759,6 +759,7 @@ struct drm_plane *tegra_shared_plane_create(struct drm_device *drm,
 					    unsigned int index,
 					    enum drm_plane_type type)
 {
+	unsigned int blend_caps = BIT(DRM_MODE_BLEND_COVERAGE);
 	struct tegra_drm *tegra = drm->dev_private;
 	struct tegra_display_hub *hub = tegra->hub;
 	struct tegra_shared_plane *plane;
@@ -797,6 +798,7 @@ struct drm_plane *tegra_shared_plane_create(struct drm_device *drm,
 	}
 
 	drm_plane_helper_add(p, &tegra_shared_plane_helper_funcs);
+	drm_plane_create_blend_mode_property(p, blend_caps);
 	drm_plane_create_zpos_property(p, 0, 0, 255);
 
 	return p;
-- 
2.55.0

