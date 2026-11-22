Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795378494;
	b=iRSyLQO0mXPZYF7ZKOqCxuxk/+3nPU65ly3KTiuM2uzFSk8mb0FUFn+uG5K0mII/R8bE
	 NZQpMj5sWmdbKgfF6osLgL9LVmTiQ7/O/0xVWaAkeswpENNaTCCiVtxsMPYvzFIC0+WQt
	 ExOHByMr8flllvPSm9ER2BS0MeMHtkI2hPfqgRQauVQNxG72y5m19HoziLLTle5qHaX1C
	 21jvKmTUwq4pBe/0MFoL5NAUIFo67uyTljznGC7YWfbKLjkuZKNQ/HSUK2GBH8aCXVAQP
	 A1HQ6beo8Qlxue2DKPU79ObdEJp0n2KYt8gUuzeoFS3wEGVoCSLgINl+hRQ74assYQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795378494;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=W3DOibmTouZHMicE5mHPj229m6Ggbgawt0BEFNpJyE4=;
	b=xN6PFsI1v28TRaKPfzrOruaWzED5o7fRF0LNBYEvfiX+aCIDtVhwNeQp0H2MIyCR3f6e
	 q7+0m7VNopCeAOQoVOnLIiphAday9TIiVggdVyjBOIKfTbknQDdSCLU8mIBToLWGPF5Kj
	 W3h2PkxN9SNC5I9gLcdrK/xgvVsRFX86IRXM43OcTTy3Me0bUgczf7JNH8VWYMmSTvzFg
	 PBBH34ooPIos0v8Yc4hnKBYHnso8KPdj8yz53bmybZvmpv+X8jjHkSp7oxkueCzqxRMaa
	 qv317S82wBfZXj6DzxH1Q8Xql4l6cgqaKGV52CKlcuPRXSDSnnA0XwHAsig6FkSAE6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ILYBHBS+;
	arc=none smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D578606A685
	for <linux-tegra@vger.kernel.org>; Sun, 22 Nov 2026 20:14:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D578606A685
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ILYBHBS+
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b894d9a075so2776033a12.2
        for <linux-tegra@vger.kernel.org>; Sun, 22 Nov 2026 12:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795378493; x=1795983293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W3DOibmTouZHMicE5mHPj229m6Ggbgawt0BEFNpJyE4=;
        b=ILYBHBS+B3TI7PbTogIuuMAICxrVMAFQyhYm6WTkVWi+mzR6iuxrb3UvF4rVAp0YDt
         LGnESxqxjrV1Y8HpHmyJMURjL2kZUhp+wYrs1p9M84UbMVBFPy2G+wpY3mlQe76PorIj
         BdcFJgbVl3flZoIBXTKuAEy5QyDrvk550CPBuM0BaPiP1ptobzKyoMexCMnhAyyWYhb2
         eroduMh5Mo632NnK1R1O6c+XXXbgDUgXK9GkTR8xuj+RWhStwEU3LdCaqpLTuP5BAyom
         JLuLtzxnLQts4q/BRop4L8fa1X55fFIQ9lfZCzZc9l8GO+rLqQBnXU9BuGzfziBF/XDD
         VVQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795378493; x=1795983293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W3DOibmTouZHMicE5mHPj229m6Ggbgawt0BEFNpJyE4=;
        b=EbjdudCPeRFizFAkfgjz7UpTCRGGw/Xgr8BKD2MEHT+TfhC9yb32SXNQmxa39QdCnr
         k8Fgs2/yAmaleJeTjM2esQiiock2qjOEjFjhn69wqgheJ0QSTIjSPRTCuvoT+SrzyF0V
         DsCu2XQ3sAJMIS6D8o/SkqUMhFwIld+WNmoo6WsD7vnRJxS+wF39SvpxJcsIFH4hOQgS
         aXxY68v4dX44zGKX8jy2atx2EIRhaKuYttXAP2UX2wPZ3GyDkhvm7zTlr3pWjZVTHTv8
         hRq/bHp5/mv597DGRUxdGLIGrcY2KYEwg2CD64Rev2xEXQJMFsOid5T3ZoFc7OheqoTE
         Sl7w==
X-Forwarded-Encrypted: i=1; AL+hErH5OS0UNKqnCkKbvNYy4VxsejKm0KZfzRAqRQdwGxTYPASFjjZCWaqapD2h/LtaXxk4TttTlr6NMBFOkg==@vger.kernel.org
X-Gm-Message-State: APuU4Z//GO9DkwpkRxrHeuFGx6AsQA8QUbOKQgFDxyB8YH3qYFQVV2EH
	7/bLGs6ySGZOr3/WlGWAa7TAaro8+Xcc7JL+emCmPyLs7IktTNgUcCpd
