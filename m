Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 129C61A9F83;
	Fri, 22 Aug 2025 10:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755859284; cv=none; b=BMA7o+bJtAQglbI81O+V3QDrfhBMuFJJzJpRdR96/390hzMV69Jjgw0t1u9MxZ0l3j4n1gU9qplNAA7N1IdfnMKwmlrCJ7mSlpIGlHdKKElDBDYp2pivmkspVG7jAe9K/UqvKgs65lkmlO8+DluwSToFlVqbQRV3W2cbCTbYq8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755859284; c=relaxed/simple;
	bh=Me1dJg/pHlizlj5H84yNP2X0isXkGGoFfRDIoGVPRWc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JJ8ggRRdP1LHaht5eQ6tnN6qMZmpi79fc1v6kLWBM5g6B14YaDx/KycL+rqXWyrzkuB2of7HmTu3H9HKC5ZBC95ank5cBrJY9Mihi+YnY70p6tXfVwxyohff7tQK+ik81V4g3nBd9nT3BjtCHpInJZPIY3+8oke434ZNWAd8hOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Js6V+l1k; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Js6V+l1k"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-76e2ea79219so2391842b3a.2;
        Fri, 22 Aug 2025 03:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755859282; x=1756464082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dNhDX4p0fKfiv+TH9iIj+ArcAJDpkAdzS+QmGkDY6Ck=;
        b=Js6V+l1kZs75fXAj4clIB5xtP55YwR64rb3FxiOUlaxgnsM9K4/MB+g07o98clKrGM
         WNdiMxTshzR9jrNqfF57ZjHm8E8oFb7uUKTl2kAJZTJgVXF01JFm4uPMKHFQzu3mZu2r
         6kEgodAKEjPMoCMKM3t6/2S1IeGITKqATNAu7mwgYHNp3lYFfE6uaD1WtxvRGfTjsJ+O
         RguThyEtRpDWz5pbXvGJjuuB5ZpHLVYaFMhVuc0GODmfcg15uBqUuz/vnRb8EM9kqcsO
         SBU4B5GP4F+a23deLDMUvm7iktwvPoivrtSuKBPwHzTmAhQQzieI7cITHYvKk6UYar4L
         Llgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755859282; x=1756464082;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dNhDX4p0fKfiv+TH9iIj+ArcAJDpkAdzS+QmGkDY6Ck=;
        b=cmmQSlD089ptJWbXEnRyB4zCrQ+Ip38VKnRwiCnSfbYsf59NDkHnJ7BU+qxmWP/j/9
         vRvIY2dubaCn2bta+PztTx4l2NRQsfbESXnT3t1q4vHHpYQTxESqGbsPQGc+3uujwXr9
         BkC3dQQ2flnxbcds1G+Awk84QfVOE8v/46+dJUTv0vIKGvKt4to2NHUyN31L3jVQf2hM
         9PLo8juIs/7xdGlD+byfR/fYKdQw3/qpOOJ3+pbQLrKkiyxb8pThFtusZgZDUl2cUlgb
         4F3dMJVXccxQAQME4LyX/1l57wslRb+C1HYCqG90F44qGa0j5RDipiS/CefjSql74E5U
         FdEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjIht+gSjxSQL45FebsdBMa8efirkLs82YADvdM9lTsasQncizHdDd+XK+RHGD31IZT7IBx2v2VkMDUHBO@vger.kernel.org, AJvYcCWNu6v/zpGiB0CptjO4S82YldO5pfs9KK2O87Kww3kJoJbM7nuZTVgu253zFO7y1ruqOf0+64iQEwbc@vger.kernel.org, AJvYcCWTw/tCWYIpQJwakKzNVjMuV/lZlbtOx/zBaplIbbUkA5zT0Htnym8pcWI1c56qYUD7oMaCVasHg5fZTmg=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywji61ckYOZnGiYCu+fQoAEkmCNK76lU1sDs33+35yL+JevtiV0
	DtqsDgCz70/Q3k4DyKg0DdQ/m9oA6l0e/P99DvyNlQADSbTqNu4iqT15l+GVx35B
X-Gm-Gg: ASbGncs1o5viliJYMH4N2M9eZ8DXIt+fS0jwGQh8tO7GKwh3spIn3M1mzTs8lCUSy+V
	/EkOShllD2P0+mV01f8GWfeQ7/PMroNbK8xnyU6d//EswmIyyO2l0C3WhCPR3era+O1pOiYvENP
	SxpD0kJWA6br4Ad3ORMItZDgPu0QSlWG5uGVTalBeT9Tjz/7H62McersT+k6lRHC8B8bCxKUR56
	Tgr5+eaFOSKY64oHx5TIoHFB8imNf7AEcKHHFFV2DwSKtUIhNqB2y2nZ+yDYGnMJ/v5MG43HxLP
	9p49d8qn3oHcVL4FRpgpExpVXXgVbIyOAj/IT18TwHaWCvGD7HgJHkEI+/gHK/WLcqqtul+3mCd
	UbI3nBLXSQY+EucG2txIaCsrTTl7GYEArod6QRBZ1ni5b6i04DkLEAA==
X-Google-Smtp-Source: AGHT+IGFbM8ZjqqsU+rm9GDna/8IXtWUPRaXMNahHH9CkarNnF51vCXglirbqDNJp085MX6wfShpkw==
X-Received: by 2002:a17:903:178b:b0:240:8cec:4823 with SMTP id d9443c01a7336-2462eeea432mr31617995ad.41.1755859282081;
        Fri, 22 Aug 2025 03:41:22 -0700 (PDT)
Received: from 100ask.localdomain ([116.234.74.152])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24615b25fddsm38310785ad.138.2025.08.22.03.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 03:41:21 -0700 (PDT)
From: Nino Zhang <ninozhang001@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nino Zhang <ninozhang001@gmail.com>
Subject: [PATCH] arm64: dts: tegra: fix APB DMA controller node name
Date: Fri, 22 Aug 2025 18:41:11 +0800
Message-ID: <20250822104111.416390-1-ninozhang001@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The APB DMA controller node is currently named "dma@60020000",
but according to the binding
Documentation/devicetree/bindings/dma/nvidia,tegra20-apbdma.yaml
the node name should be "dma-controller".

Update the node name to match the binding and fix dtbs_check
warnings.

Signed-off-by: Nino Zhang <ninozhang001@gmail.com>
---
 arch/arm64/boot/dts/nvidia/tegra132.dtsi | 2 +-
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra132.dtsi b/arch/arm64/boot/dts/nvidia/tegra132.dtsi
index 5bcccfef3f7f..f6e63ffe1ff8 100644
--- a/arch/arm64/boot/dts/nvidia/tegra132.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra132.dtsi
@@ -271,7 +271,7 @@ gpio: gpio@6000d000 {
 		interrupt-controller;
 	};
 
-	apbdma: dma@60020000 {
+	apbdma: dma-controller@60020000 {
 		compatible = "nvidia,tegra124-apbdma", "nvidia,tegra148-apbdma";
 		reg = <0x0 0x60020000 0x0 0x1400>;
 		interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>,
diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index 402b0ede1472..a5018c486326 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -502,7 +502,7 @@ gpio: gpio@6000d000 {
 		interrupt-controller;
 	};
 
-	apbdma: dma@60020000 {
+	apbdma: dma-controller@60020000 {
 		compatible = "nvidia,tegra210-apbdma", "nvidia,tegra148-apbdma";
 		reg = <0x0 0x60020000 0x0 0x1400>;
 		interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.43.0

