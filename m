Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C70F0C4332F
	for <linux-tegra@archiver.kernel.org>; Wed, 24 Nov 2021 22:06:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348783AbhKXWJy (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 24 Nov 2021 17:09:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244968AbhKXWJu (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 24 Nov 2021 17:09:50 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 028C6C061574;
        Wed, 24 Nov 2021 14:06:40 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id k37so10994224lfv.3;
        Wed, 24 Nov 2021 14:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Qt8PrFF5rWy8Gj1ABxOEOakxJdpJR0LJrG627NKAlx8=;
        b=a+huXng7esgCNPuV7SwhtEtqPyIZia6XzlCsNh38W/pcBzm5vLO/WtN0fKU7aKh+8/
         CIBprKjVIMWJngggQJIAhh/K3cv8cU0v6tqMBF+c4FbvO28PeEdAa7QgEYvw7BqBHKuF
         tbtWmxtm5J7+z1rOoruqJlG7facc+QjOwA4UuOGVlenQ4F7M+ID+9zWzw3FQMMhO6rag
         cOLQBiIHP+86c68dSSg8C+MoJCet4S7Yl7gAKa9BMrwcpui/lo/YDygOk8KX5bE/6q2j
         Q0lKYbq6e9JUkorNC7H3DeIcG+HFS86rpuvXxAR6xJLhoAbYH9oeT9qlhqjFTJCdiBbL
         Ir9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Qt8PrFF5rWy8Gj1ABxOEOakxJdpJR0LJrG627NKAlx8=;
        b=i+pQaCkso66MY81uR3a2FOlu3/6G1gq62Dtkwn/TicN6s/VYUaTzxfGIeLm6klCLdv
         7y+mBbfPxIeB+QOkdPibckeJCorWL+SjduGLhsUlL/J1jDAIWBZnF+dlA8RhpGVvIFBl
         S85vH73nQrTKGm1Zwp1BKaYl0Nbwm80LEVt/RDyyjTo4GZSzjvWbODuXXGZqYAfYa86J
         9yw2p995AMY89OyBr6m5Gr6OVFTD3OaaM8bnHPsfvcswvHCtLijX0YoNw0nMc0K3hm1/
         mdl+uw6SkYpY/AtBold72B0Ohd0WYRwMB40y3DUy0BEAGX+xVuM0TeKbd8joKCk59kHY
         7xCQ==
X-Gm-Message-State: AOAM531BJ7ACMC447nPb6tftIMLafuAQMz8ORO2XzngAcLJJCvupGJNp
        AeNgxBfgXrTsENQvlVTXq8w=
X-Google-Smtp-Source: ABdhPJxCMiI0o3HkziLhuPY402vnYenV2NdTnAA2rDvSVmJpZ2nJ1F/bnaflrwME9Hek/dqCHJ/c4w==
X-Received: by 2002:a05:6512:3095:: with SMTP id z21mr18114135lfd.423.1637791598355;
        Wed, 24 Nov 2021 14:06:38 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
        by smtp.gmail.com with ESMTPSA id w17sm93266ljh.15.2021.11.24.14.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 14:06:38 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Agneli <poczt@protonmail.ch>, Rob Herring <robh+dt@kernel.org>
Cc:     linux-tegra@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v1 09/20] ASoC: tegra20: spdif: Use more resource-managed helpers
Date:   Thu, 25 Nov 2021 01:00:46 +0300
Message-Id: <20211124220057.15763-10-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211124220057.15763-1-digetx@gmail.com>
References: <20211124220057.15763-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Use resource-managed helpers to make code cleaner. Driver's remove callback
isn't needed anymore since driver is completely resource-managed now.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/soc/tegra/tegra20_spdif.c | 33 +++++++++------------------------
 sound/soc/tegra/tegra_pcm.c     |  6 ++++++
 sound/soc/tegra/tegra_pcm.h     |  1 +
 3 files changed, 16 insertions(+), 24 deletions(-)

diff --git a/sound/soc/tegra/tegra20_spdif.c b/sound/soc/tegra/tegra20_spdif.c
index 9383683aa4e9..6ca48bc322ae 100644
--- a/sound/soc/tegra/tegra20_spdif.c
+++ b/sound/soc/tegra/tegra20_spdif.c
@@ -289,38 +289,24 @@ static int tegra20_spdif_platform_probe(struct platform_device *pdev)
 	spdif->playback_dma_data.addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
 	spdif->playback_dma_data.maxburst = 4;
 
-	pm_runtime_enable(&pdev->dev);
+	ret = devm_pm_runtime_enable(&pdev->dev);
+	if (ret)
+		return ret;
 
-	ret = snd_soc_register_component(&pdev->dev, &tegra20_spdif_component,
-					 &tegra20_spdif_dai, 1);
+	ret = devm_snd_soc_register_component(&pdev->dev,
+					      &tegra20_spdif_component,
+					      &tegra20_spdif_dai, 1);
 	if (ret) {
 		dev_err(&pdev->dev, "Could not register DAI: %d\n", ret);
-		goto err_pm_disable;
+		return ret;
 	}
 
-	ret = tegra_pcm_platform_register(&pdev->dev);
+	ret = devm_tegra_pcm_platform_register(&pdev->dev);
 	if (ret) {
 		dev_err(&pdev->dev, "Could not register PCM: %d\n", ret);
-		goto err_unregister_component;
+		return ret;
 	}
 
-	return 0;
-
-err_unregister_component:
-	snd_soc_unregister_component(&pdev->dev);
-err_pm_disable:
-	pm_runtime_disable(&pdev->dev);
-
-	return ret;
-}
-
-static int tegra20_spdif_platform_remove(struct platform_device *pdev)
-{
-	tegra_pcm_platform_unregister(&pdev->dev);
-	snd_soc_unregister_component(&pdev->dev);
-
-	pm_runtime_disable(&pdev->dev);
-
 	return 0;
 }
 
