Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA932FA0D4
	for <linux-tegra@vger.kernel.org>; Wed,  8 Oct 2025 07:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759908708; cv=none; b=LC4tdNrwr/6DPrctLsfd/LmHWszqch1819v2q3njyZIo0WaT410hcLEY9CGXr8T1DfacJMF5y01RbZbuMsR27wYamSCWrSFHJmranmi6iTy7Kkm5x2sZ7oPPK1aOh5mftEQcs34spWgBl6Hh4auM8BAHkBoWVyRyNul5xARDCFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759908708; c=relaxed/simple;
	bh=vH0xJgN2W2szoe//wNhYvtT1BAPozP86dafTWttSucw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dPgUKUq0n+iWzmTgeE0fhNCeSJvUpZFIsHBAf0Nw/Oav3fH0T4Hss979i8MNcWEKq1GelxCZNIyzv7WhWxuavnGZ7luHtRKj+oUHRPM9Os/gMEso+myv354vdSy8HjwxhHHp5wLeo2noF27jC6knOm1HlthsHOiVaZP9dquwsuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UgtUMGtJ; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UgtUMGtJ"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-57992ba129eso8154245e87.3
        for <linux-tegra@vger.kernel.org>; Wed, 08 Oct 2025 00:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759908704; x=1760513504; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PAqyge5iPysoNexKPCog6vdhewd7fraGc+GRNda+uus=;
        b=UgtUMGtJ9B+N2O21Y+jSRt+4OgEV8GiFvrxDyzmZEuw6exygeDYLw5T3LyQw7gVpHf
         Q2MROoD51mYc1G0B68OaIOiA6D7ZQg29QcjrYNmvyOC7H91Xzvty21xo9j4uCTZ8Dj56
         fLMLU+jbyv2lF2+peTG/WrMVHu0of1445VynhOocEtMg92hnVLHLB5FdiJ8KQvj5vUDJ
         jtPo5ecGjORLxGDrE3sLG1R6C0VGpaxPZ9sqVHVXdK0ccnAy9tBScmss6rmDvVYl+JPA
         UZtm6CqB9up8ndiDNe/2a0+64XQ2D3apB6DHFyE5tRcIAV+/8gYopKCaiPCdUhAiw5/P
         Hbqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759908704; x=1760513504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PAqyge5iPysoNexKPCog6vdhewd7fraGc+GRNda+uus=;
        b=LA9AAow6pYBu7AfKdc4UaNhoCzH2Ew7hDGZDrQ3OpEYxUBDp8wPMSMRU+9nwwFwkOG
         Ov2lWTjn1YAmr92Y2JNqYF2tCCzc5QxfI4EqMs5qJP3s718qc2j44RbhuIY10aTdYC9o
         2F/QLmiCuZZDKpjkU6TDtgOrYByj7kAJJkDf4+9z5kuS1MCBsajbGxMr3airwzgwGMK0
         9hCw2UvCmgKZ9mGJD6gqDC0wZBxFEMI47d6ELgpBUwW+T08Sfcd2iZrYv8gjrZ5MNq3P
         AlVL3cpP5Pm6qoC3ap1oe5PzoF6FZ4UkIrhSohgsyX7NAIqkDdO5KZbB3T7z/QyEq1k0
         scMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvjqWDnhMzuOzy9uarpk3BAwKR5bXkgi/pAm9QSNkkMZn/zBA0S0tNAb30quIibKvFt3J9anNn0nRGJw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzrPshyFXQEvunfI1IXoFSPDp2MlC8oZkZNTdIC17/tbSn9hU1I
	nIA+3SNut+hqYN5wdr9Sk3XTJCij+BUef2grTFaXgIbkkpcDqL16OnCQ
X-Gm-Gg: ASbGncsrO04CquvUGjkaaqzH6/rXfAMjsFp2wU9VQp59IG/kNIvdkvfxqcMES4mqjt8
	31bwF4vLKj3jefHjY9zutTMAoR3y//Kmru/uDzBvHU4cHg+oLJGL6Hy27C8wJVuw3Apr4NdgqNq
	fS+UCAv5F/AOQ+hv8rJt8UZD4VyaeeUxHompyGHzHMeAWR4RySbIUOYJXtRqhdIQjdnQ+wWdISr
	TfMDDfS03FBZW2JtS+mNN7NcBRzIBXDI8wb2c2AQHH1UUXFiX5sYZDgPjw9hbLMmyrOoJRiZ1Fz
	2uip62xAhgZACs4awInATLL7lJUjpe+XivokfCwJ7pFe6H1s/+m3RsQHIOCB3xjrLNogSswsHnU
	UfQUTDrsC2jB4wBcOvRRSxdRp+2FocasXB759UQ==
X-Google-Smtp-Source: AGHT+IHW/s8/FSLeLjY2E3RMDJLZGpJL6irCGCDXRSSnmLe1/pIzWAPaX9pmCT2OHt3ka3/mSzeg5w==
X-Received: by 2002:a05:6512:2399:b0:567:68ad:428e with SMTP id 2adb3069b0e04-5906d888441mr673178e87.0.1759908703855;
        Wed, 08 Oct 2025 00:31:43 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0118d22bsm6911016e87.85.2025.10.08.00.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 00:31:43 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Aaron Kling <webgeek1234@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v4 18/24] staging: media: tegra-video: tegra20: set VI HW revision
Date: Wed,  8 Oct 2025 10:30:40 +0300
Message-ID: <20251008073046.23231-19-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251008073046.23231-1-clamor95@gmail.com>
References: <20251008073046.23231-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to TRM Tegra20, Tegra30 and Tegra114 have VI revision 1,
Tegra124 has revision 2 and Tegra210 has revision 3. Set correct revision
in tegra20_vi_soc like tegra210 does.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index ffaaa2bb8269..93105ed57ca7 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -596,6 +596,7 @@ const struct tegra_vi_soc tegra20_vi_soc = {
 	.nformats = ARRAY_SIZE(tegra20_video_formats),
 	.default_video_format = &tegra20_video_formats[0],
 	.ops = &tegra20_vi_ops,
+	.hw_revision = 1,
 	.vi_max_channels = 2, /* TEGRA_VI_OUT_1 and TEGRA_VI_OUT_2 */
 	.vi_max_clk_hz = 150000000,
 	.has_h_v_flip = true,
-- 
2.48.1

