Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B3B35AC3D
	for <linux-tegra@vger.kernel.org>; Tue, 24 Mar 2026 18:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774376917; cv=none; b=vCyDbiKtZaU5sf8kZy6JJWaFBMejUQd0Zw3aJ3VymqLFf9r0eGr1G5FsTreQVmMBwPgbVCiQg6esQ4DQqfZFTN442RegPwexbb8YzE/MO0742ZW/rueMk0E75b4EE/vZXkrlhCvkHHydbc+04G+oQMokZYU7UbxD6wzC2aeSyXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774376917; c=relaxed/simple;
	bh=InYIOZ74uRoVGHRDFdN9ukawBsa/EDFlsLY4lGClCxs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N9rO4bTmPqUzz+aKiayrPjae3SyE0sbP/vM4cvckPG3TuiPbuXWe65N74NsEF2g/cIdBBVvTv4h8pc1RzkaP6c/t60pIyw/ehRWp+YwlcCrpNzXOXa3amf0oxguuW9M95qq6uX9jyN4OmRPDaDiOkPwWKgLjGotkrBdvq6ey6ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qAnF8TBl; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qAnF8TBl"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3590042fa8eso3729180a91.1
        for <linux-tegra@vger.kernel.org>; Tue, 24 Mar 2026 11:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774376916; x=1774981716; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pWQFrxeJ9xbwYy1VhHH7N7bPolG8RRVJqSZfUbUVPdk=;
        b=qAnF8TBlRT4R65eQu95gtSWiZ7VeUtt4W77VIKMKI/UO8AMGqvEz3rcekBF1eLhSWI
         SXksNJlNvnHZzqCP8dPzuxK4GC8UjEBHiox9K1wuja11qXhN8k3wTZTYGS43PTbtY+u2
         Hnf2OeZhAIGMOoYQKLqd72lIIuT78mXFI9vtNlHo7JjHZ24hb/bebzrXpsO3vyjCroZt
         4O9Ew1bajxCTTiV6txX6T0y3vBW48sJKsHbreMGDyt8LOvb1UZ2X4QNV63VW/+hOkYal
         18VOukCrtxQyn2VkS/57y+UaTBvD3CAt4I5C5eHDieMQdrgSxpom+cblkSDhanUh0SMC
         NF5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774376916; x=1774981716;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pWQFrxeJ9xbwYy1VhHH7N7bPolG8RRVJqSZfUbUVPdk=;
        b=KHavlKbdcoGjQYgfwsNkRLzl0uOd7MBW9fJBFQRKtL2yEChzhomXLnA56Y7i/TB6Zr
         XCrO+6BUxDSiagl0IXAnvuxo7HEWiYjalzh/H8f8bEr/o64XKdGZEPNcj0z8SoNXNyGR
         olC3GhL+BntvsYNt7TG2DVPnNwUjSPW/dmXZ1JRYceb1Van1BPnKfqwACTX7zQsp3NTh
         UR970SYIEp8fYPqgGRQQVcaTnMgbRo74SZAQ3kcq+rafJGMsZqWGHhnWTveTpGOpvmse
         MqfVEqMrnBoj5FsR0mZ1vdvmviKW/L3RXQJwmZRE8dhIQ/6zYtO9JaJTqnlfgRePwS51
         tQzA==
X-Forwarded-Encrypted: i=1; AJvYcCW6ioR1TJwF88BoBM00ma+lxzTS4lhQb/beS/SSk4GktU2Py7bYZDdmtBPHYVFkbYEnX9iqu1dkSyQ9Ng==@vger.kernel.org
X-Gm-Message-State: AOJu0YzznM7xaQoPN8qB8RHJMlU3pj2fQJNhZsF3xCQxqJRtqmKYbGy2
	kNglQPjMOJgsYlwzW1ayjaTVmVSJuerrbv63tvclGPeojr+xZFMFaoq1
X-Gm-Gg: ATEYQzx4cdKheCanziJuBnrGROCy0sCNWkPhdP6cPIbHqpYn1oIyHT5wxBb9NS/wHkN
	KPlQOqd9oB+Rt14sUDYRqywptn5AKj6J84oGxk2WFiZl+4ZQcNDQciZ9BW9Y0LpP/YYwe5LPzg7
	snh7kbxYrKFPk+XfS3DVJyhuUNRsCLoUycLx0+2hXnkjsF7KLW1J5mJ92c44PZrbqz1u4/OMh10
	/cnflHjuIWKPNlFq9LlhUc8oaQG5C0CzNDNvA2A/gtflyghgIvV+4YiWp9oUmibeB5Sybk6+Uwq
	1x3R84mXNLcYelQGeXLDuWNg8rbBfDrd9neddb8o+YQ7PjpMpzvouBlMyzQJEJuoMTL2pYmJ0P8
	7IWuy7wO2iRSFNvDjsgqamPoH5gMoH8zHAFBrqHdtN8FcWAKl32/oA6HqVPeB5jIN9n3OQTKGqw
	obFyvf93vt3LTyMNfygJOAKiwd3A==
