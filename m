Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F422D5436
	for <linux-tegra@vger.kernel.org>; Fri, 22 May 2026 01:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779415156; cv=none; b=WFfIXbyYtaCDr6kH4ls5egHt5zrHXSA2lwx+FKyFQuHaBPaWS97zL8fVZLdp4Y93UdRlo+uwP9BtPsZX9W/CM2kCS3+V4Lu23bI6596I0MC0yauxAYiV87zFArG/9LDyHe/3zvUIJGSaQ6JyaWATq84vT5WCrkCH61uFaWlZ+kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779415156; c=relaxed/simple;
	bh=huyYowgvyax3xM4nR3JNAVCXHtYOlOr5UQVQ27KgG48=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ght/WcNxppRCSwEC4iwu1cYC4GsAArLNIZxr/EH6jGPpDzTVw16dHLNwK85lyDxYPnhFrTjggu9oxBQ1jNPEZEFoKGMn9mUzihtdhNNTqnWMXlHQ3krv0Qkci4OyEEJvnfHHk0Gh7pbycurR1nSs23+6Sx/YHmZzNlsCoqrxLZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YgO9ixdW; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YgO9ixdW"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c827313dac0so3583054a12.1
        for <linux-tegra@vger.kernel.org>; Thu, 21 May 2026 18:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779415154; x=1780019954; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w1F/N153wlHEFYgairICUXmOEte2iOLSjR7LBFRFOk0=;
        b=YgO9ixdWMK/Uhew17Hg8c4WZSDnXKzrgJ+AhLIPnLeUNx6uq5P8e6ocxpiTeKiApUT
         lOnr1b/UUe/alsdrdcBygqaomcT+mFbdzwqb3JWXOYA9Vpg7UjTi0oE/1Z8n5ksxt7Xv
         4ZbzKcR82wYT6mFbbKAhGs8gXBQ+DMHtMiBckDcKxb4GITv9F32aNOw1oJlKYJtoa6dc
         xxfFKmM8GiWnaYjlsDZTlj3Y/JXfEqh/SXZd3o7WFZyZewHWHRHIqc9Q3Yo31NIfT/hS
         4TSE8jERHUUWap8R7VHukH/F1PNYcnfEExEm4Hoesql1iqN5BMA3XOLsP20YfUSrLymq
         zCIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779415154; x=1780019954;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w1F/N153wlHEFYgairICUXmOEte2iOLSjR7LBFRFOk0=;
        b=ihdR6hEoW77/FRDJVmyhCHXON6IFf432LV/YkBLV7lLZUGwnCy5JdhOnd0DYJPxl14
         CW2CivsS7bIBhEHctbky8QtR9zfa+bNY97o2rZYaeYVuPyd3fNnZhbz1meXCHxAsUptz
         hV3TzjCRh8bdbzqrq+cbfFpdzqje4kh5GeGQREUD/Q1/Tu4FMWVicBg18ZDnlduxSbe3
         XEiGlxQxYnBEcVW9W21M7Y3PDfOysvA7x7YjH5tHjoJmzfIpFk9Jdi07rB/spj5snRhx
         658aVo7N4TNb5BkdQD/v65YCRUSv6LnBr8goxfamHhp2PlvS4LQcPNzTS1JQ9WhyKzYp
         J7SQ==
X-Forwarded-Encrypted: i=1; AFNElJ8XmFmXpsyG6bueH0dz11FLO65DfomeYepj5gVdC4adsOoAQAli43iZqZQNyCk06j50t0ybCulBmKvhpw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+h+viJrzsnGOeKr41zbRIGGzI38KL3SMv1ukeQiolOeZ+1cgN
	1Y5ci3NM3jYADAAIrtPVn2OqAwJTy3u1GGmx1DWZcUDyNG+yf3vXMD/3sxe6cuMP
X-Gm-Gg: Acq92OFbEBWFD2gAJ/+HV0dIeATpdiF/ttFYYwOW9C1UkjOxfLnewl2HHHR6WW1pUwJ
	m691m6ziIDtI07wbwvpfu5kUMkP0yDH7zTOquAvxEoQajcs3Wi6vHzWCQ3Uh2TA+LJE/iMLN57d
	wAcuC/HB4Sde2+LqzFjO4TkxmtSGFT50Ps6AuKdh7KIr7448OInPbeOmGCiSVM8wWn+/bRq8GHM
	eZYFUMX4mmG4nhoXhwznS09a8ItCaM2oIb+NGFCs4P5Exnj+onSUlOTKOOk2XVGrw9tTktuMUrd
	l6tTSA9cQvHWElJW5oXeqkvRM/Q5If1IM8TQxDrh11odP/bPAPfeLUNSHqb9XcNxmuQMPYAw4/l
	4w6Vbs+2yTUiFZZoc/v7ghnGNKS8TIOXUGX4wvdhjljOt6oTCqbSF2vM2AR9b3V3abaOuZhpViK
	4reFPrqfeDCR6YdsjSrCXEVikSyZmMMYHEWVkKbscPd/eWQoZOGe5TMuuuWKU++Po7jcE2cANAD
	WXse1/h3n7PGbG19SAkEOctp8aNZyh/T0eZuET2lxptdw==
X-Received: by 2002:a17:902:f601:b0:2bd:4bc3:2995 with SMTP id d9443c01a7336-2bea22bb7c8mr53857845ad.22.1779415153758;
        Thu, 21 May 2026 18:59:13 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb0aafab8sm5806695ad.0.2026.05.21.18.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 18:59:12 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ASoC: tegra: ADX: use of_device_get_match_data
Date: Thu, 21 May 2026 18:58:56 -0700
Message-ID: <20260522015856.741656-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove open coding of the function to simplify the code.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 sound/soc/tegra/tegra210_adx.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/tegra/tegra210_adx.c b/sound/soc/tegra/tegra210_adx.c
index 12371f895234..a2c28369fbc8 100644
--- a/sound/soc/tegra/tegra210_adx.c
+++ b/sound/soc/tegra/tegra210_adx.c
@@ -677,17 +677,16 @@ static int tegra210_adx_platform_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct tegra210_adx *adx;
-	const struct of_device_id *match;
-	struct tegra210_adx_soc_data *soc_data;
+	const struct tegra210_adx_soc_data *soc_data;
 	void __iomem *regs;
 	int err, i;
 
+	soc_data = of_device_get_match_data(dev);
+
 	adx = devm_kzalloc(dev, sizeof(*adx), GFP_KERNEL);
 	if (!adx)
 		return -ENOMEM;
 
-	match = of_match_device(tegra210_adx_of_match, dev);
-	soc_data = (struct tegra210_adx_soc_data *)match->data;
 	adx->soc_data = soc_data;
 
 	dev_set_drvdata(dev, adx);
-- 
2.54.0

