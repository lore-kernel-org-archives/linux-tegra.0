Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2BA1C8FDE;
	Tue,  6 Aug 2024 12:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722947983; cv=none; b=NfPIA/4MXmYlDiI+EYFxE5QArthoWRRL9ZDqZuEOomQwTptPTBmYIZy0CeQLQA8WdWcua5OxPVKeLXABG1OzQnR2uyCshFMbLtfj/d3G5C8tJD2Dq7BlyzjM4jFViwDO0mAUGHsG5iTp88DrrF3uKkg438sfPUFZVYYECe9JBT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722947983; c=relaxed/simple;
	bh=a87ccjybN006OIWzUmkYRjKHZQrsJkKo90qZcZhqM0E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oLbRnrmU9xDnRCak2XJN4ZBMq7D1Vy9/cRuLcjJQOGXGOs78d/BRKEgHsODD2wbFLts++epp/K82fZ2pRe6i/djuZ9L9ov/VcpFkFzFQ81C8M4wLPtoqWvuQajCymMVP8+V8ZXHNl5Q7Qt6PV6E8BjYGAmEJIWKh9bMXLe/gB7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Le/DFkJ0; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Le/DFkJ0"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5bb85e90ad5so542264a12.3;
        Tue, 06 Aug 2024 05:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722947979; x=1723552779; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PNNj5zWwyuqUYqEW2Z7H/Q+MkhzL3QD4Zwkv3kdfROU=;
        b=Le/DFkJ0hitFVf9+CvMLNKON0FGzPM9GVCIfBUGoE2K0HND2N2qPuFiHzmOLP/xW1v
         8pIA9Xxu0m9by1blXjLeD52uc55xGfvQ+/s7SddxgMPtqhRvb+qk7wAhfGsf/cOm5y3Q
         m17aY44dNF7VG59NFiWXZ7ioAI057yJ5pQAGBdv8AbwTM/80gRr9HgWzLk5CW/Tmap0+
         VgNqg5jWctWhA+CGgYxcr8GgPmZDrOyBQLVherqLGMW78XjmgBNFM+AHg0LVvCOWnSVc
         HzL0JBuJwmIRT8xE1QuqqtTJt+pAB4QjGC1ICuW/WmsrPHtoqGh/OU1DA4A2Eiyrfr44
         SaNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722947979; x=1723552779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PNNj5zWwyuqUYqEW2Z7H/Q+MkhzL3QD4Zwkv3kdfROU=;
        b=Zq72BEX5MQhw0nxYkmbERLHgIxcS5UKEbvId9hk99eBGBafd8451jANn5tiNikUcIB
         cPG9L3n+Mcq+6O+a/Fe1uTykEUlrdzCKO2O8kUF1picmOd9Vu2Zw4sBe/4F1WIHH9+/j
         dLbiJBiqNyycUSej9O4S3nDQGLYkiYVck0F/R3oaelylUFCOQuOxkAPblTpXVFJIyMN7
         PzXh6hmCa6w9u+RuuiJQIBGJLTvz/tiIC3l9b+++92YEyj9Vzh3x5j/2xyaWQ7l1NWCi
         z4DWJn9q0ATTWB2Cs8LFV2T9cOq6eQHtGL86uYK1JY8Lw0vubVYeFW0aUgIFko+lUY0h
         hBsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRL5Iv3C5xHRvyhW8GattHR5TZk3hQImEjYZ1ODx9u1hNgKJw4sYz7ZYwEUWw2cRWAgbApFtDGyBk5oOe2t5u7+dcRJOktnP0mxmlX4vmjStSops4nkI4atYc0byURuq7795IDNGNdvW4=
X-Gm-Message-State: AOJu0YxXpXYRpf7pJdTumdLu1PsUwl16Ub2vn3+hFUWCSHBs9uHOHAMF
	OapRBC+yQIuPD53eZN9GaFtJLBT5LrLvbA7OfnpCGbSTV9yk63v+
X-Google-Smtp-Source: AGHT+IGazPuzzzcNYgBVO3ZuyNhvHVmorxPyS0wSU2pzK+UOMpcooUr2Inj7Pzu03xgZVUy4dLxyKg==
X-Received: by 2002:a17:906:6a29:b0:a7a:9f0f:ab26 with SMTP id a640c23a62f3a-a7dc4de2f92mr1094802166b.23.1722947979249;
        Tue, 06 Aug 2024 05:39:39 -0700 (PDT)
Received: from xeon.. ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9d8a4b1sm546428366b.151.2024.08.06.05.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 05:39:38 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 10/11] ARM: nvidia: tf701t: use dedicated backlight regulator
Date: Tue,  6 Aug 2024 15:39:05 +0300
Message-ID: <20240806123906.161218-11-clamor95@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240806123906.161218-1-clamor95@gmail.com>
References: <20240806123906.161218-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Downstream kernel states that backlight has no actual enable GPIO
and uses fixed regulator.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
index eb38c036bcc5..e6d0c834c0a2 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
+++ b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
@@ -1630,8 +1630,7 @@ usb-phy@7d008000 {
 	backlight: backlight {
 		compatible = "pwm-backlight";
 
-		enable-gpios = <&gpio TEGRA_GPIO(H, 2) GPIO_ACTIVE_HIGH>;
-		power-supply = <&vdd_5v0_sys>;
+		power-supply = <&vdd_3v7_bl>;
 		pwms = <&pwm 1 1000000>;
 
 		brightness-levels = <1 255>;
-- 
2.43.0

