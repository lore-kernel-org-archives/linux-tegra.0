Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF3C22F74A
	for <linux-tegra@vger.kernel.org>; Tue,  3 Jun 2025 11:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748951852; cv=none; b=gaGZ3n5iqmGB7eO5itq1N3Pdz+gc1tDstLDQOo031y3aRDATjuCIhjncKK6xWaTbDY7XFEryK1kJhNjgCRivQxvDoJuVla7AYu7HT9My6W8G+TnYX9FQGq4QQGLU1KMnfJt3eK/CEAWN/iiVurw3T9BDWBLh8MPDSY30nAsLG1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748951852; c=relaxed/simple;
	bh=PmQVq4hQS35gwAsgZYe0MBq9ErqtT+mom2oZuUDxvi4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CndNA64RlK9tp86gb3Adin/T7iVe4grgS/EQsOICj9cch7J+oGI6DxT960RBCYaRtdmdGzPqBZ8eG1rcSUGvhpRB8uSTSPbn/lvbU29Y5O+1SCC/1W57AThw2n5pDFe/g7g/2icKyrPS824KNgivlB/HlHsPduOhiY3BWVKdKW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EZCTQArh; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EZCTQArh"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-450ca8e6d05so1739085e9.3
        for <linux-tegra@vger.kernel.org>; Tue, 03 Jun 2025 04:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748951849; x=1749556649; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P9iOMNCqnm556i6iWSK9mE2UkHu3B2asZSKy8c1kTbA=;
        b=EZCTQArhG5wguIM/WrtePDThGROYXf9FMu49xPYbaXjlYXe9iZx/msOicacrLSc9MQ
         oSrlW+R2HhF2B+hPebtMqzEudtA1kzpF6QqIb2Acw9PIu18/2cYcD7FKTzgV5f0kT69t
         vGWU2sPUzgW/vvv/UIRyCYV7b64+rVnqdX3ZIZqi57NuDhwlwVe6xhoLK4LKSLFhkNgX
         zlIO6gnsDw2XJWX4Vw9gdHOlsC4znhpm02m6ab4hGqbT3zYbXCkUGh1hXEoceg2JlZaj
         ZpHlBZh4eoQwNZmCUbcDyE9WQU/yezKyJ7s6dkV7iXKF+bfdDLTp1wkLTykoBf6KVwkz
         wOGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748951849; x=1749556649;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P9iOMNCqnm556i6iWSK9mE2UkHu3B2asZSKy8c1kTbA=;
        b=HbhZKONQEa1od/WdET82rn7BJOC4y6pAOV3tQcRM5NfbRBg7CRU7hBKmB1I0UQQP8G
         7wpPqH8qZzRX40SDRssBDA34Jvahj1afQogGO83zko7tyOgSq2Rf+Ix8kOcYSCvq7Z+/
         iWbQpY/EQVQ0gLsyx9UyNeSlP7Z2jPBTqA63jIEpHSf3ADH9IUIzh76pkYO5lk8mMbMf
         hii+yQaxm/DDOrT/hdyabEVswj7Hc8wjm2herz+bB9D1oSk/urFpmlr+52tHCnAsgaHy
         cLn2sS8D6MgISw/389iQT1wBBl1ks1RiaRPjpciRA+gmOKSds+O11O7bAtBAYTqUz5WE
         6TsA==
X-Forwarded-Encrypted: i=1; AJvYcCUx+N+6gXkZcnVNsw9YbjeDfCifh2OrfZgJuRVBTMAVM0I952kO7qVngdgxzKC6ZQ16fl+pe71WFXXDnA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5h9SgRhw+OnQusc/kQaNnJJQhYKw5y3rx0r2wamTFH+QxRi7Y
	MQ1tO4ar4VrUfATNBLxozAGBAb3LvAMGJ5fCgbLcUrmFETIyZuRv5sMqojtp3soUqOs=
X-Gm-Gg: ASbGncuU1NLKBEosTlSHnCi8S282EX7qh8JDhhJrjy8c8kRGjyXtZ9bgTzcDBf7bR9a
	O1Rr7gQ5UB3pcf91Smb+X+sF96tfIQf+2exBLyNZ37w9f92vrnG7DfdVrwb+LLIm2rvf2+d2xZE
	rddagxdAuybQszFpJiZLQv8ief2gMlsucH0CEnAJM5VeMSnOiyuEo1uyV04mQA/7I9iI5YiNELh
	d1V6fFj5/TbD/uATuoNVeKmAZRc7VlxrcW7YvBxfxl1rHZOlqdqb+kYdASYHRl7vtXhBXSifTPp
	pId/RZQJd0ok1vUlJcx7FU320gGuNlYo3oQ11o6Q/xZ9/dB6tfFI8fj55ODxMp+CBHWKg6jekCW
	3qgNVDbSPLifNm7tr7UkxBQ==
