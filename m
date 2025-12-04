Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907F02DEA9E
	for <linux-tegra@vger.kernel.org>; Thu,  4 Dec 2025 06:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764829040; cv=none; b=rVwe0a6rnmdA4haKAO1acfGTalvyAuyukTcoI+4ocRo5FDvmOW5omWQEn3tpwXrxmXRAPRHwRR2M3VROx/tV1pcgjWtab8jp901yYRBqjtPbqRj9LYMP/C/scfI2/8vl1yq93YLCN/mp2v+Bsey2wXTQ0GqGZhAOYP8nVlp0iLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764829040; c=relaxed/simple;
	bh=eWyb4phIDaB9Lh/G9uzUO+x1BpVASAfd4mHwSb0xves=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LEnU23qlvcxxsYkX8YwifAd4P/VJUx8Rz68HLm1zEDILxBiEqBySeKPzg097fbBfZ/l6U4Oz4yNPb6jyqIdPFO+D9qadkX9Z0CGiuRz9dTmyOH0RdA/yqpSzdcfyfmc/ZiOkPn4m30VUIpLcl2VDVAc4NQy12u+QFdnDTtfd/uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D+lwXgVX; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D+lwXgVX"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b7633027cb2so84483566b.1
        for <linux-tegra@vger.kernel.org>; Wed, 03 Dec 2025 22:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764829037; x=1765433837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xO0aKgv2KbReOFRNCLP5zz82s3c058MLvHztpGFjRTA=;
        b=D+lwXgVXdQseiKugeTT8HEZFr0ZO6YSkedO8eM+HLQ50AhzKD0DNdNZnvpEclhBohM
         d59s76kADxcGJP0o0w1XVGJTgVRjjrdqsU+vqiSKVexm7rdkm8Xlqc/iqGMpqvDp0q2X
         lHvH5Q+ltT6ZpBy5pCWBM+d/WA5Lmvmken6ZPSCIMcAGcx1KLbNm/hPpV4Go+ifmXE6o
         2yGHXOEYsYb4eJMkDLtibyNR49HvUljuHsMAkj6BljNflzHmEqzfmOGdjP99u7RlwnQt
         nsAAlV5ksTVU6R55KEsgqiyFNstg5Xz3bNPXgBV80wjgWzGnzUGat5L4CHD8/ocs5wqY
         mT4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764829037; x=1765433837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xO0aKgv2KbReOFRNCLP5zz82s3c058MLvHztpGFjRTA=;
        b=qEBhjcn2CW1dRU2vJWTjv9Uw075dgJgKruyKcwSrL1v7BuPexNbS5YaHtKLv1NtZNQ
         kB/9by5k7/rb8c96Llue/sy+k2FtZdWYENpkIl8N2ObPHObinSaBTRHJ6UrnVLV3H/0M
         GJRlZ6vaNxb6sNcpBYo2UQTgBwDDJyoTzjDy4MMBv98yl7ZKDEvvd/5UGjXs320cp80L
         h+hYxsGdVBzH+urjXCUmbiPB4SHGbQQSbrW8+M9BXNRO/u8SgESlGYg/9kyB+1J096Ma
         T9kpIXyTtUOkZ+d0GcJMD2cv6uMZ8Qt9lbKTHfvJ7rDCNTO5mIUcS3AvZ8GbWbElSIrJ
         uv+w==
X-Forwarded-Encrypted: i=1; AJvYcCXuO6ZhlHJhKtUK33n2eLXNhEa1YK8YvTj++7DqdF+BV57tLrKMIB6fMnHyerRcM+1emcSMd6qjo4Uftw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGP7kdiB929Zj0Ux/Rl4gG+7oCHiWd/O1Rr1m7DDcE2BxfPm0A
	aSwTVbOVSmdGmawEY6MmL01jXxqnWS0V0biuTcE54pgaZbNBsibR4nP+
X-Gm-Gg: ASbGnctpEyAFonjHITeM6C+aJApYKpCXcgGLE/MQhFLwgpTl+9Cwv1erzr27cesyzTe
	EG319AaFTskdhStjpuWbeejFWQr596gVCzX89DPYL0GB2eAl5Pf30MoGeLBMFBnKgr8XOj3MRE6
	GmE7smjlb2u8DzZeUiiqlajFEm8PNau9ERV0lJlmMmPz4MtzwFU3OEwroRvubScnjYkfF0kbK/i
	aKB8FKOWjnrigQbgv3MeWHcPUBqQlQUXvEWyE739f3XumqJHZqT03j+HlfQ8gELm2Y6UEyl6BpX
	sUgBbN43unvUaTbB72DFaeoiPt14nQt0gBfobvsq+dscBSGZXBB+i4FCLs+Ytzq3vSi8jw8Jw3e
	ys7llQJek+sdnCRPpZOygr8TOp/oGLOEjBKAmPN67QsezxS0yTXZrWq0TnLdj6qc2PzHpscGRzb
	/wefQZ86Q8pA==
X-Google-Smtp-Source: AGHT+IF1K60L8X5YUUDbUfaqT+WhDWzWe2HWAZE3zZLtHiewIpC9IHuMviFoxvCFWSRO/KZ3uycBcQ==
X-Received: by 2002:a17:906:6a20:b0:b73:b05b:1f9c with SMTP id a640c23a62f3a-b79dbe857e6mr544792366b.14.1764829036626;
        Wed, 03 Dec 2025 22:17:16 -0800 (PST)
Received: from xeon ([188.163.112.74])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647b2ec2d8csm490159a12.5.2025.12.03.22.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 22:17:16 -0800 (PST)
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
Subject: [PATCH v2 4/4 RESEND] ARM: tegra: adjust DSI nodes for Tegra20/Tegra30
Date: Thu,  4 Dec 2025 08:17:03 +0200
Message-ID: <20251204061703.5579-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251204061703.5579-1-clamor95@gmail.com>
References: <20251204061703.5579-1-clamor95@gmail.com>
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

