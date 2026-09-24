Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD009450403
	for <linux-tegra@vger.kernel.org>; Thu, 24 Sep 2026 09:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790240812; cv=none; b=iBYmx9WSFXYBV84rLmMF7NUptUnUjglcehaR9x9+Il1ZF4yuRPgQFTQF8/rvasgQuODMFX/rUGZM4bfUaP7KfOybhSqN4iNRCZIK7y1GxrxYVL95xVj/jOTGB9qez6JU9jn/yRWWYkFW86XEywiRLAvNTFml1ADt1GOInkohBs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790240812; c=relaxed/simple;
	bh=anNYkSzOL/ldKa7FYtAbK0md9biYRMvmXTAW6OSylmc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NtzXD8NP1rtC5r89rUX/RhYWr+4DE4ue1LwfGrNttU4aOnZkSkI69h6zjJQBntYVsjECc07qU5hkTmZJtp3gz7f7J2HnaLpY50HGMyRLZRXmW1/E5uxXXltSb36BN6ezrSJO/h9CNR8MiAsc8BTq4tOz6WNZ4r5owi4/kwcQpfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pe0Otnge; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pe0Otnge"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e721b5503so16429775e9.0
        for <linux-tegra@vger.kernel.org>; Thu, 24 Sep 2026 02:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790240809; x=1790845609; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dcE3ANusGEqiHn+2EcPPA/pUBlIRQYFz5utyR/BkeE4=;
        b=pe0Otngek76lSgQ0kxTQtqz/dDr526HPZ3RRXuCKr7IiLKQ/qGmTDB59LGsu60O90f
         hIhx3G7hsPcFthKLcatb0AtbARFokdJTUAThL8DnE9o9Jg1sXcHH7diUBqGoHeqWDkSs
         iSXQKDRrqy6EVVXpFsYjlhrE/gmM6VsX3xjBuj15EA6wtC4j0caLFUsbmMUnbwyJ+ln8
         IPJGhCQvcNjTiEpjHyXf/cdBqKR/yTu4TM3yWxrmuTB/GbSkCC3iKdKjWhxopY2Huw5g
         KFFQdg7/uWZ+t7FrLfZIHKmmlnFUiwl4YHob/Cw2TNmocARnyHMV+8OdCeWutfISWhUh
         caKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790240809; x=1790845609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dcE3ANusGEqiHn+2EcPPA/pUBlIRQYFz5utyR/BkeE4=;
        b=wJ6XfiH2JQtY2F3OaCwE+jEnH9ULnO/MURAb4VtsAnGhmB5MZvFkpVmPs5MYKiv3bv
         83OHuxNykouTcdMkF2w+hcdp+yt4a7unqbnjSvE0rNvEDI+lWdmaBqMC3km2nVQaukOK
         EIkfoIBOB0/m86UsbeBkBczAxMwX31jip+Kr/eg/vfUIGhLpsYDcRWnlIO/aVFfrFvQf
         2xjSYTYkQ+xVWD2Ovp2Q/MAinXzyiDwPPTiIUGRc4JrRtwYNSagaKLDiIbOS1Tz2l+9J
         wj12M3JCa5xD8KAAD5l9ZpYogZh3YWOzM+e3Qigk4euqtBYlplXrtVt5zU8OHQfpDtMh
         SOjA==
X-Forwarded-Encrypted: i=1; AKwUvBy54s/382jrFUuUG6e1bhE7WmuihG3fUiUEz3wxc54NCa1pJwCVmAEEuW1Djnf60z40vRzARl1fyeQh/w==@vger.kernel.org
X-Gm-Message-State: AFuF++neXxml12JJ0il4vjBqz4Mw/fmX5lDVq/d+Nj1T9Zj5KXoXRHHl
	+uMuqavk4q/krfwWbiKZ/n2lc1K7x7sK0pomTtTRs7ufjhfIZF9nv+av
