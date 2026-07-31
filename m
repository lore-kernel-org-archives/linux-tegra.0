Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B21C4052AF
	for <linux-tegra@vger.kernel.org>; Fri, 31 Jul 2026 11:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785498093; cv=none; b=GhJmBr12EQhgfORWAJ7Hgx/+jnMqrz/YTnW0OBRsc0la5+xG6aenbbwJN+i4FCg0e03grqdWjNUUIUqbJ2fbMu8T3oQmTYG/35kRKfiC0nZhAKu5Wm4zVX9KqR85wHICwcap9tEY6d3BqqMSauDMmIy0ldnYhlKchR+iCjy2Evo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785498093; c=relaxed/simple;
	bh=Z/sCrcKCh/2gU+SYLTOXEEz//XwPExhekseAPMBAlFQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TNXTS2r8Jbhh8X+VBkc6k1pZ4hPD+vMtZYT1n0UBJtWmDyQKrnjMqO71IeuwqZkVtB8VuRz+TSK4sHcGB4EmrgsGWW7L+nR5avBNxQwjEB3fLDI6AVO2vIHuAZt5fMtqOo4553U+qiFT7wa1WvpDBb2p5btF1Vr5xRRLbyeOGc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=edP6n+09; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="edP6n+09"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47de008b020so597116f8f.1
        for <linux-tegra@vger.kernel.org>; Fri, 31 Jul 2026 04:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785498089; x=1786102889; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C9dkGnY8mc+kYXbPp1uA1khp0mikRrvBv8an20X35B0=;
        b=edP6n+09b6K6rAlnRIvE5dTKYhM5cK2LW06lnqFJaelxRp0QWg4oSwrxZE27pUSQLr
         sIFTkzDJwvRrnd9pIYOs8tGkBMJzw01K3UQcfSct0jiDP7ugbC26mXbhf2Qm+zbOErpr
         SvXA4zD5dLJvi7H0bmRRN+Xbsj0oJVj1cMJr+UHWMEHOeJFR1mi5T97MCCg08N59dxKM
         aG/1vpPd2T3XJALvmCfPUG/ocyJtEgas7YrgHsNwTvp60QShh+Iqj9XT2NDaAuOLFZJf
         8zZG/fmlN9hZgY/wQuIFp4rSy82hI1TtdupMkQ6eLWhwI+U8nbd2o56vbtJ5tvY2XpBJ
         P4Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785498089; x=1786102889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C9dkGnY8mc+kYXbPp1uA1khp0mikRrvBv8an20X35B0=;
        b=RMl0qWbZHPL37TXAQwxiGeGXj/0tCmV9EjSWUKtgM30HALDhywOtdq+oBKgY9HkPHc
         gol5nFTSEmR4KuECyYR0ETvUm6DDgZ2E6+nzlG3GOYNIaYmOQzXR8cmWmwlLHr0vLR3C
         TQ0gr55ah/RhAK/3EiCjUD5vpnbEruoaPPlKVzJCSOZQm5flZmgCzTpr2lcZa5cVaaMS
         G88iqAc2H/1bkD9X6qc/yGpHiV8kI36tw1p51io16iM9YWDNCUAx4O6ET2yZhM22v8V0
         slgbij8+qJuG+ktmr56GoG9Zg9r78txd9cI9WyPZ3Q361O+tkbPQQeBk0SGND7y5KgeP
         m+Fg==
X-Forwarded-Encrypted: i=1; AHgh+RoiL6iqbGCXm4fFXyuitXiTddIoKHqK3ZRRUBqJ15nCHU+DIgTD8RLtc+zsjsXXpTHTAYvVhtPprVw0EA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwuDTxGvkb3lGqQk14k+xw+3IcNqYO0OR8kZOV3rkNRa0fdjLYx
	zJSdG7zo38fgfsYiHxgRfTznIQXa+327LK21XYlgNirvh+a9kuzILoVh
X-Gm-Gg: AR+sD111TkXLQ+g8stOckqUbJC6XOKqNfd3EN56JlHwp/hm1Vfx6iEwTH48o9vSQsSJ
	H4xcNracHXPD950Bi+n/ejHZBWNrcuDePcM0nSQCunz15tyXQgYJWr53aTb8IQwvkdxKGQZU6+1
	bHJDchKuO7Jl2t4JAVnbUGp3AfFPa59QXvv7Wms8uFbmKXE3vb67v9dvIqBEApP0vyzCAX0qMvR
	f75qo76ZU0BGfo71JSoM+B5PveyxGylj29jvruph7TCoP/FPNoRUeXGmmUOMc43hF08Qgubz7bj
	mwdJHRSN/urnKwmKuCNGjQ9GjXQANXqktA710uqlkSZw9e5oQiup9iX1BIyJW+ZGy+QR0Xu2M08
	bt148cEfXZgoGmWP2/27MAAFJHtbQClZIKvktKcSGrpNvpKPJGs1HeVzAlG27FuJueO+70tkc+f
	wBnxAo2xwUPxXloaLlXSLv1ZiBsUkczUZOGg+RwqXq14utRF1u5nFOMHi/VhWDSjXWhXOYKcxqv
	Bhy1Uf+C+aHXKjnjDJq
X-Received: by 2002:a05:6000:4811:b0:47f:83cb:acfc with SMTP id ffacd0b85a97d-47fd3306867mr3527217f8f.31.1785498089462;
        Fri, 31 Jul 2026 04:41:29 -0700 (PDT)
Received: from xeon ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41d0064sm3769336f8f.5.2026.07.31.04.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 04:41:28 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 05/10] ARM: tegra: tf701t: Add thermal zones for nct1008 sensor
Date: Fri, 31 Jul 2026 14:41:01 +0300
Message-ID: <20260731114106.169398-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260731114106.169398-1-clamor95@gmail.com>
References: <20260731114106.169398-1-clamor95@gmail.com>
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
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
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

