Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE69F27FD4A
	for <linux-tegra@vger.kernel.org>; Mon, 26 Jan 2026 19:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769454954; cv=none; b=MGTp+fZK7fXysh7YENkAN6GrBd8fJDvo5v8XYkaindZUXyWyTqaVc/g6U4HTCOMOi9Qs/dcKaJZpju1LbOZrPDpvvhLE+OBm6U0OETyA6ihYVk9WFmTD4pV/otOwDYCnJbhUc/6wBruAj+dlYiZY/EQW+dwoD/ZNvmKtFf4T9jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769454954; c=relaxed/simple;
	bh=oa/n902LliLC6uyPYXcLfglL0I0+KjM62CVXT1z90/0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t0Gg4xM3AoLYJu7tJPYidX+/xwtvS/apYJL3vMaqwntCZticQmZxlPask9QJqzGNYXhPBHeaeWBY4kQ8BipXPZvLw3WtwWI21w5wQLUkmigjlbdqQDEcHqTRT69kkAUADwrDEFakDN4NIpha5Y44UWjBaULK5LX9genL+YDuK0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MBYe08HZ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MBYe08HZ"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48049955f7fso41845345e9.0
        for <linux-tegra@vger.kernel.org>; Mon, 26 Jan 2026 11:15:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769454951; x=1770059751; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xRjplM4qFrlSXwStHXK/BY3jnQdeBftAW/sjI9HhO44=;
        b=MBYe08HZsyD28Q0BAA020po3OL/8WHA2l5JSljiyjpymOlgXjKgfXrOfZRPWLpUbr2
         /9yAHnKvR2hH83ozqZkXLz75r4Illj2mYorX/e4NXi9J51hNI28AaUpPaogjon1xHB1H
         4BXaEqeeA+vJkP00TI1xv32gz4EX5VQS3GVJRkkgjXWzZ3STPg6KXDQQKEfkAaZckA3/
         kSWMeNS3kWHT4ODmBgjnA+r7rZFj2aJJYmXkj6rBWF2OgbQ0jyCd5iScwTu2xrDkkroJ
         PVm0RiKvPOZlbTC2xyFBCu1Q2FLVT0XSmBHjQuRGVyU1z0viRbF93fT1dHRonAq62Z+t
         13mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769454951; x=1770059751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xRjplM4qFrlSXwStHXK/BY3jnQdeBftAW/sjI9HhO44=;
        b=jI8lBf/aHftUIizUeWSRqUcNIpVcCsqId2En0XpkePx8T/5Q5c5/CokqpbpyaZPs6+
         M1rr5z773YxCn8FO8aSQtiuQmdkdlmYuBELHX/bNktZ9XaVMk59JLMov6JzJ/RDn6WER
         TPKoOQn2b8JYl+TCrElBpNY3lefy03Zh9s7dWujpjOrEESTmlMNVgVbtYCjeQXIl78i5
         /nIafKRMc2apKFHQOcOYThKLwmKXtgZAgrHg63WLRtuJTbUPtDTwjIHQvVpZDauVMmBh
         8O8xTcK9dcOefKHeMVP36UcETg2HP+9Rf23IT18FoyK+bYcqUf4C0bJS4RPfqbCsoUbI
         PsvA==
X-Forwarded-Encrypted: i=1; AJvYcCW64A8LCs7d9HLx+HW0PmrwR44E0euYaL74RIhuwL9qorykihGBClgpyEipNWQdAang0AjRZbIpKREf8w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKiFz1qI6BXQS/MPOWCO7cUv3sldPlaZIMOr6facXp0tbkj0l/
	an8tPQjb5NrJ7oAwHjBTI6hhie7TNpCChVV/SdJaIvjgT+T9YIK5dgou
X-Gm-Gg: AZuq6aIAY9aD5STiin749Mc+iVJe9KMiUMC0SAxswS3otAVfdlCyWXEUIojpaNLJXHj
	/Dp+/Wx+zmO3h5XVnzmTIBIUKASaOHcIzQ8eihorZ5T+6cFmYxMysZYLCyy08GQ0Z32FR5RD6cx
	v2UEfCUzsKhhlH+gH1GKAZhACx00F/M9wHcIopNokrPNuv7p7p95nhPHbBY+ACc+omNkz722GXp
	6p72Tp2CAT64+6tqYBIlAoOWIdX6167UOL5c/FIg3EtRQpG/RAejkPRPXZH6EUpbp0JZBb3dXW6
	Hi3YOodMCvzHyiQt4pFDrg0+Qh0ZLwl5oYUSwcM1+XKoK6GOVUj5ZSdpdS3rJiuEQDdHVreXGoS
	kGcx8furwOtKB7gXm6KBsA8pw0C2I/n3hsJkFSAcVQQdqtKax08e5fEoiY8FtavTz89QWQusxjE
	uG
X-Received: by 2002:a05:600d:6454:10b0:480:1b1a:5526 with SMTP id 5b1f17b1804b1-4805dd2cf6cmr71031375e9.16.1769454950771;
        Mon, 26 Jan 2026 11:15:50 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c02d0dsm30958219f8f.4.2026.01.26.11.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 11:15:50 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 4/5] ARM: tegra: add DC interconnections for Tegra114
Date: Mon, 26 Jan 2026 21:15:35 +0200
Message-ID: <20260126191536.78829-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260126191536.78829-1-clamor95@gmail.com>
References: <20260126191536.78829-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add DC interconnections to Tegra114 device tree to reflect connections
between MC, EMC and DC.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 arch/arm/boot/dts/nvidia/tegra114.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra114.dtsi b/arch/arm/boot/dts/nvidia/tegra114.dtsi
index 9acba15fba25..f1af206f50ee 100644
--- a/arch/arm/boot/dts/nvidia/tegra114.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra114.dtsi
@@ -125,6 +125,17 @@ dc@54200000 {
 
 			nvidia,head = <0>;
 
+			interconnects = <&mc TEGRA114_MC_DISPLAY0A &emc>,
+					<&mc TEGRA114_MC_DISPLAY0B &emc>,
+					<&mc TEGRA114_MC_DISPLAY1B &emc>,
+					<&mc TEGRA114_MC_DISPLAY0C &emc>,
+					<&mc TEGRA114_MC_DISPLAYHC &emc>;
+			interconnect-names = "wina",
+					     "winb",
+					     "winb-vfilter",
+					     "winc",
+					     "cursor";
+
 			rgb {
 				status = "disabled";
 			};
@@ -144,6 +155,17 @@ dc@54240000 {
 
 			nvidia,head = <1>;
 
+			interconnects = <&mc TEGRA114_MC_DISPLAY0AB &emc>,
+					<&mc TEGRA114_MC_DISPLAY0BB &emc>,
+					<&mc TEGRA114_MC_DISPLAY1BB &emc>,
+					<&mc TEGRA114_MC_DISPLAY0CB &emc>,
+					<&mc TEGRA114_MC_DISPLAYHCB &emc>;
+			interconnect-names = "wina",
+					     "winb",
+					     "winb-vfilter",
+					     "winc",
+					     "cursor";
+
 			rgb {
 				status = "disabled";
 			};
-- 
2.51.0

