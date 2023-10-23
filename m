Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E78BAC001E0
	for <linux-tegra@archiver.kernel.org>; Mon, 23 Oct 2023 09:56:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233674AbjJWJ4Y (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 23 Oct 2023 05:56:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233652AbjJWJzq (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 23 Oct 2023 05:55:46 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD33A10F7
        for <linux-tegra@vger.kernel.org>; Mon, 23 Oct 2023 02:55:13 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-32003aae100so2389618f8f.0
        for <linux-tegra@vger.kernel.org>; Mon, 23 Oct 2023 02:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698054911; x=1698659711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G81EZhNEBfjywIhuDWJjtpTXYP61176MP839Y8OZoG8=;
        b=lHOLSFUc0yK7Ro+MNrul4bf5L+2cj3y+D/gX6YW5Pj+FKibWdu8iplLyLvCTxmygYD
         YH7cXdyN/KUjsLkK4/m+u/sRyop/blbjSfhT4Jl6bhkQAI62YFlTY/TW7BRk2GP8OmDM
         lmFU6jCnbRr0lw/r0kqAkYnR2FcJkRVoPGLIOMwkc1UIyw5W7cQLT/+uJdFncBFAKkXF
         FjE3ApzCTEpTKv3pmE5WFjvH4mBNHitMwYgPTGUdZqtgsRTGcqtGcStvDwqUZt3/Bcod
         TXqYkOybMDJENO801txAvYhXZeCaOJDyh5ckTdVT8J/nIQU1ZJAtUww31tZSMosi/E1Q
         AgIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698054911; x=1698659711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G81EZhNEBfjywIhuDWJjtpTXYP61176MP839Y8OZoG8=;
        b=f2GMO+tZDnE191d4+Ps+OJfJl+wtqSSMdBLmPh6dl4I+tyUqbdsh8qAVx+7LBfitSh
         hMl3HS9FMgnvzm2MU991XRLvDC75QQ/+zZ4wtd9pTsy3j44wfGDPSdt7oSjq9ZcfJd+e
         L9wa/CVYWbmeJW8wPR+KnkRyhtCt6vaBUs+kiW6Ulx7SALHSk7WLnEHnsHx8lqDpY893
         EYiQ9wMTzHDybIhPw2NtUyf7qw1wW2aMz01CUmF/Kis9pKtEZt4xzpMsfhqzKdzX/dW/
         490hsB8nL1LoBweqiUHjjSG/pOrOd8myp7jptknaVCLzrwBmGHLNj1mWHdL9sk5lrvoB
         xGTw==
X-Gm-Message-State: AOJu0YxniVWtdvHgPQ0jojm5pT3uOuWFneImwZSJLXPG28eXVA4Hd6ph
        9hlHiqKgwjgDwrVKu+g1VV8zYg==
X-Google-Smtp-Source: AGHT+IF2iXpBOUlnIxhQVTQ1O4HJJuZY9k94V739kocrPuR1iW5RroQxWCPWTyJ4Y36tYCQLJLsx0Q==
X-Received: by 2002:adf:a499:0:b0:32d:a3f7:f0dd with SMTP id g25-20020adfa499000000b0032da3f7f0ddmr10781049wrb.25.1698054911534;
        Mon, 23 Oct 2023 02:55:11 -0700 (PDT)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id u14-20020a5d468e000000b00323330edbc7sm7428801wrq.20.2023.10.23.02.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 02:55:11 -0700 (PDT)
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
Subject: [RFT PATCH 17/17] ASoC: tegra: machine: Handle component name prefix
Date:   Mon, 23 Oct 2023 11:54:28 +0200
Message-Id: <20231023095428.166563-18-krzysztof.kozlowski@linaro.org>
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
 sound/soc/tegra/tegra_asoc_machine.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/sound/soc/tegra/tegra_asoc_machine.c b/sound/soc/tegra/tegra_asoc_machine.c
index 3caadee9584f..192e9692bdf2 100644
--- a/sound/soc/tegra/tegra_asoc_machine.c
+++ b/sound/soc/tegra/tegra_asoc_machine.c
@@ -81,19 +81,23 @@ static int tegra_machine_event(struct snd_soc_dapm_widget *w,
 	struct snd_soc_dapm_context *dapm = w->dapm;
 	struct tegra_machine *machine = snd_soc_card_get_drvdata(dapm->card);
 
-	if (!strcmp(w->name, "Int Spk") || !strcmp(w->name, "Speakers"))
+	if (!snd_soc_dapm_widget_name_cmp(w, "Int Spk") ||
+	    !snd_soc_dapm_widget_name_cmp(w, "Speakers"))
 		gpiod_set_value_cansleep(machine->gpiod_spkr_en,
 					 SND_SOC_DAPM_EVENT_ON(event));
 
-	if (!strcmp(w->name, "Mic Jack") || !strcmp(w->name, "Headset Mic"))
+	if (!snd_soc_dapm_widget_name_cmp(w, "Mic Jack") ||
+	    !snd_soc_dapm_widget_name_cmp(w, "Headset Mic"))
 		gpiod_set_value_cansleep(machine->gpiod_ext_mic_en,
 					 SND_SOC_DAPM_EVENT_ON(event));
 
-	if (!strcmp(w->name, "Int Mic") || !strcmp(w->name, "Internal Mic 2"))
+	if (!snd_soc_dapm_widget_name_cmp(w, "Int Mic") ||
+	    !snd_soc_dapm_widget_name_cmp(w, "Internal Mic 2"))
 		gpiod_set_value_cansleep(machine->gpiod_int_mic_en,
 					 SND_SOC_DAPM_EVENT_ON(event));
 
-	if (!strcmp(w->name, "Headphone") || !strcmp(w->name, "Headphone Jack"))
+	if (!snd_soc_dapm_widget_name_cmp(w, "Headphone") ||
+	    !snd_soc_dapm_widget_name_cmp(w, "Headphone Jack"))
 		gpiod_set_value_cansleep(machine->gpiod_hp_mute,
 					 !SND_SOC_DAPM_EVENT_ON(event));
 
-- 
2.34.1

