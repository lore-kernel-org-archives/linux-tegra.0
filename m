Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2076.outbound.protection.outlook.com [40.107.94.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 881F17867D;
	Fri, 16 Feb 2024 11:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708084692; cv=fail; b=gz+Va/L+V3PDr7AS/W+lLcROixwVO7Dqp8NXgnVyf/5oLGUs2E6FMiuAl44AjFbTycYtrvqoZTAiwwBzDzpqChj4yVhsiluuBvjNpJWlXs7MSVGXtnvxT6iIopw+ffsyLRCjJUWApymQ0nBGYoXN3pavnN3SxYnw+ww9p3/6NVY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708084692; c=relaxed/simple;
	bh=7WdOwNBmOwSEMtOsDCEY0kRUmTq2W42tWvtUiYuxTNw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=c5APDlppb+i2NWxpQyM3UN5l0jrrG2xegOqvDKN7T6V9BZAovjD405XCY5LCY0owM4GF27KgHpozrTbWdc1r2ZkWTIw/CnqZfYfo1v+8G4NZAxHEANqMoAbBuNqiR6WXjb5FARDpLpEBfy3Y6u9oMpUmSl4e+zM/QjrjqohCmK8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=OiH94hbf; arc=fail smtp.client-ip=40.107.94.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="OiH94hbf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lobd5kcSeTQpnq6f19r7catq0oBl4d9dN+SnR/KnsmJOLIFm9dpCYP4BU1XcO9bxVa3/KCHnBseAaBj3xaYryBiSpc9mXMa4zBRe51nRMhaVV9c/9OcVx+jHJFLzW8Jkz1yIX6D/ysprOFthWVtQW5vm4TgZssFIjU45DlZblaw94o9ANKcdbolsJWlzEKuBO4YyKnmVG1oTxZz+zvpREhKcmu6uLgPuO8Z1OsJTfQ6qbphBjsL/uznZAmwQ2CgP+wZutInlrm7k7HsrKO0CF++8SmwvbS6rkubsB8fi2KpI+QNJbqDj6nJL9YfC4I09Qm/U+cJSp8a9mVJ/ra9yIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T7utbgzg+5R6Dk+ohiwVaKDnQDnEoIKsimefw659DLw=;
 b=V3wY0aH0SzhS4AjMkCVFxlwmbbED+9BNk2MnJZ2uPIQREQ7v3hakYFzKzQlPYFT0WtNgyP7G+QlgNs8ywh9O58/LXIoRMmDkniBHHbzboSXI9Ugpjd3mtKAn7Jjz7HmuIbdbwovL8346mKMgWA3Xx1vWUsyguMkGlbNo/Q//KnOaW5HhUZZSdYHQuT8qnapvObrDBQrjR7IYa21bdxEWnMBMlLz83fafo0sNQrP0TzKO/ZiLe8DkDEzg5pCRRul9vMnQUW7xxkJrg38lXaLLuCH52T523/acpcoKcbMwkXb/oHxBdLTMRkCXwzzIussoQwU9uExyR736+2iGXsOAVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T7utbgzg+5R6Dk+ohiwVaKDnQDnEoIKsimefw659DLw=;
 b=OiH94hbfWYl2mH/zOiKgphcrAldEes7GCyYr3Zcgw+eQDJ7QVD6kderqk6/YvmwoWnVbTi233z8+siwucsnesUdGUfw3L5GFwB+0qi6OodJkVcduRbRSJg3sZu6O7joWg0OLVB9QXvsuTHh/O5h7GbcIUCY8mwgR2vHAd8yNfrQNlm9kJ8GcB3U5Tv2XQS2e+6DreJWoGXEVzPnwU6l2t8RQjtmqO+cktwdlIZFZlTEaj8aH8lQURL+c8gaAXOt4zL75DUJNqg6ixNpIT4pGPe0sma9A+RImI1AmlKZioMCpaH2cSQYkuTC6v6HD2HZegRW+vDEEPVy5OSXh1lAuMw==
Received: from DS7PR06CA0008.namprd06.prod.outlook.com (2603:10b6:8:2a::15) by
 SA0PR12MB4351.namprd12.prod.outlook.com (2603:10b6:806:71::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7316.14; Fri, 16 Feb 2024 11:58:04 +0000
Received: from CY4PEPF0000EE33.namprd05.prod.outlook.com
 (2603:10b6:8:2a:cafe::95) by DS7PR06CA0008.outlook.office365.com
 (2603:10b6:8:2a::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.26 via Frontend
 Transport; Fri, 16 Feb 2024 11:58:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000EE33.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7292.25 via Frontend Transport; Fri, 16 Feb 2024 11:58:04 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Fri, 16 Feb
 2024 03:57:56 -0800
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Fri, 16 Feb
 2024 03:57:56 -0800
Received: from moonraker.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Fri, 16 Feb 2024 03:57:54 -0800
From: Jon Hunter <jonathanh@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Jon Hunter
	<jonathanh@nvidia.com>
Subject: [PATCH] arm64: tegra: Fix Tegra234 MGBE power-domains
Date: Fri, 16 Feb 2024 11:57:48 +0000
Message-ID: <20240216115748.24845-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE33:EE_|SA0PR12MB4351:EE_
X-MS-Office365-Filtering-Correlation-Id: 107d4c85-415f-431c-f6ee-08dc2ee6886b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Yff/zBfyUeLFuDjcvitIi9P99apDmQ7fCGksKGZ2BYC8rZXWU1eODZuGLhkDUG3o7l5K330167cQUG31xqx+7kWNwpjRJSEWjAthzdUvzp4LYvhsaG/3jUfhtzj2KFDdsbxJ0glaW/EjMIQQTITFX9X+1fMZCjHfz5VfEaasE+L0jwMiHKgDWzcZyXQo/aYU1sxY+svqJ5wO8KIXDXY1j9oMTgD/J/1pe9QD3SmPVdmSe+lmLgn4zMqoW/nCjE07xC+RXHMwoaZ3+mShFNzb0Z1I0cHblh2aMZ58DrzPkgWpl4GFBxtJOnpClIbT5D8Ch81oMZqs7mlul0izjx8StBj4WvMkut0MsMg9++801ucZen9bacOqqIMux+vSAiSz3N3j7+fOr1NCHcFeM5U+iom2G0UtvwNv+QvoMZYgoQvlklAl9dz2OKSCb8AIizVW5bLwswMu9OceCXVvlAG2YyikeVTMGfbyq3g30voKOnliZ0qFORc+FBNm9vzCYQREPviSIR2xi4bQWHuf8dl2t5Zmz5zfEs726xKqIdfO7UCZswmnwI6vzvsNSxHTiaKbd8FDM+Hi2uKaNtMgGaYKsqvgYiR0QDZ5XrWnVQiR4amW+r/CCDPkbO5UCGy2UuIneMGAuPJ5xP/mcnczkNeLstyIPH1VTYGGNkN7etun1WY=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(346002)(376002)(39860400002)(230922051799003)(36860700004)(186009)(82310400011)(451199024)(64100799003)(1800799012)(40470700004)(46966006)(2906002)(5660300002)(2616005)(8676002)(41300700001)(107886003)(1076003)(7636003)(356005)(110136005)(54906003)(6666004)(70206006)(316002)(4326008)(8936002)(7696005)(70586007)(82740400003)(426003)(26005)(86362001)(83380400001)(336012)(478600001)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2024 11:58:04.4494
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 107d4c85-415f-431c-f6ee-08dc2ee6886b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE33.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4351

The MGBE power-domains on Tegra234 are mapped to the MGBE controllers as
follows:

 MGBE0 (0x68000000) --> Power-Domain MGBEB
 MGBE1 (0x69000000) --> Power-Domain MGBEC
 MGBE2 (0x6a000000) --> Power-Domain MGBED

Update the device-tree nodes for Tegra234 to correct this.

Fixes: 610cdf3186bc ("arm64: tegra: Add MGBE nodes on Tegra234")
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
index 3f16595d099c..d1bd328892af 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -1459,7 +1459,7 @@ ethernet@6800000 {
 					<&mc TEGRA234_MEMORY_CLIENT_MGBEAWR &emc>;
 			interconnect-names = "dma-mem", "write";
 			iommus = <&smmu_niso0 TEGRA234_SID_MGBE>;
-			power-domains = <&bpmp TEGRA234_POWER_DOMAIN_MGBEA>;
+			power-domains = <&bpmp TEGRA234_POWER_DOMAIN_MGBEB>;
 			status = "disabled";
 		};
 
@@ -1493,7 +1493,7 @@ ethernet@6900000 {
 					<&mc TEGRA234_MEMORY_CLIENT_MGBEBWR &emc>;
 			interconnect-names = "dma-mem", "write";
 			iommus = <&smmu_niso0 TEGRA234_SID_MGBE_VF1>;
-			power-domains = <&bpmp TEGRA234_POWER_DOMAIN_MGBEB>;
+			power-domains = <&bpmp TEGRA234_POWER_DOMAIN_MGBEC>;
 			status = "disabled";
 		};
 
@@ -1527,7 +1527,7 @@ ethernet@6a00000 {
 					<&mc TEGRA234_MEMORY_CLIENT_MGBECWR &emc>;
 			interconnect-names = "dma-mem", "write";
 			iommus = <&smmu_niso0 TEGRA234_SID_MGBE_VF2>;
-			power-domains = <&bpmp TEGRA234_POWER_DOMAIN_MGBEC>;
+			power-domains = <&bpmp TEGRA234_POWER_DOMAIN_MGBED>;
 			status = "disabled";
 		};
 
-- 
2.34.1

