Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795335549;
	b=o3Adx/0tEaSFYEx95WES8RiinAfPIYHoRGy7CQqViagiWytpP8XaXWLjeAmcDPWGsUZl
	 XXd9ZYtXfXMZQTJwaPnpIe7jJirRBqFaJB0efbPBYU9J7AU5YvHLk+idIVKnanet4mCco
	 VAdoJKivKyR8dAcuQ9RS894NISYBWZQlg8WofB4wN3i8a8hMKvns43EYB4j89+LJZnrXa
	 UEl5EGpcaspzKcAHLVYd9tBwbAvPiGgvjYyNbHsGn1rtBlnQqvk5LfNlMSCdftRo0nvV3
	 RrKRco0zrmqrewphNcisVDvWTvHfIa1mqK8X50j/TxRH+gJNbPx0gFl0gMzV5/0DVmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795335549;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VfcnZ/HFw1s58SKFpRHNdXm93jOgGRhJ6GdPFfCfrqo=;
	b=CHPh+iP78T2Ix+AorcOPPJt+ccFs7+rS4aVD2ucIDwYuaqDsE1+xAHOnYCAwyiysBLdX
	 StyC8vaWWtgvtpxKLsZfDz9uK/61RHrXoRbrntjpBZTt86qs9KFntAZY4jWeNeMG3xevr
	 sLs1t0htKt82RushQSWvNmS06/QHGFJLHdT5iKyuuRLFDxjfEtvC0SRH/Pmd4uj4p5Z2m
	 k4QMpYdq/X89Z4M7kMBS9IDTj6F6blc8bODtbPt4zDgVifZhccZJ9DDcYF32NM3LVdRah
	 cmcWKiqvIiR2LNM+SG5uaAhmc3GEKMkItV8cVlu6Ri0o3UxQ/SaUP2+VUAcDjOqNlFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SvD3hzCS;
	arc=none smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2915D606A32C
	for <linux-tegra@vger.kernel.org>; Sun, 22 Nov 2026 08:19:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2915D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SvD3hzCS
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b8a1f59d5eso2706416a12.3
        for <linux-tegra@vger.kernel.org>; Sun, 22 Nov 2026 00:19:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795335547; x=1795940347; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VfcnZ/HFw1s58SKFpRHNdXm93jOgGRhJ6GdPFfCfrqo=;
        b=SvD3hzCSvPZQwkoX4FcghI5fseAbTbHClhOYz8rkLk8Sc5AKQTVPF6eK6H8cdasJuW
         cYMn+8SuHPmQ4NGQ6KCOcRVSw33EGaNtUTmJ5dj6PeF+YrzO910ydCMV9/HvDFjghLvf
         OiLVv28L5QvOgqnEM6VaNGS8M6syzYJ1jrN+z5g95PUwjBOws2g07Ezic10VOYK3ixu+
         kQ9H/FUCzxEApnNlnGpyP+YEZlfgK6lJQFItXitFZ2YHfH8B4+DVOA2l2S/jugaZZPXU
         OmA2NawbC8vVth5Nmvh9lPI0KGEZ97ySgMwN0Nmtc722aVBkc+Uys/7C8OibdigUb7X4
         9j0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795335547; x=1795940347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VfcnZ/HFw1s58SKFpRHNdXm93jOgGRhJ6GdPFfCfrqo=;
        b=eg2wPM5aokod4JGQn6GWuaDcG9gBh8vi0but6AkV4cVgunHfussOTsjbfRYQOfdUCD
         vePGJsYnp++NchREFIUEJNfQKmGa7RDecynVE66QGkT9zCTPCiI5pWMhn5MMfXGfOahC
         LCN0zCGzFkcT8EICcVGcLUZKmMDos60k2HOyrjjBsi5fGvu5wCmEO4rz0uwTLbAcYuWx
         LOetkVzWXxGXdRJvlyTeYWC2DpoITsZnv8TpLJyV43krdF8iadXhj9MKJJlrcHmQhXL4
         ZA0MJFMo0gZs5PfUWvJfukAc33lrbYcI9+QpvxP1bN8l082fyqbeB/3XFonLvpJZW3fQ
         i5QQ==
X-Forwarded-Encrypted: i=1; AL+hErG+/PNEAZmguNNMPbN4Dmd5OQi/RrNFQ54oAbjbOVKei4r/fwzNSMtJBNn5s5eiywLsW5IAY474A1GmVg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+Cvwi3hrSZ9mQnhF3K+d6wEbJYSUIgovILH48/gk0olQwp6iHm
	/ZN1WplmkAQMZmaN0Q9X+xm+wvxAVGRGxbN3/3sHTOqEth85WlpJzJXW
