Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA0D47DD4C
	for <linux-tegra@vger.kernel.org>; Tue, 21 Jul 2026 10:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784628677; cv=none; b=TuFQXuxzC3mrlSIFwO3hcuVzMDZEePNKJw4oExEU2tgZ5vHGpbCD8h011K+m2N/8EPCoY0fOeLKXcD93qcRFK+EWCL3rwwAUH7RYjTAVA4DaVVilTGb2++tIiVgJsd3RQriIffFIsiyRGJvqItjdRDqr0HHww8/SLFDXlEeoLc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784628677; c=relaxed/simple;
	bh=5KZkYN6JnNuUL1SCNyhPp6X3GORuCfyuJLEI9nvfoLM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h9Jk9IO/XrEnjJJ9uL1+GeeZOPCueUd8VyINS8UstktKFhFI03+Bk+1jZQ04yQet359KAXnD8g3TLLrzZ5JoVim6dGxmx9B+jPeb7DqdjUmxsE2LoaYtdBdE8UPpU6DKcqSGdi1qYmzzzceU39XqDC/NYoEooaJeCVdNr2fi984=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GqL3xotD; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GqL3xotD"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4954aff6088so25652335e9.3
        for <linux-tegra@vger.kernel.org>; Tue, 21 Jul 2026 03:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784628672; x=1785233472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BUwny/ws7CVzkY1ubGMDiYXx3oPeT6d0kPnvlkTocII=;
        b=GqL3xotDmg7DluuNcgjHqC80DVwvNkkdnqVZ9VJgNqxIaa/5CZI2395Y9rsqAC+Unq
         c/vUsm+f5aW0oLgzW/DJbnExpRjE8qJX2EImzk2TEGBr0+mL/MtEBUTwNOn4voFLSWhQ
         Xjh40i6qjyUHsp5YbB6reM8+Sdq4lnXH0Ym1sjgoSGwGobhHW4LQqaekfLkwhkPurvsz
         fYySlif/iOp7rNdLKSmHVjiiRyqeGSvlkZM2kHu3DSEwftopEiqJ6wgVicl2jTDolLgA
         tCy1219NgvNoJdT0J7nEJ06vUdJSL7ts7uIQVKI/JBWY2/WrmuMdx0CuX7z1qHOdBZPB
         x86A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784628672; x=1785233472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BUwny/ws7CVzkY1ubGMDiYXx3oPeT6d0kPnvlkTocII=;
        b=muKSPXIrFLeiGWYmlv9ZLJME6crH6CNnbwNCdSVZ+dZneQP4IBqqI73903ZRzgrvVI
         SkiJF1n3fCMojZV7SsNbLN7HaAlnRe4xEwjUCBKyCbKERYDECJmIbCs/+lANBcuC8YzP
         TTZX/uBuaYQowaijLOpIMGebGpJVt48plbYlMFBqR/KUO0+xudoLlhqaxuFuELPmpPSq
         T3lVTpBB/Wbkfr0daBv3fuHEIYetWy7YwFpM81smdRWaGh2ddReszNsc+1aeoO33QgRq
         aFqUnZ/PP7H0p38OtyDx51XAkookP56oMG6+AKoE34ll05u63SvSIH/Cz/PRI4e4Tf0V
         iFAg==
X-Forwarded-Encrypted: i=1; AHgh+Rq+A297XiNCQ+//NaTY870bflH98Bd3Pvr4D74mgUxT6c98KHi2c1rvixlIG1GqYGjYXrQmh3/UCz9New==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2KNAtvr9M2P2eY2uXSRT9qWW4XSJNP2vQ8BpUbl70hatrjV3B
	k7Ay2noEl5U+1gnhDk6PB0I/H+30rcklNM/6AN+tGdCABh1QvZQxV0LV
