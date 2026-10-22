Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792672535;
	b=QPPsztL6Hdgl+d6+X0Uz3HbMpZpKS2vrsvSsNw39k139P4+SudWngI0I2q6do3LI66tY
	 1WY1P3amSTX8JBjkz4NeufNvJvWa4YdzyiqXbySkAqR3P/w04k3twjCX5Ecb+Q9/dM8TY
	 cvRqt6/0MlpooFjMU+E+YQLpoIB3lE7jq8fe3CG35Rv/x/2CquEnx7t6GTjts6xXJGHyG
	 H9Mka0hmhEndgVyYdGpGJl3SaCgzbhS86cjMTBStvIOw7mX2pyjyvLTViYZRK0XOu5KH/
	 1T562FeooOaziSM6rtVAy6nh+5+g+Chz3fcuj//X4xDoMZ/H8VWQ/LGWnlfYGfUqneg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792672535;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=hMrj50O5M9HuGtsiblFoWMD3+CFD0r4aVgzrG/AH8IA=;
	b=vaout1moS5ybPKGUIPHfsNNjr3eLnNWkWiqGblOruX6cJA63X8PKAoGxIqmPrK49fsVo
	 yCTwH/Inom9F7L1E6YkBsHtSg7A1EpyBpIX3aoHgH5AqFWoXptYNNoogjF3YXk1qrT1NO
	 GGMlwFqpqIEtnG/eFyYyysrPEg530bs0z/fNuuBmiAPBHVEfdFuUik4b0qW1E+kE6xVGa
	 +1sumwxT5TX9P6Mm78h/BabaCGeVMzxq4rGH9HKfJGXdmfxlOdftartPhkhT6Ukn4AEV4
	 octnIaC9H0jNYQKtCAP66xMPPpArqFdUbJRsRe1YW46+8AZ+1ThITTUKUWYmxeA0c3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BtxchWsI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B0D606A319
	for <linux-tegra@vger.kernel.org>; Thu, 22 Oct 2026 12:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BtxchWsI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 179081F000C1;
	Thu, 22 Oct 2026 12:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792672534;
	bh=hMrj50O5M9HuGtsiblFoWMD3+CFD0r4aVgzrG/AH8IA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=BtxchWsIP66AuXF3EnVBKUXj++zblj4qKbunn/A3NRJ4olrzCTgGtQeWdhwIwXe5F
	 G59IPP0keooXGdGpj2pUEu9PcHtdMd/dy3PDGByFeP1xXtRW+VwayvTitYocoICGPf
	 JkXVaeDmTV0KRAr+5U52/buvbTu+jfOzOcxiAaX9pgO7mmf4sBgtg0Vy6kOVLhT4iB
	 wrd9B6+ja+uop8gt6VdW/GndfzMwVGFnKgFhVBcyLHIv2MSgDdmYXd07lO6g7Yy5R+
	 kc3BkCjm/TopoeMShlacbJWII3Se+UPp42m1A2eFAcd4dmBN6ANaeVpMQHtxR9gf73
	 Axxm7Sq72uX+g==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 22 Oct 2026 14:31:29 +0200
Subject: [PATCH v2 30/59] drm/tegra: Switch to
 drm_atomic_helper_connector_create_state
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-drm-no-more-connector-reset-v2-30-0b7e4e85b1e8@kernel.org>
References: <20261022-drm-no-more-connector-reset-v2-0-0b7e4e85b1e8@kernel.org>
In-Reply-To: <20261022-drm-no-more-connector-reset-v2-0-0b7e4e85b1e8@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Thierry Reding <thierry.reding@kernel.org>, linux-tegra@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1277; i=mripard@kernel.org;
 h=from:subject:message-id; bh=2aer9JPCC/W3NhlaM6l1g49/HiQe2srZwVXORFQooNo=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFm3mGb1WVS/yXytEFv0p/r7dimltGu9/YLl4j8/Kp26c
 dJkyRmZjqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjARjQzGhjMvo8Xd73L2HXPa
 VJ6esyA9bdOiKpmZxXc/KR1a9+e7c8n56VOdX7nkMj49eyGuxznmEGMN7wyDj8Y1a3w1fDoOnbK
 eNeWRN8O6n9EV5jPWT1f73xdxt81A4k2x57zi0KRgI4cvV/4CAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The tegra connector implementation uses the deprecated
drm_atomic_helper_connector_reset() as its reset hook.

Switch to drm_atomic_helper_connector_create_state() instead.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Thierry Reding <thierry.reding@kernel.org>
Cc: linux-tegra@vger.kernel.org
---
 drivers/gpu/drm/tegra/hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index 0d2c0ab0a63e..f414dd514543 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -1131,8 +1131,8 @@ static void tegra_hdmi_early_unregister(struct drm_connector *connector)
 
 static const struct drm_connector_funcs tegra_hdmi_connector_funcs = {
-	.reset = drm_atomic_helper_connector_reset,
 	.detect = tegra_hdmi_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.destroy = tegra_output_connector_destroy,
+	.atomic_create_state = drm_atomic_helper_connector_create_state,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,

-- 
2.55.0

