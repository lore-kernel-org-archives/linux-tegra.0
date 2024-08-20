Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801A718B496
	for <linux-tegra@vger.kernel.org>; Tue, 20 Aug 2024 08:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724143480; cv=none; b=MpYNFu0c3flphwF43qnCGpwMqtHjhIUzBCXJNrjrcd9gnm1eQI4ejoeTIAsdqZIneBZgXKwu59R9mLHME/u8FhHqZxyqhqmW1oMXSkGLfMVyv4ViFeAIyGXPi6qM/dwAJ86J6PcCXrzRe4jFaoMGp82bPh5zTgiYzkWYdIMP4uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724143480; c=relaxed/simple;
	bh=ACoKcvirNpvaaPTfka/NODi/Qq4lO1FWeGoQWC9ZgEQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BJIs9VbQYoRE1pFshAB5em/yYZcEdDRQ4z3iu5NEkq229NAL0xa2A154VeGVoqxr4hc/p1IKv0JS5DYetr7399WvbiiRAdwAWwyma0ElxNhLm8YgkpSEutoATKk4DbCWF2cgaS4wuXBqnFIYcpIlfjsjjglE1jlLt1Weu28Rmuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ATdK3lcj; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ATdK3lcj"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ef2d96164aso60553831fa.3
        for <linux-tegra@vger.kernel.org>; Tue, 20 Aug 2024 01:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724143476; x=1724748276; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fuaP5uVIlhNOjKdFnLiti0TFBZrTydW9KqiKj5mZro8=;
        b=ATdK3lcjx0dme97cWbtmFpfJH7oGapUumZ9sZfbezVfvuDIzoxKq8QRUIcvN041cji
         EFe2a1ljSBUgSfTE2jqQcibb1VUpXRTwSwNxK5IM8yLzzJYAi170gNbkh54pjliJdDMY
         2VV57j6S8f7et5FeCWtG5VGb82ogEq7dt0E3byOer6RiEHY8dorfcqD/8/C5IaL9Wqxj
         +v3+8ggkl6um/cDe3vCIH2zDRwLsKGIHasEweHzvSkGpttFEURCfx11XUPP/TWN+lHX9
         H5sgyvbVOV0pZ0nIaGGGO/DtM2PmcOWvNkW2CsZJnNckDXb6PRKiM2UkbowhEX/gq7Xn
         LYcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724143476; x=1724748276;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fuaP5uVIlhNOjKdFnLiti0TFBZrTydW9KqiKj5mZro8=;
        b=f3wj2LDzIAiUqxVkubD9gDH7s8bf+kXiPQWfur1V1DF8YCHKQG9Kx44BNvNYkMmam7
         fN41mbZ4do/FRx5QFdsiJqVqYJfqCACqo5dOmiE4v0YTm4V1g4CASrmmcYzTpTUQQQAr
         TII6bTSpgyucHe4ioNdhnmDzQgtlpxKu7nysPVXHv57NRdLsiHw6zkQ1C+jcwCf4zN2H
         AukEid6Fs3fzP2inbyHLT2hZrrj7ZlaF0AgMrIfjpvF7jMuSVgZivFIRbXP0B2PxoTPJ
         YZLdYXkC2tybJfYUNmzKpPYq/C6oT7mjDnPtZO7bevvIrGA8fDsYYj50hZXL+nKZMf+C
         D8og==
X-Forwarded-Encrypted: i=1; AJvYcCXKFWDfx7gzY9IHFwsiVmCWaoJxVzEpnd4X+pzzMDQDEppt58IrxEWRu2Y5kmlBaEH7yZrJSJD4o1McWALdx5Qe7oRyIhRXzWtyQc4=
X-Gm-Message-State: AOJu0YzZxcnPjh6Ef2NWpHK88/xME8tC9DPkDr142fknxl5v1l/RbPWe
	GEGZ4rWSmW04xHBmp0w0nOwE9/FOTfN87Ly8UWrXNTGa6UmrLQrO0OW8Te+pn3iv8PinuqLykt0
	s
