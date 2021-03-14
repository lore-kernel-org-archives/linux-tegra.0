Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E242FC2BA19
	for <linux-tegra@archiver.kernel.org>; Sun, 14 Mar 2021 15:46:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CA7E264EFD
	for <linux-tegra@archiver.kernel.org>; Sun, 14 Mar 2021 15:46:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234059AbhCNPqK (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 14 Mar 2021 11:46:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234138AbhCNPpg (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 14 Mar 2021 11:45:36 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83343C061762;
        Sun, 14 Mar 2021 08:45:36 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id f22-20020a7bc8d60000b029010c024a1407so18794166wml.2;
        Sun, 14 Mar 2021 08:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vFPZqRdZbdNHKEvFXCrSAmXDgJl8zams6Cvy18zeWXc=;
        b=TTnxonYC5VTIZ1twFzbPolp0axamF7Ut4IK5VEOEOuRvASyNVct3OOKrlmeruqncAk
         BRgL47uCsx9+kXls9oIR5ER/k71DFRKrzbzEOApyNrTGg1cfG0C2GYhdae5ahiQns5/1
         xG08vaPmn/SAPoRpBgpsKMliBW5pHz5aG81Ih88IsgprrsemB79lZFNjl7qoPXXSQrMt
         6I+LPfr0LqpG5+FHXFYDtiKX45Q1LkAPmty17W5slx/0I7EPlEbuTsweT5NFZoCEt3hg
         5qPgX8e8uJBXS2D0mSmgvx/S/lZwI07xbo4VqIPnfjProyZIXVkFzkQLJ2W6/7kAgQXq
         UnHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vFPZqRdZbdNHKEvFXCrSAmXDgJl8zams6Cvy18zeWXc=;
        b=lSVvsb9kl7jqe8BbOHqEetx2uWeAZ280zDEd7B5XoAOb5/MKZb5byJGg8dCauupp1d
         /h9XCI1GvR9kFk/DTrY8SsDUhvuaPwr4sBH8xQi/Dlh3Uvn5Zlr/3vdofzwed3IhyeM1
         MaVemqxElXwyMar9EzlYN+JtA8P2C1wVI7C8HpeW1BXieqcqu0gXzsy+9iJf1DwtvMCE
         J1f3hwWrFA5zP13ekaRxOnRoD1J9sazU5BwIQ2LEU1b5td2lZFCSeh0bbCsxev4fWI/5
         GDQwIC8D1zPKOr7IxHYfWVP+QgX1USHOxnPC0a04J5Rjk4g/Jps4H3K/ad/yE/TLLjgX
         aGnQ==
X-Gm-Message-State: AOAM5310FNWsMxbIx4AnGl6lqsh40VzF1uKUeFXN6CrxP6KuuHrWoTwU
        2cK+ZaVHpnTu3D0ardcItSDZMXNBq0w=
X-Google-Smtp-Source: ABdhPJyNAw8waaCEpxZTcM+qiZa+ugLC/FyHQNxJnz8ojqzssYLkm9hVtJkrv7mc8nkBCSex73XwKw==
X-Received: by 2002:a1c:32ca:: with SMTP id y193mr22046494wmy.56.1615736735263;
        Sun, 14 Mar 2021 08:45:35 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.gmail.com with ESMTPSA id f14sm9673507wmf.7.2021.03.14.08.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Mar 2021 08:45:35 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Paul Fertser <fercerpav@gmail.com>
Cc:     alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 14/17] ASoC: tegra30: i2s: Remove handing of disabled runtime PM
Date:   Sun, 14 Mar 2021 18:44:56 +0300
Message-Id: <20210314154459.15375-15-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210314154459.15375-1-digetx@gmail.com>
References: <20210314154459.15375-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Runtime PM is always available on Tegra since commit 40b2bb1b132a
("ARM: tegra: enforce PM requirement"), hence there is no need to
handle the case of a disabled RPM by Tegra drivers. Remove handing
of a disabled runtime PM from Tegra30 I2S driver.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/soc/tegra/tegra30_i2s.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
index 0ed982548ce4..8730ffa0f691 100644
--- a/sound/soc/tegra/tegra30_i2s.c
+++ b/sound/soc/tegra/tegra30_i2s.c
@@ -461,11 +461,6 @@ static int tegra30_i2s_platform_probe(struct platform_device *pdev)
 	regcache_cache_only(i2s->regmap, true);
 
 	pm_runtime_enable(&pdev->dev);
-	if (!pm_runtime_enabled(&pdev->dev)) {
-		ret = tegra30_i2s_runtime_resume(&pdev->dev);
-		if (ret)
-			goto err_pm_disable;
-	}
 
 	i2s->playback_dma_data.addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
 	i2s->playback_dma_data.maxburst = 4;
@@ -475,7 +470,7 @@ static int tegra30_i2s_platform_probe(struct platform_device *pdev)
 					    &i2s->playback_dma_data.addr);
 	if (ret) {
 		dev_err(&pdev->dev, "Could not alloc TX FIFO: %d\n", ret);
-		goto err_suspend;
+		goto err_pm_disable;
 	}
 	ret = tegra30_ahub_set_rx_cif_source(i2s->playback_i2s_cif,
 					     i2s->playback_fifo_cif);
@@ -529,9 +524,6 @@ static int tegra30_i2s_platform_probe(struct platform_device *pdev)
 	tegra30_ahub_unset_rx_cif_source(i2s->playback_i2s_cif);
 err_free_tx_fifo:
 	tegra30_ahub_free_tx_fifo(i2s->playback_fifo_cif);
-err_suspend:
-	if (!pm_runtime_status_suspended(&pdev->dev))
-		tegra30_i2s_runtime_suspend(&pdev->dev);
 err_pm_disable:
 	pm_runtime_disable(&pdev->dev);
 err:
@@ -552,8 +544,6 @@ static int tegra30_i2s_platform_remove(struct platform_device *pdev)
 	tegra30_ahub_free_tx_fifo(i2s->playback_fifo_cif);
 
 	pm_runtime_disable(&pdev->dev);
-	if (!pm_runtime_status_suspended(&pdev->dev))
-		tegra30_i2s_runtime_suspend(&pdev->dev);
 
 	return 0;
 }
-- 
2.30.2

