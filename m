Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TL8ajCZl"
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03EA0124
	for <linux-tegra@vger.kernel.org>; Thu, 14 Dec 2023 05:15:47 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2c9f572c4c5so121042571fa.2
        for <linux-tegra@vger.kernel.org>; Thu, 14 Dec 2023 05:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702559745; x=1703164545; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zl/2P+gDfIp0TQYPTG0vKiGyNkTIQEmbjw6ExQX0Pf0=;
        b=TL8ajCZl/2yefj7BwasT5VYrfRFUzgKpwg5OTH4JBluvoKED4AGmviQdoBslouEie8
         tk1Iz3U7aG4QCHTIuBU4ORNnJyk0kZs0QB72LuDolmWF6d07hbJhrq0qUGB460X93bWc
         lRBlpkKbpomhkMhMTMzXvRiQjURgNSw6MLL582wkFnpRNgZIywM2hmLjzUyS9iHLkLUw
         8Bsv277sXbLLNHJKsFM2cHw5SUCFY97qfCNth2DRvDAhl1VYeKJAyNE9HesNabOZgB/m
         QX1o110arehY/3HMUp2izvt0sjqsrGW163gFdMdeSoLIC4JsZ4wJbHcjcrrVmmkmiyXW
         Wo9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702559745; x=1703164545;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zl/2P+gDfIp0TQYPTG0vKiGyNkTIQEmbjw6ExQX0Pf0=;
        b=FR1PcXP0uP38c4F9D2ZfatUm/vuhVITVIWvHdZkIn6W3oDtvzIqWhuMgZpxH1wyh7i
         PtdT2j/dIQfmL4mndvtiPZ8UDoFdGqTZNZmlQI8OD5Q869hgDu78/VC2eaXyoF+/fh19
         Seq5KLje3/tKOG2G7NgpBrWSdglpliqhB82xqGwPVVNxCFNppVIXjfBI4fhSf8wCVA2c
         ixGL0MaI4zjDemEN4Df+nZ3sFocRGrc2rPzHuZ5+oggPumPuygAXPGB5XCyobxgE5RyM
         zLdoryoC4vyiU1ettTlKAoWscgtX8NnhFvfCdeheht5JHTP54QxcBTaIjKHVVuiD/TMG
         y49g==
X-Gm-Message-State: AOJu0YyGBM2sSMt4EGMi0Pi+U+9dqyfwefMs45/xIlJobhSk5LEthhao
	mWNvWrTPyt9iGz0kvxPQHRBmlg==
X-Google-Smtp-Source: AGHT+IGLIizoYzjhcP0yvk0sz4u3yPAe8upgnxL+cRqGZY/tUMOhZBAjkVQRfIg1sZ28AJa+AoI7CQ==
X-Received: by 2002:a05:651c:110:b0:2ca:f17:dd69 with SMTP id a16-20020a05651c011000b002ca0f17dd69mr4501498ljb.43.1702559745303;
        Thu, 14 Dec 2023 05:15:45 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id p23-20020a2e93d7000000b002ca02ceae84sm2080478ljh.83.2023.12.14.05.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 05:15:44 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 14 Dec 2023 14:15:43 +0100
Subject: [PATCH 2/4] ASoC: qcom: sc7180: Drop GPIO include
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231214-gpio-descriptors-sound-misc-v1-2-e3004176bd8b@linaro.org>
References: <20231214-gpio-descriptors-sound-misc-v1-0-e3004176bd8b@linaro.org>
In-Reply-To: <20231214-gpio-descriptors-sound-misc-v1-0-e3004176bd8b@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, 
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.4

This driver is including the legacy GPIO header <linux/gpio.h>
but not using any symbols from it. Drop the include.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/qcom/sc7180.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/qcom/sc7180.c b/sound/soc/qcom/sc7180.c
index b0320a74d508..4ab34a8842ce 100644
--- a/sound/soc/qcom/sc7180.c
+++ b/sound/soc/qcom/sc7180.c
@@ -6,7 +6,6 @@
 
 #include <dt-bindings/sound/sc7180-lpass.h>
 #include <dt-bindings/sound/qcom,q6afe.h>
-#include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/of.h>

-- 
2.34.1

