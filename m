Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013040.outbound.protection.outlook.com [40.107.201.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D5D4B3364;
	Thu, 17 Sep 2026 09:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789636599; cv=fail; b=O/NCOx7VrxCokvF0D0n8/tjws0upqgftfVqT5wAkmIBti10KnoCyLWmqZkUidMUKe60rK6d+CrvvBi7fPwAzpexseJcb85ax7P4btToS3/wH4/I6YNUPUhPaQLFV7Eb/hvFTw6stpeXjaz72ExFOLStPLJjqKK2EFxRviZHjK7M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789636599; c=relaxed/simple;
	bh=Hzy0T3N1eOjZpwWjvyKWprWj0kk+w/xlQ+/6BaUzNNE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=FCYbhWzePwlpWbx/WaE2TITZRW4pundCA8fYYTahWihREhufOWiVUiA5YGmHjMnHT3gzypTQw75i0xgBf9dImErJRMVgRuFZwTlwmEh3ON+TOgCM1RWKFeQVzTGepo8dhEMHhCoLZH98APC58KimemWOM4Ln8lJ0A6UtsABbSv0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=TBdHsG6D; arc=fail smtp.client-ip=40.107.201.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="TBdHsG6D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PuIxpCYN2xWoauFJM/kI1A9uWYsGsLb0yox8A8KaL+IK25uJqydM1IUUcy71q3FnJ95qv3kD77MTWzSJ0H0oY9aY+OR89eJ56CSJr5ooY4oCui7jgn+BP6tauDimeUSNFd7Js+Udz7KW2rx/W1y1/7vUAG7NS3REon/8+L0iEBgckxKibZnzMEahexjgeE5sEcngzOD9Ov/9TOcxQ2gJWPfQs3YFTBbZlr8l4BG90puI2WfxOcFQp6RIfR1pmNd3dmXrnlvee/TmH6/iAjNxcqUGdr/lUV04UALK61MQrFJCvK9RB70xU+C7iKWW9fhf4jgE429zDfuVNadDzXvAQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zSMJyVALTaqELMyp8nIi2wlCFaGAb49PB5twQxFOKSM=;
 b=R3UE9nVBS1bNRSSQQIAMV/JGboz1JwKBdcM+YxS8qkc7VcrXtMFsIdgRPO9NuAPwi02OZv5qbigb62Ri7r3JRLHyBVCIVyL0sVfBy84SYGYNDYkrxAhXg4GHtFA9Fp+N1VdCHHFFkWxZsKtNh6cP/xgdqLL7XuD/8FANADg1webAuBveZjgfDFfPPLA1gd0dtKkKy7yG/GBpJuF4XTWDU38PF/aEBa7aDX1qBZ9J4ujxzmVDEwDQWsbWoC/WlJ/jzSBbhilg8DDOktwZNSJd9RgrsRr3gs3DenoCxI4eAL7WwqHVxuPnTpMm7UIj1RMghPdoPzXlcPdixwpsyMs38A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zSMJyVALTaqELMyp8nIi2wlCFaGAb49PB5twQxFOKSM=;
 b=TBdHsG6D02Q7uVNHj6ZXTAoB+uLrjuhE39JmJIxo1gefgSeW1B27GD3wGuejG/9wbPc3ojYrUFGyLSEW3aMtLCQzDacuuOkkRPauAAgK23OGCnG40PNNUB2/9sVKqi82p41v87fIy7kVpokbIqN02iptCSyntRZ8AfJaFTS44Hf76aCAopUGwqXWMEByyuUPQ7OINjQxpNJ8znciuPvxx2PVOSlSsvCfM5Mi0fhy9C01R2rF31t6wn6DlP1BmSHDejq7qeBvhF4clO62G3nXTWqXzWOTCFoCAdcGmt2V0xAKnv3DHi5uPq25ikiAOEc4aDIqXJQH/ou+vS0ehIlwqg==
Received: from YQZPR01CA0019.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:85::18)
 by DS2PR12MB432622.namprd12.prod.outlook.com (2603:10b6:8:70b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.12; Thu, 17 Sep
 2026 09:16:34 +0000
Received: from BN2PEPF0000A992.namprd04.prod.outlook.com
 (2603:10b6:c01:85:cafe::87) by YQZPR01CA0019.outlook.office365.com
 (2603:10b6:c01:85::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.12 via Frontend Transport; Thu,
 17 Sep 2026 09:16:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF0000A992.mail.protection.outlook.com (10.167.248.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Thu, 17 Sep 2026 09:16:33 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 17 Sep
 2026 02:16:11 -0700
Received: from [127.0.1.1] (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 17 Sep
 2026 02:16:08 -0700
From: Jon Hunter <jonathanh@nvidia.com>
Date: Thu, 17 Sep 2026 10:16:01 +0100
Subject: [PATCH v2 1/3] dt-bindings: fuse: Document compatible string for
 Tegra264 FUSE
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260917-tegra-tegra264-fuse-v2-1-4936068c2168@nvidia.com>
References: <20260917-tegra-tegra264-fuse-v2-0-4936068c2168@nvidia.com>
In-Reply-To: <20260917-tegra-tegra264-fuse-v2-0-4936068c2168@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding
	<thierry.reding@kernel.org>
CC: Thierry Reding <thierry.reding@gmail.com>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Jon Hunter
	<jonathanh@nvidia.com>, Thierry Reding <treding@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A992:EE_|DS2PR12MB432622:EE_
X-MS-Office365-Filtering-Correlation-Id: 3096a60b-7d78-48d1-8b47-08df149c5e3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|23010399003|82310400026|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	l3vTVzg8+M+IuSpxb4jVdbVlzfV8cII5ywMVGSQIzC3rUr53NsOxZw+klbO5ELi4Ny67MJwAjfXRnJs1yhtdnDBODtvf4I0nFa2QLjcraSLUW0VHOo0vz2uqu4ZK1vlKxLkSCFiELHJChz6h9PHOEVuE0xbziGlA7QTtSucQcpO9UiDLYqAlp2yn9S0DYSKskY5bVLT4i03e+U1zwpUSxEoDAO/+WC/4AeldWKPDYYmQq/Uapcs/yjHExhCK1xr73j2EDKBkVbro4zLIzvbZae6yWfSHs5T2ueIvZnBVBjbo1G9m2K6DYfv7tHc0Lqc4VmGV/9itZua1usGVKAFHHTzkWJdOZ+BaX3eVjXx4ezPED6vwmZCBC5zGvHg9T5rwRtDHJYDAG0sE3FOgsWY4YBRH4Ern3RcbFJHD0xKMQOPKx/PpzWoC7y8xzHWU0PpvB+GUAeFX2D75Ob0NTfQs5vTRc7pRfSeEE7ofYIZSI68FtIMqo85yNTqgimIGRMNh5tWqH3gKcyviCsSPZ3NVNrLB5a1rSaVmVgeHkN4aCOTJIQFil9QFTqIzT0dyzlBs7ZdcuvAT+ss53ptjRgSoWN1Fi1yiDx9FionXlLnd44EwWmFAoYvKOsLzd99dlCRGh7Azdja3PsAJ4KNq2WR+wa45V3JpnSTqhbkyBA7pIeODNEUmAOrneZ0aPh0vbh8DbS4MkLmwuEPJpOy2de/0Iw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(23010399003)(82310400026)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	uTGyNHT+Y1wiL3IJLV0I/x5Xrp5hN5sB3oUqxjR3PQRgM5hDQH8xGuwTNbJwsnHq9icvYIcHOGSt06Asno2ORs02xXOHWYq1uFv7P5Qkd+egWghDIVs9W9mjsNMDQfRiAeC+rxV6/bjwG8JN9EttO+6YEyW1IAO+gGruVLXD1bLixHhEC9l35K7wJ9Gx1lrLPB6zqlQMCw/1PeWJZnoni72sIH/VegZApP11p/Ch3R4XY1YRsM5bBcl1GgQ/v1CITk1St/6Z46EGw94pLCQEjuqtsXqEfx2t2a5FRRb0qzux/LuKEaE9JWgdJdZQI1PM/fGx+lAKlFGqVeyE6fpe5Hwu14Qjv6dpif9PV4PCKWt+im5Jhi8TFQwx15zDG7utVjadcM358YAXkqCIWQ2KkBpZ1E3IriOJqB1EvQC2YTHQsnzLi4QK9wYl5EXle1Mw
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 09:16:33.6056
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3096a60b-7d78-48d1-8b47-08df149c5e3a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000A992.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB432622

From: Thierry Reding <treding@nvidia.com>

Add the compatible string for the fuse device on Tegra264. This hardware
block is mostly the same as the one found on earlier generations,
however, the exact register regions that can be accessed differ.

Signed-off-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 Documentation/devicetree/bindings/fuse/nvidia,tegra20-fuse.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/fuse/nvidia,tegra20-fuse.yaml b/Documentation/devicetree/bindings/fuse/nvidia,tegra20-fuse.yaml
index 02f0b04623776d2fa60d71c442722d37be015910..bf9923b638527984d27c99b90972487bae05b202 100644
--- a/Documentation/devicetree/bindings/fuse/nvidia,tegra20-fuse.yaml
+++ b/Documentation/devicetree/bindings/fuse/nvidia,tegra20-fuse.yaml
@@ -22,6 +22,7 @@ properties:
           - nvidia,tegra186-efuse
           - nvidia,tegra194-efuse
           - nvidia,tegra234-efuse
+          - nvidia,tegra264-efuse
 
       - items:
           - const: nvidia,tegra132-efuse

-- 
2.43.0

