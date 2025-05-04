Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC60C19E7D1;
	Sun,  4 May 2025 09:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746350632; cv=none; b=hOxLRvm8YF7wWTo4AFAXFH2oCdlGbFZjCwN8DnzJUTaCPhyQSgnXrNzSMF4HmP39odKKYV8ff9UYPbrh/udMfGHpwlJGoexbiUK5XV8DJyPYNAb2+YWNU9O1xhgjbCVrOOEcvI55vF//W0rZWzFZFBhW9G8j7yPqgB6l3qmnqTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746350632; c=relaxed/simple;
	bh=BO6DxgXTRnZVb2SSLavVfZPIIK3dMJeUTCm7UYWcAtM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZxCIoff9YIUZTc72NIEWLJwxfWfGuyAO1jbspqIprUt/qAXMzc+v6qIMzoO/69eC0lTut3SpzwB1xfW9SPYk0uZdJEDJa4/4fMAYF6nA/Jy1Nd1GQX228PI2Q3PFrI6lqoSvNHcQCip98KW23oVOX7EaIIe9yYUGTwYZ9dksXiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jZe/nXOL; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jZe/nXOL"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5faaddb09feso1611844a12.2;
        Sun, 04 May 2025 02:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746350629; x=1746955429; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ULlfDCNR8m/9pJtlgrHCEPaJVNLe3RFSja1Lf02MnM4=;
        b=jZe/nXOLllzb7vy3aWilQ3lJfukrdw5fCFyvuUhkyDJxV7e3lVRNJ2IIRvTsq3+MAF
         DlEKIm0WIAYhTjY8oRbumLXZOz1RJy8FTRDySCfO/L32uCh0dzsqOnoDSJ8D27cBhDci
         y9ZhSogt6yLGH1DmGk+3pGbx8QZ2S3rQm+h+JExcv4KKEscdRERR3N5A1XCWf8u5tr3p
         jCz9f/0C+XQtaqTxVWTb9SXnpI7Wa+TMPhH1THvsVechy01Eu4+pTShQLXDhdzBKovpA
         Q4UaLjmiJ/d6ut6fO5U7dK4T6v4ZcfodyT9/MXFmBrqMFIcOPn1aHft/Fp2O9gLPj2Wk
         nPPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746350629; x=1746955429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ULlfDCNR8m/9pJtlgrHCEPaJVNLe3RFSja1Lf02MnM4=;
        b=fmDsUSGyQMM5K68ebj2+4NjaXKe8dQKP1Ahi5W1RQdPmhYopGyLhp+JoHtfdN1MlvD
         NydZeoLAEEInUOXK4N01wtWjh65MiOTingGdSU8Q/p/vnTxJcbu4rbqao/veC++Vgh+X
         LnNXOZiCpEt7sUlSbLp+DprLUOHI/i2vLk1sQkE1/D8o9Tt5Ma8XY4bzaDnJhSp1vcQp
         9QZevSkzx0CShMwFNxhpcEasOGG4FwyW+8VagADWkMcT9yq61H+0yt6oplyhyowJ1CPO
         jR8nlzxdwIa+ygSy11YWgmdyOTehanG+NZM+ZggouZAWlfpVYFNuVz0gGJrjMF0Zs6pO
         ow1A==
X-Forwarded-Encrypted: i=1; AJvYcCWJC3w/Cum1dgA1VUxybqdYOTWQd9uwwtkiIpq+/Gx4Qd70Va4BIs3bis/MP0wovkAuqo/HrA/T1aPNEJo=@vger.kernel.org, AJvYcCXkeg0X7kMZRojdx1rPPt9ZKLhZyv2gTd002lcn+LAIuSvmN4tKyD2mlnjBip7ura9NpbEud9182exBLEI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxH0VJlsLNT+OD9N6PnXR8Gs6aen53MCl4kHhtU5LhkhgewGYhD
	3szxVft2TbnK/JP6UBTUyEc6hVNp+LxLJAo3yUzFBaRcZIQbihXA
X-Gm-Gg: ASbGncvr/0/LfbdCjG2MKbhK3DxL7cEF0ZTp8T9Ndkv/LlReQQ1/TOLjd4ncE55z17X
	L9i8rz8X/qn4H/v6BVj7TdhGzoLCfe/hYrcVNutSr8IBIPFEBD624OHw8fWZasPc21SI4PsENDh
	NXiKlrMHsAoFynAIOk3MZ/IEznfVO+YDAme28WO0M9BBmlY9Q/yPKfz/8Dd1qB6/8TX+TYJEUIM
	YTqFbBFGaUlSRjoKhPpJZ3uBerCZsmXYZn2Vrxy5gt4q1SoLZVqHsJUNcTYnQHOuLd83nyGl0xX
	1TFS4XFmvVEQ1SEKv4AjDR7EDximDS7V