X-Gm-Gg: AfdE7cnrxSVvVbHMzZn3rWJkNvmeL1RXuZwcK0PXkpHA/JhbQC9RY41e9LqxJwI9hjL
	XuE5AfrOj3uIdBlPR7rDHKV4MnFZqMDjWpESROXP81uQ2GSe9h28V4LAx4OUBGdeDjxwdusmszf
	GRPsdlFOxUsGBOYRfMIJxd/22kSELumAKr2uGq4EytAHcWMUN3lI6/uDl7r1tbdYvgYk1OB/ywA
	LYZc5mFI7gboyYzqTMk8sgGFC5tiy34Kr00xzDmuXGCVJByw/U3ncTnkN/4IQ3ch2r6szMwOTQR
	FRPb0eXosbnS9guaBnx9TTjUdwvQwviGrw0necXTfHiztVvZ3kdODeR+IaOgM2Ah7r4UKbZr+vW
	cr3oGopd1mLqlFYr2WIU3lZI8zAuOXG8BXTeaM3Zrh6kC52L1hGyLJfGbJvxqrSWLvU3JpQabva
	Wx37/Lt1jHYTgaatphdN7aPwY=
X-Received: by 2002:a05:600c:198b:b0:495:5044:d37d with SMTP id 5b1f17b1804b1-4955044d4e8mr150711245e9.19.1784628671772;
        Tue, 21 Jul 2026 03:11:11 -0700 (PDT)
Received: from xeon ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956547319dsm57127085e9.5.2026.07.21.03.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:11:11 -0700 (PDT)
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
Subject: [PATCH v2 03/10] ARM: tegra: tf701t: Add MC and EMC timing nodes
Date: Tue, 21 Jul 2026 13:10:52 +0300
Message-ID: <20260721101059.451699-4-clamor95@gmail.com>
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

Configure Memory Controllers of ASUS TF701T.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../boot/dts/nvidia/tegra114-asus-tf701t.dts  | 713 ++++++++++++++++++
 1 file changed, 713 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
