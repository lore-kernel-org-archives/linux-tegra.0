Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D529050096E
	for <linux-tegra@vger.kernel.org>; Mon, 19 Jan 2026 23:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768865177; cv=none; b=EoQqmvW2oLDITJEWJ160nvrbDvwXOQMhnT7nv7R7ZiTE9Z/7HoQhlTBRo4i9lMBQon8WB0kZZhf4FTUYUY1u8/Qx9HW1lXr91QY4WHB2NXJ7725cTMscY0RB1U1Xrjh+dF0vfHt8p+1wq54OEvNaCH8cZALlotnMhho0TSxmc/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768865177; c=relaxed/simple;
	bh=1MNtHKJboIytqAn8D093hCtbngd/ZolnXDwBMwLltdo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AFN0cXCt7uUZzqscZlbUG2BR0bLUytogIAUPNKQtsBkWUOZ5gWRq76vxrd9C6kA34e05Dq2kIC44Q9k0Rrpq6kVsMrHW3MGEx71TAJVg3js8Q02YLbp2Oso8Si1fEsqr0OgopfKtMWFQymAv3/Us+DZyYkLCMOv0XBQG2kuBZWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dhqMxntS; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dhqMxntS"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c0bccb8037eso1948214a12.1
        for <linux-tegra@vger.kernel.org>; Mon, 19 Jan 2026 15:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768865175; x=1769469975; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z0vpLCJZXxjsKEBOE8IfRD/+CdPfHIJWtuF4tMUY63I=;
        b=dhqMxntSYADGEqkcy+eN+6T8zaPAYoO7V5xPum6felm9/dDYQU5bA0+IsG8yUF0OdX
         AUU8Xh7oYwDbgwWdxlPMY007SHdR4ORR9njA8ePNcBLcyS4oRjqpgq2DS1uiAkuEoo2V
         tmSJPvVIolOY6pkaN4SFWzbf4/8H845J/SLFdt0ItrGlgbdHaKCU/be8zwQKF5kq3zZk
         85mTDiW3V6WOuy+n/SW1NngwVIrJBz63AHluZmSxo3rhsbOIn4KXBrpyBwSEMENva5zm
         kPR8lXdPwBNqfK1MWXbO7GfNESikttGPwYVkb6fydPNEUaeleVU+aIuFRaMReTGeJYsO
         2xYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768865175; x=1769469975;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z0vpLCJZXxjsKEBOE8IfRD/+CdPfHIJWtuF4tMUY63I=;
        b=CbWBtQGbLH+ljInFCpjnHCdWwh6LtyS3y8LErvcLETw9SqnjbTQgkayubMHLpDdVml
         ubkNzVuash4WQFuKrfHnsY8U0D+Vvv070hZ1HlADfdg7MrlvqjaIUdqeFN+jK3tutkjq
         7kEZnYCe9dD0TObwKsHg7NAxo5nJPrkqqtZfVH8R+gruArUQFqnbYBXYbw5WQSqV7Ozo
         DqwZ3jmsJs2g20/Av6Lf1S601X7We2bJ2TXeYeHVjHSKwflU/QSLRN7afsY1s743D17Y
         8MxqaOOF4hzv31+ZWPY1Di3pp3nSoclvUVLq/62ZVrZwc4/LcwxUqE+tPbEdV6mLqtIx
         g1hQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/eHtc/Krk88Kctf2Ux0JxM1EjlqwxBWKhzmMPVIkl2IxUdfVVHQGBQS76g3edkvv2yj8FNm+iY8RAZg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4ttEMlaYsqJkiF+6eww9NJtdXrGuWCNPAWO4PDuN4QqWUqQIp
	a40mkvmoGuwNO5XFPrBUMDivxF+AH138PmAl6oh+bmYJsO5LE3Mq6KEb
X-Gm-Gg: AZuq6aIbasQ/ROqT40UrdUqof31+FH35WLQobQkLGltBJifoE4um+po7cK92Y4pWEOM
	zy5ku//sYhjGaQ+1PrNc2fjHtOfvQGW9b50vwhIhPHPAWzTRzxescEoRxeoMgdTHk3ltIorVSti
	lfD9SLhs/Jw2CyB/9MI29DxW9CUoZKNmHEiwMyrApUmGsVV5CXenq5kphsX+ra6O2WECSH8DBPO
	L+N8K9gqkClyd6d7zZEJrk+5YEzv8ikf3g9u9dLqPX2JZTqJqC1npBegiCHbZI3OXXXAXTgaz74
	10G/lxiNoNEJI3xF/2BTjqANyimk39wwklUtuXg6EJnLMubhcXS5brTxF7ZY5Ja/ev6I+/FfoSZ
	0zqJbBsfrXbiDRfMZHHzFd6vfsgTVekvtgddMk1dxTBDQX7usL48/aRg8QJbAnHUNeGsi
X-Received: by 2002:a17:902:e80f:b0:2a7:682b:50af with SMTP id d9443c01a7336-2a7682b521bmr702345ad.40.1768865175221;
        Mon, 19 Jan 2026 15:26:15 -0800 (PST)
Received: from ryzen ([2601:644:8000:8e26::ea0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190ab96fsm105399185ad.13.2026.01.19.15.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 15:26:14 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Laxman Dewangan <ldewangan@nvidia.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	Vinod Koul <vkoul@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] dmaengine: tegra210-adma: use platform to ioremap
Date: Mon, 19 Jan 2026 15:25:57 -0800
Message-ID: <20260119232557.10818-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify the code slightly with devm_platform_ioremap_resource.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
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

