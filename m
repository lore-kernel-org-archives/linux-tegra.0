Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD913093AD
	for <linux-tegra@vger.kernel.org>; Fri, 22 Aug 2025 13:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755869642; cv=none; b=EnYALDKyq9phABUV5VROP4GnAq8S5n0fn61UeLYuHCYRd62p0LxcNEUaKJkbZoKezLZ5FYdyPxm4AAziJS2YDFyp1Ek6Jh3AxE9Pu38KOmZmmoZvmv9FuowAe0F999eThhZ/Gjm4wbl2S1C+j6H8oSvIwdoaENatrIeYbWxs6mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755869642; c=relaxed/simple;
	bh=gtHwwV3RKSc0NdIoaehkWO49HXFd1zQTXe+JxXko4Kc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R9Qi/C6VLlZY6ecfqSnsEKdfJpKaWW+28uN4UlzMtAlhi4ABad4Xbxb9qhZ52pEcJMsfiMzT7Q7HE4QXh8cH+JqfpU4UB54CoJSnXtBI8bgmcP3d7o6PRgEJVOI2zc7MyKtmm3bCmNaZJnOMxDD/BAHNTRIwnXKW11728SNgoE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gTXH9Azp; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gTXH9Azp"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-afcb79fb221so27976866b.2
        for <linux-tegra@vger.kernel.org>; Fri, 22 Aug 2025 06:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755869639; x=1756474439; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7InwlD2Vsu/SAdPgoVwsVcZID6Hbo3ljVtynaU9CsMQ=;
        b=gTXH9Azp0kt6dQJHPWlCTMR0HVkn8hvHjYWLsscnEpCMgJFx1iMzP94/01s0AJe3vW
         rr6vAFrDgGAzib6Jyy8hiSLiEj/U2xKF+fTluryXGE1HnI5ERgWmp2HmLs/46hMxX4di
         VfpP3imU8n40W7ASj66qLxuy2pLMnuATKWAx3jCRahGJhTvwnUxqxpOJocaymfqycNbn
         QYalkoaa52kg3GXvbjOlIzin0CKw/TUS1h4FNiIpYFZJWBypNjE9H44fGJeDPLDzt2x1
         gKS7lH8fPRl2DDjlPsuOt4tDcE0ADAbEigm+TpdJg3uoKZMVH3LE2Ie0JOzY5Up9rXDQ
         EXNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755869639; x=1756474439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7InwlD2Vsu/SAdPgoVwsVcZID6Hbo3ljVtynaU9CsMQ=;
        b=tbFGvJ4U3A67fAUachme52mhkfm27PE8/LvSm77hZab289wRHtU+QQaPdrzQ66/3+E
         UV3tun7KNG6+p3eov1Q/wbciWY7vNPBH9M6EhsvhEYk1l/eLFCnXpwfUm6Yq54M6pQjN
         ZLzuRVgsFQ2/OFECgNac9nAdpnfDrSRW5Ei3ewLH+SuzwRQJ7Dc8i9fR6+COx3DW0+Sp
         7+l8xLndNb0GG0LF6nrG8XNUSJ0zAU4ZFDk1/psectUMHz1GFadNbB0GaDwHowG7xJPE
         dZKWRQkOJ1uQs1mePiJp3IfiA2UAeCz/Q0ldfJmN7pO3mMiOUOaiH1Qg+OEo0Kg5aqEE
         /sfg==
X-Forwarded-Encrypted: i=1; AJvYcCUnuLqHWRK0wutNEt1wmzdeKdC+EU0me5j143ScYFFaDln/MHrGy9clA3bLTugufOoWwv+KhJoXi3L6PA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2m/4ESdBBx5TG7dyNn8NlEgkDntymyMk9Dpi6hOhgqiSEX2+u
	ygZmjwdPbGefVVYM8g0mMkoFc3dBXX+SXMtgkhAj8ajhbuty5g+IVqhGJPdRafqaA64=
