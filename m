Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2E818A924;
	Fri, 14 Mar 2025 07:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741938407; cv=none; b=MauCkdus7cFZiiDjtV5dJxkrfJAmMEZpkr1kQyL45i7jqCpsHtKWindNXXY9zQJNfwU7KFH/xA0w53L+AssMAmr1vWkEONf1LXTrrTVwhBwM2IJrniARLpwBMkrCHSIY1i/i5pD9vYtJIpe/8OEWV/frh6QQgGA6BzSthoJ+9/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741938407; c=relaxed/simple;
	bh=tqMA4tDK31wY6qPOPD+zOTxEAh59GZPloHMScFKSisE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RZ7wMGgIbgf012WTx2+kkt0LoiDHk2/Z5oPxS9qpsIE94sHFP/nMCC+4zAcKVRTp72rM1/J8m5DC8RcQjlcw7JNKd9NutFeFI8yQtc+WAq0ARQ7dAyyT1MbZiJ/eGMSLpBxTfMzanm7FJhn/Ces5TeU8X/cph87airYl+oVRg+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D60BzWrw; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D60BzWrw"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ac2c663a3daso365514666b.2;
        Fri, 14 Mar 2025 00:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741938404; x=1742543204; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2APlpWz7mzIZ9kmVRmF4F/OvUtoBuwDq2tijoAt+Ptk=;
        b=D60BzWrwwyc+Z4sdIHz29RTX7GFXDOAFBMKLTE4ATD9eBFUvJroVFJTLMLmmWMbpn1
         nDKxADhgJfcUvvADx5aDNZbZ0UIuCxgbJZ55C0WOwGU+ciV6ee/4kk2yo5YpZXcIlIOA
         WQo3Exnt65pVgyllR1WeSrLZs7Hzx66kDc+3uNzCBXw909NY1BQ4T3mzUO9wZHttBc3Y
         YU8vYBQsU4mb1X8hGOprDrpPvUcgXHgCT855sJ/hTgGYRgmjqdpyXFzn3jNaEQHKc6uw
         n6dzllANF1RHji0oF6w6664T2Ks9+19cj7xoMbY/wJnTVxMBG/vsytAotfTvh8bysFw4
         SU8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741938404; x=1742543204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2APlpWz7mzIZ9kmVRmF4F/OvUtoBuwDq2tijoAt+Ptk=;
        b=lP79glYx+i0CWBOi+H/ISAV+xcpX73vybqSO1WAUJh2FUznvO3SPgtWKXMjTvPP5Ci
         AriOf2KfH1NZ5UZyexly5jI4n4W5JwMoS4mrOEWQUAb14v/YQwqASSdpxtpfDNDOR/2E
         kMjWBoKGPRtftxBlPT6Kg66DVs3ERML1OGPgi8nmU7LckCBatoTpq/xi+H0BS30GgbJr
         P7QC2bGmZyhEe+3JAQlNFhLlgEBOfxU0eicpSqlyTe3F8k/lrd2K19d8lQgZpQSfPg5Z
         s9F1x/EH0Xhd97u5oGJpvBTIm04W1esZSH68KSqO2pITg3IdMtcWpehpWEvoYhyi7Jdp
         SuGw==
X-Forwarded-Encrypted: i=1; AJvYcCVQSlWpHAJQzq7UelvkR/oOTYcF+7oK+QRuvALa2gyK30q8ko0DtN9gGh6tb6ULj8fLp1VGS56iMgBG4UI=@vger.kernel.org, AJvYcCXvWBaTibUInJzz1it/+VWPGQrfpGlrfwf5h9+KBRlu8qmNU60iILWIVLGivcDxrBZQ545jblfEdS46Uv4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHj0GFEA4BU3Gs/Fa4G6FUDssShxMhCEkmuhIb6plRh6VOa4Wg
	kSIcmPfJFxZbuRfUWPJE29PdgmoqeJxwjja1qtRrWY5XTwe7yUba
X-Gm-Gg: ASbGncv0Q3IX98pRVc804v3gO6QQYfD+ndw0C9ZC5mr2jDmcriJdZbGgQaIkJv0+us/
	0Mv7rWyI+8pLFzQHFC8QZpWWepJZsmSqvRSKLtLMj8sXzS45Z8MixC17fjtp0Q5kEHT2wjrInCG
	ZLsTZiybqMr+OC6wnNKMtpGoDfZtQPG202xqYppoLjtM70IafSI9Am+JRyzmA3vQoltNsWJFT5Q
	6NrsAMqAGG7pwCx0HXlmKUS9iu/xpr07W9ioqgvXETc9qOBbuwqYxmE+gu10C2nKdnIApv1aTxi
	kanEbzBaXdLfvMpoGEpIxBstM/UW6HvCzqh4wIKDb1BNvR4=
X-Google-Smtp-Source: AGHT+IFcEuHOlB6uACzJ+ijBzKNl0gnPpcN35WBOZJ5BS0wtvIsf8mERnxPKMdKxakdVxqFa1mMrRg==
X-Received: by 2002:a17:907:a089:b0:ab7:b30:42ed with SMTP id a640c23a62f3a-ac32fa42274mr175827266b.0.1741938404253;
        Fri, 14 Mar 2025 00:46:44 -0700 (PDT)
Received: from xeon.. ([188.163.112.73])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac314a9bce7sm185498666b.164.2025.03.14.00.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 00:46:43 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <treding@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] ARM: tegra124: complete HOST1X devices binding
Date: Fri, 14 Mar 2025 09:45:57 +0200
Message-ID: <20250314074557.16367-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250314074557.16367-1-clamor95@gmail.com>
References: <20250314074557.16367-1-clamor95@gmail.com>
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
2.43.0

