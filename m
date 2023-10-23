Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95A17C001E0
	for <linux-tegra@archiver.kernel.org>; Mon, 23 Oct 2023 09:55:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233278AbjJWJzD (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 23 Oct 2023 05:55:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233381AbjJWJyy (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 23 Oct 2023 05:54:54 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3547510C1
        for <linux-tegra@vger.kernel.org>; Mon, 23 Oct 2023 02:54:48 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-507b18cf2e1so4190596e87.3
        for <linux-tegra@vger.kernel.org>; Mon, 23 Oct 2023 02:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698054886; x=1698659686; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mg1xiJ4tpWrc01TGrYLaIzComQYv1hvzEAR610Ntv3U=;
        b=JvPo8itjnZKIOL3UKj+h26Qsqnz1vIHwnQKAtfZbht61ULhSuht5nI6AGqtZeMKihV
         +MdVA6scm4aoYbJPRY+ddPNe+Um0dLrSMB2M54HXv5g7zjV9U+UcgemyI/b0dM4Du3sz
         cV8fFiQ7g0s9UKrkVurikbBmR7/nlOv0sZGbIkwvQ2r1iV0WD8t/ZDbsDCPS7tLqTLxE
         CVBqJH8DSQQlaTj0Qi93iQxCeu4ElE4i2i0ljbv8NSNNPnf7TbnwG3yYpkjHru5A0eOl
         jIgxsipz3FiEJR0pzuAMCjo48lahAxBWPWg9kS6BEecVnd/vgxeEEwBGZKzznkSCsNIm
         EXFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698054886; x=1698659686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mg1xiJ4tpWrc01TGrYLaIzComQYv1hvzEAR610Ntv3U=;
        b=TczXBX7gGYn43aRUaoshC5rb4Lw1qG6dnJLxqkMd1XDgMjbu4ca3dBib/MEp38h5vo
         0L9DTzMhEwV+daKDuJOQj4dsquShsoAE5KFo5T/TB0hZ+g0nh5QmOA/8dypIUb7ICfKR
         V9EvKkPPcXv24+R/g9JnS8SqBl17E7YqQM8NX/LDeUj9sDMoIoomjhapLbZvcFWOVngt
         u0W8fW15aC2vTb19uhCMa0KU2lJOcvcF+zRucHes361hnNKA/37jh9N4MjKZzCCy8kO4
         Lr/n2rrFhpBgGS5xw8+SE7LXVifd6NI7eoXGRaIWyCbv3uASZSnjymPcPOa51xlv/S2c
         ekoA==
X-Gm-Message-State: AOJu0YzRqJ/JsD+qoJQZzqF1hh2dhiFq5CuNoukpCSxaJobdIBf8w4Yu
        4hcxqne8LzAkNge8I5Flnc6GJw==
X-Google-Smtp-Source: AGHT+IGVnDVUzhqtZG2Rxtx8SwcXnzeMCoNHkuKGJvqRY3jD0nxvOcWU8+AB175lzXv5OfVrm4BxmA==
X-Received: by 2002:ac2:4430:0:b0:500:b7ed:105a with SMTP id w16-20020ac24430000000b00500b7ed105amr6312430lfl.29.1698054886439;
        Mon, 23 Oct 2023 02:54:46 -0700 (PDT)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id u14-20020a5d468e000000b00323330edbc7sm7428801wrq.20.2023.10.23.02.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 02:54:46 -0700 (PDT)
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
Subject: [RFT PATCH 06/17] ASoC: codecs: rt5682s: Handle component name prefix
Date:   Mon, 23 Oct 2023 11:54:17 +0200
Message-Id: <20231023095428.166563-7-krzysztof.kozlowski@linaro.org>
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
 sound/soc/codecs/rt5682s.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt5682s.c b/sound/soc/codecs/rt5682s.c
index 68ac5ea50396..c261c33c4be7 100644
--- a/sound/soc/codecs/rt5682s.c
+++ b/sound/soc/codecs/rt5682s.c
@@ -1323,9 +1323,9 @@ static int set_i2s_event(struct snd_soc_dapm_widget *w,
 	if (SND_SOC_DAPM_EVENT_ON(event))
 		on = 1;
 
-	if (!strcmp(w->name, "I2S1") && !rt5682s->wclk_enabled)
+	if (!snd_soc_dapm_widget_name_cmp(w, "I2S1") && !rt5682s->wclk_enabled)
 		rt5682s_set_i2s(rt5682s, RT5682S_AIF1, on);
-	else if (!strcmp(w->name, "I2S2"))
+	else if (!snd_soc_dapm_widget_name_cmp(w, "I2S2"))
 		rt5682s_set_i2s(rt5682s, RT5682S_AIF2, on);
 
 	return 0;
-- 
2.34.1

