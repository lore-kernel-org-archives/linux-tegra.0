Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793287795;
	b=N8ergOAIq0zqZQTHv+/0BJYonNZ9L3Z4K9YW1AIayTGigao5jMMRIK8oZM+flkzo4bHT
	 6VO+lfSBmbQSAAXVg8j0EkJJmPKDc4a2CfPbOj9tSSWr2RoT8cGhUWpywTZ39E/Q3vIaw
	 Jlf3yFBVv0FpQQVaYJSM5TJC6AOO0U+UeOD0XK04q+XHTnLl4XSIVy+RuePlT5mR5QZ5S
	 1vZn761QUjGes4yrZCPAE7JwEg5SfN2ld3hkGk1ZTEWB2Gh24i+Y25c2janr8smbCNGeh
	 5lRvtZSNt1b5vwnGOaqWABvF+4SMJ25XJongbRr3l8UOVHX4RgQj6V7W7YEZth1V3IA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793287795;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9M4G56dPBxxYm4UBeJKw22tO2je0w07E2UABc7EU4Ug=;
	b=VkmI6Lr7cDeSfv6isWT9r3c2BMDDWqxCvClbI8+FyZc8AqWStasEuf0D3us8D6X/oJHq
	 lx4kYNgocSeNIX/EDmSzUgirf/XlvL/3f5kYxrk+5pnavkxc0LqhyeJIaAKM90aDKoPzs
	 quMYwrtOks3ujlLhvbe5148Nl+oJu/JS/xOL/IgpmWLJ79XM75WUGh8o5RGf/e5OdJJ9G
	 cwsLILvgBcZZrme5F/BRbEiKoRLSYr8/NsWeUrZxTg1SxorOcBq3JLipWbQeUG1HP7zbP
	 bXssDUr43dUUgWg38E4egVQCqLUliX9PCCIXSeEk++Sb5rK211HyCvzVRgUEgIuS7zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TIFfsiqO;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94EA4606A338
	for <linux-tegra@vger.kernel.org>; Thu, 29 Oct 2026 15:29:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94EA4606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TIFfsiqO
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c40e30c26a4so178761466b.0
        for <linux-tegra@vger.kernel.org>; Thu, 29 Oct 2026 08:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793287785; x=1793892585; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9M4G56dPBxxYm4UBeJKw22tO2je0w07E2UABc7EU4Ug=;
        b=TIFfsiqOBrKM7jfT1jZW7jF9oOu2LVQdiJQQEf1zIAw83mrHfgK3Fi3rAqcL5gtQJz
         nHfWIWa1yq6rl53dgqZ/jq8/gqri0SeYjn1iKJ2KY3p4c6ZDxX6VXwxmFTiBUV7rEoWU
         F2qqypeRD2W41n2R9cxWkKAwWyc32WOIwDzD/yhSrq0eid0XueNJcFzByyzB6+hN39Fk
         lWZcLBa3blTCZHnXhaMtAYC0Lw9w99rMDjmbRTQL6wVdG9pB59GKpnKQRRwqKQBTK6ts
         RxnkP/+/Xq/VqRdIhZH891x3BQmPTfqZDTq9xCxISHDyecsOJEoBF+MmfKbkVAQthNaj
         aD6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793287785; x=1793892585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9M4G56dPBxxYm4UBeJKw22tO2je0w07E2UABc7EU4Ug=;
        b=YrDzSTAMpFO/zgYsF2eKLM3YNEdpUVW0321MGbB7E06im6hlPux8cB0bRKUqS+pKrm
         JW4LvOkjwZCS2eewKAuaSGXkSvv4Q+oYwWXxh4/eXEmve6qMvaKLTgyeipcaY9ygM0cP
         SE8pTDFG6jFsOIfsBK6X3fIZ3Im9sndk8H5ZlsbQbv6ZZ3InE79FP0BVgrW59Ddzue4i
         S0OtwL0v43tBfXzoG+sXKgnZb6CM43RSCvE83mncYZZ0WdxZxX94q7PUF20+xlbc0xMk
         meHIarjHhQtw/ogFOl97trzDVaRNA/26MrJufMbUhgLHKXI/EkjrNkd/hu6g63fXNYJ0
         3KKg==
X-Forwarded-Encrypted: i=1; AKwUvByTofkoYE69fgKOprIOjvvxml9GtXOZMcVYZlN47fXCL+zA4gN8QP9KWks6VHkJumfToaK2tDrgYqMEoA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLYiiwrr7M1/tDmcbZT/yMf3VqhsXsGY/o9VMc0yMsbMUi8TxOt
	ZL8ZeHXpNzQ4dcxU6TUns9YTyekL7iSNs5bpa0POokenTYcVxtZWcZNC
