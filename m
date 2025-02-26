Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E78254AE7;
	Wed, 26 Feb 2025 10:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740567398; cv=none; b=rtsr4/q/7FaKnWQcfEA8PsMiu18HFmvqiRnAwQ+38ffeansLt+gV0jfwvmMVb+2AoNmBk5LWpmKEgXxIflpAWe1LLW11B8SAhihuWTk2o81ebBB5arFdk03FNWV3E6OhpkMPcYWmZui/HmPvsgmS5OaPreoHKQf6SXPtYxt08sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740567398; c=relaxed/simple;
	bh=F08gmWgch5ns+wtG61BixImeWA3tmHC178Y2dQWDJqw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W4ExVTKhNSo6rO1aHkSIcPYoMSDhA9sOdH6TQ3bJy7/+NcTFdOKOv7OQEpsDTfzaAKRZ0/BlIh4oyG+FvicCLbx0s4ZxEAszk5OCw2moLexHEKDOcwBL8GPr5jI+kM576LM7YhtCojU65CXXotyjPSAoetkmdAhYWiiDtCVeVgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f4Fp8mdp; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f4Fp8mdp"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-aaf0f1adef8so480770266b.3;
        Wed, 26 Feb 2025 02:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740567395; x=1741172195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0AzoAQP/2iVXQV606YM5uavPq+tJjK11PPYGUuhIitU=;
        b=f4Fp8mdpGlX0UnBZpWVvONkgWa2BiwdpahB2RuixIYqPVBdAoqfNtQocCwfevZe9n1
         tdMHRORHG90tcafqSmS03ycAbeEByPNowCRV01pvEfIWJq5eg+WGABcpDTRPaNyuBAUO
         PHX/Lom/JeVtDjVwDqWDINlgRcKU5UJl89uoRYRsFqaXvJMalENX8O1z6jLT4RctJx78
         rNZorYMSSA6h9jiQoMR/DINLJ4aRWjhdISfLkIi6L2RJXL6SllSIfGQzSU3pN3IFDej/
         T5n3HBC6+n4G2YEU3UaJCIW4IL37wS+ydcVEgArono0+6QgIP6eUah3JlIn1i6lyu515
         92EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740567395; x=1741172195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0AzoAQP/2iVXQV606YM5uavPq+tJjK11PPYGUuhIitU=;
        b=V1xi61bp147JWPhMk/658W+laBzum+r8ycDsAotnqSTD6Kwc7iGR98P9qrN6ZhUlcQ
         lgkT6hUisNJtRw93lOxUsx6lcJY5Oy4YinLa+UlAnjbzH/PdGmIeV1s+7gG71bkQZmxX
         hxwPuxxdn/Q+yJttHfyrULXo6f3QA+K06F/bPxMH4390A88wZLh6Kz3zxC/CFI20PTcI
         9aomMAC0asHMhBqG2lPxlyz7A+ssDZXPLmVI0wit7wAlmqXycxnNgPJTm+Zxh5FG87cS
         eHVsf9jNRUjbavFHa0CvvihvM1fDyyx9pjkuF/AguKS8bymAIjZ6S8I78QUzpdeO9a8D
         bzXg==
X-Forwarded-Encrypted: i=1; AJvYcCULiIDCiCm37/cfQZtoheNwalMLtHBErdWmd8xu/BvW+lmAIVC/0KQlSa8HkvAi9KaVtcWnEuuMfdUE/kI=@vger.kernel.org, AJvYcCXhKOzJNuzy7rSX4iRMiEhnPM5k74JLB/UH6Xa5NfTRqK7R3iOAqNdkOY6CeqbDDh2uAgVsLMj5rbM2z6A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9U1heS/iEC50yUdZf02xwHDNxPRR+UHZ4XPzZ5F73ERY8kY5C
	zsDUiydzI7vQI+DU3+8HCFqkDA7jO0n9kejENgvzb2Ik1wmvEvLy
