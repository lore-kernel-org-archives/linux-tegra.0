Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A148CDB474
	for <linux-tegra@archiver.kernel.org>; Mon, 23 Oct 2023 09:55:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233624AbjJWJz2 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 23 Oct 2023 05:55:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233477AbjJWJzN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 23 Oct 2023 05:55:13 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7F231719
        for <linux-tegra@vger.kernel.org>; Mon, 23 Oct 2023 02:54:55 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4081ccf69dcso23143095e9.0
        for <linux-tegra@vger.kernel.org>; Mon, 23 Oct 2023 02:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698054893; x=1698659693; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iygGW2h2lVMWeGfG3UfW0SGTTyTrk1COvj9PMOD/Pf4=;
        b=qUpXN0ILCi4LvFMINMaTf56b3r6pxUi8xiIVFHn6NjdTchBM/L0hxdfp9ZgbPsOMEr
         bMQqww3Arug8O47iA5c00G777hjoX4vSly49WoLvATe6qW+JqpPE8aVsZ/HHLRGfYD9D
         STpDO1D13bAeZT5UgJVBKhZ21o0jBxbXp0bZ19pEbhlDM+cwkmTHRg2JBotvzNQMqEqf
         FBR7EqDniDJw19/OoWcQvddq/qNS+u2nqdZyfu6FYblWgKHhj+6HL/KrpjzyWXVGB3pg
         dxFXOt1wFhm+sOqi234SpH0ek6MIAods1pffV4sRpi0SQILgnVoDiPa1kvzcpmY6ayar
         vWXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698054893; x=1698659693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iygGW2h2lVMWeGfG3UfW0SGTTyTrk1COvj9PMOD/Pf4=;
        b=FOmKnAv2g8+GY7QtCkqDLJcrEmfLRXPga+IaNYQQjB7h7HmG5sGuIdDtbXNz00nvg8
         UtSzDb8lThSkihcEAfiuQ8Z9bhlk+QR1jVyMK5lnV+TIURy9XBVp/o6S6vljpWSeNYBj
         zY+4iYNK+bc7N1IMItvNKwh70iEzu8ukGGKPPjZ98R0Jo9Oce1L938X0OvYsu7FLEh8d
         Y/EOmh8tIbcUUngHn+uu3HEv63mqiAP0PmrCdNdqENwpjdBWd58GNBX9g/2j4KoQcnAp
         ay6l/BosMnd40gK5NZnvOFKFdxlBExYE1YiQcOF7TnBaJ7YM2OMBnNCiWBjiR+YUhzhu
         oHRQ==
X-Gm-Message-State: AOJu0YzU4oC5Mpuc/ZyW2h1Ww0lFdn0HeSztLCxsChu5whVi/6OPjc0z
        owi2e7Al4p4YTvMRw86I+gF7Ow==
X-Google-Smtp-Source: AGHT+IHTc2UW0PcRRtRg3EJmwXBDKZ0rRGICIe4tZ3tRk+SG6RlHUvnvHSIX5664+drOKrq+nZy8rg==
X-Received: by 2002:a05:6000:92c:b0:32d:81f9:7712 with SMTP id cx12-20020a056000092c00b0032d81f97712mr8264026wrb.20.1698054893380;
        Mon, 23 Oct 2023 02:54:53 -0700 (PDT)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id u14-20020a5d468e000000b00323330edbc7sm7428801wrq.20.2023.10.23.02.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 02:54:53 -0700 (PDT)
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
Subject: [RFT PATCH 09/17] ASoC: codecs: wm8962: Handle component name prefix
Date:   Mon, 23 Oct 2023 11:54:20 +0200
Message-Id: <20231023095428.166563-10-krzysztof.kozlowski@linaro.org>
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
 sound/soc/codecs/wm8962.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
index 83ce5dbecc45..fb90ae6a8a34 100644
--- a/sound/soc/codecs/wm8962.c
+++ b/sound/soc/codecs/wm8962.c
@@ -1854,10 +1854,10 @@ static int tp_event(struct snd_soc_dapm_widget *w,
 
 	reg = WM8962_ADDITIONAL_CONTROL_4;
 
-	if (!strcmp(w->name, "TEMP_HP")) {
+	if (!snd_soc_dapm_widget_name_cmp(w, "TEMP_HP")) {
 		mask = WM8962_TEMP_ENA_HP_MASK;
 		val = WM8962_TEMP_ENA_HP;
-	} else if (!strcmp(w->name, "TEMP_SPK")) {
+	} else if (!snd_soc_dapm_widget_name_cmp(w, "TEMP_SPK")) {
 		mask = WM8962_TEMP_ENA_SPK_MASK;
 		val = WM8962_TEMP_ENA_SPK;
 	} else {
-- 
2.34.1

