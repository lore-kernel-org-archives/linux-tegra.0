Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5293C1991
	for <linux-tegra@vger.kernel.org>; Sun,  4 Oct 2026 15:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791128745; cv=none; b=VHJFXj1XY8MsC12sCLkqjbJMtsvYBPJG76lla0hrHUehYyTCrvDKZpSkEbJo2VVsD5b6U8uNT/kpW/lfzuuDiucp4glbeKiBAzjr9d/9StPGxZqKUU5Dj2JGb6P7ueXD/EWnivmaIYnu4Rc5Sgf9XlEsZRfF6D11cAbOI5p5FW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791128745; c=relaxed/simple;
	bh=+Wg33H+j0BW7fCbkZpMgJjep8GTtlnuciQO6oSNnFzk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X3GKioq6HmNDZ0os5/D9WfEcE45BCqYn7uw2s3VPouIwk2E6hPMPanYN4pHws5SZxgzA6WLDwSc+dJvqXWZJdbnCroXsGGVB3m5ugVibH9kbFaaXCUojMvW6W1f+e6ENG8QSM8LpfuQrf6qDKsdR25qt/VMvneNL56KgrC7GTc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bfWEzVsM; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bfWEzVsM"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a169d33ef6so5264575e9.1
        for <linux-tegra@vger.kernel.org>; Sun, 04 Oct 2026 08:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791128740; x=1791733540; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=maK2q6osYhqFaPMRX/FyroBhpJkTPgnIYfG7JKgk1As=;
        b=bfWEzVsMpgXPjtDb1R3S+DUIHevJZ2CGlJ/I/xN2mWxV5OP57SD4B0QmSkRtk/GJzY
         EunL6Xe3dCXeiTVwMVJpr3x2TOIjmdb4WcN8makCxd5TJTGPn5To7ZNHp9sOFb7rl4Hn
         5dk28CH4mLcIZwF7vyBCOHTvgem3NE8U8Nd7ljJGZdECNLnwp44enY+Pn9HEdtD/7sGq
         8x6mX4HMhBN25qkw6dAwKeLQNy07j/PENajxXZvYDn7jddt0WVnWA8huQuWUN8xUaq5B
         aQhRy/yCsDWoGVIjXeDsOsGyzbvfizlPPLjzMixqCUxnTIRKA6ibqzvM91M76MuAuN2A
         t+6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791128740; x=1791733540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=maK2q6osYhqFaPMRX/FyroBhpJkTPgnIYfG7JKgk1As=;
        b=eXray/IVv9Dj2PcQZpGs2okZcHML/QA7w4tLWhvL0iU98wqIHJ/iAIFYdI4L57hmKI
         tjskrfd11N0svNxH1yPzhgs6fb2EFOhiWp/BUPlBdrEXEeuzaPI9tECWhF0Rc9cBX9mO
         Wvl5dbaYdHw1lNQTO4/tuKeVgkj3zv6ePkW2A5YE/OymCuHI/JAVH6+abvJEh15zBb9j
         J06vDJKPGLKw+4SuFy+4tfwfManj700Vf48d9BsqUQtQOQd9B3QqVSgZanM2We3cZd2b
         e0QPaTWAsERA0H9rzW53yiyqplBialiUPHM05TVy6ojA1ybquGZVMz4Y5VwfyMcOHXK2
         B5QQ==
X-Forwarded-Encrypted: i=1; AKwUvBzxu/rQv1ZRJkMkw6hI2D8YT5yh7rMzJHmgLpwyHUM67y+tdG8O3Mr2M68QRE9rHZG5e4jC7pSZgqZukw==@vger.kernel.org
X-Gm-Message-State: AFuF++kQ5MtT4pCy+g2EJpDkYQTXTBEwenrTKqvVCmPqbxlh1uZzj42a
	HgPuyY0rdCNDsLaQr0cE7OKzrzLcd/aR43qGWGg7AMofF7CGCUaIuL0O
X-Gm-Gg: AYBFou1C2onfKmAkFdkf335ppa+E0ddhWylYPNEh+aJmkOPhn4STMlzJX8ElyYjqRib
	DS+DZJsU1JTt+cHPMy1ieiepcfBjJALt/EVBKoi5VH1+/tgpnJSEwzzLYUUrij0AIetPv6ygDNo
	GKBPYLf0XocVGkSgHLjqdy8kq9X1goKD2DWNOI7bijA2nQivCfpAoyP3Ca3BZZOwJBSiui3/Z8s
	SAElpTUHY/KYzjpDNxplHqn3qqDexheNrVdeA7ek0ImSLViV+9WEmnyLNFnpPEqdKFmXqPIJDSw
	KUqXU0sopeFCs9b26+jlpibppNOysIKq1jzCemy3ANzM4xVHeIlXGk0zYoTCsLHCDV2HgD4Wv5i
	hYyqWFuPRO7TX6n+PITSlL4v+v42Q7ZZB7bgmNO68hFgOzXnzwnuM8ZnRBbMzO6Ubc+axhoRK4i
	oG1q+oNvtY48Kxxj09NTrv0XF0sNaV72QDzOi074uuHlh7wRAR7vehNPKqB+xavVrcIYtZZ+nTk
	jl82FsKRCBSqty3TSE=
X-Received: by 2002:a05:600c:4e4e:b0:4a0:62d:4424 with SMTP id 5b1f17b1804b1-4a027566f93mr145298405e9.8.1791128740170;
        Sun, 04 Oct 2026 08:45:40 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0394ca0f0sm168639935e9.1.2026.10.04.08.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 08:45:39 -0700 (PDT)
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
Subject: [PATCH v2 5/9] ARM: tegra: lg-x3: Add flash LEDs controller node
Date: Sun,  4 Oct 2026 18:44:52 +0300
Message-ID: <20261004154456.145362-6-clamor95@gmail.com>
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

Add node for TI LM3559 LEDs controlled used with flash LEDs in this
device.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi | 30 +++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi b/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
index 4cd2bbc94f9d7..99afd5d634e2b 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
@@ -1233,6 +1233,7 @@ rear-camera@10 {
 			rotation = <90>;
 
 			nvmem = <&m24c08>;
+			flash-leds = <&lm3559_led0>, <&lm3559_led1>;
 			lens-focus = <&dw9714>;
 
 			assigned-clocks = <&tegra_car TEGRA30_CLK_VI_SENSOR>,
@@ -1267,6 +1268,35 @@ m24c08: eeprom@50 {
 			vcc-supply = <&vio_1v8_rear>;
 		};
 
+		led-controller@53 {
+			compatible = "ti,lm3559";
+			reg = <0x53>;
+
+			enable-gpios = <&gpio TEGRA_GPIO(BB, 3) GPIO_ACTIVE_HIGH>;
+			vin-supply = <&vdd_3v3_vbat>;
+
+			flash-max-timeout-us = <1024000>;
+			ti,peak-current-microamp = <1400000>;
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/* single flash led is on 2 lines */
+			lm3559_led0: led@0 {
+				reg = <0>;
+
+				flash-max-microamp = <393750>;
+				led-max-microamp = <140625>;
+			};
+
+			lm3559_led1: led@1 {
+				reg = <1>;
+
+				flash-max-microamp = <393750>;
+				led-max-microamp = <140625>;
+			};
+		};
+
 		camera-pmic@7d {
 			compatible = "ti,lp8720";
 			reg = <0x7d>;
-- 
2.53.0

