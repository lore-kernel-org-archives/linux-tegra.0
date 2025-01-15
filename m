Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0041D5162
	for <linux-tegra@vger.kernel.org>; Wed, 15 Jan 2025 20:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736973978; cv=none; b=Ijc+EaHF5jlPEfjnEudhQBCnxTpqP9OSoNj85jMFgfRhxFzejbB96H8CDlZlikkCun4/WXWa0R4l7Lk8QmRtGufO2XEoQrqT7Jc+6Zd/t1q3r5BakIAV40Xt6whhhFcVZHGXVNp5gmN2Vvt2gdwyA4jQ1dff8lWXFbSEfOglfI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736973978; c=relaxed/simple;
	bh=8xn+hAjrp+dpnTChfesyahewQiVXucAxQWGqp1tO4VQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jNClay3PCiP9HwPZdPY2O4WryJrHqgUNbGwvS0TZ2hb569ApK4SSb4VW94jK0zqQQ3nxrHVUBnTTvpyOTQsZCsGQqK1BHJpQc/8VhcvZsozMTeUh2EgyYFZ8FxeNkmaCKTxZ28v2QEBknO1Q7ZctTD6fbz2zmcaS7bKEI1UcYNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jQTw6kN1; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jQTw6kN1"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-434f398a171so151795e9.2
        for <linux-tegra@vger.kernel.org>; Wed, 15 Jan 2025 12:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736973975; x=1737578775; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xxyq2n/HkeozPkGjrtu5/5xrNjib0WAov1wya6JfQKY=;
        b=jQTw6kN1XdJVZwh9JYYPDVJaxNLMbqBwmGL52FH7ge4nn1H+8s7dzZ9AsCC7V8BWlf
         xbUxia+0Y3cwdKyn8lrsJxXtpfB7EPplYGG5Q0ZM7F4sD6eoNAql3OLxXLztsjgtGoc0
         BCjfqD3aL4+Ae7OF524GTHNOXwrNpqQspTg5/mADTSeSHfefLMNcAnm4u+uk/RqU+xc1
         NBn3RFxDOiU7YU+iHh3O+iUx5h5VuMEmaTyI/yMEEEWBwqQNC+hImGKw3R1uVPSmsL3f
         fd41Mcx27goz2NBJgGQFK7OE0TjbT4LJpKYRdwYNKwFV9n/P8rJng6rdXHO+n7UJBEfk
         5y1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736973975; x=1737578775;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xxyq2n/HkeozPkGjrtu5/5xrNjib0WAov1wya6JfQKY=;
        b=Acaf80077UV6OKelBVzb8v9nZGfnUhGpYBkHpeqFtb1VeEemTv6dJA7crxKcAP27Ep
         QyN6APCWw3+H9na94CZJbkHtKo3xQ+9pZN1Lr8llABkST8FExwdzP9UzkUIa2DoueNB+
         q/GZzNfE/oJjj2n4800TIM1wpl6VQ7H35LZP+6r/Z3j5uLTHDeekUtVPX/ChOhtNXpYn
         WKdqlW37r0na4HR42k5/kQiEH96DBWaEXCmk7qTQVQwKv5MJTGLhPz+RLY0i+2VnhdXZ
         g6iuWY6qS2fGSY7JvpM4CRcbtX2Mwtb2BXFQAGtoV9sSKFxihcy5h8nXxLvu6iqjF2a3
         coMg==
X-Forwarded-Encrypted: i=1; AJvYcCVGqt66haF5ikQ/uxnVqEU9AleW0yVzWDm1c0W0jKnMX6L1sCW2zCv2r7/6blMdIYIrioVam6RjvBlleA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0SuFkoXEPpJ+hCBTprGczcAb0lLuwrn7HNyr7dDxj19Lux4te
	Sv6/1ur2MXE/uUBFJTsTfV5eyuKfuliIC/wrbhXEl8Ev6nQmjVhj67CA2RnC/H8=
X-Gm-Gg: ASbGncuMEgFQ5VOKcf9Pwo84G4bENy9N2jguNq3THuDR32BXALMcRkxbjUili8wZ3w8
	NIEsyiE/TlgUWWw+1AoohVoCjKBkLF4OvVmMWyHshFfRkZoqWiIeekh2pFQi44FePK5mdtwEVmK
	yNdbb9ARvt1TD/dTHUIeYCi0d3ulbR3fFmnCB+8g9BvGVjNB/tx/FZLBVcsxJsOy7z2YbxU+Y7w
	zeVtaiOa50Po9YJDmLmVrvgh+T34O4T9k04ZwUxF5apFQrwYJi8Ns/KQ06z9kUWXmOFGgE=
X-Google-Smtp-Source: AGHT+IE5Aq4FPLp3TznZADbgWmvqih94kTJxXwSTNAZBQDiPeLOPUk2glxfr3D/LiiLe6fJ/oR6c7w==
X-Received: by 2002:a05:600c:4fd6:b0:434:f5f8:22cd with SMTP id 5b1f17b1804b1-436e25603fdmr100008315e9.0.1736973975537;
        Wed, 15 Jan 2025 12:46:15 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c74bfa35sm34879505e9.18.2025.01.15.12.46.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 12:46:15 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] arm64: tegra: tegra210-p2894: Align GPIO hog node name with preferred style
Date: Wed, 15 Jan 2025 21:46:03 +0100
Message-ID: <20250115204603.136997-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GPIO hogs device node names can use 'hog' prefix or suffix, but the
suffix is preferred.  The pattern in DT schema might narrow in the
future, so adjust the DTS now.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Reference: https://lore.kernel.org/all/20250115142457.GA3859772-robh@kernel.org/
---
 arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi
index bbd6ff0564da..b84a8e39b404 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi
@@ -1365,7 +1365,7 @@ fps2 {
 				};
 			};
 
-			hog-0 {
+			max77620-hog {
 				gpio-hog;
 				output-high;
 				gpios = <2 GPIO_ACTIVE_HIGH>,
-- 
2.43.0

