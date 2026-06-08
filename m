Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62AD42771B
	for <linux-tegra@vger.kernel.org>; Mon,  8 Jun 2026 04:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780894423; cv=none; b=Lja4Sf4xJKuDLMJMLdqq5LmkzhJzbpLLdDha8jFoRFnTgYhRJNYeqxs1rj/3Ty6EwkT9WYgNMySH8FSR9qhZYMlpgcUnU5KVp/ZdjM2CT6KssEgPT6ISGWS5WgGjVjLq39eLt3hXr4p6tgO1METmOAT+xyK5T/yrsh0+oWwy2h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780894423; c=relaxed/simple;
	bh=11RGwLkj26xqPdN0wscC2AFma7LM/lWRQj+dLXsSXQo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Oac7uiM+jda7noMdLsEuMN2nIg+V2e/6SHtwnEwOEvChNTxBSTksvtF/9b1mOjrjR8YUTviuAPS0W1igkEU5DvLbFFIEPmb/qJQZtu+ONd00HYu1/ScMkKr0BLDhW48R3SYX/Q7Jzi7OWO8RqR9EED0EM3KYUP/cc0j6i7pRmwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pLV0JfS0; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pLV0JfS0"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2bf36a6905cso25928575ad.3
        for <linux-tegra@vger.kernel.org>; Sun, 07 Jun 2026 21:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780894422; x=1781499222; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jgvJ9+4PgpXMrVBHtZnQjq8CEK1hGoHMz+18CbE8EQY=;
        b=pLV0JfS0gYmdUz6DriNrCndd5Xazut3iROHO9IIHj9g6zsSQ5hMX+hEeNF/KcRF7Eb
         nOqWTfFMG0oeUFDoVbneiGHw9KK85mmcwnMXZokJXb6tC/xEziEafULo/l3eNsb7ozyN
         iFyhVyKb636aONpE3gJc39FRcRRx9khHwMKLNBs8bZPtLZqImBOTCh+YrS+qTpeGT7jr
         DNt2N4xi63HNAECrxycuUF2wzl+jq6htQqtL/1V1UcNLX3SUebddnlyaGXPW7vF3HyIT
         CcoGnVYBAfe61pUJkIMlj3mI9c4oFw6OXkW+8/akNnGdupJ8Xluidn+5qCqXOxHKzL9c
         L0Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780894422; x=1781499222;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jgvJ9+4PgpXMrVBHtZnQjq8CEK1hGoHMz+18CbE8EQY=;
        b=qAySC3PaQRrFboYzfILzJdyDW5mDqvHbmvl41mjPocj7IHtNeqpcO4kflUNs3lZ4JK
         XV1wDm+e8xL2XAuJelbSsfeGihtdQPls2XmLuq3f9dEXb2IUYEATA77D2vsafxV5ACPa
         PsVcE6uFoU22Ot/SKFqPQUEFqBNWWK+ZSTjc0uWJcJlwG3CqT9zfJAuI1glYhTbpJBY9
         LeW68XTYZRho3MeOQKld+aAz+geXNaIF5XiM27jew3WlDFHaINLvmTyohIAizo4iHo6N
         /d8+qokbBOvpMynfXQUdE11ph0rzEPx4AvPADktdSJqtceSVwYuXcwU56sUD0GogjqCN
         07sw==
X-Forwarded-Encrypted: i=1; AFNElJ/7GXToVyCFx6Zreb5P2SoX0lRlcobDGXh/cd/koUFnu9Ppw4dZ3q801mf/qxG/29TyhSLn/vLXn1wseQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzoCR2YCHnVzPgaTq9bBW5crfjLaF6ZJZNnRqlzvpVVIXkbR3qd
	OB5joClEqCM0DnGMLdMcnF/YMSDmTUza7XLL2PbViErw3yP8f9aagnnL
X-Gm-Gg: Acq92OE5Gq+15hJMtgMWdz9OR4rleXuE7oHo3OaGvsnQRRuf3ScRxGeKQRoIJRKJUWv
	AjawEISoneqw2F/vIms3rgsLKpy7evh82/rKrbcS8cQTnb8LEgI2AzVBPBlWRc9I4SkqKQD+iWD
	TdF4HMBuAxUB0W3x8PQM5SwBlTOvecUPr7xmY5YON8ZiHX152A0U9HiCOuftllkXkNJvCUYy6ZS
	BaAavxnWWLtD8HhDgzDrtnjFyUnN+qMhYXoXyHxHeoFbQU39KQ6wOOFziv3IapTJy+gMHDeETvO
	gNSWvIMNfMRoJxri+NPourUWS/uocxPyRSTC36JkPNlsT8wNT97ncLhYLsfCrsDKZAITI+r92Ef
	m679xttc5+nT5bQ/lCbvyh4IfhHhsiSZnwRRUI9SHww9Rj3qZf5Eal1gbR+DbyMd2/TzYr+ighr
	0+JRZo/y1mE3ch82NiD1FQmODYT3v5WtqXyfVSaTSdjHCSI0n10IC25ItO/mYgK9dHDOWcAPfsR
	iZXj9XPhmlEFRv6IS0WUxHCt4pV+DUBLOEXTzGQ2I/IVw==
X-Received: by 2002:a17:903:3c6f:b0:2c2:7baf:139f with SMTP id d9443c01a7336-2c27baf148emr18097875ad.30.1780894421834;
        Sun, 07 Jun 2026 21:53:41 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d389sm162552855ad.16.2026.06.07.21.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 21:53:41 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Laxman Dewangan <ldewangan@nvidia.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv3] dmaengine: tegra210-adma: use
Date: Sun,  7 Jun 2026 21:53:24 -0700
Message-ID: <20260608045324.4980-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simpler to call the proper function.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v3: change subject
 v2: reword commit message
 drivers/dma/tegra210-adma.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/tegra210-adma.c b/drivers/dma/tegra210-adma.c
index 14e0c408ed1e..be2ad6e28618 100644
--- a/drivers/dma/tegra210-adma.c
+++ b/drivers/dma/tegra210-adma.c
@@ -1073,14 +1073,9 @@ static int tegra_adma_probe(struct platform_device *pdev)
 		}
 	} else {
 		/* If no 'page' property found, then reg DT binding would be legacy */
-		res_base = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-		if (res_base) {
-			tdma->base_addr = devm_ioremap_resource(&pdev->dev, res_base);
-			if (IS_ERR(tdma->base_addr))
-				return PTR_ERR(tdma->base_addr);
-		} else {
-			return -ENODEV;
-		}
+		tdma->base_addr = devm_platform_ioremap_resource(pdev, 0);
+		if (IS_ERR(tdma->base_addr))
+			return PTR_ERR(tdma->base_addr);

 		tdma->ch_base_addr = tdma->base_addr + cdata->ch_base_offset;
 	}
--
2.54.0

