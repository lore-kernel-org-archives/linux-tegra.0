Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2071.outbound.protection.outlook.com [40.107.93.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6948A16D9C4;
	Thu, 11 Jul 2024 17:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720717895; cv=fail; b=g39keOo/xTStppfyy5w0MwSE38yL0J/Gib9ZGG8jylN98rrp5UzB/2WFgdrOAtpyPAeg3TnBX+C93A3uaWjCHd4flgd5cwkuZL8ZSxzfs9DZL07oeOn3o2/Hvbg/nS4bmVrII80uFwT79x1AG3tSeOwiDEhQM+q4dKPy1jEE/gA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720717895; c=relaxed/simple;
	bh=RT2KFS1TDiZsl5R/m1HisoICnymkzprZUOUet5+PdmU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ww9zB8hdrxfqxWxTekgz61qSlPJA2CMN9PwHdG6MLDj+BwB32YNiZwwnVPygIJWJTpwjJEtGc6hST3Bhxfo8vPV94rnUb6UGXIAkdAt1f8AqwvfYiWjqK4nNHYZ1giEkNVIEqBzHKs0wuinYzexkErJF8LoJrOdTdGTHE0DA/so=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=oHtvmtoc; arc=fail smtp.client-ip=40.107.93.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="oHtvmtoc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xi8PEvFSDETQnjNBIX88zGi13xFy4YqwDRSkAoudlH/Je5ukwNPqPCfkz4DlDzdeiS5UgkyAedlxplwBvzC0uDYjFdVCAq1cpMZ+RAAMS5DAWOTY8riWLPsUTSEDHBZXNerMHYtAMjpqYK3WppXbowszJkOYWjwziFYORplDI3lzMdwJN7+ouzc+Hr+xYRSlzb+PBE9cJsUSj/PVdRV0A7TqsiyJpwfZW9RjzsaLubENEgQmgFiNVsz0ce7TXGJp0D6otw4aT21JoMcmLw8OY8b7LQUfuXmkeoYpb9S7KeH6zRJHS1dOqKSbipVQZWJl/2X68nO3Ucu7qVUrKbXiQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+iayTMhLi4MgKWrl8aoPyRqSBPrdqO1LUaeh5xAvHE8=;
 b=ERRcyK5Sq1OesUxwIjIH4prxMzRqCEb8FgDs4Xp/0FY9wkeeQiS+nJqJaDXrk3lhrEzMw6KrY7Hti0wUoUUZLHg1J0pGdPPP9/7v37uuOlTTsh0b1MeduRTEQBbJU1o2dsEooI53ZFlKjtI//8J2hetOIBasPkQkFZ61j+yBKVv3KxUrbuA/+S4uKIrlHt0DQ8uDAH1DmNgEEWLpU1hGMexZxb+YDAh7FBq4XUmHLIawmZ7r4Ugl5/5UTwKNfqKQF1mwOhD0sucbPwdjaVujyTYlw64UqWTRxXuzPKqnSDt0eIfnOl9d34MtaMG3pVEiBgYakSyAVeArCpdySp8XXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+iayTMhLi4MgKWrl8aoPyRqSBPrdqO1LUaeh5xAvHE8=;
 b=oHtvmtociEucBkl3ecTCSk1SvudEvQjYf4xT59/mM8JzjXmKmxM2DMI2pnfQmI25lxvFSEXju5zXb2lezJBqmmMTrkYLgZlwXMW3+y8SzkxcygIKwQl8Yjx6Z03drG/sjRnogU479cF9++2X+AgJEmzEC8NpIYmqsOk25nyKR7ehw73qmEXRH0fY3DpYPjW+42gmmYOrRtmk1cU7oK+7K0oZ4uxmRD+1xWXlUGWSyqC1QW2lz4CguvMcentQSvS1Pch5k9BV6IhnzCR2zINTVjLzJo/Y1pEggCJdufu4t/VtVrU7kYaItpI9AQ+2jAJZizD/H6R5hOuRC7MPt9IHcA==
Received: from SJ0PR05CA0075.namprd05.prod.outlook.com (2603:10b6:a03:332::20)
 by DM6PR12MB4203.namprd12.prod.outlook.com (2603:10b6:5:21f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.21; Thu, 11 Jul
 2024 17:11:30 +0000
Received: from SJ5PEPF000001CF.namprd05.prod.outlook.com
 (2603:10b6:a03:332:cafe::b4) by SJ0PR05CA0075.outlook.office365.com
 (2603:10b6:a03:332::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.19 via Frontend
 Transport; Thu, 11 Jul 2024 17:11:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF000001CF.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7762.17 via Frontend Transport; Thu, 11 Jul 2024 17:11:29 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 11 Jul
 2024 10:11:11 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 11 Jul
 2024 10:11:10 -0700
Received: from l4tsclab4-2000.nvidia.com (10.127.8.12) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Thu, 11 Jul 2024 10:11:10 -0700
From: Vedant Deshpande <vedantd@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding
	<thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, "Brad
 Griffis" <bgriffis@nvidia.com>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>
CC: Vedant Deshpande <vedantd@nvidia.com>
Subject: [PATCH v2 2/2] arm64: tegra: enable same UARTs for Orin NX/Nano
Date: Thu, 11 Jul 2024 17:11:01 +0000
Message-ID: <20240711171101.2798971-3-vedantd@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240711171101.2798971-1-vedantd@nvidia.com>
References: <20240711171101.2798971-1-vedantd@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CF:EE_|DM6PR12MB4203:EE_
X-MS-Office365-Filtering-Correlation-Id: 013cbcbd-f70d-47a1-1888-08dca1cc8182
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1r/SBkb8aUBhqttYMymcLVdVojNzhm8dA5Xy5ALQMPpKb813ettTrr8OSPo/?=
 =?us-ascii?Q?C3aR8/NHXqVRsAl8p1x6qPiW9HqqZ1qWuvRkIlYL5qXzePPxBdVC3YzngEDx?=
 =?us-ascii?Q?q4I50pdhvc5QaY1TYacZ8kY36S98M7dqvmtfqBAKecNRvBsU/STjyI2ZbQPi?=
 =?us-ascii?Q?bc7xop7MhxchCCftP2P0kG3wvl3/r8Y7zM3RtC2cxVDmLbODi/BGv0rMkuZW?=
 =?us-ascii?Q?EXfnn13TxczbKPDVQxI/HMppb0cMfzx1oKTRGR4hv+CZN0KXgvLCPz472gyV?=
 =?us-ascii?Q?6F7/4kHoun+J/GOgRtNpVXX0baFIVP3MkVxdezs5pTP0E43yKNsH04ZDs58z?=
 =?us-ascii?Q?81B8mRS5OqiSvR9zsZMBu4uoJOd0MAbuRTTpTr6Q8xs9MUmml8HPYWahfeWy?=
 =?us-ascii?Q?1dNQvPV4MedIaP3yIYiWZrdUdV69Pm9/qOsgCIgG6X7lpkTOcSSg2AtTz7Cs?=
 =?us-ascii?Q?Ma3faXNtDaueQ+nn7L3UO+iMGb5WKaKKKwx7nFsMsb5AoLjh8H++xKXC0jkL?=
 =?us-ascii?Q?g2xCH3iQAim/pnaefRodvX+JlQ1azcopu/tSvXnxw/z43aE4ErJl11KfvOPp?=
 =?us-ascii?Q?rxXo7ePlDkvdewHLbcO0XrBQ9KVXUVROAfaCAxgeFQ9KsbPoKp35OqfZgULL?=
 =?us-ascii?Q?jNlsptUSbcisloJUFb/uuMIzRFhLHiWXXSgf721IlKBRu5BNTLH2GjVuqp+R?=
 =?us-ascii?Q?HeIWdNKhiqVLyS36Br5kss3Ox6p8HSOrbBz62qj0xOm+obDBb+H20VOpACAj?=
 =?us-ascii?Q?p30SbRA062g9SdKnFDHe8hqNGc9z6/Ejnu4hTY9GQJyKaHuNW3vL3PAPkUVc?=
 =?us-ascii?Q?14b9ofmDKqw/tmTJ6zQxEHAFL7JjxW3P63vJwo7UdQhmYOFQUkf6RZXvnXtR?=
 =?us-ascii?Q?nT0XHUJN14bXH8TlcpuNJ17PWOrBlLKuWnUiH6kIRoXtbgGlMn57w2EiJKDP?=
 =?us-ascii?Q?Sv+SWU+njKS3hLMzHwtWV0t442vNr13WFMpN4fMfdjpOJZBxrH6E90A1cxX3?=
 =?us-ascii?Q?14rfRib0iD92KsiGx1MUVsGruL0k/lZjlHEQGzf1942TrG5hSJ+tdmxGrSV9?=
 =?us-ascii?Q?lvZpCpkL9Ex5473LfIEn5F5Z0M/Qp4NlMZoTnuzVS2vJEYwqLOQEQlsn4UIQ?=
 =?us-ascii?Q?0APjaL+j7Tx0g1k1nwFDUeThmSZhRB0YwjjLQyp35RyFCP3fQCy14bzi/cIW?=
 =?us-ascii?Q?fXxNmTwr3mefpukc0ANdqi68NavUTuZm7lk6lqPJABW8HmIrU7BZCaArRANK?=
 =?us-ascii?Q?uyhzDRQlu1i9zQrWoNT9ct5G1R6fAJQ5YmXR2+/yJkkuJUtYzy7b47YTsv7g?=
 =?us-ascii?Q?qPmcxDlTUMkK0lBIDFtf7w+t4CzejXsca0yvInRnyXSbs+85nLYB82SdnuFB?=
 =?us-ascii?Q?AxOuJhmTjzN2PsBNwAaH5NhYtBjDM6f42Ske0WCQGP4V2Xm2eunePZYNU1B+?=
 =?us-ascii?Q?295SmdSuz56Ee0kKWDyxwO8ZtlT8oE9V?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 17:11:29.6704
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 013cbcbd-f70d-47a1-1888-08dca1cc8182
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4203

This patch ensures that Orin NX and Orin Nano enable an identical
set of serial ports. UARTA/UARTE will be enabled by adding
respective nodes to the board dtsi file.

Signed-off-by: Vedant Deshpande <vedantd@nvidia.com>
---
 .../nvidia/tegra234-p3768-0000+p3767-0000.dts   | 17 -----------------
 .../dts/nvidia/tegra234-p3768-0000+p3767.dtsi   | 14 ++++++++++++++
 2 files changed, 14 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dts b/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dts
index 82a59e33c46c..5dc974bb360c 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dts
@@ -7,24 +7,7 @@ / {
 	compatible = "nvidia,p3768-0000+p3767-0000", "nvidia,p3767-0000", "nvidia,tegra234";
 	model = "NVIDIA Jetson Orin NX Engineering Reference Developer Kit";
 
-	aliases {
-		serial1 = &uarta;
-		serial2 = &uarte;
-	};
-
 	bus@0 {
-		serial@3100000 {
-			compatible = "nvidia,tegra194-hsuart";
-			reset-names = "serial";
-			status = "okay";
-		};
-
-		serial@3140000 {
-			compatible = "nvidia,tegra194-hsuart";
-			reset-names = "serial";
-			status = "okay";
-		};
-
 		hda@3510000 {
 			nvidia,model = "NVIDIA Jetson Orin NX HDA";
 		};
diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767.dtsi
index 6d64a24fa251..81d4f4f12ab1 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767.dtsi
@@ -9,6 +9,8 @@ / {
 
 	aliases {
 		serial0 = &tcu;
+		serial1 = &uarta;
+		serial2 = &uarte;
 	};
 
 	chosen {
@@ -16,6 +18,18 @@ chosen {
 	};
 
 	bus@0 {
+		serial@3100000 {
+			compatible = "nvidia,tegra194-hsuart";
+			reset-names = "serial";
+			status = "okay";
+		};
+
+		serial@3140000 {
+			compatible = "nvidia,tegra194-hsuart";
+			reset-names = "serial";
+			status = "okay";
+		};
+
 		i2c@3160000 {
 			status = "okay";
 
-- 
2.25.1

