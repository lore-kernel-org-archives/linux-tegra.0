Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66C6281504
	for <linux-tegra@vger.kernel.org>; Thu,  4 Dec 2025 06:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764828890; cv=none; b=OkRoKoc28b0kzIiG6YEnmSl1MpYYH7Olf7/OlySEjbHjoYp99VWhAhKoOTg+AT8Eme6vlX3rZgndorlwKB6vgnLntdJhGwfm7ey/TT9byDRR/XOB0QTXlpJawFCbPzjdL285+0uZs+04IkH/mrCuuhVsBgqh/d/YQnK/NlosAk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764828890; c=relaxed/simple;
	bh=veQ9/3VO6iMznCoUt98pm7IfBkLnXS6jvf70DOTw9Hs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e+MNAOLxPHAShHHrWghdON7S2MybeEqDU1niAgiZ4abBxZasYrC2sMF3yTuc+lnXalFmFU6FvR+LKFodyQGLIGKwcV+qJ92AZ7TwetcD9c0ifBEMjJ5Q1kaVojRAza5iru+X7leAqITR/h2XATEULAUyhUFftz1FTYkjO4UFeNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lD5X8RWD; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lD5X8RWD"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b77030ffad9so80553366b.0
        for <linux-tegra@vger.kernel.org>; Wed, 03 Dec 2025 22:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764828887; x=1765433687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DQrz/QPYOHYsP4Cfl9B2GTYZm08Xl/E70LbUu7rauuk=;
        b=lD5X8RWDjMLxgchl4kUIWHME6SI94Js9BsllvPIRwzIaxmosq8zE6FdeiElvx2j0el
         TuLREHuEJfF6zon9oP3sOdbzLXAzzHNqIeuXfYLKkGxW+F+FZNGNARv/MQ4K4bYXi8Mh
         mHSX1mxxDDpI5/8m3wguOUsGM9/zfO3ec3d9x1zayrjfjYwm4LiPj3M7YzZSeYTLtwsx
         0fzUDzHyvbnmijoL2Gf6qPgxol+8vJp5XpjRjUGD7/vweN0h76/9T7CLAcr1ufdN3Z7j
         sM8BYcv4rmyM0nTlPv0q4G6jAprcWiWVKfq20yWYwOHhYTtFDI5wn1W68x+yfZpTT6lm
         imDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764828887; x=1765433687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DQrz/QPYOHYsP4Cfl9B2GTYZm08Xl/E70LbUu7rauuk=;
        b=N3EQvsgU+vw2hfeXc9gzdvz7B2w4KB5PV3NTEF7n6eqc63Ddht6yb+KiMPMImgllWq
         m0leiz2EzhG/QDJBVVur7w1xe3ApSblvYEWd+ZXdtt5Eud1ZK2mDfZ9CQXsl6GJvmtn/
         gcsN3sMOXuuvf5wO9G4te2Mk7gDg8qClNL7vDWppLbqHbXRGP8G5heuasZtgNvaA1B/b
         1qoiV955+Qr6mPuLI2zXN2kxlNc1oRb6Y94389lZgHLBXf1cHqSBpq/Z5vrBs/cm0ZBu
         aqAFszhB19jqWOJJQyfrFfMXiVjRgqWRPWRk2RY2zm+mH5Bj7O7EBRwJ4jijZMedW1vn
         4qLg==
X-Forwarded-Encrypted: i=1; AJvYcCVnhv61DVXgiVD2umDzDmx8niu3Lhb0x3D3d7WqhzC6zuaEEd2BesfEX9/f1IzxbKfumEAdZoypFLFzTw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxrvkdBBBWCDXmmVvHW/kaU0AvETn85YBVvg5AZeXx3mmElyiS5
	ND5usm/zcXxnKkcifVM0VLHSm1ExXMS1pJ4m7ooSbnD5y1eWKBRaTZsE
X-Gm-Gg: ASbGncuWqB0e/OPwinnMTh10PPgeUmsvZnpMraIatsufvxkkRiJuB4mX/YyYJvFpjgt
	iNrfALrFa5I5LkmsmbcOwQZHRXZCw92885H1vLiImj5U7PL5kWPX3Rg9yyHWpeRWZwy64PU2CUC
	xJIY2XpOeAqva2SOdksHzuSG9RpWL6JjRtSz7oIDl4iufvS0+PxJfDbVv65x+X5UAWg/Bqlk7l3
	tYDt/irTlWmSFc8eWGFpLpa0arOOIwuuDuGDyPUdvxxRMCads6MXISut8Cu3fSjCGTRU65Nhux9
	bJ4eKnI8VIK8IKpo0TygarUflAPy6SaxgSqVYSTkXQemnC8EBs/ya+MZuoJYfy75mMZZaY3h+RA
	3ezvShBmVX+V8McasJlsobMd41P0jz7s1lpfpW/Kq4TGqP2l+qGk6dO/6tUIy2G2/mOccYsALwX
	k=
