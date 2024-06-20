Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1411AC23A
	for <linux-tegra@vger.kernel.org>; Thu, 20 Jun 2024 11:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718883313; cv=none; b=SfSLgWQo6KFIHVOVZUVsm/4Sh93NcGyWVs5ar24G5PuPiBovo4YmYsj7s2KOp4wVq2nTXGA4/oF7G9BOFnxWKeq6kjZly/MdGe7tDut4jOFr33498Z/xJMlae6yjL6tFtXJ+LdyhAg+846xerqmyHEz6+GSG3EnvvjiVc3sDm54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718883313; c=relaxed/simple;
	bh=oOZv8tGbYc82cA/I5ucBrkQYLVo4QrwMB1ASBg/dOCU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kO9yOWjQ4kkxbf/wx/Ib65B+kzjN7N4q5gV58dVRBP6meBiur/D1mkNQBJl4IB4QFJKiEzLE9xjYmH6PkSrn8UkrISXNz3Xxmk2Ky40AAurb0ySUA4/acE2LXfXSfQJGbcdOe2q5yTGW9Y6UUX71c83uOMTVAMcugSEsxtwVRV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BmKrjxOg; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BmKrjxOg"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2ebe40673d8so8004901fa.3
        for <linux-tegra@vger.kernel.org>; Thu, 20 Jun 2024 04:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718883309; x=1719488109; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ucm5uoyXbWeiBfyorFJ2TTmyVLZllZQAufxu5LXpC9s=;
        b=BmKrjxOgzrdPqZmGoufph+RudB59URIW0+egBlGEj0xLQCNTSQ0J3/0SzuWaIhi5Y+
         T9uEDkhsDWIhwerfiV4wfEU9Wnu3On9YziiayCZmkYR6Dy1auTmE9qG7+H4A00xieV5F
         XZy1uA69ru+rhPehh5RYHjRTV2q0G/RdqAABOv0sVVveyEnafrZz8txJpehXVPS8gzvF
         lDBbM5q/igxuW282uO3gs8RxfWZSDvxdJPQyGKIAD3EiAcPpBJaSD4R++4NnSPqiYAiZ
         SDnIC+WJgpni1YhDDAn0eI6DRojM7q0T5tyBdZL+Jd41DJq/MB+52svpmdW5tYAb4bAK
         obGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718883309; x=1719488109;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ucm5uoyXbWeiBfyorFJ2TTmyVLZllZQAufxu5LXpC9s=;
        b=LIC4IihsE7C1sIapLjXSExetA5Z1jJSiQo7cSoXVK7ODSCpp1z1+QGH0JBg9bAc2Qn
         tlvJxVEeNeoOCFMMRxX13RCqOkaZ2wQ4ecfadoViMPJzFwSoAqve8uJVZGo8jDA1VEl+
         quzX3EtRL8QQFTToD912i1cAiiWgW23lsNsB9V9BqodObjkPGBZSRcjR8Q5cCazQiA8h
         W7Y+79lzB4eoSL/2f/574zmbbokpNOS5V/Yiw2PJlarESNpjYKSLJ/N/jkZp7ZKK++ED
         Na744vffj//TGGjs39J4p3dTVx2ySueiGZ4S0Ldhu3jPKcKchxZWckA7h5hJtl5Ghmg8
         HRgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkFw+WJzrsWAdw9HIlS0wWfocBiJgXmERJTaDHFYRH9fWQaZ1jkpkqOGsiBPiQi1f8SfyKc+hz0TxSpROrMKoyJ5gQ6a8x8N/ppuc=
X-Gm-Message-State: AOJu0YwKUbaRSGkUspzlOH/KuHYwLYoiB50HVRPOLt44GKtvopEsctUC
	emi8pJqfFX/XD5dpZzteOUz44SZwhMkq9VfzcI/1SNPUy3rwEgr+yfWSdNfe1EI=
X-Google-Smtp-Source: AGHT+IGCiIDIoYSisVXo+ZB+zS0aVSEEsBqiNcTjA1lAiqVyjloGPunGlLuMfIiyiuCdUmat3EsNeg==
X-Received: by 2002:a2e:2c1a:0:b0:2ec:1dee:4a2c with SMTP id 38308e7fff4ca-2ec3cfe5a34mr31845791fa.32.1718883308821;
        Thu, 20 Jun 2024 04:35:08 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42471e6623fsm49708985e9.1.2024.06.20.04.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 04:35:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 20 Jun 2024 13:34:50 +0200
