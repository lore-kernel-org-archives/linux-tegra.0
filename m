Received: from mail-wr2-f36.google.com (mail-wr2-f36.google.com [74.125.225.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9ECF44331B
	for <linux-tegra@vger.kernel.org>; Thu, 24 Sep 2026 09:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790240805; cv=none; b=kWICDCNIVHaQHPS3XBBGmtiLcTL5DLGKfs4pm0lHghS6ZSw1saZ8SSwuEyVxgBR8Q1r8pgnZTMdkIHkDTviqbpKB38JLiBSvToR6jC8KlkRdj4g/mWQ1gAThFmgGfNGeWHnhCRWJFxPh2/UTqx4NAkrJv+PntGiCLI9lmVFgSdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790240805; c=relaxed/simple;
	bh=pHKuLppcHfDuAK2M2cO6egQfNx6bD98n/HcfLOmdFLY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pEoTsWGowJ9OBybCx8GGvkpulhh68642sTSSlHcM4TAPYU3PaYesqP+HyMM1ty+15MmweURxZWtEW7Pr8qyNWr5fTNVPCjsOP6vQEjHRRNLX4Zi6oL3H56xSVsnGHO+IyjeDCwgwS445IYa060dybdtXukb+/d67udpZYTLzrRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r8wviNvw; arc=none smtp.client-ip=74.125.225.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r8wviNvw"
Received: by mail-wr2-f36.google.com with SMTP id ffacd0b85a97d-4843c3ee4cfso1065200f8f.2
        for <linux-tegra@vger.kernel.org>; Thu, 24 Sep 2026 02:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790240800; x=1790845600; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6iC9+L/tjpXDsD8YIdygEJ0lQkMMFcHXbDyMth7/EM0=;
        b=r8wviNvwsyxD8TGeSy7mMWicq1l+M1oK4MHlbIQ5j1Q1ittQlu/3DcxwhyMcYXmkL1
         KhjDO9MdFo7nESZYwrvkVk0zIRmS9syU5Ak+XADCem/olJMeH0AeLC1GzFrAFrP/s7y2
         EtGDuFTo8mDX1paPLjxKG176A3ihSl2EWDXNrxQYOds9pMxgd8nXi1t+RLf6RngAXpZT
         M8Bf4ib4Ba51Vg/3ZJBwLbI9TSBAQE0qLD4U9CiLKlmh72kyopI7+6TUe5pMPcUig1TH
         HGWZLoAfRFqeAv2e8EEIjCZm0B2Bj6UdmSKZ50cFyMwHzk8bOFE/206DLGRSO7nAn/AK
         jejg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790240800; x=1790845600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6iC9+L/tjpXDsD8YIdygEJ0lQkMMFcHXbDyMth7/EM0=;
        b=X+nQezcfsY2PxeB8eBlq1ayum1K0xU42tl3AZdv4Qc1p79wfiT6VMcEKZ9tMr9A1uX
         KQHwtK4U7IZQy6Ll6bfDBOmOYMGMW/UXZJCIG9RvcSR33GNCLqI6wzx1tYtg+z5YjQjp
         Ln8oPMmoTvCPRl1qnfTdTguIKYCz/Z4zi7PsExGIaL+fTK2wb9zND2DOSa0jZszRUgKa
         07M2g3WlSKJKc/crneEUkQf1Kmdbzs3lhnJI3r3D1DtvzkWGmAIG+fS4eJcVYZtIZh0v
         h+2LgfwMF4Hbtat8qVPyf0DnHeQ4YfGLmjzrUyqMupdw08/oZ1O+HLiT83W12jJmZXs1
         0f9w==
X-Forwarded-Encrypted: i=1; AKwUvBwrau3/JcQa9ngCQVOuj0TAosTir1/4a4BjbCFf6A4LisECYaQelE/K/a8xO/kiYb30lhRkDmugMXlfmw==@vger.kernel.org
X-Gm-Message-State: AFuF++nbtUPGPV530ZEABdlAW4E8+L/UpswVpk25FMVfL6p4QUy3QRUN
	K+Byc1pSKHeXz64Ro6/29CzK3uhiUoUVDJOqs3HAcuViL5jqqXsShI48
X-Gm-Gg: AYBFou1DWsaau1DTzlEm5DLn68ilTgoJgdap8jeDr3oGf2WkxClNCGTy1gazLgvai9Q
	hXiiPGMnx26O0HzuPZu5x8Xhhh9NSDACfEfnHnY+q5BdBZajm2fUVXODf95hvo867wemBefbspj
	ezOdoZ+pTTlvvnCEUKiNfFAuDMInuEPO3WhTBVaJZsh0CBWuBJ9LMbvcP5JRdWqkaxY4/x3D2rZ
	XX9c3Md0XfMYRs8q/EhGG/S4xIbC86/NXtZajtRxfB5ke3LGWcRiVV0WTxTki9PZICevvROre1b
	w+I11WCZKhgocLGLpbJDoQairfC9g6TfUQTQXff36DybVoV6mZ4IppPZ/CYXUUItcO/qadI6h1U
	DaeF0N2/jcshlnLLCePue8XKC8TX14TFM5C8dddlme+wJbcG6g+TgMGzh0UKnp9AJ0nxeN0nMZF
	yL+d1XoZVMQR5qWYDgNxd2Zmi+vLoHOaXFlR9bj/OoAxhqM/6Ax9DYrYqxEWikK06XJfCu/Dp0G
	YK2ZdFmm4CrOGYjJppjTJZVIqjkEg==
X-Received: by 2002:a5d:64e6:0:b0:487:35f:f0f0 with SMTP id ffacd0b85a97d-488716bf1dbmr3547155f8f.14.1790240799678;
        Thu, 24 Sep 2026 02:06:39 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886877c379sm12875561f8f.29.2026.09.24.02.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 02:06:39 -0700 (PDT)
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
Subject: [PATCH v1 2/7] ARM: tegra: lg-x3: Remove pinctrl-* properties duplication
Date: Thu, 24 Sep 2026 12:06:03 +0300
Message-ID: <20260924090608.28734-3-clamor95@gmail.com>
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

The pinctrl-names and pinctrl-0 are defined in the common device tree,
having them in the individual trees is redundant. Remove them.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts | 3 ---
 arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts | 3 ---
 2 files changed, 6 deletions(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts b/arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts
index d4a3513a3fd42..d76f9f465ddc6 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts
+++ b/arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts
@@ -13,9 +13,6 @@ aliases {
 	};
 
 	pinmux@70000868 {
-		pinctrl-names = "default";
-		pinctrl-0 = <&state_default>;
-
 		state_default: pinmux {
 			/* WLAN SDIO pinmux */
 			host-wlan-wake {
diff --git a/arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts b/arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts
index 7a62707f9f7fa..4ee84f4bd1878 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts
+++ b/arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts
@@ -8,9 +8,6 @@ / {
 	compatible = "lg,p895", "nvidia,tegra30";
 
 	pinmux@70000868 {
-		pinctrl-names = "default";
-		pinctrl-0 = <&state_default>;
-
 		state_default: pinmux {
 			/* GNSS UART-B pinmux */
 			uartb-cts-rxd {
-- 
2.53.0

