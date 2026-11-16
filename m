Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794841852;
	b=YUWLs+7XI6Md8tozEkXmeSl9ZmV30zYSSjSIUw2qHNqtHSUz8Mr2d/YrUWFQRRt+WnQW
	 Pjn74uOBR7/FxbTVXuSe5LZ3+u9eVCurCDEfHkrIJzllCJyKTLsUb5ZWuEM5rkgpOTa+G
	 0LDCd/arZ/ayZl1xAExEKKwj2odDZndk4qJjnajcX7Fm68GiTkh/sK0+k14c21pcZxKfO
	 Iacv3yHe6a/u7AWBYnrlJbMtoK7vSt83LsbQqr/7NVksevKvegWW7EfykkYi65Pb8M9bY
	 Q+e48Ky+Qk6ZiM11mWi30HBLFYhx1OhImiqOXuRjy8DEl+kHsQzB8HZD960KX3Os7tA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794841852;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VfcnZ/HFw1s58SKFpRHNdXm93jOgGRhJ6GdPFfCfrqo=;
	b=oRlCdOdcmZzGsDU/V4rBbSaWCAJFf/922CcaZCUnPsgh0eSsPpW8NchKFuqtB4804h/1
	 EdwL0wsNibdBWwkePpRUaU/NZRMzo16KjmZlf23humyND9IOoIP5BJA+YhcwRbIEmq2dK
	 RN6wsOi/Li5xzdF0apQ20IbhXlCRuNi09RRWRjT2WQKUw+5AJDF+mbi6bEsj+k04LO3Kp
	 HxQwyTmp1DTmKdvY9W2ahGWosv3VxsTz7KrV/hzRioWDwNJ+RCG3D+p1SWp+xuQK75j7G
	 oRjT5a3TVLg9NlmQ/tt7OtKc+LK2/viqIC4fqb3YcG8qEuD3sL0vaCrWL+qT51DN/1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=njO7yCzl;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A027606A896
	for <linux-tegra@vger.kernel.org>; Mon, 16 Nov 2026 15:10:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A027606A896
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=njO7yCzl
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c4d427836e9so470072966b.1
        for <linux-tegra@vger.kernel.org>; Mon, 16 Nov 2026 07:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794841850; x=1795446650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VfcnZ/HFw1s58SKFpRHNdXm93jOgGRhJ6GdPFfCfrqo=;
        b=njO7yCzlalzH1qlfkYZspP8WRhORxmol+v8Ky4DwyKuckxUNI2gDGKKEvuo9pPFKAK
         dVSYiPMiBfwplN8jvi8WnElcqO4tsuvhaZvOdLNse4UOAv8p25eQdptlDq/24ybe8Q+Y
         OpLfivfhzCsW/NzGwpLMHFOEeEPDpDSvR0W/DSXWQeK4zCBoEKTiEM4PdLTS7Aq504MK
         T5zgfOgiSjyP7gJojqdzN3PEY9B1xjr+q4oodcMTs5Di9UxoGxs0D+PVHusZ196M4ky3
         a6sadCwe+esdiOl2mHLAsSazC1bbUsQLrMtpa+ujTAisCFwbOYPjy40JMkgFppn04dmO
         EGGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794841850; x=1795446650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VfcnZ/HFw1s58SKFpRHNdXm93jOgGRhJ6GdPFfCfrqo=;
        b=iiNKlrZE/+qu5w+Zx05iEcEwib2uWjIVRTTKaEqF7D/+PvnM8CH5zHFBvElbrTqJlw
         5PemW2SRU+7ez2e1MR6m+gAfiyuKSgr7YdGVr/vLJ8l2gTFtKHek5yoZsCwFo/j8Xls5
         QeORI6zICfKjvyC3usnvnZpNlqmj15+bO5lsCI6QyWLPFNkNP4imLWGJeULXe0hdVI5u
         1xvc02gdhJm3qSToFv8fupFWQS41E70UAsjH9DS1wlzoxS+9S8KhcaVdQ3+7/f75Khiz
         i2WUWBK5buQMF6bOa9uv4mkvpcyQ0ngJWIDa4U8fnJXLawKnecOTFp1smQ05WC6Ua0c/
         QqkQ==
X-Forwarded-Encrypted: i=1; AL+hErFSI1Wbwl3chOnUGBvBmMIaQdzIpaJzSOlcTXCZLuVRbLLeOLnDF8GYaUpyOXqrRHij42EFZTr9WFXTTg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/HaTwa5bpPLREBXSjHZhd5cD1Vc+OTPnD2cy/lwffMyO6IU3/0
	S/QzWNsjM3pjmtcsBOQ4aBgGn3PO/lchyWgkIAGz/khZCCpz3yR/tUBT
X-Gm-Gg: AYBFou15ckj/C/gH46qHsva8GhSu3oQYVjMGqVeWxJpGDe4hZhIV9zdK9XSktq+mr9m
	BY4YQvcWcgcOl9HonhhRTptwyNUpxmFqTXnPzYNgSqPkavZWYnsPWDvlW5tnn5qZ9CqEU29FSdZ
	cMdfgzSaJ0707/LkDH4YswAy/7tCWwWvIpqqrtenSYeEyHQP1EGqEuGLHdPsj6rpVtfTN6wOH0k
	G11yCZQuIHoxmW0OJgQIjAR8SQl3uTUjCA+PmRjuGVjZ0/rgwVh+LmDniu+y5PXx28jmJgvj+l5
	ZiK82yGkX6BhrJMa1VUl2JG+CCjtIlK2ED15mGG7u7yQow/l0D9J/3/FHphdrgSKkDjhnPMk0sD
	B2s08bko64KbaCK2x2Y68R++H7gP37HH8491idy8PYbQvhBQqCL6Fcrs+LRMM8NWLRt0BFzRpXp
	RNgTSSl4sXn2REX4Ct/NbL/FcyJqBDTKPCjAkAb5hahfwR+xR4Bn/fvEz1fCjUctJ8uEKfFA6rZ
	c9EM52zagt6tM0owSfEjU+pZSmpgupJ8XNihGS9Db3c/qVsYlaAzsvdD2tcv6BEXkWlLqkyzpod
	wxMF5KED/s6WUr4IBVVxwL9YXTQ/HOWX1ZYLm7qGkAxoUtoDVDY94aYIOoVR4uSW4/Gh+Lqf8lB
	987qrLlxrhA==
X-Received: by 2002:a17:907:9629:b0:c50:51e1:c141 with SMTP id a640c23a62f3a-c5096119440mr799887666b.2.1794841850370;
        Mon, 16 Nov 2026 07:10:50 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b93a85sm420868466b.84.2026.11.16.07.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 07:10:49 -0800 (PST)
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
Subject: [PATCH v7 09/12] drm/tegra: Convert to use atomic versions of drm_encoder_helper_funcs
Date: Mon, 16 Nov 2026 17:10:14 +0200
Message-ID: <20261116151017.274764-10-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116151017.274764-1-clamor95@gmail.com>
References: <20261116151017.274764-1-clamor95@gmail.com>
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

