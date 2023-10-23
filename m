Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E75F2CDB474
	for <linux-tegra@archiver.kernel.org>; Mon, 23 Oct 2023 09:55:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232598AbjJWJz5 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 23 Oct 2023 05:55:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233608AbjJWJz0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 23 Oct 2023 05:55:26 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F19719A7
        for <linux-tegra@vger.kernel.org>; Mon, 23 Oct 2023 02:55:06 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-32da7ac5c4fso2149104f8f.1
        for <linux-tegra@vger.kernel.org>; Mon, 23 Oct 2023 02:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698054905; x=1698659705; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uu/sTtccUwF0ah9E+SK4dukpMAzlv54jZyNo0CSiF0c=;
        b=UP0pQimVCO/Olvg/XVQwTCUP910mxq9CLnCLR6jJECqgs+p+4GvDlE02eQVnksCGUN
         /DT6DtAWOHeeEtU2StWC/7nGojTqkoeFNDZwJ1iPpkX5wKLOxt142JhCXOXH7eiXUI7q
         NcDPZXsyX2HBCpLsvEZtlsd4p6CaobOm/VQYPkUtz+sOtP5wH5qzQbvsBI/UUkCdtKRC
         7HQcZprlXhozZBzmkhnDULobcUTiE1ZySfnzcrWXub9NexaGI0J0plt6/0FJbo9hUaZy
         T5D+K3piClH3scjE8CekXADoo2cWWbZcgADcIpq64UYaeKKHfvkX/fmlWyClfNX/cmVA
         mKYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698054905; x=1698659705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uu/sTtccUwF0ah9E+SK4dukpMAzlv54jZyNo0CSiF0c=;
        b=IpfPCU3Yrl/teWU2sqCKl5kYd+ErpIhfuioW+1OipFEipanmsoOi7jeNU+ocenJp6e
         wwwHUcc0otZCQvL0TEndeDYzedhOWNeaJ237IJsTN1/HZcI2G3If+Lakb5bfpva9MeaL
         poGeHaHkcA2uzeUtYQJ3F1zCWpuJpcBe49Q/h55tu5eoibyujDqLxaVrmDk7g2nxI4ER
         pFGEV7HNI7JcwKerI/BFYr1n1qx3tUlVDNAa6JXv6a4Fk9WoDx1DOZHMMXhNjhzvak1r
         0sJsHGasyM1ou0jj6zBPlHejoF/Ma+DR4pa8iugf/AW5LS67fwC6Lui6cpTRdcJALkpa
         sKkA==
X-Gm-Message-State: AOJu0YwbCKYW6UBaXrBSJNRWD6+nLmg86ewDRd4fEDU8cIoHm+l0d1ON
        tN2MCnAFtPP6lDafGlohSlJKLw==
X-Google-Smtp-Source: AGHT+IFC/yAsny5qrYVg+EkJz4fUi483BdHJQWDTMZauGOFIlXds5DqFSdeJFZSj0XyhBOmMbTRyIg==
X-Received: by 2002:a5d:5267:0:b0:31f:f65f:74ac with SMTP id l7-20020a5d5267000000b0031ff65f74acmr7213785wrc.70.1698054905019;
        Mon, 23 Oct 2023 02:55:05 -0700 (PDT)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id u14-20020a5d468e000000b00323330edbc7sm7428801wrq.20.2023.10.23.02.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 02:55:04 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Oder Chiou <oder_chiou@realtek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RFT PATCH 14/17] ASoC: mediatek: mt8188: Handle component name prefix
Date:   Mon, 23 Oct 2023 11:54:25 +0200
Message-Id: <20231023095428.166563-15-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231023095428.166563-1-krzysztof.kozlowski@linaro.org>
References: <20231023095428.166563-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Use snd_soc_dapm_widget_name_cmp() helper when comparing widget names,
to include also the component's name prefix.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/mediatek/mt8188/mt8188-dai-etdm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-dai-etdm.c b/sound/soc/mediatek/mt8188/mt8188-dai-etdm.c
index 16440dd0a89c..2a48f5fd6826 100644
--- a/sound/soc/mediatek/mt8188/mt8188-dai-etdm.c
+++ b/sound/soc/mediatek/mt8188/mt8188-dai-etdm.c
@@ -576,13 +576,13 @@ static int mtk_apll_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		if (strcmp(w->name, APLL1_W_NAME) == 0)
+		if (snd_soc_dapm_widget_name_cmp(w, APLL1_W_NAME) == 0)
 			mt8188_apll1_enable(afe);
 		else
 			mt8188_apll2_enable(afe);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
-		if (strcmp(w->name, APLL1_W_NAME) == 0)
+		if (snd_soc_dapm_widget_name_cmp(w, APLL1_W_NAME) == 0)
 			mt8188_apll1_disable(afe);
 		else
 			mt8188_apll2_disable(afe);
-- 
2.34.1

