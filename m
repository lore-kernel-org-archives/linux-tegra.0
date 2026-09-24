Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4593B438488
	for <linux-tegra@vger.kernel.org>; Thu, 24 Sep 2026 09:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790240802; cv=none; b=Xj7dEB87kTg50X2JUqLusWkA316kuUhuERUypTSPa/Fiuf9AM12VbcLE9IjRvYfHj9+qzqa31PCKhVki+j1gWWIRRwdxQ4Rwf5tI71FXw04z+V/NfJ89FuGbDEZjcYwuzOnX9LDLiZeAuP5yWeKDgMEaZAeJO3bl6k8218nECpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790240802; c=relaxed/simple;
	bh=rCpZvX7suLxt/DyiaZRutmvbj+ywNiu+oXOEUCjxVTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t8GtZkDWDefAmr9LxmiaULCevhvu83UWI3WJq0n4NUoJTNgwXx3SaqHPT1AGp55WlsiUKE0a0ObzQyVG5Re8mOl4QYb5pygqW4Tgzkqq9gO2JYAyte93APoAv1MFiBPGwQvzmpwdY6/VkEXUULsOJQjcaiVDT7c1Wb23vEMDAdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SDggLhXN; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SDggLhXN"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843c3ea1f6so1054508f8f.0
        for <linux-tegra@vger.kernel.org>; Thu, 24 Sep 2026 02:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790240798; x=1790845598; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5GUd4tBtKx/SSai7/n83F8Q/hZJz+jzfEZZ7NGVBQzo=;
        b=SDggLhXNNuEQPPzINggaKPUzu4uSgDTkNpbggc0PmydlFdtngw9vGlsYj86RWBUJNE
         6X30dmqQvCXZTE8JFgEroJQOQrCt6FrLeJTu4AlcRc9K94HVobt12gRzcIdELC72pnTx
         puspSieoBRqiRmeXv1V2hF6Rh2Y6J5SyzRJ7xKXGiqzEYkJoGbKId6YB4tFHVEM6Ho37
         VzORUcRNKovuNiyHGbM1KKE+iuXXgporTSy6Q95IM32UVlVtC6M3eY2RIPzQjP75Aw9Z
         G+v8mZmkjdA2nphnXdYyoDkAS1yR3x0Q9iCzVESZjacuf3j6ZWzdYEKxSrj34233QhC1
         4e9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790240798; x=1790845598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5GUd4tBtKx/SSai7/n83F8Q/hZJz+jzfEZZ7NGVBQzo=;
        b=mzsIK6vNAbAQ1UAKuDWZiSsN7EjgJoKj6yCfLWHKfLI+h03F+EwLp8CUKHmXAlJaF9
         BtHALh922L8MxNnPrdMe3baJTGwURtNiZg+y1Nx3s2C+ukWU/ZRsHbAtJOgY4zkcL93K
         sxpOZDDV8dTKSMPjDHOrzKPX7gsBtO6tlk/MdfwrpBEppNNAPY6SD06nPenZH2xXvWjX
         gpH75JnuFWPaQpFT/RHOCvcTKc/4aPDnhfaQHkJtiE74d1l/Z5r5x8s1SLWvHhQKRx1+
         aowZmUCrCFvqjaND9oXXkJQMYsO9YAWeZs9MtfxKtdcjSodD/XOb2VueQ6+JxAS90NFO
         NvZQ==
X-Forwarded-Encrypted: i=1; AKwUvBzJYE1XTlDTKISSRV/EDC9nnuBqd7bV8RZMHIiqcKmor7gTw0iT7NGWRBJkda1uF2VhC6MOAhy9YzSE1A==@vger.kernel.org
X-Gm-Message-State: AFuF++nexJPg/32R0987aeo/knhODW8CJjKJwaAyb/ZC6kFMHiSg6z89
	wVwQFsbjaIeW+DlRNOETkEg5X3W+e6Toh0fGkEGLNqaupW4zhQXvMYIL
X-Gm-Gg: AYBFou1ceqEAYfRC8Sr+GrwKf0dqjHkoznoS+rQUyiMXth/ji5ebNyRL1Jonqe4xZg2
	WE9nRGzXYcmTGwDXpx3XUROlw0u4010Ndi9yYM+R7gwZE/nzz4xQNNIb1F/wGmyBLmir1a1Pv27
	x37x2cDWL2ImDpcHQown6yPVATTbzZz8J2GEHhg/C3/R7xTCr1HBZV3Vtx3pblkdfWgt+u+pXUS
	YXWOAsSi6kiRShcAJrTm9ZMXK2kh5NS93GFzgCqqbZfrSJV/UvPljEFqRswpKTnaFGO8caNnzaB
	5O4bU/BIFh3F+zXgVfR1iq3pNUyRPjgnktKvm8STSlXIdZXkWGNkTm0Wv0GYQqTenId/rJbwWUR
	yzcoHaMezHX4u7Sav+rv9woxNULI1GlHHyg6zVfmJ0P08aXqnrDC9yUgAIw7tWD9XJyxuTh5ZU0
	YZx7kBUEu75fcsv+tOrGoiu+eQOF6F6md6PVj3JqbzCHVICtZ0atM+KBuDh+Yjse7lNVxkQPIyJ
	PZx5E7I+z4UDU3jWMY=
X-Received: by 2002:a05:6000:430c:b0:487:1c89:f158 with SMTP id ffacd0b85a97d-48871671a05mr2782937f8f.14.1790240798308;
        Thu, 24 Sep 2026 02:06:38 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886877c379sm12875561f8f.29.2026.09.24.02.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 02:06:37 -0700 (PDT)
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
Subject: [PATCH v1 1/7] ARM: tegra: lg-x3: Adjust WiFi node
Date: Thu, 24 Sep 2026 12:06:02 +0300
Message-ID: <20260924090608.28734-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260924090608.28734-1-clamor95@gmail.com>
References: <20260924090608.28734-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing BCM4330 compatible along with keeping fallback according to
current schema. Add missing lpo clock used by the module.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi b/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
index 492fefd7c266e..5b4da6ee991ff 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
@@ -1754,9 +1754,12 @@ sdmmc1: mmc@78000000 {
 
 		/* BCM4330B1 37.4 MHz Class 1.5 ExtLNA */
 		wifi@1 {
-			compatible = "brcm,bcm4329-fmac";
+			compatible = "brcm,bcm4330-fmac", "brcm,bcm4329-fmac";
 			reg = <1>;
 
+			clocks = <&ext_lpo_in>;
+			clock-names = "lpo";
+
 			interrupt-parent = <&gpio>;
 			interrupts = <TEGRA_GPIO(U, 6) IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "host-wake";
@@ -1799,6 +1802,14 @@ clk32k_in: clock-32k {
 		clock-output-names = "pmic-oscillator";
 	};
 
+	/* PMIC's 32KHz oscillator for WiFi/GPS LPO input */
+	ext_lpo_in: clock-32k-elpo {
+		compatible = "fixed-clock";
+		clock-frequency = <32768>;
+		clock-output-names = "ext-lpo-32k-in";
+		#clock-cells = <0>;
+	};
+
 	gps_refclk: clock-gps {
 		compatible = "fixed-clock";
 		clock-frequency = <26000000>;
-- 
2.53.0

