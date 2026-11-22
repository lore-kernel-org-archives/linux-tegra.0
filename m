Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795378499;
	b=UHR+najB/k4P7DLxmlBWV69Fws5cir+BtKF6o7LWFbEzZjo7ks+MudLg2HRxp+TUuV9A
	 nmzT/eL7u4PswHl5d7bfY0ghnzbI9tlrBqRlecqo19UHJlGX9ShB40673hfBpFm2yZEY5
	 ya+5rXK0EGvjAwJmZFcp+ZgWEmn1LRLkF1xdHiDOOIp40gw0KxB9LMODWQOoGC3Rm6JFA
	 YlEtYkHkB+6fo7ksdjtAooILUEjfeYPvOoZY6869TgCUwYW+4ZHE4Rl5o/R5pEAL8zg45
	 FuZ0VXxQBkiGysMQ/yd1PugbMDZa9ejX6a2Uugb81BBhBygMZX7QTRhunfjkb8SfADw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795378499;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3p4/KGeB58Qo1s14oTzVJ2u2Rw2mwIbY9xybY0OFo8c=;
	b=WT2NtmnjrXq7jW3D6LlDPY1f7zAqT5nr5bqiS3s8+bjRtBduYnFWchYqfRrNASDNIWYj
	 HIPhYtscIfR2c0f31YEASQ0ZJ4Zf9hHKJ76DH0EZ0qaX4Cz+sBdfe7yi9YGG0+PGhtR6x
	 zCJy3x2mT4Ei7u2Z8uyhBKBT1JExAiVJ753JxeuiHSxEI6dqO/sCauizeuXWnvRLDLViI
	 QQr+EgJzZcUT5cJRDoFxP7XMsmFulvn3I7F8obaFIKW6B091LCm9fbz6osm5ZG0hdtJp7
	 obMlPR/jutU4T+R+aHdSAoH5TtEMUxEDClb1QD7cBfygCS9uy6ou3kF8j2mHks0paqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="r/VR9Sy4";
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98456606A680
	for <linux-tegra@vger.kernel.org>; Sun, 22 Nov 2026 20:14:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98456606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r/VR9Sy4
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c50ac25cdd4so356792666b.1
        for <linux-tegra@vger.kernel.org>; Sun, 22 Nov 2026 12:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795378496; x=1795983296; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3p4/KGeB58Qo1s14oTzVJ2u2Rw2mwIbY9xybY0OFo8c=;
        b=r/VR9Sy4QffKiOMJea+A8bxit/3zl8vyTq4wS37BZUXfDtFh2fi1S34tznJE/HHcW+
         5lzsLBl7T5uQg6WHKjfHdEllGbjLZXuaFzQKwgrPtK0BUeiN2M0PnL2eG3WdOIVVGp7c
         t6IE5DZZOUib4S1vkIzraRnmhd+bUbzCyTJ6etVdRcITOMLwoSLN7yhyL0hD6K40VZSI
         XU0tHJI7Rrb4+Bu6vJ2vLbDjlfV7t+pd35xGvir7YGUm7QbXhkx2GQSrFTSGABJ/mYmR
         A55JwLmahlqUeifK6phib50mNUJ7vXxF2qJSc9KVkml8VnlwWp5hSHud3I/5HPA6JeaG
         bNqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795378496; x=1795983296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3p4/KGeB58Qo1s14oTzVJ2u2Rw2mwIbY9xybY0OFo8c=;
        b=dOWUDgAqQHusrqOrgtV42aPSZY/rjDcnlel3QwvCmnOoPwXcCp+k/E5BDAIPOMTpxr
         TAnntJ18pwvdb2Q0DIIdU8gJMj5xBDk7bORAUEvw7/o4wdHdD85GwTm+AXB+7vIPcHVL
         bOxv72Oq3HyvMp/ZdX9Nw8jIXJX3xrW/LR0oFxSrWtDCeRjEGGd+AKKjxOZ65sbdOXUB
         KqdZsvFEIRyotIWksKJ7zz4HDtXcqyL/4xqplTc5RLBD2YoBLE+CTleGTGa5vi3YqIFE
         Nj85PNepQxhkSQFQNVSfxvgs1HxGQHNKBCiINJXObv3qPlfbGNE5f9W5uu2qDhK7q+tI
         7RRA==
X-Forwarded-Encrypted: i=1; AL+hErE4V4fMx9hP7Sxtzvj7Z46M9Hq6P9qjve0/50He2qlA9gUVaB6FsbPFBDhq/vBjDtuklcf/QLp/V8+c6A==@vger.kernel.org
X-Gm-Message-State: APuU4Z+zy5SHTigj3Wbn7PTGmy5NmgAa3fKef6OM+G99z47WxIln2q2j
	iecHtDk/SKXBTEsDQx22LBj7DrVJc+06MkuyndN/pI5hln5+OH2jS4bs
X-Gm-Gg: AZFdTZcj/jkcPc4tn6B26xIrUjTcXMzUGCYWD3sPjmInBma4vq4r/QkM7X8NBFS4bWH
	Y8XNjNKkmaQNyh2zPBEf/5s5C5xuNbD9t+tfp93wCQeffvgmjRSW85Wr/A3vWsGn0z0wOIaHjDb
	y21YAOadPuNd19CiwrVZHc7z1iWLuWCgYeypxdwVaMEv4F2xAy4j+rvutYkHK0EoI87s6vR9Tvo
	s2HSzTO4/n4/dsJsyGyJIxsKMUXVn1y0tsnF2DasvEqkTWVOXw8lTgRWvkVFqy2fY3XrTsCsYTJ
	yewvQxGvQEaxmq9XmRPshqm//GdUgQslBa/cTs32LaAxzeU2tLEzeQYnbi7JN/skodcjOU05lPQ
	XPOWszQDV79wMKpADrE+qJYdBKeGT3DWdN1Yx5mH63AdcLk+3bzh3f6Jw5zIFk4sWatdpbMjPyl
	L0E5sy4gJClps2mQkD64MnnvnKfiN9p4Nil2/lRiP6cC3rQQvRPRMH5iApQrWPD5YAtQ5njaC4J
	Zkl640+uSruxrsOjnncsYM1Bw/egSUfDXCKeff/VEBkemNpSZ/s0xYqxtTp8UJGSJDbNmDqlqIQ
	vEFo2EM/tH2wBjtSbr4iT5xZoOCj6LVbhpblkXba9LwXR63oFmEHjGxJvmlboyxrUlNfvQZSLOd
	GtFmWq7V1dQ==
X-Received: by 2002:a05:6402:5cd:b0:6ba:4be1:9698 with SMTP id 4fb4d7f45d1cf-6ba4be1a024mr5389065a12.7.1795378495562;
        Sun, 22 Nov 2026 12:14:55 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fa8basm4424074a12.20.2026.11.22.12.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 12:14:54 -0800 (PST)
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
Subject: [PATCH v1 13/18] ARM: tegra: tegratab: Add MC and EMC timing nodes
Date: Sun, 22 Nov 2026 22:14:02 +0200
Message-ID: <20261122201407.23742-14-clamor95@gmail.com>
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

Configure Memory Controllers of Tegra Note 7.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../tegra114-nvidia-tegratab-common.dtsi      |  732 +++++++++
 .../nvidia/tegra114-nvidia-tegratab-p1640.dts |  574 +++++++
 .../nvidia/tegra114-nvidia-tegratab-p1988.dts | 1348 +++++++++++++++++
 3 files changed, 2654 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
index c839e6159de5b..42a10ec5ad4ee 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
@@ -68,6 +68,156 @@ panel@0 {
 		};
 	};
 
+	clock@60006000 {
+		emc-timings-0 {
+			nvidia,ram-code = <0>;
+
+			timing-12750000 {
+				clock-frequency = <12750000>;
+				nvidia,parent-clock-frequency = <408000000>;
+				clocks = <&tegra_car TEGRA114_CLK_PLL_P>;
+				clock-names = "emc-parent";
+			};
+
+			timing-20400000 {
+				clock-frequency = <20400000>;
+				nvidia,parent-clock-frequency = <408000000>;
+				clocks = <&tegra_car TEGRA114_CLK_PLL_P>;
+				clock-names = "emc-parent";
+			};
+
+			timing-40800000 {
+				clock-frequency = <40800000>;
+				nvidia,parent-clock-frequency = <408000000>;
+				clocks = <&tegra_car TEGRA114_CLK_PLL_P>;
+				clock-names = "emc-parent";
+			};
+
+			timing-68000000 {
+				clock-frequency = <68000000>;
+				nvidia,parent-clock-frequency = <408000000>;
+				clocks = <&tegra_car TEGRA114_CLK_PLL_P>;
+				clock-names = "emc-parent";
+			};
+
+			timing-102000000 {
+				clock-frequency = <102000000>;
+				nvidia,parent-clock-frequency = <408000000>;
+				clocks = <&tegra_car TEGRA114_CLK_PLL_P>;
+				clock-names = "emc-parent";
+			};
+
+			timing-204000000 {
+				clock-frequency = <204000000>;
+				nvidia,parent-clock-frequency = <408000000>;
+				clocks = <&tegra_car TEGRA114_CLK_PLL_P>;
+				clock-names = "emc-parent";
+			};
+
+			timing-312000000 {
+				clock-frequency = <312000000>;
+				nvidia,parent-clock-frequency = <624000000>;
+				clocks = <&tegra_car TEGRA114_CLK_PLL_C>;
+				clock-names = "emc-parent";
+			};
+
+			timing-408000000 {
+				clock-frequency = <408000000>;
+				nvidia,parent-clock-frequency = <408000000>;
+				clocks = <&tegra_car TEGRA114_CLK_PLL_P>;
+				clock-names = "emc-parent";
+			};
+
+			timing-624000000 {
+				clock-frequency = <624000000>;
+				nvidia,parent-clock-frequency = <624000000>;
+				clocks = <&tegra_car TEGRA114_CLK_PLL_C>;
+				clock-names = "emc-parent";
+			};
+
+			timing-792000000 {
+				clock-frequency = <792000000>;
+				nvidia,parent-clock-frequency = <792000000>;
+				clocks = <&tegra_car TEGRA114_CLK_PLL_M>;
+				clock-names = "emc-parent";
+			};
+		};
+
+		emc-timings-1 {
+			nvidia,ram-code = <1>;
+
+			timing-12750000 {
+				clock-frequency = <12750000>;
+				nvidia,parent-clock-frequency = <408000000>;
+				clocks = <&tegra_car TEGRA114_CLK_PLL_P>;
+				clock-names = "emc-parent";
+			};
+
+			timing-20400000 {
+				clock-frequency = <20400000>;
+				nvidia,parent-clock-frequency = <408000000>;
+				clocks = <&tegra_car TEGRA114_CLK_PLL_P>;
+				clock-names = "emc-parent";
+			};
+
+			timing-40800000 {
+				clock-frequency = <40800000>;
+				nvidia,parent-clock-frequency = <408000000>;
+				clocks = <&tegra_car TEGRA114_CLK_PLL_P>;
+				clock-names = "emc-parent";
+			};
+
+			timing-68000000 {
+				clock-frequency = <68000000>;
+				nvidia,parent-clock-frequency = <408000000>;
+				clocks = <&tegra_car TEGRA114_CLK_PLL_P>;
+				clock-names = "emc-parent";
+			};
+
+			timing-102000000 {
+				clock-frequency = <102000000>;
+				nvidia,parent-clock-frequency = <408000000>;
+				clocks = <&tegra_car TEGRA114_CLK_PLL_P>;
+				clock-names = "emc-parent";
+			};
+
+			timing-204000000 {
+				clock-frequency = <204000000>;
+				nvidia,parent-clock-frequency = <408000000>;
+				clocks = <&tegra_car TEGRA114_CLK_PLL_P>;
+				clock-names = "emc-parent";
+			};
+
+			timing-312000000 {
+				clock-frequency = <312000000>;
+				nvidia,parent-clock-frequency = <624000000>;
+				clocks = <&tegra_car TEGRA114_CLK_PLL_C>;
+				clock-names = "emc-parent";
+			};
+
+			timing-408000000 {
+				clock-frequency = <408000000>;
+				nvidia,parent-clock-frequency = <408000000>;
+				clocks = <&tegra_car TEGRA114_CLK_PLL_P>;
+				clock-names = "emc-parent";
+			};
+
+			timing-624000000 {
+				clock-frequency = <624000000>;
+				nvidia,parent-clock-frequency = <624000000>;
+				clocks = <&tegra_car TEGRA114_CLK_PLL_C>;
+				clock-names = "emc-parent";
+			};
+
+			timing-792000000 {
+				clock-frequency = <792000000>;
+				nvidia,parent-clock-frequency = <792000000>;
+				clocks = <&tegra_car TEGRA114_CLK_PLL_M>;
+				clock-names = "emc-parent";
+			};
+		};
+	};
+
 	vde@6001a000 {
 		assigned-clocks = <&tegra_car TEGRA114_CLK_VDE>;
 		assigned-clock-parents = <&tegra_car TEGRA114_CLK_PLL_P>;
@@ -1393,6 +1543,580 @@ i2c-thermtrip {
 		};
 	};
 
