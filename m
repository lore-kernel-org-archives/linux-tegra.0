Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D9D3CAA5E
	for <linux-tegra@vger.kernel.org>; Thu,  4 Jun 2026 06:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780556179; cv=none; b=dtJqqXxqm9v8ljd9RdX4oORBdQqN2eFV8QLGHaHt64k5T8U+t3/OAMVMXbqfO2ycQ115bLDDdXpOwypHY2kgpMve70whVrBsRThcSLGBwqS1D8qGaTWGlhk8b1tV7z10ELwMEcnuToIJqejBs/sCotR9SZUo1q4LbJXaJz4ifXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780556179; c=relaxed/simple;
	bh=DaTzAXD8FGjvPs/XWfTkRZKSFrhFO1y0HCi0MBeI+b4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r0qz5PFmdAaB5tyr51yOEJILBotHuLv/j2WLzLbMNkN+sRf/1YiyQpF1+pFcrDQ3RxlotXLkhBgRHl1nBDW3kTKFi03soo9No0i534ml5oTvvx6DTfP1sqKVJObDBlOafcUiYRN/5sQ3yCUN16S0Bb8le0Co6iYbMqEKZO7+A+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JwJm+yDf; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JwJm+yDf"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-68acf0a15b3so493151a12.1
        for <linux-tegra@vger.kernel.org>; Wed, 03 Jun 2026 23:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780556176; x=1781160976; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P5W/LcgLrtin+vtqVBJjlTEMkgRRi9gzp8Xfb+jXrxw=;
        b=JwJm+yDfTi7usRS2czvRbTrq9kLDtAho7bKrLDV9F8AKvYLoWca8JoYs6310jnU78L
         kNLZ37WLVmymy9gcFqFT3XSsmSDFhaL17tzkK9hCw1ohlLhKIM2iTb8x4yctMTiJOHIz
         H2fRxXk80MEpSAzrHh49ccSHb/N21DLPPDkVs2G+vUg3ZJA3R0/xGUEzyodoMpYLHcrL
         FGESTSS9EjHEcsOa44d2b8TOrazaSaQ5Hu3ZeJn6KTj0WylXVsI/Ihh0Yd7nVcioWFSK
         UvC2+DSKhcraOAfrbOUSru5hbjKKt8DEeR1OPC+SXdwqth7Miy60dncCdBW31Ix5jJgK
         /dFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780556176; x=1781160976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P5W/LcgLrtin+vtqVBJjlTEMkgRRi9gzp8Xfb+jXrxw=;
        b=l7lTBkH9V64LUeg/kQvOcJtSYejAUdb+MnYD5h6zSbQe6JdKNDnY1CrGw/VE+8fGnS
         378V3ReKDwJZ+BcueBvhcwu78wcIKbvZDAIdFs7whZirlp6UcMGN1dP94wVuBZfB14wP
         IJ4Z+EqTFi97cKQQAjdoOLHFzllLHZPLzLutLHXDrD9gn+W0aZ6JfDuQKXPFwEfKIvv4
         gyzesZ1RBdt4LRyzZzyZQUBYnKJr1OAeYnXiMklBbMBKKGesO3ogCOPGq9yNQjwnMkDK
         k/vW2dXgiMM6CGfGBXRGibitva1u1ZZ4YUddW8F3yTw7Pg+ARPEMsDW1siCkkToKwLD5
         YqsQ==
X-Forwarded-Encrypted: i=1; AFNElJ/XB6suQ9QXPit8jXSH08sVPgMpE++YvZuMh5nmMFUMc8o5pkacify0vFwWWIlRpyxr4ZTGfF8ehHcUfA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwiG9ZNlKr8/xOUCHny5C3IVhE/H2+dKuLijdYEIG0b7lRHpJmq
	QWIa0rSuiiCN4o6/v8r4bGFuomAC7nvUBr9owkuY/KZrVeF30M4o/Gqw
X-Gm-Gg: Acq92OE0yUZjVcrk0RYU/b8IAndZ/UUmpu6hcLjsucE0VDiDuXJmnouYAQU2gkk3tiN
	2nwOZqMzg2Z7kxtXhGqN+sHdEIvjjwjkls0d+w4wxQUmRfSKsS5GTB59mzv0v9yXA/VAF6F3nJU
	dy1joXufKPBm2Avw1WAXZIK+01HBUj8QBGcMjUgZzdFGrLRACC6aKu/b/K/Uyl+69vwCXhBptWE
	yrnK1GZ7Jl2H4vSyXXvzuQ06niOtYO8Ug/ltK6SFmHhfAzBTOl/4yPo6AFdprqGJm7INmYuMp5k
	Mr6OXbiZcBflO5fSUUgLUIR806mUAzPWt7YP6pLbUEkbLlJtuWNBe3uIhWkAHQHn8i7XmlZZVpl
	5jSH8ePblFIS6rtS4DWWsAXeQ+NRzuebzJ2XpAFRkLp6fOtSqB3H5iiVCxr7wYeOhB+tj4aLA6R
	paTYgzvizzrkrKY4+fH6OF/n4=
X-Received: by 2002:a17:907:8990:b0:bed:e575:d54d with SMTP id a640c23a62f3a-bf0af0ff158mr355280866b.42.1780556176203;
        Wed, 03 Jun 2026 23:56:16 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf051c83c93sm264113866b.16.2026.06.03.23.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 23:56:15 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 01/10] ARM: tegra: tf701t: Configure CPU DFLL clock node
Date: Thu,  4 Jun 2026 09:55:47 +0300
Message-ID: <20260604065556.137614-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260604065556.137614-1-clamor95@gmail.com>
References: <20260604065556.137614-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable DFLL for ASUS TF701T since it is now supported by Tegra114.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
index f02e2cf65fe8..041ea6e06531 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
+++ b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
@@ -1621,6 +1621,14 @@ i2s@70080600 {
 		};
 	};
 
+	/* CPU DFLL clock */
+	clock@70110000 {
+		status = "okay";
+		nvidia,sample-rate = <11500>;
+		nvidia,i2c-fs-rate = <400000>;
+		vdd-cpu-supply = <&vdd_cpu>;
+	};
+
 	brcm_wifi_pwrseq: pwrseq-wifi {
 		compatible = "mmc-pwrseq-simple";
 
@@ -1752,6 +1760,12 @@ connector_in: endpoint {
 		};
 	};
 
+	cpus {
+		cpu@0 {
+			vdd-cpu-supply = <&vdd_cpu>;
+		};
+	};
+
 	extcon-keys {
 		compatible = "gpio-keys";
 
-- 
2.53.0

