Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF1E15F41D
	for <linux-tegra@vger.kernel.org>; Fri,  5 Jul 2024 09:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720173150; cv=none; b=Ya64wIkYk2gzbxBZojQTh2zE36Y7WVlD3QN8Nnxij/h4sacf+9aGfkf/ZgGTzSfeQunWq2qBRTFgNHbypfj5glHuA6lDbhFzElUYLUF/h5CovWg7B2RNr1vnQXTtTBJ98c6fOCIx1udZt8Sa+J1EBEFsZ1q7eZjm+rXO52nyxkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720173150; c=relaxed/simple;
	bh=75N+YagfjHTq72mKsUwSWer5IrId1tl7O0sy7rhdM/8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EX+xWgtp4KwGq+ncsbL9ux3huZ3IskBLYeLlj0Z4/gLjg05SKTEeZxKSYoazrl1NPXIrQwcaTFtYHq+jDvdGIUzi3Rj8VRgple97LDfmXMTnvGs7FT3pdHQ0veGVrSInQp7eXjGMqo4Ru7bdL3Ua833ufcX7YGDPFhEf3lvyh+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qeK9vaOv; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qeK9vaOv"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-42565cdf99cso12749635e9.3
        for <linux-tegra@vger.kernel.org>; Fri, 05 Jul 2024 02:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720173147; x=1720777947; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AuHHBQ3x8j+r0vn0WL5Gv5Q+wv3ro9XtUSu/vLsatmI=;
        b=qeK9vaOv/Wj6CeHPEFWdXNfo5QtObSS/VO+Z/s2/a2rvRrFJP4JuGjCv2MGjIXRTJ4
         H9zYgl1PjCpKmqSGDKydm4CTN4tIIZMQUTfKXdDZd9G2M1YG+YLMJ7gwld4R1s57G4XL
         9bOKWERkT5pQnnx4oqGIeo6M8wL4e7wLHBsXFD9DhmHFLdSrWqSi6RQajS1ci5ekZ+XU
         YUI3s8HyQ6L2ABI1tRyXAKScJc01e2DpVoMxdsQAskHbqfXJZYSTPh3/dPXD8zj1NG/J
         Tl76yeSQqjhzotwEWQp17k+gaNY9xr2wXIGMnCE1g5zpCehBFkC4oBOx8h+fkemXTcfQ
         KgsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720173147; x=1720777947;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AuHHBQ3x8j+r0vn0WL5Gv5Q+wv3ro9XtUSu/vLsatmI=;
        b=cCtxg+fEjNd02QdrF2zeHEpGsI+7LLjC0MnsbPYGh5c7WTGLoodOTPDVrjgCi4Yqwb
         D7SCMvB6ZrcFMQcVYTX0vvE9Fad+PxBBWC9HJQ4L3iimo7/vE/4fMh9PtS2XgzUg3dYM
         WPncQi5YIv8F2VBrR8W14CFVw+0rsZjhER64IDHX1Srv4nSbosuqF/EpNYSvFGtfTmLh
         xibu4hZrCCuRnHZ/TAAOUJ9ExWAtQehJQt6Qg6LknYC4KhPSOrSCyrKu8S/F4z4W+N9A
         OosSkzT5vF9NbtE7JKIlUaJVb54j9aFVdalWvXQLRflqPHNkgdCAZLHJT1SIN+3bVzX7
         kOvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCOQ7t/G/3vYcVikpbgXY/7l7urGE6X/h8tNy16+fR3kyEwFhHkmozlZdIVylMLL5uIUU6p0p3wc+M/DN/HH9PaAUsiVAsatXN6Uc=
X-Gm-Message-State: AOJu0YwHDAsCi83q30+GtQLncbTv4GEL+oK+E1CrLItdlO3pSbLXfu6z
	+EuL3lFx2PNjLn7hfqPMYBx5r+Equ2q3WQF8WGu8xNg/5H6JWOVpGtfb8ZxNjo0=
