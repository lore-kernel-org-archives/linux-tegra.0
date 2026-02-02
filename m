Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D476A263C8C
	for <linux-tegra@vger.kernel.org>; Mon,  2 Feb 2026 03:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770003881; cv=none; b=QxSW9pNWt/oqUf4mPY59ZnG0JHzmVMgKiyCNuCcXEkz+ZghsEFriNjjvr5tqjNhwfV6N7QEhI6R+eEu/BZoL8X3HOJcUXL89vddn6Mp9WKSOWRCrBOaiHJMbXZ37GP2/9IRMNFDwRWjWi4jdzLO+D91e3jsqEIEGN+HBU3auedU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770003881; c=relaxed/simple;
	bh=F8zEL5bb/41FmEyXl0gxGgleFUTWqen0SuRI0+FGjd4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M//60YBBiupzANWZVL9A+kAEGEPJ5rkrp+m3AQg47NiaDiKZI3Lp7ctBrBMJmmeye77l/dJY7MlffbyFI0R87U1ud401gUoqiypOMFtB9oOr0ydG9cDAPYvCaWvg0JSAwDNDzCQdKEBbp/dPKRj2i5V7OarP+mWb/TvX/LaOb50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bs1PEME2; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bs1PEME2"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8c59bce68a1so298417085a.0
        for <linux-tegra@vger.kernel.org>; Sun, 01 Feb 2026 19:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770003878; x=1770608678; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0jgsCpDdp/lW2kw7mE1/acyw+xEa5OKHQFKlf7uWjA0=;
        b=bs1PEME2AizbENl6HrNtrfa3myRMC3Uwtb7bFwBybYxrc4YbjWzuonP0uxCQHCr63p
         7hUShdiKuKOptOF1Gpp1I8tSwQjaCfpZ64dYsjMbT5RfanF5IXwnnbPhzgaT95NB7e7i
         uQqlUBkiFY6bN+Diro83TAzQGXusWT9FMuSMxXqWMnjy4wj1nanE48g+JWbElsTfLIUq
         e/GJhyfsFJQXc4LOeWx21DuCVXDO0aAaJ3ik0u8iMqHcAxkB6DO+QVnl8wcyzEvVIX/U
         v3nTXfd141NnqnyDSmN7h6cpEyUsuA/nI8LVON5IjTApVuyXpMjh8wT6WLyT5JofYbew
         JDIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770003878; x=1770608678;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0jgsCpDdp/lW2kw7mE1/acyw+xEa5OKHQFKlf7uWjA0=;
        b=uzgNj4ndPGlFo2LInqTuqLJrInTdoaEp9OS4keeXc/zUQqV/2BMw7LlB34m3UGMd57
         RxqBj9Gg7kFi2tS6EBlITGMJpQ3OSs4N6vmU3PHvDunlzouUVmR2seP/c07heLSE6Zl0
         vZuNkKsPJoaldgo68hb4rsnKKMiJU7nRGxxLPeatdt9JnengkeifV8rju2yUeaeQpE/S
         RAkjcCCkLVO/VA/A2fvk+VtAvYUhvj9MguWtJxcBOwI3iNIV6r3rSYSzEBFIeitAlU3n
         3JeDvypHv8QA8dB/8RmKVu0DngcT2WsLgmFWXFKkBGRaNAjIh0qdh8Jw3JxWC0YohQlc
         F9LA==
X-Forwarded-Encrypted: i=1; AJvYcCUQV0MANeeQOqcgoVsHvmdq0Fs9e/KT33ReqN1AynOPjUPfK1RsPsfHvm93lo6bO5BQRxC30pFfPQXbww==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWa94XcMi0gkHWmkA9Mmo8f/le9zsmyr8XB2Blauau7xFVsM9f
	fWEnTxmK45lS3OWTTxF31/vbBlP1JOK9hKek0+uMGKiKOO0UASE2fmNh
X-Gm-Gg: AZuq6aL8CbHKA5V4LK6Ktl/A18coowtd1Cn+AzVC3kug1P2ukkMgHqJy9CG5U6zuNXu
	kOtZNV0+nbWZNssEM2Iodu2jawGcahgcYpnBzhRz8PHDmPU7Kziy0kXhwgcJeAc7leEg5zUH82m
	SRbx0Onf99Abqy1j8NDIo7SCLsJW34W9rsDONWqGSEDtW1arFhe0YOUaeSmgXrPF3nih7jD8RX5
	mL5JX42kXmhhlTE9mIFpcYGO00lHWTKUUtwRN3W85SbawGkQ8YU+nvpTN7w/OPq/8qLOOrN5GAn
	xKcFXdL67F7mQ2mvlcCWndEeCTUjOyYYg0lrKC6XhbLf8UqP3kZBADW9E7M9e7W2UiS2eY483k4
	TGMfC6vTCQlA3TqcDdmyntC1TP5ZcEmaeWO4OVaZfyx8USb5qimiPiE0oPMGPJtHGMGT/
X-Received: by 2002:a05:620a:45a6:b0:8c6:a034:921f with SMTP id af79cd13be357-8c9eb223ce3mr1322859385a.17.1770003878523;
        Sun, 01 Feb 2026 19:44:38 -0800 (PST)
Received: from ryzen ([2601:644:8000:8e26::ea0])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c711d6365esm1159727985a.52.2026.02.01.19.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 19:44:37 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Laxman Dewangan <ldewangan@nvidia.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	Vinod Koul <vkoul@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv3] dmaengine: tegra210-adma: use devm_platform_ioremap_resource
Date: Sun,  1 Feb 2026 19:44:19 -0800
Message-ID: <20260202034419.3958-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simpler to call the proper function.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 v3: reword title
 v2: reword commit message
 drivers/dma/tegra210-adma.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/tegra210-adma.c b/drivers/dma/tegra210-adma.c
index 215bfef37ec6..5353fbb3d995 100644
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
2.52.0

