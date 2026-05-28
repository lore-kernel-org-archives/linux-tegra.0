Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272CE33439A
	for <linux-tegra@vger.kernel.org>; Thu, 28 May 2026 22:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780006788; cv=none; b=h/N547JPTZrNyAWnkkY9Rqb3VUbQ5HfXaMaXzBoRkFXp8PehGqNN5GB0A7BMBcu1zkkdVxuO+Ufb8F5XDTdcVM+qw76GspDe99oZJ1CzBx8NUefnLXUkVB37L0Pw123rbBEjOnfwi0VaVaX5602eUZMXe2qP+Q78vS1dJyhv8hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780006788; c=relaxed/simple;
	bh=y8fllK6DUVg+fbHg/xFlPqcnl+q3JGyAPz5ibsHKLaA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pm/eilYpsMD6aLh9lIb9WkBPcEpeWRPhoq4r7jB6AZXVECBB97ECbbi7iYNWWtZ2Wem/LJ0zOTCoSIkT/nYny94hONc0qt1FjZaHFAN5iQqBHL4soZffTQ5GTxo1hB5tPf5AH3KAjCHxCS9+Zwtgtn2+ccx2hlWLgSgAP+xc1xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YcheFF6e; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YcheFF6e"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-366139223e4so8122895a91.0
        for <linux-tegra@vger.kernel.org>; Thu, 28 May 2026 15:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780006786; x=1780611586; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/fWMHr/nSoDRFka1B2UjzHLozjqK4nBjXv2Q9bUH4PQ=;
        b=YcheFF6ehzBj5UfBXFzr9nL4mrscp0T9kY7aZLQXD/qKQlUv0rtCW1G/NIJO2Ujcz9
         iXYwpCtWIVVrkkys/bq5YzBtno7sGRau4UkH18RtaIDk06v/Psc93f7OaXa1nvclUTNo
         xRpmEBuJj/8Py7R8Ahp5KL4eb7royu5MlRs2Bn8KC2+Jq9RpBWTdy1DUwXrHxZc4CUEQ
         823rHN1hyF/SRiOM3PZeCqtlF6wS1tRv6zxea/70bzMqIpdQrrjtCsGvdv+3GuMD5Nx4
         sfldefzY0p4k4J78G/AhaF/B0ToHwsRmJj9kKbRVmTR5b2LSFph+OZm54xGbz1Qo6vAC
         KFHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780006786; x=1780611586;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/fWMHr/nSoDRFka1B2UjzHLozjqK4nBjXv2Q9bUH4PQ=;
        b=c1zXObaUsKEAgpdRGGCuuP43NhKpc2EgtUDr8zGA9RiDjxVHyXZPtsiDd+Al13D0Ma
         BXQUEfJ72MBmDN/Mlp4vY1Unx7iwha/SA158KmchekTvea/p7JsA7Av8de9yYMGHe+qp
         dgxmYovpiBNM4fyiBPlMFNsXsBILcIePGmwEu2J5Nqv05DqdKEX80IWjDjWz0cEFexBs
         lhWiUELGMf2NbK4jwbXo4q086pw0j+i4sDS7bkc9yopu0t727WM20AzIe9o0OgHm4C4K
         kSSLQdplg/UdBjIqbhyHyA/Gn+5O5PqJNs32VVQYbN6SBEHgf+awEZ/nhUy42TXMjrHs
         2njA==
X-Forwarded-Encrypted: i=1; AFNElJ9KeC+Y+KyhMm5u8E8+rC9wh+qgmOgfCIlSP0IhhjTpAJZNktBqgA+CAavkoduXlxLx4NBTO845bIwuBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDtklqv6/BVX8PwTfKGGBgeG1pVWyyM9WB2qQ3RDDIqtCBQ47/
	gK1iGyJTgK8VJHWwUGtZwQyjfq8WgV1+bcRXbRuqhKzlaGfMbGoswaUo
X-Gm-Gg: Acq92OHKCJ7dcap2dbxJvBpnsGN9q4wKjCJbNw+l3P0C56Junx/T/djgIynbo31HBFF
	pkiD8UzfiK/Dgckp/ZoNIYV1oo+jK0uwTysXZfbJDQGufMNYY94Ix05DVMOqNc/wWLzToS6n8YD
	MccoyKXM4RKyZzSAX2EOuq1xOH0eaaSI5ne6jwrbBPj3Sv4emoaPrhf2Y0EDNPKtp4o5/lAg6xw
	MtjHt6KjO+d4EywuX4ATSmcEE435nkvQx2Xp9tF16Y9gwbAKVJelvjRn7dDwz26D4igHkg1UZXd
	6dBkDgv35Ql6OdvtJvcFUTtxTbSAyiuNM/9BJdIom/GMiJCjHyW7A9rB3YY1Dj97RbvhzUp0fzm
	6MsqHFJxd6bdvK7S5zET3cKUByr3Heuc3dVIyFtbYDCLI0OUwaYIJbFm3Gd/7I4Hd+yrvW0a2Qr
	+4cBo5EBhBWpp/uiSOVsRGANBjUS0UsRpz/MaAeuNI7HnfKXWtR5XzceU5L8hlxvlyeAvmGFJoJ
	gpMzKyFylU09uWE4pntde/BVvueJ649JiUbFjCMvOPpAA==
X-Received: by 2002:a17:90a:d44f:b0:367:f76c:4cbb with SMTP id 98e67ed59e1d1-36bbcd91aefmr393328a91.18.1780006786435;
        Thu, 28 May 2026 15:19:46 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8575c9ecefsm35232a12.24.2026.05.28.15.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 15:19:45 -0700 (PDT)
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
Subject: [PATCHv2] ASoC: tegra: ADX: use of_device_get_match_data
Date: Thu, 28 May 2026 15:19:28 -0700
Message-ID: <20260528221928.142511-1-rosenp@gmail.com>
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
 v2: move back soc_data assignment to the same place
 sound/soc/tegra/tegra210_adx.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/tegra/tegra210_adx.c b/sound/soc/tegra/tegra210_adx.c
index 12371f895234..9b662fcee66f 100644
--- a/sound/soc/tegra/tegra210_adx.c
+++ b/sound/soc/tegra/tegra210_adx.c
@@ -677,8 +677,7 @@ static int tegra210_adx_platform_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct tegra210_adx *adx;
-	const struct of_device_id *match;
-	struct tegra210_adx_soc_data *soc_data;
+	const struct tegra210_adx_soc_data *soc_data;
 	void __iomem *regs;
 	int err, i;

@@ -686,8 +685,7 @@ static int tegra210_adx_platform_probe(struct platform_device *pdev)
 	if (!adx)
 		return -ENOMEM;

-	match = of_match_device(tegra210_adx_of_match, dev);
-	soc_data = (struct tegra210_adx_soc_data *)match->data;
+	soc_data = of_device_get_match_data(dev);
 	adx->soc_data = soc_data;

 	dev_set_drvdata(dev, adx);
--
2.54.0

