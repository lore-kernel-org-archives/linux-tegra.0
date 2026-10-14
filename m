Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9F45650E6
	for <linux-tegra@vger.kernel.org>; Wed, 14 Oct 2026 17:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791999097; cv=none; b=GBJrGzuZutrdJSdJMfBMtCcEnD/KebQEYuPjxftA9UYeKYooD/f2W0b+xnK4vJEU1C2pTBjXtpYt0Yt89tkgT95qx6fN4qK/nlTsmO6XllGtl7a+IAOZ6ePvsHEWByCWfktWep3GA5Sl0ZM5x8N1RPOOls/Tk4igAbnqPUdWpbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791999097; c=relaxed/simple;
	bh=BWrpEBqzJw7phtMtk/Yo/rV3hqfPIQbxZckMceilc3g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C7G6DmMAWdqwpz6VSnC/YSIq0cH3BwWclCVL5ZPo2vnQPylSHo+SyExuUhfvnDbV9QZcNWp2a0qzUo3po14+lN+/MdPi2kFxum8P1VzGHC+uEq4w4EcrtWXdqkywFWY9kYMQGJnNquzBORW+ru+ojhtts+o4J/c4vuc4SKZEOpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m6c4BUTE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m6c4BUTE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 381EF1F000C5;
	Wed, 14 Oct 2026 17:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791999094;
	bh=ATdu2dU49OLFEpsn9TYbc9WvAWed/YStXLW0PVuge/Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=m6c4BUTEeo98UgYD2I5A2CYok7k7DzhIqBHTkOhsM8rQirhZjcLccALgodCwxjYJ0
	 9FjQo97BDoDrCR7SchQLXs9iRo2vfp5wFxhMYJagn6nCRuXEr/9cemEfHpBcRAERjV
	 yKpVyMXtzUdFrewNZggdrxCh3pv0hp5BXXtq3rDhd16WJFUVZkZ+0BQ1nzfDVFr4vF
	 tyd5jCveoradzpJ/yz/Z1qfe2vOPIERxcIrnRBgNkDxAMwKbu0C4f5F71KEU0SaCKd
	 OnaLWlsWLQ33EjKucCw6h2vvDe5KB0sWqIbOJ8f88TLxpALA3gOh/UuWJW9Tn9+NcB
	 BdnUjAW0g0jXQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 14 Oct 2026 19:27:35 +0200
Subject: [PATCH 72/75] drm/tegra: Convert to atomic_create_state
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-drm-no-more-connector-reset-v1-72-586c9c026823@kernel.org>
References: <20261014-drm-no-more-connector-reset-v1-0-586c9c026823@kernel.org>
In-Reply-To: <20261014-drm-no-more-connector-reset-v1-0-586c9c026823@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Thierry Reding <thierry.reding@kernel.org>, linux-tegra@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3998; i=mripard@kernel.org;
 h=from:subject:message-id; bh=BWrpEBqzJw7phtMtk/Yo/rV3hqfPIQbxZckMceilc3g=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFnnd2e5b4qKufrg2TuJXNcPik/U3kvKBzHLmBdt4Hm61
 F1d68b0jqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjARBWHGOl35p3bKOR1Fmz+J
 vRBJf5j8LGKPQ9O3O+zRTYybpGz3SL71YimqrpgVvORVub4AU/U6xjrdV/IKihePppwPMWj6Jet
 6+oHwx6s3f27LSjwSvCTl5F8lo7uvpZ6479lhFvPT8mG0WC8A
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The tegra DSI and SOR connector reset implementations create custom
state subclasses, but only initialize a pristine state without resetting
any hardware. This is equivalent to what atomic_create_state expects.
Convert to it.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Thierry Reding <thierry.reding@kernel.org>
Cc: linux-tegra@vger.kernel.org
---
 drivers/gpu/drm/tegra/dsi.c | 17 ++++++++---------
 drivers/gpu/drm/tegra/sor.c | 13 +++++--------
 2 files changed, 13 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index 7b595310e737..e4d842119bef 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -783,23 +783,22 @@ static void tegra_dsi_soft_reset(struct tegra_dsi *dsi)
 
 	if (dsi->slave)
 		tegra_dsi_soft_reset(dsi->slave);
 }
 
-static void tegra_dsi_connector_reset(struct drm_connector *connector)
+static struct drm_connector_state *
+tegra_dsi_connector_create_state(struct drm_connector *connector)
 {
-	struct tegra_dsi_state *state = kzalloc_obj(*state);
+	struct tegra_dsi_state *state;
 
+	state = kzalloc_obj(*state);
 	if (!state)
-		return;
+		return ERR_PTR(-ENOMEM);
 
-	if (connector->state) {
-		__drm_atomic_helper_connector_destroy_state(connector->state);
-		kfree(connector->state);
-	}
+	__drm_atomic_helper_connector_state_init(&state->base, connector);
 
-	__drm_atomic_helper_connector_reset(connector, &state->base);
+	return &state->base;
 }
 
 static struct drm_connector_state *
 tegra_dsi_connector_duplicate_state(struct drm_connector *connector)
 {
@@ -815,11 +814,11 @@ tegra_dsi_connector_duplicate_state(struct drm_connector *connector)
 
 	return &copy->base;
 }
 
 static const struct drm_connector_funcs tegra_dsi_connector_funcs = {
-	.reset = tegra_dsi_connector_reset,
+	.atomic_create_state = tegra_dsi_connector_create_state,
 	.detect = tegra_output_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.destroy = tegra_output_connector_destroy,
 	.atomic_duplicate_state = tegra_dsi_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index e384cbd0cbf7..fd60acd22ed1 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -1718,24 +1718,21 @@ static void tegra_sor_early_unregister(struct drm_connector *connector)
 				 connector->dev->primary);
 	kfree(sor->debugfs_files);
 	sor->debugfs_files = NULL;
 }
 
-static void tegra_sor_connector_reset(struct drm_connector *connector)
+static struct drm_connector_state *tegra_sor_connector_create_state(struct drm_connector *connector)
 {
 	struct tegra_sor_state *state;
 
 	state = kzalloc_obj(*state);
 	if (!state)
-		return;
+		return ERR_PTR(-ENOMEM);
 
-	if (connector->state) {
-		__drm_atomic_helper_connector_destroy_state(connector->state);
-		kfree(connector->state);
-	}
+	__drm_atomic_helper_connector_state_init(&state->base, connector);
 
-	__drm_atomic_helper_connector_reset(connector, &state->base);
+	return &state->base;
 }
 
 static enum drm_connector_status
 tegra_sor_connector_detect(struct drm_connector *connector, bool force)
 {
@@ -1762,11 +1759,11 @@ tegra_sor_connector_duplicate_state(struct drm_connector *connector)
 
 	return &copy->base;
 }
 
 static const struct drm_connector_funcs tegra_sor_connector_funcs = {
-	.reset = tegra_sor_connector_reset,
+	.atomic_create_state = tegra_sor_connector_create_state,
 	.detect = tegra_sor_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.destroy = tegra_output_connector_destroy,
 	.atomic_duplicate_state = tegra_sor_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,

-- 
2.55.0