X-Gm-Gg: AYBFou0Nvom4YKBAx3wVTO4bsbu2s11Au2/1wfn1ysWcHCNAWtMk1Itc3meWcJXAvFX
	REi94vyaaGONzpQn0MKoVhRIJEe83/+QE4gOzBQLDJoM4fTZE9RXgb+xHpow89sCKwQrRcVNUqK
	BpKJw+N5leW6YJDesAZCDMmaKu1FPCIWUPsbs2ULCeEk+meoGncOX1Jt1KH4WMVt7scNNJc757G
	lloVQTg8dgvpdWWOfkuJJcoKmZWjuqO+ShOXo+ASpAYRFzOwto2Cxwg6/GMNTVI+crrwDIQlbrF
	YhXtJb9mrXiWvmHrG1sfinv2dijACRVr+f/2hmQQWoYxr+MbGL3j4eKrv+QviswEBI8hKyKHq4w
	bgL0bGg6WCW9JXaRr7bmM4jkCEvU0ERL6+XSJYJQsRLp4lh59lefJM3MVqYRK1AdhnW71gniUBa
	82Swjx3ES42PCIkXJpiE+mO82n0jI2ydlHqSkuCWF2OLlkAv3OD4VIjtyby5NMdjsidM3aw2Akt
	DvgAsw2ipg6guuRC/4=
X-Received: by 2002:a05:600c:34d4:b0:499:79b9:e220 with SMTP id 5b1f17b1804b1-49fe66d1279mr28347365e9.10.1790240806879;
        Thu, 24 Sep 2026 02:06:46 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886877c379sm12875561f8f.29.2026.09.24.02.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 02:06:46 -0700 (PDT)
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
Subject: [PATCH v1 7/7] ARM: tegra: lg-x3: Add backlight LED controller node
Date: Thu, 24 Sep 2026 12:06:08 +0300
Message-ID: <20260924090608.28734-8-clamor95@gmail.com>
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

Add node for TI LM3533 LED controller used in this device for panel
backlight.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts |  2 ++
 arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts |  2 ++
 arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi  | 24 ++++++++++++++++++++
 3 files changed, 28 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts b/arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts
index d76f9f465ddc6..4560d93ef438a 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts
+++ b/arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts
@@ -179,6 +179,8 @@ panel@1 {
 				vdd-supply = <&vcc_3v0_lcd>;
 				vddio-supply = <&iovcc_1v8_lcd>;
 
+				backlight = <&backlight>;
+
 				port {
 					panel_input: endpoint {
 						remote-endpoint = <&bridge_output>;
diff --git a/arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts b/arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts
index 4ee84f4bd1878..2ace0201a9311 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts
+++ b/arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts
@@ -185,6 +185,8 @@ panel@1 {
 				vcc-supply = <&vcc_3v0_lcd>;
 				iovcc-supply = <&iovcc_1v8_lcd>;
 
+				backlight = <&backlight>;
+
 				port {
 					panel_input: endpoint {
 						remote-endpoint = <&bridge_output>;
diff --git a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi b/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
index bd82a3f7951a4..c86bc4b897675 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
@@ -1206,6 +1206,30 @@ rmi4-f11@11 {
 			};
 		};
 
+		led-controller@36 {
+			compatible = "ti,lm3533";
+			reg = <0x36>;
+
+			enable-gpios = <&gpio TEGRA_GPIO(N, 6) GPIO_ACTIVE_HIGH>;
+			vin-supply = <&vdd_3v3_vbat>;
+
+			ti,boost-ovp-microvolt = <24000000>;
+			ti,boost-freq-hz = <500000>;
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			backlight: backlight@0 {
+				compatible = "ti,lm3533-backlight";
+				reg = <0>;
+
+				led-max-microamp = <23400>;
+				led-sources = <0 1>;
+
+				ti,linear-mapping-mode;
+			};
+		};
+
 		max14526: muic@44 {
 			compatible = "maxim,max14526";
 			reg = <0x44>;
-- 
2.53.0

