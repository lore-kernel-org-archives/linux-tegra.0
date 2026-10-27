Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793126621;
	b=m7krgDBNav2Os43MdrctiZxHqqKEOJn35epamtDHzkDGTwFKF818vhwE14OHb2u7OB+M
	 Uo2Pz2gg4sIT9JdR34L3UrJNV8Gh1pdpGIpagsE63SEFOno46NKFwIiJPWiAK0t7Umj8v
	 uI0ARnA5O+jfOqFl5+3kalXOf7HzC54qz4kNwaGhkvJl/VdORfGKh3jsrk6JP3hFTqE2y
	 XGMXu174uWECKHrmfxzDd1IAD1MEqNt1ElWQZDnVHF0F62leO4QKPGkXNXDqy5yDlVQ1f
	 QAbp7QZ9qKG10w7dQF/OhvvnLUsKgl/+376g2q3GZPA6KNggrtLbHbPf6QEMtzMwO4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793126621;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=ETa6PEiQPvx4Sm9llFa3xDCORaPT2KrvUrXEonwMbCs=;
	b=advXwnkqowQqRC+FKnovEf2JOUrB6eKFwCLO9/aG0pH0wwfSAwn5YdULU2VsaqIST9f2
	 gZF/tagqIO5SYRtm3JtVUVCZSD7abGSWfX0lirAGcteY7RtVnaY664z3cf2XLuzx+rkWo
	 mPptGzG6MbKgHzRM9U3eF/5YCs4egwhTjdJD4G1AtxEIu55dFJ6DZlLxV8Tbuuxm1Y9sn
	 EqobMvrcjqTKVXv9CHceNXD4dwPJmE0js/JrgvzqFO4qM0R6zwdH4fDiEVhDZ9UHOsFg3
	 EcXmdj2fyrVf07Kgc+dDdV6LpoD451YFPW32id+SPwisGfl5RMgzNn6wjYjuAjwNpEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oD4jcY1c;
	arc=none smtp.remote-ip=209.85.210.47
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB98606A320
	for <linux-tegra@vger.kernel.org>; Tue, 27 Oct 2026 18:43:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FB98606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oD4jcY1c
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-83bbcfba0ffso136701a34.0
        for <linux-tegra@vger.kernel.org>; Tue, 27 Oct 2026 11:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793126619; x=1793731419; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ETa6PEiQPvx4Sm9llFa3xDCORaPT2KrvUrXEonwMbCs=;
        b=oD4jcY1ckBrn+CHRQVBS4t7Gqd7I3QR1HDTTSxzsfsCSxcWeyJQThuiiRWuYZ4Fge4
         6hldgR44OA9FSOV+KLpiLU3F2F3r7GcerlTxGQaozu+0P3YB2/AmtvR8xJEd+SRU0er1
         NJ/F0wbZrHse2TmHLy3S6Su/JuOGAC6+zvDSOw2aemAmXLMvc3Qe3MjzfgTS3e292ybr
         nG8k9a2OtoVVGLohrW1vZWMs8k5ud+6L9TuhyQtsfPZtcEBPgAlPONovF3UV2vk9dkLY
         Eph1ZHn3cV2DKozFt5a76nNT6OiqerhHlwyPTU35ZgNydHsTDEnNHtAiHwDG/5d1acGP
         cD4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793126619; x=1793731419;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ETa6PEiQPvx4Sm9llFa3xDCORaPT2KrvUrXEonwMbCs=;
        b=pqsx3myLBuelGPNdKNpzFgT7o/EBeMke+J/cINBjZKka9NuOzeCcCe582reGkqkCug
         oQuf6iHuhmfXTydKFrfLalFutQZ0tsnGAquM2AwyZQxvdsP/b0diJw9S4fdpVDLZg7Wl
         Zd8+QYcM8JX7Yyw7ZmZb1EphP2zlOKC18vLVhjPnHc8FNv9HXZNSnZYZYVL9rqP/SJ6B
         hiQIt/crIY5woqQU5mqEyS3PDtXCRce4nrrQh4C1nKJtJ8Le53Q3j5gGJvsErP3E2pZz
         7O/P3i7Y47yJrHSiHZbJusV1PxTwAmce/eBde5ohG790iF7ppY0HI3R6x5y70Re+3nsg
         ATsg==
X-Forwarded-Encrypted: i=1; AKwUvByPTk2l765FHUqYN46wHUYBJcOOoOQxTS6rGbL6cjDAYP9Sp8SSjXEaOSsZEVPsHzYvLRT6obD2VTicAg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIsQgSSBSctmLqusQr2GbRyQ81Sk42baUR4PlZDkbRjonbaAR+p
	K1sbUw3u48OAOXOO9xg2+OMAlRFTCLLjAAEPZTZo+hnLRE41WbCtk+g8
