Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2077.outbound.protection.outlook.com [40.107.244.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65FA629;
	Fri, 13 Dec 2024 00:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734048263; cv=fail; b=kFsrVyG76PIYVKmNn9UOYaMbxW4X8qBy719ysLNukj5oja4z+oLZv30nBCzIKJ6euCYpUnbDgJQCk7P/6oulqFiUuZ+GcrlKp1aeVzg8Z3ygH4Aq9Rw35Y32f49vROguCK6wBnZ5irrCRXEsnuKJCBZOaSpRG6v+kyb84KjleNE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734048263; c=relaxed/simple;
	bh=ZfnL5ifdXAq3bIRZjXaAP2E6lNj876BO42hU5BzlXT4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tVcyaRgISYEJ8R+Il6rgnqiwrvTnxkm0KfPvvjpuc1etuaNQKLKQwFw9YgBj2iRcARDmQd+E8ef98IhJ38varBaaCA76S4779BlTUy5vf+d2UVJZHMw6Q/vVcxxcSScJZ4OSyRrRRww9ZPScjGrJ38KlUz921CTh34ADGJXcQqE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=MR5354TX; arc=fail smtp.client-ip=40.107.244.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="MR5354TX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=npfm/qYYstrWQYeefV3xbq1pD5yNhXED64cbiWgI31oIxYPPY5y49sQu99ieL80TG12Ax+ywKYmKVwJh5kwq5BUF/doCwJ3rom/sENRq+I7nNgwXikrG5ZrBvhPHx7YTiHIZSX9DPCb2iO2Ds2iDGt9FCuyliwclDwdbm1KBpw+DSXAXgTkHsLWGX9QpuNokZ72OPtgWtvkJI2gM5uKPznek/ADmI7juohGCsT8a+UZElphxE5jUMfwjavlWaF+eKmRpFTHcdlRcldCM0jsagUlog7vpDa0kQljj7wqxES1t42JryGH1qJdXZ1A4bF9wiYm2GNiDTUPDua7/yNT3Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ewhTYt+Pqpay80iUJY9F5+SOWUUR8eMIwltrWXQ5Fwo=;
 b=pzjRRo3p+MW0QMEofi+w9pqJmvsgX7jz2XyVZycub5hGoFuyVQ6gaZ/5CBQ+ZnMAyIcKPXOY6e+BSqxcikAqbx+yetfYXQwx062dbf1ZB7fnYO1ygZZFRS+hIFLMz/Y988kJ0JDk5wwFaIWgSowu6JAL40KoWTuehbqSWWFrw5Ca4ggFBVMbTULUWY0gVk8KT3rOw21/VECfUqyQWnTIBDx7Lw/e9w+PslWpDajE06QO13GmAfooUkelf3jotDIzcurEkzYh0jG+FX4cYkUxqEM/E5GPMKTMSVSf7xwHW0xMNihTg0zlCKYdIB9mH8B1gMz4UD69S0i4eaJTv+4qrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ewhTYt+Pqpay80iUJY9F5+SOWUUR8eMIwltrWXQ5Fwo=;
 b=MR5354TXVoi8T1ico6kH6Z2aiA0KIj8Pn1Pcu0qAd1Nba+kEhDTpLmBqCNFkV1jdlCvOK0XmJ6/eRSQjU8wAW4fGwxqpEb1KpoO+s4q3BT56JxD1U0m+cKIAYzx4RynjQdpeqst6LlXs+x8aBCxbyncsfZjDxqt3gdXnBlcfxVKjY9+Ld2JuvxAueE3RbZxXVYvFTvo6innf0HF44naAt3gwlVBRIwwMrec0vUXV+ryP+psz4RYKx/kY4QV27EO+RkTpKW47QPuF8a+tEQbGfz0V1bSMIxjfzqQd67AJkQu3pdLFiTDBk0L2d/4LgcUf2hiZ+0rwFME0LWQ2absL/Q==
Received: from SA9P223CA0009.NAMP223.PROD.OUTLOOK.COM (2603:10b6:806:26::14)
 by CH3PR12MB8509.namprd12.prod.outlook.com (2603:10b6:610:157::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Fri, 13 Dec
 2024 00:04:14 +0000
Received: from SN1PEPF0002BA4D.namprd03.prod.outlook.com
 (2603:10b6:806:26:cafe::a9) by SA9P223CA0009.outlook.office365.com
 (2603:10b6:806:26::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.17 via Frontend Transport; Fri,
 13 Dec 2024 00:04:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SN1PEPF0002BA4D.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8251.15 via Frontend Transport; Fri, 13 Dec 2024 00:04:14 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 12 Dec
 2024 16:04:12 -0800
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 12 Dec 2024 16:04:12 -0800
Received: from build-yijuh-20230530T223047391.nvidia.com (10.127.8.10) by
 mail.nvidia.com (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.4
 via Frontend Transport; Thu, 12 Dec 2024 16:04:12 -0800
From: Ivy Huang <yijuh@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter
	<jonathanh@nvidia.com>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, Brad Griffis <bgriffis@nvidia.com>
CC: Sumit Gupta <sumitg@nvidia.com>, Ivy Huang <yijuh@nvidia.com>
Subject: [PATCH 2/2] arm64: tegra: disable Tegra234 sce-fabric node
Date: Fri, 13 Dec 2024 00:03:05 +0000
Message-ID: <20241213000305.3533971-3-yijuh@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241213000305.3533971-1-yijuh@nvidia.com>
References: <20241213000305.3533971-1-yijuh@nvidia.com>
X-NVConfidentiality: public
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4D:EE_|CH3PR12MB8509:EE_
X-MS-Office365-Filtering-Correlation-Id: fc00b203-76fa-4b58-ef3c-08dd1b09ae24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PQWeYJMIssVfNWR181TNvFXDSPi1MEzaCuS1ohq2x42V/FUZJHvznYyIqB3T?=
 =?us-ascii?Q?znjDqWDuP1egelU2bvuFQ7dIlaRbvUywvrLfPViy7nJiCCMp2z8XF1eGsx8D?=
 =?us-ascii?Q?lnO/mKRvshho8GrTaw3MKzLKTO08W+RqMtBG8Rdid5OjsgiM6NtMfT4gNuun?=
 =?us-ascii?Q?dnXLMmA6sV8zWeXo2JJN6jH+xzPQGw09QLn1wFcg2b1BDnwxU282Z0Q479Q3?=
 =?us-ascii?Q?FT9XAHoAqYPXMH+ULeungfLMexSUGhR2eXsVQiRoPGBXi4zoognoemW4+R69?=
 =?us-ascii?Q?j4hmZHDZJmAfhFekRQ7AndJ230s0mYHZmVHayzfjsOMNp6H56t53ufq2H07y?=
 =?us-ascii?Q?OWqoKhmjKASDnWOwn8ucVX+iZIoJDzpFM/Y8HdS++AJN5OCzQv9nqG9kgqTp?=
 =?us-ascii?Q?enEQ1Ol4hxy+iQaZC2tWuy94qNmTAENvFn3RCptgNix/CIHGfmyvS9KjV9MS?=
 =?us-ascii?Q?v1gDsHVPmFNRYHQdmDxt547vjVGj5AUFRJXBAymahC8Orf8Ax7MBrxBW0494?=
 =?us-ascii?Q?TyjJfFcPTARL3a9jAcmYZlP78mWXMCYjQT1XsYkXHP4XG75HRgUqLIFIPovU?=
 =?us-ascii?Q?9ZoObXTnn1CNT1fjJdcgVbam/ATzU27mb2+Rtqmlqkr0nYDNZt6foXmxq1Sj?=
 =?us-ascii?Q?TxzKz1w28h/drlVXODYLuPNl4UXbme37dAoTisc1CvseVEKwxHE7DWjvK8H2?=
 =?us-ascii?Q?2rGOHsqRDityTiiByUu+Yfkpz6XuFu8y+ahUL7TPJokqBVjO6bNM1LpwlVMq?=
 =?us-ascii?Q?fD0fr8RXlPzDiwpkRmT6I69ACadNNW80sufAGjff4bERdEnJNmC5sCSUSXFa?=
 =?us-ascii?Q?xMpOfKSZhyCKjX1ekP+DAIFNCAF3mT08VZBY+OyUBkQeRNyk4ERgu45qcxtC?=
 =?us-ascii?Q?hvrJv3ZHHBm1M74k56TB+tP4GkZZ5oTOGr3hftbCEKHWWHM/S4saTkt6KY7N?=
 =?us-ascii?Q?MWFIJquLAyErYsNSvei1V4hRrlqBbqg1E79M1twas7Dwno7dJts3ptzEnwVe?=
 =?us-ascii?Q?ULaF432yRxkhA9N5GPBVlvXbnjABVNkfTVlBMZFPuROwUN86rQdNXPQMwJjB?=
 =?us-ascii?Q?a2vG0U7cYWLfrsVix84L2MWXGSWO6zGuownkO+D53HSh4e8YiybbJASwndcN?=
 =?us-ascii?Q?uynVKa0SrYAG8QUJOy8bcN78wVgOGqJjRdGYF78bthsQYZ4YhLk+p/wCA15t?=
 =?us-ascii?Q?I5yBOcJtaOgRra5Q7R40tXaDKlRbVDYOvQtQLT05imsT/YBzlmY5ayvKJoaZ?=
 =?us-ascii?Q?e3h/I8Qa3W7GRdakl8Fy7LEHJFf3hUNoI5Tn48zMnfSnu5+ebue9Vk5+1w9d?=
 =?us-ascii?Q?JCiGDafUHz/qud4bvMoOhyeb9n23Z2/33UpPQHOuKTMJzuT2V6J4ESd3sBdh?=
 =?us-ascii?Q?FWgcZy9iI2aaNHFqo1zZuaVwJMN7nJmL6A7d4WOMl2T0EMiEYC1RSJarCi7X?=
 =?us-ascii?Q?pqZKX1ukue4A8AFC2GBUDYWSBhZU9rTm?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2024 00:04:14.5852
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc00b203-76fa-4b58-ef3c-08dd1b09ae24
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8509

From: Sumit Gupta <sumitg@nvidia.com>

Access to safety cluster engine (SCE) fabric registers was blocked
by firewall after the introduction of Functional Safety Island in
Tegra234. After that, any access by software to SCE registers is
correctly resulting in the internal bus error. However, when CPUs
try accessing the SCE-fabric registers to print error info,
another firewall error occurs as the fabric registers are also
firewall protected. This results in a second error to be printed.
Disable the SCE fabric node to avoid printing the misleading error.
The first error info will be printed by the interrupt from the
fabric causing the actual access.

Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
Signed-off-by: Ivy Huang <yijuh@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
index d08faf6bb505..05a771ab1ed5 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -3815,7 +3815,7 @@
 			compatible = "nvidia,tegra234-sce-fabric";
 			reg = <0x0 0xb600000 0x0 0x40000>;
 			interrupts = <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
-			status = "okay";
+			status = "disabled";
 		};
 
 		rce-fabric@be00000 {
-- 
2.17.1

