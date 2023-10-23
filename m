Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BE29C001E0
	for <linux-tegra@archiver.kernel.org>; Mon, 23 Oct 2023 09:54:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233068AbjJWJyk (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 23 Oct 2023 05:54:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229667AbjJWJyj (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 23 Oct 2023 05:54:39 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14147DA
        for <linux-tegra@vger.kernel.org>; Mon, 23 Oct 2023 02:54:37 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-31f71b25a99so2082825f8f.2
        for <linux-tegra@vger.kernel.org>; Mon, 23 Oct 2023 02:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698054875; x=1698659675; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4YC/W8702n/IhtK2/nRJYRFXj5SA3+z6eWXwAmZT4eY=;
        b=z8wzB8ADL91wvnnXhOGSny0rBqZvEsstAaA622VYDARD0xigKUTqXyak+lEh8S0YQO
         AkjrNpQXEyRaRszo1z3IYkKQNiU0gRG62OdzhB9vohlAkm+thWM+PpELgG94GSn3n/lf
         4wEOsr37gIReLlnkN9fqZNvgaprkJ0F71vh6PdD8LeE0G8yuvLk9idvMd/QZ7RnMtIx+
         AkjltU+uoXU+SXhOpPrFJo7TXlMEo0zeLW+vZgHwWM2N+M+dhtL+ttiFsXvrtZ4nnk1v
         lb4AmITxRCfVvHvUktw/RY0kveaJdfItkNEWcrZjyjtr2eJmF4vZaqpBuXm/kIw+DLL5
         raoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698054875; x=1698659675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4YC/W8702n/IhtK2/nRJYRFXj5SA3+z6eWXwAmZT4eY=;
        b=Qfa0ch8zx6HaPQcoVMB6hq/7cjkGfW8VTM/kbGU5dBAa5L4tyB4rWZkPp+7TzEVMF4
         qxfyHuA+CYk4Qmr+QnriA8rCVAcF91o8MJM9aSg7b5x8XoXzr4NH79v3RdkZwOvPGeUS
         oquygeLwg1jxuxv8QTfq4wEee6qXOV4159HBOLeDDTAcvA18Qg2nqvqIZ6pFocmwOGrG
         1Wv1Nbaya2LEhCqKOIovIhcaSODWKER4xb2fyfMw+AMZ1c5UJ32D2nSmu7qgpo8hfwNH
         wgZrnKNBMO2Yg9VURx4RwjyBC+IKXOxlYZ9nzOkgCxV6amidH4w97fAnfrBpj4CwQNT/
         XtUg==
X-Gm-Message-State: AOJu0Yw7JPXAJl3Gd2qQJ6OhFGS1WA4RA8tBvhsIqELVfE05ITNVo3tc
        UCsVCj4+3EjmiiUZWNR7+TYPig==
X-Google-Smtp-Source: AGHT+IEHt7MU0pVVH3QtAU35Dth6+VQAGLU4qZyA/p6jZNdd35Imw6TEqgJZWhxMs2mnHadLP+Eb6A==
X-Received: by 2002:adf:fc09:0:b0:323:10b8:543e with SMTP id i9-20020adffc09000000b0032310b8543emr5848249wrr.49.1698054875438;
        Mon, 23 Oct 2023 02:54:35 -0700 (PDT)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id u14-20020a5d468e000000b00323330edbc7sm7428801wrq.20.2023.10.23.02.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 02:54:35 -0700 (PDT)
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
Subject: [RFT PATCH 01/17] ASoC: codecs: 88pm860x: Handle component name prefix
Date:   Mon, 23 Oct 2023 11:54:12 +0200
Message-Id: <20231023095428.166563-2-krzysztof.kozlowski@linaro.org>
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
 sound/soc/codecs/88pm860x-codec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/88pm860x-codec.c b/sound/soc/codecs/88pm860x-codec.c
index d99b674d574b..be01f0928393 100644
--- a/sound/soc/codecs/88pm860x-codec.c
+++ b/sound/soc/codecs/88pm860x-codec.c
@@ -400,9 +400,9 @@ static int pm860x_dac_event(struct snd_soc_dapm_widget *w,
 	unsigned int dac = 0;
 	int data;
 
-	if (!strcmp(w->name, "Left DAC"))
+	if (!snd_soc_dapm_widget_name_cmp(w, "Left DAC"))
 		dac = DAC_LEFT;
-	if (!strcmp(w->name, "Right DAC"))
+	if (!snd_soc_dapm_widget_name_cmp(w, "Right DAC"))
 		dac = DAC_RIGHT;
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-- 
2.34.1

