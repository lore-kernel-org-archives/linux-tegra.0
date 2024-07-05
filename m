Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8AD1152E0E
	for <linux-tegra@vger.kernel.org>; Fri,  5 Jul 2024 09:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720173137; cv=none; b=tuIDPNZ9WFV1kz/mbpse5bgsSaLOOdsJjdJfkrxmDUeuYPnMRnwNnjkqfok4tdX+5mxCVTdhZGmO8hNmDNMw4/4yl7wuEwBznbOg1r3B83dexLFcto2PGU03JX2eQQm1WmnbpEYsOyL2dU3eH3na1zupFFQeuSfXHj0hAVN4LRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720173137; c=relaxed/simple;
	bh=a/lRhuB7v/RH3R5hhGbQWTk2cMSnvHEqh4aApez49W0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bbH2vB5tL6PadWPinPkNNDEY0U5g+poKqN3YBm93XaH2HUjdidhPd0Npu8FXXGPHh6p3RVOwv7kRLU1rIMthg5gPBcDwpUCvIUXUAJumycpsITCXV5Z6fLDb5wDgk0z2btyLhZTiizOMmF62Ce2JZyokF0Su8zMM+vQA+fWoCBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GSUz/9Ge; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GSUz/9Ge"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4257a390a4eso9899795e9.0
        for <linux-tegra@vger.kernel.org>; Fri, 05 Jul 2024 02:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720173134; x=1720777934; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SNLCghh0Yz7i7p/GLk3+VVI6b/6S91C5eV8NUz+ePr4=;
        b=GSUz/9GePihPKfZRE3dnpikaqXZ31V1jfMm1P+YKR/51M/tL0oh/cdSTyiSj0UEkJ5
         gbKmEKKGaydWFHR1y+LPlalO/jLSoDbrJY8xTGCdiXx5B3Oplgr3FsrO4d6mNCm8gk/b
         ouCtYvKeoXi8cN+G5TxH0Oa0uRLl2dhdJU+52PhIJVKAB32xlD8jB3LLcv4Q1f9GkWCU
         xh+k91zdg2T0K3OoPIN8mX+/c6b5SRy71u6xnXQL3XjZXLcvUjGAmrtcC5sVKS/kGAFa
         a8GpOpY/a4TgxQQR0+RySY1PLBC8gbGuB6Dl6+6yUkYkoxKsSjEcmOUX/Nepf7w4i0nX
         EyVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720173134; x=1720777934;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SNLCghh0Yz7i7p/GLk3+VVI6b/6S91C5eV8NUz+ePr4=;
        b=py8TwCImzgPp4YgEoND2XvMdi6y1D6j8ZF7PJgCPH7cg8ai+lsnUnjSsKWZMXHRle3
         ENgBmN3ejEilVH0Eu4bBpVdtMd01NLwQMzkm3lwj1N8c3TSWLh6rCjxauOTLmUOYRA2m
         wiCS+KapSppbKse+YvlAVfwyHkY/ThZ2iglgDfW668KoJIQ34ZoWdLyfeDgH0BH9lY/+
         mB6VZW1OwRSxYC17oGbhbkl4w5vgH1XLOgKGIpjl9x6owdVqff11bpb2nulnmPgObtKz
         nxpwRN7BWVYafJJ0gC3pgw+itlVfIxQpFrdoaK1rlY1IvwXWAuP3hLEmluT04CDMafhS
         MEHg==
X-Forwarded-Encrypted: i=1; AJvYcCVDpl56tY8R5AKFKB7yijJZ35U/DPJHvHgJgzj/t+NYsC0xxgJaD3cGxkmkGOCdly+nwuQ15CN1Ypg0r1WSu9ExjZcPGAmcWkgd/uQ=
X-Gm-Message-State: AOJu0YxninaS3Tr1SLKH0T9NhcmUS7Q14EjsxBi2x6xDVQM2NURRQsiA
	mYhDcTpLBJd8anHhT9PgvlmER3AVXIWn6dzdBT2ETboa0hggdL0kq5THcaPqXfw=