index 55e9256e80f33..00eeedf3ef7a5 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
+++ b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
@@ -101,6 +101,89 @@ panel_secondary: panel@0 {
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
 	vde@6001a000 {
 		assigned-clocks = <&tegra_car TEGRA114_CLK_VDE>;
 		assigned-clock-parents = <&tegra_car TEGRA114_CLK_PLL_P>;
@@ -1610,6 +1693,636 @@ i2c-thermtrip {
 		};
 	};
 
+	memory-controller@70019000 {
+		emc-timings-0 {
+			/* Mozart Rev B Hynix DDR3 792MHz */
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
+					0x06030102 0x000a0402 0x76230303 0x001f0000 >;
+			};
+
+			timing-40800000 {
+				clock-frequency = <40800000>;
+
+				nvidia,emem-configuration = < 0xa0000001 0x8000005b
+					0x00000001 0x00000001 0x00000002 0x00000000
+					0x00000001 0x00000001 0x00000002 0x00000008
+					0x00000002 0x00000001 0x00000003 0x00000006
+					0x06030102 0x000a0402 0x74a30303 0x001f0000 >;
+			};
+
+			timing-68000000 {
+				clock-frequency = <68000000>;
+
+				nvidia,emem-configuration = < 0x00000001 0x80000076
+					0x00000001 0x00000001 0x00000002 0x00000000
+					0x00000001 0x00000001 0x00000002 0x00000008
+					0x00000002 0x00000001 0x00000003 0x00000006
+					0x06030102 0x000a0402 0x74230403 0x001f0000 >;
+			};
+
+			timing-102000000 {
+				clock-frequency = <102000000>;
+
+				nvidia,emem-configuration = < 0x08000001 0x80000098
+					0x00000001 0x00000001 0x00000003 0x00000000
+					0x00000002 0x00000001 0x00000002 0x00000008
+					0x00000002 0x00000001 0x00000003 0x00000006
+					0x06030102 0x000a0403 0x73c30504 0x001f0000 >;
+			};
+
+			timing-204000000 {
+				clock-frequency = <204000000>;
+
+				nvidia,emem-configuration = < 0x01000003 0x800000fe
+					0x00000001 0x00000001 0x00000005 0x00000002
+					0x00000004 0x00000001 0x00000002 0x00000008
+					0x00000002 0x00000001 0x00000003 0x00000006
+					0x06030102 0x000a0405 0x73840a06 0x001f0000 >;
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
+					0x08060202 0x00160d13 0x734c2414 0x001f0000 >;
+			};
+		};
+	};
+
+	external-memory-controller@7001b000 {
+		emc-timings-0 {
+			/* Mozart Rev B Hynix DDR3 792MHz */
+			nvidia,ram-code = <0>;
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
+					0x00000005 0x00000000 0x00000000 0x00000004
+					0x0000000a 0x00000003 0x0000000b 0x00000000
+					0x00000000 0x00000003 0x00000001 0x00000000
+					0x00000005 0x0000000f 0x00000006 0x00000006
+					0x00000004 0x00000004 0x00010000 0x00000000
+					0x00000000 0x00000004 0x00000009 0x0000000d
+					0x0000000f 0x0000009a 0x00000000 0x00000026
+					0x00000002 0x00000002 0x00000001 0x00000000
+					0x00000007 0x0000000f 0x00000006 0x00000006
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
+					0x0000000a 0x00000001 0x00000000 0x00000004
+					0x0000000a 0x00000003 0x0000000b 0x00000000
+					0x00000000 0x00000003 0x00000001 0x00000000
+					0x00000005 0x0000000f 0x00000006 0x00000006
+					0x00000004 0x00000004 0x00010000 0x00000000
+					0x00000000 0x00000004 0x00000009 0x0000000d
+					0x0000000f 0x00000134 0x00000000 0x0000004d
+					0x00000002 0x00000002 0x00000001 0x00000000
+					0x00000008 0x0000000f 0x0000000c 0x0000000c
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
+					0x00000011 0x00000002 0x00000000 0x00000004
+					0x0000000a 0x00000003 0x0000000b 0x00000000
+					0x00000000 0x00000003 0x00000001 0x00000000
+					0x00000005 0x0000000f 0x00000006 0x00000006
+					0x00000004 0x00000004 0x00010000 0x00000000
+					0x00000000 0x00000004 0x00000009 0x0000000d
+					0x0000000f 0x00000202 0x00000000 0x00000080
+					0x00000002 0x00000002 0x00000001 0x00000000
+					0x0000000f 0x0000000f 0x00000013 0x00000013
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
+					0x0000001a 0x00000003 0x00000001 0x00000004
+					0x0000000a 0x00000003 0x0000000b 0x00000001
+					0x00000001 0x00000003 0x00000001 0x00000000
+					0x00000005 0x0000000f 0x00000006 0x00000006
+					0x00000004 0x00000004 0x00010000 0x00000000
+					0x00000000 0x00000004 0x00000009 0x0000000d
+					0x0000000f 0x00000303 0x00000000 0x000000c0
+					0x00000002 0x00000002 0x00000001 0x00000000
+					0x00000018 0x0000000f 0x0000001c 0x0000001c
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
+					0x00000035 0x00000007 0x00000002 0x00000004
+					0x0000000a 0x00000003 0x0000000b 0x00000002
+					0x00000002 0x00000003 0x00000001 0x00000000
+					0x00000005 0x0000000f 0x00000007 0x00000006
+					0x00000004 0x00000004 0x00010000 0x00000000
+					0x00000000 0x00000004 0x00000009 0x0000000d
+					0x0000000f 0x00000607 0x00000000 0x00000181
+					0x00000002 0x00000002 0x00000001 0x00000000
+					0x00000032 0x0000000f 0x00000038 0x00000038
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
+				nvidia,emc-mrs-wait-cnt = <0x0171000c>;
+				nvidia,emc-sel-dpd-ctrl = <0x00040320>;
+				nvidia,emc-xm2dqspadctrl2 = <0x0001013d>;
+				nvidia,emc-zcal-interval = <0x00020000>;
+
+				nvidia,emc-configuration =  < 0x0000000e
+					0x00000050 0x00000009 0x00000003 0x00000004
+					0x00000008 0x00000002 0x00000009 0x00000003
+					0x00000003 0x00000002 0x00000001 0x00000000
+					0x00000004 0x0000000f 0x00000006 0x00000006
+					0x00000005 0x00000004 0x00010000 0x00000000
+					0x00000000 0x00000004 0x0000000b 0x0000000d
+					0x0000000f 0x00000941 0x00000000 0x00000250
+					0x00000001 0x00000008 0x00000001 0x00000000
+					0x0000004d 0x0000000e 0x00000055 0x00000200
+					0x00000004 0x00000004 0x00000004 0x0000000d
+					0x00000000 0x00000004 0x00000005 0x00000982
+					0x00000000 0x00000004 0x00000020 0x00000000
+					0x00005088 0x002c00a0 0x00008000 0x00030000
+					0x00030000 0x00030000 0x00030000 0x00030000
+					0x00030000 0x00030000 0x00030000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x0003c000
+					0x0003c000 0x0003c000 0x0003c000 0x001112a0
+					0x00000000 0x00000000 0x77ffc085 0x81f1f108
+					0x03037504 0x00000000 0x20820800 0x00249249
+					0x0000003f 0x00000000 0x02000000 0x00000100
+					0x0171000c 0x00000000 0x00000000 0x8000138d >;
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
+				nvidia,emc-mrs-wait-cnt = <0x0158000c>;
+				nvidia,emc-sel-dpd-ctrl = <0x00040320>;
+				nvidia,emc-xm2dqspadctrl2 = <0x0001013d>;
+				nvidia,emc-zcal-interval = <0x00020000>;
+
+				nvidia,emc-configuration =  < 0x00000012
+					0x00000069 0x0000000d 0x00000004 0x00000005
+					0x00000009 0x00000002 0x0000000c 0x00000004
+					0x00000004 0x00000002 0x00000001 0x00000000
+					0x00000004 0x0000000f 0x00000006 0x00000006
+					0x00000005 0x00000004 0x00010000 0x00000000
+					0x00000000 0x00000004 0x0000000c 0x0000000e
+					0x00000010 0x00000c2e 0x00000000 0x0000030b
+					0x00000001 0x00000008 0x00000001 0x00000000
+					0x00000066 0x00000011 0x0000006f 0x00000200
+					0x00000004 0x00000004 0x00000004 0x00000011
+					0x00000000 0x00000004 0x00000005 0x00000c6f
+					0x00000000 0x00000004 0x00000020 0x00000000
+					0x00005088 0x002c0080 0x00008000 0x00030000
+					0x00030000 0x00030000 0x00030000 0x00030000
+					0x00030000 0x00030000 0x00030000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x0003c000
+					0x0003c000 0x0003c000 0x0003c000 0x001112a0
+					0x00000000 0x00000000 0x77ffc085 0x81f1f108
+					0x03037504 0x00000000 0x20820800 0x00249249
+					0x0000003f 0x00000000 0x02000000 0x00000100
+					0x0158000c 0x00000000 0x00000000 0x80001941 >;
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
+				nvidia,emc-mrs-wait-cnt = <0x013a000c>;
+				nvidia,emc-sel-dpd-ctrl = <0x00040320>;
+				nvidia,emc-xm2dqspadctrl2 = <0x0000013d>;
+				nvidia,emc-zcal-interval = <0x00020000>;
+
+				nvidia,emc-configuration =  < 0x00000018
+					0x00000088 0x00000011 0x00000006 0x00000006
+					0x00000009 0x00000002 0x0000000d 0x00000006
+					0x00000006 0x00000002 0x00000001 0x00000000
+					0x00000005 0x0000000f 0x00000008 0x00000009
+					0x00000007 0x00000004 0x00010000 0x00000000
+					0x00000000 0x00000006 0x0000000c 0x00000010
+					0x00000012 0x00000fd6 0x00000000 0x000003f5
+					0x00000002 0x0000000b 0x00000001 0x00000000
+					0x00000084 0x00000012 0x0000008f 0x00000200
+					0x00000004 0x00000004 0x00000004 0x00000016
+					0x00000000 0x00000005 0x00000006 0x00001017
+					0x00000000 0x00000006 0x00000020 0x00000000
+					0x00005088 0xf0120091 0x00008000 0x0000000a
+					0x0000000a 0x0000000a 0x0000000a 0x0000000a
+					0x0000000a 0x0000000a 0x0000000a 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x0000000c
+					0x0000000b 0x0000000c 0x0000000c 0x001112a0
+					0x00000000 0x00000000 0x77ffc085 0x81f1f108
+					0x07077504 0x00000000 0x20820800 0x00249249
+					0x0000003f 0x00000000 0x02000000 0x00000100
+					0x013a000c 0x00000000 0x00000000 0x80002062 >;
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
+				nvidia,emc-mrs-wait-cnt = <0x0122000c>;
+				nvidia,emc-sel-dpd-ctrl = <0x00040320>;
+				nvidia,emc-xm2dqspadctrl2 = <0x0000013d>;
+				nvidia,emc-zcal-interval = <0x00020000>;
+
+				nvidia,emc-configuration =  < 0x0000001d
+					0x000000a1 0x00000014 0x00000007 0x00000007
+					0x0000000b 0x00000003 0x00000010 0x00000007
+					0x00000007 0x00000002 0x00000001 0x00000000
+					0x00000005 0x0000000f 0x00000009 0x0000000a
+					0x00000008 0x00000004 0x00010000 0x00000000
+					0x00000000 0x00000007 0x0000000c 0x00000012
+					0x00000014 0x000012c3 0x00000000 0x000004b0
+					0x00000002 0x0000000d 0x00000001 0x00000000
+					0x0000009c 0x00000015 0x000000a9 0x00000200
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
+					0x0000000b 0x0000000b 0x0000000b 0x001112a0
+					0x00000000 0x00000000 0x77ffc085 0x81f1f108
+					0x07077504 0x00000000 0x20820800 0x0028a28a
+					0x0000003f 0x00000000 0x02000000 0x00000100
+					0x0122000c 0x00000000 0x00000000 0x80002617 >;
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
+				nvidia,emc-mrs-wait-cnt = <0x00f8000c>;
+				nvidia,emc-sel-dpd-ctrl = <0x00040000>;
+				nvidia,emc-xm2dqspadctrl2 = <0x0000013d>;
+				nvidia,emc-zcal-interval = <0x00020000>;
+
+				nvidia,emc-configuration =  < 0x00000025
+					0x000000cc 0x0000001a 0x00000009 0x00000008
+					0x0000000d 0x00000004 0x00000013 0x00000009
+					0x00000009 0x00000003 0x00000001 0x00000000
+					0x00000006 0x0000000f 0x0000000a 0x0000000b
+					0x00000008 0x00000006 0x00010000 0x00000000
+					0x00000000 0x00000008 0x0000000d 0x00000014
+					0x00000016 0x000017e1 0x00000000 0x000005f8
+					0x00000003 0x00000011 0x00000001 0x00000000
+					0x000000c6 0x00000018 0x000000d6 0x00000200
+					0x00000005 0x00000005 0x00000005 0x00000020
+					0x00000000 0x00000007 0x00000008 0x00001822
+					0x00000000 0x00000006 0x80000000 0x00000000
+					0x00005088 0xf0070191 0x00008000 0x00000009
+					0x00000009 0x00000009 0x00000009 0x00000009
+					0x00000009 0x00000009 0x00000009 0x00018000
+					0x00018000 0x00018000 0x00018000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x0000000b
+					0x0000000b 0x0000000b 0x0000000b 0x001112a0
+					0x00000000 0x00000000 0x77ffc085 0x81f1f108
+					0x07077504 0x00000000 0x1c71c700 0x0028a28a
+					0x0000003f 0x00000000 0x02000000 0x00000100
+					0x00f8000c 0x00000000 0x00000000 0x80003012 >;
+			};
+		};
+	};
+
 	ahub@70080000 {
 		/* HIFI CODEC (i2s1) */
 		i2s@70080400 {
-- 
2.53.0

