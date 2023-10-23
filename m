Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBC4FCDB474
	for <linux-tegra@archiver.kernel.org>; Mon, 23 Oct 2023 09:54:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233385AbjJWJy4 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 23 Oct 2023 05:54:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232476AbjJWJyp (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 23 Oct 2023 05:54:45 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB27110C8
        for <linux-tegra@vger.kernel.org>; Mon, 23 Oct 2023 02:54:43 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3226cc3e324so2481403f8f.3
        for <linux-tegra@vger.kernel.org>; Mon, 23 Oct 2023 02:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698054882; x=1698659682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xuBgkJ0BPVMUW15lL794m55ZCdp9DH+A+t98MliJqVQ=;
        b=Zj9OmFDc7H0EOLdlEIyihpTwTgsjQha9cs5zBhn7fhSUHvTAnfDk3ZdkbBXgm2q4OC
         QJhpxZSqEcXIp4OE7d6pV475j/OpwtaLxp04kqRDiRgTlXaSM+mVIdARA5K2ADUHvOCk
         3VvwWTYzCCUAp4w/pLuuJe8Eg6AGGHXPYhP1muAACKRmpc6ovPdC3e4XZvQQifiCfrkS
         Uw2HUGT+5VdZVAuaq0dpnoGZTtsXGgQFmzCb9vZesk+mbRgCcKieM9+U9wcXK9YkQepi
         rd06ebYwYKYZnWPzXD9Ig6u4ClYDOrJKQpS9j5D6vzGzjT2tIswMvhNXcab0MQySziVU
         mtSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698054882; x=1698659682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xuBgkJ0BPVMUW15lL794m55ZCdp9DH+A+t98MliJqVQ=;
        b=mvQJcpuUmH+vRjY7OseGMr0QSUnW6j6yAXsC2ivRnSezS644I9yZg9npptuIwea1Gc
         mWl1Vryk15k5+w6OcCY6kctPamvl+cTX7J1J9keDCNW3J95xZHh8f12WuvkWoBprH3Z3
         SNbr4STAAQW/yS4X/9gFY1YAXvy8rLnyRFWniGMAOfCpcTk6SYwmzpFVF9wU9Q5os0+P
         IX/vfcQH5hEbYL6gl88snW030upa9ZFnhziRZPMh0xkfvk3BpmCGDVsQ5JDTVosSt3Ry
         zCAdAgGR4jfi7g0sptvVP64xfxsa/ApKblE+gK9yTBMjnyub9r7QQILdKmceUL9QsVly
         NKag==
X-Gm-Message-State: AOJu0Yza5/ZuDhy+Q0PwKN/TpSl5plNJbQ67L1i255vkYHausSeQGEVI
        e1pzQ6pZgPhn7qZpb9dD+aTBWA==
X-Google-Smtp-Source: AGHT+IG3Sib29NO6K06c5CyIqf4YSqLzbtzzhUEleL/6uhtgyT7dZmxfyYTlGNAw3kPpeYYlW/TKCQ==
X-Received: by 2002:a05:6000:152:b0:31f:8999:c409 with SMTP id r18-20020a056000015200b0031f8999c409mr6421464wrx.66.1698054882090;
        Mon, 23 Oct 2023 02:54:42 -0700 (PDT)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id u14-20020a5d468e000000b00323330edbc7sm7428801wrq.20.2023.10.23.02.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 02:54:41 -0700 (PDT)
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
Subject: [PATCH 04/17] ASoC: codecs: lpass-rx-macro: Handle component name prefix
Date:   Mon, 23 Oct 2023 11:54:15 +0200
Message-Id: <20231023095428.166563-5-krzysztof.kozlowski@linaro.org>
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
 sound/soc/codecs/lpass-rx-macro.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index 29197d34ec09..f35187d69cac 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -2906,14 +2906,14 @@ static int rx_macro_enable_echo(struct snd_soc_dapm_widget *w,
 
 	val = snd_soc_component_read(component,
 			CDC_RX_INP_MUX_RX_MIX_CFG4);
-	if (!(strcmp(w->name, "RX MIX TX0 MUX")))
+	if (!(snd_soc_dapm_widget_name_cmp(w, "RX MIX TX0 MUX")))
 		ec_tx = ((val & 0xf0) >> 0x4) - 1;
-	else if (!(strcmp(w->name, "RX MIX TX1 MUX")))
+	else if (!(snd_soc_dapm_widget_name_cmp(w, "RX MIX TX1 MUX")))
 		ec_tx = (val & 0x0f) - 1;
 
 	val = snd_soc_component_read(component,
 			CDC_RX_INP_MUX_RX_MIX_CFG5);
-	if (!(strcmp(w->name, "RX MIX TX2 MUX")))
+	if (!(snd_soc_dapm_widget_name_cmp(w, "RX MIX TX2 MUX")))
 		ec_tx = (val & 0x0f) - 1;
 
 	if (ec_tx < 0 || (ec_tx >= RX_MACRO_EC_MUX_MAX)) {
-- 
2.34.1