X-Gm-Gg: AYBFou1UXIk3uW7FU6UBD4yiy2OL/DVtOYqqy2+RuQDmc51QaAYNTAaBRETV4nO2oS5
	mhL7FNB8pw69vMttrwRTLW+srYD4riTzJqWYpB7ftCr6LmECd7xwJEFS8mFD3p14nQhphOQOMlw
	HGN0bTK0coly4nU3E6gyGOU1dH2a5PFKXEZ+hID1uJKhSMrf7947pGKtW+/zyDfGm54KjquDwiK
	4EHFCQvPFFaXhcIqC5h4xWXUmjgCas3hO5RuxeqZvA9gBVNRoGmQcQcSKJhjFtmTc3t93ygwmtV
	cSSN1rSnXSdG5jwq++g7SiPttnLwMUaRo1JpGJq0rHHO8DTmtGOOILHJvq6Cv9LpzJOHIyytvsx
	Zb+M6CwsoDI6IbkebPW9k0h9uvwakUDYXy4hb+qv1z/NrNrdgqDJ6AJZFH1uCCjMXBevFgPZywv
	xYj12oRgplFBQlgQbYpqZgYysPACM6JRJy/hWTUwoNBF9FPa5dvQ1d5K/dKx/Dg24YaQsMuyw+2
	tQnJtLW+twKaJ7robFyfwELqMYCchTZ6+HpbOSBm435scVgAoPYSR8AZKOXA+hf+z8nnwgghgE4
	7154kPXmKMbWdldLelz6XFNDBW28/90GseBFKbqWeyX7UAKuZKa9p3IqBVVBJgKsAphvNsWu/M+
	xEe71i1AOfk8G0Mj4gf9UG1ESttoiqoov2aIahJw8JEQ1+LS9ENxV9eGnvZYTFJQC25xNM8GTg1
	BEdaM=
X-Received: by 2002:a05:6830:230f:b0:814:57a9:4243 with SMTP id 46e09a7af769-85abdb098e0mr329067a34.17.1793126618937;
        Tue, 27 Oct 2026 11:43:38 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-850fb074fb6sm12488338a34.12.2026.10.27.11.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 11:43:38 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 27 Oct 2026 12:22:27 -0600
Subject: [PATCH v3 2/2] dmaengine: mediatek: uart: synchronize completion
 callbacks
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-submit-mtk-uart-dma-synchronize-v1-v3-2-aad7a6b3c62e@gmail.com>
References: <20261027-submit-mtk-uart-dma-synchronize-v1-v3-0-aad7a6b3c62e@gmail.com>
In-Reply-To: <20261027-submit-mtk-uart-dma-synchronize-v1-v3-0-aad7a6b3c62e@gmail.com>
To: Sean Wang <sean.wang@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Frank Li <Frank.Li@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
 Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Zhou Wang <wangzhou1@hisilicon.com>, Longfang Liu <liulongfang@huawei.com>, 
 Andy Shevchenko <andy@kernel.org>, Keguang Zhang <keguang.zhang@gmail.com>, 
 Binbin Zhou <zhoubinbin@loongson.cn>, 
 Taichi Sugaya <sugaya.taichi@socionext.com>, 
 Takao Orito <orito.takao@socionext.com>, 
 =?utf-8?q?Am=C3=A9lie_Delaunay?= <amelie.delaunay@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Laxman Dewangan <ldewangan@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linux-mips@vger.kernel.org, linux-tegra@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, Frank Li <Frank.li@oss.nxp.com>
X-Mailer: b4 0.15.2

Terminating a UART APDMA channel waits for its interrupt handler, but
completion callbacks run in the virt-dma tasklet. A callback already
removed from desc_completed can still be running after termination
returns. With no device_synchronize hook, dmaengine_synchronize() does
not wait for that callback either.

Use vchan_dma_synchronize() as the UART APDMA device_synchronize callback
so clients can wait for completion callbacks before reusing callback
state or freeing DMA buffers. Keep the callback wait separate from
device_terminate_all so it can run without locks acquired by the callback.

Fixes: 9135408c3ace ("dmaengine: mediatek: Add MediaTek UART APDMA support")
Suggested-by: Frank Li <Frank.li@oss.nxp.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/mediatek/mtk-uart-apdma.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/mediatek/mtk-uart-apdma.c b/drivers/dma/mediatek/mtk-uart-apdma.c
index f74e9a328588..6bc4f20d8b06 100644
--- a/drivers/dma/mediatek/mtk-uart-apdma.c
+++ b/drivers/dma/mediatek/mtk-uart-apdma.c
@@ -514,6 +514,7 @@ static int mtk_uart_apdma_probe(struct platform_device *pdev)
 	mtkd->ddev.device_config = mtk_uart_apdma_slave_config;
 	mtkd->ddev.device_pause = mtk_uart_apdma_device_pause;
 	mtkd->ddev.device_terminate_all = mtk_uart_apdma_terminate_all;
+	mtkd->ddev.device_synchronize = vchan_dma_synchronize;
 	mtkd->ddev.src_addr_widths = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE);
 	mtkd->ddev.dst_addr_widths = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE);
 	mtkd->ddev.directions = BIT(DMA_DEV_TO_MEM) | BIT(DMA_MEM_TO_DEV);

-- 
2.53.0