X-Google-Smtp-Source: AGHT+IGKrc+4P+CCmQxGtEci8Piln9XhnppgGCzsKX971n/OxzWghBmZW4xn+ucKpFSOXGJQ0gP/3g==
X-Received: by 2002:a17:907:6e94:b0:acb:ba01:4a4 with SMTP id a640c23a62f3a-ad1a48bcf72mr352875066b.3.1746350628696;
        Sun, 04 May 2025 02:23:48 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891a26bdsm306050266b.43.2025.05.04.02.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 02:23:48 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <treding@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/3] ARM: tegra124: complete HOST1X devices binding
Date: Sun,  4 May 2025 12:23:24 +0300
Message-ID: <20250504092324.10802-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250504092324.10802-1-clamor95@gmail.com>
References: <20250504092324.10802-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add nodes for devices on the HOST1X bus: VI, ISP, ISPB, MSENC and TSEC.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra124.dtsi | 65 ++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra124.dtsi b/arch/arm/boot/dts/nvidia/tegra124.dtsi
index ec4f0e346b2b..ad7813da8aec 100644
--- a/arch/arm/boot/dts/nvidia/tegra124.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra124.dtsi
@@ -103,6 +103,45 @@ host1x@50000000 {
 
 		ranges = <0 0x54000000 0 0x54000000 0 0x01000000>;
 
+		vi@54080000 {
+			compatible = "nvidia,tegra124-vi";
+			reg = <0x0 0x54080000 0x0 0x00040000>;
+			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&tegra_car TEGRA124_CLK_VI>;
+			resets = <&tegra_car 20>;
+			reset-names = "vi";
+
+			iommus = <&mc TEGRA_SWGROUP_VI>;
+
+			status = "disabled";
+		};
+
+		isp@54600000 {
+			compatible = "nvidia,tegra124-isp";
+			reg = <0x0 0x54600000 0x0 0x00040000>;
+			interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&tegra_car TEGRA124_CLK_ISP>;
+			resets = <&tegra_car TEGRA124_CLK_ISP>;
+			reset-names = "isp";
+
+			iommus = <&mc TEGRA_SWGROUP_ISP2>;
+
+			status = "disabled";
+		};
+
+		isp@54680000 {
+			compatible = "nvidia,tegra124-isp";
+			reg = <0x0 0x54680000 0x0 0x00040000>;
+			interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&tegra_car TEGRA124_CLK_ISPB>;
+			resets = <&tegra_car TEGRA124_CLK_ISPB>;
+			reset-names = "isp";
+
+			iommus = <&mc TEGRA_SWGROUP_ISP2B>;
+
+			status = "disabled";
+		};
+
 		dc@54200000 {
 			compatible = "nvidia,tegra124-dc";
 			reg = <0x0 0x54200000 0x0 0x00040000>;
@@ -209,6 +248,32 @@ dsib: dsi@54400000 {
 			#size-cells = <0>;
 		};
 
+		msenc@544c0000 {
+			compatible = "nvidia,tegra124-msenc";
+			reg = <0x0 0x544c0000 0x0 0x00040000>;
+			interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&tegra_car TEGRA124_CLK_MSENC>;
+			resets = <&tegra_car TEGRA124_CLK_MSENC>;
+			reset-names = "mpe";
+
+			iommus = <&mc TEGRA_SWGROUP_MSENC>;
+
+			status = "disabled";
+		};
+
+		tsec@54500000 {
+			compatible = "nvidia,tegra124-tsec";
+			reg = <0x0 0x54500000 0x0 0x00040000>;
+			interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&tegra_car TEGRA124_CLK_TSEC>;
+			resets = <&tegra_car TEGRA124_CLK_TSEC>;
+			reset-names = "tsec";
+
+			iommus = <&mc TEGRA_SWGROUP_TSEC>;
+
+			status = "disabled";
+		};
+
 		sor@54540000 {
 			compatible = "nvidia,tegra124-sor";
 			reg = <0x0 0x54540000 0x0 0x00040000>;
-- 
2.48.1