X-Google-Smtp-Source: AGHT+IGtiZW5kmWQCddksFiLkJ7NLWn4GnHc+gFB6U9WJuOeTpAWLYG47t+3PEzP4kFD/CgwHcu+8w==
X-Received: by 2002:a05:600c:b43:b0:424:a659:c169 with SMTP id 5b1f17b1804b1-4264a3dedd4mr36118215e9.24.1720173147084;
        Fri, 05 Jul 2024 02:52:27 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d1650sm55528995e9.2.2024.07.05.02.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 02:52:26 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 05 Jul 2024 11:51:37 +0200
Subject: [PATCH RESEND 18/22] dt-bindings: thermal: st,stm32: reference
 thermal-sensor schema
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240705-dt-bindings-thermal-allof-v1-18-554061b52fbc@linaro.org>
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
 Conor Dooley <conor.dooley@microchip.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1279;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=75N+YagfjHTq72mKsUwSWer5IrId1tl7O0sy7rhdM/8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmh8Izbil3cUyAHoOJ1kZMbs3aE0dEw6Y2tk1gy
 NEb1tU462WJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZofCMwAKCRDBN2bmhouD
 1yD0EACVU5Ga0Qcjk2Fq3mjRRSojMjyY41V+YDOx3XK5fCBF0oNvA1rTr0v1CJoGvWERXxAK1h7
 WCGg8YdOhLZ9Y8E4RAII8mxttBUX5/vM0g8x3jMxcpSWcVg4ZzpxDSCjlmhOqF+UwJEvU7bakhl
 PU0VLj+oO5FdpQZY7aHKXdSvo5qSPHfK1lDe6Fb8APHkCTSwPyuN/9j5FKRNXVuRF4lPNFj2nr3
 c2vsX5GUfAb63ctTYD39a57yTpWr0niK+vi1O8h/FvlRrUm7zor1BvDQDKwiKMszV1+YSkENjDn
 BacnePry+tKPxV6aiIogHG1XJp4/u/Zum8aSwRfThEIGFqaPg1o/9WMNdj/GjxX+KHKITVHP4s7
 A/JSOsxdxkfsLAtUpma7Nc3xFnDuRSgjuVzes9KVBcnPptddMB+SXUCcAxIlCBY88FZvPrJEoQ+
 C861uT3h0T46CechOycWu7onZjHx4E7q5ZGL+mi6ZvNIVDX1kjOHoN12VjhWTVGnR58B5iiaHet
 Ry/HDQUbP9wAbIPi8MuBcvfWeeKxBlanFrWT5lT10E+b/0vZ+EYnPOzi7FL43Nv3jUsLZ9h9s2X
 wIbik/HSCMyp1mQ3AllokuQwhDFcyaYAFkoyyDkg664V+8lpx1vLSTfDUp0dRIJpZGv+2IJwFl0
 YGJHO4sx4OcOUsA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Device is a thermal sensor and it requires '#thermal-sensor-cells', so
reference the thermal-sensor.yaml to simplify it and bring the
common definition of '#thermal-sensor-cells' property.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/thermal/st,stm32-thermal.yaml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/st,stm32-thermal.yaml b/Documentation/devicetree/bindings/thermal/st,stm32-thermal.yaml
index ab043084f667..1c01a80a0cdd 100644
--- a/Documentation/devicetree/bindings/thermal/st,stm32-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/st,stm32-thermal.yaml
@@ -9,6 +9,8 @@ title: STMicroelectronics STM32 digital thermal sensor (DTS)
 maintainers:
   - Pascal Paillet <p.paillet@foss.st.com>
 
+$ref: thermal-sensor.yaml#
+
 properties:
   compatible:
     const: st,stm32-thermal
@@ -30,14 +32,13 @@ properties:
     const: 0
 
 required:
-  - "#thermal-sensor-cells"
   - compatible
   - reg
   - interrupts
   - clocks
   - clock-names
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.43.0

