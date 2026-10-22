Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792675419;
	b=HkO6/5s8oyhb9h/I2G8kvQ4BZqoNpKCR+BUTLs1tbTo3G8ndbUPxQ+SQf0iv2nYdwK7b
	 ahO8BJjsbPQZ2GUj3k2np2zDYduCMrIr7XNtXNC6L5xUcjNhvETMJaOr5SRwQAqKhmfzf
	 bhRmzGbB5GnE0ZvVq4nSTRaVvLiLolptMrTIzh3WLvfgWRrW3JHjBZIe+/TN+J9r4Kopq
	 pOJ9jQUFPkBkKs3zVogLkubd3mJ4OduY8PB5V2e5xpjr4TGuKzk+yXRXSaDxC0+aQ2iJ2
	 Vsd7CyjctR2eNMvj8c5Dfz5HwHVpWwAP1M/VlxtoPYLQVQY2VHQEARg5z9kOzHc3L9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792675419;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=klRLuslgHZkHfKV3cIJoQTmbsYS3GX5KrVERzHwo0vI=;
	b=c0pK/gwI2eCsT11vAji4wYZ8JYPmoIwjevejhhhmf6krpIiAsG6BUSSQNT3Bge7uS44G
	 kIPy4qmC2176g2rCNxOudReCt2qzooSSrYJpQNi29StWI/V+EjdzTHgucVJqVNg7sG7dH
	 SrzwTRhZhblkFqjxpfluNNBYXPBGL8QGUlXvOilgPVdiSpMrFOaAtJP0syLsvvhPmMyKU
	 DOuLFo206ImpdFLP6dZARqvCyZ4+KgnisXsTWRAZ1Mdpbih9yUjg0DTTr+1GTAGyKgsDF
	 zGYBfnHBg48576rbur7TsLvx6ZwMgOABlc5UHP1M1X1WP2bPWamv+EqSBTDl4Qj22Dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AabV7SU6;
	arc=none smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7A7606A31D
	for <linux-tegra@vger.kernel.org>; Thu, 22 Oct 2026 13:23:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E7A7606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AabV7SU6
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6ae14eecc64so2577688a12.1
        for <linux-tegra@vger.kernel.org>; Thu, 22 Oct 2026 06:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792675417; x=1793280217; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=klRLuslgHZkHfKV3cIJoQTmbsYS3GX5KrVERzHwo0vI=;
        b=AabV7SU6rPc1VzY76I8ieez75e9dF6OE/nlVltNQR563npk53FLXS8Pz8PEqtj/Qto
         fRLsZoR4tN6WZYsR8bYsxSdVehnWO4tO0fPwM8on06TczQAhVjrrdKhWYEFjkAGO8Po8
         EHJpVaBVM5b85V+w9gjRjco9fnHoVwmZcxB8o1VUudT/iDoryZgO+xcGCvlKJXpzG4oG
         JT++bxAoRBbXjBP7ELT9LWZbpTtWypkBUWq2O6oB0rpCdLO4Xu1NgeQlhdMW1H1cHvfJ
         a2S3t006sTmZaqtW5tBpc+rOi31uZltxf1WTMhn0Xi+N5Bwo29b+LYR3/WoLwddLqb0d
         qvRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792675417; x=1793280217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=klRLuslgHZkHfKV3cIJoQTmbsYS3GX5KrVERzHwo0vI=;
        b=d1WiKVury6RRKdKdNVRdBDwKCQfS/+8ly8C6lGtLY9N3xFj6lMvOH29pZhyMdAWm62
         jXvD/8sRc/SvHwtqQy0n+/v1QlzhmRmw1/Hqj6UutLDtIzite5GTb1trzT0V/ZG46Yt9
         F1MO/5pRiMjQeVjtiQx9LlqPU9Fzr5zGPPpLtMlEMA/Sfshk/PnNCQwYvgIKmPn9cHj/
         NwJAGYsS/QqPPSU4Mmc4FUfLGaMSxpPVPOXg7hKoCIQWK7rOoxDGjv7V4A5w+EsmX/ER
         6NmJ3Cr7LCYljmUtgnsf4H9Y+rQgZ33n8jhLsnb5yP0fAFYL1s365ZU6wStZRyCA2Ps+
         oC3Q==
X-Forwarded-Encrypted: i=1; AKwUvBySxD6sJI587dSMjkKT2m0ToJ0okRp61LXtp++2/ThN9MsfE9U5PS651nIHnBranor88CsTFzlPHG/bnQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJZin+6Az1W7bcObepB9tEXcQEcwcwM3CX/b2gfj/veVq/hQh2S
	8KcKhwOu019dL9Erk7VMFVuBRqJoAmmHkUD0CwlxaeUZJEpVG27Aobj+
