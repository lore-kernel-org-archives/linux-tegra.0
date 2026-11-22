Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795378493;
	b=DlkInEu1e1MNKWJF5zqujhOeVvVnOlbNk833Z640SfGdAQKgs8E163B+qGS0wdSldt/v
	 dgARdSt+uE2c/rd2thQHKrYQ4i1eVqJhpAlmVn3fAXDHVN8m4igWeb59ULmd+y1EwBDTw
	 0ItyP0/WRWUtE+A6HghVJYkCGZbN16zjC43Z1b8awOQttKKeIx0yJHgZMg78dFRm9aRUT
	 vs25I97R9jyOAUWggfX41XAWhVBZXygjUSP7RvBfigqnNnCQqPUH7uBeGyRNDngl5wNI/
	 5yvmdNBWcBvfgdxHkDmcOyIQYBOQMArV2uuWULGTRY7gA1uzyPuCZqLsxyw0NQZ+fOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795378493;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pGSVTZaAeg5ONQQr3RXHvCYFgEdl+y0kYu+jOLz8K0o=;
	b=M71C+7N4wCem37nnCFRNjNvJrqlTKBsNYnqJUSWKH1NiIBR73q9b5EmszXUBMCPtII/4
	 aBXxYcT99fhfsZHr6bnI7pnTM5VONR2Ko0/WXxEm/LmlNMQFVK9/uHnmjANoRG2HuWvbH
	 bxQcFFDze8uIZcuLLE062HVVqzMIobJ1DVHW0+SFCvsQ7DVQR3dy1WRvm+XceMND4xy9B
	 23GDb5GrgcZ//g2VplAcPbNujVv658Bq/OxJj/lFm1Ie5Rrwh9ZyygDdkYUCJLbH5FX+B
	 C5DQIiij8thujX3n5Uh5W4zLcQtXXhTxQ8dwCVUOz03kaYticN+MJ4WUgdflNCH9XxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v2wgH2KH;
	arc=none smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B26A606A337
	for <linux-tegra@vger.kernel.org>; Sun, 22 Nov 2026 20:14:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B26A606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v2wgH2KH
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b8784a3284so3748341a12.1
        for <linux-tegra@vger.kernel.org>; Sun, 22 Nov 2026 12:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795378492; x=1795983292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pGSVTZaAeg5ONQQr3RXHvCYFgEdl+y0kYu+jOLz8K0o=;
        b=v2wgH2KHkoMEBCbDMNy/CLvF2i/ojO37ANtTooF92PR8zfLAXMphuBNEDpUMves8zg
         dEftMPYnv3oKDFloRDc8nXQXgF6PCq/sFo5qlVXD5Ut7Qa3Au73qHnt1wrsS0rrrw+gW
         GsXy+CZ5cLneeQR3oO3q2jMdI6Ekxw9JBF9mjRKjOwuTEVqiiFsN9ZpchUrIcoZdIPy+
         je0dwgfKlOSoP6qeJ4dLUYRfLPfNmnYpvoB7LOwJxIzZcQVDexgqLFgVUkNsBYAXN/9/
         ZYVI93gSOqpEYNWpaERq12nOPAinictzu8ttCnpYkCgIj/8JHI8uQZGAoOgdD+kEv/MZ
         zQcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795378492; x=1795983292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pGSVTZaAeg5ONQQr3RXHvCYFgEdl+y0kYu+jOLz8K0o=;
        b=s6x5wN/xg4s1knX58Crjlwspk5X1+6BLw9kHECpN2gLmbAcwl74jZFL++vwvf7CgpO
         AKhXd+QSnKmhovfqhebhijZLFv9n6k3MKZxPqy5mSwy3abq/lFdy5XSpS0i0sHi8G0Ly
         RQU2VAksz20B21nTT71c3B6s9S6WjP9JrOeOw5IJ6zbZVw0R9Oy1dU2EwiNdyDWjhANW
         0+T3tOSpp4X1B4tf7VCUCSNkB9jZZZPbZkviN17yHfsgNU4ImWfYyXtZQZMFDHf7Hhht
         nQ/lcv86Dc5r1H80Vrvuojfp6BwOJFwhTjsmPykGZo/7DFTfB5RcqOSVwG+aJvYU55JI
         SsUg==
X-Forwarded-Encrypted: i=1; AL+hErE5jKszuggwe64Ygo5CQgsUYHStZsaMdBKXB/WofQUGSaegR4c0Z6jrTGOe7HFVQiLkIasnCAYmaRryVw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/aI2j2DPvAIHOZ+4xdA0z/eC62WSz7Mah5uBrZhddD6rz3h+LD
	i7dXrmts4KSUej1E5eePALKLmxoC+qn4GpQAPy/29eTBroG+wwwAc3lE
