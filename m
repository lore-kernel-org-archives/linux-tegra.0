Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D56309EEA
	for <linux-tegra@vger.kernel.org>; Tue, 23 Dec 2025 20:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766522829; cv=none; b=rrbvK0IcI3F+DeZJodCHZjTm9ZKqvOE2a5r3LR2ONwas5Hqob1L2+Dllsibwjgya9zY1fEzDk/cFu/dRuevMwb5q9s7jRD1H/90tuyK+r8yxp/DkUTNol7yovdvVnlSdjw4sq03RRaXVTHyHMNJ7SlrxL1jvoECaiu1aux2qoCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766522829; c=relaxed/simple;
	bh=3d4OKNlzKWCjWAaPIKmGWLQfdrv/dO6JCfyye/NB2lk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T0+gxXiox7/9mXNs2O1JGq72O0uzhG3eewIdStHhspOJqvQzZWT4UX6VpVLMpIuW8pE3yYQGjGu1JPpNDxoTx/3/pnv8sOjfdxL2ka66afuWll+mIZjvTlrjJQybGCtU9R3HXgBGAd0AVIRBDnaZmCy5uPjVmnPUNVP/dLFVweQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PR2L41MZ; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PR2L41MZ"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2a0d5c365ceso67821425ad.3
        for <linux-tegra@vger.kernel.org>; Tue, 23 Dec 2025 12:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766522825; x=1767127625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iq0j0tbdVnJAA23CTExCnxXrx5D9T13riCwpcS1VEEs=;
        b=PR2L41MZ6tzUJ//7bhCXTjoApaB3gjsEC0pufy9eyh4yuIU73PbVlRbOdFSK61ne5W
         Auolgl2Jzq7BXSFzX1HGYA5qRkZbRlAmHL1Cgn3v7z7VVXV5EW3bAKoR6vhFUTtmjhr6
         O+LDqUfFaCjaugkYr/uRSZekylK6pwowu3AdC6XiQxRxqAhLVIQzGXWphP5+nBhZSSZA
         hbx+B8mEgTqY9M6++AWAVLa38sm6ClRoCqsQKCQcfXAu786bO+4SWndvTngIceLjXehZ
         qC1y0Cz19RYSwWxyn/zGaM12EmGN3KO/JWN0YM7ePNiv5m8iBqEBghI3h6M+gNc6U1VO
         wrSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766522825; x=1767127625;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iq0j0tbdVnJAA23CTExCnxXrx5D9T13riCwpcS1VEEs=;
        b=kRGJnxD3ADemzMnRU0dwOVjOio3M3AtW9cp9uZ6dDKg8FWHnLalo0BIrjFfHQRC3St
         f/vn+zq2rpKRoSstWZW1FMFDCZyp3OwQxPMpFnm4biDnmIxiKPgLDDpydT8eDy/qEc/U
         b9biuGXFkkmvTCahVMF3vabqUDJ8pbrrI4X4PtbjUnZ0hcbo3Ks3qlVvZdQkBJLeke/+
         eMiyodkpgYcvcy0vs1XFQGRLRfDzurJ/Ppy/JQZpUCbUgQSMDcPJldOocL1+3PHa3Szm
         9EnZJeBX4gG5h7sOu5kc66gG9w9fc3SR4Pxp9DWC90LypyXXB9QmgIXbb8Lnnq+K8ZgM
         erNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVauaZ36qCeaIdm9BO4ad0gfTDr3tWVxfRL3cNWp4vRMnTr099r4wl2leuwT4LFaY6BJxzuMD+59EQ1HA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWX2+9zvuyUjkWG9FAxlHadg9Yb1fcaZYY8TeEkYmedIyU/ZeQ
	Rwhkc+143t1EpUrb7qQKET+FU8HQGd6QCcyC2PHq8GvoHiTHXEkdHOyq
X-Gm-Gg: AY/fxX7FGFewt7yjn2TkyUxhHcNRceaS2k5zyq42RgZpkrAcwKnYKJ6Qylzw9tNqU9k
	8sCdfN15qtDA9ah/GV2Z3rTuhHDjk/oZi86sukdpFBRVJqawiJPuBOngeB6CavFKS48zH3K93Ft
	18ejye2eVxorq3kvf0XbXO13oYjms91WCBjWDDmSA4bO+VK7Gc8YrUCtf7xgUAxxqcsd8panhdR
	lNqDC5z+Q1MXR7BuWnE5vTPLAVd9/xMFaNnXpuyRj7NA/2Ko1mPMEAu+0VnMt7H52wfIet9aa1P
	Nf0sRDs4VwqNt2H6I79dF+vdrY/ALDlE0fYagy1oUpLuQ0r76ZQCA3HUyNWrIN5sdpF7YjxsRWT
	wbn23UqIOcDkm515aJ6FMn+bWUT4Gkg3jWQUyygkuY9CHNd7TP0UP/Jln0jRbzp7l3PwN
X-Google-Smtp-Source: AGHT+IHS2NtUHegFOEt7CP+ojUG3bqkkAvfhDyQQyX4Z7DAyzki/HKyxB1pTnMTphYfOx3KAPuFJpQ==
X-Received: by 2002:a17:902:cf0d:b0:29f:b3e5:5186 with SMTP id d9443c01a7336-2a2f293d13bmr151099575ad.56.1766522824768;
        Tue, 23 Dec 2025 12:47:04 -0800 (PST)
Received: from ryzen ([2601:644:8000:8e26::ea0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c87845sm137642545ad.39.2025.12.23.12.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 12:47:04 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Laxman Dewangan <ldewangan@nvidia.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	Vinod Koul <vkoul@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] dmaengine: tegra210-adma: use platform to ioremap
Date: Tue, 23 Dec 2025 12:46:46 -0800
Message-ID: <20251223204646.12903-1-rosenp@gmail.com>
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
---
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

