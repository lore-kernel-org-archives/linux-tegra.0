Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795378488;
	b=i2aB/jE970tVBk4wMLvNKemDdmGzPKchbg/AMBXgpBocSre3nUs2UZffeOIYcFCOyws1
	 d//dMtbz5KHxnyqQfPtI13LWBWZ1rou1NNkOAoeut+hJp41SuWn9BPTuF9EuSCPDwr7I3
	 Q+Jbz71rYTiJIh2P49lxUW6p3IRRfIB3U1HJdEjGiA5/VZ02HV3tnybnNaD774TYqucyL
	 nGF3OhBmF+eUyFZx6vmW/U3oRLOgoAJAJhcP/WNqBcm1UMRIHyUsWQniaWkYBhpaOWfDt
	 OFCvEHGlcthBDEOl8qFL2vCusYuGEQef72Ez9W10aqbiW7vu99JnGrC1KS6M+ld3jiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795378488;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qzgTBfgxIfUP5W7y/eXEWnvcFhXPlfOZGJqPedmbfKI=;
	b=BtmtnE3idoY2FbsR/y8cn910fl5wx3H+feWpVdvdrb1gQ258FHDJXps8f91ipyX/pi4p
	 M+il0mbFztFMaHohTEnUqQZ4MehAWm4WeFSBE65NvrJMr10XGkLq2OAsGGNcH4TV4lk7K
	 yLqdfnFGdotC5kD7LX2ZOOGNGV6GAIgKvjB49ikrtvSf+NYrQXvH2cj2Vt7GJqb4XrVI7
	 lT9axzCjOzv+A3XjjPmOP30YiCCSRVUZEheY/Jlrn8x+Rg5KR5WTYeEkLKj070T8PXnH0
	 MFC1tOB/pXR2krrUXIZCRo12YZ/vPmXPXl4Wtw9SOKYVWBzUzyZeDhWiuj5lyBIxC6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DoI2Aywa;
	arc=none smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B61F606A33C
	for <linux-tegra@vger.kernel.org>; Sun, 22 Nov 2026 20:14:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B61F606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DoI2Aywa
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b8c60e0d39so3231068a12.2
        for <linux-tegra@vger.kernel.org>; Sun, 22 Nov 2026 12:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795378487; x=1795983287; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qzgTBfgxIfUP5W7y/eXEWnvcFhXPlfOZGJqPedmbfKI=;
        b=DoI2AywanOkTCcmIL9RteRdrA8iencCXt5BORqBbjeF/aQe3YOz5KZ+oPsQLZkqhLY
         7jPMKjFOYN39WbScEPYG5GaWztTBBc7qW6RoAOnpFqYFRHgAVR0R8h1BpBWug86oP5AA
         iVXFk00n3wJw+JEn0LMJDYFKCicaTA/eeZTKOtDXLAaA0vvZ78dhTAkSLU86/j5vjq9O
         /NvkJU3dIX4fTb4zGf47qyET+ypuP5MVAVeHcLeExijC87ClmXzuMNRDzUrqlESQ0W0m
         rt3BsUidLg8dXW4tQKzIe98w3vVU5QxAZDOJYUX7NUF+SjQYQqc5Ww6EvNwQNjt0eKkD
         yKoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795378487; x=1795983287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qzgTBfgxIfUP5W7y/eXEWnvcFhXPlfOZGJqPedmbfKI=;
        b=Wm3C84sETNCU3puoSglvJo5HurFGLf4ZUDv71hcPduQB9cgNIpve+tFzvq+toF300P
         mUt0hQe5JlDy0ukg1FaxNVJQ/p3lVr/SC1mtI8Upanda5TAoflaxYqkSmuCiCTwiKPoq
         Zvs8Ed3ckCaFCZ3VGhjH2B4gO/Y687neEi9/OWrzhn8a5IiiHGgyUUYcqzqBOgz86dBc
         vl+r9k5zmBBkuDqbMicfdWN32+Y7s1uLDi44HytKGaBeSacAl3Zjtf0X491ivFAts2S5
         NUN6SE0TZIchFLCJA2ly4Mm2qOuxfwunoegfgnQCBCDKD8T5gbHJWNOqSAGubyQVpDcT
         5VNg==
X-Forwarded-Encrypted: i=1; AL+hErFEShy5o027lgaSeJuum4gzicB4Cih8kkE+zFZMloT/LSHnKUm7vd3I8lgKzjHUp/065SKiLEIxkx23VQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9XHcFfSIz/weQNt4h3XZL9IeAcGNyODoUAcB1EE/Vh2EWfLsFz
	fy2RQDgdSqp9RLCYKK+9qFv/HKZdDtHBMLG/RJMGurEmoZS2YRfa0hTT
X-Gm-Gg: AZFdTZccUxriYtktxNw1doIv53VTB+5wd3LuFIR8SWJOGU/SIcAgKZzCDwjY4lLmkL5
	jEVW+VWxAoPYJdcFyjGvovV/Z04xglYqPBZqRnOckAfuQ5e7O5ihst1JtAQDtJliLo6h19ss/2M
	TAKPEEqEN2xSRMbAZ9nMIA6V60al3CZgRlE8q3VW5y1ARXVcssxLR46nKfBlM1gNLScBnXPyR9n
	GIMBVScO3MW3Uo8IfPXSzOCiTO+lkuMYuUreqekMxjTVa8u4HKPDU0mfjv1SqaKZKtYDLwpgRos
	/dBpJK6ji306VVH6h9n0DGNByaW6mHesA77KKbf/hjYr238D/QYM1sJr/V86oidQICWd1QMVRxx
	+MGze74zvSyw0cv0IP/bw5XwF7Fe6kIMih33B/9MVxIXMRFNewFBQGqN818pxfqnQXrG+Jx3np0
	14HWgibcglZLV/HTNRsD6WDIZWlLMbLqt9FRh67MQ4Pb3KpYjscCL8ruPjdEy/bDNPKmNewQf++
	U/5ltY4X03wlxOUPUbzOFfLj2sKmZwtUqMGY9XV5nhAXtrZ49kMJI7vntdcQ6c2s9SyWxm+s9Ki
	rAqiFOdkU6yIvnMHSF5Uo2n4N7TW2N2ipwpnadaiYoR3OFE1GKjVnCutp4cTwjuN7jZA4pTNuF9
	8OPwCHgQxpg==
