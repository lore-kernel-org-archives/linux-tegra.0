Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C21FCDB474
	for <linux-tegra@archiver.kernel.org>; Mon, 23 Oct 2023 09:55:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233441AbjJWJy7 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 23 Oct 2023 05:54:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233337AbjJWJys (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 23 Oct 2023 05:54:48 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA7D6E6
        for <linux-tegra@vger.kernel.org>; Mon, 23 Oct 2023 02:54:45 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-32d9d8284abso2141605f8f.3
        for <linux-tegra@vger.kernel.org>; Mon, 23 Oct 2023 02:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698054884; x=1698659684; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TezS6fAbmZRfIE/9gAJPYUtZvuonet12GZ8K7ihJ9/I=;
        b=ayJhQrpXmLmMXWo1EwzEqgPt++PCP8UH54XqBtXG4HoxoZG6P8WO3bRbxxOGjerUUT
         7Htx1d5FbDG9piodG2LDi2AxETFHr9R/XVQWeO8EIYz++bBQp/8kXCvWRNW0wuiQYxJB
         dv1SBgFSCpGf9LsXPOrvldEzO/2JdfzmC71rFVbbabfKwSlhixo7/6a0DAaQ70/EGxhx
         qyfhgIfeHd7MITkf23r0XmZJAEASQFzDVFIQy4sCbftIP4MxZvaZphl5wDhTn6Jkhjzo
         bxOgyFMWvWll9IVGBcUmuBsRv5xx3asLYV/Mbd++wonwNkk9AMYE6cGTd2nIjEsmmQLq
         9+DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698054884; x=1698659684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TezS6fAbmZRfIE/9gAJPYUtZvuonet12GZ8K7ihJ9/I=;
        b=oteFudcxHhlKphUiua6/MPI78mWvP+XgB26h4PiohA540I5w7n1vik3obueZsA5SlW
         3oeG1hxd78ResoBbkvgMNZeIvFHBz6e6DtC4KmE53WyXKSWGDVZJnCPGPWspQBn11m17
         +lHc7azYQNO1xJq5zy46G74nRUpHDX3Ko0GvRDWX1Q8LbV7uc807v89V/prWxLW2rwx8
         ZOrYECcUPc3LpaCGLMkQoWipwkdKohxjCeUP6/Yd4JHVsiMwWQPUPbGtxFQ+YGHF3bJO
         PePnlyOD6l1oRBVpQTmZyZNu6J/rD/VZsXTPJIQJ3GVwmRMQg7RD0r7zM0rKNI3FUaJp
         4opA==
X-Gm-Message-State: AOJu0YzXLhgctYQnmH3a7iPGD2tU+Rfvqb3XQlLN1CgLXoLBpF4EXVCU
        Gva6+sj1sgkU0N0QpqyPY28qy/mxfPIB8kiL3T0=
X-Google-Smtp-Source: AGHT+IHsx/9dXkgIRE0i/tyQBHSemsOVRBosIhYnxE5jqsYSPyBJogKhqbIAWQxRyZ17AF8k0sON7w==
X-Received: by 2002:adf:f603:0:b0:31a:d450:c513 with SMTP id t3-20020adff603000000b0031ad450c513mr6210328wrp.26.1698054884307;
        Mon, 23 Oct 2023 02:54:44 -0700 (PDT)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id u14-20020a5d468e000000b00323330edbc7sm7428801wrq.20.2023.10.23.02.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 02:54:43 -0700 (PDT)
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
Subject: [RFT PATCH 05/17] ASoC: codecs: max9867: Handle component name prefix
Date:   Mon, 23 Oct 2023 11:54:16 +0200
Message-Id: <20231023095428.166563-6-krzysztof.kozlowski@linaro.org>
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
 sound/soc/codecs/max9867.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/max9867.c b/sound/soc/codecs/max9867.c
index b616ad39858c..3b9dd158c34b 100644
--- a/sound/soc/codecs/max9867.c
+++ b/sound/soc/codecs/max9867.c
@@ -56,13 +56,13 @@ static int max9867_adc_dac_event(struct snd_soc_dapm_widget *w,
 	struct max9867_priv *max9867 = snd_soc_component_get_drvdata(component);
 	enum max9867_adc_dac adc_dac;
 
-	if (!strcmp(w->name, "ADCL"))
+	if (!snd_soc_dapm_widget_name_cmp(w, "ADCL"))
 		adc_dac = MAX9867_ADC_LEFT;
-	else if (!strcmp(w->name, "ADCR"))
+	else if (!snd_soc_dapm_widget_name_cmp(w, "ADCR"))
 		adc_dac = MAX9867_ADC_RIGHT;
-	else if (!strcmp(w->name, "DACL"))
+	else if (!snd_soc_dapm_widget_name_cmp(w, "DACL"))
 		adc_dac = MAX9867_DAC_LEFT;
-	else if (!strcmp(w->name, "DACR"))
+	else if (!snd_soc_dapm_widget_name_cmp(w, "DACR"))
 		adc_dac = MAX9867_DAC_RIGHT;
 	else
 		return 0;
-- 
2.34.1

