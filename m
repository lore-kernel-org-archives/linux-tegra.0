Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEDEE2F1FC2;
	Wed, 27 Aug 2025 11:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756294677; cv=none; b=EaUFK0rdfQKCVEniHZDdon/Ibm49EZcIv77T50tLN7NpgCdRspzTrXq1rpMegTROAixJjeJ865rILVyecUOwUwb6eP6HhfFOJagz+fP8BO1p/DKd2b1RVXfAmXx5/O8Vk43fBgazfO9r5gTwMxvy3dHkjWWHqKcuxmmJZvCdooQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756294677; c=relaxed/simple;
	bh=z/+MjYHvAB0rRUgcT/Wf35Fc0x/0/2URbSZSEoOmQrg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PUi+2/0PX0fVULrjzACGxgetn5x42/B96WOJ+dbt1sE+dLW5czuou95mpvkg3Fbw50smglr/K/WAsGjo3uTSISM4WFKov+uJRVclf7faVkoGPTDKFtoVw/o9BN4at1F1taeJQH6bzpmL6KU6CAh2EGig+ZqDOKYlXBkcBrXlKsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XwgT4qs4; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XwgT4qs4"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-afcb73394b4so952873766b.0;
        Wed, 27 Aug 2025 04:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756294674; x=1756899474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r32eaeKFswPzaKVqV9ZpAu9JHYxhli10Tjd2IPM4Ep8=;
        b=XwgT4qs4PjKhgICLCbncJqumc3JrT0iAaNweDGzGhslIIbd3DIk7XTc8UiX+w/WdK0
         KzyQjFCXqL6uY7QP0Pp7kYxLmyCjMKXZfk+P9cKLwXKSyAB3bkaudfA1XOF86IIbzIyH
         uCs4Y08f+m9o7soKGD5WvVV53bzjK4uk10bfQ4rhh0RopRc2Yj0CuEdHOxtb9IsZ5QwY
         s9pNeR2Sqzj7y+Guld9T0CEs6N42w0kTsxYUNfc8jddfbN5hyDz31Ui9cG0HqAZp/L4N
         4qYAMuFj31ieZuPEAz1YgnjGX61GwJmzeS4Fa/vS+Piuc+R4BI7Cb68rqWSSXvaNfJo9
         obLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756294674; x=1756899474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r32eaeKFswPzaKVqV9ZpAu9JHYxhli10Tjd2IPM4Ep8=;
        b=dwsClVBaSE+3U27+HFKb/metYI+XOItE0cPczbeNh0hHHFrg3xD46TUZ95H+/01W6x
         TYg4Fu3yIyihSp2QlnpjHP303v7xMSm6pzbcRvCir98lziedfZIHVESftoMiap8UEAe3
         UGTsfMS8fWwhhRByrBLKZSKVBEnOVnRhzRYcQ7VVnVQcT8njUbiAIVfKXBBDydDAGx45
         V/rsXu773BV4wCWMoPdtyBGVsjI6x99dFTVmwVtDNwcS+hZx2oAmYhl/eCAf0ScW9WNa
         KRTwJBm+R7PFIkZ2XbSgYryzqWA6N3ASgrdQxlPJ2viwQ2gQO3lsFw/3FM1Kv8JPoVLL
         MGJw==
X-Forwarded-Encrypted: i=1; AJvYcCUUhGqfpL0qRxUOvA0wFxaB6zecEltIaC+clpPGlQYJfa9T2WbQy4H2cj7ZQlO2JDhZ6qBrldIo8/KRi+w=@vger.kernel.org, AJvYcCWmHeQPg4+Tt+QPpqYlYvtBITgKR3snivtf6iTZ4JPZgKExzAgpMpL/130OuhRXMtVT2QiL5WiZBe0NB9E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvhgV6mck7/puk6+Vd7n8gzT5VSmTS6SnOBUeB5e1dll5zSMEn
	rxi57cECGb0RssotCXrRD94pVBKjmnqdGIEo6VnTBJzFTfbEYc5YqZJg
X-Gm-Gg: ASbGncujyWJ1xEiWic2EvKbK6+m2aLeznaWRBwHuD7lBWHOF3JvkHAnKJsAbKhBu49p
	nv07e6LvaCgSxb5quHZfWjg0c53u2TAIQj0OwqIiYWUCVT+S2TnmEfzLnCoVpftg6mJYXeoQZ14
	qH7JB4Xi7vF1MMl59Lm+AhAqkSDPb+XeLC+oFI6uXgtZNJW4pTYI75OuMI21An7uGn+DgyOvJo8
	uPI928Zn+zFhPU5YxkRUj2TurAL+k0P13Vu71+9gIBbMrRSLrsPA0myBWxNct3CLPO3umc2yBH6
	O3BZLzBJXJJveS58IfLtL5u13y5AGKZ0SbnAtQXo3vKqgBjwzDOO1Ljae8/ngAIDQkolbXdGm93
	D8aoS6AqZGj1f/XCFcKdxZnPd
X-Google-Smtp-Source: AGHT+IGR8EZyaK0zvZKE2DEGEZzgLaMgJFG6m31NN9UyHVLso/mpVnq0cLgd5FJKlDrGZH4CYy+f2g==
X-Received: by 2002:a17:907:2d07:b0:af9:4075:4ea5 with SMTP id a640c23a62f3a-afe28f5ba80mr1929168666b.25.1756294673889;
        Wed, 27 Aug 2025 04:37:53 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe7aad5d61sm675607866b.105.2025.08.27.04.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 04:37:53 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <treding@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/4] ARM: tegra114: add missing HOST1X device nodes
Date: Wed, 27 Aug 2025 14:37:32 +0300
Message-ID: <20250827113734.52162-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250827113734.52162-1-clamor95@gmail.com>
References: <20250827113734.52162-1-clamor95@gmail.com>
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
 arch/arm/boot/dts/nvidia/tegra114.dtsi | 64 ++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra114.dtsi b/arch/arm/boot/dts/nvidia/tegra114.dtsi
index 4caf2073c556..8600a5c52be9 100644
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
@@ -149,6 +188,31 @@ dsib: dsi@54400000 {
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
+			reset-names = "mpe";
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
+
+			iommus = <&mc TEGRA_SWGROUP_TSEC>;
+
+			status = "disabled";
+		};
 	};
 
 	gic: interrupt-controller@50041000 {
-- 
2.48.1