Subject: [PATCH 2/7] dt-bindings: i2c: google,cros-ec-i2c-tunnel: correct
 path to i2c-controller schema
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240620-dt-bindings-i2c-clean-v1-2-3a1016a95f9d@linaro.org>
References: <20240620-dt-bindings-i2c-clean-v1-0-3a1016a95f9d@linaro.org>
In-Reply-To: <20240620-dt-bindings-i2c-clean-v1-0-3a1016a95f9d@linaro.org>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Sergiu Moga <sergiu.moga@microchip.com>, Benson Leung <bleung@chromium.org>, 
 Guenter Roeck <groeck@chromium.org>, Doug Anderson <dianders@chromium.org>, 
 Enric Balletbo i Serra <eballetbo@kernel.org>, 
 =?utf-8?q?Ricardo_Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Vignesh R <vigneshr@ti.com>, 
 Kamal Dasu <kamal.dasu@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Chris Brandt <chris.brandt@renesas.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 chrome-platform@lists.linux.dev, linux-tegra@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-omap@vger.kernel.org, 
 Kamal Dasu <kdasu.kdev@gmail.com>, linux-renesas-soc@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, stable@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1022;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=oOZv8tGbYc82cA/I5ucBrkQYLVo4QrwMB1ASBg/dOCU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmdBPgSEMSR1DQFgpOr4nndNuYpTz1w8LwEmDS4
 0mTKxKxfwyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZnQT4AAKCRDBN2bmhouD
 13PCEACPHog1fCP0NY2sMndBJdes0p4yAslPX9rTELMCOS5n5DPp637Do0m7jFjPFSaIDm3iPvs
 RksgCvs1gc6UMZtaL5lq02z8khB+ZrIyy2eNWUKoEKOTHkGqoNyiup6iyvZ5IPCl79R3Uu2Vuyc
 WgpJF7yIUkSWoLj+eqqrsiJK1rmDQu/H6QySDOa34JPLbE4e6oEgRVgl7+4sGvuu/OwFTILGYTd
 1De+1y75qaSe/BtA3H2EOfD39VJB4vDmRLnoDqWPd5BM0gQ+hApp5SwfTWYfFhrTsx2BUxpFfdp
 Rm/GKg61tGmvzgRIiyKvxv+jmYlEOjPQk2KAukH2uuIhZOrLGTCFgLYypk6phoJKezXfYIa9CIY
 Z/xaQDuglH6wtkcFVjWu94Jp3QurgG/mn4/TtKFPRjvWTcJzt/AaWQ3wDNlXuombZYuyrOvqCRj
 BPKybgVc6k88Av0AK9GbgcKqpzL1aJzk+3OsDcupIf9v2gyKLnCh63r/ruXQgE/tZDtwxY6IvmK
 1hicnz637diRzjdPPurY0OMN91Rl8uv67j7Xi5yJexUmFE7yZHRYQ+pn09lY/lXqBKYoTYnCHJp
 7/cj8xOfunNb24z4rm29nnaJ60CpvQc1a63gaQQ2q/8YnetFezeHwhYpyNHUUG9lv259BdHD+e3
 WsXEUhMwdoS6FpA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

The referenced i2c-controller.yaml schema is provided by dtschema
package (outside of Linux kernel), so use full path to reference it.

Cc: <stable@vger.kernel.org>
Fixes: 1acd4577a66f ("dt-bindings: i2c: convert i2c-cros-ec-tunnel to json-schema")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/i2c/google,cros-ec-i2c-tunnel.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/google,cros-ec-i2c-tunnel.yaml b/Documentation/devicetree/bindings/i2c/google,cros-ec-i2c-tunnel.yaml
index ab151c9db219..580003cdfff5 100644
--- a/Documentation/devicetree/bindings/i2c/google,cros-ec-i2c-tunnel.yaml
+++ b/Documentation/devicetree/bindings/i2c/google,cros-ec-i2c-tunnel.yaml
@@ -21,7 +21,7 @@ description: |
   google,cros-ec-spi or google,cros-ec-i2c.
 
 allOf:
-  - $ref: i2c-controller.yaml#
+  - $ref: /schemas/i2c/i2c-controller.yaml#
 
 properties:
   compatible:

-- 
2.43.0

