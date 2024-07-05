Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0881586C5
	for <linux-tegra@vger.kernel.org>; Fri,  5 Jul 2024 09:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720173143; cv=none; b=Mwb0SV+uyZ6S0igLyLiBWG2tnURyHfY5mvo8c+YUmppxFuTtFjTZ0nNh8sUzMbJtTGnd1yCGI0X88NfK0wV5YA07b0KsutnhY4ShqvIW6LTUB1Tpt8M0jiy2hrzCoL5tUbGrrWov/lqqOVmXREmIB14U1vohczw3oOk87d7vjXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720173143; c=relaxed/simple;
	bh=IGcKhylVD7M2fiaVzKgopYky2mw3JJLYGI9cCuiXQyE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=diogo31e+IWreia3pipzC0gxR+Tp9bmURt44nHvxLIOP5vl+Wl00BYIteCBbP7cW5bUfnyvegW5YASl8W8Kzcyq6VSNvAtr2jNkbcopRVrfsQSYo0jNY9/l2d7esUFRFOYDwec3MFGCBiL6bGYhP85ZruGFrdSLLu2IQzvmEWvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oSW1gYkh; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oSW1gYkh"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2ec408c6d94so15573961fa.3
        for <linux-tegra@vger.kernel.org>; Fri, 05 Jul 2024 02:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720173140; x=1720777940; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vZK9+FEvdO5b5SnvhwCCn3o/h6a0KrmEZudlpSLpeZE=;
        b=oSW1gYkhmDBAwNL/ayOFwn1aydI+/ZZlNBZ17u2tZOKydVnNqFAPp/MYVTj3htFNj2
         kQVlUboft+1KglimnBAt3NnHpzVC8LsyybnWg0YTUz8DmE7k5M7kn0Z3SIQ/RQ3VqX1O
         kkuHXJece7tfcwYyYnQjzIDfwaQZkHqTEYaoMIu6/0+zow+rBX0sdWOH82qfosuYup3T
         UGTM1n4r4RM47NSXZP0qwQ4bexuJqAtJIXH3S/R+KSGFbK/xsXO7M/SPt8zpehyaFAkz
         rY2TwaYDDRnoyVj5jUSQMu0ChNK+5LiGJGlEkceQ7PxucYg5UsxLuovnbac0yRSvfBGn
         cWeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720173140; x=1720777940;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vZK9+FEvdO5b5SnvhwCCn3o/h6a0KrmEZudlpSLpeZE=;
        b=lVm0tZG0eQb3jo4pF6M868ek6aJw76bQy66bWOQ7pZCMwINU1q3xGm45mDMH4vMxIj
         edNx0Z9Muf1A82GpEXiO0YjpWUzjpVucs+1BrZO+kOzlNmcSJkmjNGyiYXHiKzUuOJcp
         3m8nRHUMsJad2L5LjIRa306jBAOvp3D5FO387e/RgzPlVQkbqqZWIcyoy/zaoqG/2DtS
         3Pa4RwXrBwoofvfvApp2LODq8iJY3NKFlfPaOFRaYmFxOAOU98piGuHX+N1JWx8E+9Qh
         Iad/M2SXEXYCYiSe2QEC3eUrd5Syoa9NVW6cKQfoRkC682CfJ/sidxtMKj2HDyEFJ2fS
         9nEg==
X-Forwarded-Encrypted: i=1; AJvYcCXTEvreU/LqPIroIX750RXqzKVdJ7dWYt792TueRFc3itplYvEa1imhkhNfDgYAxAzkSIITZ/Xkfm0mxrTsULLnrOuIeOB9eOww1F4=
X-Gm-Message-State: AOJu0YwbSuYSM9u8MUE0tNOu5gUdknLuBv03pnVsb2qabUwB2N+4Zwmp
	jVDbiK+0T0CrDJbPFep7a9fm1onYt1fBBLRdosmTWp9KQlYcuP4CcdB8I6BKuzg=
