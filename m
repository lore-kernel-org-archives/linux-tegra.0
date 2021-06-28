Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E386C11F67
	for <linux-tegra@archiver.kernel.org>; Mon, 28 Jun 2021 18:09:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EA25961C78
	for <linux-tegra@archiver.kernel.org>; Mon, 28 Jun 2021 18:09:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233206AbhF1SLl (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 28 Jun 2021 14:11:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231950AbhF1SLk (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 28 Jun 2021 14:11:40 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D89D3C061574;
        Mon, 28 Jun 2021 11:09:13 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id o35-20020a05600c5123b02901e6a7a3266cso617455wms.1;
        Mon, 28 Jun 2021 11:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7cXvDI8Kzqpcqy3dBcYOT9+SxskkDGP9OBiIpKbc+vw=;
        b=VzxGxsECFusZYeydLXp3kGqX1kEeuRJ7P2YVsTKQsEiydF716gM2ynykirBFKoaGED
         3lOA641YG8eqvsQN3oh6RfKGZ0/Ficce7v1w0ZNPY6Wq2iBB47gBe+UHyZatmOo7O9sD
         QvOO5AmcPh/mJMCzCcTkBjQhmvvjMXO+aJCEgSCIZ+O9ERtnYxFMFKYpfet3LsHh5y5g
         rGIi/y42VvVKwmf7Ai7l/bu11nMjVb3Huled2MEugk5kcd9O84U9XRr+T1r4cj2JALel
         KyMyPUOf+h2dW+OsCatNKSOsZsIjVLlR21DbyxuygkG9qidZF1L4z7xAhXRjh7qh8pPs
         8swQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7cXvDI8Kzqpcqy3dBcYOT9+SxskkDGP9OBiIpKbc+vw=;
        b=pWNKWjjoE67ZYyXYSUMcO4BPFGaxFZEEl+qVpmIhetyhG9c0J6oAamwJDPvjf3rx6D
         4GlSbJY+tfKQvcUaQiTBV3XetgGCh+O6h3UR9+hqE+PscGdLUzdAe4cMkfbxIVjf6NTb
         xXYaWXdykW1zMH31vHzCZmEbUhdvqSoUiv077VXtOJA1NrG38dk0carL6c2Sk3A0hGJS
         28PdFmMxuDs5jC789psjBYj3+H7jdNZ3JUxThFs98Ib2KKzwC71BngCvJcQ4K+/It9M9
         pcUADslg4CJHgqrxFDla6HWWbmBx8Ps94ffFoOD4dLIcqYagg0+qJ6Ur/IjkQpASrZl/
         lMcg==
X-Gm-Message-State: AOAM533Jp+XWJgshBQpj6IMU694cEcbSLz+K8hsWXV4e4YMJPXNPS04D
        KObkZE2O477Qu3nxXnGQ6Kc=
X-Google-Smtp-Source: ABdhPJxGfuPsUAde8SSnlWeeLPCBE0PsAoaICKAart/xt6DmvZRurJux+PMaWqH81mTbQHk0Oi8cSQ==
X-Received: by 2002:a1c:7402:: with SMTP id p2mr27595934wmc.88.1624903752551;
        Mon, 28 Jun 2021 11:09:12 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id x17sm3796487wrn.62.2021.06.28.11.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jun 2021 11:09:11 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Sameer Pujar <spujar@nvidia.com>, linux-tegra@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org
Subject: [PATCH 1/2] ASoC: tegra: Use ADMAIF component for DMA allocations
Date:   Mon, 28 Jun 2021 20:11:17 +0200
Message-Id: <20210628181118.2295007-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210628181118.2295007-1-thierry.reding@gmail.com>
References: <20210628181118.2295007-1-thierry.reding@gmail.com>
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
 sound/soc/tegra/tegra_pcm.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/sound/soc/tegra/tegra_pcm.c b/sound/soc/tegra/tegra_pcm.c
index 573374b89b10..33bdbdfb24ba 100644
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
@@ -284,7 +281,7 @@ static int tegra_pcm_dma_allocate(struct snd_soc_pcm_runtime *rtd,
 int tegra_pcm_construct(struct snd_soc_component *component,
 			struct snd_soc_pcm_runtime *rtd)
 {
-	return tegra_pcm_dma_allocate(rtd, tegra_pcm_hardware.buffer_bytes_max);
+	return tegra_pcm_dma_allocate(component->dev, rtd, tegra_pcm_hardware.buffer_bytes_max);
 }
 EXPORT_SYMBOL_GPL(tegra_pcm_construct);
 
-- 
2.32.0