X-Gm-Gg: ASbGncvykk81qY7Updb2pZJQg+OrWd2XyMBS7jPLRE1WQBjvvsIlqLb/XMNhmgj9G+7
	5Z7vE25RouAPRIiju4A/UcdyP2LYLLa5llwg/nnHTc6wVWJ/mv+9wFjXP+PS5SNDR460Qt4cSXR
	ChB9tQ6Ebtdjzfho8doOrQ2e+Py9wZi6D7y1Y6F6cPJPg2ILyK7BlRzf0EHSuI0fcmXY5vaAMVk
	03FtoJag5sYAUAFujQI9/030vosLUwQp5h4CJhf/REQSiC2/Gx8vfRr2dYPC47oQVHhnqzha0FY
	Yw7eeMUPpCdwXqbZ5p2wUZ8Cz6z1vZMAb20YQaHkqmRT0XFAwhdgZp5S6TIAYBGj1ENGq8f30WQ
	Vv+s2h5Syhd4fZYRToYi1MrPcin8FxFQfzA==
X-Google-Smtp-Source: AGHT+IFnfyj7hyi0/c09cbjBoTYvL6saQhuWyCyJd0OxPggzM8rvrTPHBbrWyfLXtAnNNs+IcOqPpQ==
X-Received: by 2002:a17:907:3fa5:b0:ade:902e:7b4b with SMTP id a640c23a62f3a-afe29446218mr156790866b.7.1755869638582;
        Fri, 22 Aug 2025 06:33:58 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afded537f98sm606493066b.104.2025.08.22.06.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 06:33:58 -0700 (PDT)
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
Subject: [PATCH 2/4] arm64: tegra: Add default GIC address cells on Tegra186
Date: Fri, 22 Aug 2025 15:33:53 +0200
Message-ID: <20250822133351.312424-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250822133351.312424-5-krzysztof.kozlowski@linaro.org>
References: <20250822133351.312424-5-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1230; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=gtHwwV3RKSc0NdIoaehkWO49HXFd1zQTXe+JxXko4Kc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoqHHAvQa+zloR+7x5BoZNSjCzszRxYAuAtuQZC
 RR1wxd4X9iJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKhxwAAKCRDBN2bmhouD
 1xCcD/98E6YrGSofW4XO+nzWaMgShPd+Zag2gRZVtq7olJtSfvHwILrXf6GenyxOzXBqKH/4ece
 wlHSULleesg4wtuJi8B2PeM21wVzDCDq+8857UXiugy7o3wtmxBHnIpalU9vwk4DXF58t8Wa6RB
 dsDZY0ZQhhef+AlrtqsqjSqovnzVz0a9L4q/olTgsjGZH7iVxPRDrrTv38ORkcxy+uMvL1rwzFD
 IzWc3828FLdu4KRL+uRBS7QBjR6gmeCfBZ18qBCi473ZhP8pFqFgiG+rkej7BEk6ACdf25cvecw
 u6oP8d7469TyZf3Ny7jvGSvAOW3BlhA48YfYjRqnDSOmJU7r4ct01yiUCsyGC7trYmiwuqgkeVr
 QzQfTs4Y4x1YsmlKR6kDvCxHEuIepfIApaWFtWK65y+O7CGFFs03aR2vSiq44EltXXmVxV/JZMH
 bMc80xfH2O7Hnc9uzE0/JGBAR6g5OcMyUe8ddYwRkltGoTgX6hWCwFzkWbk6vf6KzaeRfQPR4Pi
 USSXs+N2stx4OwgGSlyjzCONgoY793e+QUbmeRuksaVWzECOVyDA3e/n5XmbFh0GJ8h/9ZS9qT3
 vgJasVhf405Z9eixCZG+YrBcaRuYAQe7jBd2O+uAl0NX1pb91PGsFufAo/VNTm6RUa2qLykTQGd B/qW2yFHbRrlxWA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Add missing address-cells 0 to GIC interrupt node to silence W=1
warning:

  tegra186.dtsi:1355.3-41: Warning (interrupt_map): /pcie@10003000:interrupt-map:
    Missing property '#address-cells' in node /interrupt-controller@3881000, using 0 as fallback

Value '0' is correct because:
1. GIC interrupt controller does not have children,
2. interrupt-map property (in PCI node) consists of five components and
   the fourth component "parent unit address", which size is defined by
   '#address-cells' of the node pointed to by the interrupt-parent
   component, is not used (=0)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index 5778c93af3e6..7601f5818f6d 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -1173,6 +1173,7 @@ fuse@3820000 {
 
 	gic: interrupt-controller@3881000 {
 		compatible = "arm,gic-400";
+		#address-cells = <0>;
 		#interrupt-cells = <3>;
 		interrupt-controller;
 		reg = <0x0 0x03881000 0x0 0x1000>,
-- 
2.48.1

