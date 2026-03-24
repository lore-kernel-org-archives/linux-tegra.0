Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7EB739F192
	for <linux-tegra@vger.kernel.org>; Tue, 24 Mar 2026 18:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774376894; cv=none; b=KlTk4+7e0/5zJFtUFSVbJOkbUhff7oXcxeQbq/6zd+ktAMg5exjMpXzwvGZQ0RYgYGYYxc9YEQu2CJv6SN/k9SZLBO2Rl0FtDHIDingu1MwWzUwhG4/g3sDKsOAXL8UOvbvBqTWlOQqTpLEgdKjhhvN+/mjNF04bZDGaEx19nPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774376894; c=relaxed/simple;
	bh=iap5qBBPM9+z7GkIgQPTPNBQ4CZotIn48Ss9ISZDGxI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jwwqv+OlDbildmBgZwJlBbQ2cc2vABgXCA343uN2nItoO7KhndO2ki/eeH4qeh1EkHAN/z5NP+/P6Iq/sNWkEuUnSWXdJDpqqua/6tFAIjmINEGzS43qoKDMpVsqg88d/8vQ8esN3mC5JNYlHuaPq9phkS1jGv7EGEAgUnpGOZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FKoCeDce; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FKoCeDce"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-35a211df8e3so1069740a91.2
        for <linux-tegra@vger.kernel.org>; Tue, 24 Mar 2026 11:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774376892; x=1774981692; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LOh7L59SGXDe0n/0/CxydhLmu3Ccl2K/OUt14k5rUoM=;
        b=FKoCeDcel0G0anI6qTVqErqOwL60iPwadrkclMevwba2YpJpSB8NUHG+kmnypHCqRN
         gOyu09/OzA4cQFLGKSNcf0Kt+Wfpb95E22E/fhzEf1PqwfPDnnzfAa6lWOyjbLxQMtAV
         UIn3hZOLcB0FwgSNahhtfHE/U0TEebgJkVvvY3O7MEfJgwuB6Eqp0a0FUZl9v16fTNCb
         of2L9Eo5qthsbwzP7RSs04VhPhNpOBt2+RXLSC8CfKSJnZq0uPjxBRP69m+Bo6AXwT5R
         p7AwEFYOXRy3M5tbRFLIneQn2+1rzYzLjfP4e3oTt01TZpX4SNPD4h4zwd/aG50SJdCz
         tSUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774376892; x=1774981692;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LOh7L59SGXDe0n/0/CxydhLmu3Ccl2K/OUt14k5rUoM=;
        b=kxmfIp8ml4mk/yJyGwZDN9Qyj4rI6QVlVmQWhEd1nWPb1B0dWfiXIxAv6a7oenzCXs
         o4ZH2EWQTSRRBCXINVOBa+1jGMQ6cqFutvZrI7NysT6eBJdXTavzJ95hiHyp+N7jtNcF
         +KBuxbfTEEilcPPD+gRzTh8IMYYl5Itfk9Hg+mfY5GGVJM8/r7Qdc3xkizrHoq3NaHZN
         YAXlSj6Iu3dR1sVTk6P6O8XH5bhjmYeVEAOs3dkbDqM8oo7ez6ax33vKuf+HaOThSsY4
         oQiXVEhOnqdtmxdECuBew6YBlFA7g7LynsRE9zpfn1IguDqfMHxOD5/sf0+WS7ZkWPXU
         dgyA==
X-Forwarded-Encrypted: i=1; AJvYcCWrYgAEKjBIQm53UnuFT93aGREmh7jE5ZItUGSPeCBsAuR77t2Qwla7OPOMJi9q/trthMGmV5mjhfImWw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVHwhMBaS1FI/WF2jCCtOnUaqfdDgtPcuW5KQQuvbQohieN27N
	U/+mMJQr/rNfVHySYs1kkldSWSPPVthvBUjh2cpC5AsESKR1pXUKTy+n
