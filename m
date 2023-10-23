Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E59C2C004C0
	for <linux-tegra@archiver.kernel.org>; Mon, 23 Oct 2023 09:56:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233538AbjJWJ4T (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 23 Oct 2023 05:56:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233449AbjJWJzm (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 23 Oct 2023 05:55:42 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4F301BD3
        for <linux-tegra@vger.kernel.org>; Mon, 23 Oct 2023 02:55:11 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-32dcd3e5f3fso2244129f8f.1
        for <linux-tegra@vger.kernel.org>; Mon, 23 Oct 2023 02:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698054909; x=1698659709; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZC07USduWdC7NjdC5xCXcdF31ciW6Iy95zkt28zTytw=;
        b=IN9BBhY7AWsLmw5OWUzNi5QkJLX2pyzZDlr74xE9tChaAGxlE7hjwrsarVit6d2C5v
         +shlywCH/K/yFZmM0xN7KP+JhjcZN1PNP2Udv9fls3v2SwqdvbKDm58/Zfx727w6aWTi
         QRAFJ6Am287XLXbVwP8nfU/uFN8lV+4evO+x9p+3QNOh262mA/V/ZnA/VEUYRhUviQSL
         w4DtwGvsMKWgbwIot69DhRstafI0U43TqVAbhvqCUpqiXSHu+kzi2VI4AhZkDGKYPVGY
         uA7QeSGDMiBOQSLfG3W60im/6ev0Uv8cW9evATrEOi+SUbZZfyNV7KNnUDXER3B9LgiS
         RCSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698054909; x=1698659709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZC07USduWdC7NjdC5xCXcdF31ciW6Iy95zkt28zTytw=;
        b=cg3KB1/XAnWzabAG0SyxVEO6PE1GDB4duM2Pv70TtQnPjoDYjHa2gzOSScqNN7IaDM
         gTTlmBBCW8dwjeMlfo7xVp7uFGK6Mm9NF7LimStzcA0pqSN6FZq7bMpLlC3RYm6umVtd
         6TVXCkn/Ae+I9hXh8VnpUCWv7k23WySXpur6wEn9FYqPcs8dPWxtnXc6iW3uodMrtRy+
         1EYeZBvQLbCL7DlZ5bBIP5jMJ8JgAuStAXZ8X1fnRlQflgflp1gE/V3ALwvaS9uBUccK
         pnPRS/Ssk1c4A8OcTP2C6x1zTFidkl+E6TUV3cBQgOqYZ9RSSxpem426fx1OmWEn+kIf
         ebpQ==
X-Gm-Message-State: AOJu0YxLokMVl5U22ljaRAn39FLbzJMmmfoaZzueVTX6wrldSi4eEdkC
        jQh2j5sa+kxvZsOfNn8kyt4hpg==
X-Google-Smtp-Source: AGHT+IEj7uxeA3nMNUo9sdq2wgfqK3o3A7RdYb9gMk09HGqmRvuI7EP8mG67nJpViU+BpTyEwFeWzQ==
X-Received: by 2002:adf:e80a:0:b0:32d:8c6d:cda4 with SMTP id o10-20020adfe80a000000b0032d8c6dcda4mr6419354wrm.43.1698054909354;
        Mon, 23 Oct 2023 02:55:09 -0700 (PDT)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id u14-20020a5d468e000000b00323330edbc7sm7428801wrq.20.2023.10.23.02.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 02:55:08 -0700 (PDT)
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
Subject: [RFT PATCH 16/17] ASoC: samsung: speyside: Handle component name prefix
Date:   Mon, 23 Oct 2023 11:54:27 +0200
Message-Id: <20231023095428.166563-17-krzysztof.kozlowski@linaro.org>
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
 sound/soc/samsung/speyside.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/samsung/speyside.c b/sound/soc/samsung/speyside.c
index 43519572dc69..79476e8eb680 100644
--- a/sound/soc/samsung/speyside.c
+++ b/sound/soc/samsung/speyside.c
@@ -111,9 +111,9 @@ static int speyside_jack_polarity;
 static int speyside_get_micbias(struct snd_soc_dapm_widget *source,
 				struct snd_soc_dapm_widget *sink)
 {
-	if (speyside_jack_polarity && (strcmp(source->name, "MICB1") == 0))
+	if (speyside_jack_polarity && (snd_soc_dapm_widget_name_cmp(source, "MICB1") == 0))
 		return 1;
-	if (!speyside_jack_polarity && (strcmp(source->name, "MICB2") == 0))
+	if (!speyside_jack_polarity && (snd_soc_dapm_widget_name_cmp(source, "MICB2") == 0))
 		return 1;
 
 	return 0;
-- 
2.34.1