X-Google-Smtp-Source: AGHT+IH9Td1weLVNisf4to9lzLCPe3cNWf9eIXubukdh2R/fUUXMkNiI22zD2RgZqeyDpQfBYih7ig==
X-Received: by 2002:a17:907:7f92:b0:b77:1b03:66a1 with SMTP id a640c23a62f3a-b79dc758d94mr555102666b.41.1764828886847;
        Wed, 03 Dec 2025 22:14:46 -0800 (PST)
Received: from xeon ([188.163.112.74])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79f445968asm50607866b.3.2025.12.03.22.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 22:14:46 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2 RESEND] gpu/drm: tegra: dsi: make SOL delay calculation mode independent
Date: Thu,  4 Dec 2025 08:14:35 +0200
Message-ID: <20251204061436.5401-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251204061436.5401-1-clamor95@gmail.com>
References: <20251204061436.5401-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move SOL delay calculation outside of video mode conditions.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/gpu/drm/tegra/dsi.c | 41 +++++++++++++++----------------------
 1 file changed, 17 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index 924611061cfa..aab555a2eb68 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -560,11 +560,6 @@ static void tegra_dsi_configure(struct tegra_dsi *dsi, unsigned int pipe,
 		tegra_dsi_writel(dsi, hact << 16 | hbp, DSI_PKT_LEN_2_3);
 		tegra_dsi_writel(dsi, hfp, DSI_PKT_LEN_4_5);
 		tegra_dsi_writel(dsi, 0x0f0f << 16, DSI_PKT_LEN_6_7);
-
-		/* set SOL delay (for non-burst mode only) */
-		tegra_dsi_writel(dsi, 8 * mul / div, DSI_SOL_DELAY);
-
-		/* TODO: implement ganged mode */
 	} else {
 		u16 bytes;
 
@@ -586,28 +581,26 @@ static void tegra_dsi_configure(struct tegra_dsi *dsi, unsigned int pipe,
 		value = MIPI_DCS_WRITE_MEMORY_START << 8 |
 			MIPI_DCS_WRITE_MEMORY_CONTINUE;
 		tegra_dsi_writel(dsi, value, DSI_DCS_CMDS);
+	}
 
-		/* set SOL delay */
-		if (dsi->master || dsi->slave) {
-			unsigned long delay, bclk, bclk_ganged;
-			unsigned int lanes = state->lanes;
-
-			/* SOL to valid, valid to FIFO and FIFO write delay */
-			delay = 4 + 4 + 2;
-			delay = DIV_ROUND_UP(delay * mul, div * lanes);
-			/* FIFO read delay */
-			delay = delay + 6;
-
-			bclk = DIV_ROUND_UP(mode->htotal * mul, div * lanes);
-			bclk_ganged = DIV_ROUND_UP(bclk * lanes / 2, lanes);
-			value = bclk - bclk_ganged + delay + 20;
-		} else {
-			/* TODO: revisit for non-ganged mode */
-			value = 8 * mul / div;
-		}
+	/* set SOL delay */
+	if (dsi->master || dsi->slave) {
+		unsigned long delay, bclk, bclk_ganged;
+		unsigned int lanes = state->lanes;
 
-		tegra_dsi_writel(dsi, value, DSI_SOL_DELAY);
+		/* SOL to valid, valid to FIFO and FIFO write delay */
+		delay = 4 + 4 + 2;
+		delay = DIV_ROUND_UP(delay * mul, div * lanes);
+		/* FIFO read delay */
+		delay = delay + 6;
+
+		bclk = DIV_ROUND_UP(mode->htotal * mul, div * lanes);
+		bclk_ganged = DIV_ROUND_UP(bclk * lanes / 2, lanes);
+		value = bclk - bclk_ganged + delay + 20;
+	} else {
+		value = 8 * mul / div;
 	}
+	tegra_dsi_writel(dsi, value, DSI_SOL_DELAY);
 
 	if (dsi->slave) {
 		tegra_dsi_configure(dsi->slave, pipe, mode);
-- 
2.48.1

