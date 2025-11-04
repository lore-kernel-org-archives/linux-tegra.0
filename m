Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD417321448
	for <linux-tegra@vger.kernel.org>; Tue,  4 Nov 2025 13:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762262634; cv=none; b=CzVUI2nnHl+BuDSkY3zkqhP3wELKRVpDzG8+D+TvDa0vjy0q9B7XyH38E+vFuffSi2ULuz8pFebKXakl+kKtBPiekLj9NZ7GPSHvY+y0XAKKPVNt2KCJECx8t2htb9Ou3LNqH65dAOkhVI2zzb02HpGJTkaYo4yFbKeWqRB1Oww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762262634; c=relaxed/simple;
	bh=iYTmxaSkjynJSKDBodzJ+hFQQBLLaw63cPyADt4tUbY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mBD+ydMV4UAJIBCylIvlFjHllH5RVp9qcw3bO77ET9T7vSb3299sg7BScHqYIVf4+ATxrYAXPqjK7fEB9KOcD5ApOzR/Y1qSKUX/YoU2T0Ur+zRLhn7e4Qk7hNS6JRPBArgyHJNKJLZAXO5sAeNu/EWfLNidZBm+0woTxbtGM9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R8wCDHqy; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R8wCDHqy"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-42557c5cedcso3300172f8f.0
        for <linux-tegra@vger.kernel.org>; Tue, 04 Nov 2025 05:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762262631; x=1762867431; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W1msK8uwNT2Pd0624PgoUIAgEM0B2ajmJspc/VgQELw=;
        b=R8wCDHqy/VnxrbwJArq36UhGcrMr49P9r4Uz6Tw4BXF/FKJZNNI0K2M5QgopoX6ASl
         BjyjcCY2YmZYBDiA6MVEwPWI30iaS/rTmy2AEFbEIohz+n4QVuEeeqVYRYHdTnlPI/C/
         Tvb3ZC7DeCT023iRYDEc0UDpAPFCcOyb2NhMbWBFwUu1+ze1YO8qDC60YyOWBGuSPlck
         ySk8BGRp14V/1PU6o5g+iMH6/dNb611dNcOfEhEXeIDvDGU9iwnbzSClOQtdk5bUgxw7
         wyX7DdiCuMM9I/Zf81zfdNNXluGCHPEdt7crr/6dIt4K68rcxwo9jhoPbyaXLBMe7TXF
         92gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762262631; x=1762867431;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W1msK8uwNT2Pd0624PgoUIAgEM0B2ajmJspc/VgQELw=;
        b=Gl7r2LuIpShtCRD0zEHg7M9IyuvZvDyF79yotvsIFiV6eQQzKj7unsNCRqr8HyLyZZ
         X0SYvFHHF4gKCnsq0ERiQaeSSV9eg+St2j1EfsLAR2kmhz/pL6coAMUH7eyjCD47Mgqs
         3nwoYerpTw8iMWv7JdLxR+QBlg7/mrEVvz6W1R7KTyM1Bg/XYBi4K+8XG78wJITaWK8M
         LjqwWj/ibU1Yv3UJosnD/D5rJ5SOuuIspiNVq5k5sm3w+h+AKsxgbD7T6UGVHcSAmEHB
         jNfoI61jE8wwWCcB78fc9xt/gGsCdd38cun7+JZ2xGaz1YtRTYUTs9Va6MAdm0tagEn6
         pt8A==
X-Forwarded-Encrypted: i=1; AJvYcCWKM+TUFMtaiM0JOiodyuJxTRIRfBLyQNnU73DQLb9hyb2xgg+ov/tvtyAjG9iUhCNLD7955hTQxPi7+A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyEpyH3MKzHOOFjxhf9meOiTXjrH1ckrmP0lu4Tn/dSyUcb6HYl
	hl4h9u3k+Vfn4RpGVg6l8cgvizdlpXSgfV33CX5b0Dj8dOBtYFozY1RRuTMIDw==
X-Gm-Gg: ASbGncsE44BMQxtLUl/FqGresEIDURfkgTqtbEScSrvoLh8bLjb/SFtOpkNx77RE9n1
	nHFKvVdYyYi+n9aumeMhVEYC8t5K3dtqp5oLp74C4Tbf4EFpWwUQFUOwgtJW7ZCJnW/h+E7kqeg
	4aAMBAjdhH07/gFQc5VziSUEtuak1KBc1PS5JFGJQqF62ogR9BoOqOEg5uARMOtIkDUUkVwHT1k
	w8hu9NOWxID4vzREdIfBiQxtlXzFmB9nemoVadjDXfrekB/gqBGsLw6Aj3/KnqfVRiEqRIkKWVI
	2uElQGKtQsh8+f804IWY/xFhkcGl1aHYpWsUpCBe+ARRYT0RoUeooVAtAOsKKRk+KcxWgiS7WeM
	s2FL1zZIbD4MRLbTuzkt37JR2Nsntrop3VfQSLeZwvVZM0iw/NvSm7xhtNlPV1GFCIA2Ir7b3SG
	bSUWxsLdEfIClY300xebokce1kbV9DtDdkm6Y1uOb9yocu4WMMJ1N5fsbVHF4hAoriiajujcz6Q
	hll/lQ=