X-Received: by 2002:a05:6402:23d0:b0:6b7:a2d1:b2e8 with SMTP id 4fb4d7f45d1cf-6ba37e69e00mr5979617a12.17.1795378486939;
        Sun, 22 Nov 2026 12:14:46 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fa8basm4424074a12.20.2026.11.22.12.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 12:14:45 -0800 (PST)
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
Subject: [PATCH v1 09/18] ARM: tegra: tegratab: Add thermal configuration
Date: Sun, 22 Nov 2026 22:13:58 +0200
Message-ID: <20261122201407.23742-10-clamor95@gmail.com>
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

Add thermal monitoring setup based on Palmas GP ADC sensors.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../tegra114-nvidia-tegratab-common.dtsi      | 126 ++++++++++++++++++
 1 file changed, 126 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
index bb5788b2539cd..cbf9b45284033 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
@@ -1,6 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/thermal/thermal.h>
+
 #include "tegra114.dtsi"
 
 / {
@@ -983,6 +985,9 @@ fuel-gauge@36 {
 			monitored-battery = <&battery>;
 			power-supplies = <&bq24193>;
 
+			io-channels = <&thermistor>;
+			io-channel-names = "temp";
+
 			maxim,alert-low-soc-level = <10>;
 			maxim,double-soc;
 
@@ -1011,6 +1016,21 @@ usb_otg_vbus: usb-otg-vbus {
 		};
 	};
 
+	i2c@7000c400 {
+		status = "okay";
+		clock-frequency = <100000>;
+
+		power-sensor@44 {
+			compatible = "ti,ina230";
+			reg = <0x44>;
+
+			shunt-resistor = <5000>;
+
+			vs-supply = <&vdd_3v3_sys>;
+			#io-channel-cells = <1>;
+		};
+	};
+
 	i2c@7000d000 {
 		status = "okay";
 		clock-frequency = <400000>;
@@ -1025,6 +1045,21 @@ palmas: pmic@58 {
 
 			ti,system-power-controller;
 
+			palmas_gpadc: adc {
+				compatible = "ti,palmas-gpadc";
+
+				interrupt-parent = <&palmas>;
+				interrupts = <18 IRQ_TYPE_NONE>,
+					     <16 IRQ_TYPE_NONE>,
+					     <17 IRQ_TYPE_NONE>;
+
+				ti,channel0-current-microamp = <5>;
+				ti,channel3-current-microamp = <400>;
+				ti,enable-extended-delay;
+
+				#io-channel-cells = <1>;
+			};
+
 			palmas_extcon: extcon {
 				compatible = "ti,palmas-usb-vid";
 
@@ -1546,4 +1581,95 @@ vdd_3v3_com: regulator-com {
 		enable-active-high;
 		vin-supply = <&vdd_3v3_sys>;
 	};
+
+	thermistor: thermal-sensor-thermistor {
+		compatible = "generic-adc-thermal";
+		#thermal-sensor-cells = <0>;
+
+		io-channels = <&palmas_gpadc 1>;
+		io-channel-names = "sensor-channel";
+		#io-channel-cells = <0>;
+
+		temperature-lookup-table = <
+			(-40000) 2726  (-35000) 2708  (-30000) 2683  (-25000) 2649
+			(-20000) 2605  (-15000) 2547  (-10000) 2475   (-5000) 2386
+			       0 2279      5000 2154     10000 2012     15000 1857
+			   20000 1691     25000 1521     30000 1351     35000 1187
+			   40000 1032     45000  889     50000  761     55000  648
+			   60000  549     65000  464     70000  392     75000  330
+			   80000  279     85000  235     90000  199     95000  168
+			  100000  143    105000  121    110000  103    115000   88
+			  120000   76    125000   65 >;
+	};
+
+	tdiode: thermal-sensor-tdiode {
+		compatible = "generic-adc-thermal";
+		#thermal-sensor-cells = <0>;
+
+		io-channels = <&palmas_gpadc 3>;
+		io-channel-names = "sensor-channel";
+		#io-channel-cells = <0>;
+
+		// TODO: add a table here -25C to 125C
+	};
+
+	thermal-zones {
+		thermistor-thermal {
+			polling-delay-passive = <1100>; /* milliseconds */
+			polling-delay = <15000>; /* milliseconds */
+
+			thermal-sensors = <&thermistor>;
+
+			trips {
+				thermistor_trip: thermistor-alert {
+					/* throttle at 55C until temperature drops to 53C */
+					temperature = <55000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				thermistor-crit {
+					/* shut down at 60C */
+					temperature = <60000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map-thermistor {
+					trip = <&thermistor_trip>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+		tdiode-thermal {
+			polling-delay-passive = <1100>; /* milliseconds */
+			polling-delay = <15000>; /* milliseconds */
+
+			thermal-sensors = <&tdiode>;
+
+			trips {
+				tdiode_trip: tdiode-alert {
+					temperature = <60000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+			};
+
+			cooling-maps {
+				map-tdiode {
+					trip = <&tdiode_trip>;
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