X-Google-Smtp-Source: AGHT+IFljyfUprSxlzzNt0uKa9soJdmxltAzvfxFDydZduKSuBcQBiRjMjMwlN48DyfiOMVOy253KA==
X-Received: by 2002:a05:6512:304c:b0:530:aeea:27e1 with SMTP id 2adb3069b0e04-5331c6ec909mr8282061e87.50.1724143475819;
        Tue, 20 Aug 2024 01:44:35 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8383946973sm728037766b.160.2024.08.20.01.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 01:44:35 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 20 Aug 2024 10:44:25 +0200
Subject: [PATCH 2/3] dt-bindings: i2c: nvidia,tegra20-i2c: restrict also
 clocks in if:then:
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240820-dt-bindings-i2c-nvidia-v1-2-2763e9a9a1b0@linaro.org>
References: <20240820-dt-bindings-i2c-nvidia-v1-0-2763e9a9a1b0@linaro.org>
In-Reply-To: <20240820-dt-bindings-i2c-nvidia-v1-0-2763e9a9a1b0@linaro.org>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1347;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=ACoKcvirNpvaaPTfka/NODi/Qq4lO1FWeGoQWC9ZgEQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmxFdtv5yn7C0bYAm4bo0cIML6vITcffTHEhj5j
 oS2PGAp0nCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZsRXbQAKCRDBN2bmhouD
 1/BBD/4pLbwK94nWazOSWABSjKtItrzSv7WqizBW47D598qfe1CPjekuL/OScpQmQWV6w6H/k1L
 rJBQoDzKfsiegx+F/KZwsNTBLiyO7QeHnJm9YZNU0mbx0cYlEcI9TMctE5JkwPDwSlfvtMxtT0z
 cD7EH0oPovZYeqd3XdJzY9KFvZ2rqH4WD34V/Cc5o0JSlO6Ke29kN6mFrawaiJUTWD6m59tWlJY
 yeC+SGpZ8L9PqBbUY7OVFOSPFvA2VNsEndB6p1ipk5GVnIwCu6d1za02FbOUCzU4zI9TppQht/5
 TSKuwvsp9L3XKZ0miP5eF8RB1ATdlmtxbu+HxmqO93EkaxZq6YoUQzPchrlb57TciwLqgSGLftN
 oixY/QFs/dfPvYGkgqWgWfTpjDpQt3PmpotsvBI83i5wPFrYY8Ekh535Y+qshFv0wdXUWRbQ62u
 43b2dbdqXn9jib1gfy3+GLZ/seo36pdDOBwF96f+z3qFVmKhKmcduLK9RS2118cWliMIxCMtjNg
 8YvAxHcThVMfM8PUEdKdtzKN0dFToD7exDF6MPq/9AAR1CapzOtu6KgGsDnDN+3sN8gIwvi1lR+
 txsqKjp4Ns4CWJj7skXOz2Bik4R8T2EhjLnWezSHOPOipG/2IKxXDRz3qFadrdgYvrXbhO1g+iB
 iTQVVU5/ZxTH4ag==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Both xxx and xxx-names properties with variable number of items should
be constrained in each "if:then:".  Add missing constraints for clocks,
since we have such for clock-names.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml b/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
index 5c92ef51287d..eeaa07fe3875 100644
--- a/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
@@ -124,6 +124,8 @@ allOf:
               - nvidia,tegra30-i2c
     then:
       properties:
+        clocks:
+          minItems: 2
         clock-names:
           items:
             - const: div-clk
@@ -138,6 +140,8 @@ allOf:
               - nvidia,tegra210-i2c
     then:
       properties:
+        clocks:
+          maxItems: 1
         clock-names:
           items:
             - const: div-clk
@@ -149,6 +153,8 @@ allOf:
             const: nvidia,tegra210-i2c-vi
     then:
       properties:
+        clocks:
+          minItems: 2
         clock-names:
           items:
             - const: div-clk

-- 
2.43.0

