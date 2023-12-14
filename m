Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XY6n0fKP"
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34C1C118
	for <linux-tegra@vger.kernel.org>; Thu, 14 Dec 2023 05:15:45 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2cc3f5e7451so15426751fa.2
        for <linux-tegra@vger.kernel.org>; Thu, 14 Dec 2023 05:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702559743; x=1703164543; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Hsy3l+28Wlzo8cXaOBVgUpQ+5XTYvjbT3bX9woEdBdk=;
        b=XY6n0fKPFM4ylqgrT+DP76vnVBxqSarH7iMtVLY8BSDMOhHRf/hj2cgzV6Z2bP1q1S
         pg4zff30ctvffBQbZbZ79zSc5B0zsQ9Tfek6gdPQiHRYWRrZsEl/SICIdfiF/7HAc104
         o8YXB6BEiTotSUiemKqQf4I8rtO+lOeyP4fLIFKG7eZMl0i+IWrOWaC4iagqJED4ArC8
         d1T4XMYTFKdjlPhIelCh0AkKgDD0TuseyDky/ByMBVxSidGIMeEz7wOaTfoz/B44Jwv7
         FOHF61fDmfANI7mQD4HasB75MbTro1hmLI8BgjxRrb+6cQKm+oUU/BzZnIWFjBAMP8YV
         52ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702559743; x=1703164543;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hsy3l+28Wlzo8cXaOBVgUpQ+5XTYvjbT3bX9woEdBdk=;
        b=vScjCOyUU+ruXNSxvNgwyq/qbPAn8BojX9ZP8xm2s8yZJlWzOTk+zi/9KqWrenjXLT
         ZWFr/TqqC052qk2tvHQxzdhD/SJePkmcc/afwmM0jIKpwxnRqyNRKehKMikKB9Osq7hm
         BDkayLf4itEqt7fiItlqDqkdkjRst36O0Y2Ec/rMmKQcP6/0hwyxYZHgHm5yAJ63p9HU
         LRSmK1gjyKFdI/lgl5tAQ476vjxpEq3mrmynp1mCwLALPCVewMQtNfZaGJVNIPEitRbg
         9T07TR4mzmabeVfsJFPwaUafi56U4A422XBrN91ORT5SCdfTs7boieT9TJpgRzHbTN7j
         TVeQ==
X-Gm-Message-State: AOJu0YxmAb9jvYad/so4m03JbGnEHHtWTOEvlw0JhggCMnXVfkKAT7fb
	xMhVSfpMZTKwX6p9XEsznRbUJg==
X-Google-Smtp-Source: AGHT+IGG2eNJ8YdSSOtikRyhfKzL54YiZt8kpDvWZmOdjaLZ+i16vshFSugATB9RNQ2q9+lT0N5dlA==
X-Received: by 2002:a2e:8447:0:b0:2ca:31a:4e8 with SMTP id u7-20020a2e8447000000b002ca031a04e8mr4281616ljh.72.1702559743254;
        Thu, 14 Dec 2023 05:15:43 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id p23-20020a2e93d7000000b002ca02ceae84sm2080478ljh.83.2023.12.14.05.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 05:15:42 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 0/4] GPIO inclusion fixes to misc sound drivers
Date: Thu, 14 Dec 2023 14:15:41 +0100
Message-Id: <20231214-gpio-descriptors-sound-misc-v1-0-e3004176bd8b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP3/emUC/x3MwQqDMAwA0F+RnA0slQ3Zr4gHbdMuh7UlURHEf
 1/Z8V3eBcYqbPDuLlA+xKTkBuo78J8lJ0YJzeAebiBHDlOVgoHNq9StqKGVPQf8inkcV08vGp4
 jR4I2VOUo53+f5vv+ASS6OIxtAAAA
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

Mostly dropping unused headers, and a single driver rewrite.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Linus Walleij (4):
      ASoC: hisilicon: Drop GPIO include
      ASoC: qcom: sc7180: Drop GPIO include
      ASoC: simple-card-utils: Drop GPIO include
      ASoC: tegra: tegra20_ac97: Convert to use GPIO descriptors

 arch/arm/boot/dts/nvidia/tegra20-colibri.dtsi |  2 +-
 sound/soc/generic/audio-graph-card.c          |  1 -
 sound/soc/generic/audio-graph-card2.c         |  1 -
 sound/soc/generic/simple-card-utils.c         |  1 -
 sound/soc/hisilicon/hi6210-i2s.c              |  1 -
 sound/soc/qcom/sc7180.c                       |  1 -
 sound/soc/tegra/tegra20_ac97.c                | 55 +++++++++++++--------------
 sound/soc/tegra/tegra20_ac97.h                |  4 +-
 8 files changed, 29 insertions(+), 37 deletions(-)
---
base-commit: b85ea95d086471afb4ad062012a4d73cd328fa86
change-id: 20231212-gpio-descriptors-sound-misc-8bc161358ef1

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>

