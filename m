Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53394C07E96
	for <linux-tegra@archiver.kernel.org>; Thu,  8 Jul 2021 10:32:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 32B5A61467
	for <linux-tegra@archiver.kernel.org>; Thu,  8 Jul 2021 10:32:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231332AbhGHKeu (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 8 Jul 2021 06:34:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231470AbhGHKeu (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 8 Jul 2021 06:34:50 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63ECFC061574;
        Thu,  8 Jul 2021 03:32:07 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id g10so3762877wmh.2;
        Thu, 08 Jul 2021 03:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tO5HC3gfmh06E2sEiP3cU1erx77lS2IeuRXzwxdfzxI=;
        b=uVJgCFDb1ggGJRSuhFrurxiWu+llAWdvcyt8LrQgCHxk953RMruRelUJes2MTLCq24
         IUCHHT/EII4lN02aj3kvJaG3O7XSjzkjCuw7uTarkjfjFzNdk26XDOt74IGa51bFOPqE
         ZPJrvHYWXSeb6P+97YV4kA2Hr4xz/T5n1TPsKWG5NkyASMJil8Tazqr+KhC+sV5Swsoz
         XqM+MWL4qkab8ZhfxUcJ2e1w0z5D/nbDb3uFLxc7C1/kNdI8NmKpejbOCkVNbnqLsClG
         A8lGtE2ylp/JrROlBIAJCMg/J/CNAa5EZsxhBDZUpjEZafjbv3A12Fd4g0drmVt5kuDx
         ix1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tO5HC3gfmh06E2sEiP3cU1erx77lS2IeuRXzwxdfzxI=;
        b=uT8UVW/vEJ5NghpCf8SiZBFBK1UP7YvtkGVXwYFfxYvkykJR8QD0AdN99Yz7cVTqCT
         xXk1vD2bq9m3h6tAS3fb4It5Ikzbq6BNEnLRJyRFUqEmBUwZBdI3jOt6B8ZoL1ITchYZ
         IQ0ePc0TzTrz4Z+kr67QOw0U0kEyttuFuJgoCiRh8+Uc2531+DKmB7rszy58K3iZttoW
         oCDaKzXA01kbPfcFEnkap4+To2XS3e8nbEzbtntD3O/j7u8Bs9mdWhHYQgYeHBBYu0FS
         mwyPvYbyLMU6+8RgjydmntK4RSuysnDEj3CpltOohi4qetzYWiNtP21dSpPBe/RMzuJI
         QrJw==
X-Gm-Message-State: AOAM531AJYPogTOP8KZM3fYxs2TOQDLYjz49RQy6RH4v7naAhsIXiPmy
        /e+8zqNLRa7ot7VKOUN0YmQ=
X-Google-Smtp-Source: ABdhPJwE9uGdNnIM/YZazj6nUG7ix2UX4o0q/RCAlx6gO1L2U88Odw0lzqYHHJSJNgD5Wr9eu49MMg==
X-Received: by 2002:a1c:59c3:: with SMTP id n186mr4520767wmb.48.1625740326040;
        Thu, 08 Jul 2021 03:32:06 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id v30sm1617813wrv.85.2021.07.08.03.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jul 2021 03:32:05 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Sameer Pujar <spujar@nvidia.com>, linux-tegra@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] ASoC: tegra: Use ADMAIF component for DMA allocations
Date:   Thu,  8 Jul 2021 12:34:31 +0200
Message-Id: <20210708103432.1690385-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210708103432.1690385-1-thierry.reding@gmail.com>
References: <20210708103432.1690385-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

DMA memory is currently allocated for the soundcard device, which is a
virtual device added for the sole purpose of "stitching" together the
audio device. It is not a real device and therefore doesn't have a DMA
mask or a description of the path to and from memory of accesses.

Memory accesses really originate from the ADMA controller that provides
the DMA channels used by the PCM component. However, since the DMA
memory is allocated up-front and the DMA channels aren't known at that
point, there is no way of knowing the DMA channel provider at allocation
time.

The next best physical device in the memory path is the ADMAIF. Use it
as the device to allocate DMA memory to. iommus and interconnects device
tree properties can thus be added to the ADMAIF device tree node to
describe the memory access path for audio.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v2:
- add backwards-compatibility fallback for Tegra186

 sound/soc/tegra/tegra_pcm.c | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/sound/soc/tegra/tegra_pcm.c b/sound/soc/tegra/tegra_pcm.c
index 573374b89b10..d3276b4595af 100644
--- a/sound/soc/tegra/tegra_pcm.c
+++ b/sound/soc/tegra/tegra_pcm.c
@@ -213,19 +213,19 @@ snd_pcm_uframes_t tegra_pcm_pointer(struct snd_soc_component *component,
 }
 EXPORT_SYMBOL_GPL(tegra_pcm_pointer);
 
-static int tegra_pcm_preallocate_dma_buffer(struct snd_pcm *pcm, int stream,
+static int tegra_pcm_preallocate_dma_buffer(struct device *dev, struct snd_pcm *pcm, int stream,
 					    size_t size)
 {
 	struct snd_pcm_substream *substream = pcm->streams[stream].substream;
 	struct snd_dma_buffer *buf = &substream->dma_buffer;
 
-	buf->area = dma_alloc_wc(pcm->card->dev, size, &buf->addr, GFP_KERNEL);
+	buf->area = dma_alloc_wc(dev, size, &buf->addr, GFP_KERNEL);
 	if (!buf->area)
 		return -ENOMEM;
 
 	buf->private_data = NULL;
 	buf->dev.type = SNDRV_DMA_TYPE_DEV;
-	buf->dev.dev = pcm->card->dev;
+	buf->dev.dev = dev;
 	buf->bytes = size;
 
 	return 0;
@@ -244,31 +244,28 @@ static void tegra_pcm_deallocate_dma_buffer(struct snd_pcm *pcm, int stream)
 	if (!buf->area)
 		return;
 
-	dma_free_wc(pcm->card->dev, buf->bytes, buf->area, buf->addr);
+	dma_free_wc(buf->dev.dev, buf->bytes, buf->area, buf->addr);
 	buf->area = NULL;
 }
 
-static int tegra_pcm_dma_allocate(struct snd_soc_pcm_runtime *rtd,
+static int tegra_pcm_dma_allocate(struct device *dev, struct snd_soc_pcm_runtime *rtd,
 				  size_t size)
 {
-	struct snd_card *card = rtd->card->snd_card;
 	struct snd_pcm *pcm = rtd->pcm;
 	int ret;
 
-	ret = dma_set_mask_and_coherent(card->dev, DMA_BIT_MASK(32));
+	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
 	if (ret < 0)
 		return ret;
 
 	if (pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream) {
-		ret = tegra_pcm_preallocate_dma_buffer(pcm,
-			SNDRV_PCM_STREAM_PLAYBACK, size);
+		ret = tegra_pcm_preallocate_dma_buffer(dev, pcm, SNDRV_PCM_STREAM_PLAYBACK, size);
 		if (ret)
 			goto err;
 	}
 
 	if (pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream) {
-		ret = tegra_pcm_preallocate_dma_buffer(pcm,
-			SNDRV_PCM_STREAM_CAPTURE, size);
+		ret = tegra_pcm_preallocate_dma_buffer(dev, pcm, SNDRV_PCM_STREAM_CAPTURE, size);
 		if (ret)
 			goto err_free_play;
 	}
@@ -284,7 +281,16 @@ static int tegra_pcm_dma_allocate(struct snd_soc_pcm_runtime *rtd,
 int tegra_pcm_construct(struct snd_soc_component *component,
 			struct snd_soc_pcm_runtime *rtd)
 {
-	return tegra_pcm_dma_allocate(rtd, tegra_pcm_hardware.buffer_bytes_max);
+	struct device *dev = component->dev;
+
+	/*
+	 * Fallback for backwards-compatibility with older device trees that
+	 * have the iommus property in the virtual, top-level "sound" node.
+	 */
+	if (!of_get_property(dev->of_node, "iommus", NULL))
+		dev = rtd->card->snd_card->dev;
+
+	return tegra_pcm_dma_allocate(dev, rtd, tegra_pcm_hardware.buffer_bytes_max);
 }
 EXPORT_SYMBOL_GPL(tegra_pcm_construct);
 
-- 
2.32.0