X-Google-Smtp-Source: AGHT+IG6CmWM3RslzVJ9Zs6x2OnxvGd9okADIrUTxvkVwVY0rJS07w9DnVo5m/6fQdGbvnL2BjUAIg==
X-Received: by 2002:a05:6000:2886:b0:3a3:7049:f947 with SMTP id ffacd0b85a97d-3a4f897bc88mr4781768f8f.10.1748951849223;
        Tue, 03 Jun 2025 04:57:29 -0700 (PDT)
Received: from [172.16.23.13] (adsl-84-227-104-5.adslplus.ch. [84.227.104.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe6c7adsm17671666f8f.26.2025.06.03.04.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 04:57:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 03 Jun 2025 13:57:09 +0200
Subject: [PATCH 2/5] dt-bindings: mailbox: ti,secure-proxy: Add missing reg
 maxItems
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250603-dt-bindings-mailbox-cleanup-v1-2-724407563997@linaro.org>
References: <20250603-dt-bindings-mailbox-cleanup-v1-0-724407563997@linaro.org>
In-Reply-To: <20250603-dt-bindings-mailbox-cleanup-v1-0-724407563997@linaro.org>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Nishanth Menon <nm@ti.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Sven Peter <sven@svenpeter.dev>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Suman Anna <s-anna@ti.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, asahi@lists.linux.dev, 
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=902;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=PmQVq4hQS35gwAsgZYe0MBq9ErqtT+mom2oZuUDxvi4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoPuMb6qbPyHvmIRIrN/4NfNvZ2r6JN2VnhQ/rt
 P/6fx1bFIiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaD7jGwAKCRDBN2bmhouD
 11okD/9H8uQVKm6Fba6vs1oJEhpW2E6WDVf76MJKju/FQ59Kihwd3IlRjqvGcI3JVd0sghwfs5E
 dVHRZW7lejfKzozTRGlzYKm8jWya/bma153cjRkvzpDQ4dCBvIRrkIYg1uIO2KFYZbF+V1iRT3b
 g7UmqkWQqU2Xb3Vf2CVYNjeCKU7YQMZfAM2zsm2XqrHunsByEHhmiuPvSN4lljzOe//vWePZRWG
 oO8322aArQSfeBI4C52Yg3eKV9fHdvXpB6DijXi8YYx1Wb7SNfaj4LhVu8ODa/+DU8SGRNlxNP1
 Z9PDMuPCdkOOHza9p/Gzg96ZEX6jiKXZKNLNsZ+MjGfjP+789AdQqGGgMgnuGAk8XzT9GFl8lwQ
 fiu3PECrJ9h2dK0zIrh7fps9SVMjmuxVr4ap/yatDj2cnoKj1Ecc3/++X50tuN4BcbhEcrwOBNX
 KhkMPb8L/I7QgZ5Au5q7TpxMhDVfJXNqe+Iy+pY/JEE4GthRQjtzicDApK+RT8f+pceNlH4Ic/c
 Z1yMhvvNcKbEQkmwRPFyFCJHuv4iX9VNx0nZOxzJnR5Lc+ILPanys9dW3fr6NbwJo5ZlEyyJujQ
 JAyTMfMPK7r9ETJN711C9Myj4NJ76EYYBkR/8yBzgRKUIZmx+mA4WHhJApZvSUkhlTtOCzwMCuu
 LpLpbn5wLmTgrQA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Lists should have fixed constraint, so add missing maxItems to the "reg"
property.  Since minItems=maxItems, the minItems is implied by dtschema
so can be dropped.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/mailbox/ti,secure-proxy.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mailbox/ti,secure-proxy.yaml b/Documentation/devicetree/bindings/mailbox/ti,secure-proxy.yaml
index eea822861804c259068aa8c4598188db28895518..682ccd76f5c25fc13bb3375007d39e6208cdddc0 100644
--- a/Documentation/devicetree/bindings/mailbox/ti,secure-proxy.yaml
+++ b/Documentation/devicetree/bindings/mailbox/ti,secure-proxy.yaml
@@ -36,7 +36,7 @@ properties:
       - const: scfg
 
   reg:
-    minItems: 3
+    maxItems: 3
 
   interrupt-names:
     minItems: 1

-- 
2.45.2