X-Gm-Gg: ASbGncsn2qlDQYLjpjcSrOSGOo095rq2mJ/rDqt0j/GgxaZG/JVatv1W2yP2AondcDQ
	QPrvPi1JtFld4gVwLWjxFaRdWDlxkVe7fF45OUz0BnJdDv0N4vKL+QgYJSBXxUAf29b/pifuBnW
	odntSx3WcFrjMbeksSTiZ3GXsKemVlpDRqhMR2YGYiRLq+/hkP7C+4UrPlCgoOzs9JqUb5O9+sm
	p/JCJETEfD2LTcwTmH7AMfnou6DdSByfx7WEb9fwgDqy9CUxKBFDCtv42/YaiEBoGkngH3tjKJN
	nFdEYLm6Ol0iJWSiyg==
X-Google-Smtp-Source: AGHT+IFaymjqk9TJKMtrobmMsBZhYP8y0W4w8aehDmCZ0Be5hlzHY8TwXsPeKDB9YMr8oN2mjqlX5w==
X-Received: by 2002:a17:907:2cc2:b0:abc:cbf:ff1f with SMTP id a640c23a62f3a-abeeef42910mr336312066b.40.1740567394486;
        Wed, 26 Feb 2025 02:56:34 -0800 (PST)
Received: from xeon.. ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed205e53fsm299771266b.159.2025.02.26.02.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 02:56:34 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/6] ARM: tegra114: complete HOST1X devices binding
Date: Wed, 26 Feb 2025 12:56:10 +0200
Message-ID: <20250226105615.61087-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250226105615.61087-1-clamor95@gmail.com>
References: <20250226105615.61087-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add nodes for devices on the HOST1X bus: VI, EPP, ISP, MSENC and TSEC.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra114.dtsi | 65 ++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra114.dtsi b/arch/arm/boot/dts/nvidia/tegra114.dtsi
index 86f14e2fd29f..4365daee2f3a 100644
--- a/arch/arm/boot/dts/nvidia/tegra114.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra114.dtsi
@@ -47,6 +47,45 @@ host1x@50000000 {
 
 		ranges = <0x54000000 0x54000000 0x01000000>;
 
+		vi@54080000 {
+			compatible = "nvidia,tegra114-vi";
+			reg = <0x54080000 0x00040000>;
+			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&tegra_car TEGRA114_CLK_VI>;
+			resets = <&tegra_car 20>;
+			reset-names = "vi";
+
+			iommus = <&mc TEGRA_SWGROUP_VI>;
+
+			status = "disabled";
+		};
+
+		epp@540c0000 {
+			compatible = "nvidia,tegra114-epp";
+			reg = <0x540c0000 0x00040000>;
+			interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&tegra_car TEGRA114_CLK_EPP>;
+			resets = <&tegra_car TEGRA114_CLK_EPP>;
+			reset-names = "epp";
+
+			iommus = <&mc TEGRA_SWGROUP_EPP>;
+
+			status = "disabled";
+		};
+
+		isp@54100000 {
+			compatible = "nvidia,tegra114-isp";
+			reg = <0x54100000 0x00040000>;
+			interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&tegra_car TEGRA114_CLK_ISP>;
+			resets = <&tegra_car TEGRA114_CLK_ISP>;
+			reset-names = "isp";
+
+			iommus = <&mc TEGRA_SWGROUP_ISP>;
+
+			status = "disabled";
+		};
+
 		gr2d@54140000 {
 			compatible = "nvidia,tegra114-gr2d";
 			reg = <0x54140000 0x00040000>;
@@ -149,6 +188,32 @@ dsib: dsi@54400000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 		};
+
+		msenc@544c0000 {
+			compatible = "nvidia,tegra114-msenc";
+			reg = <0x544c0000 0x00040000>;
+			interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&tegra_car TEGRA114_CLK_MSENC>;
+			resets = <&tegra_car TEGRA114_CLK_MSENC>;
+			reset-names = "msenc";
+
+			iommus = <&mc TEGRA_SWGROUP_MSENC>;
+
+			status = "disabled";
+		};
+
+		tsec@54500000 {
+			compatible = "nvidia,tegra114-tsec";
+			reg = <0x54500000 0x00040000>;
+			interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&tegra_car TEGRA114_CLK_TSEC>;
+			resets = <&tegra_car TEGRA114_CLK_TSEC>;
+			reset-names = "tsec";
+
+			iommus = <&mc TEGRA_SWGROUP_TSEC>;
+
+			status = "disabled";
+		};
 	};
 
 	gic: interrupt-controller@50041000 {
-- 
2.43.0

