Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE21230264
	for <linux-tegra@vger.kernel.org>; Sun,  4 Oct 2026 15:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791128759; cv=none; b=qR9n+mEQlbvgsKeyH4qMpXzy+/ktivN9QOpg0xl+RtFNR4mRXE9CO7oYTa7s5hxlyiccC6Lb7ne7/EkOkVoZjhqQ584+kNPbtq1nxA4ZpQjyvwxLPiCqk+nd6sSWujOYkMpPvCCILpQOGH1DLQMUgLOU5kZFU962CpPe4jYSJWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791128759; c=relaxed/simple;
	bh=K1VIZ3NwHt5qEWl3louZYpxajUVl1gB557HUIiN0qII=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G3Keh2A0I4Wkr6OxjnYs7KIphTti1Pn9CtJfkf9VPWbLMj91g8tPyJhQrOHDPgxtDXss2mhxtnp3eQ2djd9cd8r7GQasXJaUYyPTd5MQ5kSHtuymE4f6GnNdsWiXjcw4z3KbfAhejuXo+tONhEGqu4OItUiqsfH7VbqC1mXUlS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ojZ2or1P; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ojZ2or1P"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a1681949b8so5794005e9.1
        for <linux-tegra@vger.kernel.org>; Sun, 04 Oct 2026 08:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791128744; x=1791733544; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T1cONhEHrcirrtFRMhHudThkO2tsvRRJIxPc9+WouMU=;
        b=ojZ2or1PwufYCbu1U8opKRRmjymNYEFG1G2xGJv9IH90cbEwzBzr9W4wSuEjqnQ8A0
         YU8cLRFuU4wDfYpOlIDODIyooouRv1XhJGA94DGCbU2pOYkuwWXAX2n2acZfK/yV+/1Z
         kg9vLUr69NXR8drX/XOsQ43MsoHaC2F2vyfrni05CAXdYBrOfdwuiscEh7fU1PeITH6i
         vJfB/Mjex2CSSQK6Cdqi3XugFfuLGmfonBveQ56A5IFP2mLMfohCTOSs0ixIA18fizL1
         dCruMmdFOyj5LBiO+n3TVUBm5tzFDT7E/7I0C3UJdRXUSPlk5B/q6LVxPlEk7PiBwFTi
         UgbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791128744; x=1791733544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T1cONhEHrcirrtFRMhHudThkO2tsvRRJIxPc9+WouMU=;
        b=rFo3guth3KTojtPb2gQLVcZ25Nzo3IUiIBGyGrUGk3g5jhhIYnzCVJ+bBNTSbzxm7e
         PNZm+DCYL/jLDdTIVAX3IgVuCLtms20v5j8KbnV4DYbVWvph+eomTRaHY4XyGWkqaXj/
         3XOeHIDLUCquCqmsBJYbAD2T/xKiKzrL8EwvFt26J3f0hJEIK5rkXOE8zsL9HLg5RFj7
         TuraAnQ28qMFLmFbHeQnOCt5XPI8UN24s92Q2MbRolpIJvD7uioyAYpgEIWzKhadE+83
         SJNbJjYKnppUu6ofHxl5t6Ijz5MyU0WBy/KfJxUBV/+cqUWwA298/BZt4ZV0slX4ktwF
         QljA==
X-Forwarded-Encrypted: i=1; AKwUvBxKVe7EttqL5hPEArHLSQJBnMGFFw1fk+qSjBYGPRGquEqOJKVbaZtpbJl5Iy+Cvl9bwQqZEsoNrJ6REQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mDVEDURk7XJsACx43Me1LNgcqhruJZ+NPjLvVhzhV+lUmkguOI
	acrjPdS9pv3iaGQzfjjSVLaAWS2HTkgUOBBWAbtFhxiB+HDrDJNuQ6fq
X-Gm-Gg: AYBFou3KSEpCEZxqCrjQan8KYjM0ggC3i8WAwQYPP7r9ypa7NP/t2YRmRM13NrOvvrs
	r+uH/NWGxTzjJYfDHIAbFuzSg21wORwdHseIHCLQsDKguzcC3QjSmzVrTb5qpLmQhHqERuiIhtm
	oA9wkvkZ3Vs9rAxx4I3+dSTAW7A+YJJExAhLbGXhO93Vj1r8gPcLoxqa+TGpKmzz/7FaQV1lKTL
	PWS99j7TawprKJUjI/sEgUg1DAohrrj8aRVbeJyZjVU4tEMMixYPEEyRIWI1H5wTt5505oEeBq3
	t0XPEtjiYLhs8dWhrYC6ZY6Wr+1JJG0bwji8dZdo+c+RBQ1ZG6tv2dMqrLr/EZV1+ArZba+OrpC
	bLoz15p7NnXes4IDXamRKBDR1YZ5JNJg5Ku0sFfX85NMd6R3uSSxzDOZZnaYOwyKQUt7sgaLhmF
	XqoMnCvaVeJoUn1nBesit8ArrYK02g//pTwO+Vw8J6y0U6qNAa3Z97ePIEahOEorP7o1nX75dNI
	vN9LJXkj5WEva3e0MA=
X-Received: by 2002:a05:600c:1546:b0:4a0:1c43:3c04 with SMTP id 5b1f17b1804b1-4a02756e5edmr142342575e9.13.1791128743642;
        Sun, 04 Oct 2026 08:45:43 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0394ca0f0sm168639935e9.1.2026.10.04.08.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 08:45:42 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Ion Agorria <ion@agorria.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/9] ARM: tegra: lg-x3: Add haptic engine node
Date: Sun,  4 Oct 2026 18:44:53 +0300
Message-ID: <20261004154456.145362-7-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261004154456.145362-1-clamor95@gmail.com>
References: <20261004154456.145362-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add node for Imagis ISA1200 haptic motor driver used in this device.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi | 24 +++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi b/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
index 99afd5d634e2b..1f10f4bfb5f24 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
@@ -1568,6 +1568,30 @@ power-sensor@40 {
 			vs-supply = <&vdd_3v0_sen>;
 		};
 
+		haptic-engine@49 {
+			compatible = "imagis,isa1200";
+			reg = <0x49>;
+
+			control-gpios = <&gpio TEGRA_GPIO(H, 1) GPIO_ACTIVE_HIGH>;
+
+			pwms = <&pwm 3 53000>;
+
+			vdd-supply = <&vdd_3v3_vbat>;
+			vddp-supply = <&vdd_1v8_vio>;
+
+			imagis,clk-div = <128>;
+			imagis,pll-div = <1>;
+
+			imagis,mode = <0>; /* LRA_MODE */
+			imagis,duty-cycle-ns = <1250>;
+
+			ldo {
+				regulator-name = "vdd_vib";
+				regulator-min-microvolt = <2300000>;
+				regulator-max-microvolt = <2300000>;
+			};
+		};
+
 		nct72: temperature-sensor@4c {
 			compatible = "onnn,nct1008";
 			reg = <0x4c>;
-- 
2.53.0

