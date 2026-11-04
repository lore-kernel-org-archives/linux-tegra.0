Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793796084;
	b=oVhlAYGpinx0W9RuKbsOEoTDqfS7BB1Nk8Gwr/vyUy+rsDJCZEvkzTqKNm1S1eA5MCyn
	 1Mhm/L4SD64Avqy5p5pfE9sOev/d4+aTYWTHIPtNj4HNnBKKb3QJyrcyCKhGT2CAJCD6a
	 go0rC+7dgcdbZ2SMZBFbHWwzpF3HMaKglebtjU9ukF/1NN9079NIi/axNXNRA/LbuWqIN
	 aCrKCtCPKrHwzVFiOv0C+vpn3XJjKE7JNvqNxWhVRPHFF5RKXV5zu9zUh4+Na7itYX/qy
	 L44lGqI0L9aoCunhCwJvGf50FWSEZtyEq3HflSbIPYP2GvxGj0oUz9xs68UH/HkUk3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793796084;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RX5JkljdDqaMIqrBDcx4CTusbOfYgX4R/O3KQl4nKGc=;
	b=1zqt0LL7Gd8PZZTtLt7wOFqG9f2mFcZuVmhlDdEZSdQdBCV3qkbe/oC3N7uK8HGYZIpy
	 G+9OQV6QssgTRJ/8IK6isQEu4SDnRV20AUt6bm1TKmwe7NiG1DZnTEeYas3aTHBeo69iC
	 uQPj6h5nfN3mrPMs2R+aTligYB5uOyf4RtZRA+Pmacw0rDnfP6J9TOZiVp6oGOyA2xL5W
	 UvSxWds/C2NaOez0/x936PKXTufn4CLyqHDBEJpVa2mIlQKpaM0/DRUOJOQ9Ih1z3Um95
	 gJ2tjIItm8UjJMSE8xSZsBywSzB19JYaDdCAF4Hwvz1LjmHl5JI9/PSLH2Y3OcObeGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zKY4OQFF;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D94C0606A32E
	for <linux-tegra@vger.kernel.org>; Wed,  4 Nov 2026 12:41:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D94C0606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zKY4OQFF
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so5899915e9.3
        for <linux-tegra@vger.kernel.org>; Wed, 04 Nov 2026 04:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793796082; x=1794400882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RX5JkljdDqaMIqrBDcx4CTusbOfYgX4R/O3KQl4nKGc=;
        b=zKY4OQFFhb/TWccWcZhqYME7NpIAKPOvuGo90LadGTQ9KTewXXAS6ZMqyBs9/GbbeX
         dxvYTXHKTf50H7XwFnzmj/n0IskHBp6LAGq3FsIUYyeu9uQbyDAhoJkqDpTyWJ13Zd8y
         ByBJhwGZmuj9RAhkz9Fsg+3QUKA1efAoAKu3R96Vh/CQh6jJe6GjJNEBFFrFHhBDnGCe
         qcQaPwTejmhNGlx2Bp+QxdtBslS5MlHoWKn+TP+C1KexTC7MWacYIAmgwJUNNEOd3hiZ
         PUuhY9fcR7zI3HofX78Sjik+H0gm1HTG8NYZ+RIMgs0QSIdVHpTjMnRJHqifPpTUkcu2
         sLNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793796082; x=1794400882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RX5JkljdDqaMIqrBDcx4CTusbOfYgX4R/O3KQl4nKGc=;
        b=ejNNApuYLkv/CLeh/jgFJZg0SGA4mBkQ392aufcNgL9NOws6JudLhxd9EDrIFr8tW0
         mgBMcsja9eiTNUKAjuL7x9IRwb9bCtAOD7T1VtFogxshSAEf/GRno7BG9LJ6fKaINwvr
         lrQaRQw9nOGSd2IOguMHMmWo3oQwHvlgZvVzlh2YubR6sVI2tp4Lsi6FKKWWFTYy0rCr
         g1Wmti1f/wO5Vjf/SNqw55Bx9p0OZ4sbB32LZKD2aZfoaFPyOZ3kc9C7hAXySJtjc+Mg
         LTMMR0URztT6uK+UTPVwlmxmXg/RYNy4KTCh5rlddgaWhoKtgSJGbq7gT/WnVmzN6uVj
         sQmw==
X-Forwarded-Encrypted: i=1; AKwUvBz6ZzBXw8Tki+viYCYmX/RoFHS86Da3/WW0DVpCGa/XuC00EM9eRsjrHIdBVDBtBBdelkVZY7vAHktxog==@vger.kernel.org
X-Gm-Message-State: APuU4Z9J16Wz5bTiEeBuak83JyDUu3nbm2ZDNmD5CfjqaSy+AXrP7lDg
	mAiu1x89uP4qK124SoC3bUtxhLQlQd19JtRDqeLIUUhTyqUqhU1GH2CY