+	memory-controller@70019000 {
+		emc-timings-0 {
+			/* Micron MT41K128M16-125 DDR3 792MHz */
+			nvidia,ram-code = <0>;
+
+			timing-12750000 {
+				clock-frequency = <12750000>;
+
+				nvidia,emem-configuration = < 0x40040001 0x8000003f
+					0x00000001 0x00000001 0x00000002 0x00000000
+					0x00000001 0x00000001 0x00000002 0x00000008
+					0x00000002 0x00000001 0x00000003 0x00000006
+					0x06030102 0x000a0402 0x77e30303 0x001f0000 >;
+			};
+
+			timing-20400000 {
+				clock-frequency = <20400000>;
+
+				nvidia,emem-configuration = < 0x40020001 0x80000046
+					0x00000001 0x00000001 0x00000002 0x00000000
+					0x00000001 0x00000001 0x00000002 0x00000008
+					0x00000002 0x00000001 0x00000003 0x00000006
+					0x06030102 0x000a0402 0x75430303 0x001f0000 >;
+			};
+
+			timing-40800000 {
+				clock-frequency = <40800000>;
+
+				nvidia,emem-configuration = < 0xa0000001 0x8000005b
+					0x00000001 0x00000001 0x00000002 0x00000000
+					0x00000001 0x00000001 0x00000002 0x00000008
+					0x00000002 0x00000001 0x00000003 0x00000006
+					0x06030102 0x000a0402 0x73630303 0x001f0000 >;
+			};
+
+			timing-68000000 {
+				clock-frequency = <68000000>;
+
+				nvidia,emem-configuration = < 0x00000001 0x80000076
+					0x00000001 0x00000001 0x00000002 0x00000000
+					0x00000001 0x00000001 0x00000002 0x00000008
+					0x00000002 0x00000001 0x00000003 0x00000006
+					0x06030102 0x000a0402 0x72c30403 0x001f0000 >;
+			};
+
+			timing-102000000 {
+				clock-frequency = <102000000>;
+
+				nvidia,emem-configuration = < 0x08000001 0x80000098
+					0x00000001 0x00000001 0x00000003 0x00000000
+					0x00000002 0x00000001 0x00000002 0x00000008
+					0x00000002 0x00000001 0x00000003 0x00000006
+					0x06030102 0x000a0403 0x72830504 0x001f0000 >;
+			};
+
+			timing-204000000 {
+				clock-frequency = <204000000>;
+
+				nvidia,emem-configuration = < 0x01000003 0x800000fe
+					0x00000001 0x00000001 0x00000005 0x00000002
+					0x00000004 0x00000001 0x00000002 0x00000008
+					0x00000002 0x00000001 0x00000003 0x00000006
+					0x06030102 0x000a0405 0x72440a06 0x001f0000 >;
+			};
+
+			timing-312000000 {
+				clock-frequency = <312000000>;
+
+				nvidia,emem-configuration = < 0x0b000004 0x8000016a
+					0x00000001 0x00000002 0x00000007 0x00000004
+					0x00000006 0x00000001 0x00000002 0x00000007
+					0x00000002 0x00000002 0x00000004 0x00000006
+					0x06040202 0x000b0607 0x76e50f08 0x001f0000 >;
+			};
+
+			timing-408000000 {
+				clock-frequency = <408000000>;
+
+				nvidia,emem-configuration = < 0x02000006 0x80000190
+					0x00000001 0x00000002 0x0000000a 0x00000006
+					0x00000008 0x00000001 0x00000002 0x00000009
+					0x00000002 0x00000002 0x00000004 0x00000006
+					0x06040202 0x000e070a 0x7547130b 0x001f0000 >;
+			};
+
+			timing-624000000 {
+				clock-frequency = <624000000>;
+
+				nvidia,emem-configuration = < 0x06000009 0x80000190
+					0x00000003 0x00000004 0x0000000f 0x00000009
+					0x0000000c 0x00000001 0x00000003 0x0000000b
+					0x00000002 0x00000002 0x00000005 0x00000007
+					0x07050202 0x00130b0f 0x736a1d10 0x001f0000 >;
+			};
+
+			timing-792000000 {
+				clock-frequency = <792000000>;
+
+				nvidia,emem-configuration = < 0x0e00000b 0x80000190
+					0x00000004 0x00000005 0x00000013 0x0000000c
+					0x0000000f 0x00000002 0x00000003 0x0000000c
+					0x00000002 0x00000002 0x00000006 0x00000008
+					0x08060202 0x00170e13 0x72cc2414 0x001f0000 >;
+			};
+		};
+	};
+
+	external-memory-controller@7001b000 {
+		emc-timings-0 {
+			/* Micron MT41K128M16-125 DDR3 792MHz */
+			nvidia,ram-code = <0>;
+
+			timing-12750000 {
+				clock-frequency = <12750000>;
+
+				nvidia,emc-zcal-cnt-long = <0x00000042>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-cfg = <0x7320000e>;
+				nvidia,emc-mode-1 = <0x80100003>;
+				nvidia,emc-mode-2 = <0x80200008>;
+				nvidia,emc-mode-4 = <0x00000000>;
+				nvidia,emc-mode-reset = <0x80001221>;
+				nvidia,emc-auto-cal-config = <0xa0f10000>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mrs-wait-cnt = <0x000c000c>;
+				nvidia,emc-sel-dpd-ctrl = <0x00040320>;
+				nvidia,emc-xm2dqspadctrl2 = <0x0000a11c>;
+				nvidia,emc-zcal-interval = <0x00000000>;
+
+				nvidia,emc-configuration =  < 0x00000000
+					0x00000003 0x00000000 0x00000000 0x00000004
+					0x0000000a 0x00000003 0x0000000b 0x00000000
+					0x00000000 0x00000003 0x00000001 0x00000000
+					0x00000005 0x00000005 0x00000006 0x00000006
+					0x00000004 0x00000004 0x00010000 0x00000000
+					0x00000000 0x00000004 0x00000009 0x0000000d
+					0x0000000d 0x00000060 0x00000000 0x00000018
+					0x00000002 0x00000002 0x00000001 0x00000000
+					0x00000007 0x0000000f 0x00000005 0x00000005
+					0x00000004 0x00000004 0x00000004 0x00000001
+					0x00000000 0x00000004 0x00000005 0x00000064
+					0x00000005 0x00000006 0x00000020 0x00000000
+					0x0000aa88 0x002c00a0 0x00008000 0x0006c000
+					0x0006c000 0x0006c000 0x0006c000 0x0006c000
+					0x0006c000 0x0006c000 0x0006c000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00048000
+					0x00048000 0x00048000 0x00048000 0x001112a0
+					0x00000000 0x00000000 0x77ffc085 0x81f1f108
+					0x03035504 0x0000003f 0x20820800 0x00208208
+					0x0000003f 0x00000000 0x02000000 0x00000042
+					0x000c000c 0x00000000 0x00000000 0x800001c6 >;
+			};
+
+			timing-20400000 {
+				clock-frequency = <20400000>;
+
+				nvidia,emc-zcal-cnt-long = <0x00000042>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-cfg = <0x7320000e>;
+				nvidia,emc-mode-1 = <0x80100003>;
+				nvidia,emc-mode-2 = <0x80200008>;
+				nvidia,emc-mode-4 = <0x00000000>;
+				nvidia,emc-mode-reset = <0x80001221>;
+				nvidia,emc-auto-cal-config = <0xa0f10000>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mrs-wait-cnt = <0x000c000c>;
+				nvidia,emc-sel-dpd-ctrl = <0x00040320>;
+				nvidia,emc-xm2dqspadctrl2 = <0x0000a11c>;
+				nvidia,emc-zcal-interval = <0x00000000>;
+
+				nvidia,emc-configuration =  < 0x00000000
+					0x00000003 0x00000000 0x00000000 0x00000004
+					0x0000000a 0x00000003 0x0000000b 0x00000000
+					0x00000000 0x00000003 0x00000001 0x00000000
+					0x00000005 0x00000005 0x00000006 0x00000006
+					0x00000004 0x00000004 0x00010000 0x00000000
+					0x00000000 0x00000004 0x00000009 0x0000000d
+					0x0000000d 0x0000009a 0x00000000 0x00000026
+					0x00000002 0x00000002 0x00000001 0x00000000
+					0x00000007 0x0000000f 0x00000005 0x00000006
+					0x00000004 0x00000004 0x00000004 0x00000001
+					0x00000000 0x00000004 0x00000005 0x000000a0
+					0x00000005 0x00000006 0x00000020 0x00000000
+					0x0000aa88 0x002c00a0 0x00008000 0x0006c000
+					0x0006c000 0x0006c000 0x0006c000 0x0006c000
+					0x0006c000 0x0006c000 0x0006c000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00048000
+					0x00048000 0x00048000 0x00048000 0x001112a0
+					0x00000000 0x00000000 0x77ffc085 0x81f1f108
+					0x03035504 0x0000003f 0x20820800 0x00208208
+					0x0000003f 0x00000000 0x02000000 0x00000042
+					0x000c000c 0x00000000 0x00000000 0x8000023a >;
+			};
+
+			timing-40800000 {
+				clock-frequency = <40800000>;
+
+				nvidia,emc-zcal-cnt-long = <0x00000042>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-cfg = <0x7320000e>;
+				nvidia,emc-mode-1 = <0x80100003>;
+				nvidia,emc-mode-2 = <0x80200008>;
+				nvidia,emc-mode-4 = <0x00000000>;
+				nvidia,emc-mode-reset = <0x80001221>;
+				nvidia,emc-auto-cal-config = <0xa0f10000>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mrs-wait-cnt = <0x000c000c>;
+				nvidia,emc-sel-dpd-ctrl = <0x00040320>;
+				nvidia,emc-xm2dqspadctrl2 = <0x0000a11c>;
+				nvidia,emc-zcal-interval = <0x00000000>;
+
+				nvidia,emc-configuration =  < 0x00000001
+					0x00000006 0x00000001 0x00000000 0x00000004
+					0x0000000a 0x00000003 0x0000000b 0x00000000
+					0x00000000 0x00000003 0x00000001 0x00000000
+					0x00000005 0x00000005 0x00000006 0x00000006
+					0x00000004 0x00000004 0x00010000 0x00000000
+					0x00000000 0x00000004 0x00000009 0x0000000d
+					0x0000000d 0x00000134 0x00000000 0x0000004d
+					0x00000002 0x00000002 0x00000001 0x00000000
+					0x00000007 0x0000000f 0x00000007 0x0000000c
+					0x00000004 0x00000004 0x00000004 0x00000002
+					0x00000000 0x00000004 0x00000005 0x0000013f
+					0x00000005 0x00000006 0x00000020 0x00000000
+					0x0000aa88 0x002c00a0 0x00008000 0x0006c000
+					0x0006c000 0x0006c000 0x0006c000 0x0006c000
+					0x0006c000 0x0006c000 0x0006c000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00048000
+					0x00048000 0x00048000 0x00048000 0x001112a0
+					0x00000000 0x00000000 0x77ffc085 0x81f1f108
+					0x03035504 0x0000003f 0x20820800 0x00208208
+					0x0000003f 0x00000000 0x02000000 0x00000042
+					0x000c000c 0x00000000 0x00000000 0x80000370 >;
+			};
+
+			timing-68000000 {
+				clock-frequency = <68000000>;
+
+				nvidia,emc-zcal-cnt-long = <0x00000042>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-cfg = <0x7320000e>;
+				nvidia,emc-mode-1 = <0x80100003>;
+				nvidia,emc-mode-2 = <0x80200008>;
+				nvidia,emc-mode-4 = <0x00000000>;
+				nvidia,emc-mode-reset = <0x80001221>;
+				nvidia,emc-auto-cal-config = <0xa0f10000>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mrs-wait-cnt = <0x000c000c>;
+				nvidia,emc-sel-dpd-ctrl = <0x00040320>;
+				nvidia,emc-xm2dqspadctrl2 = <0x0000a11c>;
+				nvidia,emc-zcal-interval = <0x00000000>;
+
+				nvidia,emc-configuration =  < 0x00000003
+					0x0000000a 0x00000002 0x00000000 0x00000004
+					0x0000000a 0x00000003 0x0000000b 0x00000000
+					0x00000000 0x00000003 0x00000001 0x00000000
+					0x00000005 0x00000005 0x00000006 0x00000006
+					0x00000004 0x00000004 0x00010000 0x00000000
+					0x00000000 0x00000004 0x00000009 0x0000000d
+					0x0000000d 0x00000202 0x00000000 0x00000080
+					0x00000002 0x00000002 0x00000001 0x00000000
+					0x00000008 0x0000000f 0x0000000c 0x00000013
+					0x00000004 0x00000004 0x00000004 0x00000003
+					0x00000000 0x00000004 0x00000005 0x00000213
+					0x00000005 0x00000006 0x00000020 0x00000000
+					0x0000aa88 0x002c00a0 0x00008000 0x0006c000
+					0x0006c000 0x0006c000 0x0006c000 0x0006c000
+					0x0006c000 0x0006c000 0x0006c000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00048000
+					0x00048000 0x00048000 0x00048000 0x001112a0
+					0x00000000 0x00000000 0x77ffc085 0x81f1f108
+					0x03035504 0x0000003f 0x20820800 0x00208208
+					0x0000003f 0x00000000 0x02000000 0x00000042
+					0x000c000c 0x00000000 0x00000000 0x8000050e >;
+			};
+
+			timing-102000000 {
+				clock-frequency = <102000000>;
+
+				nvidia,emc-zcal-cnt-long = <0x00000042>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-cfg = <0x7320000e>;
+				nvidia,emc-mode-1 = <0x80100003>;
+				nvidia,emc-mode-2 = <0x80200008>;
+				nvidia,emc-mode-4 = <0x00000000>;
+				nvidia,emc-mode-reset = <0x80001221>;
+				nvidia,emc-auto-cal-config = <0xa0f10000>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mrs-wait-cnt = <0x000c000c>;
+				nvidia,emc-sel-dpd-ctrl = <0x00040320>;
+				nvidia,emc-xm2dqspadctrl2 = <0x0000a11c>;
+				nvidia,emc-zcal-interval = <0x00000000>;
+
+				nvidia,emc-configuration =  < 0x00000004
+					0x00000010 0x00000003 0x00000001 0x00000004
+					0x0000000a 0x00000003 0x0000000b 0x00000001
+					0x00000001 0x00000003 0x00000001 0x00000000
+					0x00000005 0x00000005 0x00000006 0x00000006
+					0x00000004 0x00000004 0x00010000 0x00000000
+					0x00000000 0x00000004 0x00000009 0x0000000d
+					0x0000000d 0x00000303 0x00000000 0x000000c0
+					0x00000002 0x00000002 0x00000001 0x00000000
+					0x0000000d 0x0000000f 0x00000012 0x0000001c
+					0x00000004 0x00000004 0x00000004 0x00000005
+					0x00000000 0x00000004 0x00000005 0x0000031c
+					0x00000005 0x00000006 0x00000020 0x00000000
+					0x0000aa88 0x002c00a0 0x00008000 0x0006c000
+					0x0006c000 0x0006c000 0x0006c000 0x0006c000
+					0x0006c000 0x0006c000 0x0006c000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00048000
+					0x00048000 0x00048000 0x00048000 0x001112a0
+					0x00000000 0x00000000 0x77ffc085 0x81f1f108
+					0x03035504 0x0000003f 0x20820800 0x00208208
+					0x0000003f 0x00000000 0x02000000 0x00000042
+					0x000c000c 0x00000000 0x00000000 0x80000714 >;
+			};
+
+			timing-204000000 {
+				clock-frequency = <204000000>;
+
+				nvidia,emc-zcal-cnt-long = <0x00000042>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-cfg = <0x7320000e>;
+				nvidia,emc-mode-1 = <0x80100003>;
+				nvidia,emc-mode-2 = <0x80200008>;
+				nvidia,emc-mode-4 = <0x00000000>;
+				nvidia,emc-mode-reset = <0x80001221>;
+				nvidia,emc-auto-cal-config = <0xa0f10000>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mrs-wait-cnt = <0x000c000c>;
+				nvidia,emc-sel-dpd-ctrl = <0x00040320>;
+				nvidia,emc-xm2dqspadctrl2 = <0x0000a11c>;
+				nvidia,emc-zcal-interval = <0x00020000>;
+
+				nvidia,emc-configuration =  < 0x00000009
+					0x00000020 0x00000007 0x00000002 0x00000004
+					0x0000000a 0x00000003 0x0000000b 0x00000002
+					0x00000002 0x00000003 0x00000001 0x00000000
+					0x00000005 0x00000005 0x00000007 0x00000006
+					0x00000004 0x00000004 0x00010000 0x00000000
+					0x00000000 0x00000004 0x00000009 0x0000000d
+					0x0000000d 0x00000607 0x00000000 0x00000181
+					0x00000002 0x00000002 0x00000001 0x00000000
+					0x0000001d 0x0000000f 0x00000023 0x00000038
+					0x00000004 0x00000004 0x00000004 0x00000009
+					0x00000000 0x00000004 0x00000005 0x00000638
+					0x00000006 0x00000004 0x00000020 0x00000000
+					0x0000aa88 0x000000a0 0x00008000 0x0006c000
+					0x0006c000 0x0006c000 0x0006c000 0x0006c000
+					0x0006c000 0x0006c000 0x0006c000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00048000
+					0x00048000 0x00048000 0x00048000 0x001112a0
+					0x00000000 0x00000000 0x77ffc085 0x81f1f108
+					0x05057404 0x0000003f 0x20820800 0x0079e79e
+					0x0000003f 0x00000000 0x02000000 0x00000100
+					0x000c000c 0x00000000 0x00000000 0x80000d22 >;
+			};
+
+			timing-312000000 {
+				clock-frequency = <312000000>;
+
+				nvidia,emc-zcal-cnt-long = <0x00000042>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-cfg = <0x5300000e>;
+				nvidia,emc-mode-1 = <0x80100002>;
+				nvidia,emc-mode-2 = <0x80200000>;
+				nvidia,emc-mode-4 = <0x00000000>;
+				nvidia,emc-mode-reset = <0x80000321>;
+				nvidia,emc-auto-cal-config = <0xa0f10000>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mrs-wait-cnt = <0x0190000c>;
+				nvidia,emc-sel-dpd-ctrl = <0x00040320>;
+				nvidia,emc-xm2dqspadctrl2 = <0x0001013d>;
+				nvidia,emc-zcal-interval = <0x00020000>;
+
+				nvidia,emc-configuration =  < 0x0000000e
+					0x00000030 0x00000009 0x00000003 0x00000004
+					0x00000008 0x00000002 0x00000009 0x00000003
+					0x00000003 0x00000002 0x00000001 0x00000000
+					0x00000004 0x00000004 0x00000007 0x00000007
+					0x00000005 0x00000004 0x00080006 0x00000000
+					0x00000000 0x00000004 0x0000000b 0x0000000d
+					0x0000000d 0x00000945 0x00000000 0x00000251
+					0x00000001 0x00000008 0x00000001 0x00000000
+					0x0000002e 0x0000000e 0x00000036 0x00000200
+					0x00000004 0x00000004 0x00000004 0x0000000d
+					0x00000000 0x00000004 0x00000005 0x00000986
+					0x00000006 0x00000004 0x00000020 0x00000000
+					0x0000ba88 0x002c00a0 0x00008000 0x00038000
+					0x00038000 0x00038000 0x00038000 0x00038000
+					0x00038000 0x00038000 0x00038000 0x00028000
+					0x00028000 0x00028000 0x00028000 0x00028000
+					0x00028000 0x00028000 0x00028000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00030000
+					0x00030000 0x00030000 0x00030000 0x001112a0
+					0x00000000 0x00000000 0x77ffc085 0x81f1f108
+					0x03035504 0x00000000 0x10410400 0x00208208
+					0x0000003f 0x00000000 0x02000000 0x00000100
+					0x0190000c 0x00000000 0x00000000 0x80001395 >;
+			};
+
+			timing-408000000 {
+				clock-frequency = <408000000>;
+
+				nvidia,emc-zcal-cnt-long = <0x00000042>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-cfg = <0x53000006>;
+				nvidia,emc-mode-1 = <0x80100002>;
+				nvidia,emc-mode-2 = <0x80200008>;
+				nvidia,emc-mode-4 = <0x00000000>;
+				nvidia,emc-mode-reset = <0x80000731>;
+				nvidia,emc-auto-cal-config = <0xa0f10000>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mrs-wait-cnt = <0x0181000c>;
+				nvidia,emc-sel-dpd-ctrl = <0x00040320>;
+				nvidia,emc-xm2dqspadctrl2 = <0x0001013d>;
+				nvidia,emc-zcal-interval = <0x00020000>;
+
+				nvidia,emc-configuration =  < 0x00000012
+					0x00000040 0x0000000d 0x00000004 0x00000005
+					0x00000009 0x00000002 0x0000000c 0x00000004
+					0x00000004 0x00000002 0x00000001 0x00000000
+					0x00000004 0x00000004 0x00000007 0x00000007
+					0x00000005 0x00000004 0x00080006 0x00000000
+					0x00000000 0x00000004 0x0000000c 0x0000000e
+					0x0000000e 0x00000c2f 0x00000000 0x0000030b
+					0x00000001 0x00000008 0x00000001 0x00000000
+					0x0000003d 0x00000011 0x00000046 0x00000200
+					0x00000004 0x00000004 0x00000004 0x00000011
+					0x00000000 0x00000004 0x00000005 0x00000c70
+					0x00000006 0x00000006 0x00000020 0x00000000
+					0x0000ba88 0x002c0080 0x00008000 0x00028000
+					0x00028000 0x00028000 0x00028000 0x00028000
+					0x00028000 0x00028000 0x00028000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00020001
+					0x00020001 0x00020001 0x00020001 0x001112a0
+					0x00000000 0x00000000 0x77ffc085 0x81f1f108
+					0x03035504 0x00000000 0x10410400 0x00208208
+					0x0000003f 0x00000000 0x02000000 0x00000100
+					0x0181000c 0x00000000 0x00000000 0x80001944 >;
+			};
+
+			timing-624000000 {
+				clock-frequency = <624000000>;
+
+				nvidia,emc-zcal-cnt-long = <0x00000042>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-cfg = <0x53200000>;
+				nvidia,emc-mode-1 = <0x80100002>;
+				nvidia,emc-mode-2 = <0x80200010>;
+				nvidia,emc-mode-4 = <0x00000000>;
+				nvidia,emc-mode-reset = <0x80000b61>;
+				nvidia,emc-auto-cal-config = <0xa0f10000>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mrs-wait-cnt = <0x0160000c>;
+				nvidia,emc-sel-dpd-ctrl = <0x00040320>;
+				nvidia,emc-xm2dqspadctrl2 = <0x0000013d>;
+				nvidia,emc-zcal-interval = <0x00020000>;
+
+				nvidia,emc-configuration =  < 0x0000001d
+					0x00000062 0x00000014 0x00000007 0x00000007
+					0x0000000b 0x00000003 0x00000010 0x00000007
+					0x00000007 0x00000003 0x00000001 0x00000000
+					0x00000005 0x00000005 0x0000000a 0x0000000a
+					0x00000008 0x00000004 0x000c000a 0x00000000
+					0x00000000 0x00000007 0x0000000c 0x00000012
+					0x00000012 0x000012c4 0x00000000 0x000004b1
+					0x00000002 0x0000000d 0x00000001 0x00000000
+					0x0000005e 0x00000015 0x0000006b 0x00000200
+					0x00000005 0x00000005 0x00000005 0x00000019
+					0x00000000 0x00000006 0x00000007 0x00001305
+					0x00000009 0x00000006 0x00000020 0x00000000
+					0x0000ba88 0xf00d0191 0x00008000 0x007fc00b
+					0x007fc00b 0x007fc00b 0x007fc00b 0x007fc00b
+					0x007fc00b 0x007fc00b 0x007fc00b 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000009
+					0x00000009 0x00000009 0x00000009 0x001112a0
+					0x00000000 0x00000000 0x77ffc085 0x81f1f108
+					0x07077504 0x00000000 0x10410400 0x0028a28a
+					0x0000003f 0x00000000 0x02000000 0x00000100
+					0x0160000c 0x00000000 0x00000000 0x8000261a >;
+			};
+
+			timing-792000000 {
+				clock-frequency = <792000000>;
+
+				nvidia,emc-zcal-cnt-long = <0x00000042>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-cfg = <0x53000000>;
+				nvidia,emc-mode-1 = <0x80100002>;
+				nvidia,emc-mode-2 = <0x80200218>;
+				nvidia,emc-mode-4 = <0x00000000>;
+				nvidia,emc-mode-reset = <0x80000d71>;
+				nvidia,emc-auto-cal-config = <0xa0f10f0f>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mrs-wait-cnt = <0x0147000c>;
+				nvidia,emc-sel-dpd-ctrl = <0x00040000>;
+				nvidia,emc-xm2dqspadctrl2 = <0x0000013d>;
+				nvidia,emc-zcal-interval = <0x00020000>;
+
+				nvidia,emc-configuration =  < 0x00000024
+					0x0000007d 0x00000019 0x0000000a 0x00000009
+					0x0000000d 0x00000004 0x00000013 0x0000000a
+					0x0000000a 0x00000004 0x00000001 0x00000000
+					0x00000006 0x00000006 0x0000000b 0x0000000b
+					0x00000008 0x00000006 0x000d000a 0x00000000
+					0x00000000 0x00000008 0x0000000d 0x00000014
+					0x00000014 0x000017e4 0x00000000 0x000005f9
+					0x00000003 0x00000012 0x00000001 0x00000000
+					0x00000077 0x00000018 0x00000087 0x00000200
+					0x00000005 0x00000005 0x00000005 0x00000020
+					0x00000000 0x00000007 0x00000008 0x00001825
+					0x0000000a 0x00000006 0x80000020 0x00000000
+					0x0000ba88 0xf0070191 0x00008000 0x00004008
+					0x00004008 0x00004008 0x00004008 0x00004008
+					0x00004008 0x00004008 0x00004008 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x0000400a
+					0x0000400a 0x0000400a 0x0000400a 0x001112a0
+					0x00000000 0x00000000 0x77ffc084 0x81f1f508
+					0x07076604 0x00000000 0x10410400 0x0028a28a
+					0x0000003f 0x00000000 0x02000000 0x00000100
+					0x0147000c 0x00000000 0x00000000 0x80003018 >;
+			};
+		};
+	};
+
 	hda@70030000 {
 		status = "okay";
 	};
