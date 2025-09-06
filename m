Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A462C029C;
	Sat,  6 Sep 2025 06:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757140197; cv=none; b=VVGr71L78ofe9XQ8VbvWgdFOhHQjK7b2OXSxRwzvFzzX3iYBaHQKEx/710I0iml1ppWPbsLKUD42CWrO1MKXU+IMlPUTmdJFG+xFj5tH8nrTYG1qpPSwa6smbyImudviCw58FeThFHBD0wht9sqV4e5xcet15u103l51aWkHTAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757140197; c=relaxed/simple;
	bh=X2UVWFE56oGAG6MnA8VCRVebBopaiBCFqLUh01bmVD8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cBDrkrEfX0u2Y5Xt+2eVfCuOJIFsmTXxOxQIxe4KsWzA12x8YvB6v+PZFMcMftxNG/2DUwsKzTiRIto9+s7CFgj2l3tqosDwUiudWljWw3X2SzebOqLKWD5mDSvQpW0tbH2LMLkZ18fQ6m/ptIXtxylLVs6f9gWw6dWfvMe1Nt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EMamuOKl; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EMamuOKl"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-55f76454f69so2677826e87.0;
        Fri, 05 Sep 2025 23:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757140193; x=1757744993; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2OgIkJV8JArvxHdtNKw4loDa5FpDTZDmIq/ubtOvjfI=;
        b=EMamuOKlC1Wgq6XBAwVbOaoONbAJG6+Adr2e3zBPXzf2J/vVl5DF0n0yGIzJqpZxsc
         IClr7mASjskNs6RqdA3O6ntKvEqsRo2UCQ59aM5r9zYbYm1xpRGCg5gZF0CLspLBakZq
         36y1NA/c3HK0YYDb0/RaQdQQg2/h0dySGuxm9tZvuet8ocyjsAmIGaS4l7lBMZiYK7fj
         zy6G/OuXj07J2mLeQ4Riwk3O6PTcPVeBqFAMOX4eyG1Ltq2wKEtmZUzflJSRq6TTOH39
         McuFOtNX3tyZ4WZQwrDN/jRUOhraHGPevkiD0kTZI3tsob7/3lXUXSFDWy+Pfg86ryb9
         sTmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757140193; x=1757744993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2OgIkJV8JArvxHdtNKw4loDa5FpDTZDmIq/ubtOvjfI=;
        b=F4uOY/2P4hqOg1eXCjZG6fW/epN2SOV7O6w3NEJ5wcKK4Kn4AJ3U7smU8ZOQ6TOgx6
         YaudDhEFBob09+MqbHyFxBM5Ye8w7Bvt2zUACz2DHzs8ow7PLj/7qgsJ/PERuIH4xgT9
         q+VUzZYhDRySPPW73t/UF5jx7YIJl0SPmdS7rQWY4JtOVlo9OEmzjVp/CngXPIgXbI2C
         60TLhhGBthmdewRz2P/j2+JSX7UL9GwBUHbFGH/lOs3V6i1hCJVj2uL8dWmSHu95wCdi
         DuG+di4480q5Asc0hx8AHoWQnkh0OQxiAIesiTw0ZzG3bEgm35sXm3uSrYQwIZ6s2/v+
         tYzw==
X-Forwarded-Encrypted: i=1; AJvYcCUnuIwrKuIglG23m82N4ba0CiiBWAs0MKSaegIhvPyet0YXqtSXqmhXbMhNN9htTgCzFmcrQ+jQ4D5I7no=@vger.kernel.org, AJvYcCX/6L0r2HG3eLa7s+MW7DfEvxKP6FaGGYs0an6DZSb+NmS0dE9qSYqlv836op2v6ILHOkNbRFGg2pJB694=@vger.kernel.org
X-Gm-Message-State: AOJu0YyU/bby1S47RCk6MKchWqRcBABA3eDBT/KY4B6DZwSLhmCXLpN/
	pypGDY3EH8EbOllzZ6P+lscvVvIaQt9yflLN9tfV5McScO7t6om3dxZlg3GQ4g==
X-Gm-Gg: ASbGncttIVazl3E5I0qKtvI9iYbEInZjAqQq2L/UGO7PksEOdXHUyrIn122nNROBAw3
	79VJnTUK2VFxmA8932Z30kGsgMq3xFUl9Qe+++AGDyrJcgzhbanlrSwTzj6Z3IrGlORPXktIDMA
	JP9fddjJV8qa9vauOET+29hkw2kihKDC51Gr7CAm7rd5J9uY/19jjptDl8trfwG48ylQYluT+Mc
	Z3DBUtuxAzMZN+yhDMcIqvtVS6mdqpp3OP74Wxecic+XS9St1ObICqZoLuKRf5tvvlVRXs1mfXM
	kk9LZFH6Sl26lYtoiJriXJ+0+z/p6QNqiFFPH5EiDpRvUZ7PNyMQ8wvutbnagplGJe+hLVNYJ+W
	vbS4h3gl5Xx4ib3thQpigv7Q9
X-Google-Smtp-Source: AGHT+IGZQqKGRKUQDzCr15QgwnoOZvatA0JMBJPkCj+ai6gdhKZDv3rgn2zgfZSgM5VEXJ7UcQjS2w==
X-Received: by 2002:a05:6512:3c9e:b0:55f:6a72:5679 with SMTP id 2adb3069b0e04-56260e4321emr355083e87.34.1757140193347;
        Fri, 05 Sep 2025 23:29:53 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608abb7c74sm2178737e87.54.2025.09.05.23.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 23:29:53 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Maxim Schwalm <maxim.schwalm@gmail.com>,
	Ion Agorria <ion@agorria.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/4] ARM: tegra: transformer-20: fix audio-codec interrupt
Date: Sat,  6 Sep 2025 09:29:32 +0300
Message-ID: <20250906062934.6637-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250906062934.6637-1-clamor95@gmail.com>
References: <20250906062934.6637-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct audio-codec interrupt should be PX3 while PX1 is used for external
microphone detection.

Tested-by: Winona Schroeer-Smith <wolfizen@wolfizen.net> # ASUS SL101
Tested-by: Antoni Aloy Torrens <aaloytorrens@gmail.com> # ASUS TF101
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra20-asus-tf101.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra20-asus-tf101.dts b/arch/arm/boot/dts/nvidia/tegra20-asus-tf101.dts
index 39008816fe5e..efd8838f9644 100644
--- a/arch/arm/boot/dts/nvidia/tegra20-asus-tf101.dts
+++ b/arch/arm/boot/dts/nvidia/tegra20-asus-tf101.dts
@@ -518,7 +518,7 @@ wm8903: audio-codec@1a {
 			reg = <0x1a>;
 
 			interrupt-parent = <&gpio>;
-			interrupts = <TEGRA_GPIO(X, 1) IRQ_TYPE_EDGE_BOTH>;
+			interrupts = <TEGRA_GPIO(X, 3) IRQ_TYPE_EDGE_BOTH>;
 
 			gpio-controller;
 			#gpio-cells = <2>;
-- 
2.48.1