X-Gm-Gg: AZFdTZejDTziUvZvHOlw6W18wF1eb357GbUq3H/ttuG96eOBznAgX5Nrx7wt5s0ZeP3
	0EQ1opaez9mrw3jQfISfR7mpO0jfz641R/udjXzM3Z98469YKKIzfSA3KhZbZZSF3dDkMZeVWcD
	SKRqzWP0Ii0Ev3rA0P5F5lJuEt1EmzOJPF7oWgtMeBR+ovXu4H/5RK+N+X0B+V42DzuhI/u03g7
	lkebdZL5ScfI8PqUAbhHzyivCYZKQ7+rLxVfGwo+sBhQ+6i1fQF0n/mkLkcRZN7F3GSYV6e0DVE
	BbvC11HIL9m6sow7X5ltJHjSbMvZMX1cVUUabXseoBJKIZChPXjZ5+qO8wVKTOji3xLcTMsH/hR
	Y7tySDBdWIiGKiQCZJ5CcioFH0Bsr2ir2W7jzmQmAW7tG8h4J815fXCbMBKnykaFDNSHKRzn/70
	1XSev8LYnrEmXJvjQy246mmTxfR8qf99R+x1n0KLtsMfiazlPmNYTCAenPj1rRjISAudmtkJP6i
	Q8wautiAijkDXdESr/zQZ9X8atd30ValyWzFjW8BIanT4MbPr4yBDnTnj6L7dcauCpRqu9ypeQu
	3lOW1BaSH3wSSRhTm8ozY4dYBRyZJvupAa+GzCWlAp/h6FEfPKo4fPMDuSgxkBT+jzfiIj101R6
	3VOuBUpf4Mw==
X-Received: by 2002:a05:6402:4585:b0:6b7:63b7:4e7c with SMTP id 4fb4d7f45d1cf-6ba37e8f6cbmr6765670a12.17.1795378491456;
        Sun, 22 Nov 2026 12:14:51 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fa8basm4424074a12.20.2026.11.22.12.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 12:14:49 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 11/18] ARM: tegra: tegratab: Add audio codec and sound card configuration
Date: Sun, 22 Nov 2026 22:14:00 +0200
Message-ID: <20261122201407.23742-12-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122201407.23742-1-clamor95@gmail.com>
References: <20261122201407.23742-1-clamor95@gmail.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Tegratab supports RT5639 codec for audio processing. Add its node,
configure the ASoC sound card node, and link the codecs to it. Enable
i2s1 and i2s3 in the AHUB used by this device.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../tegra114-nvidia-tegratab-common.dtsi      | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
index 911e5e9d8a0db..07091ffa6df19 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
@@ -989,6 +989,20 @@ gen1_i2c: i2c@7000c000 {
 		status = "okay";
 		clock-frequency = <100000>;
 
+		rt5639: audio-codec@1c {
+			compatible = "realtek,rt5639";
+			reg = <0x1c>;
+
+			clocks = <&tegra_pmc TEGRA_PMC_CLK_OUT_1>;
+			clock-names = "mclk";
+
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(W, 3) IRQ_TYPE_LEVEL_HIGH>;
+
+			realtek,ldo1-en-gpios =
+				<&gpio TEGRA_GPIO(V, 3) GPIO_ACTIVE_HIGH>;
+		};
+
 		fuel-gauge@36 {
 			compatible = "maxim,max17048";
 			reg = <0x36>;
@@ -1346,6 +1360,18 @@ hda@70030000 {
 		status = "okay";
 	};
 
+	ahub@70080000 {
+		/* HIFI CODEC */
+		i2s@70080400 {		/* i2s1 */
+			status = "okay";
+		};
+
+		/* BT SCO */
+		i2s@70080600 {		/* i2s3 */
+			status = "okay";
+		};
+	};
+
 	/* Wifi */
 	sdmmc1: mmc@78000000 {
 		status = "okay";
@@ -1619,6 +1645,41 @@ vdd_3v3_com: regulator-com {
 		vin-supply = <&vdd_3v3_sys>;
 	};
 
+	sound {
+		compatible = "nvidia,tegra-audio-rt5639-tegratab",
+			     "nvidia,tegra-audio-rt5640";
+		nvidia,model = "Nvidia Tegra Note 7 RT5639";
+
+		nvidia,audio-routing =
+			"Headphone Jack", "HPOR",
+			"Headphone Jack", "HPOL",
+			"Int Spk", "SPORP",
+			"Int Spk", "SPORN",
+			"Int Spk", "SPOLP",
+			"Int Spk", "SPOLN",
+			"IN1P", "Mic Jack",
+			"IN1N", "Mic Jack",
+			"DMIC1", "Int Mic",
+			"DMIC2", "Int Mic";
+
+		nvidia,i2s-controller = <&tegra_i2s1>;
+		nvidia,audio-codec = <&rt5639>;
+
+		nvidia,hp-det-gpios = <&gpio TEGRA_GPIO(R, 7) GPIO_ACTIVE_LOW>; // check
+		nvidia,int-mic-en-gpios = <&gpio TEGRA_GPIO(K, 3) GPIO_ACTIVE_HIGH>;
+
+		clocks = <&tegra_car TEGRA114_CLK_PLL_A>,
+			 <&tegra_car TEGRA114_CLK_PLL_A_OUT0>,
+			 <&tegra_pmc TEGRA_PMC_CLK_OUT_1>;
+		clock-names = "pll_a", "pll_a_out0", "mclk";
+
+		assigned-clocks = <&tegra_car TEGRA114_CLK_EXTERN1>,
+				  <&tegra_pmc TEGRA_PMC_CLK_OUT_1>;
+
+		assigned-clock-parents = <&tegra_car TEGRA114_CLK_PLL_A_OUT0>,
+					 <&tegra_car TEGRA114_CLK_EXTERN1>;
+	};
+
 	thermistor: thermal-sensor-thermistor {
 		compatible = "generic-adc-thermal";
 		#thermal-sensor-cells = <0>;
-- 
2.53.0

