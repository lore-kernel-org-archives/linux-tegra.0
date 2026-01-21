Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012010.outbound.protection.outlook.com [40.107.200.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB58421A12;
	Wed, 21 Jan 2026 10:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768992373; cv=fail; b=eyIcz4365mMCJX2bjvKkauXHHEMjfjd6oACH8WU5W7AhqNZdqoCjpsSDb0421SEKY2h9n53hjFmzFjjTJ6bX362aIy1erwdKFsrAFvOOU6xLbQlrgFZn55Ei5r4jOMjlltejT4vlltsODBytSLWXCQd1D2l2jyJgcWxyhN624ts=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768992373; c=relaxed/simple;
	bh=8EdNOshb28Jjp1I/zXvXHfILaP1UHLs1Ru9DerOqgiQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pUTGI4Pnxdniaxn3kSt8Jsbkeg4B8mIe/b+ykKnnboB5Nkz+LLBXMGa3wgqfsAurJN56DSutYs5E5qw4o39P4sezk2bPoEDFy4rhYv97MQY+JZ+mGP86ThbqR8+4g94ZddSBab2tU3/OxiUdJgaQGJD2pXVISZ1UGBDCyKZaaYA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nNgiEeJK; arc=fail smtp.client-ip=40.107.200.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nNgiEeJK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wvTAUKKFn2aR7bWMKNZOGyxK8g+620CnDldYO8Zp3nicNP54xPTq/o4zGQn9506qwLoAfhlaaSnyN/1rulgIie73Y4/00K54NTi2oBCKozyp49W8wTXNbWyTJvQi05bqkmn0On15wdX3dfbNBFWNQSMDZtZCBFNCmyAlIBAwSBHlS1ntUcELXWVDkHyQGKX4cKHUtiFeyGpaELiEcLOV8LE4PpDyxxndrj1GQQ7SNO5LsarxyRSBMHQ9liuyAbPEb8I2vF7+SqNdUURuANkcS0tsjIBogNLU+hMZazS2lE1F4rk7xty7xkHMpvt4LgpcG2A95x2fHNjt3ovou52KPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+fECw5/Kt71xL/Idfr0wRRnD+wUqBd3hy5URBNpDL2U=;
 b=n/NqIuKB+s5c4ZkZUr0SR5fb738agIjP7kb6oCs5i5NiRX+dLfrGzWJPO9UEDynMeuMYpXtVzb1dbvRN3Hm67pjJVbfg8ZiL9Y4vGAqUSUBj/Jnjf8hMftCLvsadBN6fQBCdoWmvm9EVh50eNRdo5RdcE+Qtf9Q9Uo2acEPLSExgFStRqWe5M1bz36PSXoNcNaEr3od+a1GZgG7DzjQ1vFhhpVMi4d4Rg07nYhUuVRIsqHDe1EyihV3Zz73wiUgA3Vdl+V7rOr4u0/c+gf3T5SAu0hTazKPBHxZ1MVjZbmdbSWcAY6pwWdtmRHxmOq/LzB72EUrEDh8opwPGtGXLCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+fECw5/Kt71xL/Idfr0wRRnD+wUqBd3hy5URBNpDL2U=;
 b=nNgiEeJKgQpSNQEP2wkHs+c3Ws4RSUCxfTnlZN0V2XRoYySUs+x3B6+PBVSzJ7Q7gaQGB3GbFa/JuB10415/yOWQWWiNDtGTL0qKiG4Ufw+OQjNMrpeV9wqJ3izJmoLmftEv4Z7Vpn4Z52CaxRtzItRqK5UpvuxQ21/Gh8TWvqZuP03jVoS9vRLf2CLMrnbGHDqqs3JmiDqpuikn7n+bEc8wY7qoyWKXihFDUOj4ez1CkvuJpcivxc9SRiDERCBWJuzUeTikOwQE8YDSey/PvIoQ5k6Si1uDiTHO/4/I9uV9AMMBy+3+FpkyG1qtpUItCDX/MsMN6nNp3J6ugILrCg==
Received: from PH5P220CA0004.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:34a::16)
 by SA1PR12MB8641.namprd12.prod.outlook.com (2603:10b6:806:388::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 10:46:05 +0000
Received: from SN1PEPF0002BA4F.namprd03.prod.outlook.com
 (2603:10b6:510:34a:cafe::f7) by PH5P220CA0004.outlook.office365.com
 (2603:10b6:510:34a::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Wed,
 21 Jan 2026 10:46:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF0002BA4F.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 10:46:05 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 02:45:52 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 02:45:51 -0800
Received: from sumitg-l4t.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 21 Jan 2026 02:45:48 -0800
From: Sumit Gupta <sumitg@nvidia.com>
To: <treding@nvidia.com>, <jonathanh@nvidia.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <bbasu@nvidia.com>, <sumitg@nvidia.com>
Subject: [PATCH 2/3] arm64: dts: tegra264: Fix CPU1 node unit-address
Date: Wed, 21 Jan 2026 16:15:35 +0530
Message-ID: <20260121104536.3214101-3-sumitg@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260121104536.3214101-1-sumitg@nvidia.com>
References: <20260121104536.3214101-1-sumitg@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4F:EE_|SA1PR12MB8641:EE_
X-MS-Office365-Filtering-Correlation-Id: fd5089fb-171b-427f-2b31-08de58da474d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iLoN423w9uhMXIXAirmhu0hH3vfDS/d3sY9VZmDkUBaAeyYyR7r8J9virTP7?=
 =?us-ascii?Q?NRcm1g3l3so2XMG8PeX6uEq1zyafO/nANaPHmo2wYNiDmxU0L9Eo12eVoQ38?=
 =?us-ascii?Q?83n0nhM8vpqK6THuCF1PukNLVpMQtS9vjTz9M9bxGEseyGESndk2RvKWGjEw?=
 =?us-ascii?Q?+1UCNyEOniZhhN6QCAK/CnLIz/8hprJLeB66JjHans5e/qvsusS8s0mmgv//?=
 =?us-ascii?Q?muae69pKG035ngiMPY5QLe9KFtWtbUF1Kt7M1lBtxTbgRmUK741pBtnPZBlb?=
 =?us-ascii?Q?KsBED/W1WkOmxTr8yX2zU23TWBZLIJVIlwmRYYEo2HpgCFt1oKpV8IULli+1?=
 =?us-ascii?Q?H8Hrzlrqm/KGGLDcSXekSikUPBPajJVfwOVnCxMuL5Pfpphkne3MGTzjHY1w?=
 =?us-ascii?Q?qN5LR3sZX9IqLIbP9YDjkRmW4otaMPNFntPW6W3jmoEnQAc1bWElg1J13BuV?=
 =?us-ascii?Q?agYW6M6tnEZik0Gwp3BggGAD324GHyJWSL1FZ8A/76bIpRGWKbdJmousTH6Q?=
 =?us-ascii?Q?8wDixPfjgg6uLQ4RxOxt42iOcZ34oJJzxiyRA8Zh/woaw/UmccYrN8raqlTG?=
 =?us-ascii?Q?VF5OQ54QBoSwxomaWzlrjMt507/EU8qL9YOnH6vcZjdM25ApYBZ5DFhrFe+C?=
 =?us-ascii?Q?URSVkXdLlJ9dpX4LKQxWfUGPDzqUUh1VL7alvlsKAiUPptXV7vjZV7n1Nnfr?=
 =?us-ascii?Q?yEqm4tOW+0xiBanwpdygY1aMPXuuznoru2XUPuICALYsAHP/MYdzWe7OznR4?=
 =?us-ascii?Q?/LVIMCgZRNVtVdwTmFzJf2Uy6wjvrsmK8Ve+2ysFmXODZiW0cq9fW5LuEKm5?=
 =?us-ascii?Q?AkIY2cb3cSrjmd9Y/nmdd/6qR5ugCN5e7io7yCrKpqPYvc6qh4ZQNYZs2H9r?=
 =?us-ascii?Q?145Sf6Jut4o3I1zYhGY2mk8K25OW6TssK/XT6CR4z9POLZo3BnDYj3b4oHAu?=
 =?us-ascii?Q?b+xyQo348fvR6XfDGBJvc6scDuWYyB82GhsrEZXp4VfbtWx4jYLra0XK0ONF?=
 =?us-ascii?Q?butgHMPdmXh+j37o6G6nfYqwn2AFkG6n53NlNvfIGe5lb6OUApCxgkFtlzMC?=
 =?us-ascii?Q?mOzgiR/RWmYEvPU7UpdQVv3r8NdE+w5tp1sCs3ZrzuhoGIj0jqJzXNKXDg+u?=
 =?us-ascii?Q?4Ss/aIOvvF5e+K+vfESOzUOaN/WN7TYotM8pl7l/0oTJaoTpcPDhCYX0tiAP?=
 =?us-ascii?Q?wNcRvEf2YbwW6MUTZrN4wHYofYH2keJTeNX77Oul4vrOGA2Y66UijtOvL149?=
 =?us-ascii?Q?kUWcGgS6QOF+YNHdwIW/YCv6Le/M3472jRladnechVHYzjHK86GL5zbT0PKR?=
 =?us-ascii?Q?h6iDuTGn5b3kd6JlGx/qYIi+Uk03a+wn/cISEEFZ33zjxwoq9v6rWs7f3rUa?=
 =?us-ascii?Q?+J4r2okspLsc3ctXoUBRJDxdOuAl1nJxauSQj+wMPyeDhVCXVoMxZFPPCQ/q?=
 =?us-ascii?Q?7Hu31FKWbySCiG1IhGdFX/91oYmYpKbZFFIzGEyJKob0peFFScVjWanCCb2G?=
 =?us-ascii?Q?WvUrAVAkLo0Bi7ZIeXg/LJrKL+e6g0c2LJ6ZuhHeGknk7emMpTqKRdQD+G9l?=
 =?us-ascii?Q?hdwCCgb274XaCGTKzWmIZxAYVgztK8rht+hyINlm8WjSmKo+Edg7V20cn/+z?=
 =?us-ascii?Q?G+ducGbUTfPBH/FaAq68EFR3cHcO1oCOP8Pbm9sgSRRAikBrH6cLKlF89aRm?=
 =?us-ascii?Q?7IwRyg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 10:46:05.4076
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd5089fb-171b-427f-2b31-08de58da474d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8641

Fix the unit-address of cpu1 node to match its reg property value.

Fixes: f6d1890e5f4d ("arm64: tegra: Add device tree for Tegra264")
Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra264.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra264.dtsi b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
index 7644a41d5f72..fa00e95f87a3 100644
--- a/arch/arm64/boot/dts/nvidia/tegra264.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
@@ -3788,7 +3788,7 @@ cpu0: cpu@0 {
 			d-cache-sets = <256>;
 		};
 
-		cpu1: cpu@1 {
+		cpu1: cpu@10000 {
 			compatible = "arm,neoverse-v3ae";
 			device_type = "cpu";
 			reg = <0x10000>;
-- 
2.34.1

