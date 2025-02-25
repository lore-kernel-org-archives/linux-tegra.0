Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E3A26FA4E;
	Tue, 25 Feb 2025 14:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740494132; cv=none; b=VxNr3PjbxZdYF/EZv7hBTUouywUH9cPVevK75xofpO/C9+7EORa/BhdYsPYEgLJl9BDv65o5SdKXBvJ0bgF0CySjQcZSkAega+FnXlCrZN3kGVhfhuS2cpfT0dCklprs/g7C1ggkbBidMBjcPtfOxJGDqHlocTW6A0UfZ/GF8Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740494132; c=relaxed/simple;
	bh=krsWTIcSpxu30rfP8b8+rWzpLNO1z5RGELkx9PpVImg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BFvWZE1IEl6K3xqX3gai4rjU2UqpNre8kGQrcwzv9KMQQRwtVSL+ngNHQy5X6Hd3phbCT8MC4b9Bn2c8zfupGA/KCzlHZebUsQVuanIJrmCERA+D7oP/NrUthQW4SgHlUvVBeefbr9H6UYKDapCDRuRsFTHIeNRdMt3lECXQx9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AGcP0u75; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AGcP0u75"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5dc89df7eccso10194072a12.3;
        Tue, 25 Feb 2025 06:35:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740494129; x=1741098929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nYbEaDAlkuquvV78BGQd7Wfa9gQoWP6O4myoGexgeKM=;
        b=AGcP0u75DjIQfMUc0D9Q0ldhK8wUsgo9gcXjBmmZMcZAcMWypYbC3TOsgXqzQM0eeJ
         Wd0jgGfVyzOw3XVkueWYOlw0lOU/s3aXfDSSR8XrAgDGx1EJsSjyIdoLvRFKmfLS70H9
         dHOhqnVmYttpe+IJYZfvV+ZNGfy9/sPYqP9VutxrvsF9ebGK35BejJ+5C6fRAx099wIN
         O8QZ4al4/O8QoBizL9UmtPdQg/ehxKt3UOAZJRt1ico/tDM8Cc1iVruUydB5yRA80j2G
         HIad2lU6LN6EBETDDVsgjBBPwbmmFb24qb7moRiHBscFa+P39YJEVIUdv1Xu5IlxFCKL
         LR7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740494129; x=1741098929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nYbEaDAlkuquvV78BGQd7Wfa9gQoWP6O4myoGexgeKM=;
        b=HI3K8FSwy9Yhd2MwyxLSP95WRUBelwmdkn/f1GOAq82a8fB1+9962iKphzPMNwz189
         w20Ys55EZ4aUdayPUVDxdLhJSqqC+ti/1bP8y6lsrNFIqhZYWx4Czd9u3PHzK7wo3NZH
         sGkEadeVhsBPH56sZa5veeu3wI/9gWR7YDdO9c68StAlaYpkBLz83QfcYZ/qy1+rjBXW
         iYXkPpefjyfWNt9n+Pquk2t77VUmARudfH13+N3wtxbaJzruG08z98XEmvDxjEQvuRwS
         ClX64aeNM2qwNWR8BmYtHrl0v4RCUIn2cYZgl5sbPz5DQ64SuHdGBJg6qgVsOP+wk+Uv
         P8pQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUEawBvWUu6wCkjMVAFiy1HZme2UeDdE9bSNJcRGFVnuZVW9b1EJpvySpZqJhCwBoNFsHD9/kLpgoT@vger.kernel.org, AJvYcCX1dY/z7jUGraVuA1mgjASj6e/99J9aS0e2PesaYd4ANKvd9r0e92kk8Dq99fkZa5wNrK03YeYRY21J@vger.kernel.org, AJvYcCXOEVtPHruSvu3UAPA4aOUDNGpQSQDdBh2HDy7Cos2iJFLcFEQJryCBZrmEAUVzOAqGkNDEjLPg1RWAdbk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHYOs5DrCklo3gY8Pu/pCZ4IMsUyjk0eA4opuw04jGH06y67FI
	6kzXLT9qV+73N/zGm54Ic3z0tx/EsPQouOcY5HFjxUDzquMYs4Xd
X-Gm-Gg: ASbGncuKnK4owVqk6SWiPvhYYE/kr1ZpNOH81ZKZndhIXqaR+6Fw0MvbCZ2eFJZ9LuB
	ua8oESckmW0T920l3BN1XbiKcOP1pR22oA/ngnUsr6Cg50RLm/zgt26Xcg/zRa2l0eIwZ92Re+J
	jtjWLkCGh5y+QV7fdHL1chr3Xglyl/w0yozGPOvH/175uHDlJiGTdVIq9dlgIJ34TANOxuudSp2
	YUNJ1epTMnqoCX+dpHR0fk+8MgpxsNWd/BJtS/hndI/pTRAJWYU09ymObGtDEzowciUEdp1WhEg
	Glb6bqGa/4Mgap6mZw==
X-Google-Smtp-Source: AGHT+IGdvGi4dSCfkA2NBEFNbYVCy8gnYJ0OBTefAsJBujlwgFrlpzSMeW6V051Aojtu89yHAq4bhg==
X-Received: by 2002:a05:6402:1e8c:b0:5de:3478:269b with SMTP id 4fb4d7f45d1cf-5e44ba3ff2emr3306392a12.32.1740494128702;
        Tue, 25 Feb 2025 06:35:28 -0800 (PST)
Received: from xeon.. ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e460ff8629sm1298750a12.59.2025.02.25.06.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 06:35:28 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Peter De Schrijver <pdeschrijver@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Georgi Djakov <djakov@kernel.org>,
	Dmitry Osipenko <digetx@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v1 1/9] ARM: tegra: Add ACTMON support on Tegra114
Date: Tue, 25 Feb 2025 16:34:53 +0200
Message-ID: <20250225143501.68966-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250225143501.68966-1-clamor95@gmail.com>
References: <20250225143501.68966-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for ACTMON on Tegra114. This is used to monitor activity from
different components. Based on the collected statistics, the rate at which
the external memory needs to be clocked can be derived.

Actmon driver has T30 and T124 compatibles, T124 fits for T114 as well.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra114.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra114.dtsi b/arch/arm/boot/dts/nvidia/tegra114.dtsi
index 86f14e2fd29f..a309999e7988 100644
--- a/arch/arm/boot/dts/nvidia/tegra114.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra114.dtsi
@@ -246,6 +246,17 @@ ahb: ahb@6000c000 {
 		reg = <0x6000c000 0x150>;
 	};
 
+	actmon: actmon@6000c800 {
+		compatible = "nvidia,tegra114-actmon", "nvidia,tegra124-actmon";
+		reg = <0x6000c800 0x400>;
+		interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&tegra_car TEGRA114_CLK_ACTMON>,
+			 <&tegra_car TEGRA114_CLK_EMC>;
+		clock-names = "actmon", "emc";
+		resets = <&tegra_car TEGRA114_CLK_ACTMON>;
+		reset-names = "actmon";
+	};
+
 	gpio: gpio@6000d000 {
 		compatible = "nvidia,tegra114-gpio", "nvidia,tegra30-gpio";
 		reg = <0x6000d000 0x1000>;
-- 
2.43.0