X-Gm-Gg: AYBFou0VKJM+JxV5H/P3sc/YtVUm7wkoVP54afLrrZdJ9ww4WuQ8tuVzTn4aOvEnLeI
	XW1hlsZKNsbcRfvSVThyztpa8ntu9qN0S95XDlLWmSzlUZCMJsUf5fZ6BEzxbLnzGZtwTRDnUda
	sLKLDLMJWcnwgoPPkW4dv9c+gwnHwGpAq4cM+PQ+aFBAUnsP1/xu2jPtBkkW2rhCIKXA3f76xET
	bg9WRhOkI8cDzy7qzqEcLRn3k1N9+gn7AWLjTQy61qGS4v6nEkwfO5HJ7BNPqPHSr88CYGpUVlQ
	q6Ku72krPl45bbSTWYvp15oRysRX05iF4dUKRw0He/5DYhbQiU/9pTDlSVhU5ZsYynJ9G/meV3T
	VU5nv1Vgkp36AQbQYlrYcaFS9q0pAjwRI5e2tKFNyxTMcilVnbTCEj8HjAcTZrkrZ1jj3FRUxPO
	TUXhDUke4okcYhF6mK3Auz2KoWtlUGkfBfEj9RCb4RxxmgLLRstBODWT21Nura5B8JIj1V4XJxr
	3mWeb+7D74dwt6MPIDRAk90B2tJ8ZF5KuUpFdh0gVVmFGLVylLuVBxptA3OCY3AwgpuD5r3dODC
	llCwhF1O1qgkTozJENoLS9psTWaLkYNWNfb7V4KcYSL70oHdpqMFfpYhDbciKPg/4AGyHIxx
X-Received: by 2002:a17:906:f59c:b0:c3e:2224:1b86 with SMTP id a640c23a62f3a-c49d10eee61mr278811366b.2.1793287784835;
        Thu, 29 Oct 2026 08:29:44 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4ca27984f8sm1252166b.80.2026.10.29.08.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 08:29:44 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v5 08/11] drm/tegra: Convert to use atomic versions of drm_encoder_helper_funcs
Date: Thu, 29 Oct 2026 17:29:06 +0200
Message-ID: <20261029152909.234584-9-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261029152909.234584-1-clamor95@gmail.com>
References: <20261029152909.234584-1-clamor95@gmail.com>
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

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/gpu/drm/tegra/dsi.c  | 20 +++++++++++++++-----
 drivers/gpu/drm/tegra/hdmi.c | 20 +++++++++++++++-----
 drivers/gpu/drm/tegra/rgb.c  | 23 +++++++++++++++++------
 drivers/gpu/drm/tegra/sor.c  | 18 +++++++++++++-----
 4 files changed, 60 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index a4c0c63bbe567..202aed6a6fc12 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -856,7 +856,8 @@ static void tegra_dsi_unprepare(struct tegra_dsi *dsi)
 		dev_err(dsi->dev, "failed to suspend: %d\n", err);
 }
 
-static void tegra_dsi_encoder_disable(struct drm_encoder *encoder)
+static void tegra_dsi_encoder_disable(struct drm_encoder *encoder,
+				      struct drm_atomic_commit *comm_state)
 {
 	struct tegra_output *output = encoder_to_output(encoder);
 	struct tegra_dc *dc = to_tegra_dc(encoder->crtc);
@@ -920,16 +921,25 @@ static int tegra_dsi_prepare(struct tegra_dsi *dsi)
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
@@ -1060,8 +1070,8 @@ static const struct drm_encoder_funcs tegra_dsi_encoder_funcs = {
 };
 
 static const struct drm_encoder_helper_funcs tegra_dsi_encoder_helper_funcs = {
-	.disable = tegra_dsi_encoder_disable,
-	.enable = tegra_dsi_encoder_enable,
+	.atomic_disable = tegra_dsi_encoder_disable,
+	.atomic_enable = tegra_dsi_encoder_enable,
 	.atomic_check = tegra_dsi_encoder_atomic_check,
 };
 
diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index c0845bb45bb15..0a2420095d061 100644
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
index 01475995d9cc8..7dea0cac61233 100644
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
index ab81e412e05f1..85cd5c8cbef4e 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -2206,7 +2206,8 @@ static void tegra_sor_hdmi_scdc_start(struct tegra_sor *sor)
 	}
 }
 
-static void tegra_sor_hdmi_disable(struct drm_encoder *encoder)
+static void tegra_sor_hdmi_disable(struct drm_encoder *encoder,
+				   struct drm_atomic_commit *comm_state)
 {
 	struct tegra_output *output = encoder_to_output(encoder);
 	struct tegra_dc *dc = to_tegra_dc(encoder->crtc);
@@ -2247,13 +2248,17 @@ static void tegra_sor_hdmi_disable(struct drm_encoder *encoder)
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
@@ -2262,7 +2267,10 @@ static void tegra_sor_hdmi_enable(struct drm_encoder *encoder)
 	int err;
 
 	state = to_sor_state(output->connector.state);
-	mode = &encoder->crtc->state->adjusted_mode;
+	connector = drm_atomic_get_new_connector_for_encoder(comm_state, encoder);
+	conn_state = drm_atomic_get_new_connector_state(comm_state, connector);
+	crtc_state = drm_atomic_get_new_crtc_state(comm_state, conn_state->crtc);
+	mode = &crtc_state->adjusted_mode;
 	pclk = mode->clock * 1000;
 
 	err = host1x_client_resume(&sor->client);
@@ -2660,8 +2668,8 @@ static void tegra_sor_hdmi_enable(struct drm_encoder *encoder)
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