X-Gm-Gg: ATEYQzwZ+iBFiYPxYw1yPzxiPUHsqkRMCKqQ7vtaohoeKwId2jnsUCr6uWb28flOvjD
	Dg0Ps36g5KVKqo95HuCY8p/XHxVel9umIhqJv8O2Rfgzg1T+adixnr971pKE4rgFaKwNONl3mQS
	rKLgdjcFH9QqPbjhkCwM+aZCV1cNVlYkhQk6B06gS5VaXFUxnoYhK68rt0SXW4L43463ePRjdFW
	K60oS3LC8lGtEblnRNJPuJH8heWxrjdX6FVhBitpMyKfHfYOx+P5wipMRkDkQscAS0u5HhQ2RyK
	bcYTZIMTwBOyFodC8/Lbez5DtrpeurDqL+I2SXSuB1Hd0/KwESHY+pEw7S4nCFCnz98v6SjejC9
	e1sxcW3FyZjH8DnT/aT+cbfDIWK27MxMoiwumqAwMCm6SlFkJCs0EuX870zo0goY0ApkZBEXG6b
	L8LY8Q2M3cllbhO1XDviT4w2Sqeg==
X-Received: by 2002:a17:90b:4a4f:b0:359:f22:8879 with SMTP id 98e67ed59e1d1-35c0ddb253amr350462a91.22.1774376892133;
        Tue, 24 Mar 2026 11:28:12 -0700 (PDT)
Received: from [127.0.1.1] ([103.216.213.160])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c0d6060b5sm350576a91.17.2026.03.24.11.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 11:28:11 -0700 (PDT)
From: Atharv Dubey <atharvd440@gmail.com>
Date: Tue, 24 Mar 2026 23:56:54 +0530
Subject: [PATCH 06/10] i2c: stm32: Replace dev_err() with dev_err_probe()
 in probe function
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-deverr-v1-6-7e591cce33a3@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774376818; l=1144;
 i=atharvd440@gmail.com; s=20260314; h=from:subject:message-id;
 bh=fGh6XbxSkvU5zsFALrHQqBdXVjE2X7LO7LjtYihQc1Q=;
 b=bSr5WSYN2sBbQ56eV/RU7Nsc30A+f8iif2b8KvF+i2QPU4oV/n2gxZwRlmFwYUL0Sn4WgwU3t
 BHbt5Op51GJBjc0aJ76ljbLTb0hDHykJdiMU+4SpjB/VkJQQUf6r5CT
X-Developer-Key: i=atharvd440@gmail.com; a=ed25519;
 pk=T6i1xWOKT/RUSDYATSgyVG/4X7ac8jPjRSG1mMAcqVk=

From: Enrico Zanda <e.zanda1@gmail.com>

This simplifies the code while improving log.

Signed-off-by: Enrico Zanda <e.zanda1@gmail.com>
Signed-off-by: Atharv Dubey <atharvd440@gmail.com>
---
 drivers/i2c/busses/i2c-stm32.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32.c b/drivers/i2c/busses/i2c-stm32.c
index becf8977979f..064e47d6c96f 100644
--- a/drivers/i2c/busses/i2c-stm32.c
+++ b/drivers/i2c/busses/i2c-stm32.c
@@ -39,7 +39,7 @@ struct stm32_i2c_dma *stm32_i2c_dma_request(struct device *dev,
 	dma_sconfig.direction = DMA_MEM_TO_DEV;
 	ret = dmaengine_slave_config(dma->chan_tx, &dma_sconfig);
 	if (ret < 0) {
-		dev_err(dev, "can't configure tx channel\n");
+		dev_err_probe(dev, ret, "can't configure tx channel\n");
 		goto fail_tx;
 	}
 
@@ -60,7 +60,7 @@ struct stm32_i2c_dma *stm32_i2c_dma_request(struct device *dev,
 	dma_sconfig.direction = DMA_DEV_TO_MEM;
 	ret = dmaengine_slave_config(dma->chan_rx, &dma_sconfig);
 	if (ret < 0) {
-		dev_err(dev, "can't configure rx channel\n");
+		dev_err_probe(dev, ret, "can't configure rx channel\n");
 		goto fail_rx;
 	}
 

-- 
2.43.0

