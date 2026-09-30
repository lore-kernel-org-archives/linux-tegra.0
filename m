Received: from mail-wr2-f38.google.com (mail-wr2-f38.google.com [74.125.225.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CDC7366057
	for <linux-tegra@vger.kernel.org>; Wed, 30 Sep 2026 07:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790751969; cv=none; b=IAnWDXMBD8ADoCQMZbmlaFnULx+ioWBFcNvUbPLU8e264xGGPZj8cEpp/HRaLijnmMQgFbxWVYNlvzkfiajn5J0H11HqJ48BIvZj819s26bixWkej9sZyMtKXhtbPwuXF94Yg+M4gdhJyK3HGIS2ZJ9o4a32CDpWPukgmbwskMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790751969; c=relaxed/simple;
	bh=JJGLHM3hPZ+UMs4RGoCV5Erf8UQ5+s0zcBkra5RR7XA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qO0fiIjavzkCAAKDaXeu/Y6/D+dAXXm9fqaTILOOU/JZl7tom8XXkiROkSTLNp5V9hd4rhvg9CJu57Svg7hCpEDOIeQGySmjBIvWNTukccG7N07ernKe0A0Bh1AxQs1mZE5sF+cuLzsSM+Kpvbq0xkdwtyp8HDU3Rnqxd1HTPyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SsADqIBw; arc=none smtp.client-ip=74.125.225.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SsADqIBw"
Received: by mail-wr2-f38.google.com with SMTP id ffacd0b85a97d-482f6350f89so3051861f8f.3
        for <linux-tegra@vger.kernel.org>; Wed, 30 Sep 2026 00:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790751959; x=1791356759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u+ufq/9OYpFWz0jYyxkMsrt/5JaGVR8WMolNjJI/6Zo=;
        b=SsADqIBwdzNN20FyxDmfLx9G0nToeLI0s5GcQ75hwCjgDIG8sjIPVgvjTfgETk//gl
         dLI/x9lZKzY+FlVuvPo4oOqmGKwmRmCrqwFLaAQcmiVtSSQsbZAdZA9xgznwEHZH3Uvu
         +77/x0OMFlsWsFeLRZ9ZUTZOA0uqGtXuc/npHry8hjBZZEvA/lStALffKYbdOHQUmaOm
         OmCYpxWIuRG8KLYD74/a2QLrbAcrnsZ+rkxRQBYYbgr9iStPJ/d/vMYiwemwjI5bgdgX
         icB5ySr7flfuDNIR050MTEzFtnxlSBjY0I7mDtt9ko6RalWRX8TG/84O4gVofRku4KW1
         VCQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790751959; x=1791356759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u+ufq/9OYpFWz0jYyxkMsrt/5JaGVR8WMolNjJI/6Zo=;
        b=QiSF3+w3Kn2ZuIsyD7aWznGpt6W1JaXY3hcSc6EuZ6qZ6AFCvylBdByvnKoB7UGeqt
         xtTk9mbbIKiIbd+nC4QnvtuFErylR6NnQ/NBpXKGaRL95OoicG7pMbJGQ62JDTuM0gJV
         5W7ciJNgDppS/XK5Qo96TuaMfEStNckv2iLz02hCBHXIfY9ZpRec/RLXjeNMjVw8iHko
         uxZu1eLoaO1M71OVwxak9Mm70StSuamEZC1i+62xZDJ+5U7lJBUF890t0VxZpJJyEkEw
         aaHxIv1wUPjIc5kRsrdbLiBh3400JVOAvK0fepavzluNaW3ePryHvrPyiBZgbGFAMYzk
         GRng==
X-Forwarded-Encrypted: i=1; AKwUvBzHs/NnGKFQH4UO2rKksJvpoMt13k7+Bx3zrZcwsC6pAmEMuBz9VmlD+RXefrU8s9CAveCgNbVUmFd8RQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYIn0R7LUtqptG98U4wGg84/xmO2Px7fbAe53/mrCUt/PG2LDXwR
	QNMKhn8aegxqVzbAP4BqeR3atHuZT92MFhjXonTf065KnmXwcSCMhZrb
X-Gm-Gg: AYBFou1MJ9dMJJFr/TMNVlxxTnEvlu06eUcJ+tn8acY8gxHlpixHUl942KnTOEqyqr1
	u/XK3F4+XpMNIapUE+b5oSYmsJbHPe2OubnZk2aZ+hZKlrxNv0qio6kE+Wru2+1Dtu1iXF2uQA7
	Im9PMMkNlX1WhEN9U9jd9YgLpSDNkfo59makMn0SFffHF1+A2pOUPsrp6euGJ26Zr0hToCtGSpr
	FWSNk7fbdCCs0JHIxn7yRW6eHXsTFULKOth8y5DMrBSBOQRStsgFi0pQYEsG9hcVR5phQQaGN+t
	vVuJ7SNG3n67AnOTjMYnmDUPNbp70fN1mIDT1P2Msvgzjbyjqn9KksJS4ROWbLABSaUnIyMOSKz
	YhjmhX2t/4hE5l32IJyWV1aY+FXzvWU1ZcpQt7AODV8RrgctSq0KoT27w90TG3/2Hml0bHl1j4/
	Mke7N1Mx+tQHS8QIVT5YZfJ5VQ+cZQIlERrf+mW/94sPm6NEhwsB3J21tux5hg0OU2WspR9Gc4d
	RJQiD4zdF/YBkjiv3jh8M41x8MXNq4=
X-Received: by 2002:adf:e191:0:b0:487:aa6:c90d with SMTP id ffacd0b85a97d-48b0244dde4mr898761f8f.1.1790751956592;
        Wed, 30 Sep 2026 00:05:56 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b029f5bcdsm1145150f8f.27.2026.09.30.00.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 00:05:55 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
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
Subject: [PATCH v1 1/6] drm/tegra: dc: Expand available registers layouts
Date: Wed, 30 Sep 2026 10:05:30 +0300
Message-ID: <20260930070535.47130-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260930070535.47130-1-clamor95@gmail.com>
References: <20260930070535.47130-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Expand existing DC register definitions with additional fields in
preparation for adding the 8-bit CPU interface.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/gpu/drm/tegra/dc.c |  3 ++-
 drivers/gpu/drm/tegra/dc.h | 54 ++++++++++++++++++++++++++++++++++----
 2 files changed, 51 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index b0bfa946e6979..5c67928bcabfa 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -2384,7 +2384,8 @@ static void tegra_crtc_atomic_enable(struct drm_crtc *crtc,
 
 	if (dc->rgb) {
 		/* XXX: parameterize? */
-		value = SC0_H_QUALIFIER_NONE | SC1_H_QUALIFIER_NONE;
+		value = SC0_H_QUALIFIER(SC_H_QUALIFIER_NONE) |
+			SC1_H_QUALIFIER(SC_H_QUALIFIER_NONE);
 		tegra_dc_writel(dc, value, DC_DISP_SHIFT_CLOCK_OPTIONS);
 	}
 
diff --git a/drivers/gpu/drm/tegra/dc.h b/drivers/gpu/drm/tegra/dc.h
index 0cb0515968b35..5679e1ca0c2a5 100644
--- a/drivers/gpu/drm/tegra/dc.h
+++ b/drivers/gpu/drm/tegra/dc.h
@@ -274,8 +274,11 @@ int tegra_dc_rgb_exit(struct tegra_dc *dc);
 #define DC_COM_CRC_CHECKSUM			0x301
 #define DC_COM_PIN_OUTPUT_ENABLE(x) (0x302 + (x))
 #define DC_COM_PIN_OUTPUT_POLARITY(x) (0x306 + (x))
+#define LSC0_OUTPUT_POLARITY_LOW BIT(24)
 #define LVS_OUTPUT_POLARITY_LOW (1 << 28)
 #define LHS_OUTPUT_POLARITY_LOW (1 << 30)
+#define LSPI_OUTPUT_POLARITY_LOW BIT(8)
+#define LDC_OUTPUT_SELECT_V_PULSE1 BIT(14)
 #define DC_COM_PIN_OUTPUT_DATA(x) (0x30a + (x))
 #define DC_COM_PIN_INPUT_ENABLE(x) (0x30e + (x))
 #define DC_COM_PIN_INPUT_DATA(x) (0x312 + (x))
@@ -303,9 +306,15 @@ int tegra_dc_rgb_exit(struct tegra_dc *dc);
 #define  UNDERFLOW_REPORT_ENABLE (1 << 0)
 
 #define DC_DISP_DISP_SIGNAL_OPTIONS0		0x400
-#define H_PULSE0_ENABLE (1 <<  8)
-#define H_PULSE1_ENABLE (1 << 10)
-#define H_PULSE2_ENABLE (1 << 12)
+#define H_PULSE0_ENABLE				BIT(8)
+#define H_PULSE1_ENABLE				BIT(10)
+#define H_PULSE2_ENABLE				BIT(12)
+#define V_PULSE0_ENABLE				BIT(16)
+#define V_PULSE1_ENABLE				BIT(18)
+#define V_PULSE2_ENABLE				BIT(19)
+#define V_PULSE3_ENABLE				BIT(20)
+#define M0_ENABLE				BIT(24)
+#define M1_ENABLE				BIT(26)
 
 #define DC_DISP_DISP_SIGNAL_OPTIONS1		0x401
 
@@ -451,11 +460,30 @@ int tegra_dc_rgb_exit(struct tegra_dc *dc);
 #define BASE_COLOR_SIZE_888    (  8 << 0)
 #define BASE_COLOR_SIZE_101010 ( 10 << 0)
 #define BASE_COLOR_SIZE_121212 ( 12 << 0)
+#define DISP_COLOR_SWAP_BGR	BIT(16)
 #define CMU_ENABLE_ENABLE      (1 << 20)
 
 #define DC_DISP_SHIFT_CLOCK_OPTIONS		0x431
-#define  SC1_H_QUALIFIER_NONE	(1 << 16)
-#define  SC0_H_QUALIFIER_NONE	(1 <<  0)
+#define SC0_H_QUALIFIER(x)			(((x) & 0x7) <<  0)
+#define SC1_H_QUALIFIER(x)			(((x) & 0x7) << 16)
+enum {
+	SC_H_QUALIFIER_DISABLE,
+	SC_H_QUALIFIER_NONE,
+	SC_H_QUALIFIER_HACTIVE,
+	SC_H_QUALIFIER_EXT_HACTIVE,
+	SC_H_QUALIFIER_HPULSE,
+	SC_H_QUALIFIER_EXT_HPULSE,
+};
+#define SC0_V_QUALIFIER(x)			(((x) & 0x7) <<  3)
+#define SC1_V_QUALIFIER(x)			(((x) & 0x7) <<  19)
+enum {
+	SC_V_QUALIFIER_NONE,
+	SC_V_QUALIFIER_RSVD,
+	SC_V_QUALIFIER_VACTIVE,
+	SC_V_QUALIFIER_EXT_VACTIVE,
+	SC_V_QUALIFIER_VPULSE,
+	SC_V_QUALIFIER_EXT_VPULSE,
+};
 
 #define DC_DISP_DATA_ENABLE_OPTIONS		0x432
 #define DE_SELECT_ACTIVE_BLANK  (0 << 0)
@@ -493,6 +521,22 @@ int tegra_dc_rgb_exit(struct tegra_dc *dc);
 #define DC_DISP_CURSOR_POSITION_NS		0x441
 
 #define DC_DISP_INIT_SEQ_CONTROL		0x442
+#define SEND_INIT_SEQUENCE			BIT(0)
+#define INIT_SEQUENCE_MODE_SPI			BIT(1)
+#define INIT_SEQUENCE_MODE_PLCD			0x0
+#define INIT_SEQ_DC_SIGNAL_SHIFT		4
+#define INIT_SEQ_DC_SIGNAL_MASK			(0x7 << INIT_SEQ_DC_SIGNAL_SHIFT)
+enum {
+	NO_DC_SIGNAL,
+	DC_SIGNAL_VSYNC,
+	DC_SIGNAL_VPULSE0,
+	DC_SIGNAL_VPULSE1,
+	DC_SIGNAL_VPULSE2,
+	DC_SIGNAL_VPULSE3,
+};
+#define INIT_SEQ_DC_CONTROL_SHIFT		7
+#define FRAME_INIT_SEQ_CYCLES_SHIFT		8
+
 #define DC_DISP_SPI_INIT_SEQ_DATA_A		0x443
 #define DC_DISP_SPI_INIT_SEQ_DATA_B		0x444
 #define DC_DISP_SPI_INIT_SEQ_DATA_C		0x445
-- 
2.53.0

