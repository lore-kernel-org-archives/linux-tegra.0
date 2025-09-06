Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1A82F363D;
	Sat,  6 Sep 2025 13:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757164643; cv=none; b=etAc7f0GFdbSELGhDAR5m2d63B8qIgQwKWh7nGaoV2TN41i6cOyiA8Atg7+98Zz68eWb+HBJ53E1YKWNRLiBKAf0yfMSJELZtv46BrjI/60IHQhtUIZnfRuylwDldkzJG77yrFKzKK291S1zX8RibVXHRmGteCnhzdTP7cvU/MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757164643; c=relaxed/simple;
	bh=eWyb4phIDaB9Lh/G9uzUO+x1BpVASAfd4mHwSb0xves=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Roedt5LFYQk9O1+WrRelvXOsvf4mNlwNY0XtYyCvZ0vX8ObiZ/NnoPl3qz/BD6jTJm2Uuw2zo4gQnT31xsRQ+Z1wMawD0Jmmc1358edYPOMAGEqv78cQuYXtbk1VZPht4H54klVJGKMUx3OyAE7CSz5kpE2jmJWAN1N+1UrGAAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e0qKjiOc; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e0qKjiOc"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-55f6bb0a364so3234281e87.1;
        Sat, 06 Sep 2025 06:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757164639; x=1757769439; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xO0aKgv2KbReOFRNCLP5zz82s3c058MLvHztpGFjRTA=;
        b=e0qKjiOcUhHGDs52URV7GKGO03FsyN04yYwkH7hV+mAuyuNYjk8A0GD1ete5a10JI8
         PRyS4odwmsx5DVjkPwXqxh6/fCmFbW1HDIBvrRbhffUZq6l9Ma33O53++2HB36hXi6SD
         GlX0H2sabkhypOEYq3y7anrtbH616nVU/xBSPffAwy350FGTeZoujye9VtFjF64Ey7kG
         ng84f4AIISgZrZ3EQWp43VHSjiIz/Jq04Kn8dvopi72+JShOeAn5nTxEulYXgoG40b7O
         BB6JIVFIkyMRGB2/RD3icyQboB//VpfbMGVRcqvpyUYkAi8w86IPU4Vi4xVGBxNfDgTG
         kEHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757164639; x=1757769439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xO0aKgv2KbReOFRNCLP5zz82s3c058MLvHztpGFjRTA=;
        b=AxNe+KNhEKV/DCDicZBeWKlDgjma0VjTrQHv+BoqQTRB1642jkqH7EkPx9AFLXlyX7
         mpWsEslVqrq5qDqDQ1ZPWz+rciUqSc5ZgxhwWz3dJp7BF2fhxm6LEvwzZ2SadTPN8qhu
         Jx7M1VcylEzvNwGx7W1I9m7Sp61ITYig6c8pBKJvb/jr0mSnielOa9utqec8L0o1J2Lx
         E05mBlEPYvpRlloEVSg5CxOwf+r9yR/EYwjjv2hCiTdoTju8cM8uVcsu/hcXMdYHuNyd
         o7MBufmtmsuc3swjlAKU+YIha+uiyBpj0l4AooafBP1a9NlYpquuKQEu3nD9Lja7SRjY
         E19g==
X-Forwarded-Encrypted: i=1; AJvYcCVGWq4VhURHJcLwNqTpbSVNf/JwVDoL02pf78itUcsUcSZDY9Q0pLYnrJU5TnBjgHvtvcXXImyAnlo=@vger.kernel.org, AJvYcCVKOjSNEFPgBSBROTOhxBB98qBLQ06FZO+a76GLuIc0HGkLibQLnxP8IELGMv8RV3/vwwBbesDiSdEBYUo=@vger.kernel.org, AJvYcCVR2F0F9XxQOdZR0704dV6wBfUfkOdFmBv7jy0gzxxPvCxCPbPKOBodgvZb7u7ZGTav+RxZUwkRN+sjX4Jo@vger.kernel.org
X-Gm-Message-State: AOJu0YwQHA6xAn98iCOMUziK692opMCH5Y+WtzY6w2nqognMl5k3smqZ
	y9F6WU7E202Noy7d0Z6xdLvBd/GloUAHuXLGem0Xarjfi2bXTQNo1nFU