X-Gm-Gg: AZFdTZd9tCxChgXFHt9su9/htXTphyc8tjtqpcmDom++jAGaa+vhClPIpHIC+tLD5wC
	uQ06T197Ph5WVfdN3Wl1ASYP90oTP/yZlJLIvP+BJZvlnvK77SyntLvC1tshsOeihB7hN5PXQ7c
	p9gvrZyvl4ySj7xpWyYHInnylfdbzNYRMwQsWvxk3DFPyI2VEemzJRwMk+ARzLnJKL8lq4Gje1E
	VADn/ZTE1ujoDY85B0R30sC9a0zSs3eaCvTty/yST9lPr5597f3n3GgY2FbUYsO1XgZ7d/L8GnY
	kBJXUSWdG10Tdtmdfe+jhhIPaKjSnt79Huo0n7sDGOHNhsKOgn8a5f5k6drQf7S9csipCZz8A+a
	wZVR5bNpSUb0GoESkB06ZzVRqdXaDJ+81I1pGRiyOw8ues9Egr0wmXTwHITgRPoo/J41d0i0Bex
	eS939GWKqocyRYKGr7VrAQMG756OtAMht3A+d8EhG27rPyV6/ALGiHUeCkrbUx+SwU1rA6SPD9l
	tx+VsaIgwtgqZ6Ows8+5vHUdmQqYJBW5ZEO2TsrPQTxJVPMJw9sCbBoay+m4mVlCL9buXKtQEjz
	0UjqWIls/SF0cp7G5dTVoI++SLtAjWYb60dRvEXiN56zBiFM72pgngCFjcYnA7MbTGv7+JeOUTL
	RJDKwFDPqdL/7gA+YWsZuhpoFWJmJTMU=
X-Received: by 2002:a05:6402:e87:b0:6ba:85c8:9fd3 with SMTP id 4fb4d7f45d1cf-6ba85c8a3ccmr1465163a12.31.1795335547456;
        Sun, 22 Nov 2026 00:19:07 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370e8ad0sm3617167a12.18.2026.11.22.00.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 00:19:05 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 09/12] drm/tegra: Convert to use atomic versions of drm_encoder_helper_funcs
Date: Sun, 22 Nov 2026 10:18:17 +0200
Message-ID: <20261122081820.53199-10-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122081820.53199-1-clamor95@gmail.com>
References: <20261122081820.53199-1-clamor95@gmail.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch to using the atomic versions of the enable() and disable()
operations.

This is required for acquiring the next bridge state without causing
crashes, in order to properly set up the encoder.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/gpu/drm/tegra/dsi.c  | 20 +++++++++++++++-----
 drivers/gpu/drm/tegra/hdmi.c | 20 +++++++++++++++-----
 drivers/gpu/drm/tegra/rgb.c  | 23 +++++++++++++++++------
 drivers/gpu/drm/tegra/sor.c  | 18 +++++++++++++-----
 4 files changed, 60 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index 6d6adc485e51e..cd61070072beb 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -855,7 +855,8 @@ static void tegra_dsi_unprepare(struct tegra_dsi *dsi)
 		dev_err(dsi->dev, "failed to suspend: %d\n", err);
 }
 
-static void tegra_dsi_encoder_disable(struct drm_encoder *encoder)
+static void tegra_dsi_encoder_disable(struct drm_encoder *encoder,
+				      struct drm_atomic_commit *comm_state)
 {
 	struct tegra_output *output = encoder_to_output(encoder);
 	struct tegra_dc *dc = to_tegra_dc(encoder->crtc);
@@ -919,16 +920,25 @@ static int tegra_dsi_prepare(struct tegra_dsi *dsi)
 	return 0;
 }
 
