Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB58747ECDE
	for <linux-tegra@vger.kernel.org>; Tue, 21 Jul 2026 10:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784628679; cv=none; b=gKWCsTWrSeLrH0tYvHt1lMbCvTPE/qkLAC2RaU/ZKcIrLDi8PzRDaYdMuPwc/xpKIPwAbAAKmlwRIS6d8eYfk0jr2vYBCEMq2Pa1L7FTlqh77nWhqYqm345rh8QimWcJv1G0auqaBYSyx/MQuxkcfJISRSItVb7uyyzuoPl69XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784628679; c=relaxed/simple;
	bh=iVZoJ194oEUw2xc4OjPA4NuTSMMc1ZrgAkb07TkG/K4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NpJcYkJAyGwaxLLmuE+oZZIFJSf/RqnS9YPs5jKh23i4xkP05PrSk3lh5OOi8nhCSXtjBBFw4/GvkgcAktUYbR8H7gmcAWcBl940mqYszq1Hw7z/9fkz74mQ93ldCsT7WRcc9D1MA1b/6PptsGuCAa8QwqJQXJcKsxiboTGmqWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gN1ppR9I; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gN1ppR9I"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47f752b3423so1710257f8f.3
        for <linux-tegra@vger.kernel.org>; Tue, 21 Jul 2026 03:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784628675; x=1785233475; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YO6b60GQ3bsYe+qXNMrvYgPe+I4qfLlasxD+4tqSZmI=;
        b=gN1ppR9IPHgtL2McfSJ+3GKE5T7sM6OzatpUvDUYuKVFaOdvVH4Jcy8Jxs76Q1IA8l
         fM6+QipcesWwt2sm98AeJnGNPhulyFb8IpHZFAnt+vDBlU7DleBvvCaZ8nuC82u4s2ei
         6yp6OZwtt9J8TALJeT0DNnFh4smTsAD1EGLrkDXyDqfCYXz5tdAheTqMYbxA2NAqibvb
         Q9tEDb6SJMRvpfpZkuVHJVaL8Kg8eUCX8kP2oKE7cAgvz9AblOMb5fQpqwfAIqZV4i8X
         I6VNVXs4/Pv45sGYXbuXLw/wOEOzw0muXlDO8bTd7myvW0til/aOAsp/M9UiPeTwlGTs
         NxcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784628675; x=1785233475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YO6b60GQ3bsYe+qXNMrvYgPe+I4qfLlasxD+4tqSZmI=;
        b=VAv9BkGlAIKfpn4Du0470ZVnFgRE56a6vOb+uIxX6JqI/KxB2bTXD4nhXuCvOXIEuf
         jB5+eb2gazVzdpkSyOKBaiOdlGrTmUuIaOudaECqM3BG9kuFYirTVjjRPz5az4+q7o1y
         rGC64d2VK9lntTXXyQokJy7QZ4JIj4xQ7PFHs58xjZPTNaGjv4C8n7/yaMArKyKI+voK
         2yKl/Ngsj08DOLdfzAvNN3ZV4JqqKnNmibwig3il7gSvm2E1TGMzQ49xAKBxio3datjr
         ZHtxFvvkak15uWkTzhRUDmCJw6x+YKwI4B6LBxDZOJLwL4C3eI0/BkUxft6Pk1CMcPxX
         P/EQ==
X-Forwarded-Encrypted: i=1; AHgh+RoIFJzJ/lQ5maj+Qaqmjrvuocer+q74qbb0WvcA9/D+flkIdM4JPK6QfXrBJoH3212LcfULhMxI/A/KNg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu7FH52FtTbhe/ALOVubj3fzbJitIXKsn5LYcTGJ+X9gTt0wYK
	v2m7yEBC/vkxnb/vXbmu+uLlhNanP5H2/p02fbLoC5Y2M+2LtkhtyFVB
