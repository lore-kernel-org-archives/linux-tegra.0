Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BADDCC001E0
	for <linux-tegra@archiver.kernel.org>; Mon, 23 Oct 2023 09:55:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233573AbjJWJzv (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 23 Oct 2023 05:55:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233398AbjJWJzX (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 23 Oct 2023 05:55:23 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3351198C
        for <linux-tegra@vger.kernel.org>; Mon, 23 Oct 2023 02:55:03 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4083f613275so25527205e9.2
        for <linux-tegra@vger.kernel.org>; Mon, 23 Oct 2023 02:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698054900; x=1698659700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XaRWK1PxbLteLkMq7b8+dA2nXiGKOdN1dmpy3IbpNyI=;
        b=wXssIZoauGB6M2qlDlJhB69IjUmIc/XOS4aYwd7XQ5/F4MpUB5iwpRF9v+p6mQ+8Us
         3ZJdsbFOcAEcpgh4T99TWtNNAT/lZ+rs2giHj+RjEPB2eC0huJTs6h8Ckt/W0HJl0W4k
         u4yN8Y24abJvP3CKKnbukKnz/ZCgl9xcg4++G0cGVYAwkHPcmRQ9vFLHBAnsVX75O8qC
         8fH9HygF4gyZpDC7cJojdbCFiW+HGrF8ecC4nRLTxhJo+S/KofR6mu7etVPifYbRhodT
         j10XCe0wMwdCs/kG6k0NdLOcTgG+IG9adi2x+0IP7ZXZXYFMSc76ay3se3rHc+t9wn2I
         swjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698054900; x=1698659700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XaRWK1PxbLteLkMq7b8+dA2nXiGKOdN1dmpy3IbpNyI=;
        b=QyAbbGmLUjRY0iM+y9ms57lvuueZcdgzFv1NLuPBkcRp5wU0h1Pnb2sWStyWnqUbIj
         kZR3W3ffDRnaOBUpqBkVhln0N9nnDYSQWld9VPLrbnFlgmCSVtky4ui6Jk8Ndv8HihqU
         gv7+HdN0pDUDHvn37JGy2KnG/GKIfy5c1loLQYpySXnlxvm6T/d+9TFT5dfxLlj6MC3u
         9gg180GV+Ejc+7i6ak9pWUpB3hgCAsw3BZlbInQkslJskyBxLB5oAXcg/vRP8Fnxtkps
         aoJCVP93JVymztsZk1RscHYSP2klKIEYFbfo3alxK2zdPlRxi6h3Y+bwKDtBT/RB4qz3
         g0ew==
X-Gm-Message-State: AOJu0YzMQ/k/4oItzEjGhyV6cCRNtSiy1n3NGX/tm/Zjj7fYwr5jxWWk
        oPvIRIFK/WkrSr9RCcKK22GA6Q==
X-Google-Smtp-Source: AGHT+IGcRnlB4vFMFDgducXrQmS80dOVHAS+aDCp1wKs33+friJEQiADUVo77kFzrMbe1bXLDVGcYA==
X-Received: by 2002:adf:fe48:0:b0:323:15d7:900e with SMTP id m8-20020adffe48000000b0032315d7900emr5319691wrs.53.1698054900441;
        Mon, 23 Oct 2023 02:55:00 -0700 (PDT)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id u14-20020a5d468e000000b00323330edbc7sm7428801wrq.20.2023.10.23.02.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 02:55:00 -0700 (PDT)
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
Subject: [RFT PATCH 12/17] ASoC: mediatek: mt8183: Handle component name prefix
Date:   Mon, 23 Oct 2023 11:54:23 +0200
Message-Id: <20231023095428.166563-13-krzysztof.kozlowski@linaro.org>
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
 sound/soc/mediatek/mt8183/mt8183-dai-i2s.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-dai-i2s.c b/sound/soc/mediatek/mt8183/mt8183-dai-i2s.c
index 8645ab686970..65e46ebe7be6 100644
--- a/sound/soc/mediatek/mt8183/mt8183-dai-i2s.c
+++ b/sound/soc/mediatek/mt8183/mt8183-dai-i2s.c
@@ -276,13 +276,13 @@ static int mtk_apll_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		if (strcmp(w->name, APLL1_W_NAME) == 0)
+		if (snd_soc_dapm_widget_name_cmp(w, APLL1_W_NAME) == 0)
 			mt8183_apll1_enable(afe);
 		else
 			mt8183_apll2_enable(afe);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
-		if (strcmp(w->name, APLL1_W_NAME) == 0)
+		if (snd_soc_dapm_widget_name_cmp(w, APLL1_W_NAME) == 0)
 			mt8183_apll1_disable(afe);
 		else
 			mt8183_apll2_disable(afe);
-- 
2.34.1