X-Received: by 2002:a17:90b:17c8:b0:35b:e555:f19 with SMTP id 98e67ed59e1d1-35c0ddc5abamr302415a91.25.1774376915602;
        Tue, 24 Mar 2026 11:28:35 -0700 (PDT)
Received: from [127.0.1.1] ([103.216.213.160])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c0d6060b5sm350576a91.17.2026.03.24.11.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 11:28:35 -0700 (PDT)
From: Atharv Dubey <atharvd440@gmail.com>
Date: Tue, 24 Mar 2026 23:56:56 +0530
Subject: [PATCH 08/10] i2c: sprd: Replace dev_err() with dev_err_probe() in
 probe function
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-deverr-v1-8-7e591cce33a3@gmail.com>
References: <20260324-deverr-v1-0-7e591cce33a3@gmail.com>
In-Reply-To: <20260324-deverr-v1-0-7e591cce33a3@gmail.com>
To: Till Harbaum <till@harbaum.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Laxman Dewangan <ldewangan@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Jean Delvare <jdelvare@suse.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
 Enrico Zanda <e.zanda1@gmail.com>, Atharv Dubey <atharvd440@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774376818; l=1529;
 i=atharvd440@gmail.com; s=20260314; h=from:subject:message-id;
 bh=ASHKLgyhVdhgUS0PF+wcYp1muqF4w//oNCLBXZkcUHY=;
 b=hXROFYzb3OmT3cxRxEoFIuEeGuiZJd8xLM4x0yhyQx4WWK4SUYX6zSFRnwpUkd47L0bbPAvtp
 mE3F0pCOHTsA7C6xaX1n86n4DvW3PrzzB2RQAlr/W45yvtlvUvwnwXb
X-Developer-Key: i=atharvd440@gmail.com; a=ed25519;
 pk=T6i1xWOKT/RUSDYATSgyVG/4X7ac8jPjRSG1mMAcqVk=

From: Enrico Zanda <e.zanda1@gmail.com>

This simplifies the code while improving log.

Signed-off-by: Enrico Zanda <e.zanda1@gmail.com>
Signed-off-by: Atharv Dubey <atharvd440@gmail.com>
---
 drivers/i2c/busses/i2c-sprd.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sprd.c b/drivers/i2c/busses/i2c-sprd.c
index 1b490525d8dd..7b321a956fca 100644
--- a/drivers/i2c/busses/i2c-sprd.c
+++ b/drivers/i2c/busses/i2c-sprd.c
@@ -469,11 +469,10 @@ static int sprd_i2c_clk_init(struct sprd_i2c *i2c_dev)
 		i2c_dev->adap.nr, i2c_dev->src_clk);
 
 	i2c_dev->clk = devm_clk_get(i2c_dev->dev, "enable");
-	if (IS_ERR(i2c_dev->clk)) {
-		dev_err(i2c_dev->dev, "i2c%d can't get the enable clock\n",
-			i2c_dev->adap.nr);
-		return PTR_ERR(i2c_dev->clk);
-	}
+	if (IS_ERR(i2c_dev->clk))
+		return dev_err_probe(i2c_dev->dev, PTR_ERR(i2c_dev->clk),
+				     "i2c%d can't get the enable clock\n",
+				     i2c_dev->adap.nr);
 
 	return 0;
 }
@@ -548,13 +547,13 @@ static int sprd_i2c_probe(struct platform_device *pdev)
 		IRQF_NO_SUSPEND | IRQF_ONESHOT,
 		pdev->name, i2c_dev);
 	if (ret) {
-		dev_err(&pdev->dev, "failed to request irq %d\n", i2c_dev->irq);
+		dev_err_probe(&pdev->dev, ret, "failed to request irq %d\n", i2c_dev->irq);
 		goto err_rpm_put;
 	}
 
 	ret = i2c_add_numbered_adapter(&i2c_dev->adap);
 	if (ret) {
-		dev_err(&pdev->dev, "add adapter failed\n");
+		dev_err_probe(&pdev->dev, ret, "add adapter failed\n");
 		goto err_rpm_put;
 	}
 

-- 
2.43.0

