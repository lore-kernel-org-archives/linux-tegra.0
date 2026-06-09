Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DCA3AA1A9
	for <linux-tegra@vger.kernel.org>; Tue,  9 Jun 2026 21:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781040351; cv=none; b=E509e4iF7UGFNxyA0f/MXFm2NTpze0xP/smdAA3FwhezpHEPXpHbu7K0BOHOW5RjNZSZtEpM3RecfjqCupMPdfvdYN2v8CLNPsYucaA8vDZzd6HW5E/jP42golklxQQRScOsvZV8QXo+PDwHOA3tdtPjDlKUGv5CG3kxfNMrdxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781040351; c=relaxed/simple;
	bh=H3CAB1l00Dn9uJQyEA/EKAUW41tGS19mLJg8EXntY7Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EVUldWRIcPS65q7smZ6SJIOKG10waf6MnsBYeV+strCKNVp6qXSAUoDsjDgFJ68LxCanMOJD7df+udhtUMyrafBc09IBlsU8wFysvY7Wzu326zzg1S1s0w3blmFyqYNy49DXDkg67HDDCeC/m61jdP69CGM9BssUBNjzIcijSvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UxnCHWk1; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UxnCHWk1"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8422871b42dso3629997b3a.3
        for <linux-tegra@vger.kernel.org>; Tue, 09 Jun 2026 14:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781040349; x=1781645149; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K3MxpUJ9A/oFnIxzY0zUawQ1/Q0lFFBXb9u2LiPcWeA=;
        b=UxnCHWk15UnA4ecFSyRrvLK2fcs3yKxsilkcWin1Pqt5Py3I3K3JTiN7yGHaowjxOW
         IYvaS5i/JLhmHWzC/o0/OTx1uijalpQ/vOFS3kK3DCcbad+oRCvEN6slTYkDI24+Lpmt
         Ej/iyoHrmD8ORi8KNovYDMNihzwpO7OotZi788LqK4ZlrWMCaYpbgW75dd2V/QS91InP
         RA9EEfrwat1Ap7ASNV2hCfS4iwcxLbJlrcOs6EDMZx3xPDk0ItWIbOHlSuyRzmzFn0Yt
         QeBHVjOijM3Q+kZzaMUQ77NDm5aSaeLH6SNc+LdwwmiudiI6Sj5VgOK6WbXALvwEcBSn
         sMMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781040350; x=1781645150;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K3MxpUJ9A/oFnIxzY0zUawQ1/Q0lFFBXb9u2LiPcWeA=;
        b=SKIFI55xOU75aof1W2Mg5z4wStnrlFMI74GOk5pFe93MKCqxrWOmqFffDjXsxHyIjq
         jdADgd+i5BH7R1i4fGwgThJOGQvuzPXpMy1dOFlCQLOMCOxfZSBWrQk6FSYy5j/GjVk6
         EU4pzJxZvV6ibxbqgrKliGEUJWWLh/daWOAKVuHIh1Y68QOaTKNqZqkwiKWqc/DjDA8B
         Z70j7GGt6wAA86jO7q/FNpNcElIst/Xmt0qQiKnCLWTs8tYbRHvAN3PeGO0Hotifmrd4
         XH9AB8g3w6tJ2kFZl4sLq4SdSnuT4UTzvOdJPo3nti/d98cxw2skWtO48Sej/M/WbBSU
         BB+Q==
X-Forwarded-Encrypted: i=1; AFNElJ8dbngLIF3xveyWqg1of4YNKcAI2ed0oK3rLDGI/8KziOMABt+/XeOsTQNiF75l93ppcL1WpozmMskWEg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxpLT6OGD9pz2lALn/S82G4moCsBjOSDYMbPNjnSL+HwOo6mODC
	k4uzisjM9WO2j6RKCWIeFxA2fn5R5UyhLK3fxR85S05r+KRyJdWVm5el
X-Gm-Gg: Acq92OHutDaxNNXIRwyjj1DZwEbKyRQ9Z/SQJ8iaol9LUsHqBbg9q6BWn4e3i/JYcc0
	lcmIlGia21EIKNAr9AH5RLKTxtCBMhJ/H08ufSYXBhypD0BqJDBqAjNsSr8hpBD57CxPX3gzGmD
	eh4yBOfFLU257+AsqvBtXD1Mrft/wluay2eGlIipTyH+EwlkKMWgnXdwNrK3IAhC3+rU1Ph9E/r
	vZdZpBeRTYsi1FkhuIkW1vHj3XQL5pXLD+7+eo7cZqJ5mv7cDZ7DdR4HONy+yxiIsDLcSW4ZbxR
	QgKbw8yfcqraJ5DpqpO/mROxnlokeX8QmeP/vfurJfM6D072ZWSVp6GlEGhWqccZn7GDiVEYiWO
	2HDpxG6+9FjKW6X6qdkdUk99xNYn0R330dUQdVBPgjb4HbJOi1Vy5HUSr7ZkWCrswcn7TwIRrnu
	0eM00vcH9/srMfHizLjioFsJWv4mpkHaY1mxCNgjAiUy3Oy480jX4100St0n7ueV0B+P8qejOBZ
	Gn4vcrfGvrqXvSbmYDZGKL6NXBGD+bpxUIVCeG9lnlFAQ==
X-Received: by 2002:a05:6a00:4c0a:b0:842:65f8:bb3a with SMTP id d2e1a72fcca58-842b0d61a33mr22235351b3a.19.1781040349597;
        Tue, 09 Jun 2026 14:25:49 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428237430esm20591050b3a.21.2026.06.09.14.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 14:25:49 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Laxman Dewangan <ldewangan@nvidia.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv4] dmaengine: tegra210-adma: use platform to ioremap
Date: Tue,  9 Jun 2026 14:25:31 -0700
Message-ID: <20260609212531.22044-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simpler to call devm_platform_ioremap_resource() as it returns multiple
error messages for whichever part fails.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v4: rebase and reword commit message
 v3: change subject
 v2: reword commit message
 drivers/dma/tegra210-adma.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/dma/tegra210-adma.c b/drivers/dma/tegra210-adma.c
index ceaee1e33e68..21a381d022cf 100644
--- a/drivers/dma/tegra210-adma.c
+++ b/drivers/dma/tegra210-adma.c
@@ -1087,15 +1087,9 @@ static int tegra_adma_probe(struct platform_device *pdev)
 		}
 	} else {
 		/* If no 'page' property found, then reg DT binding would be legacy */
-		res_base = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-		if (res_base) {
-			tdma->base_addr = devm_ioremap_resource(&pdev->dev, res_base);
-			if (IS_ERR(tdma->base_addr))
-				return PTR_ERR(tdma->base_addr);
-		} else {
-			return dev_err_probe(&pdev->dev, -ENODEV,
-					     "failed to get memory resource\n");
-		}
+		tdma->base_addr = devm_platform_ioremap_resource(pdev, 0);
+		if (IS_ERR(tdma->base_addr))
+			return PTR_ERR(tdma->base_addr);

 		tdma->ch_base_addr = tdma->base_addr + cdata->ch_base_offset;
 	}
--
2.54.0