X-Google-Smtp-Source: AGHT+IFSQx1vtQ2C+oL6FqZpKp0JNwcbY6IuLZBEhXulCO2/Hyoq1Msch4iRUmmQ6W53lQ4nerWjlg==
X-Received: by 2002:a05:6000:40ca:b0:426:ee84:259e with SMTP id ffacd0b85a97d-429bd696b6dmr12955771f8f.24.1762262630897;
        Tue, 04 Nov 2025 05:23:50 -0800 (PST)
Received: from localhost (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429dc1a850fsm4828168f8f.20.2025.11.04.05.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 05:23:49 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: sheetal <sheetal@nvidia.com>,
	linux-tegra@vger.kernel.org
Subject: [PATCH] arm64: tegra: Move HDA into the correct bus
Date: Tue,  4 Nov 2025 14:23:45 +0100
Message-ID: <20251104132345.1689397-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

HDA is part of the DISP_USB bus, so move it into that and drop the
address prefix accordingly.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../arm64/boot/dts/nvidia/tegra264-p3971.dtsi |  4 ++-
 arch/arm64/boot/dts/nvidia/tegra264.dtsi      | 32 +++++++++----------
 2 files changed, 19 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra264-p3971.dtsi b/arch/arm64/boot/dts/nvidia/tegra264-p3971.dtsi
index 1fcfac2066ae..b1bd4ee7aee3 100644
--- a/arch/arm64/boot/dts/nvidia/tegra264-p3971.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra264-p3971.dtsi
@@ -29,8 +29,10 @@ interrupt-controller@9960000 {
 				status = "okay";
 			};
 		};
+	};
 
-		hda@88090b0000 {
+	bus@8800000000 {
+		hda@90b0000 {
 			nvidia,model = "NVIDIA Jetson Thor AGX HDA";
 			status = "okay";
 		};
diff --git a/arch/arm64/boot/dts/nvidia/tegra264.dtsi b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
index c66ea12ef5a3..f137565da804 100644
--- a/arch/arm64/boot/dts/nvidia/tegra264.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
@@ -3347,22 +3347,6 @@ pmc: pmc@c800000 {
 			#interrupt-cells = <2>;
 			interrupt-controller;
 		};
-
-		hda@88090b0000 {
-			compatible = "nvidia,tegra264-hda";
-			reg = <0x88 0x90b0000 0x0 0x10000>;
-			interrupts = <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&bpmp TEGRA264_CLK_AZA_2XBIT>;
-			clock-names = "hda";
-			resets = <&bpmp TEGRA264_RESET_HDA>,
-				 <&bpmp TEGRA264_RESET_HDACODEC>;
-			reset-names = "hda", "hda2codec_2x";
-			interconnects = <&mc TEGRA264_MEMORY_CLIENT_HDAR &emc>,
-					<&mc TEGRA264_MEMORY_CLIENT_HDAW &emc>;
-			interconnect-names = "dma-mem", "write";
-			iommus = <&smmu3 TEGRA264_SID_HDA>;
-			status = "disabled";
-		};
 	};
 
 	/* TOP_MMIO */
@@ -3716,6 +3700,22 @@ smmu3: iommu@6000000 {
 			#iommu-cells = <1>;
 			dma-coherent;
 		};
+
+		hda@90b0000 {
+			compatible = "nvidia,tegra264-hda";
+			reg = <0x0 0x90b0000 0x0 0x10000>;
+			interrupts = <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&bpmp TEGRA264_CLK_AZA_2XBIT>;
+			clock-names = "hda";
+			resets = <&bpmp TEGRA264_RESET_HDA>,
+				 <&bpmp TEGRA264_RESET_HDACODEC>;
+			reset-names = "hda", "hda2codec_2x";
+			interconnects = <&mc TEGRA264_MEMORY_CLIENT_HDAR &emc>,
+					<&mc TEGRA264_MEMORY_CLIENT_HDAW &emc>;
+			interconnect-names = "dma-mem", "write";
+			iommus = <&smmu3 TEGRA264_SID_HDA>;
+			status = "disabled";
+		};
 	};
 
 	/* UPHY MMIO */
-- 
2.51.2

