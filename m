Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793887570;
	b=RB8PABWW9DfVFFSvDWkB0gokHFGBGdb4pKqCppruwWAVdQ+9Q0hcmRqcyHDoWoH8R3mC
	 NU9JB7ggFic45XOJsgs1oO5l6KcmFjWv2tzimxzN+oaHm0sLDDbUFzWDMn2aGS6o5dSv0
	 xE62+MafFrTzhSl12tMdVcp8SKq8GlhaFeTQRnK3c1AWlFeLcO/Aq4SfLYxhSv9ApaBFa
	 CR9JKkKkSI2s38ioJ2yRpOoo0lKCu1B+jzam0ti6ixfMKYNWP2ISPp2ZKqixl3S3fzMFy
	 sAaINT2OSpE9XI/3kTADNmmLZBP55eYOfY8okz97NErcuEPwamcMl8th7FjpEImrJ7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887570;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VUzSrw+zuXrM6qoRhN6T0T1mAGNf0n/WTcrzBPM3ZBE=;
	b=R84jji5HYSWG78QoiFaP6LAfeNIbrE1tIiDxmQYNGHmqoWKG+TPbiXvNX1epIgdxyYR9
	 WXkDIu9wn7EAECp8oUtTXXp8AROPzvl/cbjYsMrGk491mDkrzoQ7ZWagioklhLFztU7Sb
	 47I9CaK+SjGA14P4IeomYwiMIqod1pTiwS5afQmSHpUEPctDoNntaTCSxxrAP2/8dx3M4
	 qMzkHAewBcHnqfU144KAgdYC0l6cbjDyDLE165vJ9/FMvdqaExVvlsTYnNHUiAdjzwwgW
	 VzN/xuiVzuzWpyU2etxcAg8GFDUSTEEhFQhN7nY2fhPltCElJLDZcMowE9bEExaCEaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dDOXcivc;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950B2606D82D
	for <linux-tegra@vger.kernel.org>; Thu,  5 Nov 2026 14:06:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 950B2606D82D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dDOXcivc
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e20edd106so1365653f8f.1
        for <linux-tegra@vger.kernel.org>; Thu, 05 Nov 2026 06:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793887568; x=1794492368; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VUzSrw+zuXrM6qoRhN6T0T1mAGNf0n/WTcrzBPM3ZBE=;
        b=dDOXcivcsjNiyv80/+tXe2QhQrrvAxzrO+6TF5jvk3T9XHFkKrVuWNLo+sEL6v6vY4
         Ckt969Bc2XyrRvsvZnq/w2T/lM173IS/NB8ASkAx0FCEUYn/gqGuzLbsazH30prX7KO2
         gdCfx9BKO630CNGbfK+GqzvgK2r5LcjDZAV/SF3rOjE0hanMc94BD9mDViGNjVc6Aps6
         3g7s+OwqCo+9mG/+lIQPQQf/3o9DWfZRnoX5LGFcgcGQ3/27bZCj+aQ4SWIcWqxrpHwJ
         72jQgXbC/FggN1nwvuC08kkiXwqOueQY3tuPQJzU7HKrEGKEWKC+DriAoZXuygOg4W8B
         vF+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793887568; x=1794492368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VUzSrw+zuXrM6qoRhN6T0T1mAGNf0n/WTcrzBPM3ZBE=;
        b=mhHL/unZB29bvM7E0JOx/n4nXE77iHP2WT5zGveB5oOLiZADVXlZxt+a7Ilc0ieJWP
         79cY1oJ9Wt2B4S8lFY8UGVcav9xBSHuPmqUXXaKNMvNi4UbldNImzHO+O8xkWK1KlFNw
         5iTpEjL5aMCDEFicbRxbbL977jT7//LVJ9jErpboTNAitgLdac+PGGSaEmVRWAX3WUpI
         Xu7EQhYbiiW48hF4FXJTcT18tHLA9tr38ImK8yhuMOBc3DvoNlBUNpFMCjCBpwHGfS8n
         SvIdAzj3KL1YVqvGwdCpTZzUCaUML8isWHYcnGUMLO9et81DnHw1SsVL0nMhb3MmU/lr
         szFw==
X-Forwarded-Encrypted: i=1; AKwUvBy497k1vBImwUqoxzD1jUZPTbbuk0AaZOGB/RRmNLYN8NeaQe4AEZlAsoVuNjEffylMjrw5sY0ERjSHxw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/5+oc2MPgwnzqNFrJbSdYmUVSTWzaBMTunntocPgEqPyBZ7svy
	mN5dFZeBJyVyV+ew/x6KTobOMFbGTMW8Ey4ivGcawxk+zRN5aoe9l4Gg
X-Gm-Gg: AYBFou0mZGZlkrGiX7KNhDHy7U+KkY+g1in03RvLRw/DYPcJqpXVnujwd8GAUoXimZR
	WKK91ocKCivzG3MgwAnUtU5h1BLXbORw4kMyawpi0vnYvkglW8PHJyEqwUoZ/xQbR2CTnbjsvFz
	DYZT0pLnNnL1fypldWxcDxFVy/en34c0L8n6IP+jVILX5Hr4NU1Fx8wpFWIkla+EPCfjIZe1Kpz
	nN0XSh2NVKminoOtN+jhh8sIu7JUzkpj93LY8/E6lsnvLskL2wRaDmaH7R/JG19bJIm/WeEM4YU
	A3JNmkwyE+baQCg0I6a4rA4scSr6lBM7YlFbNk2gJejAKeBjJhzeQddHSZczivnm85ExGAn10Ll
	LEZ/2sNkj7BXeVor24yMGaJujn8aKt8+Nt0JM8/solCNHGUxrbI9ykhxTJQO18msggp0cNdrqCs
	aXZ6jV+7jOMGGOv/de4PU6W0Qyb/urnlZw+dPwKarjUALcj40frU72Jv2pCqNEqNiAQVevFNqwJ
	QJo8T1eg2huy7DZLFzrkoOK4I36/C14cHsnzkdUB5rUM5vwaKUIYSzYHycNUHuOhEhcbF4cM0+F
	xDzCE/vfhkUGD5p35lCtcAR8YTxKrJ8jWLmXv4QwwqhK6YT4HzqFWPakLx/5f5C5v57spAs=
X-Received: by 2002:a05:6000:4021:b0:48e:4300:c70e with SMTP id ffacd0b85a97d-48e6e304059mr39696607f8f.46.1793887567747;
        Thu, 05 Nov 2026 06:06:07 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed92a753sm11454111f8f.45.2026.11.05.06.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 06:06:06 -0800 (PST)
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
Subject: [PATCH v6 07/10] drm/tegra: Convert to use atomic versions of drm_encoder_helper_funcs
Date: Thu,  5 Nov 2026 16:05:07 +0200
Message-ID: <20261105140510.165165-8-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105140510.165165-1-clamor95@gmail.com>
References: <20261105140510.165165-1-clamor95@gmail.com>
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
index fc6eb7410045c..ef7e804ae55d1 100644
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

