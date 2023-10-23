Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EB28C00A8F
	for <linux-tegra@archiver.kernel.org>; Mon, 23 Oct 2023 09:55:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233529AbjJWJzR (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 23 Oct 2023 05:55:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233437AbjJWJy7 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 23 Oct 2023 05:54:59 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9438610F6
        for <linux-tegra@vger.kernel.org>; Mon, 23 Oct 2023 02:54:52 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-32d9d8284abso2141674f8f.3
        for <linux-tegra@vger.kernel.org>; Mon, 23 Oct 2023 02:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698054891; x=1698659691; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9PvbddIvQlG0l/ZDn5njSVhrq4RgzTBlbX25/MYIgFc=;
        b=QL3y9JEcLadLoCqVFZ81Hw0SF59gHlxSpxmeZjKjaxcnzAg4Ay57nfed9ds+wXaoCa
         CXX6nVrSEHDEbQ+2wl7+sJr6ijlxjbdzBPc3uO/aY6qgiAEz1WZfl3cvrbUB3odjeBu/
         bDPZrthuoGecsPKU9G3XJlQb5qYtYqBM9Ip+92a4dEV47oezPwEDSQDd197DJbwtKDgB
         mpQvvoNTDA9tgqC9xbP2AzkdfYMnoplOQqx+ZPqzEUyg8+5VPTw/cDw2tVXHa1piqm8X
         J3DhZRQu39hKSBi6tVKhOh7XLU7D2Px1CWCP8zBqSbgD5tTbracrkk0pEsDpNGV7Eewn
         +svQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698054891; x=1698659691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9PvbddIvQlG0l/ZDn5njSVhrq4RgzTBlbX25/MYIgFc=;
        b=kABEYsfwx84oVWHlwoi1S/3TM4JV53ozC8Jx0/c9uqnRz9ShGyKiE0cm3aD4au7A0V
         Qq/c99gDgZdtSfNwNum1aHOELRcTyAvSdwyXh3hZr4UCdhZa/PJP5zuq+gSvXTCnCoCq
         KUThiktSzA1jIi8UWF8m4TGWUStEyLunmzabQ0RxSa/22vSFm1WALt8FT0ijDhkWmwTa
         +9lgfgq3BJozAymAveLXBnTNnvtMPQS7KxNACh56athNZgVozKtBvLPAgrY+b5HrZ7zz
         TeHpfBdHwRY7adshfqCGvmSU2+3s6Btu1GG8nkadvHQ3sbXSL5lchobsUZA0RAOX4rQw
         6UqA==
X-Gm-Message-State: AOJu0Yz43hnLtCg8WJH4Ixa70El66zY+CRlHBdZBL6NHPSfpgkKMwYaW
        s6iv8CdVd3BGUOG7CUeChRdoAA==
X-Google-Smtp-Source: AGHT+IEmmCcXMvV2AiWhQpKHX0IqP6/STlrOm+onc5uiN24/C1EAIXqoQxx+Ad9L+iK6N0Yq3GEInA==
X-Received: by 2002:a5d:5709:0:b0:32d:9fd1:91f9 with SMTP id a9-20020a5d5709000000b0032d9fd191f9mr5739165wrv.60.1698054890848;
        Mon, 23 Oct 2023 02:54:50 -0700 (PDT)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id u14-20020a5d468e000000b00323330edbc7sm7428801wrq.20.2023.10.23.02.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 02:54:50 -0700 (PDT)
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
Subject: [RFT PATCH 08/17] ASoC: codecs: wcd9335: Handle component name prefix
Date:   Mon, 23 Oct 2023 11:54:19 +0200
Message-Id: <20231023095428.166563-9-krzysztof.kozlowski@linaro.org>
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
 sound/soc/codecs/wcd9335.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
index a05b553e6472..43c648efd0d9 100644
--- a/sound/soc/codecs/wcd9335.c
+++ b/sound/soc/codecs/wcd9335.c
@@ -3296,31 +3296,31 @@ static int wcd9335_codec_enable_interpolator(struct snd_soc_dapm_widget *w,
 	int val;
 	int offset_val = 0;
 
-	if (!(strcmp(w->name, "RX INT0 INTERP"))) {
+	if (!(snd_soc_dapm_widget_name_cmp(w, "RX INT0 INTERP"))) {
 		reg = WCD9335_CDC_RX0_RX_PATH_CTL;
 		gain_reg = WCD9335_CDC_RX0_RX_VOL_CTL;
-	} else if (!(strcmp(w->name, "RX INT1 INTERP"))) {
+	} else if (!(snd_soc_dapm_widget_name_cmp(w, "RX INT1 INTERP"))) {
 		reg = WCD9335_CDC_RX1_RX_PATH_CTL;
 		gain_reg = WCD9335_CDC_RX1_RX_VOL_CTL;
-	} else if (!(strcmp(w->name, "RX INT2 INTERP"))) {
+	} else if (!(snd_soc_dapm_widget_name_cmp(w, "RX INT2 INTERP"))) {
 		reg = WCD9335_CDC_RX2_RX_PATH_CTL;
 		gain_reg = WCD9335_CDC_RX2_RX_VOL_CTL;
-	} else if (!(strcmp(w->name, "RX INT3 INTERP"))) {
+	} else if (!(snd_soc_dapm_widget_name_cmp(w, "RX INT3 INTERP"))) {
 		reg = WCD9335_CDC_RX3_RX_PATH_CTL;
 		gain_reg = WCD9335_CDC_RX3_RX_VOL_CTL;
-	} else if (!(strcmp(w->name, "RX INT4 INTERP"))) {
+	} else if (!(snd_soc_dapm_widget_name_cmp(w, "RX INT4 INTERP"))) {
 		reg = WCD9335_CDC_RX4_RX_PATH_CTL;
 		gain_reg = WCD9335_CDC_RX4_RX_VOL_CTL;
-	} else if (!(strcmp(w->name, "RX INT5 INTERP"))) {
+	} else if (!(snd_soc_dapm_widget_name_cmp(w, "RX INT5 INTERP"))) {
 		reg = WCD9335_CDC_RX5_RX_PATH_CTL;
 		gain_reg = WCD9335_CDC_RX5_RX_VOL_CTL;
-	} else if (!(strcmp(w->name, "RX INT6 INTERP"))) {
+	} else if (!(snd_soc_dapm_widget_name_cmp(w, "RX INT6 INTERP"))) {
 		reg = WCD9335_CDC_RX6_RX_PATH_CTL;
 		gain_reg = WCD9335_CDC_RX6_RX_VOL_CTL;
-	} else if (!(strcmp(w->name, "RX INT7 INTERP"))) {
+	} else if (!(snd_soc_dapm_widget_name_cmp(w, "RX INT7 INTERP"))) {
 		reg = WCD9335_CDC_RX7_RX_PATH_CTL;
 		gain_reg = WCD9335_CDC_RX7_RX_VOL_CTL;
-	} else if (!(strcmp(w->name, "RX INT8 INTERP"))) {
+	} else if (!(snd_soc_dapm_widget_name_cmp(w, "RX INT8 INTERP"))) {
 		reg = WCD9335_CDC_RX8_RX_PATH_CTL;
 		gain_reg = WCD9335_CDC_RX8_RX_VOL_CTL;
 	} else {
-- 
2.34.1

