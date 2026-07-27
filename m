Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B14432310
	for <linux-tegra@vger.kernel.org>; Mon, 27 Jul 2026 20:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184851; cv=none; b=hNRiFBmIzOB6VyBxHf0BjGmq9oBXOIeJF8J9nofNh33bhJ/Di9gziQ8MYyPhjv2ZC39arrmZr6A1/qVKND51szhhZa9EQjYbcpQcG6WqyWHiig1Xggkidw06XZGmpYt5bqiAKfQSMKjuCj1GzDYqPIZe+nUGu8uItvPMZKg8WRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184851; c=relaxed/simple;
	bh=5ve5pDndsPDZP0WKi71KXPZDrEU7yZApxPl3dO0zEos=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VN5HFxad7HxK6NvK0f/PzLP5/iQiQXBa99ZWl05v3EFipMyZKJTtNIykrWOkleVHpVdgJWg2WV/0wPz/7M8Oueuq3ZxSFCDIlJ+cc4bf4AY6lMEhoXum8LUDocebS4srPR04qqwqhnmZ/2Iqxan0NOELxHstA+0QN2XpuEuBCKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f2QdUkuV; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f2QdUkuV"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-84e84a6c4bfso268003b3a.1
        for <linux-tegra@vger.kernel.org>; Mon, 27 Jul 2026 13:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184850; x=1785789650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/b+8WgLLJBmMwH1bgcPTkNLrF2BAsgh2u+/vqL+9Le4=;
        b=f2QdUkuVPJWBcZ71//k/0hI5eLt1GxPDyaPBfW8TFyBFBfrHveQgU7As61xCkP13aO
         K3tX0YajHutI89OSu+owOs/p0Ifc4SUpOm8ZBsCQMfRxfzPdL6EzrUdB75WIVYrQgqiS
         HT+67GFPBjHlHF+pC4dgDLXr6IisWXR7mueU7Ta1afaAEfxPtydBMiBEUfl/TD9A4mWz
         qTFJJe4dn3y15EEc3/ER8oiPBvo5T7wz3LprJG3EOBvLNHffY7TPJxEgudtVbodre4qH
         2DfJjUxryd+Slm1X890k+KjCzL129LPXa+3ywTWggJSNdOb+NP56OQk+lTllkIM8B4kM
         9Slw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184850; x=1785789650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/b+8WgLLJBmMwH1bgcPTkNLrF2BAsgh2u+/vqL+9Le4=;
        b=feytmkMdpTbbzAJ0qXaf2lhLFUq1I0LCjmLboSTgyGwqBQqzsIXWHqMSn0AXlIxBK6
         kVu5vFGnTiYLfWoE2UjiqQvkSpnE1p3tM3QX8fEr04yQ3Ij4ViFr1CdRzlFgjvNmmm+K
         lYDSaUOEO1S2VHgJBRVAiK33sc25naYsxFfgLZFt7Pd92PdLdR6fohFq+5Y1ZZ06o+wo
         kCUudiGurHgAiJUtUNwrqP02FdAhC1GO65pLe3wSFs9CL7NV9apQMnCosW3zrhn+mU8j
         NINPUfXbBDH2uq5gq4Xy8AxoKE4MRRuX0NLedhaWHnIgwxLmBzYLvjP9Dp+a6kY4YlqR
         s6jw==
X-Forwarded-Encrypted: i=1; AHgh+RrmY7ypBB48Wy4MRxiALb9GuUms9Tp3KABGK/dufyjB2K51WmpTbepARCdGilEmm6EOcmq3JC5jsEyHjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzgLtXNe7QpzqWIpW9X6xMGT68to2BPgAXFjJSrBGHPbA4cRNSL
	1QbrjiYuXTQkxdox3YlZfRDGK4u4rXOdtqlQnxNu3Th4wvxYcm+TvZoC
X-Gm-Gg: AR+sD13G2frlCh1EOVn4oFrNHyz4iVqqw/iOtWc6T2+AI8UuzKK8HbPJDXofcCjBnPy
	JJoVuWrvvUFXefnHIzsSyIv/V1mFGjmuR2+4tAQsycZ8AXclJp10QcCG7i1+TuD2AAgQCZqtosm
	fOSQtMaSHiKIw2VtEkE/wkxRplAeZP30kOLpJtCO56pV6yORrf1FI/hRF7le4Co7o8iuKNyq2bz
	7WKUTb50ja7pRuT/nihLUjBoohk4JAmrVR2m7UyZ8MQEapZcaRxH4FFA6igXkcVSgRxfPNnzSf+
	oFpKXr9zLGfndxy2WS2aLmTUO8Ccy+GO2LIgif9HRWDcuzqU3S0JOnw9HSxmknYK7419MIAqLDB
	CWhq5z19MAJtRzi9rtolS13Uy6fpEbaMy+ej+arvHBt/LGRRcOwDlB4G0sqiA2SODcpgkHuVybh
	/stcBWkoS1gebiF4k=
X-Received: by 2002:a05:6a00:4511:b0:847:8d0e:5d83 with SMTP id d2e1a72fcca58-84e8fc8c483mr207641b3a.26.1785184850165;
        Mon, 27 Jul 2026 13:40:50 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e533d1351sm3583338b3a.39.2026.07.27.13.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:40:49 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	linux-tegra@vger.kernel.org
Subject: [PATCH v2 52/64] dmaengine: tegra210-adma: kill vchan BH on teardown
Date: Mon, 27 Jul 2026 13:39:14 -0700
Message-ID: <131ec17f48b91f3981df2d5e84fae5d43195d32b.1785183549.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com> <cover.1785183549.git.allen.lkml@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use dma_chan_kill_bh() for virt-dma cleanup.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/tegra210-adma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/tegra210-adma.c b/drivers/dma/tegra210-adma.c
index ceaee1e33e68..598abcc4edaa 100644
--- a/drivers/dma/tegra210-adma.c
+++ b/drivers/dma/tegra210-adma.c
@@ -811,7 +811,7 @@ static void tegra_adma_free_chan_resources(struct dma_chan *dc)
 
 	tegra_adma_terminate_all(dc);
 	vchan_free_chan_resources(&tdc->vc);
-	tasklet_kill(&tdc->vc.task);
+	dma_chan_kill_bh(&tdc->vc.chan);
 	free_irq(tdc->irq, tdc);
 	pm_runtime_put(tdc2dev(tdc));
 
-- 
2.43.0

