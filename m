Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2051.outbound.protection.outlook.com [40.107.94.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9556817A922;
	Tue, 10 Sep 2024 19:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725995154; cv=fail; b=MfrxmKhkGBXn+xSvhS1/wNrLzaUKJamRyWN7aaUrDEi+VqzBbOQ+P1LLVp18t32LgGipjIWe003HxZ1UdLt2f4wZB1phgSwc6UjwK8BR9+QwDg9OxDrqtg6/B8aTDlAQ46sqzoDS7j/1chfrSw42760dZVqOstMW9j8q4delUbs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725995154; c=relaxed/simple;
	bh=pPnFK6woLz1yJs2VZ1p0TqCY+vwVBXCCsdq+MtCT2dQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HxaLfHPDkLHC6/L+6v4KL73oaIECIK8ZT/hTvyeF7xTZotw2w5omxqyNdqmF5qkfFWQrlFCvZWkktNREbxJQuZQPD9SOhsyJyiljsCQy2yeanXpX1HLVA2TS7ege2E4UkLkVKT/W1t8aN9pnyWqB0iohd1Hz7QrdMHlalWTdgcs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fLAF3I8h; arc=fail smtp.client-ip=40.107.94.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fLAF3I8h"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eOcO3SVeV+TUzPHJ/NdHxk4qtrwM4ecnP48lR9EQeatwQmMAPiXpCcuZtAcZTS3VdfURPB5WBlMQdVUmH8goZ24kcL/Kd5sSRc+0kL5PS8qJ5y/dy1ArgT+9CXVdGThweaNpwu715baH96RUGqbFqCW08lUxv5iLzfe3TIFn0TNwUKXrQ2i0Pr1MuEY4qpvoYEQrdjMXM7UPt1I2g7kcsKqO/DhXSJ1UCl69yp1u3d78NRYvX1u/n5MMcV2IQCJCDJZoYrNP5f5MStRlIamX6a+vyIbpxRg+UQOe9xvCC+1A1HMVSlTQSeKy9cLb3WyLAi6p+QlTbtoj5/DuTMAcNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7iMDscaS7PexKdvpAkgYN3HuqD2W2olqusicVIgmyKM=;
 b=oUSh4RKfUL2PU0PBdh5oPPVsabQS2waLmcOb+KGbzcmGPj/HIxNc5C2SMaq8SZu7kOYo91NLKEIG5EkxprLgrO4r3zKLqjbVaW7NJk/vxoAnuIM/29IIjVYM4QJHYr1hLdXY23ITdp7IoD87Ymi68dsxBQHv6TCMOxH1OPJtq2Wzo/5wXzIVStFiSYa9W+f2XDE/HKIyeKFONgxanMe8FGeVSSc40g3X3OqDii9MD2TzERlr7qCTEBkNmjCxjkYt+33pW5f3bS040U++5FHpwl6RvfCL5M4mFVGmLL7Jknuc4ht4vAskKix6ZnVEiF11Ft2P/NcgSnmiJJd9owzQnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7iMDscaS7PexKdvpAkgYN3HuqD2W2olqusicVIgmyKM=;
 b=fLAF3I8hnZxP0UVYqgugZp6C8fGVnUgddc1Z4RAgWQ5z6dU/qMi6pJaXVd5yh2DF5ZUCl6lpKyq5SFg0zdCtWVo+MzLJhtSM6cz6caAu8nMFUXXmvQm0M1S0wHWSNjA9O8O6Dmx45X/vMwrQ+4F//HmgZD1m2xcyb3sWEoQdt9PqKi1fK8z42hZRoroyiCFoJRYwWwoypCUdzS7aIHjzrEX/ZHsDNEAtIiKjUrsfQ2URp50PrNWchKRQ+V4ubQkfjCTBjUzysNZ5SqX6A7TbTBhDG6JPeq9GNYLJhmaiyxEtayh9aHQS4An+yA1cjfxe9jNh6KKXvbbTFN4D+7QKFw==
Received: from BYAPR02CA0061.namprd02.prod.outlook.com (2603:10b6:a03:54::38)
 by SA1PR12MB6848.namprd12.prod.outlook.com (2603:10b6:806:25f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17; Tue, 10 Sep
 2024 19:05:48 +0000
Received: from SJ5PEPF000001CA.namprd05.prod.outlook.com
 (2603:10b6:a03:54:cafe::cc) by BYAPR02CA0061.outlook.office365.com
 (2603:10b6:a03:54::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24 via Frontend
 Transport; Tue, 10 Sep 2024 19:05:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF000001CA.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.13 via Frontend Transport; Tue, 10 Sep 2024 19:05:47 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 10 Sep
 2024 12:05:32 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 10 Sep
 2024 12:05:31 -0700
Received: from build-dstotland-20240703T000904114.nvidia.com (10.127.8.10) by
 mail.nvidia.com (10.129.68.10) with Microsoft SMTP Server id 15.2.1544.4 via
 Frontend Transport; Tue, 10 Sep 2024 12:05:31 -0700
From: Dara Stotland <dstotland@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter
	<jonathanh@nvidia.com>, Brad Griffis <bgriffis@nvidia.com>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>
CC: Dara Stotland <dstotland@nvidia.com>
Subject: [PATCH 1/2] dt-bindings: arm: Tegra234 Industrial Module
Date: Tue, 10 Sep 2024 19:04:56 +0000
Message-ID: <20240910190457.2154367-2-dstotland@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240910190457.2154367-1-dstotland@nvidia.com>
References: <20240910190457.2154367-1-dstotland@nvidia.com>
X-NVConfidentiality: public
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CA:EE_|SA1PR12MB6848:EE_
X-MS-Office365-Filtering-Correlation-Id: d1b004b5-9cc5-49dc-a20a-08dcd1cb944b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IC3XJpr6QVUkQdxy89+y1vllUY0lhmBGaJRs7xY3HA6Xm6s5b4jWIlPCdqp7?=
 =?us-ascii?Q?omdA0OWNwYppnTuQMC3kQ4QqyVE8EmUDtWF0OaoEXu/KvY4C5gpRMhKkC44U?=
 =?us-ascii?Q?FF2rW5rkJVL8PAtRah5yx8KWGVz/Il/llCGwkOv9UOq0PjuaM88elDumURHa?=
 =?us-ascii?Q?mA1OixTAEQ0KwxMbI21DM+LrFwAB5EOXYcpQkJwS+VFeALAzTfSmXYrZjYNi?=
 =?us-ascii?Q?4oWNID/Cynss3sARv6WK2A8ydrGj22GCktbuFIx+XQw9irgtLEVXb3eXb2hh?=
 =?us-ascii?Q?QWs+F5Ihj1+Aj7csp/d4/GeqWRyuKYvuECp7/GaW0W4HTDHndRmY83v+3sY2?=
 =?us-ascii?Q?ytGsGEroSkcUzm+FEg79qaXtpRTKpZgwNVTYRxxrM2Xzj1X6iPJ5ozWMStuM?=
 =?us-ascii?Q?VhmpiJhD7iikA/dDatohgvJgRpfWus5a0AZBIY5l/viBxiskOTBizfxlyy2C?=
 =?us-ascii?Q?kYsLdqDCHQHpouizfeg7f4U332XkwSqYa0KxA/yXm8Grn1x8CQ0vvpAlEItt?=
 =?us-ascii?Q?llkhjV7niVV1LgoSe88vvcwKnkHeLyNswaiJl8QWWF9p9NthRL3NphtCjWFS?=
 =?us-ascii?Q?QfEE/PXrxTTzFViuC5/7oFMGltZIR+7IdrszsRuB/fCXU9yMPWsxb8dgID/9?=
 =?us-ascii?Q?kBY4J9uF8U9EzOr/omiycgyzQHwyqFoNs8QdMSy/5/9s9YExYBVkHE2hU8Oc?=
 =?us-ascii?Q?PyRfJpod1B1gszHu6SrMvap6Mr2P7dfjpGSN62/ONbp73+hzb/wpefnh36fC?=
 =?us-ascii?Q?5IjpNpoizMj3cjr0Ky9wZTqpO9xk6YPsOps5N1+CBA7hrVK6n5bys5bt/YNE?=
 =?us-ascii?Q?xbsW2qNuJhh2tUaArLMU/5IB8Jpy+l9jorbh9GcAoS1nnKQaZ2Xg8Lm62x9o?=
 =?us-ascii?Q?3m94RxpszSdlWnyAb3dcr6QpI0sVVP14OR1TUWh7rCi4e+BluGPF3Yyig8G4?=
 =?us-ascii?Q?+/bztKBDBbqFsd9++c2JM662RjYICb5u6Mps5GpD7Kt1z7V9ArVDvYWA5L3p?=
 =?us-ascii?Q?tLPm/584KSetiQ4g68xPxnllTI4NhuX2U7ja2w8AI1nYH278YB6WzA8D6seG?=
 =?us-ascii?Q?4lvQ21Dsjsn4ceYL2w73P8JVJLtWXJpOOk4aoiDYqrTRZNvm1jgzASiIJLs4?=
 =?us-ascii?Q?WCcJ2bAaLzBwjpejR6Olcf56IbcwwdlgMBiwE9Vin6ga1WmjAbmmAejiIKEj?=
 =?us-ascii?Q?wXNhyZDIuLY1holYNjnqSItTPk/lVBPIANF9LP5pO5PaLs0gG3qj2Tiy8/Qj?=
 =?us-ascii?Q?zE2MJvDOH/FKoAcO1u/3KwxTVGlU0n9I2uxZ7GVojxGyNyS9jdDwGhhuRLm+?=
 =?us-ascii?Q?X/LGDEVW3orQYm3BSIo3hca0VZZziI0zEt8JVToaXUe7NcSrOat7UR1cVGAl?=
 =?us-ascii?Q?EVdpgXpKY4Y3lFYI/0uPEVW7ChaXCsWrkvQm2Ak5m1NUz5U4R7ZM2ekjsmut?=
 =?us-ascii?Q?rdDhLfkpm7+Cu4By5O5ktGrU5uec0g4d?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 19:05:47.5068
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1b004b5-9cc5-49dc-a20a-08dcd1cb944b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6848

Add support for AGX Orin Industrial Module with AGX Orin Developer Kit.

Signed-off-by: Dara Stotland <dstotland@nvidia.com>
---
 Documentation/devicetree/bindings/arm/tegra.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/tegra.yaml b/Documentation/devicetree/bindings/arm/tegra.yaml
index 8fb4923517d0..e108ef0cde86 100644
--- a/Documentation/devicetree/bindings/arm/tegra.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra.yaml
@@ -175,6 +175,11 @@ properties:
           - const: nvidia,p3737-0000+p3701-0000
           - const: nvidia,p3701-0000
           - const: nvidia,tegra234
+      - description: Jetson AGX Orin Developer Kit with Industrial Module
+        items:
+          - const: nvidia,p3737-0000+p3701-0008
+          - const: nvidia,p3701-0008
+          - const: nvidia,tegra234
       - description: NVIDIA IGX Orin Development Kit
         items:
           - const: nvidia,p3740-0002+p3701-0008
-- 
2.17.1

