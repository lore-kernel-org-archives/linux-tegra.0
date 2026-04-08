Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011034.outbound.protection.outlook.com [52.101.62.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EDB52E2DF2;
	Wed,  8 Apr 2026 21:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775683528; cv=fail; b=MC11qvzMsL79sWlqkGalTXnyK48rLqBH1qeCkES6LGadbSKVIC9uI01ccB9onwngjnTQ1LBuPWAxIJ8ennznBk1oELq8ozmUAa8o+E+XgGm4TutbEj1PU0memD78WG+jn6zLW4ysBXtkWGxeckhO46R/N+sQ/TVeqye5Sjul1Po=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775683528; c=relaxed/simple;
	bh=EwjbnVK1XdfqEN4VGgcEtMUjsHgytjgCYgwsnl1Q9ok=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BxcOTtOGQ4NBT3e2lMJh4cvIMvKazUtBiN1sos1d83E5LW2py5F7GmLEl7ZBzWJ7ugKZ01fGq5JKIJcRs7tAMhg8wm/0TlIgmI2f2EwLqc0LhQ1m7oDftLN+mq2BRgDJwj54SNO10XKDiUSi0imBmGef7whnfSk56JpY4hQfYFY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=GYpL/K2s; arc=fail smtp.client-ip=52.101.62.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="GYpL/K2s"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KaVYkUy6cHKLFz9qEw5PrETSMB2VcVD2wwdyQrzeq24WhHEUShfiJ0zK0VvNEDFGysC4cr+QElydyXoijuKwXdT9wwE3CBMDbCDjYGJ2l5WtfApGlWzsOVsHfCq4mrhVYoy1u2KXq1TzelNDgztncbtJJq6mUsMXs9Kf4ywmQYJvIROo+zHVQTEYCfZdm7gzr/CKpFkp2yoAAXfWG9tQlbnjwYWLueKcGJ+/UJRwV1IpTPzwmNKmJvkQFhsTOslVTrn48ByeQOhTs4BlmwPHsMbLhOVfVPQl3RgxPDi4jyO7i+sWaqQBhzj+U3pOIA5XChP/xlePbrlH9JiofbER+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Grs0t0w7oRj4r4Qymz2jKjFtRMdJPjYct3vUWJvpqLs=;
 b=tVD8Or2cHUV/L/cFe3skHkPpN0josc5SRmE8S6rTgSUS6N5KRtwEOLnoZ946A4JACd/1IX01kHedHKhMaz3+uP9BNNAek9vZIeNKNN3avcO9hfFAiPs6ruSksYyoJ9eviNCo+9PGFPntyCQCXZiK4kaYxvf7Obdz6yN+CVtiQQbNpv0AfO6qNi2+A1IWlGsgHw4PBbPoVIgamWWKDoYfADja4Fj/KDSl3d7YZ8P9ZvJjjmt0Zdb4qpZo55PFDsOJhdeBY6D0cNL+sjpCcLugZiwci0ipB4tB29Bq7MAEfCRPVjo7x+GQG4zFkOLb7Ch0IKbTVVH0f1eVTVP+7QJSmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Grs0t0w7oRj4r4Qymz2jKjFtRMdJPjYct3vUWJvpqLs=;
 b=GYpL/K2sJHa1EimnyMenYsSQKVUBbMvv6bl6y8WD3/feSCn1asrJJgT+cESZVM74yi2IXFh3+KBaJTDpBtAhlPlhH3GwhFZs40iAYsgrvLxmwqrtOeQn3meScCzjj2LM2lKIVQTxKKWInncYpfIpAi6Z2qOu/loOASAdujhG5v8LbsLiHoAUOJlzfPWo2+8BgdhbSgon7IpJTuIa7wqsM1r2Fb/36PccuSL96fdT9J/Mwte/Nxs9fDZYxmAe41WNjw1ENIjdHWcGvd+F3l1tbIFUt8DaPw98Z9Rj7Sr6kAyWhWkbqwLUrAEokxdphxrd3MM+Ku0RecdRS1VRpoezTA==
Received: from BN9PR03CA0254.namprd03.prod.outlook.com (2603:10b6:408:ff::19)
 by MN2PR12MB4254.namprd12.prod.outlook.com (2603:10b6:208:1d0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Wed, 8 Apr
 2026 21:25:22 +0000
Received: from BN3PEPF0000B373.namprd21.prod.outlook.com
 (2603:10b6:408:ff:cafe::ed) by BN9PR03CA0254.outlook.office365.com
 (2603:10b6:408:ff::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.37 via Frontend Transport; Wed,
 8 Apr 2026 21:25:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN3PEPF0000B373.mail.protection.outlook.com (10.167.243.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9818.0 via Frontend Transport; Wed, 8 Apr 2026 21:25:22 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 8 Apr
 2026 14:25:03 -0700
Received: from build-suneelg-jammy-20260204.internal (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 8 Apr 2026 14:25:01 -0700
From: Suneel Garapati <suneelg@nvidia.com>
To: <dipenp@nvidia.com>, <jonathanh@nvidia.com>, <thierry.reding@gmail.com>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <amhetre@nvidia.com>,
	<sheetal@nvidia.com>, <kkartik@nvidia.com>, <robh@kernel.org>,
	<pshete@nvidia.com>, <timestamp@lists.linux.dev>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: Suneel Garapati <suneelg@nvidia.com>
Subject: [PATCH v2 3/3] arm64: tegra: Add GTE nodes for Tegra264
Date: Wed, 8 Apr 2026 21:24:13 +0000
Message-ID: <20260408212413.217692-4-suneelg@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260408212413.217692-1-suneelg@nvidia.com>
References: <20260408212413.217692-1-suneelg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B373:EE_|MN2PR12MB4254:EE_
X-MS-Office365-Filtering-Correlation-Id: 2442fa5e-9739-4a2a-eb9b-08de95b5577f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|921020|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	uCyN31XNbj2MOgRHWYiaAUn0/D3GFBXcl8//FlRjHkfkc7ncyyjFaO2Xke3ycddSQdWlWY0odbyp4RHlQhlua6AuGI4T2GwCtPHNqsdsNFJBWJgVk0q8nTdC7fx2sCLBYqtxnRYSYrT6DnzcKFpbW2LUzC2eap9VUJqYoeiR/Fmib/IwBdzieYVBsmDttX7AKMua6oAVeZ0MZ2Cxb3QrRsRk5ou1kSFCjT9MrilefBAlecvkGAdwSIV8VdQnGgvOcHs447MYt28QXGptjZVu4p4VkS6gEf57txyHNRT8NYmsxdgbwlF2sw0DzyqRJV+S1iFKqupyrYgd9gYL70KgbDsZMdzbvuuA7OosHsVuuNDvEOOFqdxBsk1KN0+QPt7A0jiO4IsAPm3Jm8Y1K7Ax+Tx4gIJ7u1I6yDoAS+/+LiVONnR11H5A8IR75nxGzqCBJ8Sc+lsXoufPgwmWKQlSNFETpkxe20FX4eiNxfiz99SfrgF/3r6cVPUTGT5hxlB4s4Vm3vMQRmTwpd9RkwKgdH6XT830+5Ey3crGh1ylzn+msNk2BTrNQHIx8njHsATZ2g3vHuJeKxddjFWcLp0iT+IzetMaF8UmYj9JYwAzUD/xEq2CNlAW5TK43WW6wrWiSD/3Mi/VSlFBORBZyzck/pHGuU/zjiNpOJB/69azLa15N07yzkYafWQU0zV3DK0IEgjxQOCOA9pqt4cUyFavd1vXbYHWk0bzNVVtKJ69P6RJaQKiKuNHyaZXJAhj4QTjF1zoFm8fTTkzElDccBchEx/95Mu8Mb8N6q/2iMmcw6FiaUnloBLYEgjinXuYqgWU
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(921020)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+qJ7A4eXoXlMGy0Npux2iUCT5tM+BqBiIjVyDeZJyt9oZv6k0tQ7baA8Lk0LujY0F6OlfRVz3vOKtqDz2swB0Ro3yAHq2vxVO/uFOThVTVpZVphZSObKrV7NyIEN8oPs3w64dLjSKdggE91MeiomyabYh4BrQZagAN4709sXa/mgyU5FQRw0h4aAomNOFA90zdeaf1HtOxkXRQ7it6EszGrWvcJxUeOF3esJq2IboCNQTWdADZelRy54npUz8cDLJpLTwMC9sOrI/6AVO1laorM5umG0TMlFM58K7PQrLdB57Wa2WKsJhkaqgPGHaLdSugSpgBufWIZ6cMjmQAsK8su4to0dQJxCNyEyatdzk00hEpgtOa8QwL97xV7EiUwbdG8WYxo9Lj1rtNNkNc9fPr0yXt2JxMyR29Gk91h7nGpconixZrgDmnTRdG6c1eMt
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 21:25:22.0829
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2442fa5e-9739-4a2a-eb9b-08de95b5577f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B373.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4254

Add AON GPIO and system LIC GTE instances for Tegra264.

Signed-off-by: Suneel Garapati <suneelg@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra264.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra264.dtsi b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
index 06d8357bdf52..c6630733d5e3 100644
--- a/arch/arm64/boot/dts/nvidia/tegra264.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
@@ -3207,6 +3207,15 @@ agic_page5: interrupt-controller@99b0000 {
 			};
 		};
 
+		hte_lic: hardware-timestamp@8380000 {
+			compatible = "nvidia,tegra264-gte-lic";
+			reg = <0x0 0x08380000 0x0 0x10000>;
+			interrupts = <GIC_SPI 0x00000268 IRQ_TYPE_LEVEL_HIGH>;
+			nvidia,int-threshold = <1>;
+			#timestamp-cells = <1>;
+			status = "disabled";
+		};
+
 		gpcdma: dma-controller@8400000 {
 			compatible = "nvidia,tegra264-gpcdma", "nvidia,tegra186-gpcdma";
 			reg = <0x0 0x08400000 0x0 0x210000>;
@@ -3267,6 +3276,16 @@ hsp_top: hsp@8800000 {
 			#mbox-cells = <2>;
 		};
 
+		hte_aon: hardware-timestamp@c2b0000 {
+			compatible = "nvidia,tegra264-gte-aon";
+			reg = <0x0 0x0c2b0000 0x0 0x10000>;
+			interrupts = <GIC_SPI 0x00000226 IRQ_TYPE_LEVEL_HIGH>;
+			nvidia,int-threshold = <1>;
+			#timestamp-cells = <1>;
+			nvidia,gpio-controller = <&gpio_aon>;
+			status = "disabled";
+		};
+
 		rtc: rtc@c2c0000 {
 			compatible = "nvidia,tegra264-rtc", "nvidia,tegra20-rtc";
 			reg = <0x0 0x0c2c0000 0x0 0x10000>;
-- 
2.34.1