X-Gm-Gg: ASbGnctbjE4Yk/Fu/HaYKa+gWIDJTAESRPt+TDz/5Ppwc6wa1rqmZ3GhUBagPPNLI6A
	gGm6eGj3N5E6rYqHUyV55YCVzJVfGkThbACHmqo5LekWVRZ3MihBs5V8i0it4xoky9nXkYpmqEI
	gMHb0ccG0sVIADlZGpok7cmWI+21xm3GznH8nx4wfXkaS/+455AOerFEsViKQIS7gwesS3wC6ZP
	DMDmZNZ4PKi9ocqRBQZDNEaNZv5QtcSgBWflsd/P+MArSLBfs6txVDb1AbG0K7M+q4XH/Rx6u8x
	k8M4NGHTDY6ewYsNCPVvGAIH3yrPA2HWaPR+svgPNVy9cUtalyuIPO5//sZLG30AljjDXA5HiLa
	rU24TfoO4pTozkg==
X-Google-Smtp-Source: AGHT+IF0XtiV51Ye0m2nDgyWEyVZWdZXdOMIrgeIT7t+FXgoHro7abHxMEkhc0w1HnmHJgO6z0SnAQ==
X-Received: by 2002:a05:6512:6d3:b0:560:8c58:6cd7 with SMTP id 2adb3069b0e04-5625f817e0emr722096e87.5.1757164639337;
        Sat, 06 Sep 2025 06:17:19 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ad44f8fsm2312647e87.137.2025.09.06.06.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Sep 2025 06:17:18 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 4/4] ARM: tegra: adjust DSI nodes for Tegra20/Tegra30
Date: Sat,  6 Sep 2025 16:16:55 +0300
Message-ID: <20250906131655.239340-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250906131655.239340-1-clamor95@gmail.com>
References: <20250906131655.239340-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing nvidia,mipi-calibrate and cells properties to DSI nodes.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra20.dtsi | 4 ++++
 arch/arm/boot/dts/nvidia/tegra30.dtsi | 8 ++++++++
 2 files changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra20.dtsi b/arch/arm/boot/dts/nvidia/tegra20.dtsi
index 5cdbf1246cf8..39c0f791c7ee 100644
--- a/arch/arm/boot/dts/nvidia/tegra20.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra20.dtsi
@@ -238,7 +238,11 @@ dsi@54300000 {
 			reset-names = "dsi";
 			power-domains = <&pd_core>;
 			operating-points-v2 = <&dsi_dvfs_opp_table>;
+			nvidia,mipi-calibrate = <&csi 3>; /* DSI pad */
 			status = "disabled";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
 		};
 	};
 
diff --git a/arch/arm/boot/dts/nvidia/tegra30.dtsi b/arch/arm/boot/dts/nvidia/tegra30.dtsi
index be752a245a55..fecd4891e751 100644
--- a/arch/arm/boot/dts/nvidia/tegra30.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30.dtsi
@@ -343,7 +343,11 @@ dsi@54300000 {
 			reset-names = "dsi";
 			power-domains = <&pd_core>;
 			operating-points-v2 = <&dsia_dvfs_opp_table>;
+			nvidia,mipi-calibrate = <&csi 3>; /* DSIA pad */
 			status = "disabled";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
 		};
 
 		dsi@54400000 {
@@ -356,7 +360,11 @@ dsi@54400000 {
 			reset-names = "dsi";
 			power-domains = <&pd_core>;
 			operating-points-v2 = <&dsib_dvfs_opp_table>;
+			nvidia,mipi-calibrate = <&csi 4>; /* DSIB pad */
 			status = "disabled";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
 		};
 	};
 
-- 
2.48.1

