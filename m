Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878AE309EF8;
	Tue,  9 Sep 2025 07:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757403241; cv=none; b=ejNIAhHItDQeIJzB9CQ0ejHyI4My3lwdOw/s2dQoIsMsIpBPWfodbXEVP8CVf7O/6+mmF+eSL3l6zv13zvgmS2QSXaNZJhpNTCl8mCFNR5D0k3HvWwdw2Dqqs6M1vZYF9VhmODNbYIJe3C8iCPF4PQM5t/8ub5vE3GJz4YgQ3Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757403241; c=relaxed/simple;
	bh=veQ9/3VO6iMznCoUt98pm7IfBkLnXS6jvf70DOTw9Hs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oPDq32zAg1g0DGvSuBkGlzFjeg8EilEAiawsWHLRP+Rv8t3+sMKXEIz2jfyKd2uiCtCmD/GWi9d+OmTKnBV0MQap5WcYuRuWkm3BKe45GHaKgx9kfU2ENwEjSpdfTrD9K6VIGF45uTV1CzhJ5uDuONMcgkCoBBMj9H9uw9+KSVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jESmtp7Q; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jESmtp7Q"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-33ca74c62acso19248101fa.1;
        Tue, 09 Sep 2025 00:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757403237; x=1758008037; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DQrz/QPYOHYsP4Cfl9B2GTYZm08Xl/E70LbUu7rauuk=;
        b=jESmtp7QEs/YsbwX803onOtqul2n6igf9BVV2X7AUeuoINAtk7pLd++R1ThKG9yS5b
         EWisFPgOSGF4KpRRUizo9aVGKFdE6FDF49DcuVjbMpEqWEdMi/VX9hbTFngqZzd0+c0b
         Yts8ybo27twlnYwwqDBJfGts7zDxD+L9gkaPbbKmiKEVe58YcGE3a0nXmj5GqBklWrQ+
         5T5hNq85V4/LxU4JGTGz8g/3EN8RUO+6PD1ad7EPdX1yz1GoTS1NKoc0SyQQt+EPZkaQ
         wyQRm48nYJWBFn4X6kF95XmzlSb/o+ynU2lta8z+XKxPW+eKA5/qKoqEpYCy4A8TFPmX
         WS4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757403237; x=1758008037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DQrz/QPYOHYsP4Cfl9B2GTYZm08Xl/E70LbUu7rauuk=;
        b=R6VmQkVS97S/JaWV97KuK+EhdRpmjHUDWWJQuJo0lzFzL/7RQC2n3i2+FjAsz1K62C
         8j18T5jK6frmQVqxIbk4fcJvpELkovMtH8n0aoBXQ4vJ/fOD269xhSJCqTLtT3urXitA
         idabJD1ZGdQ9GtDkHFLAGIh1m5gnAT98jMwOe7bF2d8nkzM2Y1V+ncdHDG0n5D5S1tUI
         GeS+/urD3KZS6me5Z/PhQAIfbMqSF5T2lnDnmshKmN6zO96KHxoezc8f91V1moulztWL
         xQ/3vuuXpnOo619mF2+jiv17lV/X1kwrIu4dR+Hdb4C1RWXHgIhPnClBqj2+VwKOKwCs
         ge4g==
X-Forwarded-Encrypted: i=1; AJvYcCUKPyiFwTjW6ZMkPDMbuV5rG/MJEASHlEnKN8flRv9wFTQ+X5IpmawbhpbqeQdwvrUb5lkkkqRPHfJtY/8=@vger.kernel.org, AJvYcCV30+Zz6Rh70VVXwaRQfOrz0pbPuQCXWYRNog2ONKuRebuhrWdL+npyzwgN255mfwfsrRT33fPj7kbhGhQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzwp0HXZd4Nsham1d1umJea5dfI4gGkJ3V9iT1JEJuI48drPmgE
	ueRgB+XhUIuA2PQvPBOjgW1Ufhh+eJrHsaN79pZ9ga9pKhqy9S9+VA6G
X-Gm-Gg: ASbGncvFgs+C6WgnoAKTLZ+HmK7e4sNeqQLoDShnMpkFcdN2z+Be+v9ctRMqD4FHRZM
	53/IgXeO2T74O3T2GA1hLSlFkf2Uwt9tSfnN890KhjRY89hxLR/ssMMYS11THMyDIpy+aj244Zj
	/xvjuT+ZqkWmo78wh/lQfYxhEO3BkhZ+yvniRifmdlOh1xHaDIwfekXuNTfkau50G4QRCdNUHMK
	8VdyyQhI5XTo9rzxttKeieBC6fkOTWUBTm5Lk1WkTdzXo6IPpoRtMPhMFdGpEyQ+4GkIJNKaagE
	xWjjerJTJ3jNp0yOMzG5X31MfQVzmFcNak/YWAir0CwTTS5mSM1u1L3+jEY2Xs7a9BW7/SNxGAZ
	RS3Q9X6BRA2wcXWf0olElOsTH
X-Google-Smtp-Source: AGHT+IG7b409ZZaz9WYBpWBHJXflu4ExPWhaJ6oRz2uN0iqNOX7r4BIF3k+etTXLQ89f4RpIzZD6Hw==
X-Received: by 2002:a05:651c:3254:20b0:336:8369:d028 with SMTP id 38308e7fff4ca-33b553ae52dmr25007991fa.43.1757403236352;
        Tue, 09 Sep 2025 00:33:56 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-337f4c91a6bsm37542721fa.21.2025.09.09.00.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 00:33:55 -0700 (PDT)
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
Subject: [PATCH v1 1/2] gpu/drm: tegra: dsi: make SOL delay calculation mode independent
Date: Tue,  9 Sep 2025 10:33:34 +0300
Message-ID: <20250909073335.91531-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250909073335.91531-1-clamor95@gmail.com>
References: <20250909073335.91531-1-clamor95@gmail.com>
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

