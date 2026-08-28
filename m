Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011014.outbound.protection.outlook.com [52.101.52.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11858463B85;
	Fri, 28 Aug 2026 14:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787928070; cv=fail; b=jywadX++ayHum61jIjPaq74KiMQ65ow0PeTQLoFtzWyx3oh5x5c0BmEYZ6n0febV+5Wsrb590aIFq2NXHeIdBgYcaDYWj+MXwIqzFkdEizmQL0tRnhlzOaZ9NAM7lRKbPgxqoi7u3kpwU3J3lTZj3ChJQkzX2Hhtwj1XMr1s30s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787928070; c=relaxed/simple;
	bh=NS/CVjC7V2wb7rQzdvcpp8CP4l4x/+ntR6/YVvjS3zY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=IJVBgGwA3co5X8MgplPbQ9hkMrgPEr6nIjP2f7bMvsDc5M284oRRazaBVRZsiUTHhDZDxDLfsnvTKZ58daY9RkVKBa5ZdjujOpUcASnLoMBpDHVHvuVdDbD+WRQSyn+IplYyl+lnRhoLz310l5DLxryNF5CDOu7k4vhgwRuC+sg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=I1gjpLbj; arc=fail smtp.client-ip=52.101.52.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="I1gjpLbj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ybKFl5aOLK8Vm1mgi+mzF0N7URkVqBIVVVSA/ynESpkwllOlRvgFhZU6PUs7+Df1vSEcpC94BAJvxbKKPTnHRmpM96k8iULmEUskrolYRJr7kvR8jlzDML+ExW4z/kNfVl8/gvCJK6zWuHdn+Rh+7SnfgXm9sGKSXskEqqzu5fO5/B3fWQvu7WX2s4aURdQqgXIzoEBN1slAgYe0/14T+jeEbtubWCrKev3b3oqC4orMeDFrDV8iYGA6FA0gxzRGRXkVXJ8wHKgwLTSVAueLWleHd4LN3+u7ukiCwjDsRqIXroqzwJseJV7u333D0CcMuVChNnL3urTQhsyK3WUmUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gya2RaAIHKCFpBzYSue8bpdttu1s6YqpVVZGWDY9lrI=;
 b=g17ESab6d6EyCURDmsxOcOzbsCS7IUiaJXYw64j8qWdhqfhsaKPKoNEAHQM+Ng5VBVEyFpVNjPETYQRL9XhQ9464C7zTw78DblGCu+FMI+BdFFtrfoVoye0AvUdT6Nskwo1Uc0+RqszSNr6sfJGCTvhPH1IYjDqlCoI1pSrngQvQbg2OdGwTL07vjsge5Nfm3o+LjtvopaMMgFmHQyTC8RmIB7jEpSdCrZE/IW+yuHy9H0vgerpcKjyD+v1/oPv9M8ZGdX9l0dKaFb5e+CZ/1ghoObFsbFZc5hsjCzH/ipcD+W8X/vGZyVlRco9tUsfUF8+zq6M8OFO2rpnMsMtJ2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gya2RaAIHKCFpBzYSue8bpdttu1s6YqpVVZGWDY9lrI=;
 b=I1gjpLbjx5AWXYEp7z6nIzLpBV28fPhVzRvWNF2i0FhhisVaQE4ivjJyxc1eaqGypaChkSSHvp5xbFVb4aidfQqVppdaxA5Tg1Mqzm56kgrT2/Gvu9l6x45dt4iELx7oK3UrrlYHjFxmCvFi0tE33ai2f5h/aIuA2yve88nWyiCB3WY88xnFNsxAayFmlH7aI1GSFqd0p2obXTeuremodC6EmcjNh3/BnfX4rbDs60jh7lCY5WJ2sKP96+WNXeI35SYPStujhnc1k80qJDhGyEIMpdK9TTSdTH2g+aMntPIvJhJjo67jQZ5gXPM0SnTVAQqzVdXyYB9jVk6yALZ86A==
Received: from DM6PR07CA0077.namprd07.prod.outlook.com (2603:10b6:5:337::10)
 by SN7PR12MB7912.namprd12.prod.outlook.com (2603:10b6:806:341::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.9; Fri, 28 Aug
 2026 14:40:57 +0000
Received: from SA2PEPF000015C7.namprd03.prod.outlook.com
 (2603:10b6:5:337:cafe::30) by DM6PR07CA0077.outlook.office365.com
 (2603:10b6:5:337::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.11 via Frontend Transport; Fri,
 28 Aug 2026 14:40:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SA2PEPF000015C7.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Fri, 28 Aug 2026 14:40:57 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 28 Aug
 2026 07:40:26 -0700
Received: from [127.0.1.1] (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 28 Aug
 2026 07:40:23 -0700
From: Jon Hunter <jonathanh@nvidia.com>
Date: Fri, 28 Aug 2026 15:39:52 +0100
Subject: [PATCH 2/2] gpio: tegra186: Add support for Tegra268
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260828-tegra-tegra268-gpio-v1-2-317bd91295e2@nvidia.com>
References: <20260828-tegra-tegra268-gpio-v1-0-317bd91295e2@nvidia.com>
In-Reply-To: <20260828-tegra-tegra268-gpio-v1-0-317bd91295e2@nvidia.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding
	<thierry.reding@kernel.org>
CC: Thierry Reding <treding@nvidia.com>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Thierry Reding
	<thierry.reding@gmail.com>, <linux-kernel@vger.kernel.org>, Jon Hunter
	<jonathanh@nvidia.com>
X-Mailer: b4 0.16.1-dev
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C7:EE_|SN7PR12MB7912:EE_
X-MS-Office365-Filtering-Correlation-Id: bfa1e987-4629-4e15-301e-08df05125f42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|36860700016|1800799024|82310400026|56012099006|10067099003|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	SLMq/e2zWsT2w/fAWak7mSNylrcgDQJvtT2836+iyQ78X+EzhuYcND1GI0Lln+UEjG2oALF8jN+b9LHPtdbEKP/GpLFatFaweFWpqjy+F8AaieABeTIFy8T05xEQjw6LGpxZ5aM6ZsHg/e12dJjDELDdUQsym1Qr5VtMI2EBB9YU9dw/zcuq/1cmg66q4Eo/NEg8IzmIPT+4H96e1RPietePzDfJ9OJsaOPOMy68ZyVzb3pHlx8jVAMTogFrbhbs7RzcWurQBlkaFJSFbcND/mbSxUMsGth9gFw4LWN21IaOa55Ad5N742IPVkPkKOiv9NHvpHL95gm2Ym5QSG+6trbb5nEWjhNacZ5jtRiSpAN4kUnYi2sW05UDFw3B87ey/z/BG/oow1iXfT5V3JQg49y/ir70ChUBkqeMKufwMbPm7PwRwfsNCeHhOaqOhNST6HeyfLBsvGpEUlmqehl/5Opzt38Jm480yNbfYevMGcKin55H8FTc7ZZETamD5J8AWdeFYoRUtYCx/fS+jv0BZJTxxm3C819G1eyME4Tc1AVF5r8iDZRSe/98M6RQq3MTaQmSZcCloWTiHEckN6fcPU5XOGBcVLyYi+ld2jmvnKMLZi76FKgdaSSsjnYs+WihSC85z2dwYH4asd5rHuGqjn5Jl4gthlTlodhzEYzsr5RvRL07vrl8fD3mtXOP/reSgeHMFE9MH5AC2pQqeiI6KA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(36860700016)(1800799024)(82310400026)(56012099006)(10067099003)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Nw8ChqCmt/E8R51LAIvBLRy7Od3LncyShHtIrOcHNvBI5J56BT152IIV1EAHdV7NmpAvTpjGNXbZda7YeZuQllOB+/TRuPNKOEFoMcuwH09JoYdHYsfhsvWz7PV9d5CQ7a2QBDur73KiaFGWvAiH8NTEMjhIQGCuZ9SgP6BoPse7n7GwTer/W/8DgI+5R92pF6KH1JYIWzEaIoZjO6A/eBjmK2rL9xA0PEaU6wIUF6vp4AiHirVWBlEpxXfrQ6HFty622i/18bctemqSq0xeZje0ZHDwDFsKKLkBaMiyJCMkzK7lY3QtdJoc2lfSnbOQYS8qpaB/mlONPYlJsuy89JMXqkNXDR/kgsMZDVpyFCKZQiWPKVif+g5W8rSWNjPesH1/oXLPnaPB2UHfJ2YGC1OP4+kNqnSaIWzDACrx4+DmKAQPoYjLWe7GfJf19vNr
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 14:40:57.3022
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bfa1e987-4629-4e15-301e-08df05125f42
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015C7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7912

Add support for the 3 GPIO controllers, main, AON and UPHY, that are
present on the Tegra268 device. Tegra268 has the same 3 GPIO controllers
as Tegra264, but a subset of the GPIOs. Therefore, we can re-use the
Tegra264 device-tree port definitions for Tegra268 and avoid duplicating
these.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/gpio/gpio-tegra186.c | 74 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
index d9a2dedf50ea..34e084c95d7a 100644
--- a/drivers/gpio/gpio-tegra186.c
+++ b/drivers/gpio/gpio-tegra186.c
@@ -1419,6 +1419,71 @@ static const struct tegra_gpio_soc tegra264_uphy_soc = {
 	.has_vm_support = true,
 };
 
+static const struct tegra_gpio_port tegra268_main_ports[] = {
+	TEGRA264_MAIN_GPIO_PORT(F, 3, 0, 8),
+	TEGRA264_MAIN_GPIO_PORT(G, 3, 1, 5),
+	TEGRA264_MAIN_GPIO_PORT(H, 1, 0, 8),
+	TEGRA264_MAIN_GPIO_PORT(J, 1, 1, 8),
+	TEGRA264_MAIN_GPIO_PORT(K, 1, 2, 8),
+	TEGRA264_MAIN_GPIO_PORT(L, 1, 3, 8),
+	TEGRA264_MAIN_GPIO_PORT(M, 1, 4, 2),
+	TEGRA264_MAIN_GPIO_PORT(P, 2, 0, 8),
+	TEGRA264_MAIN_GPIO_PORT(Q, 2, 1, 8),
+	TEGRA264_MAIN_GPIO_PORT(R, 2, 2, 8),
+	TEGRA264_MAIN_GPIO_PORT(S, 2, 3, 2),
+	TEGRA264_MAIN_GPIO_PORT(T, 0, 0, 7),
+	TEGRA264_MAIN_GPIO_PORT(U, 0, 1, 8),
+	TEGRA264_MAIN_GPIO_PORT(V, 0, 2, 8),
+	TEGRA264_MAIN_GPIO_PORT(W, 0, 3, 8),
+	TEGRA264_MAIN_GPIO_PORT(Y, 0, 5, 8),
+	TEGRA264_MAIN_GPIO_PORT(Z, 0, 6, 8),
+	TEGRA264_MAIN_GPIO_PORT(AL, 0, 4, 3),
+};
+
+static const struct tegra_gpio_soc tegra268_main_soc = {
+	.num_ports = ARRAY_SIZE(tegra268_main_ports),
+	.ports = tegra268_main_ports,
+	.name = "tegra268-gpio",
+	.instance = 0,
+	.num_irqs_per_bank = 8,
+	.has_vm_support = true,
+};
+
+static const struct tegra_gpio_port tegra268_aon_ports[] = {
+	TEGRA264_AON_GPIO_PORT(AA, 0, 0, 8),
+	TEGRA264_AON_GPIO_PORT(BB, 0, 1, 2),
+	TEGRA264_AON_GPIO_PORT(CC, 0, 2, 8),
+	TEGRA264_AON_GPIO_PORT(DD, 0, 3, 8),
+	TEGRA264_AON_GPIO_PORT(EE, 0, 4, 2)
+};
+
+static const struct tegra_gpio_soc tegra268_aon_soc = {
+	.num_ports = ARRAY_SIZE(tegra268_aon_ports),
+	.ports = tegra268_aon_ports,
+	.name = "tegra268-gpio-aon",
+	.instance = 1,
+	.num_irqs_per_bank = 8,
+	.has_gte = true,
+	.has_vm_support = true,
+};
+
+static const struct tegra_gpio_port tegra268_uphy_ports[] = {
+	TEGRA264_UPHY_GPIO_PORT(A, 0, 0, 6),
+	TEGRA264_UPHY_GPIO_PORT(B, 0, 1, 8),
+	TEGRA264_UPHY_GPIO_PORT(C, 0, 2, 3),
+	TEGRA264_UPHY_GPIO_PORT(D, 1, 0, 6),
+	TEGRA264_UPHY_GPIO_PORT(E, 1, 1, 4),
+};
+
+static const struct tegra_gpio_soc tegra268_uphy_soc = {
+	.num_ports = ARRAY_SIZE(tegra268_uphy_ports),
+	.ports = tegra268_uphy_ports,
+	.name = "tegra268-gpio-uphy",
+	.instance = 2,
+	.num_irqs_per_bank = 8,
+	.has_vm_support = true,
+};
+
 #define TEGRA256_MAIN_GPIO_PORT(_name, _bank, _port, _pins) \
 	TEGRA_GPIO_PORT(TEGRA256_MAIN, _name, _bank, _port, _pins)
 
@@ -1528,6 +1593,15 @@ static const struct of_device_id tegra186_gpio_of_match[] = {
 	}, {
 		.compatible = "nvidia,tegra264-gpio-uphy",
 		.data = &tegra264_uphy_soc
+	}, {
+		.compatible = "nvidia,tegra268-gpio",
+		.data = &tegra268_main_soc
+	}, {
+		.compatible = "nvidia,tegra268-gpio-aon",
+		.data = &tegra268_aon_soc
+	}, {
+		.compatible = "nvidia,tegra268-gpio-uphy",
+		.data = &tegra268_uphy_soc
 	}, {
 		/* sentinel */
 	}

-- 
2.43.0