@@ -1586,6 +2310,14 @@ key-volume-up {
 		};
 	};
 
+	opp-table-actmon {
+		/delete-node/ opp-900000000;
+	};
+
+	opp-table-emc {
+		/delete-node/ opp-900000000-1200;
+	};
+
 	wl18xx_wifi_pwrseq: pwrseq-wifi {
 		compatible = "mmc-pwrseq-simple";
 
diff --git a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1640.dts b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1640.dts
index 866158f055913..41dc884d7bab5 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1640.dts
+++ b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1640.dts
@@ -15,6 +15,580 @@ motion-tracker@69 {
 		};
 	};
 
+	memory-controller@70019000 {
+		emc-timings-1 {
+			/* P1640 Hynix H5TC2G63FFR-PBA DDR3 792MHz */
+			nvidia,ram-code = <1>;
+
+			timing-12750000 {
+				clock-frequency = <12750000>;
+
+				nvidia,emem-configuration = < 0x40040001 0x8000003f
+					0x00000001 0x00000001 0x00000002 0x00000000
+					0x00000001 0x00000001 0x00000002 0x00000008
+					0x00000002 0x00000001 0x00000003 0x00000006
+					0x06030102 0x000a0402 0x77e30303 0x001f0000 >;
+			};
+
+			timing-20400000 {
+				clock-frequency = <20400000>;
+
+				nvidia,emem-configuration = < 0x40020001 0x80000046
+					0x00000001 0x00000001 0x00000002 0x00000000
+					0x00000001 0x00000001 0x00000002 0x00000008
+					0x00000002 0x00000001 0x00000003 0x00000006
+					0x06030102 0x000a0402 0x75430303 0x001f0000 >;
+			};
+
+			timing-40800000 {
+				clock-frequency = <40800000>;
+
+				nvidia,emem-configuration = < 0xa0000001 0x8000005b
+					0x00000001 0x00000001 0x00000002 0x00000000
+					0x00000001 0x00000001 0x00000002 0x00000008
+					0x00000002 0x00000001 0x00000003 0x00000006
+					0x06030102 0x000a0402 0x73630303 0x001f0000 >;
+			};
+
+			timing-68000000 {
+				clock-frequency = <68000000>;
+
+				nvidia,emem-configuration = < 0x00000001 0x80000076
+					0x00000001 0x00000001 0x00000002 0x00000000
+					0x00000001 0x00000001 0x00000002 0x00000008
+					0x00000002 0x00000001 0x00000003 0x00000006
+					0x06030102 0x000a0402 0x72c30403 0x001f0000 >;
+			};
+
+			timing-102000000 {
+				clock-frequency = <102000000>;
+
+				nvidia,emem-configuration = < 0x08000001 0x80000098
+					0x00000001 0x00000001 0x00000003 0x00000000
+					0x00000002 0x00000001 0x00000002 0x00000008
+					0x00000002 0x00000001 0x00000003 0x00000006
+					0x06030102 0x000a0403 0x72830504 0x001f0000 >;
+			};
+
+			timing-204000000 {
+				clock-frequency = <204000000>;
+
+				nvidia,emem-configuration = < 0x01000003 0x800000fe
+					0x00000001 0x00000001 0x00000005 0x00000002
+					0x00000004 0x00000001 0x00000002 0x00000008
+					0x00000002 0x00000001 0x00000003 0x00000006
+					0x06030102 0x000a0405 0x72440a06 0x001f0000 >;
+			};
+
+			timing-312000000 {
+				clock-frequency = <312000000>;
+
+				nvidia,emem-configuration = < 0x0b000004 0x8000016a
+					0x00000001 0x00000002 0x00000007 0x00000004
+					0x00000006 0x00000001 0x00000002 0x00000007
+					0x00000002 0x00000002 0x00000004 0x00000006
+					0x06040202 0x000b0607 0x76e50f08 0x001f0000 >;
+			};
+
+			timing-408000000 {
+				clock-frequency = <408000000>;
+
+				nvidia,emem-configuration = < 0x02000006 0x80000190
+					0x00000001 0x00000002 0x0000000a 0x00000006
+					0x00000008 0x00000001 0x00000002 0x00000009
+					0x00000002 0x00000002 0x00000004 0x00000006
+					0x06040202 0x000e070a 0x7547130b 0x001f0000 >;
+			};
+
+			timing-624000000 {
+				clock-frequency = <624000000>;
+
+				nvidia,emem-configuration = < 0x06000009 0x80000190
+					0x00000003 0x00000004 0x0000000f 0x00000009
+					0x0000000c 0x00000002 0x00000003 0x0000000b
+					0x00000002 0x00000002 0x00000005 0x00000007
+					0x07050202 0x00130b0f 0x736a1d10 0x001f0000 >;
+			};
+
+			timing-792000000 {
+				clock-frequency = <792000000>;
+
+				nvidia,emem-configuration = < 0x0e00000b 0x80000190
+					0x00000004 0x00000005 0x00000013 0x0000000c
+					0x0000000f 0x00000002 0x00000003 0x0000000c
+					0x00000002 0x00000002 0x00000006 0x00000008
+					0x08060202 0x00160d13 0x72cc2414 0x001f0000 >;
+			};
+		};
+	};
+
+	external-memory-controller@7001b000 {
+		emc-timings-1 {
+			/* P1640 Hynix H5TC2G63FFR-PBA DDR3 792MHz */
+			nvidia,ram-code = <1>;
+
+			timing-12750000 {
+				clock-frequency = <12750000>;
+
+				nvidia,emc-zcal-cnt-long = <0x00000042>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-cfg = <0x7324000e>;
+				nvidia,emc-mode-1 = <0x80100003>;
+				nvidia,emc-mode-2 = <0x80200008>;
+				nvidia,emc-mode-4 = <0x00000000>;
+				nvidia,emc-mode-reset = <0x80001221>;
+				nvidia,emc-auto-cal-config = <0xa0f10f0f>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mrs-wait-cnt = <0x000c000c>;
+				nvidia,emc-sel-dpd-ctrl = <0x00040320>;
+				nvidia,emc-xm2dqspadctrl2 = <0x0000a11c>;
+				nvidia,emc-zcal-interval = <0x00000000>;
+
+				nvidia,emc-configuration =  < 0x00000000
+					0x00000003 0x00000000 0x00000000 0x00000004
+					0x0000000a 0x00000003 0x0000000b 0x00000000
+					0x00000000 0x00000003 0x00000001 0x00000000
+					0x00000005 0x0000000f 0x00000006 0x00000006
+					0x00000004 0x00000004 0x00010000 0x00000000
+					0x00000000 0x00000004 0x00000009 0x0000000d
+					0x0000000f 0x00000060 0x00000000 0x00000018
+					0x00000002 0x00000002 0x00000001 0x00000000
+					0x00000007 0x0000000f 0x00000005 0x00000005
+					0x00000004 0x00000004 0x00000004 0x00000004
+					0x00000000 0x00000004 0x00000005 0x00000064
+					0x00000005 0x00000006 0x00000020 0x00000000
+					0x0000aa88 0x002c00a0 0x00008000 0x00064000
+					0x00064000 0x00064000 0x00064000 0x00064000
+					0x00064000 0x00064000 0x00064000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x0007c000
+					0x0007c000 0x0007c000 0x0007c000 0x001112a0
+					0x00000000 0x00000000 0x77ffc085 0x81f1f108
+					0x03037504 0x0000003f 0x20820800 0x00249249
+					0x0000003f 0x00000007 0x02000000 0x00000042
+					0x000c000c 0x00000000 0x00000000 0x800001c5 >;
+			};
+
+			timing-20400000 {
+				clock-frequency = <20400000>;
+
+				nvidia,emc-zcal-cnt-long = <0x00000042>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-cfg = <0x7324000e>;
+				nvidia,emc-mode-1 = <0x80100003>;
+				nvidia,emc-mode-2 = <0x80200008>;
+				nvidia,emc-mode-4 = <0x00000000>;
+				nvidia,emc-mode-reset = <0x80001221>;
+				nvidia,emc-auto-cal-config = <0xa0f10f0f>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mrs-wait-cnt = <0x000c000c>;
+				nvidia,emc-sel-dpd-ctrl = <0x00040320>;
+				nvidia,emc-xm2dqspadctrl2 = <0x0000a11c>;
+				nvidia,emc-zcal-interval = <0x00000000>;
+
+				nvidia,emc-configuration =  < 0x00000000
+					0x00000003 0x00000000 0x00000000 0x00000004
+					0x0000000a 0x00000003 0x0000000b 0x00000000
+					0x00000000 0x00000003 0x00000001 0x00000000
+					0x00000005 0x0000000f 0x00000006 0x00000006
+					0x00000004 0x00000004 0x00010000 0x00000000
+					0x00000000 0x00000004 0x00000009 0x0000000d
+					0x0000000f 0x0000009a 0x00000000 0x00000026
+					0x00000002 0x00000002 0x00000001 0x00000000
+					0x00000007 0x0000000f 0x00000005 0x00000005
+					0x00000004 0x00000004 0x00000004 0x00000004
+					0x00000000 0x00000004 0x00000005 0x000000a0
+					0x00000005 0x00000006 0x00000020 0x00000000
+					0x0000aa88 0x002c00a0 0x00008000 0x00064000
+					0x00064000 0x00064000 0x00064000 0x00064000
+					0x00064000 0x00064000 0x00064000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x0007c000
+					0x0007c000 0x0007c000 0x0007c000 0x001112a0
+					0x00000000 0x00000000 0x77ffc085 0x81f1f108
+					0x03037504 0x0000003f 0x20820800 0x00249249
+					0x0000003f 0x0000000b 0x02000000 0x00000042
+					0x000c000c 0x00000000 0x00000000 0x8000023a >;
+			};
+
+			timing-40800000 {
+				clock-frequency = <40800000>;
+
+				nvidia,emc-zcal-cnt-long = <0x00000042>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-cfg = <0x7324000e>;
+				nvidia,emc-mode-1 = <0x80100003>;
+				nvidia,emc-mode-2 = <0x80200008>;
+				nvidia,emc-mode-4 = <0x00000000>;
+				nvidia,emc-mode-reset = <0x80001221>;
+				nvidia,emc-auto-cal-config = <0xa0f10f0f>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mrs-wait-cnt = <0x000c000c>;
+				nvidia,emc-sel-dpd-ctrl = <0x00040320>;
+				nvidia,emc-xm2dqspadctrl2 = <0x0000a11c>;
+				nvidia,emc-zcal-interval = <0x00000000>;
+
+				nvidia,emc-configuration =  < 0x00000001
+					0x00000006 0x00000001 0x00000000 0x00000004
+					0x0000000a 0x00000003 0x0000000b 0x00000000
+					0x00000000 0x00000003 0x00000001 0x00000000
+					0x00000005 0x0000000f 0x00000006 0x00000006
+					0x00000004 0x00000004 0x00010000 0x00000000
+					0x00000000 0x00000004 0x00000009 0x0000000d
+					0x0000000f 0x00000134 0x00000000 0x0000004d
+					0x00000002 0x00000002 0x00000001 0x00000000
+					0x00000007 0x0000000f 0x00000007 0x00000007
+					0x00000004 0x00000004 0x00000004 0x00000004
+					0x00000000 0x00000004 0x00000005 0x0000013f
+					0x00000005 0x00000006 0x00000020 0x00000000
+					0x0000aa88 0x002c00a0 0x00008000 0x00064000
+					0x00064000 0x00064000 0x00064000 0x00064000
+					0x00064000 0x00064000 0x00064000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x0007c000
+					0x0007c000 0x0007c000 0x0007c000 0x001112a0
+					0x00000000 0x00000000 0x77ffc085 0x81f1f108
+					0x03037504 0x0000003f 0x20820800 0x00249249
+					0x0000003f 0x00000015 0x02000000 0x00000042
+					0x000c000c 0x00000000 0x00000000 0x80000370 >;
+			};
+
+			timing-68000000 {
+				clock-frequency = <68000000>;
+
+				nvidia,emc-zcal-cnt-long = <0x00000042>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-cfg = <0x7324000e>;
+				nvidia,emc-mode-1 = <0x80100003>;
+				nvidia,emc-mode-2 = <0x80200008>;
+				nvidia,emc-mode-4 = <0x00000000>;
+				nvidia,emc-mode-reset = <0x80001221>;
+				nvidia,emc-auto-cal-config = <0xa0f10f0f>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mrs-wait-cnt = <0x000c000c>;
+				nvidia,emc-sel-dpd-ctrl = <0x00040320>;
+				nvidia,emc-xm2dqspadctrl2 = <0x0000a11c>;
+				nvidia,emc-zcal-interval = <0x00000000>;
+
+				nvidia,emc-configuration =  < 0x00000003
+					0x0000000a 0x00000002 0x00000000 0x00000004
+					0x0000000a 0x00000003 0x0000000b 0x00000000
+					0x00000000 0x00000003 0x00000001 0x00000000
+					0x00000005 0x0000000f 0x00000006 0x00000006
+					0x00000004 0x00000004 0x00010000 0x00000000
+					0x00000000 0x00000004 0x00000009 0x0000000d
+					0x0000000f 0x00000202 0x00000000 0x00000080
+					0x00000002 0x00000002 0x00000001 0x00000000
+					0x00000008 0x0000000f 0x0000000c 0x0000000c
+					0x00000004 0x00000004 0x00000004 0x00000004
+					0x00000000 0x00000004 0x00000005 0x00000213
+					0x00000005 0x00000006 0x00000020 0x00000000
+					0x0000aa88 0x002c00a0 0x00008000 0x00064000
+					0x00064000 0x00064000 0x00064000 0x00064000
+					0x00064000 0x00064000 0x00064000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x0007c000
+					0x0007c000 0x0007c000 0x0007c000 0x001112a0
+					0x00000000 0x00000000 0x77ffc085 0x81f1f108
+					0x03037504 0x0000003f 0x20820800 0x00249249
+					0x0000003f 0x00000022 0x02000000 0x00000042
+					0x000c000c 0x00000000 0x00000000 0x8000050e >;
+			};
+
+			timing-102000000 {
+				clock-frequency = <102000000>;
+
+				nvidia,emc-zcal-cnt-long = <0x00000042>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-cfg = <0x7324000e>;
+				nvidia,emc-mode-1 = <0x80100003>;
+				nvidia,emc-mode-2 = <0x80200008>;
+				nvidia,emc-mode-4 = <0x00000000>;
+				nvidia,emc-mode-reset = <0x80001221>;
+				nvidia,emc-auto-cal-config = <0xa0f10f0f>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mrs-wait-cnt = <0x000c000c>;
+				nvidia,emc-sel-dpd-ctrl = <0x00040320>;
+				nvidia,emc-xm2dqspadctrl2 = <0x0000a11c>;
+				nvidia,emc-zcal-interval = <0x00000000>;
+
+				nvidia,emc-configuration =  < 0x00000004
+					0x00000010 0x00000003 0x00000001 0x00000004
+					0x0000000a 0x00000003 0x0000000b 0x00000001
+					0x00000001 0x00000003 0x00000001 0x00000000
+					0x00000005 0x0000000f 0x00000006 0x00000006
+					0x00000004 0x00000004 0x00010000 0x00000000
+					0x00000000 0x00000004 0x00000009 0x0000000d
+					0x0000000f 0x00000303 0x00000000 0x000000c0
+					0x00000002 0x00000002 0x00000001 0x00000000
+					0x0000000d 0x0000000f 0x00000012 0x00000012
+					0x00000004 0x00000004 0x00000004 0x00000005
+					0x00000000 0x00000004 0x00000005 0x0000031c
+					0x00000005 0x00000006 0x00000020 0x00000000
+					0x0000aa88 0x002c00a0 0x00008000 0x00064000
+					0x00064000 0x00064000 0x00064000 0x00064000
+					0x00064000 0x00064000 0x00064000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x0007c000
+					0x0007c000 0x0007c000 0x0007c000 0x001112a0
+					0x00000000 0x00000000 0x77ffc085 0x81f1f108
+					0x03037504 0x0000003f 0x20820800 0x00249249
+					0x0000003f 0x00000033 0x02000000 0x00000042
+					0x000c000c 0x00000000 0x00000000 0x80000713 >;
+			};
+
+			timing-204000000 {
+				clock-frequency = <204000000>;
+
+				nvidia,emc-zcal-cnt-long = <0x00000042>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-cfg = <0x7320000e>;
+				nvidia,emc-mode-1 = <0x80100003>;
+				nvidia,emc-mode-2 = <0x80200008>;
+				nvidia,emc-mode-4 = <0x00000000>;
+				nvidia,emc-mode-reset = <0x80001221>;
+				nvidia,emc-auto-cal-config = <0xa0f10f0f>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mrs-wait-cnt = <0x000c000c>;
+				nvidia,emc-sel-dpd-ctrl = <0x00040320>;
+				nvidia,emc-xm2dqspadctrl2 = <0x0000a11c>;
+				nvidia,emc-zcal-interval = <0x00020000>;
+
+				nvidia,emc-configuration =  < 0x00000009
+					0x00000020 0x00000007 0x00000002 0x00000004
+					0x0000000a 0x00000003 0x0000000b 0x00000002
+					0x00000002 0x00000003 0x00000001 0x00000000
+					0x00000005 0x0000000f 0x00000007 0x00000006
+					0x00000004 0x00000004 0x00010000 0x00000000
+					0x00000000 0x00000004 0x00000009 0x0000000d
+					0x0000000f 0x00000607 0x00000000 0x00000181
+					0x00000002 0x00000002 0x00000001 0x00000000
+					0x0000001d 0x0000000f 0x00000023 0x00000023
+					0x00000004 0x00000004 0x00000004 0x00000009
+					0x00000000 0x00000004 0x00000005 0x00000638
+					0x00000006 0x00000004 0x00000020 0x00000000
+					0x0000aa88 0x002c00a0 0x00008000 0x00064000
+					0x00064000 0x00064000 0x00064000 0x00064000
+					0x00064000 0x00064000 0x00064000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x0007c000
+					0x0007c000 0x0007c000 0x0007c000 0x001112a0
+					0x00000000 0x00000000 0x77ffc085 0x81f1f108
+					0x03037504 0x0000003f 0x20820800 0x00249249
+					0x0000003f 0x00000000 0x02000000 0x00000100
+					0x000c000c 0x00000000 0x00000000 0x80000d22 >;
+			};
+
+			timing-312000000 {
+				clock-frequency = <312000000>;
+
+				nvidia,emc-zcal-cnt-long = <0x00000042>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-cfg = <0x5300000e>;
+				nvidia,emc-mode-1 = <0x80100002>;
+				nvidia,emc-mode-2 = <0x80200000>;
+				nvidia,emc-mode-4 = <0x00000000>;
+				nvidia,emc-mode-reset = <0x80000321>;
+				nvidia,emc-auto-cal-config = <0xa0f10f0f>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mrs-wait-cnt = <0x0190000c>;
+				nvidia,emc-sel-dpd-ctrl = <0x00040320>;
+				nvidia,emc-xm2dqspadctrl2 = <0x0001013d>;
+				nvidia,emc-zcal-interval = <0x00020000>;
+
+				nvidia,emc-configuration =  < 0x0000000e
+					0x00000030 0x00000009 0x00000003 0x00000004
+					0x00000008 0x00000002 0x00000009 0x00000003
+					0x00000003 0x00000002 0x00000001 0x00000000
+					0x00000004 0x0000000f 0x00000006 0x00000006
+					0x00000005 0x00000004 0x00010000 0x00000000
+					0x00000000 0x00000004 0x0000000b 0x0000000d
+					0x0000000f 0x00000941 0x00000000 0x00000250
+					0x00000001 0x00000008 0x00000001 0x00000000
+					0x0000002e 0x0000000e 0x00000036 0x00000200
+					0x00000004 0x00000004 0x00000004 0x0000000d
+					0x00000000 0x00000004 0x00000005 0x00000982
+					0x00000000 0x00000004 0x00000020 0x00000000
+					0x00005088 0x002c00a0 0x00008000 0x00030000
+					0x00030000 0x00030000 0x00030000 0x00030000
+					0x00030000 0x00030000 0x00030000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00034000
+					0x00034000 0x00034000 0x00034000 0x001112a0
+					0x00000000 0x00000000 0x77ffc085 0x81f1f108
+					0x03037504 0x00000000 0x20820800 0x00249249
+					0x0000003f 0x00000000 0x02000000 0x00000100
+					0x0190000c 0x00000000 0x00000000 0x8000138d >;
+			};
+
+			timing-408000000 {
+				clock-frequency = <408000000>;
+
+				nvidia,emc-zcal-cnt-long = <0x00000042>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-cfg = <0x53000006>;
+				nvidia,emc-mode-1 = <0x80100002>;
+				nvidia,emc-mode-2 = <0x80200008>;
+				nvidia,emc-mode-4 = <0x00000000>;
+				nvidia,emc-mode-reset = <0x80000731>;
+				nvidia,emc-auto-cal-config = <0xa0f10f0f>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mrs-wait-cnt = <0x0181000c>;
+				nvidia,emc-sel-dpd-ctrl = <0x00040320>;
+				nvidia,emc-xm2dqspadctrl2 = <0x0001013d>;
+				nvidia,emc-zcal-interval = <0x00020000>;
+
+				nvidia,emc-configuration =  < 0x00000012
+					0x00000040 0x0000000d 0x00000004 0x00000005
+					0x00000009 0x00000002 0x0000000c 0x00000004
+					0x00000004 0x00000002 0x00000001 0x00000000
+					0x00000004 0x0000000f 0x00000006 0x00000006
+					0x00000005 0x00000004 0x00010000 0x00000000
+					0x00000000 0x00000004 0x0000000c 0x0000000e
+					0x00000010 0x00000c2e 0x00000000 0x0000030b
+					0x00000001 0x00000008 0x00000001 0x00000000
+					0x0000003d 0x00000011 0x00000046 0x00000200
+					0x00000004 0x00000004 0x00000004 0x00000011
+					0x00000000 0x00000004 0x00000005 0x00000c6f
+					0x00000000 0x00000004 0x00000020 0x00000000
+					0x00005088 0x002c0080 0x00008000 0x00020000
+					0x00020000 0x00020000 0x00020000 0x00020000
+					0x00020000 0x00020000 0x00020000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00028000
+					0x00028000 0x00028000 0x00028000 0x001112a0
+					0x00000000 0x00000000 0x77ffc085 0x81f1f108
+					0x03037504 0x00000000 0x20820800 0x00249249
+					0x0000003f 0x00000000 0x02000000 0x00000100
+					0x0181000c 0x00000000 0x00000000 0x80001941 >;
+			};
+
+			timing-624000000 {
+				clock-frequency = <624000000>;
+
+				nvidia,emc-zcal-cnt-long = <0x00000042>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-cfg = <0x53200000>;
+				nvidia,emc-mode-1 = <0x80100002>;
+				nvidia,emc-mode-2 = <0x80200410>;
+				nvidia,emc-mode-4 = <0x00000000>;
+				nvidia,emc-mode-reset = <0x80000b61>;
+				nvidia,emc-auto-cal-config = <0xa0f10f0f>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mrs-wait-cnt = <0x0161000c>;
+				nvidia,emc-sel-dpd-ctrl = <0x00040320>;
+				nvidia,emc-xm2dqspadctrl2 = <0x0000013d>;
+				nvidia,emc-zcal-interval = <0x00020000>;
+
+				nvidia,emc-configuration =  < 0x0000001d
+					0x00000062 0x00000014 0x00000007 0x00000007
+					0x0000000b 0x00000003 0x00000010 0x00000007
+					0x00000007 0x00000003 0x00000001 0x00000000
+					0x00000005 0x0000000f 0x00000009 0x0000000a
+					0x00000008 0x00000004 0x00010000 0x00000000
+					0x00000000 0x00000007 0x0000000c 0x00000012
+					0x00000014 0x000012c3 0x00000000 0x000004b0
+					0x00000002 0x0000000d 0x00000001 0x00000000
+					0x0000005d 0x00000015 0x0000006b 0x00000200
+					0x00000005 0x00000005 0x00000005 0x00000019
+					0x00000000 0x00000006 0x00000007 0x00001304
+					0x00000009 0x00000006 0x80000000 0x00000000
+					0x0000ba88 0xf00d0191 0x00008000 0x0000000a
+					0x0000000a 0x0000000a 0x0000000a 0x0000000a
+					0x0000000a 0x0000000a 0x0000000a 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x0000000b
+					0x0000000a 0x0000000b 0x0000000b 0x001112a0
+					0x00000000 0x00000000 0x77ffc085 0x81f1f108
+					0x07077504 0x00000000 0x20820800 0x00249249
+					0x0000003f 0x00000000 0x02000000 0x00000100
+					0x0161000c 0x00000000 0x00000000 0x80002617 >;
+			};
+
+			timing-792000000 {
+				clock-frequency = <792000000>;
+
+				nvidia,emc-zcal-cnt-long = <0x00000042>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-cfg = <0x53000000>;
+				nvidia,emc-mode-1 = <0x80100002>;
+				nvidia,emc-mode-2 = <0x80200418>;
+				nvidia,emc-mode-4 = <0x00000000>;
+				nvidia,emc-mode-reset = <0x80000d71>;
+				nvidia,emc-auto-cal-config = <0xa0f10f0f>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mrs-wait-cnt = <0x0148000c>;
+				nvidia,emc-sel-dpd-ctrl = <0x00040000>;
+				nvidia,emc-xm2dqspadctrl2 = <0x0000013d>;
+				nvidia,emc-zcal-interval = <0x00020000>;
+
+				nvidia,emc-configuration =  < 0x00000025
+					0x0000007d 0x0000001a 0x00000009 0x00000008
+					0x0000000d 0x00000004 0x00000013 0x00000009
+					0x00000009 0x00000004 0x00000001 0x00000000
+					0x00000006 0x0000000f 0x0000000a 0x0000000b
+					0x00000008 0x00000006 0x00010000 0x00000000
+					0x00000000 0x00000008 0x0000000d 0x00000014
+					0x00000016 0x000017e1 0x00000000 0x000005f8
+					0x00000003 0x00000011 0x00000001 0x00000000
+					0x00000076 0x00000018 0x00000087 0x00000200
+					0x00000005 0x00000005 0x00000005 0x00000020
+					0x00000000 0x00000007 0x00000008 0x00001822
+					0x00000000 0x00000006 0x80000000 0x00000000
+					0x00005088 0xf0070191 0x00008000 0x00000007
+					0x00000008 0x00000008 0x00000008 0x00000008
+					0x00000008 0x00000008 0x00000008 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x0000000a
+					0x00000009 0x0000000a 0x0000000a 0x001112a0
+					0x00000000 0x00000000 0x77ffc085 0x81f1f108
+					0x07077504 0x00000000 0x20820800 0x00249249
+					0x0000003f 0x00000000 0x02000000 0x00000100
+					0x0148000c 0x00000000 0x00000000 0x80003012 >;
+			};
+		};
+	};
+
 	pwrseq-wifi {
 		clocks = <&tegra_pmc TEGRA_PMC_CLK_OUT_3>;
 		clock-names = "ext_clock";
diff --git a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1988.dts b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1988.dts
index 7ccda46c42af2..b82c3ff61ca96 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1988.dts
+++ b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1988.dts
@@ -7,6 +7,98 @@ / {
 	model = "Nvidia Tegra Note 7 (P1988)";
 	compatible = "nvidia,tegratab", "nvidia,tegra114";
 
+	clock@60006000 {
+		emc-timings-1 {
+			timing-528000000 {
+				clock-frequency = <528000000>;
+				nvidia,parent-clock-frequency = <792000000>;
+				clocks = <&tegra_car TEGRA114_CLK_PLL_M>;
+				clock-names = "emc-parent";
+			};
+		};
+
+		emc-timings-2 {
+			nvidia,ram-code = <2>;
+
+			timing-12750000 {
+				clock-frequency = <12750000>;
+				nvidia,parent-clock-frequency = <408000000>;
+				clocks = <&tegra_car TEGRA114_CLK_PLL_P>;
+				clock-names = "emc-parent";
+			};
+
+			timing-20400000 {
+				clock-frequency = <20400000>;
+				nvidia,parent-clock-frequency = <408000000>;
+				clocks = <&tegra_car TEGRA114_CLK_PLL_P>;
+				clock-names = "emc-parent";
+			};
+
+			timing-40800000 {
+				clock-frequency = <40800000>;
+				nvidia,parent-clock-frequency = <408000000>;
+				clocks = <&tegra_car TEGRA114_CLK_PLL_P>;
+				clock-names = "emc-parent";
+			};
+
+			timing-68000000 {
+				clock-frequency = <68000000>;
+				nvidia,parent-clock-frequency = <408000000>;
+				clocks = <&tegra_car TEGRA114_CLK_PLL_P>;
+				clock-names = "emc-parent";
+			};
+
+			timing-102000000 {
+				clock-frequency = <102000000>;
+				nvidia,parent-clock-frequency = <408000000>;
+				clocks = <&tegra_car TEGRA114_CLK_PLL_P>;
+				clock-names = "emc-parent";
+			};
+
+			timing-204000000 {
+				clock-frequency = <204000000>;
+				nvidia,parent-clock-frequency = <408000000>;
+				clocks = <&tegra_car TEGRA114_CLK_PLL_P>;
+				clock-names = "emc-parent";
+			};
+
+			timing-312000000 {
+				clock-frequency = <312000000>;
+				nvidia,parent-clock-frequency = <624000000>;
+				clocks = <&tegra_car TEGRA114_CLK_PLL_C>;
+				clock-names = "emc-parent";
+			};
+
+			timing-408000000 {
+				clock-frequency = <408000000>;
+				nvidia,parent-clock-frequency = <408000000>;
+				clocks = <&tegra_car TEGRA114_CLK_PLL_P>;
+				clock-names = "emc-parent";
+			};
+
+			timing-528000000 {
+				clock-frequency = <528000000>;
+				nvidia,parent-clock-frequency = <792000000>;
+				clocks = <&tegra_car TEGRA114_CLK_PLL_M>;
+				clock-names = "emc-parent";
+			};
+
+			timing-624000000 {
+				clock-frequency = <624000000>;
+				nvidia,parent-clock-frequency = <624000000>;
+				clocks = <&tegra_car TEGRA114_CLK_PLL_C>;
+				clock-names = "emc-parent";
+			};
+
+			timing-792000000 {
+				clock-frequency = <792000000>;
+				nvidia,parent-clock-frequency = <792000000>;
+				clocks = <&tegra_car TEGRA114_CLK_PLL_M>;
+				clock-names = "emc-parent";
+			};
+		};
+	};
+
 	i2c@7000c000 {
 		proximity@23 {
 			compatible = "liteon,ltr659";
@@ -40,6 +132,1262 @@ ldo4 {
 		};
 	};
 
+	memory-controller@70019000 {
+		emc-timings-1 {
+			/* P1988 Hynix H5TC2G63FFR-PBA DDR3 792MHz */
+			nvidia,ram-code = <1>;
+
+			timing-12750000 {
+				clock-frequency = <12750000>;
+
+				nvidia,emem-configuration = < 0x40040001 0x8000003f
+					0x00000001 0x00000001 0x00000002 0x00000000
+					0x00000001 0x00000001 0x00000002 0x00000008
+					0x00000002 0x00000001 0x00000003 0x00000006
+					0x06030102 0x000a0402 0x77e30303 0x001f0000 >;
+			};
+
+			timing-20400000 {
+				clock-frequency = <20400000>;
+
+				nvidia,emem-configuration = < 0x40020001 0x80000046
+					0x00000001 0x00000001 0x00000002 0x00000000
+					0x00000001 0x00000001 0x00000002 0x00000008
+					0x00000002 0x00000001 0x00000003 0x00000006
+					0x06030102 0x000a0402 0x75430303 0x001f0000 >;
+			};
+
+			timing-40800000 {
+				clock-frequency = <40800000>;
+
+				nvidia,emem-configuration = < 0xa0000001 0x8000005b
+					0x00000001 0x00000001 0x00000002 0x00000000
+					0x00000001 0x00000001 0x00000002 0x00000008
+					0x00000002 0x00000001 0x00000003 0x00000006
+					0x06030102 0x000a0402 0x73630303 0x001f0000 >;
+			};
+
+			timing-68000000 {
+				clock-frequency = <68000000>;
+
+				nvidia,emem-configuration = < 0x00000001 0x80000076
+					0x00000001 0x00000001 0x00000002 0x00000000
+					0x00000001 0x00000001 0x00000002 0x00000008
+					0x00000002 0x00000001 0x00000003 0x00000006
+					0x06030102 0x000a0402 0x72c30403 0x001f0000 >;
+			};
+
+			timing-102000000 {
+				clock-frequency = <102000000>;
+
+				nvidia,emem-configuration = < 0x08000001 0x80000098
+					0x00000001 0x00000001 0x00000003 0x00000000
+					0x00000002 0x00000001 0x00000002 0x00000008
+					0x00000002 0x00000001 0x00000003 0x00000006
+					0x06030102 0x000a0403 0x72830504 0x001f0000 >;
+			};
+
+			timing-204000000 {
+				clock-frequency = <204000000>;
+
+				nvidia,emem-configuration = < 0x01000003 0x800000fe
+					0x00000001 0x00000001 0x00000005 0x00000002
+					0x00000004 0x00000001 0x00000002 0x00000008
+					0x00000002 0x00000001 0x00000003 0x00000006
+					0x06030102 0x000a0405 0x72440a06 0x001f0000 >;
+			};
+
+			timing-312000000 {
+				clock-frequency = <312000000>;
+
+				nvidia,emem-configuration = < 0x0b000004 0x8000016a
+					0x00000001 0x00000002 0x00000007 0x00000004
+					0x00000006 0x00000001 0x00000002 0x00000007
+					0x00000002 0x00000002 0x00000004 0x00000006
+					0x06040202 0x000b0607 0x76e50f08 0x001f0000 >;
+			};
+
+			timing-408000000 {
+				clock-frequency = <408000000>;
+
+				nvidia,emem-configuration = < 0x02000006 0x80000190
+					0x00000001 0x00000002 0x0000000a 0x00000006
+					0x00000008 0x00000001 0x00000002 0x00000009
+					0x00000002 0x00000002 0x00000004 0x00000006
+					0x06040202 0x000e070a 0x7547130b 0x001f0000 >;
+			};
+
+			timing-528000000 {
+				clock-frequency = <528000000>;
+
+				nvidia,emem-configuration = < 0x0f000007 0x80000190
+					0x00000002 0x00000003 0x0000000d 0x00000008
+					0x0000000a 0x00000001 0x00000002 0x00000009
+					0x00000002 0x00000002 0x00000005 0x00000006
+					0x06050202 0x0010090d 0x7428180e 0x001f0000 >;
+			};
+
+			timing-624000000 {
+				clock-frequency = <624000000>;
+
+				nvidia,emem-configuration = < 0x06000009 0x80000190
+					0x00000003 0x00000004 0x0000000f 0x00000009
+					0x0000000c 0x00000002 0x00000003 0x0000000b
+					0x00000002 0x00000002 0x00000005 0x00000007
+					0x07050202 0x00130b0f 0x736a1d10 0x001f0000 >;
+			};
+
+			timing-792000000 {
+				clock-frequency = <792000000>;
+
+				nvidia,emem-configuration = < 0x0e00000b 0x80000190
+					0x00000004 0x00000005 0x00000013 0x0000000c
+					0x0000000f 0x00000002 0x00000003 0x0000000c
+					0x00000002 0x00000002 0x00000006 0x00000008
+					0x08060202 0x00160d13 0x72cc2414 0x001f0000 >;
+			};
+		};
+
+		emc-timings-2 {
+			/* P1988 Micron MT41K128M16-125 DDR3 792MHz */
+			nvidia,ram-code = <2>;
+
+			timing-12750000 {
+				clock-frequency = <12750000>;
+
+				nvidia,emem-configuration = < 0x40040001 0x8000003f
+					0x00000001 0x00000001 0x00000002 0x00000000
+					0x00000001 0x00000001 0x00000002 0x00000008
+					0x00000002 0x00000001 0x00000003 0x00000006
+					0x06030102 0x000a0402 0x77e30303 0x001f0000 >;
+			};
+
+			timing-20400000 {
+				clock-frequency = <20400000>;
+
+				nvidia,emem-configuration = < 0x40020001 0x80000046
+					0x00000001 0x00000001 0x00000002 0x00000000
+					0x00000001 0x00000001 0x00000002 0x00000008
+					0x00000002 0x00000001 0x00000003 0x00000006
+					0x06030102 0x000a0402 0x75430303 0x001f0000 >;
+			};
+
+			timing-40800000 {
+				clock-frequency = <40800000>;
+
+				nvidia,emem-configuration = < 0xa0000001 0x8000005b
+					0x00000001 0x00000001 0x00000002 0x00000000
+					0x00000001 0x00000001 0x00000002 0x00000008
+					0x00000002 0x00000001 0x00000003 0x00000006
+					0x06030102 0x000a0402 0x73630303 0x001f0000 >;
+			};
+
+			timing-68000000 {
+				clock-frequency = <68000000>;
+
+				nvidia,emem-configuration = < 0x00000001 0x80000076
+					0x00000001 0x00000001 0x00000002 0x00000000
+					0x00000001 0x00000001 0x00000002 0x00000008
+					0x00000002 0x00000001 0x00000003 0x00000006
+					0x06030102 0x000a0402 0x72c30403 0x001f0000 >;
+			};
+
+			timing-102000000 {
+				clock-frequency = <102000000>;
+
+				nvidia,emem-configuration = < 0x08000001 0x80000098
+					0x00000001 0x00000001 0x00000003 0x00000000
+					0x00000002 0x00000001 0x00000002 0x00000008
+					0x00000002 0x00000001 0x00000003 0x00000006
+					0x06030102 0x000a0403 0x72830504 0x001f0000 >;
+			};
+
+			timing-204000000 {
+				clock-frequency = <204000000>;
+
+				nvidia,emem-configuration = < 0x01000003 0x800000fe
+					0x00000001 0x00000001 0x00000005 0x00000002
+					0x00000004 0x00000001 0x00000002 0x00000008
+					0x00000002 0x00000001 0x00000003 0x00000006
+					0x06030102 0x000a0405 0x72440a06 0x001f0000 >;
+			};
+
+			timing-312000000 {
+				clock-frequency = <312000000>;
+
+				nvidia,emem-configuration = < 0x0b000004 0x8000016a
+					0x00000001 0x00000002 0x00000007 0x00000004
+					0x00000006 0x00000001 0x00000002 0x00000007
+					0x00000002 0x00000002 0x00000004 0x00000006
+					0x06040202 0x000b0607 0x76e50f08 0x001f0000 >;
+			};
+
+			timing-408000000 {
+				clock-frequency = <408000000>;
+
+				nvidia,emem-configuration = < 0x02000006 0x80000190
+					0x00000001 0x00000002 0x0000000a 0x00000006
+					0x00000008 0x00000001 0x00000002 0x00000009
+					0x00000002 0x00000002 0x00000004 0x00000006
+					0x06040202 0x000e070a 0x7547130b 0x001f0000 >;
+			};
+
+			timing-528000000 {
+				clock-frequency = <528000000>;
+
+				nvidia,emem-configuration = < 0x0f000007 0x80000190
+					0x00000002 0x00000003 0x0000000d 0x00000008
+					0x0000000a 0x00000001 0x00000002 0x00000009
+					0x00000002 0x00000002 0x00000005 0x00000006
+					0x06050202 0x0010090d 0x7428180e 0x001f0000 >;
+			};
+
+			timing-624000000 {
+				clock-frequency = <624000000>;
+
+				nvidia,emem-configuration = < 0x06000009 0x80000190
+					0x00000003 0x00000004 0x0000000f 0x00000009
+					0x0000000c 0x00000002 0x00000003 0x0000000b
+					0x00000002 0x00000002 0x00000005 0x00000007
+					0x07050202 0x00130b0f 0x736a1d10 0x001f0000 >;
+			};
+
+			timing-792000000 {
+				clock-frequency = <792000000>;
+
+				nvidia,emem-configuration = < 0x0e00000b 0x80000190
+					0x00000004 0x00000005 0x00000013 0x0000000c
+					0x0000000f 0x00000002 0x00000003 0x0000000c
+					0x00000002 0x00000002 0x00000006 0x00000008
+					0x08060202 0x00160d13 0x72cc2414 0x001f0000 >;
+			};
+		};
+	};
+
+	external-memory-controller@7001b000 {
+		emc-timings-1 {
+			/* P1988 Hynix H5TC2G63FFR-PBA DDR3 792MHz */
+			nvidia,ram-code = <1>;
+
+			timing-12750000 {
+				clock-frequency = <12750000>;
+
+				nvidia,emc-zcal-cnt-long = <0x00000042>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-cfg = <0x7324000e>;
+				nvidia,emc-mode-1 = <0x80100003>;
+				nvidia,emc-mode-2 = <0x80200008>;
+				nvidia,emc-mode-4 = <0x00000000>;
+				nvidia,emc-mode-reset = <0x80001221>;
+				nvidia,emc-auto-cal-config = <0xa0f10f0f>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mrs-wait-cnt = <0x000c000c>;
+				nvidia,emc-sel-dpd-ctrl = <0x00040320>;
+				nvidia,emc-xm2dqspadctrl2 = <0x0000a11c>;
+				nvidia,emc-zcal-interval = <0x00000000>;
+
+				nvidia,emc-configuration =  < 0x00000000
+					0x00000003 0x00000000 0x00000000 0x00000004
+					0x0000000a 0x00000003 0x0000000b 0x00000000
+					0x00000000 0x00000003 0x00000001 0x00000000
+					0x00000005 0x0000000f 0x00000006 0x00000006
+					0x00000004 0x00000004 0x00010000 0x00000000
+					0x00000000 0x00000004 0x0000000b 0x0000000d
+					0x0000000f 0x00000060 0x00000000 0x00000018
+					0x00000002 0x00000002 0x00000001 0x00000000
+					0x00000007 0x0000000f 0x00000005 0x00000005
+					0x00000004 0x00000004 0x00000004 0x00000004
+					0x00000000 0x00000004 0x00000005 0x00000064
+					0x00000005 0x00000006 0x00000020 0x00000000
+					0x0000aa88 0x002c00a0 0x00008000 0x00058000
+					0x00058000 0x00058000 0x00058000 0x00058000
+					0x00058000 0x00058000 0x00058000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00060000
+					0x00060000 0x00060000 0x00060000 0x001112a0
+					0x00000000 0x00000000 0x77ffc085 0x81f1f108
+					0x03037504 0x0000003f 0x20820800 0x00249249
+					0x0000003f 0x00000007 0x02000000 0x00000042
+					0x000c000c 0x00000000 0x00000000 0x800001c5 >;
+			};
+
+			timing-20400000 {
+				clock-frequency = <20400000>;
+
+				nvidia,emc-zcal-cnt-long = <0x00000042>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-cfg = <0x7324000e>;
+				nvidia,emc-mode-1 = <0x80100003>;
+				nvidia,emc-mode-2 = <0x80200008>;
+				nvidia,emc-mode-4 = <0x00000000>;
+				nvidia,emc-mode-reset = <0x80001221>;
+				nvidia,emc-auto-cal-config = <0xa0f10f0f>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mrs-wait-cnt = <0x000c000c>;
+				nvidia,emc-sel-dpd-ctrl = <0x00040320>;
+				nvidia,emc-xm2dqspadctrl2 = <0x0000a11c>;
+				nvidia,emc-zcal-interval = <0x00000000>;
+
+				nvidia,emc-configuration =  < 0x00000000
+					0x00000003 0x00000000 0x00000000 0x00000004
+					0x0000000a 0x00000003 0x0000000b 0x00000000
+					0x00000000 0x00000003 0x00000001 0x00000000
+					0x00000005 0x0000000f 0x00000006 0x00000006
+					0x00000004 0x00000004 0x00010000 0x00000000
+					0x00000000 0x00000004 0x0000000b 0x0000000d
+					0x0000000f 0x0000009a 0x00000000 0x00000026
+					0x00000002 0x00000002 0x00000001 0x00000000
+					0x00000007 0x0000000f 0x00000005 0x00000005
+					0x00000004 0x00000004 0x00000004 0x00000004
+					0x00000000 0x00000004 0x00000005 0x000000a0
+					0x00000005 0x00000006 0x00000020 0x00000000
+					0x0000aa88 0x002c00a0 0x00008000 0x00058000
+					0x00058000 0x00058000 0x00058000 0x00058000
+					0x00058000 0x00058000 0x00058000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00060000
+					0x00060000 0x00060000 0x00060000 0x001112a0
+					0x00000000 0x00000000 0x77ffc085 0x81f1f108
+					0x03037504 0x0000003f 0x20820800 0x00249249
+					0x0000003f 0x0000000b 0x02000000 0x00000042
+					0x000c000c 0x00000000 0x00000000 0x8000023a >;
+			};
+
+			timing-40800000 {
+				clock-frequency = <40800000>;
+
+				nvidia,emc-zcal-cnt-long = <0x00000042>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-cfg = <0x7324000e>;
+				nvidia,emc-mode-1 = <0x80100003>;
+				nvidia,emc-mode-2 = <0x80200008>;
+				nvidia,emc-mode-4 = <0x00000000>;
+				nvidia,emc-mode-reset = <0x80001221>;
+				nvidia,emc-auto-cal-config = <0xa0f10f0f>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mrs-wait-cnt = <0x000c000c>;
+				nvidia,emc-sel-dpd-ctrl = <0x00040320>;
+				nvidia,emc-xm2dqspadctrl2 = <0x0000a11c>;
+				nvidia,emc-zcal-interval = <0x00000000>;
+
+				nvidia,emc-configuration =  < 0x00000001
+					0x00000006 0x00000001 0x00000000 0x00000004
+					0x0000000a 0x00000003 0x0000000b 0x00000000
+					0x00000000 0x00000003 0x00000001 0x00000000
+					0x00000005 0x0000000f 0x00000006 0x00000006
+					0x00000004 0x00000004 0x00010000 0x00000000
+					0x00000000 0x00000004 0x0000000b 0x0000000d
+					0x0000000f 0x00000134 0x00000000 0x0000004d
+					0x00000002 0x00000002 0x00000001 0x00000000
+					0x00000007 0x0000000f 0x00000007 0x00000007
+					0x00000004 0x00000004 0x00000004 0x00000004
+					0x00000000 0x00000004 0x00000005 0x0000013f
+					0x00000005 0x00000006 0x00000020 0x00000000
+					0x0000aa88 0x002c00a0 0x00008000 0x00058000
+					0x00058000 0x00058000 0x00058000 0x00058000
+					0x00058000 0x00058000 0x00058000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00060000
+					0x00060000 0x00060000 0x00060000 0x001112a0
+					0x00000000 0x00000000 0x77ffc085 0x81f1f108
+					0x03037504 0x0000003f 0x20820800 0x00249249
+					0x0000003f 0x00000015 0x02000000 0x00000042
+					0x000c000c 0x00000000 0x00000000 0x80000370 >;
+			};
+
+			timing-68000000 {
+				clock-frequency = <68000000>;
+
+				nvidia,emc-zcal-cnt-long = <0x00000042>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-cfg = <0x7324000e>;
+				nvidia,emc-mode-1 = <0x80100003>;
+				nvidia,emc-mode-2 = <0x80200008>;
+				nvidia,emc-mode-4 = <0x00000000>;
+				nvidia,emc-mode-reset = <0x80001221>;
+				nvidia,emc-auto-cal-config = <0xa0f10f0f>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mrs-wait-cnt = <0x000c000c>;
+				nvidia,emc-sel-dpd-ctrl = <0x00040320>;
+				nvidia,emc-xm2dqspadctrl2 = <0x0000a11c>;
+				nvidia,emc-zcal-interval = <0x00000000>;
+
+				nvidia,emc-configuration =  < 0x00000003
+					0x0000000a 0x00000002 0x00000000 0x00000004
+					0x0000000a 0x00000003 0x0000000b 0x00000000
+					0x00000000 0x00000003 0x00000001 0x00000000
+					0x00000005 0x0000000f 0x00000006 0x00000006
+					0x00000004 0x00000004 0x00010000 0x00000000
+					0x00000000 0x00000004 0x0000000b 0x0000000d
+					0x0000000f 0x00000202 0x00000000 0x00000080
+					0x00000002 0x00000002 0x00000001 0x00000000
+					0x00000008 0x0000000f 0x0000000c 0x0000000c
+					0x00000004 0x00000004 0x00000004 0x00000004
+					0x00000000 0x00000004 0x00000005 0x00000213
+					0x00000005 0x00000006 0x00000020 0x00000000
+					0x0000aa88 0x002c00a0 0x00008000 0x00058000
+					0x00058000 0x00058000 0x00058000 0x00058000
+					0x00058000 0x00058000 0x00058000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00060000
+					0x00060000 0x00060000 0x00060000 0x001112a0
+					0x00000000 0x00000000 0x77ffc085 0x81f1f108
+					0x03037504 0x0000003f 0x20820800 0x00249249
+					0x0000003f 0x00000022 0x02000000 0x00000042
+					0x000c000c 0x00000000 0x00000000 0x8000050e >;
+			};
+
+			timing-102000000 {
+				clock-frequency = <102000000>;
+
+				nvidia,emc-zcal-cnt-long = <0x00000042>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-cfg = <0x7324000e>;
+				nvidia,emc-mode-1 = <0x80100003>;
+				nvidia,emc-mode-2 = <0x80200008>;
+				nvidia,emc-mode-4 = <0x00000000>;
+				nvidia,emc-mode-reset = <0x80001221>;
+				nvidia,emc-auto-cal-config = <0xa0f10f0f>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mrs-wait-cnt = <0x000c000c>;
+				nvidia,emc-sel-dpd-ctrl = <0x00040320>;
+				nvidia,emc-xm2dqspadctrl2 = <0x0000a11c>;
+				nvidia,emc-zcal-interval = <0x00000000>;
+
+				nvidia,emc-configuration =  < 0x00000004
+					0x00000010 0x00000003 0x00000001 0x00000004
+					0x0000000a 0x00000003 0x0000000b 0x00000001
+					0x00000001 0x00000003 0x00000001 0x00000000
+					0x00000005 0x0000000f 0x00000006 0x00000006
+					0x00000004 0x00000004 0x00010000 0x00000000
+					0x00000000 0x00000004 0x0000000b 0x0000000d
+					0x0000000f 0x00000303 0x00000000 0x000000c0
+					0x00000002 0x00000002 0x00000001 0x00000000
+					0x0000000d 0x0000000f 0x00000012 0x00000012
+					0x00000004 0x00000004 0x00000004 0x00000005
+					0x00000000 0x00000004 0x00000005 0x0000031c
+					0x00000005 0x00000006 0x00000020 0x00000000
+					0x0000aa88 0x002c00a0 0x00008000 0x00058000
+					0x00058000 0x00058000 0x00058000 0x00058000
+					0x00058000 0x00058000 0x00058000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00060000
+					0x00060000 0x00060000 0x00060000 0x001112a0
+					0x00000000 0x00000000 0x77ffc085 0x81f1f108
+					0x03037504 0x0000003f 0x20820800 0x00249249
+					0x0000003f 0x00000033 0x02000000 0x00000042
+					0x000c000c 0x00000000 0x00000000 0x80000713 >;
+			};
+
+			timing-204000000 {
+				clock-frequency = <204000000>;
+
+				nvidia,emc-zcal-cnt-long = <0x00000042>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-cfg = <0x7320000e>;
+				nvidia,emc-mode-1 = <0x80100003>;
+				nvidia,emc-mode-2 = <0x80200008>;
+				nvidia,emc-mode-4 = <0x00000000>;
+				nvidia,emc-mode-reset = <0x80001221>;
+				nvidia,emc-auto-cal-config = <0xa0f10f0f>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mrs-wait-cnt = <0x000c000c>;
+				nvidia,emc-sel-dpd-ctrl = <0x00040320>;
+				nvidia,emc-xm2dqspadctrl2 = <0x0000a11c>;
+				nvidia,emc-zcal-interval = <0x00020000>;
+
+				nvidia,emc-configuration =  < 0x00000009
+					0x00000020 0x00000007 0x00000002 0x00000004
+					0x0000000a 0x00000003 0x0000000b 0x00000002
+					0x00000002 0x00000003 0x00000001 0x00000000
+					0x00000005 0x0000000f 0x00000007 0x00000006
+					0x00000004 0x00000004 0x00010000 0x00000000
+					0x00000000 0x00000004 0x0000000b 0x0000000d
+					0x0000000f 0x00000607 0x00000000 0x00000181
+					0x00000002 0x00000002 0x00000001 0x00000000
+					0x0000001d 0x0000000f 0x00000023 0x00000023
+					0x00000004 0x00000004 0x00000004 0x00000009
+					0x00000000 0x00000004 0x00000005 0x00000638
+					0x00000006 0x00000004 0x00000020 0x00000000
+					0x0000aa88 0x002c00a0 0x00008000 0x00058000
+					0x00058000 0x00058000 0x00058000 0x00058000
+					0x00058000 0x00058000 0x00058000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00060000
+					0x00060000 0x00060000 0x00060000 0x001112a0
+					0x00000000 0x00000000 0x77ffc085 0x81f1f108
+					0x03037504 0x0000003f 0x20820800 0x00249249
+					0x0000003f 0x00000000 0x02000000 0x00000100
+					0x000c000c 0x00000000 0x00000000 0x80000d22 >;
+			};
+
+			timing-312000000 {
+				clock-frequency = <312000000>;
+
+				nvidia,emc-zcal-cnt-long = <0x00000042>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-cfg = <0x5300000e>;
+				nvidia,emc-mode-1 = <0x80100002>;
+				nvidia,emc-mode-2 = <0x80200000>;
+				nvidia,emc-mode-4 = <0x00000000>;
+				nvidia,emc-mode-reset = <0x80000321>;
+				nvidia,emc-auto-cal-config = <0xa0f10f0f>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mrs-wait-cnt = <0x0190000c>;
+				nvidia,emc-sel-dpd-ctrl = <0x00040320>;
+				nvidia,emc-xm2dqspadctrl2 = <0x0001013d>;
+				nvidia,emc-zcal-interval = <0x00020000>;
+
+				nvidia,emc-configuration =  < 0x0000000e
+					0x00000030 0x00000009 0x00000003 0x00000004
+					0x00000008 0x00000002 0x00000009 0x00000003
+					0x00000003 0x00000002 0x00000001 0x00000000
+					0x00000004 0x0000000f 0x00000006 0x00000006
+					0x00000005 0x00000004 0x00010000 0x00000000
+					0x00000000 0x00000004 0x0000000b 0x0000000e
+					0x00000010 0x00000941 0x00000000 0x00000250
+					0x00000001 0x00000008 0x00000001 0x00000000
+					0x0000002e 0x0000000e 0x00000036 0x00000200
+					0x00000004 0x00000004 0x00000004 0x0000000d
+					0x00000000 0x00000004 0x00000005 0x00000982
+					0x00000000 0x00000004 0x00000020 0x00000000
+					0x00005088 0x002c00a0 0x00008000 0x00030000
+					0x00030000 0x00030000 0x00030000 0x00030000
+					0x00030000 0x00030000 0x00030000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00038000
+					0x00038000 0x00038000 0x00038000 0x001112a0
+					0x00000000 0x00000000 0x77ffc085 0x81f1f108
+					0x03037504 0x00000000 0x20820800 0x00249249
+					0x0000003f 0x00000000 0x02000000 0x00000100
+					0x0190000c 0x00000000 0x00000000 0x8000138d >;
+			};
+
+			timing-408000000 {
+				clock-frequency = <408000000>;
+
+				nvidia,emc-zcal-cnt-long = <0x00000042>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-cfg = <0x53000006>;
+				nvidia,emc-mode-1 = <0x80100002>;
+				nvidia,emc-mode-2 = <0x80200008>;
+				nvidia,emc-mode-4 = <0x00000000>;
+				nvidia,emc-mode-reset = <0x80000731>;
+				nvidia,emc-auto-cal-config = <0xa0f10f0f>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mrs-wait-cnt = <0x0181000c>;
+				nvidia,emc-sel-dpd-ctrl = <0x00040320>;
+				nvidia,emc-xm2dqspadctrl2 = <0x0001013d>;
+				nvidia,emc-zcal-interval = <0x00020000>;
+
+				nvidia,emc-configuration =  < 0x00000012
+					0x00000040 0x0000000d 0x00000004 0x00000005
+					0x00000009 0x00000002 0x0000000c 0x00000004
+					0x00000004 0x00000002 0x00000001 0x00000000
+					0x00000004 0x0000000f 0x00000006 0x00000006
+					0x00000005 0x00000004 0x00010000 0x00000000
+					0x00000000 0x00000004 0x0000000c 0x0000000e
+					0x00000010 0x00000c2e 0x00000000 0x0000030b
+					0x00000001 0x00000008 0x00000001 0x00000000
+					0x0000003d 0x00000011 0x00000046 0x00000200
+					0x00000004 0x00000004 0x00000004 0x00000011
+					0x00000000 0x00000004 0x00000005 0x00000c6f
+					0x00000000 0x00000004 0x00000020 0x00000000
+					0x00005088 0x002c0080 0x00008000 0x00020000
+					0x00020000 0x00020000 0x00020000 0x00020000
+					0x00020000 0x00020000 0x00020000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00024000
+					0x00024000 0x00024000 0x00024000 0x001112a0
+					0x00000000 0x00000000 0x77ffc085 0x81f1f108
+					0x03037504 0x00000000 0x20820800 0x00249249
+					0x0000003f 0x00000000 0x02000000 0x00000100
+					0x0181000c 0x00000000 0x00000000 0x80001941 >;
+			};
+
+			timing-528000000 {
+				clock-frequency = <528000000>;
+
+				nvidia,emc-zcal-cnt-long = <0x00000042>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-cfg = <0x53000004>;
+				nvidia,emc-mode-1 = <0x80100002>;
+				nvidia,emc-mode-2 = <0x80200008>;
+				nvidia,emc-mode-4 = <0x00000000>;
+				nvidia,emc-mode-reset = <0x80000941>;
+				nvidia,emc-auto-cal-config = <0xa0f10f0f>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mrs-wait-cnt = <0x016e000c>;
+				nvidia,emc-sel-dpd-ctrl = <0x00040320>;
+				nvidia,emc-xm2dqspadctrl2 = <0x0000013d>;
+				nvidia,emc-zcal-interval = <0x00020000>;
+
+				nvidia,emc-configuration =  < 0x00000018
+					0x00000053 0x00000011 0x00000006 0x00000006
+					0x00000009 0x00000002 0x0000000d 0x00000006
+					0x00000006 0x00000002 0x00000001 0x00000000
+					0x00000005 0x0000000f 0x00000008 0x00000009
+					0x00000006 0x00000005 0x00010000 0x00000000
+					0x00000000 0x00000006 0x0000000c 0x00000010
+					0x00000012 0x00000fd6 0x00000000 0x000003f5
+					0x00000002 0x0000000b 0x00000001 0x00000000
+					0x00000050 0x00000012 0x0000005a 0x00000200
+					0x00000004 0x00000004 0x00000004 0x00000016
+					0x00000000 0x00000005 0x00000006 0x00001017
+					0x00000000 0x00000006 0x00000020 0x00000000
+					0x00005088 0xf0120091 0x00008000 0x0000000a
+					0x0000000a 0x0000000a 0x0000000a 0x0000000a
+					0x0000000a 0x0000000a 0x0000000a 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x0000000b
+					0x0000000b 0x0000000b 0x0000000b 0x001112a0
+					0x00000000 0x00000000 0x77ffc085 0x81f1f108
+					0x07077504 0x00000000 0x20820800 0x00249249
+					0x0000003f 0x00000000 0x02000000 0x00000100
+					0x016e000c 0x00000000 0x00000000 0x80002062 >;
+			};
+
+			timing-624000000 {
+				clock-frequency = <624000000>;
+
+				nvidia,emc-zcal-cnt-long = <0x00000042>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-cfg = <0x53200000>;
+				nvidia,emc-mode-1 = <0x80100002>;
+				nvidia,emc-mode-2 = <0x80200410>;
+				nvidia,emc-mode-4 = <0x00000000>;
+				nvidia,emc-mode-reset = <0x80000b61>;
+				nvidia,emc-auto-cal-config = <0xa0f10f0f>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mrs-wait-cnt = <0x0161000c>;
+				nvidia,emc-sel-dpd-ctrl = <0x00040320>;
+				nvidia,emc-xm2dqspadctrl2 = <0x0000013d>;
+				nvidia,emc-zcal-interval = <0x00020000>;
+
+				nvidia,emc-configuration =  < 0x0000001d
+					0x00000062 0x00000014 0x00000007 0x00000007
+					0x0000000b 0x00000003 0x00000010 0x00000007
+					0x00000007 0x00000003 0x00000001 0x00000000
+					0x00000005 0x0000000f 0x00000009 0x0000000a
+					0x00000007 0x00000005 0x00010000 0x00000000
+					0x00000000 0x00000007 0x0000000c 0x00000012
+					0x00000014 0x000012c3 0x00000000 0x000004b0
+					0x00000002 0x0000000d 0x00000001 0x00000000
+					0x0000005d 0x00000015 0x0000006b 0x00000200
+					0x00000005 0x00000005 0x00000005 0x00000019
+					0x00000000 0x00000006 0x00000007 0x00001304
+					0x00000009 0x00000006 0x80000000 0x00000000
+					0x0000ba88 0xf00d0191 0x00008000 0x00000008
+					0x00000008 0x00000008 0x00000008 0x00000008
+					0x00000008 0x00000008 0x00000008 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x0000000a
+					0x0000000a 0x0000000a 0x0000000a 0x001112a0
+					0x00000000 0x00000000 0x77ffc085 0x81f1f108
+					0x07077504 0x00000000 0x20820800 0x0028a28a
+					0x0000003f 0x00000000 0x02000000 0x00000100
+					0x0161000c 0x00000000 0x00000000 0x80002617 >;
+			};
+
+			timing-792000000 {
+				clock-frequency = <792000000>;
+
+				nvidia,emc-zcal-cnt-long = <0x00000042>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-cfg = <0x53000000>;
+				nvidia,emc-mode-1 = <0x80100002>;
+				nvidia,emc-mode-2 = <0x80200418>;
+				nvidia,emc-mode-4 = <0x00000000>;
+				nvidia,emc-mode-reset = <0x80000d71>;
+				nvidia,emc-auto-cal-config = <0xa0f10f0f>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mrs-wait-cnt = <0x0148000c>;
+				nvidia,emc-sel-dpd-ctrl = <0x00040000>;
+				nvidia,emc-xm2dqspadctrl2 = <0x0000013d>;
+				nvidia,emc-zcal-interval = <0x00020000>;
+
+				nvidia,emc-configuration =  < 0x00000025
+					0x0000007d 0x0000001a 0x00000009 0x00000008
+					0x0000000d 0x00000004 0x00000013 0x00000009
+					0x00000009 0x00000004 0x00000001 0x00000000
+					0x00000006 0x0000000f 0x0000000a 0x0000000b
+					0x00000008 0x00000006 0x00010000 0x00000000
+					0x00000000 0x00000008 0x0000000d 0x00000014
+					0x00000016 0x000017e1 0x00000000 0x000005f8
+					0x00000003 0x00000011 0x00000001 0x00000000
+					0x00000076 0x00000018 0x00000087 0x00000200
+					0x00000005 0x00000005 0x00000005 0x00000020
+					0x00000000 0x00000007 0x00000008 0x00001822
+					0x00000000 0x00000006 0x80000000 0x00000000
+					0x00005088 0xf0070191 0x00008000 0x00000008
+					0x00000008 0x00000008 0x00000008 0x00000008
+					0x00000008 0x00000008 0x00000008 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x0000000a
+					0x0000000a 0x0000000a 0x0000000a 0x001112a0
+					0x00000000 0x00000000 0x77ffc085 0x81f1f108
+					0x07077504 0x00000000 0x20820800 0x0028a28a
+					0x0000003f 0x00000000 0x02000000 0x00000100
+					0x0148000c 0x00000000 0x00000000 0x80003012 >;
+			};
+		};
+
+		emc-timings-2 {
+			/* P1988 Micron MT41K128M16-125 DDR3 792MHz */
+			nvidia,ram-code = <2>;
+
+			timing-12750000 {
+				clock-frequency = <12750000>;
+
+				nvidia,emc-zcal-cnt-long = <0x00000042>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-cfg = <0x7324000e>;
+				nvidia,emc-mode-1 = <0x80100003>;
+				nvidia,emc-mode-2 = <0x80200008>;
+				nvidia,emc-mode-4 = <0x00000000>;
+				nvidia,emc-mode-reset = <0x80001221>;
+				nvidia,emc-auto-cal-config = <0xa0f10f0f>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mrs-wait-cnt = <0x000c000c>;
+				nvidia,emc-sel-dpd-ctrl = <0x00040320>;
+				nvidia,emc-xm2dqspadctrl2 = <0x0000a11c>;
+				nvidia,emc-zcal-interval = <0x00000000>;
+
+				nvidia,emc-configuration =  < 0x00000000
+					0x00000003 0x00000000 0x00000000 0x00000004
+					0x0000000a 0x00000003 0x0000000b 0x00000000
+					0x00000000 0x00000003 0x00000001 0x00000000
+					0x00000005 0x0000000f 0x00000006 0x00000006
+					0x00000004 0x00000004 0x00010000 0x00000000
+					0x00000000 0x00000004 0x00000009 0x0000000d
+					0x0000000f 0x00000060 0x00000000 0x00000018
+					0x00000002 0x00000002 0x00000001 0x00000000
+					0x00000007 0x0000000f 0x00000005 0x00000005
+					0x00000004 0x00000004 0x00000004 0x00000004
+					0x00000000 0x00000004 0x00000005 0x00000064
+					0x00000005 0x00000006 0x00000020 0x00000000
+					0x0000aa88 0x002c00a0 0x00008000 0x00050000
+					0x00050000 0x00050000 0x00050000 0x00050000
+					0x00050000 0x00050000 0x00050000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00060000
+					0x00060000 0x00060000 0x00060000 0x001112a0
+					0x00000000 0x00000000 0x77ffc085 0x81f1f108
+					0x03037504 0x0000003f 0x20820800 0x00249249
+					0x0000003f 0x00000007 0x02000000 0x00000042
+					0x000c000c 0x00000000 0x00000000 0x800001c5 >;
+			};
+
+			timing-20400000 {
+				clock-frequency = <20400000>;
+
+				nvidia,emc-zcal-cnt-long = <0x00000042>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-cfg = <0x7324000e>;
+				nvidia,emc-mode-1 = <0x80100003>;
+				nvidia,emc-mode-2 = <0x80200008>;
+				nvidia,emc-mode-4 = <0x00000000>;
+				nvidia,emc-mode-reset = <0x80001221>;
+				nvidia,emc-auto-cal-config = <0xa0f10f0f>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mrs-wait-cnt = <0x000c000c>;
+				nvidia,emc-sel-dpd-ctrl = <0x00040320>;
+				nvidia,emc-xm2dqspadctrl2 = <0x0000a11c>;
+				nvidia,emc-zcal-interval = <0x00000000>;
+
+				nvidia,emc-configuration =  < 0x00000000
+					0x00000003 0x00000000 0x00000000 0x00000004
+					0x0000000a 0x00000003 0x0000000b 0x00000000
+					0x00000000 0x00000003 0x00000001 0x00000000
+					0x00000005 0x0000000f 0x00000006 0x00000006
+					0x00000004 0x00000004 0x00010000 0x00000000
+					0x00000000 0x00000004 0x00000009 0x0000000d
+					0x0000000f 0x0000009a 0x00000000 0x00000026
+					0x00000002 0x00000002 0x00000001 0x00000000
+					0x00000007 0x0000000f 0x00000005 0x00000005
+					0x00000004 0x00000004 0x00000004 0x00000004
+					0x00000000 0x00000004 0x00000005 0x000000a0
+					0x00000005 0x00000006 0x00000020 0x00000000
+					0x0000aa88 0x002c00a0 0x00008000 0x00050000
+					0x00050000 0x00050000 0x00050000 0x00050000
+					0x00050000 0x00050000 0x00050000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00060000
+					0x00060000 0x00060000 0x00060000 0x001112a0
+					0x00000000 0x00000000 0x77ffc085 0x81f1f108
+					0x03037504 0x0000003f 0x20820800 0x00249249
+					0x0000003f 0x0000000b 0x02000000 0x00000042
+					0x000c000c 0x00000000 0x00000000 0x8000023a >;
+			};
+
+			timing-40800000 {
+				clock-frequency = <40800000>;
+
+				nvidia,emc-zcal-cnt-long = <0x00000042>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-cfg = <0x7324000e>;
+				nvidia,emc-mode-1 = <0x80100003>;
+				nvidia,emc-mode-2 = <0x80200008>;
+				nvidia,emc-mode-4 = <0x00000000>;
+				nvidia,emc-mode-reset = <0x80001221>;
+				nvidia,emc-auto-cal-config = <0xa0f10f0f>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mrs-wait-cnt = <0x000c000c>;
+				nvidia,emc-sel-dpd-ctrl = <0x00040320>;
+				nvidia,emc-xm2dqspadctrl2 = <0x0000a11c>;
+				nvidia,emc-zcal-interval = <0x00000000>;
+
+				nvidia,emc-configuration =  < 0x00000001
+					0x00000006 0x00000001 0x00000000 0x00000004
+					0x0000000a 0x00000003 0x0000000b 0x00000000
+					0x00000000 0x00000003 0x00000001 0x00000000
+					0x00000005 0x0000000f 0x00000006 0x00000006
+					0x00000004 0x00000004 0x00010000 0x00000000
+					0x00000000 0x00000004 0x00000009 0x0000000d
+					0x0000000f 0x00000134 0x00000000 0x0000004d
+					0x00000002 0x00000002 0x00000001 0x00000000
+					0x00000007 0x0000000f 0x00000007 0x00000007
+					0x00000004 0x00000004 0x00000004 0x00000004
+					0x00000000 0x00000004 0x00000005 0x0000013f
+					0x00000005 0x00000006 0x00000020 0x00000000
+					0x0000aa88 0x002c00a0 0x00008000 0x00050000
+					0x00050000 0x00050000 0x00050000 0x00050000
+					0x00050000 0x00050000 0x00050000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00060000
+					0x00060000 0x00060000 0x00060000 0x001112a0
+					0x00000000 0x00000000 0x77ffc085 0x81f1f108
+					0x03037504 0x0000003f 0x20820800 0x00249249
+					0x0000003f 0x00000015 0x02000000 0x00000042
+					0x000c000c 0x00000000 0x00000000 0x80000370 >;
+			};
+
+			timing-68000000 {
+				clock-frequency = <68000000>;
+
+				nvidia,emc-zcal-cnt-long = <0x00000042>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-cfg = <0x7324000e>;
+				nvidia,emc-mode-1 = <0x80100003>;
+				nvidia,emc-mode-2 = <0x80200008>;
+				nvidia,emc-mode-4 = <0x00000000>;
+				nvidia,emc-mode-reset = <0x80001221>;
+				nvidia,emc-auto-cal-config = <0xa0f10f0f>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mrs-wait-cnt = <0x000c000c>;
+				nvidia,emc-sel-dpd-ctrl = <0x00040320>;
+				nvidia,emc-xm2dqspadctrl2 = <0x0000a11c>;
+				nvidia,emc-zcal-interval = <0x00000000>;
+
+				nvidia,emc-configuration =  < 0x00000003
+					0x0000000a 0x00000002 0x00000000 0x00000004
+					0x0000000a 0x00000003 0x0000000b 0x00000000
+					0x00000000 0x00000003 0x00000001 0x00000000
+					0x00000005 0x0000000f 0x00000006 0x00000006
+					0x00000004 0x00000004 0x00010000 0x00000000
+					0x00000000 0x00000004 0x00000009 0x0000000d
+					0x0000000f 0x00000202 0x00000000 0x00000080
+					0x00000002 0x00000002 0x00000001 0x00000000
+					0x00000008 0x0000000f 0x0000000c 0x0000000c
+					0x00000004 0x00000004 0x00000004 0x00000004
+					0x00000000 0x00000004 0x00000005 0x00000213
+					0x00000005 0x00000006 0x00000020 0x00000000
+					0x0000aa88 0x002c00a0 0x00008000 0x00050000
+					0x00050000 0x00050000 0x00050000 0x00050000
+					0x00050000 0x00050000 0x00050000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00060000
+					0x00060000 0x00060000 0x00060000 0x001112a0
+					0x00000000 0x00000000 0x77ffc085 0x81f1f108
+					0x03037504 0x0000003f 0x20820800 0x00249249
+					0x0000003f 0x00000022 0x02000000 0x00000042
+					0x000c000c 0x00000000 0x00000000 0x8000050e >;
+			};
+
+			timing-102000000 {
+				clock-frequency = <102000000>;
+
+				nvidia,emc-zcal-cnt-long = <0x00000042>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-cfg = <0x7324000e>;
+				nvidia,emc-mode-1 = <0x80100003>;
+				nvidia,emc-mode-2 = <0x80200008>;
+				nvidia,emc-mode-4 = <0x00000000>;
+				nvidia,emc-mode-reset = <0x80001221>;
+				nvidia,emc-auto-cal-config = <0xa0f10f0f>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mrs-wait-cnt = <0x000c000c>;
+				nvidia,emc-sel-dpd-ctrl = <0x00040320>;
+				nvidia,emc-xm2dqspadctrl2 = <0x0000a11c>;
+				nvidia,emc-zcal-interval = <0x00000000>;
+
+				nvidia,emc-configuration =  < 0x00000004
+					0x00000010 0x00000003 0x00000001 0x00000004
+					0x0000000a 0x00000003 0x0000000b 0x00000001
+					0x00000001 0x00000003 0x00000001 0x00000000
+					0x00000005 0x0000000f 0x00000006 0x00000006
+					0x00000004 0x00000004 0x00010000 0x00000000
+					0x00000000 0x00000004 0x00000009 0x0000000d
+					0x0000000f 0x00000303 0x00000000 0x000000c0
+					0x00000002 0x00000002 0x00000001 0x00000000
+					0x0000000d 0x0000000f 0x00000012 0x00000012
+					0x00000004 0x00000004 0x00000004 0x00000005
+					0x00000000 0x00000004 0x00000005 0x0000031c
+					0x00000005 0x00000006 0x00000020 0x00000000
+					0x0000aa88 0x002c00a0 0x00008000 0x00050000
+					0x00050000 0x00050000 0x00050000 0x00050000
+					0x00050000 0x00050000 0x00050000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00060000
+					0x00060000 0x00060000 0x00060000 0x001112a0
+					0x00000000 0x00000000 0x77ffc085 0x81f1f108
+					0x03037504 0x0000003f 0x20820800 0x00249249
+					0x0000003f 0x00000033 0x02000000 0x00000042
+					0x000c000c 0x00000000 0x00000000 0x80000713 >;
+			};
+
+			timing-204000000 {
+				clock-frequency = <204000000>;
+
+				nvidia,emc-zcal-cnt-long = <0x00000042>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-cfg = <0x7320000e>;
+				nvidia,emc-mode-1 = <0x80100003>;
+				nvidia,emc-mode-2 = <0x80200008>;
+				nvidia,emc-mode-4 = <0x00000000>;
+				nvidia,emc-mode-reset = <0x80001221>;
+				nvidia,emc-auto-cal-config = <0xa0f10f0f>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mrs-wait-cnt = <0x000c000c>;
+				nvidia,emc-sel-dpd-ctrl = <0x00040320>;
+				nvidia,emc-xm2dqspadctrl2 = <0x0000a11c>;
+				nvidia,emc-zcal-interval = <0x00020000>;
+
+				nvidia,emc-configuration =  < 0x00000009
+					0x00000020 0x00000007 0x00000002 0x00000004
+					0x0000000a 0x00000003 0x0000000b 0x00000002
+					0x00000002 0x00000003 0x00000001 0x00000000
+					0x00000005 0x0000000f 0x00000007 0x00000006
+					0x00000004 0x00000004 0x00010000 0x00000000
+					0x00000000 0x00000004 0x00000009 0x0000000d
+					0x0000000f 0x00000607 0x00000000 0x00000181
+					0x00000002 0x00000002 0x00000001 0x00000000
+					0x0000001d 0x0000000f 0x00000023 0x00000023
+					0x00000004 0x00000004 0x00000004 0x00000009
+					0x00000000 0x00000004 0x00000005 0x00000638
+					0x00000006 0x00000004 0x00000020 0x00000000
+					0x0000aa88 0x002c00a0 0x00008000 0x00050000
+					0x00050000 0x00050000 0x00050000 0x00050000
+					0x00050000 0x00050000 0x00050000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00060000
+					0x00060000 0x00060000 0x00060000 0x001112a0
+					0x00000000 0x00000000 0x77ffc085 0x81f1f108
+					0x03037504 0x0000003f 0x20820800 0x00249249
+					0x0000003f 0x00000000 0x02000000 0x00000100
+					0x000c000c 0x00000000 0x00000000 0x80000d22 >;
+			};
+
+			timing-312000000 {
+				clock-frequency = <312000000>;
+
+				nvidia,emc-zcal-cnt-long = <0x00000042>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-cfg = <0x5300000e>;
+				nvidia,emc-mode-1 = <0x80100002>;
+				nvidia,emc-mode-2 = <0x80200000>;
+				nvidia,emc-mode-4 = <0x00000000>;
+				nvidia,emc-mode-reset = <0x80000321>;
+				nvidia,emc-auto-cal-config = <0xa0f10f0f>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mrs-wait-cnt = <0x0190000c>;
+				nvidia,emc-sel-dpd-ctrl = <0x00040320>;
+				nvidia,emc-xm2dqspadctrl2 = <0x0001013d>;
+				nvidia,emc-zcal-interval = <0x00020000>;
+
+				nvidia,emc-configuration =  < 0x0000000e
+					0x00000030 0x00000009 0x00000003 0x00000004
+					0x00000008 0x00000002 0x00000009 0x00000003
+					0x00000003 0x00000002 0x00000001 0x00000000
+					0x00000004 0x0000000f 0x00000006 0x00000006
+					0x00000005 0x00000004 0x00010000 0x00000000
+					0x00000000 0x00000004 0x0000000b 0x0000000e
+					0x0000000f 0x00000941 0x00000000 0x00000250
+					0x00000001 0x00000008 0x00000001 0x00000000
+					0x0000002e 0x0000000e 0x00000036 0x00000200
+					0x00000004 0x00000004 0x00000004 0x0000000d
+					0x00000000 0x00000004 0x00000005 0x00000982
+					0x00000000 0x00000004 0x00000020 0x00000000
+					0x00005088 0x002c00a0 0x00008000 0x00028000
+					0x00028000 0x00028000 0x00028000 0x00028000
+					0x00028000 0x00028000 0x00028000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x0003c000
+					0x0003c000 0x0003c000 0x0003c000 0x001112a0
+					0x00000000 0x00000000 0x77ffc085 0x81f1f108
+					0x03037504 0x00000000 0x20820800 0x00249249
+					0x0000003f 0x00000000 0x02000000 0x00000100
+					0x0190000c 0x00000000 0x00000000 0x8000138d >;
+			};
+
+			timing-408000000 {
+				clock-frequency = <408000000>;
+
+				nvidia,emc-zcal-cnt-long = <0x00000042>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-cfg = <0x53000006>;
+				nvidia,emc-mode-1 = <0x80100002>;
+				nvidia,emc-mode-2 = <0x80200008>;
+				nvidia,emc-mode-4 = <0x00000000>;
+				nvidia,emc-mode-reset = <0x80000731>;
+				nvidia,emc-auto-cal-config = <0xa0f10f0f>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mrs-wait-cnt = <0x0181000c>;
+				nvidia,emc-sel-dpd-ctrl = <0x00040320>;
+				nvidia,emc-xm2dqspadctrl2 = <0x0001013d>;
+				nvidia,emc-zcal-interval = <0x00020000>;
+
+				nvidia,emc-configuration =  < 0x00000012
+					0x00000040 0x0000000d 0x00000004 0x00000005
+					0x00000009 0x00000002 0x0000000c 0x00000004
+					0x00000004 0x00000002 0x00000001 0x00000000
+					0x00000004 0x0000000f 0x00000006 0x00000006
+					0x00000005 0x00000004 0x00010000 0x00000000
+					0x00000000 0x00000004 0x0000000c 0x0000000e
+					0x00000010 0x00000c2e 0x00000000 0x0000030b
+					0x00000001 0x00000008 0x00000001 0x00000000
+					0x0000003d 0x00000011 0x00000046 0x00000200
+					0x00000004 0x00000004 0x00000004 0x00000011
+					0x00000000 0x00000004 0x00000005 0x00000c6f
+					0x00000000 0x00000004 0x00000020 0x00000000
+					0x00005088 0x002c0080 0x00008000 0x00020000
+					0x00020000 0x00020000 0x00020000 0x00020000
+					0x00020000 0x00020000 0x00020000 0x00020000
+					0x00020000 0x00020000 0x00020000 0x00020000
+					0x00020000 0x00020000 0x00020000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00028000
+					0x00028000 0x00028000 0x00028000 0x001112a0
+					0x00000000 0x00000000 0x77ffc085 0x81f1f108
+					0x03037504 0x00000000 0x20820800 0x0028a28a
+					0x0000003f 0x00000000 0x02000000 0x00000100
+					0x0181000c 0x00000000 0x00000000 0x80001941 >;
+			};
+
+			timing-528000000 {
+				clock-frequency = <528000000>;
+
+				nvidia,emc-zcal-cnt-long = <0x00000042>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-cfg = <0x53000004>;
+				nvidia,emc-mode-1 = <0x80100002>;
+				nvidia,emc-mode-2 = <0x80200008>;
+				nvidia,emc-mode-4 = <0x00000000>;
+				nvidia,emc-mode-reset = <0x80000941>;
+				nvidia,emc-auto-cal-config = <0xa0f10f0f>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mrs-wait-cnt = <0x016e000c>;
+				nvidia,emc-sel-dpd-ctrl = <0x00040320>;
+				nvidia,emc-xm2dqspadctrl2 = <0x0000013d>;
+				nvidia,emc-zcal-interval = <0x00020000>;
+
+				nvidia,emc-configuration =  < 0x00000018
+					0x00000053 0x00000011 0x00000006 0x00000006
+					0x00000009 0x00000002 0x0000000d 0x00000006
+					0x00000006 0x00000002 0x00000001 0x00000000
+					0x00000005 0x0000000f 0x00000008 0x00000009
+					0x00000007 0x00000004 0x00010000 0x00000000
+					0x00000000 0x00000006 0x0000000c 0x00000011
+					0x00000013 0x00000fd6 0x00000000 0x000003f5
+					0x00000002 0x0000000b 0x00000001 0x00000000
+					0x00000050 0x00000012 0x0000005a 0x00000200
+					0x00000004 0x00000004 0x00000004 0x00000016
+					0x00000000 0x00000005 0x00000006 0x00001017
+					0x00000000 0x00000006 0x00000020 0x00000000
+					0x00005088 0xf0120091 0x00008000 0x00000009
+					0x00000009 0x00000009 0x00000009 0x00000009
+					0x00000009 0x00000009 0x00000009 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x0000000c
+					0x0000000c 0x0000000c 0x0000000c 0x001112a0
+					0x00000000 0x00000000 0x77ffc085 0x81f1f108
+					0x07077504 0x00000000 0x20820800 0x0028a28a
+					0x0000003f 0x00000000 0x02000000 0x00000100
+					0x016e000c 0x00000000 0x00000000 0x80002062 >;
+			};
+
+			timing-624000000 {
+				clock-frequency = <624000000>;
+
+				nvidia,emc-zcal-cnt-long = <0x00000042>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-cfg = <0x53200000>;
+				nvidia,emc-mode-1 = <0x80100002>;
+				nvidia,emc-mode-2 = <0x80200410>;
+				nvidia,emc-mode-4 = <0x00000000>;
+				nvidia,emc-mode-reset = <0x80000b61>;
+				nvidia,emc-auto-cal-config = <0xa0f10f0f>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mrs-wait-cnt = <0x0161000c>;
+				nvidia,emc-sel-dpd-ctrl = <0x00040320>;
+				nvidia,emc-xm2dqspadctrl2 = <0x0000013d>;
+				nvidia,emc-zcal-interval = <0x00020000>;
+
+				nvidia,emc-configuration =  < 0x0000001d
+					0x00000062 0x00000014 0x00000007 0x00000007
+					0x0000000b 0x00000003 0x00000010 0x00000007
+					0x00000007 0x00000003 0x00000001 0x00000000
+					0x00000005 0x0000000f 0x00000009 0x0000000a
+					0x00000007 0x00000005 0x00010000 0x00000000
+					0x00000000 0x00000007 0x0000000c 0x00000012
+					0x00000014 0x000012c3 0x00000000 0x000004b0
+					0x00000002 0x0000000d 0x00000001 0x00000000
+					0x0000005d 0x00000015 0x0000006b 0x00000200
+					0x00000005 0x00000005 0x00000005 0x00000019
+					0x00000000 0x00000006 0x00000007 0x00001304
+					0x00000009 0x00000006 0x80000000 0x00000000
+					0x0000ba88 0xf00d0191 0x00008000 0x007fc007
+					0x007fc007 0x007fc007 0x007fc007 0x007fc007
+					0x007fc007 0x007fc007 0x007fc007 0x00010000
+					0x00010000 0x00010000 0x00010000 0x00010000
+					0x00010000 0x00010000 0x00010000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x007fc00b
+					0x007fc00b 0x007fc00b 0x007fc00b 0x001112a0
+					0x00000000 0x00000000 0x77ffc085 0x81f1f108
+					0x07077504 0x00000000 0x20820800 0x0028a28a
+					0x0000003f 0x00000000 0x02000000 0x00000100
+					0x0161000c 0x00000000 0x00000000 0x80002617 >;
+			};
+
+			timing-792000000 {
+				clock-frequency = <792000000>;
+
+				nvidia,emc-zcal-cnt-long = <0x00000042>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-cfg = <0x53000000>;
+				nvidia,emc-mode-1 = <0x80100002>;
+				nvidia,emc-mode-2 = <0x80200418>;
+				nvidia,emc-mode-4 = <0x00000000>;
+				nvidia,emc-mode-reset = <0x80000d71>;
+				nvidia,emc-auto-cal-config = <0xa0f10f0f>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mrs-wait-cnt = <0x0148000c>;
+				nvidia,emc-sel-dpd-ctrl = <0x00040000>;
+				nvidia,emc-xm2dqspadctrl2 = <0x0000013d>;
+				nvidia,emc-zcal-interval = <0x00020000>;
+
+				nvidia,emc-configuration =  < 0x00000025
+					0x0000007d 0x0000001a 0x00000009 0x00000008
+					0x0000000d 0x00000004 0x00000013 0x00000009
+					0x00000009 0x00000004 0x00000001 0x00000000
+					0x00000006 0x0000000f 0x0000000a 0x0000000b
+					0x00000008 0x00000006 0x00010000 0x00000000
+					0x00000000 0x00000008 0x0000000d 0x00000014
+					0x00000016 0x000017e1 0x00000000 0x000005f8
+					0x00000003 0x00000011 0x00000001 0x00000000
+					0x00000076 0x00000018 0x00000087 0x00000200
+					0x00000005 0x00000005 0x00000005 0x00000020
+					0x00000000 0x00000007 0x00000008 0x00001822
+					0x00000000 0x00000006 0x80000000 0x00000000
+					0x00005088 0xf0070191 0x00008000 0x00000008
+					0x00000007 0x00000007 0x00000007 0x00000007
+					0x00000007 0x00000007 0x00000007 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x0000000a
+					0x0000000a 0x0000000a 0x0000000a 0x001112a0
+					0x00000000 0x00000000 0x77ffc085 0x81f1f108
+					0x07077704 0x00000000 0x20820800 0x0028a28a
+					0x0000003f 0x00000000 0x02000000 0x00000100
+					0x0148000c 0x00000000 0x00000000 0x80003012 >;
+			};
+		};
+	};
+
 	pwrseq-wifi {
 		clocks = <&palmas_clk32k>;
 		clock-names = "ext_clock";
-- 
2.53.0