X-Gm-Gg: AZFdTZfn61UZaAP/bMZ8oKUmD2yvjEz3bQbMdUoq1M35BjCVncOH3bAG/AgaMkAQ2jZ
	P6mjt4GVHXZ7E1s6XYzfKO8axvW4SFR1T1VZPDbK+9XYh0fYKZVGypsh9aOzHkQIFvY0dUUo8LB
	IW1uJwCU3uBDAVXI+oRMF4oYkVuzth3aJqpWDXNwOfYLOg7GDpPC6Pn5Dnkyi1hK90x7jWO+XT4
	VsNq/11zqw5FHaMpy0AkUXnKx56tBOIi4zm+zFBZnQzWkBR6bEMgIk1B4jLkpqBSd9TroWG2Y/t
	+2cxi7cija+mehrleXsDxnGjOdeZJkJhN6ebislIjRXN/GaqjbyUKUdACycLy4LO7rN+DFWmo32
	S6InmLY2FYm02Wp+KUXZNw8kMkR4FH6MdNj1a60BROHGFI/MqW5NYv5FETuN0aLpkrA4BYTmFXW
	wooOUK+YURiPNm8Wyl5+fCu1rjXHDrJH3TPe/Uaghi0s0ytgTP/vZIC2tvqL1yNsfDbPyEM5pnw
	ijZxXVAT9TYylh27L1+MbzKBtJ3Ikkv+nm2HsZtLhhHsuEYR2zj3tbTMAO+w922to7+XjxusWKS
	ah2roKvOE4xpq1W728r4Rog1iUE819iCbUQq+mqzG9StjP625N/bA8095ynyoNeL5GyOZ1BDDNa
	i0+peZqyzHw==
X-Received: by 2002:a05:6402:42c2:b0:6ba:b1ea:398f with SMTP id 4fb4d7f45d1cf-6bab1ea3a36mr810664a12.10.1795378492739;
        Sun, 22 Nov 2026 12:14:52 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fa8basm4424074a12.20.2026.11.22.12.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 12:14:52 -0800 (PST)
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
Subject: [PATCH v1 12/18] ARM: tegra: tegratab: Add common sensor nodes
Date: Sun, 22 Nov 2026 22:14:01 +0200
Message-ID: <20261122201407.23742-13-clamor95@gmail.com>
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

The Tegra Note 7 uses an InvenSense IMU with different per-device
calibration matrices, a Capella CM3217 ambient light sensor, and a Lite-On
LTR-659 proximity sensor on the P1988 board.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../tegra114-nvidia-tegratab-common.dtsi      | 37 +++++++++++++++++++
 .../nvidia/tegra114-nvidia-tegratab-p1640.dts |  8 ++++
 .../nvidia/tegra114-nvidia-tegratab-p1988.dts | 21 +++++++++++
 3 files changed, 66 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
index 07091ffa6df19..c839e6159de5b 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
@@ -989,6 +989,13 @@ gen1_i2c: i2c@7000c000 {
 		status = "okay";
 		clock-frequency = <100000>;
 
+		light-sensor@10 {
+			compatible = "capella,cm3217";
+			reg = <0x10>;
+
+			vdd-supply = <&vdd_2v85_sen>;
+		};
+
 		rt5639: audio-codec@1c {
 			compatible = "realtek,rt5639";
 			reg = <0x1c>;
@@ -1022,6 +1029,36 @@ fuel-gauge@36 {
 			wakeup-source;
 		};
 
+		motion-tracker@69 {
+			compatible = "invensense,mpu6050";
+			reg = <0x69>;
+
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(R, 3) IRQ_TYPE_LEVEL_HIGH>;
+
+			vdd-supply = <&vdd_2v85_sen>;
+			vddio-supply = <&vlogic_gyro>;
+
+			i2c-gate {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				magnetometer@d {
+					compatible = "asahi-kasei,ak8975";
+					reg = <0x0d>;
+
+					/* no DRDY (polling) */
+
+					vdd-supply = <&vdd_2v85_sen>;
+					vid-supply = <&vdd_1v8_vio>;
+
+					mount-matrix =  "0",  "1",  "0",
+							"1",  "0",  "0",
+							"0",  "0", "-1";
+				};
+			};
+		};
+
 		bq24193: charger@6b {
 			compatible = "ti,bq24193";
 			reg = <0x6b>;
diff --git a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1640.dts b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1640.dts
index 8177e4f7db489..866158f055913 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1640.dts
+++ b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1640.dts
@@ -7,6 +7,14 @@ / {
 	model = "Nvidia Tegra Note 7 (P1640)";
 	compatible = "nvidia,tegratab", "nvidia,tegra114";
 
+	i2c@7000c000 {
+		motion-tracker@69 {
+			mount-matrix =  "1",  "0",  "0",
+					"0",  "1",  "0",
+					"0",  "0",  "1";
+		};
+	};
+
 	pwrseq-wifi {
 		clocks = <&tegra_pmc TEGRA_PMC_CLK_OUT_3>;
 		clock-names = "ext_clock";
diff --git a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1988.dts b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1988.dts
index 9447203eeda36..7ccda46c42af2 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1988.dts
+++ b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1988.dts
@@ -7,6 +7,27 @@ / {
 	model = "Nvidia Tegra Note 7 (P1988)";
 	compatible = "nvidia,tegratab", "nvidia,tegra114";
 
+	i2c@7000c000 {
+		proximity@23 {
+			compatible = "liteon,ltr659";
+			reg = <0x23>;
+
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(X, 3) IRQ_TYPE_EDGE_FALLING>;
+
+			proximity-near-level = <50>;
+
+			vdd-supply = <&vdd_2v85_sen>;
+			vddio-supply = <&vdd_1v8_vio>;
+		};
+
+		motion-tracker@69 {
+			mount-matrix =  "0", "-1",  "0",
+					"1",  "0",  "0",
+					"0",  "0",  "1";
+		};
+	};
+
 	i2c@7000d000 {
 		pmic@58 {
 			pmic {
-- 
2.53.0