X-Google-Smtp-Source: AGHT+IFYfb3KFQclQvKrC0bxRkYL5QT+2rGoFThcisJv2vbGuFeFm7mkup3MxH/OKF2jKfIZ5LbeHA==
X-Received: by 2002:a05:600c:1c98:b0:422:4fcd:d4b3 with SMTP id 5b1f17b1804b1-4264a45f9b6mr29668465e9.37.1720173134425;
        Fri, 05 Jul 2024 02:52:14 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d1650sm55528995e9.2.2024.07.05.02.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 02:52:13 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 05 Jul 2024 11:51:30 +0200
Subject: [PATCH RESEND 11/22] dt-bindings: thermal: qcom-tsens: reference
 thermal-sensor schema
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240705-dt-bindings-thermal-allof-v1-11-554061b52fbc@linaro.org>
References: <20240705-dt-bindings-thermal-allof-v1-0-554061b52fbc@linaro.org>
In-Reply-To: <20240705-dt-bindings-thermal-allof-v1-0-554061b52fbc@linaro.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Guillaume La Roque <glaroque@baylibre.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, imx@lists.linux.dev, 
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Florian Fainelli <f.fainelli@gmail.com>, 
 linux-rpi-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Amit Kucheria <amitk@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1473;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=a/lRhuB7v/RH3R5hhGbQWTk2cMSnvHEqh4aApez49W0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmh8ItUHW8uis0xqBnpaivnedFAv03y9sHCQoyi
 PU5+qzAltKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZofCLQAKCRDBN2bmhouD
 18AfD/9FP2sbB58gVOPvih1LQKxHYPR0Hs/4bGCOQweiMftG+QKq9EOPHzRIXTtK7kgNYMmiIPJ
 ESDVzDFpQtdPNScJKmQrrzckoPdulbnhSf/C+HvC+AOXeNQ3Y5rXnqVJyaVIzCATsGwB2G30OaX
 bwOopuCQR4XRMwuV1SSTvnm6iBuKVCpRBeIx1xF6whanxk5+b3/QcZ4sDwYhMkd8xYnhWtBaDOI
 LK+cxkel64DvnNqsQQIT12u1VVfMEgsLvlq+pBTxskUJ57J9xq2ZCpbbC0TJxa7haCFUdI8DXOZ
 ert0DERpvbg3lNVt2S9d6CdgftWlo9jIaMEqWl1k466LDEfu7skl8Bim3Muevr+0PTV39uJG2Vw
 Eu0o7uNkutPJRXAMgv+ikwQnff624dT9I5OsObJOX1sDCAn8vPv0eSCPw+7lFtRmfdJXGKOt4XN
 33+A2HmS+If/cDDdBuNDc9oob72OJWXKk2I/1SRHVwTCxPAfWMIyXdGcqpo/g3qdnFe12hr0lwY
 EmfN9bd0R0r3sVz17OiSSyA9ooIkguFI8MpmZ3GynWf+OdUcpsi7IMHMcXwqfXkaUME59Qk7rhQ
 vMYrJqv9zEwcvxGkvh88o+St8318dVAOhwM82L/kj3iot6Tiw5uoXXZt1UOwj0JtT3PkO0y4caT
 +jSo368RDDbbF7Q==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Device is a thermal sensor and it requires '#thermal-sensor-cells', so
reference the thermal-sensor.yaml to simplify it and bring the
common definition of '#thermal-sensor-cells' property.

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Amit Kucheria <amitk@kernel.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index 99d9c526c0b6..cce6624228c7 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -217,18 +217,16 @@ properties:
 
   "#thermal-sensor-cells":
     const: 1
-    description:
-      Number of cells required to uniquely identify the thermal sensors. Since
-      we have multiple sensors this is set to 1
 
 required:
   - compatible
   - interrupts
   - interrupt-names
-  - "#thermal-sensor-cells"
   - "#qcom,sensors"
 
 allOf:
+  - $ref: thermal-sensor.yaml#
+
   - if:
       properties:
         compatible:
@@ -292,7 +290,7 @@ allOf:
       required:
         - reg
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.43.0

