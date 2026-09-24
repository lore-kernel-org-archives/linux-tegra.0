Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E057B442FA0
	for <linux-tegra@vger.kernel.org>; Thu, 24 Sep 2026 09:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790240807; cv=none; b=mlIUb+86SpkxHJymSa7L3USz6bRI2m4niNOxfb+cpe/OxbxEuEbgHk6s0UCH/uGii0hmu63ZFbPvmIAZt1BNAm5aS5i+sBU6rQY6qh8tWcjNpkKq4eLEjM57gnOpaJxiTnP1aqfRHTc5bFiR9JHDNgOlZ+FEDXY4cQzhZoxQnhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790240807; c=relaxed/simple;
	bh=vmp+OQPaS2NHX0XYFG8L5R60OBL0I0xQunPfHTA/NMw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eAEHOzstfvKMH7NBd6imHhxhqIv8FfnJfvsvi8nsizphomWZ8NK6wpIOY3c0jiudisMXXBVuLg3ndopkjpZqfAjvecPGtrnGyCfZL4x0x4hkoY0XsS8AoCSYchh2dI+cq3rcQW6e1TSkEVDgt/yG/0RhH1sg7XKaj2Spa7bBRHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hVwlq/rs; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hVwlq/rs"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4834977ae75so1282220f8f.3
        for <linux-tegra@vger.kernel.org>; Thu, 24 Sep 2026 02:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790240803; x=1790845603; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zeTy3yB4AFQI47c9gqtmLbqmJYgDGxNm0dRNSD0HLKI=;
        b=hVwlq/rsfAW0HgOH95+ab4PVdJaG4F8X9X5i8rmo5cKbh+RGcsqqKz7tHvc7fyP7cZ
         N4dc03dgzy3h070h7wnlPs4rQGPV/LuSgAahG7nF0POH7bSHktBmACqd/8YqQjysPp+5
         Kl/h0fkYQ360dcXlsFY4xOY3YH22SCKe8Ro2DrdsqisqyIQD+6/F5da6GjX1Ov9OADgv
         TNlNmDcnhd6qeXBolh68s9IzQfkBeCGxuYFReaxa2iGyfAKK3Q/SngESbFY8x7Z7u9UU
         1V9pY/o5+ZbjYzu48PlK1ltMuP5lrueaSGbdPP1RYSFs3Pdno1GJrGnxvj+giA4MaRUy
         w1aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790240803; x=1790845603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zeTy3yB4AFQI47c9gqtmLbqmJYgDGxNm0dRNSD0HLKI=;
        b=J6L/C40ybU4OrX+e7b5vQr1ZWgQVrPzcm55xq8HEYhXNmA/NrOgcclMh4IpdqFOsWd
         DXaohCPuA5nc6M7vKXk3Sg7dciApY91T5nr4c0qJlk1cqZZghnyAwpVuLvIdW1qO9FxN
         Rbr3KAPiOGmj4Y4vRJ0sz0Nw+WlRYIQINo0oYYl4uJXal/nuLOfm+Q1FEWqL3yQak08p
         MuepCSz+nIhm5m+nY+fKKuVKYcgXppQbUPmJ2yWG1ss4j+tY86pPIfGTUuzxXqYlOIzr
         DreEZcFaXRbE7TlJ8rx3gExdlR1rRjGFBoSHmQO0L8CT0jSLGTsH+mL8IfqUsjae2l6e
         NJBg==
X-Forwarded-Encrypted: i=1; AKwUvBzqHrp3jLKK5GBHLQapGSLeRk5vOsyZTtmv1G0i4JEwHgKsSb+AHGVohas8cK4UF+RYMdA5/cb8YC6/LQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mtTOjFvNAXFFJyJH+ZvhysH2ZPR8S3nEAcTLGjs2/7nbHfM8yk
	CsqWxQifuu6MNfRvlTIl8VkWA7lGTkQIC0McBbkISnwTm0wE9QnuBiZC
X-Gm-Gg: AYBFou173dId7C2JcBiI1ltDhNz4s9xwsdDoUJ3jOohxpDCouD4NeC0+gvgLaWe4Pdb
	ARVrD8a0L3IuLmdBg8tXUCSeBNmkjpsUcmTxYFjuyWBZkWVpIDV0Tj/dHiJHS840Of3px0BLxOt
	5WO+FDR8QfsDtDqosMtbV7exVgRn0qbEWqwcqzaOD+0lFGOfQt80oQeQpxJeoPOU1OU869h4SSJ
	z1z3tJiDRvUVlAzCQznf9uM7nMFPEk2xFcuJvegVve3XN8OF15NE1aDaxfvmikQl32dLxQxCGKL
	2kfpVZ8hU9OxLRGi7yYXNI4Mgn0WZpEWKseIj/Dpj+AyAcnhfCl01MQkiXN6Tg0Q11Cwiz6Otp7
	juUQU8KMyD7anDkXCdx/2VglIbiyaNwUznXyYKI6hQ8yovvP+4SnIxP00oliPtOKz0jFmfmwv5m
	uOcMboHAMs5NU4Ti0OIAJhqDLlIJCs62fwVo8ltCwq9EDR8zBh5ztkamzAuc4jG60ddLVFqwlNc
	fovL+s55mGVtGISgkg=
X-Received: by 2002:a05:6000:230b:b0:487:ae2:4d01 with SMTP id ffacd0b85a97d-488716836ccmr3067286f8f.22.1790240802712;
        Thu, 24 Sep 2026 02:06:42 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886877c379sm12875561f8f.29.2026.09.24.02.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 02:06:42 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Ion Agorria <ion@agorria.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 4/7] ARM: tegra: lg-x3: Add light sensor node
Date: Thu, 24 Sep 2026 12:06:05 +0300
Message-ID: <20260924090608.28734-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260924090608.28734-1-clamor95@gmail.com>
References: <20260924090608.28734-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add node for Avago APDS9900 ambient light and proximity sensor used in
this device.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi b/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
index 5f3273a4dcf46..417cc1bf42ea3 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
@@ -1142,6 +1142,19 @@ nfc@28 {
 			firmware-gpios = <&gpio TEGRA_GPIO(R, 0) GPIO_ACTIVE_HIGH>;
 		};
 
+		light-sensor@39 {
+			compatible = "avago,apds9900";
+			reg = <0x39>;
+
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(K, 2) IRQ_TYPE_EDGE_RISING>;
+
+			vdd-supply = <&vdd_3v0_proxi>;
+			vddio-supply = <&vdd_1v8_sen>;
+
+			led-max-microamp = <100000>;
+		};
+
 		imu@68 {
 			compatible = "invensense,mpu6050";
 			reg = <0x68>;
-- 
2.53.0