X-Gm-Gg: AYBFou0qLtP851CKlAOl1sH1/VBQ0+/2y3p/u4Z5zgfsLGfEoBHFR8m8RSqY1Geo/0V
	HHP9dGRC0f8xtOauE3fLNZKVkOTnn0U6iRbBERIlJBTPg475pOGIVEkiwf0hjupfNYFFcH9Mruv
	Xe0OL3N6b45SNtMq+yqwzHPONWnz9BfWzJw/tg/3wzRjSat6Y/vVp4ZtatQHsMY2OxImYWZ33z/
	8dFGhr0Y6tt8Py0Zmc5YgkDLp0HN1N+tGriqupi/0mhcKpZyVOcBxTqWbe8l4P/iW2BNnY376uS
	BGDPp0JHSpGwE93a9GcowECODe7UEFl+YJOndnAsDehOv8S09RKJdbuX//3mgIuoC8DcSQ42X0z
	lZ1O54+4xcpDlHIDaysuBrZMMaqYqp4CaiAsy+2aTc+daP/+VvoZ2UalJLE/S1z5VFadNdchp6T
	wXRauHwjLBLHJAvArguEWAtiFmAlwMQ+oOMIQdX2y4MOx6jmpNP1AiIRY++Cu3jOgfZfDjKf/dA
	f6zcEzZwVy4fnB4SoH2CqtmydVQxUvcjxk7+drhD+Lr/3XQlbf7Nb47zEoV8QJ6xi4OV7/fmBaI
	KvTH69O+a5CKMmvyg3OpktPllBipZaMxBJ86a2/yLmqj1JkbHvk/20PzeQlXFJi1LFEH29o=
X-Received: by 2002:a05:600c:c0d4:b0:4b1:2026:6b31 with SMTP id 5b1f17b1804b1-4b12026723bmr142181145e9.28.1793796082303;
        Wed, 04 Nov 2026 04:41:22 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b433ebd278sm46347145e9.3.2026.11.04.04.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 04:41:21 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>,
	Leon Romanovsky <leon@kernel.org>,
	Animesh Agarwal <animeshagarwal28@gmail.com>
Cc: patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v2 7/7] ARM: tegra: Add '#sound-dai-cells' property for audio-related nodes
Date: Wed,  4 Nov 2026 14:40:57 +0200
Message-ID: <20261104124057.240288-8-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104124057.240288-1-clamor95@gmail.com>
References: <20261104124057.240288-1-clamor95@gmail.com>
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

Add the '#sound-dai-cells' property to audio-related nodes to support more
advanced audio routing configurations.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra114.dtsi | 10 ++++++++++
 arch/arm/boot/dts/nvidia/tegra124.dtsi | 10 ++++++++++
 arch/arm/boot/dts/nvidia/tegra20.dtsi  |  7 +++++++
 arch/arm/boot/dts/nvidia/tegra30.dtsi  | 10 ++++++++++
 4 files changed, 37 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra114.dtsi b/arch/arm/boot/dts/nvidia/tegra114.dtsi
index a5958f3a965b2..f2766c11ee6c3 100644
--- a/arch/arm/boot/dts/nvidia/tegra114.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra114.dtsi
@@ -881,6 +881,8 @@ tegra_i2s0: i2s@70080300 {
 			clocks = <&tegra_car TEGRA114_CLK_I2S0>;
 			resets = <&tegra_car 30>;
 			reset-names = "i2s";
+			#sound-dai-cells = <0>;
+
 			status = "disabled";
 		};
 
@@ -891,6 +893,8 @@ tegra_i2s1: i2s@70080400 {
 			clocks = <&tegra_car TEGRA114_CLK_I2S1>;
 			resets = <&tegra_car 11>;
 			reset-names = "i2s";
+			#sound-dai-cells = <0>;
+
 			status = "disabled";
 		};
 
@@ -901,6 +905,8 @@ tegra_i2s2: i2s@70080500 {
 			clocks = <&tegra_car TEGRA114_CLK_I2S2>;
 			resets = <&tegra_car 18>;
 			reset-names = "i2s";
+			#sound-dai-cells = <0>;
+
 			status = "disabled";
 		};
 
@@ -911,6 +917,8 @@ tegra_i2s3: i2s@70080600 {
 			clocks = <&tegra_car TEGRA114_CLK_I2S3>;
 			resets = <&tegra_car 101>;
 			reset-names = "i2s";
+			#sound-dai-cells = <0>;
+
 			status = "disabled";
 		};
 
@@ -921,6 +929,8 @@ tegra_i2s4: i2s@70080700 {
 			clocks = <&tegra_car TEGRA114_CLK_I2S4>;
 			resets = <&tegra_car 102>;
 			reset-names = "i2s";
+			#sound-dai-cells = <0>;
+
 			status = "disabled";
 		};
 	};
diff --git a/arch/arm/boot/dts/nvidia/tegra124.dtsi b/arch/arm/boot/dts/nvidia/tegra124.dtsi
index 86956b94ca0b0..920b1329a4dcb 100644
--- a/arch/arm/boot/dts/nvidia/tegra124.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra124.dtsi
@@ -1125,6 +1125,8 @@ tegra_i2s0: i2s@70301000 {
 			clocks = <&tegra_car TEGRA124_CLK_I2S0>;
 			resets = <&tegra_car 30>;
 			reset-names = "i2s";
+			#sound-dai-cells = <0>;
+
 			status = "disabled";
 		};
 