X-Gm-Gg: AYBFou0jNSRHtAyDQgxqHlT+qV4dFJFUgbTtltTfklqaMbmuQkJLANMLyIwAB7aSHyF
	40RnOsyp5mp11UPDyAaP8p12n0ZI3bK6NeMV+4tfqMFn5BBu58LQWz3f112VqkNjBDgggW1U/3P
	cxGhxW0cv4xRXIVuXeY/gAsWV/5D3kmICjQ7tpEljsoUrKey8giuBq7cB2G6f4V0uzU6DVWd/mD
	ICLMK2LVkfIqUoTdcH5pGbWv1MPy6OOhinRA9+MXHKxTu4NhELQeqmcRzIziZCjy84MtdcSiDn2
	jiphy+psy+9jQMRg3CHpsV+PRupGW2J+HraSfhTUPq9rFa6OU98F3ApL/Y1LL+4PH1ZXv1TYDdf
	cCBWtGyqA0PyZVcq1sq+xyRApVvetwvoSBLNpEJQyWBe/4U8c9RJWpz7Cw+iOdSXKC7tIhEvZmr
	gTixNoI68VwETi1hmaROKdad1Ys2quBvdYy5mL88gbO/XC0ETXSqW0GFr4gdphvzq6JcerVbvW2
	aUvCTD7rTLuml24uZUrQhPs1AjMj8vvLIXuyeEejsPSxHig49awFZNzQEtnU+pZxBIFA7ZDU+1g
X-Received: by 2002:a05:6402:360f:b0:6b3:af8e:c88d with SMTP id 4fb4d7f45d1cf-6b408ee194amr4733047a12.35.1792675416930;
        Thu, 22 Oct 2026 06:23:36 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b40313074esm1818061a12.27.2026.10.22.06.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 06:23:33 -0700 (PDT)
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
Subject: [PATCH v4 4/7] drm/tegra: dc: Expand available registers layouts
Date: Thu, 22 Oct 2026 16:22:56 +0300
Message-ID: <20261022132259.240717-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261022132259.240717-1-clamor95@gmail.com>
References: <20261022132259.240717-1-clamor95@gmail.com>
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

Expand existing DC register definitions with additional fields in
preparation for adding the 8-bit CPU interface.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/gpu/drm/tegra/dc.c |  3 ++-
 drivers/gpu/drm/tegra/dc.h | 49 +++++++++++++++++++++++++++++++++-----
 2 files changed, 45 insertions(+), 7 deletions(-)

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
index 0cb0515968b35..7005df32f485f 100644
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
 
@@ -451,12 +460,26 @@ int tegra_dc_rgb_exit(struct tegra_dc *dc);
 #define BASE_COLOR_SIZE_888    (  8 << 0)
 #define BASE_COLOR_SIZE_101010 ( 10 << 0)
 #define BASE_COLOR_SIZE_121212 ( 12 << 0)
+#define DISP_COLOR_SWAP_BGR	BIT(16)
 #define CMU_ENABLE_ENABLE      (1 << 20)
 
 #define DC_DISP_SHIFT_CLOCK_OPTIONS		0x431
-#define  SC1_H_QUALIFIER_NONE	(1 << 16)
-#define  SC0_H_QUALIFIER_NONE	(1 <<  0)
-
+#define SC0_H_QUALIFIER(x)			(((x) & 0x7) <<  0)
+#define SC1_H_QUALIFIER(x)			(((x) & 0x7) << 16)
+#define SC_H_QUALIFIER_DISABLE			0
+#define SC_H_QUALIFIER_NONE			1
+#define SC_H_QUALIFIER_HACTIVE			2
+#define SC_H_QUALIFIER_EXT_HACTIVE		3
+#define SC_H_QUALIFIER_HPULSE			4
+#define SC_H_QUALIFIER_EXT_HPULSE		5
+#define SC0_V_QUALIFIER(x)			(((x) & 0x7) <<  3)
+#define SC1_V_QUALIFIER(x)			(((x) & 0x7) <<  19)
+#define SC_V_QUALIFIER_NONE			0
+#define SC_V_QUALIFIER_RSVD			1
+#define SC_V_QUALIFIER_VACTIVE			2
+#define SC_V_QUALIFIER_EXT_VACTIVE		3
+#define SC_V_QUALIFIER_VPULSE			4
+#define SC_V_QUALIFIER_EXT_VPULSE		5
 #define DC_DISP_DATA_ENABLE_OPTIONS		0x432
 #define DE_SELECT_ACTIVE_BLANK  (0 << 0)
 #define DE_SELECT_ACTIVE        (1 << 0)
@@ -493,6 +516,20 @@ int tegra_dc_rgb_exit(struct tegra_dc *dc);
 #define DC_DISP_CURSOR_POSITION_NS		0x441
 
 #define DC_DISP_INIT_SEQ_CONTROL		0x442
+#define SEND_INIT_SEQUENCE			BIT(0)
+#define INIT_SEQUENCE_MODE_SPI			BIT(1)
+#define INIT_SEQUENCE_MODE_PLCD			0x0
+#define INIT_SEQ_DC_SIGNAL_SHIFT		4
+#define INIT_SEQ_DC_SIGNAL_MASK			(0x7 << INIT_SEQ_DC_SIGNAL_SHIFT)
+#define NO_DC_SIGNAL				0
+#define DC_SIGNAL_VSYNC				1
+#define DC_SIGNAL_VPULSE0			2
+#define DC_SIGNAL_VPULSE1			3
+#define DC_SIGNAL_VPULSE2			4
+#define DC_SIGNAL_VPULSE3			5
+#define INIT_SEQ_DC_CONTROL_SHIFT		7
+#define FRAME_INIT_SEQ_CYCLES_SHIFT		8
+
 #define DC_DISP_SPI_INIT_SEQ_DATA_A		0x443
 #define DC_DISP_SPI_INIT_SEQ_DATA_B		0x444
 #define DC_DISP_SPI_INIT_SEQ_DATA_C		0x445
-- 
2.53.0

