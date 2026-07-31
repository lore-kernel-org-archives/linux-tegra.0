Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48ED40099D
	for <linux-tegra@vger.kernel.org>; Fri, 31 Jul 2026 11:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785498093; cv=none; b=VZn6wT5Hg24zHCtC6m1yS1AQp3tyIy4xBOYK+SrMAXFnjMVtU73thnDpLqtGJuB31lKtwAqZV/XGmrXWzE/Jnf20qg9IJ3bq8RrXvQahuYr0k5+hT/udPMYgS/xZXcJ11ynzdGCsULm2IIlg4d2LwtLNqihaJw9IvWyosIHAeFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785498093; c=relaxed/simple;
	bh=/dBw92iG9SAfNJ/dywwNy2j0aZubuN9pPRC1h13SHcM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gH8rpAdt7IbczSVvFp7+En/zkWMBXaSHbsySYOaiogat2mOncwGXOYWN58isKA82ab8i3EKyPkiN0tByPV4Wwl/zjQDCMMIznJXKiGqxL6UU9HTY/JosFCK4qX7Tw8IvbE8HTMG5h/IpEqNHikask9z4LnjnRkp0EbfO5vW8+aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LeBGncnH; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LeBGncnH"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47640541585so654358f8f.1
        for <linux-tegra@vger.kernel.org>; Fri, 31 Jul 2026 04:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785498085; x=1786102885; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zj8lp5mkuq3+KdvgNjIXifWrUsjJxIzHEtVFKGY7X/E=;
        b=LeBGncnHY7w6vdJDKHhjg7havu6EkrA898m2BWAzk3XPtJv2XGA3e5SbXDiWIJF0nK
         ztzbVDL3qlAMzVYTnIduWJlLw53pIR8MwLorLfxJBunBC6O8kqjOk1TSeY+/qg8ueCvL
         6Pf+mxv6xwhWlqI5RBY0uUHgoLyerNotwML53X62kh9f3dD/XKngefpn5SD/5+DByRjV
         m4dHZipbe/gE5WOymPeGZL/omVjHJGj+iIdWGEAHB2NklKLePR8hqYixfkKtwFID7sg0
         nRUmcOFQmv2P14lBDk54g+kDLJpwHOOAuibAnhKSbsDeFxHpBmslUOfvUYECPhjqII0S
         oLQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785498085; x=1786102885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zj8lp5mkuq3+KdvgNjIXifWrUsjJxIzHEtVFKGY7X/E=;
        b=lBTgJTLK3xlIDQa/vybb8fR0q4S2ZdwsLVnVGmKToWboar4/En84KHtBymdXyzMTZb
         diKNWw9WY16rQOWDiLLe0pwFc9wxMLIUoOdGwpfc7jqsAhoit9a3A1mG5nuQs2b5vuy1
         juPcDrp3A4H9JcO0yE4PMugBowKbNhpTwiQqUFwKCMDe8WA60QT7mULKO8OxkWr3l5Uo
         A1WJAlE+7WhjCY0fBZ4eKle31gUtCbmWgS8jG9LQvkOc0RUomf27gXNppRybNJawFikR
         o/d3VEoOLBLhOhiTlUuIwFzqzFBrG4PtSv+qTnqNIQm9tdiumCGEG2b7CFxGlN15Yfxe
         LR6g==
X-Forwarded-Encrypted: i=1; AHgh+Rq1YKWjfhB2DBrMw0DPwn4znaX3mVxqLpu1Q0qFoVtkCNo6Yutymq7ep4V2qBSHQ3xI2QqTRfSy4qFQaA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxAA8tb4TMKiNUZy+NO2u3NcOKf8HPlCMEMOn7bg5nMbDBLw8Yq
	eZ97gle2FMwO16I7z0245Y8aKketZD1nYyy5qmemklB0l79uG1ACyNOf
X-Gm-Gg: AR+sD10GBgjMSOagl/2SnApL99/hAmD1mct5pOxvYFCGXv1pcYnJrr9nnv9vxD3Ea6a
	xKtroWMTYwJ753Ww8ZRZfyc4uPj/lQofOiZvdSUCmXjvA+pYKgDg1T1mw5tuGda3ynmf/DO+8kG
	ThEf/N1MZyetLbiCFF343H5qhbBAFguK8eK1Ivnq2eN3E7TMDqHn0Ds0NDImd0ZgfARAjGs+dF9
	Vp3quRi9IVmBVOpB8M26WMUnG1l+nZbKx/qiFxYj/H2JpaJ2BAJ6C//duggjTDFwt4mu0VC3Vf2
	L3K/Zt7sqqLm5seD4NywzRBjA2sa5Kk5JmtkXy3/RskFcw2hBzlKkcEyEYlafpUUk/F69pcFyv0
	KYlfoET6uMeGjEso8rquWUZdI+U2KdIBK9homj9O21EWKtqKYFxAOZHyq1bw40PmqPUx+stS16u
	vXy3k+UMy+HwPkypcGuWjjfwLG1oe7XTrcqBfuK2goDeEukZqPLOcD3X0P8LPeFURkR+pB9ftfl
	h3RDHXUOw==
X-Received: by 2002:a05:6000:430b:b0:47f:90a4:ff40 with SMTP id ffacd0b85a97d-47fd2b4d9ebmr3778944f8f.42.1785498085075;
        Fri, 31 Jul 2026 04:41:25 -0700 (PDT)
Received: from xeon ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41d0064sm3769336f8f.5.2026.07.31.04.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 04:41:24 -0700 (PDT)
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
Subject: [PATCH v3 03/10] ARM: tegra: tf701t: Add MC and EMC timing nodes
Date: Fri, 31 Jul 2026 14:40:59 +0300
Message-ID: <20260731114106.169398-4-clamor95@gmail.com>
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

Configure Memory Controllers of ASUS TF701T.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
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

