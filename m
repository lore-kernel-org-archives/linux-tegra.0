Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92CCD3161A3
	for <linux-tegra@vger.kernel.org>; Mon,  6 Apr 2026 08:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775464464; cv=none; b=F4WsRIjd61zd5hCVpmj5y4KuMcHnfTjUp5FsAADiiqWP2K8+rF4VqlcgjDBrQ+oBJ4iXe5hHm2ODAuj5OdJhkZuCaBv6n0H0Q4OMdCX8Rfa/lg38b3zPRPMH4O2xNnl4+58Q0aZOpD0QLgw2fUtLzXMtH0YJ+FazYmoRlPeYYn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775464464; c=relaxed/simple;
	bh=9AkI0Nz1ZzMhKBtxhwDRab9jEHmljwJvezZnjRbkhVc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lXkny1hLgstWhVIpzT4f1G5ENugPCQSL7UvVH+QIi5gkonPJqo7WgX9sKkdn64Wrm+GUh/PGbQ5uz1GZmYlOomsQg4yn5DkdrZBY/Ah7z8pjO6C9pi93wi0o183oSYFQKJ38wNJ0GOkU2G0WnKsKV+XkVoOuvJiv1mtyi+9GLzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hkZlKqZu; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hkZlKqZu"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so17731035e9.2
        for <linux-tegra@vger.kernel.org>; Mon, 06 Apr 2026 01:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775464461; x=1776069261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9nwdcazcd5nv+n45NTFsXMrutWV/muXgCl4fYEEYQm0=;
        b=hkZlKqZueypbrjYiVbCWXD+EY+D9FBYyqaR8QpA4Tc+ZjYM8m5WhlWfKo7Cgiupn+p
         U14ubhZHN4uYXfCr/dKr4O+F/u4+fIusbbGvHHuMfJRYBoOPeuGBi7kLgRnmv1n7JPoc
         mu7NJ/6OtWtVnEmkq508+UOogRyWtT7F09UqNeXVIlrSHq05FKUpGEN4Bv73ut/Nf2Rx
         woK4bKxBngSDTMfbuiP8CD01SvGGpTBO/bprzuOW2xspBUz3j4IZwaTYXJ5D4aHORvfI
         mDYJD8CKvAMiW66TWGvnLjFSoX8xYhXyEb/GMQz/olS8aj6Z6ZjVG+AlLlgslSqwEa9n
         ffRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775464461; x=1776069261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9nwdcazcd5nv+n45NTFsXMrutWV/muXgCl4fYEEYQm0=;
        b=Jsm97gH8groRs2MSF3HvpGC8JP24tc/oqkIw79t+k9yFWKnhVSqOMqVvJi4OTHkcVn
         VpGvs6yI1IQOIoUvBzPPmD4Owkrt/fr9VQcmZXZBsEQO2lKxQpFxgLjd7E3ZMdRCJYUX
         Rfbuc+UPDchWiid0ifjkToFGas8CUBY2/KoqiXtzAsetb34b4H9klavmoIoUBPi8FeeJ
         C4rolWDDMoxZhBmXsnZo13zkbI5NCSM8hOa/lvXI4Iivbs1bxNSYIJ2UnyKKl4jiEyqK
         2MaNpZP2WumNfOvMfgV8lq+qtboc/PgnvbEWUpV2xTGzTIbz3jxYazshmCzbPa6bAQAX
         2Kvw==
X-Forwarded-Encrypted: i=1; AJvYcCX6cEmM1/UGi+3NsAaXxGsjchxoCUzLwqqO5uFG2hm/QslchLQhomGubdoxlNerDJTHRF5Z6X7Vp9+3bQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwS27trCjikyV9ko6J64YxS5/atzxq/0bV+8hPF6ty8Dn+gah0D
	NwprqKat+vj/YOYb9mMSw5CwkfulP2Gg4B3Xejcz2I+L6XJI2UZTgjAY
X-Gm-Gg: AeBDieuvLBgomDqe7SZJQaFE5/q/EGROHuHog2VogWUJoRk0XFvJ7bAo/75NFPFfxln
	NLODDELI1VVRkL/lLaxcuBI7wH58Z3VtYrp9jf7wDTWHM7YYmU1qZY5szWfu/WVn3LnT3c1EFbA
	nSjDOMmTPd5GYFWR3uYfxvCC4xLLeg/IZEnIn/GpDO2CNdsGJ5iQo8A58TkrcaKvk40CHJNeU69
	nG1EO+aYEVZIlhNxJdR4PITlMvsbq42Nmwp0GgEl5B9KwCsgC5RsxyZuGb1bxnNW7elYsaLs0xB
	1VtMgdRKAU/VEBbKWQKvgpt65jbMBozHHSp0DOKub7nqq00MAxZ4YGHkuY2SJEZYDf1UYE/Smhu
	zeEa+lH2q8ZCEvuik43UPyc6PqVEnBA5wngGhwo0CWDa3wcpUXBWm1LaQHI2F/vm8Kx39MEYJG2
	RG1eLUBbXkFlVt
X-Received: by 2002:a05:600c:8599:b0:488:aff1:a7cc with SMTP id 5b1f17b1804b1-488aff1a9ebmr40356075e9.9.1775464461027;
        Mon, 06 Apr 2026 01:34:21 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48899e7e83fsm84241315e9.24.2026.04.06.01.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 01:34:20 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Ion Agorria <ion@agorria.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 8/9] ARM: tegra: tf600t: Drop backlight regulator
Date: Mon,  6 Apr 2026 11:34:03 +0300
Message-ID: <20260406083404.31359-9-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260406083404.31359-1-clamor95@gmail.com>
References: <20260406083404.31359-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop dedicated backlight regulator since the GPIO used in it is actually
SFIO controlling backlight and setting it as GPIO causes backlight to
freeze at maximum level.

Tested-by: Andreas Westman Dorcsak <hedmoo@yahoo.com>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dts | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dts b/arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dts
index 8b68bfef8dee..0bebea0cb8c4 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dts
+++ b/arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dts
@@ -2192,7 +2192,7 @@ backlight: backlight {
 		compatible = "pwm-backlight";
 
 		enable-gpios = <&gpio TEGRA_GPIO(H, 2) GPIO_ACTIVE_HIGH>;
-		power-supply = <&vdd_5v0_bl>;
+		power-supply = <&vdd_5v0_sys>;
 		pwms = <&pwm 0 71428>;
 
 		brightness-levels = <1 255>;
@@ -2422,17 +2422,6 @@ vdd_3v3_als: regulator-als {
 		vin-supply = <&vdd_3v3_sys>;
 	};
 
-	vdd_5v0_bl: regulator-bl {
-		compatible = "regulator-fixed";
-		regulator-name = "vdd_5v0_bl";
-		regulator-min-microvolt = <5000000>;
-		regulator-max-microvolt = <5000000>;
-		regulator-boot-on;
-		gpio = <&gpio TEGRA_GPIO(H, 0) GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-		vin-supply = <&vdd_5v0_bat>;
-	};
-
 	vdd_panel: regulator-panel {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd_panel";
-- 
2.51.0