@@ -1135,6 +1137,8 @@ tegra_i2s1: i2s@70301100 {
 			clocks = <&tegra_car TEGRA124_CLK_I2S1>;
 			resets = <&tegra_car 11>;
 			reset-names = "i2s";
+			#sound-dai-cells = <0>;
+
 			status = "disabled";
 		};
 
@@ -1145,6 +1149,8 @@ tegra_i2s2: i2s@70301200 {
 			clocks = <&tegra_car TEGRA124_CLK_I2S2>;
 			resets = <&tegra_car 18>;
 			reset-names = "i2s";
+			#sound-dai-cells = <0>;
+
 			status = "disabled";
 		};
 
@@ -1155,6 +1161,8 @@ tegra_i2s3: i2s@70301300 {
 			clocks = <&tegra_car TEGRA124_CLK_I2S3>;
 			resets = <&tegra_car 101>;
 			reset-names = "i2s";
+			#sound-dai-cells = <0>;
+
 			status = "disabled";
 		};
 
@@ -1165,6 +1173,8 @@ tegra_i2s4: i2s@70301400 {
 			clocks = <&tegra_car TEGRA124_CLK_I2S4>;
 			resets = <&tegra_car 102>;
 			reset-names = "i2s";
+			#sound-dai-cells = <0>;
+
 			status = "disabled";
 		};
 	};
diff --git a/arch/arm/boot/dts/nvidia/tegra20.dtsi b/arch/arm/boot/dts/nvidia/tegra20.dtsi
index e4be3b62a51fe..b7102e6317ab1 100644
--- a/arch/arm/boot/dts/nvidia/tegra20.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra20.dtsi
@@ -405,6 +405,8 @@ tegra_ac97: ac97@70002000 {
 		reset-names = "ac97";
 		dmas = <&apbdma 12>, <&apbdma 12>;
 		dma-names = "rx", "tx";
+		#sound-dai-cells = <0>;
+
 		status = "disabled";
 	};
 
@@ -419,6 +421,7 @@ tegra_spdif: spdif@70002400 {
 		dmas = <&apbdma 3>, <&apbdma 3>;
 		dma-names = "rx", "tx";
 		#sound-dai-cells = <0>;
+
 		status = "disabled";
 
 		assigned-clocks = <&tegra_car TEGRA20_CLK_SPDIF_OUT>;
@@ -434,6 +437,8 @@ tegra_i2s1: i2s@70002800 {
 		reset-names = "i2s";
 		dmas = <&apbdma 2>, <&apbdma 2>;
 		dma-names = "rx", "tx";
+		#sound-dai-cells = <0>;
+
 		status = "disabled";
 	};
 
@@ -446,6 +451,8 @@ tegra_i2s2: i2s@70002a00 {
 		reset-names = "i2s";
 		dmas = <&apbdma 1>, <&apbdma 1>;
 		dma-names = "rx", "tx";
+		#sound-dai-cells = <0>;
+
 		status = "disabled";
 	};
 
diff --git a/arch/arm/boot/dts/nvidia/tegra30.dtsi b/arch/arm/boot/dts/nvidia/tegra30.dtsi
index ed1bbf86434ce..1e51da329f310 100644
--- a/arch/arm/boot/dts/nvidia/tegra30.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30.dtsi
@@ -1043,6 +1043,8 @@ tegra_i2s0: i2s@70080300 {
 			clocks = <&tegra_car TEGRA30_CLK_I2S0>;
 			resets = <&tegra_car 30>;
 			reset-names = "i2s";
+			#sound-dai-cells = <0>;
+
 			status = "disabled";
 		};
 
@@ -1053,6 +1055,8 @@ tegra_i2s1: i2s@70080400 {
 			clocks = <&tegra_car TEGRA30_CLK_I2S1>;
 			resets = <&tegra_car 11>;
 			reset-names = "i2s";
+			#sound-dai-cells = <0>;
+
 			status = "disabled";
 		};
 
@@ -1063,6 +1067,8 @@ tegra_i2s2: i2s@70080500 {
 			clocks = <&tegra_car TEGRA30_CLK_I2S2>;
 			resets = <&tegra_car 18>;
 			reset-names = "i2s";
+			#sound-dai-cells = <0>;
+
 			status = "disabled";
 		};
 
@@ -1073,6 +1079,8 @@ tegra_i2s3: i2s@70080600 {
 			clocks = <&tegra_car TEGRA30_CLK_I2S3>;
 			resets = <&tegra_car 101>;
 			reset-names = "i2s";
+			#sound-dai-cells = <0>;
+
 			status = "disabled";
 		};
 
@@ -1083,6 +1091,8 @@ tegra_i2s4: i2s@70080700 {
 			clocks = <&tegra_car TEGRA30_CLK_I2S4>;
 			resets = <&tegra_car 102>;
 			reset-names = "i2s";
+			#sound-dai-cells = <0>;
+
 			status = "disabled";
 		};
 	};
-- 
2.53.0