@@ -342,7 +328,6 @@ static struct platform_driver tegra20_spdif_driver = {
 		.of_match_table = tegra20_spdif_of_match,
 	},
 	.probe = tegra20_spdif_platform_probe,
-	.remove = tegra20_spdif_platform_remove,
 };
 module_platform_driver(tegra20_spdif_driver);
 
diff --git a/sound/soc/tegra/tegra_pcm.c b/sound/soc/tegra/tegra_pcm.c
index ef1e74d95236..468c8e77de21 100644
--- a/sound/soc/tegra/tegra_pcm.c
+++ b/sound/soc/tegra/tegra_pcm.c
@@ -48,6 +48,12 @@ int tegra_pcm_platform_register(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(tegra_pcm_platform_register);
 
+int devm_tegra_pcm_platform_register(struct device *dev)
+{
+	return devm_snd_dmaengine_pcm_register(dev, &tegra_dmaengine_pcm_config, 0);
+}
+EXPORT_SYMBOL_GPL(devm_tegra_pcm_platform_register);
+
 int tegra_pcm_platform_register_with_chan_names(struct device *dev,
 				struct snd_dmaengine_pcm_config *config,
 				char *txdmachan, char *rxdmachan)
diff --git a/sound/soc/tegra/tegra_pcm.h b/sound/soc/tegra/tegra_pcm.h
index d602126c65b7..2a36eea1740d 100644
--- a/sound/soc/tegra/tegra_pcm.h
+++ b/sound/soc/tegra/tegra_pcm.h
@@ -32,6 +32,7 @@ int tegra_pcm_hw_params(struct snd_soc_component *component,
 snd_pcm_uframes_t tegra_pcm_pointer(struct snd_soc_component *component,
 				    struct snd_pcm_substream *substream);
 int tegra_pcm_platform_register(struct device *dev);
+int devm_tegra_pcm_platform_register(struct device *dev);
 int tegra_pcm_platform_register_with_chan_names(struct device *dev,
 				struct snd_dmaengine_pcm_config *config,
 				char *txdmachan, char *rxdmachan);
-- 
2.33.1