-static void tegra_dsi_encoder_enable(struct drm_encoder *encoder)
+static void tegra_dsi_encoder_enable(struct drm_encoder *encoder,
+				     struct drm_atomic_commit *comm_state)
 {
-	struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
 	struct tegra_output *output = encoder_to_output(encoder);
 	struct tegra_dc *dc = to_tegra_dc(encoder->crtc);
+	struct drm_connector_state *conn_state;
 	struct tegra_dsi *dsi = to_dsi(output);
+	struct drm_crtc_state *crtc_state;
+	struct drm_connector *connector;
 	struct tegra_dsi_state *state;
+	struct drm_display_mode *mode;
 	u32 value;
 	int err;
 
+	connector = drm_atomic_get_new_connector_for_encoder(comm_state, encoder);
+	conn_state = drm_atomic_get_new_connector_state(comm_state, connector);
+	crtc_state = drm_atomic_get_new_crtc_state(comm_state, conn_state->crtc);
+	mode = &crtc_state->adjusted_mode;
+
 	err = tegra_dsi_prepare(dsi);
 	if (err < 0) {
 		dev_err(dsi->dev, "failed to prepare: %d\n", err);
@@ -1059,8 +1069,8 @@ static const struct drm_encoder_funcs tegra_dsi_encoder_funcs = {
 };
 
 static const struct drm_encoder_helper_funcs tegra_dsi_encoder_helper_funcs = {
-	.disable = tegra_dsi_encoder_disable,
-	.enable = tegra_dsi_encoder_enable,
+	.atomic_disable = tegra_dsi_encoder_disable,
+	.atomic_enable = tegra_dsi_encoder_enable,
 	.atomic_check = tegra_dsi_encoder_atomic_check,
 };
 
diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index e8c4347f09e69..a78279810dd82 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -1166,7 +1166,8 @@ tegra_hdmi_connector_helper_funcs = {
 	.mode_valid = tegra_hdmi_connector_mode_valid,
 };
 
-static void tegra_hdmi_encoder_disable(struct drm_encoder *encoder)
+static void tegra_hdmi_encoder_disable(struct drm_encoder *encoder,
+				       struct drm_atomic_commit *comm_state)
 {
 	struct tegra_output *output = encoder_to_output(encoder);
 	struct tegra_dc *dc = to_tegra_dc(encoder->crtc);
@@ -1209,18 +1210,27 @@ static void tegra_hdmi_encoder_disable(struct drm_encoder *encoder)
 		dev_err(hdmi->dev, "failed to suspend: %d\n", err);
 }
 
-static void tegra_hdmi_encoder_enable(struct drm_encoder *encoder)
+static void tegra_hdmi_encoder_enable(struct drm_encoder *encoder,
+				      struct drm_atomic_commit *comm_state)
 {
-	struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
 	unsigned int h_sync_width, h_front_porch, h_back_porch, i, rekey;
 	struct tegra_output *output = encoder_to_output(encoder);
 	struct tegra_dc *dc = to_tegra_dc(encoder->crtc);
 	struct tegra_hdmi *hdmi = to_hdmi(output);
+	struct drm_connector_state *conn_state;
+	struct drm_crtc_state *crtc_state;
 	unsigned int pulse_start, div82;
+	struct drm_connector *connector;
+	struct drm_display_mode *mode;
 	int retries = 1000;
 	u32 value;
 	int err;
 
+	connector = drm_atomic_get_new_connector_for_encoder(comm_state, encoder);
+	conn_state = drm_atomic_get_new_connector_state(comm_state, connector);
+	crtc_state = drm_atomic_get_new_crtc_state(comm_state, conn_state->crtc);
+	mode = &crtc_state->adjusted_mode;
+
 	err = host1x_client_resume(&hdmi->client);
 	if (err < 0) {
 		dev_err(hdmi->dev, "failed to resume: %d\n", err);
@@ -1460,8 +1470,8 @@ tegra_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
 }
 
 static const struct drm_encoder_helper_funcs tegra_hdmi_encoder_helper_funcs = {
-	.disable = tegra_hdmi_encoder_disable,
-	.enable = tegra_hdmi_encoder_enable,
+	.atomic_disable = tegra_hdmi_encoder_disable,
+	.atomic_enable = tegra_hdmi_encoder_enable,
 	.atomic_check = tegra_hdmi_encoder_atomic_check,
 };
 
diff --git a/drivers/gpu/drm/tegra/rgb.c b/drivers/gpu/drm/tegra/rgb.c
index 227a178f761bd..d48d498068ac8 100644
--- a/drivers/gpu/drm/tegra/rgb.c
+++ b/drivers/gpu/drm/tegra/rgb.c
@@ -90,7 +90,8 @@ static void tegra_dc_write_regs(struct tegra_dc *dc,
 		tegra_dc_writel(dc, table[i].value, table[i].offset);
 }
 
-static void tegra_rgb_encoder_disable(struct drm_encoder *encoder)
+static void tegra_rgb_encoder_disable(struct drm_encoder *encoder,
+				      struct drm_atomic_commit *state)
 {
 	struct tegra_output *output = encoder_to_output(encoder);
 	struct tegra_rgb *rgb = to_rgb(output);
@@ -99,12 +100,22 @@ static void tegra_rgb_encoder_disable(struct drm_encoder *encoder)
 	tegra_dc_commit(rgb->dc);
 }
 
-static void tegra_rgb_encoder_enable(struct drm_encoder *encoder)
+static void tegra_rgb_encoder_enable(struct drm_encoder *encoder,
+				     struct drm_atomic_commit *state)
 {
-	struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
 	struct tegra_output *output = encoder_to_output(encoder);
 	struct tegra_rgb *rgb = to_rgb(output);
-	u32 value;
+	struct drm_connector_state *conn_state;
+	struct drm_crtc_state *crtc_state;
+	struct drm_connector *connector;
+	struct drm_display_mode *mode;
+	u32 bus_flags, value;
+
+	/* Get mode flags */
+	connector = drm_atomic_get_new_connector_for_encoder(state, encoder);
+	conn_state = drm_atomic_get_new_connector_state(state, connector);
+	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
+	mode = &crtc_state->adjusted_mode;
 
 	tegra_dc_write_regs(rgb->dc, rgb_enable, ARRAY_SIZE(rgb_enable));
 
@@ -201,8 +212,8 @@ static const struct drm_encoder_funcs tegra_rgb_encoder_funcs = {
 };
 
 static const struct drm_encoder_helper_funcs tegra_rgb_encoder_helper_funcs = {
-	.disable = tegra_rgb_encoder_disable,
-	.enable = tegra_rgb_encoder_enable,
+	.atomic_disable = tegra_rgb_encoder_disable,
+	.atomic_enable = tegra_rgb_encoder_enable,
 	.atomic_check = tegra_rgb_encoder_atomic_check,
 };
 
diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index ebac9068b670f..45a9ea94c4355 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -2203,7 +2203,8 @@ static void tegra_sor_hdmi_scdc_start(struct tegra_sor *sor)
 	}
 }
 
-static void tegra_sor_hdmi_disable(struct drm_encoder *encoder)
+static void tegra_sor_hdmi_disable(struct drm_encoder *encoder,
+				   struct drm_atomic_commit *comm_state)
 {
 	struct tegra_output *output = encoder_to_output(encoder);
 	struct tegra_dc *dc = to_tegra_dc(encoder->crtc);
@@ -2244,13 +2245,17 @@ static void tegra_sor_hdmi_disable(struct drm_encoder *encoder)
 	host1x_client_suspend(&sor->client);
 }
 
-static void tegra_sor_hdmi_enable(struct drm_encoder *encoder)
+static void tegra_sor_hdmi_enable(struct drm_encoder *encoder,
+				  struct drm_atomic_commit *comm_state)
 {
 	struct tegra_output *output = encoder_to_output(encoder);
 	unsigned int h_ref_to_sync = 1, pulse_start, max_ac;
 	struct tegra_dc *dc = to_tegra_dc(encoder->crtc);
 	struct tegra_sor_hdmi_settings *settings;
+	struct drm_connector_state *conn_state;
 	struct tegra_sor *sor = to_sor(output);
+	struct drm_crtc_state *crtc_state;
+	struct drm_connector *connector;
 	struct tegra_sor_state *state;
 	struct drm_display_mode *mode;
 	unsigned long rate, pclk;
@@ -2259,7 +2264,10 @@ static void tegra_sor_hdmi_enable(struct drm_encoder *encoder)
 	int err;
 
 	state = to_sor_state(output->connector.state);
-	mode = &encoder->crtc->state->adjusted_mode;
+	connector = drm_atomic_get_new_connector_for_encoder(comm_state, encoder);
+	conn_state = drm_atomic_get_new_connector_state(comm_state, connector);
+	crtc_state = drm_atomic_get_new_crtc_state(comm_state, conn_state->crtc);
+	mode = &crtc_state->adjusted_mode;
 	pclk = mode->clock * 1000;
 
 	err = host1x_client_resume(&sor->client);
@@ -2657,8 +2665,8 @@ static void tegra_sor_hdmi_enable(struct drm_encoder *encoder)
 }
 
 static const struct drm_encoder_helper_funcs tegra_sor_hdmi_helpers = {
-	.disable = tegra_sor_hdmi_disable,
-	.enable = tegra_sor_hdmi_enable,
+	.atomic_disable = tegra_sor_hdmi_disable,
+	.atomic_enable = tegra_sor_hdmi_enable,
 	.atomic_check = tegra_sor_encoder_atomic_check,
 };
 
-- 
2.53.0

