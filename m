Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E50DEC001E0
	for <linux-tegra@archiver.kernel.org>; Mon, 23 Oct 2023 09:55:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233456AbjJWJzX (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 23 Oct 2023 05:55:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233463AbjJWJzA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 23 Oct 2023 05:55:00 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94B111701
        for <linux-tegra@vger.kernel.org>; Mon, 23 Oct 2023 02:54:53 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-32daeed7771so2082525f8f.3
        for <linux-tegra@vger.kernel.org>; Mon, 23 Oct 2023 02:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698054888; x=1698659688; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ohG7h5MVOd61zy+5ypL65RpxKjVv+oL8L5RUWwJJdI0=;
        b=zt1WSV923YXZ9jiqUWxltIavwRi0qJrm3ZdsnmiGXDn4g5RzGRzoOKj2FcSIug+3G4
         STQT703eYTQCjkO4vkkps4aAlLoMr/BNeRiz2wPmKhhzxXUL5ddUytw72iZlh9wH7nN4
         5tiK8DcJGHzNBdNKD42B4jnU5r/J6nLE6cAaKcjnIL08Dvs8P5hQo7rhf5enpmkkt2We
         F+eQomS9eoHDDxFMgBiRWYHhfdUa/vGg/yWsA2OGsy75n/YlfVGuy8D0sE3EI0jGisSN
         j6Nb+myzHwdPy6PcSq3Ka/1mYSQiJnO0yjkZecqaQyIcjD0SutQZqjN4LirlWwV8PQkv
         FTgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698054888; x=1698659688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ohG7h5MVOd61zy+5ypL65RpxKjVv+oL8L5RUWwJJdI0=;
        b=JakY9ld2/4SqL5PzRR+k1oXr0i74EOo4rQYQ6LX4FjDw0Q3jbqftxudxkhRcpCLpV/
         Yy88Cl1pckKtbE3JPS0sLrdZvbWI6/+E/wvq2Uc4NHJED1xHjCSsQNYqt1KyikY91ae3
         eWVjFs4suDECMY4vg+JgnSvD6NaI/HZ/PxuM7nh4OxspWzPKaeAwDfa+kTVcypY+Mr0y
         OiFmBPLYRpLy8hoA1Rm+/f76cP5x8RtaXbKN4YX3Gs6sIJygV7jA4JVkm2ELbx18xcIK
         l7sqz2PSgTSjSjvJgQAIQQM0yagf/prV1Yggii7sN+936M9TnangaRQT/JRU/rAUXiO4
         2zTA==
X-Gm-Message-State: AOJu0Yy9nADevhIHnPDHQ+xUDGFf/nZRzGRDsEtg9+xPRE8/T0PN9bQa
        LnISMPbqqtrYKgNw/GoiruJLnw==
X-Google-Smtp-Source: AGHT+IF2XQ2NytyZKfSuKXcxhn8MgqaftjUTA3vcBEY0OG7GzuniO27qe9jeb7abDdumrFZMKzYUnQ==
X-Received: by 2002:adf:fd90:0:b0:32d:8a32:3b2f with SMTP id d16-20020adffd90000000b0032d8a323b2fmr5871452wrr.16.1698054888606;
        Mon, 23 Oct 2023 02:54:48 -0700 (PDT)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id u14-20020a5d468e000000b00323330edbc7sm7428801wrq.20.2023.10.23.02.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 02:54:48 -0700 (PDT)
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
Subject: [RFT PATCH 07/17] ASoC: codecs: rtq9128: Handle component name prefix
Date:   Mon, 23 Oct 2023 11:54:18 +0200
Message-Id: <20231023095428.166563-8-krzysztof.kozlowski@linaro.org>
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
 sound/soc/codecs/rtq9128.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/rtq9128.c b/sound/soc/codecs/rtq9128.c
index 371d622c6214..c22b047115cc 100644
--- a/sound/soc/codecs/rtq9128.c
+++ b/sound/soc/codecs/rtq9128.c
@@ -291,11 +291,11 @@ static int rtq9128_dac_power_event(struct snd_soc_dapm_widget *w, struct snd_kco
 
 	dev_dbg(comp->dev, "%s: %s event %d\n", __func__, w->name, event);
 
-	if (strcmp(w->name, "DAC1") == 0)
+	if (snd_soc_dapm_widget_name_cmp(w, "DAC1") == 0)
 		shift = 6;
-	else if (strcmp(w->name, "DAC2") == 0)
+	else if (snd_soc_dapm_widget_name_cmp(w, "DAC2") == 0)
 		shift = 4;
-	else if (strcmp(w->name, "DAC3") == 0)
+	else if (snd_soc_dapm_widget_name_cmp(w, "DAC3") == 0)
 		shift = 2;
 	else
 		shift = 0;
-- 
2.34.1

