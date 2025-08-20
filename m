Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9BC3431FE;
	Wed, 20 Aug 2025 15:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755702837; cv=none; b=QhWwYuqhT90juBxgAKlO/ZeKCWs3zOSCzBB9DtusrM/LEUMdYuUAzYkLNbGMwLEWyTe7lgZzOXXaITkh2JZ19KdOBoGnL9DFDCpA3D8c1Yoclt0ftAoiSzmgYrr9LgwiVVr8mmQNHGdbqdOVD5sV0IQlTcCyi9Puh6mDT2LGN/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755702837; c=relaxed/simple;
	bh=UILOflJIX6L62CFw5MITmgMtHSeUzyEdlA3IlLzQZjM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ul7dA/k53SDUnGT9MS8GthLJZfjAfDEqf6eCqMA1jk4GQaAq6FvllkuWWpnbq7CILAJ8xkR8Tka3aHHcx3bBbqp0PkLKyQkHdMotyenjAhuDO88HI+T8hN/H9wS1YrGIaV4EEnyJQmwwML8Za3wl0uA05WAtsUrO+Ay9sBW4Onw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ODX1rVwh; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ODX1rVwh"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-afcb61f6044so3508466b.0;
        Wed, 20 Aug 2025 08:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755702834; x=1756307634; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mb1Fhdg0IpMpAnNQb5U919bea+ze6pC7PvuCd0rLKxs=;
        b=ODX1rVwhkaoz/ptIadk+qqz4T/k8Kp8qWRUwhVmdDryACUJk3R0lo6tRGWp29Gw7yN
         fl6stlERjzVbZxH5Gc+BLcu4ncybr9xuF2MVaJ7klbpuP84LSkr+HfHEOP/ZsUUPic+P
         Brx38gVV08RDQ2Vt9Q9+ZWFXZXh9vgtNOA/ErcfvH7yX7kHIfywGtpQsSIkspdOAEl4A
         KESqTgiOyegAbwlWL0HKu6T0rvcISh+oVdrrAerq3oYq5veFA0vQYvjeKUT7Bem4KVus
         bsCXt6xGCC0/NKCWevSwWXCwPHVz5O1tdlAuDjrgjaKqN9gbZ6M2wexpw5K3hB/FQ8ce
         T2fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755702834; x=1756307634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mb1Fhdg0IpMpAnNQb5U919bea+ze6pC7PvuCd0rLKxs=;
        b=WdAOIZ8aj7Z5yz98pY3EDqkEPESXkwZYj9JGo+0ycZIjeIJa4DHslDgUVNyxbhDJtC
         xdx8Dvz0Guwj4UQcxt0FMwBq1ri9gxgnvcdhS4wDFUV23vgaLf/Cu03C2A9FmovJjSq/
         +NdGvbId+gos+ftZiK+JibofxR9NGg2Zibnvw4Plw0c/YIjZDpsSTq7yR4Ati66pE5B2
         9eP8Ia/7jVtKI9ehiBK7/7r/28Y7YnXVrzVw0SsIqWIN+ExqWlSnl7uKKNTr9oOoMOFq
         TgjEFGEB8vXKz6Y8Sh6Mylq9pdcOz8b4BUYXCO2PA9Yk9dT6zF5QxFiLITG+Oct0MSHk
         UMOQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+Sp2Y6eC9jZgKXJZxHuz3ZV/20t9VqTNUTmN4pbpgybtQVknIDPeQ/17B6OdIaWOlhvs1RlnAtqx9j/E=@vger.kernel.org, AJvYcCV5eNSb6OPDfXMJ5erJtkFYrxiekwkKUOKaN004o5oFGsuSGUoij1ShyUaqIo/3eekm6h077ZObJt9k@vger.kernel.org, AJvYcCVNORp8fHjUb17H4xyzyC63r7DT6sEth8zGzXvlCrcx+ZMypIlwpT16NHW1FY2hNxTHbcUecPfG5Cmd@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ0IJbJves3HBX5UFSY442nme75jFHx3du5NeEeQ7dRkMmJMT3
	ITHvvF1AsdthcJBJBBJa7ZcEbpPbcsT84VZVox2vAGKZxtCSoIdWVFn3
X-Gm-Gg: ASbGncuiUMiHInw98K8eDJaibeR7/ctY/WVPIBGnG625RDMStcQkYRvNlDjva2Ocwij
	+v3ioR8s/o/bKO5tPlihTV54S91Z2DVMWA+IyvqrrRfRm4mNCT7F4atgcTLCPJvHNw7zQFM/dPf
	fDGDHFDcvLyD6sAzL2rngMrhJJF+4AT6OJ77rU7GFlW1obFfEwlSBrLjPoV6BvVDSOt8BbumfVK
	vXXNwSET0JTW2jkQE8caebRhsx9+XNDi5q1EHv6dtT2dKNWUqYs++r258j/HhMDRxvhPsyTUrz+
	aCClzGv0Nn/5vbx4tPOpiP5yeAy7alcMhbyFyQ2RXeUkwfuTNrRJdNPpp5ZoAnW3t39sgTTtET2
	ftyVJuOWFNkIfIw==
X-Google-Smtp-Source: AGHT+IGvveuw4V/IpfCYz0bHV6VY+5N4ibPXfGUTemU02u90V9vM2gktLD1/fRdCntg7JBVr5Fldcw==
X-Received: by 2002:a17:906:f5a3:b0:af9:70f0:62e3 with SMTP id a640c23a62f3a-afddecf0d5fmr631425966b.15.1755702833942;
        Wed, 20 Aug 2025 08:13:53 -0700 (PDT)
Received: from xeon.. ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afdef1d34f8sm175905166b.83.2025.08.20.08.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 08:13:53 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <treding@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Dmitry Osipenko <digetx@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v2 8/9] ARM: tegra: Add External Memory Controller node on Tegra114
Date: Wed, 20 Aug 2025 18:13:22 +0300
Message-ID: <20250820151323.167772-9-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250820151323.167772-1-clamor95@gmail.com>
References: <20250820151323.167772-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add External Memory Controller node to the device-tree.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra114.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra114.dtsi b/arch/arm/boot/dts/nvidia/tegra114.dtsi
index 5a6999eb4357..97f5ddc197a0 100644
--- a/arch/arm/boot/dts/nvidia/tegra114.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra114.dtsi
@@ -195,6 +195,8 @@ tegra_car: clock@60006000 {
 		reg = <0x60006000 0x1000>;
 		#clock-cells = <1>;
 		#reset-cells = <1>;
+
+		nvidia,external-memory-controller = <&emc>;
 	};
 
 	flow-controller@60007000 {
@@ -591,6 +593,16 @@ mc: memory-controller@70019000 {
 		#iommu-cells = <1>;
 	};
 
+	emc: external-memory-controller@7001b000 {
+		compatible = "nvidia,tegra114-emc";
+		reg = <0x7001b000 0x1000>;
+		interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&tegra_car TEGRA114_CLK_EMC>;
+		clock-names = "emc";
+
+		nvidia,memory-controller = <&mc>;
+	};
+
 	hda@70030000 {
 		compatible = "nvidia,tegra114-hda", "nvidia,tegra30-hda";
 		reg = <0x70030000 0x10000>;
-- 
2.48.1