X-Gm-Gg: AfdE7cn3hZJ4BXRmsLRl0WiEH+ZnTCfhmhu+uatIii9o4OySxfQJKXLgjI6/4De9caZ
	Z6sQszxlVO8xr4EFTh9jZnzivy47Ocqi3s4Nvu5by0hMykhDVIBxIp+Udc+w0AvDdlJbVhUT2tE
	Hru/tUjSS/lVnhYIy6GnWS6yLHuhtEBAmS4LVTQtVFzjvv7YJZObxNuDytAdEeM/EwYVOl3rigM
	qUQ+BbuOkHkAppQIoGrbJxQCeSJI9eKfK40yRTXOCVQFaZzUDQOkV97Dg8QtUJ96v9wUCWKivDz
	rWLr6LpXEeetUQFUdessFKq045m/u7WVv36AkzZ11GzMfEKQCrxHi5Ue9jO18tyKVG4kkGn1LAQ
	BWWLImGC1igPYFYbtciq/7pcc4f3ZNFUffJi8Fr63AiGgUmSWzkspNBa4Jr0beAHiye8t72Y7QS
	I2xWglE+3+Bccy4vIjKFh0DVI=
X-Received: by 2002:a05:600c:4708:b0:495:518a:d95a with SMTP id 5b1f17b1804b1-495518adb95mr164895505e9.29.1784628674630;
        Tue, 21 Jul 2026 03:11:14 -0700 (PDT)
Received: from xeon ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956547319dsm57127085e9.5.2026.07.21.03.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:11:14 -0700 (PDT)
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
Subject: [PATCH v2 05/10] ARM: tegra: tf701t: Add thermal zones for nct1008 sensor
Date: Tue, 21 Jul 2026 13:10:54 +0300
Message-ID: <20260721101059.451699-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260721101059.451699-1-clamor95@gmail.com>
References: <20260721101059.451699-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ASUS TF701T has an additional thermal sensor for more accurate readings.
Add thermal zones for this sensor.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../boot/dts/nvidia/tegra114-asus-tf701t.dts  | 83 +++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
index a27d3c4f2c63c..83f8dd84d28a2 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
+++ b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
@@ -4,6 +4,7 @@
 
 #include <dt-bindings/input/gpio-keys.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/thermal/thermal.h>
 
 #include "tegra114.dtsi"
 
@@ -2682,4 +2683,86 @@ vdd_1v8_touch: regulator-touch-vio {
 		enable-active-high;
 		vin-supply = <&vdd_3v3_sys>;
 	};
+
+	thermal-zones {
+		/*
+		 * NCT72 has two sensors:
+		 *
+		 *	0: internal that monitors ambient/skin temperature
+		 *	1: external that is connected to the CPU's diode
+		 *
+		 * Ideally we should use userspace thermal governor,
+		 * but it's a much more complex solution. The "skin"
+		 * zone exists as a simpler solution which prevents
+		 * Transformer from getting too hot from a user's
+		 * tactile perspective. The CPU zone is intended to
+		 * protect silicon from damage.
+		 */
+
+		nct72-skin-thermal {
+			polling-delay-passive = <1000>; /* milliseconds */
+			polling-delay = <5000>; /* milliseconds */
+
+			thermal-sensors = <&temp_sensor 0>;
+
+			trips {
+				skin_alert_trip: skin-alert {
+					/* throttle at 57C until temperature drops to 56.5C */
+					temperature = <57000>;
+					hysteresis = <500>;
+					type = "passive";
+				};
+
+				skin-crit {
+					/* shut down at 65C */
+					temperature = <65000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map-skin {
+					trip = <&skin_alert_trip>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+		nct72-cpu-thermal {
+			polling-delay-passive = <1000>; /* milliseconds */
+			polling-delay = <5000>; /* milliseconds */
+
+			thermal-sensors = <&temp_sensor 1>;
+
+			trips {
+				cpu_alert_trip: cpu-alert {
+					/* throttle at 75C until temperature drops to 74.5C */
+					temperature = <75000>;
+					hysteresis = <500>;
+					type = "passive";
+				};
+
+				cpu-crit {
+					/* shut down at 105C */
+					temperature = <105000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map-cpu {
+					trip = <&cpu_alert_trip>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+	};
 };
-- 
2.53.0