X-Google-Smtp-Source: AGHT+IGVHwkbByZvrw6mDusVxlNiiHcrJbvlEiT/YrtA5v7OASK5UtwPznU1bZHU6sVVA0zGCO8b0g==
X-Received: by 2002:a2e:3502:0:b0:2ec:51b5:27bc with SMTP id 38308e7fff4ca-2ee8ed55e01mr27148791fa.21.1720173140070;
        Fri, 05 Jul 2024 02:52:20 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d1650sm55528995e9.2.2024.07.05.02.52.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 02:52:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 05 Jul 2024 11:51:33 +0200
Subject: [PATCH RESEND 14/22] dt-bindings: thermal: rockchip: reference
 thermal-sensor schema
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240705-dt-bindings-thermal-allof-v1-14-554061b52fbc@linaro.org>
References: <20240705-dt-bindings-thermal-allof-v1-0-554061b52fbc@linaro.org>
In-Reply-To: <20240705-dt-bindings-thermal-allof-v1-0-554061b52fbc@linaro.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Guillaume La Roque <glaroque@baylibre.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, imx@lists.linux.dev, 
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Florian Fainelli <f.fainelli@gmail.com>, 
 linux-rpi-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor.dooley@microchip.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1231;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=IGcKhylVD7M2fiaVzKgopYky2mw3JJLYGI9cCuiXQyE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmh8Iw9ZYN6CLePxLn0NeZKj4YTnecyOtfCTACL
 uqH5kJdeLiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZofCMAAKCRDBN2bmhouD
 12wyD/0b08sxMLlf3O5jVJxyRvjubxkal3vYiUHwHaCEYijYcIRMRzRuOcEQONwVpWazVYZ1fJB
 w9yW1XH8PUEVQ1G+eLU2gGw9LxJriiM5E2zruvPgp5/XZD+fT4JPNeb/Ruse2b0AySdcMZYVNFb
 5CbToqDMyowzewIU3JQ8cittNjC6X9RiX8vOpKOAGu6lJHKlxkZfUkMOI16NPIZdFCL5fLEHpOZ
 ZawcwzH5GpPZcwwZuCg3HP9uXQQPpRmb785KRXBoeBT7qPkPfyQrgVEKXCCAa40PzH6j+TGQOqG
 +ySMJVa8CRFTP2/KreGr5BxdczZaBnB4uJPLQQ9DkzDNmWv9F+1zUYz0uaWGBRjkBzQVePhaaei
 142o12Ay2ytSWdnp9SuigdXzxuB/WfGQkNtp1QAyW/y7UBrGBieBi1nxclNETSira7qc9w/gjSW
 PSlne26ZRGbxddZeUARz/K14WgqEr1jMWdMPUvsD8HKATAdtZzlnJwHBm4+p9K0QGfz4K4MuUZ5
 8vsdMOUnnNXjhsKLMKqD8KcR1OkIpZSbGyG7ANud9LJf9YaA6DkCgqyaW/PDosarP2ukqKx64HX
 I3w1BiRI2qlslSK2mwyIJNkEP73KU/p9qf0vyzfESB1jElNUHGixEIeRGQbdfHDH8NiZzakW/es
 xwIfmVDSrvMO7pQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Device is a thermal sensor and it requires '#thermal-sensor-cells', so
reference the thermal-sensor.yaml to simplify it and bring the
common definition of '#thermal-sensor-cells' property.

Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml b/Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml
index 55f8ec0bec01..b717ea8261ca 100644
--- a/Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml
@@ -9,6 +9,8 @@ title: Temperature Sensor ADC (TSADC) on Rockchip SoCs
 maintainers:
   - Heiko Stuebner <heiko@sntech.de>
 
+$ref: thermal-sensor.yaml#
+
 properties:
   compatible:
     enum:
@@ -76,9 +78,8 @@ required:
   - clocks
   - clock-names
   - resets
-  - "#thermal-sensor-cells"
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.43.0

