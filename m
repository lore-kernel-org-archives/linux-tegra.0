Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.62.64
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795151028;
	b=AVUqDOnUWWLyE1Nuz7hp5ZaH1TmKs/xfuliPKs9nOH5/LdKYxncctVC9scTpMdAHKAQF
	 4Sr0nzP75FYvwN78Jd9NTXKNh+ATNfCfhPrdSEuxmkZOhI7nsnlFu4X1Wy/IlgsrLnmCN
	 ZoQX4Gz7jIiX2n32uVeR+nVEnezJa9bEJn03T3BawiSWswXEDdvd8DXnwJVO0UezVQ8Rv
	 hONHEdxjbRqBieczGwFkAg7H2jEYqa2AsfQIZhvwz9xWE68Wy61FRDdFWRIdBF4FBDMpb
	 Opth0bsyLr0dPFVoM1qHATKXNJRHEh9pwp7zYTB7BEXdF79moXm+a2AZufZyuHrC4kQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795151028;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-NV-OnPremToCloud:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=XSJhTvUKMv6Bv9OmY//dlxIAoy8KWHDvwmRokejR3hs=;
	b=LatkpsC/vsqhEcazqjUAwPn/ucZnx1RSQu4AMf0ZOBQM3Q5NTT8pE9HaKdWwsw1U6sn5
	 1l0/Zlnw4EqKtVPo0VPY1i800tKPG5ZZrlktOyF+1pxBQ4f8l++kULvv9vradftYRcy8V
	 D6uZepwRYR67gCjT3y5puH7+CnvbiuKE/McTcSWcFy5FEzZlqcGNqKscaw2Q064IBbl0l
	 f+BPB+Kzy29DndbQdFtWWI4rkc0/X/4nrv1/2ixSTaZSVJxj1tXVykcUcxfd/PIA5G+9b
	 4xwfZDA6YaVhRydDAlLjoTXE07WE/aZ7aJ/yQ72dwpwMffnbCo3ulNdKMF8cRe/Wx+A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=HggIu0OD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.62.64
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011064.outbound.protection.outlook.com [52.101.62.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48DF6606A325;
	Fri, 20 Nov 2026 05:03:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48DF6606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=HggIu0OD
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TSYNKyKVxiYacDILC4mio815vLGftQXsUaNDsMLVssr7r1KN+7JC37nCIpFBoXxeK1am2dZwrx+P/dRgIEL5mNTkDCr/XTGonfYW1rV+OPZK5J2ruyN3+V3fGjLJjGI/BqLoUwEs0dgw/Er5xxkEqXZLI6Zgdv84XqV/+h4iShSexrISfSrqJ3+x3cRRSzKaBtZmmRcUHvpWUgDqhhWZCaYDwsfSENLq1LP6vRPVJKdyEE/cVrhuXmQjypRuARxS982IEikmRwSux8Cy+gAgF5HwcVu176UDZZoJXqCCC/5FCGPQ3gJWyI+GZgrOQzBsJndP0ffd9mnKrnNEx0KZRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XSJhTvUKMv6Bv9OmY//dlxIAoy8KWHDvwmRokejR3hs=;
 b=fsKhc5UY7wwypqlqM9OuJHWo9m73+D0ZdnG5aK0MQWdx0a1tnF7DcknCx+iUxI2nQVOpxpWsqaqd65skwqWPZndZpbyOcwZyetapIpFm9jN5PtLr9SaXVskgWItg6IFrzcfm9HMPOGPI87+Ith92mxAIhP8+TdFDAlPSTUBCG01dYrqCh2KQIw2/aLI/5axu3NIPVxvBTy4/a8RkkLjI3rN3WIjbzaqZbGsyxSC3DMxeRNSecoGD2FZChVkxonpYoGDw9458X36rwBs41mgFcwEl/SNCJnrPps44W9C5u1mAUcz0m6mNGI+wG8z+u3RchhbYDUi9neH6pxgX2OUUdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XSJhTvUKMv6Bv9OmY//dlxIAoy8KWHDvwmRokejR3hs=;
 b=HggIu0OD2J6qK8FU4B/ynQmkK8mWmDscY4W6RLz2MO6avbPYIDJQSI47gjN4smVJXf+RA26CVmBsmeMyzVFAzioBZX5jqSLkbVOJdbRfqK5GwgYUX86RbREkoamivOlzFzl16IhfYFCiGxyuuj8joNG01QW2W/i3b/XbamAIc10F+M2LxpaKxeupR8p7w0LXMJBM36/gaJA1wL7jlFjyVxd0lCueJeopBr448yRCkK3lUCWW8W0fLUYlxoKnE4I1gRBJ8yL3+d/cvsf4XoO6asCkZ+UmjMRfrtKrBbri5X75IdrSIp7jFt+L+S7KxSUQpl4C9BjG7vvmL6gJ5TF5bQ==
Received: from MW4PR03CA0172.namprd03.prod.outlook.com (2603:10b6:303:8d::27)
 by LV0PR12MB655752.namprd12.prod.outlook.com (2603:10b6:408:60e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Fri, 20 Nov
 2026 05:03:22 +0000
Received: from MW3PEPF00001653.namprd21.prod.outlook.com
 (2603:10b6:303:8d:cafe::43) by MW4PR03CA0172.outlook.office365.com
 (2603:10b6:303:8d::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.12 via Frontend Transport; Fri,
 20 Nov 2026 05:03:22 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MW3PEPF00001653.mail.protection.outlook.com (10.167.249.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.2 via Frontend Transport; Fri, 20 Nov 2026 05:03:22 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 21:03:03 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 21:03:03 -0800
Received: from build-sheetal-noble-20261014.internal (10.127.8.14) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.57 via
 Frontend Transport; Thu, 19 Nov 2026 21:03:02 -0800
From: Sheetal <sheetal@nvidia.com>
To: <vkoul@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>
CC: <Frank.Li@kernel.org>, <ldewangan@nvidia.com>, <jonathanh@nvidia.com>,
	<thierry.reding@kernel.org>, <mkumard@nvidia.com>, <spujar@nvidia.com>,
	<dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<sheetal@nvidia.com>, Anupama Kunkulagunta <akunkulagunt@nvidia.com>, "Frank
 Li" <Frank.Li@nxp.com>
Subject: [PATCH v2 1/3] dt-bindings: dma: nvidia,tegra210-adma: Add Tegra268 support
Date: Fri, 20 Nov 2026 05:02:52 +0000
Message-ID: <20261120050254.1343679-2-sheetal@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120050254.1343679-1-sheetal@nvidia.com>
References: <20261120050254.1343679-1-sheetal@nvidia.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PEPF00001653:EE_|LV0PR12MB655752:EE_
X-MS-Office365-Filtering-Correlation-Id: c87d0076-62f6-4e82-9e62-08df46c399c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|36860700016|1800799024|82310400026|261022105027099003|10067099003|11063799006|56012099006|261009223027099003|261021121427099003|261102123227099003|261028144727099003|261026140227099003|261026121527099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	V1SyKxbqm6rXgnZyOM4dFmGyP7RZ7rGQ/A87Sd8fSqWoCxrm1zvyGtE5fNDnjEJbM9GOjDmurbWj4rDIdND7SFb/57iO8lMq9RWqFd2LZWNL9NUH/q5pcq7MyNAwY0K69FsrHqMWCDT59MQ5IPW6NlYUAVt9fwl7enYPVMzCtJ17D8GNpfM33lwT2Lpde384GqxRdnmML6JoqiLEzUbzE9mbkvqGOs4zz9uGmsv19LwY1Mfl78TX9ky+quSfKcsfSajAg4BxJorVg7Z75OfCIkZtLmX8LL02uivdLOKx/thhzIUZ447x8jwjkJMCFI58+ObquWZ+wIhkEF3Gm7Gllj44ZBPoBfnqEydqhhKlsJK2LrDCtDBFpmr6M+R0Z2yc/gQbSMcmOjdwquCRK9t1Gta/3pJkZ1Mtdzm8yrk7t5zmgRo4h8fyBY14Y9G15xa80geLVy2RFFFTitkos+tLXJMWo8z2NmuJx4cfosJfy08ge8uSuWFYNnUBvtjXmP3pgj7VuwHBCiIQXKNo1aa9p8BPX6HUQ1Ru59G82je20qPRd5ogBwKaAO/Dz/CBHNbt4Y/vJGU0VhMCwbzX9784SxdQY/aNHEaJU1e2PbZbIJK5Fh/gW2bsCQSwfEEMlhLtDr/pwdQobl0DBkJF3LNYxv4ZaGwtBdMWl0AoCdLoTP5KpHOIv+ER2KrvA32hFw8AFsJVYptCRKBOUtuGzozW2Q==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(36860700016)(1800799024)(82310400026)(261022105027099003)(10067099003)(11063799006)(56012099006)(261009223027099003)(261021121427099003)(261102123227099003)(261028144727099003)(261026140227099003)(261026121527099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	U7KTpq0EnrbuUExmcGn4SqtCgEwPe8MLOWdsXAgpdYvg2KuJ8vd4uMIlJyT9PdRgtEUin/1E6o8x+OfS0kHdFaTbqYD/S0fspwrqx0dN/z5MIGFhpa/KwBxssEs65mYBFsHX44rca1J5QVMjesgsa5Y8sULTyB30ZTd9AABckrEvNZmJfBRNpvA4zo7ETbOPCTR+vqUPOjC8+sntGuckgUnqp2py6Zn4NozwTDLQHG900Kaf0J+QhrNZJDMU5WqVKtqtVOGVcMIoK65bTUL0TriJ8YzC5eVRjYiWerg0kl1+8/8ejKdmN1hX0HukWufnpS0jIosxCZl5KG3ITpDwtGdipXrzDqajprtvLRm2j/97B+5Xz/kyW1EwiJWho8HK7wn78pdeJMtNePGexNwU+Cmid3PAiU8PAxcY01gjoBtwFz99R0UWBEIKhOGBTLFL
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 05:03:22.1269
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c87d0076-62f6-4e82-9e62-08df46c399c5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MW3PEPF00001653.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR12MB655752

From: Anupama Kunkulagunta <akunkulagunt@nvidia.com>

Add the Tegra268 ADMA compatible. Tegra268 has 10 ADMA channels,
so set the interrupt limit accordingly.

Signed-off-by: Anupama Kunkulagunta <akunkulagunt@nvidia.com>
Signed-off-by: Sheetal <sheetal@nvidia.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/dma/nvidia,tegra210-adma.yaml          | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/nvidia,tegra210-adma.yaml b/Documentation/devicetree/bindings/dma/nvidia,tegra210-adma.yaml
index 269a1f7ebdbb..6aa9b83b90d9 100644
--- a/Documentation/devicetree/bindings/dma/nvidia,tegra210-adma.yaml
+++ b/Documentation/devicetree/bindings/dma/nvidia,tegra210-adma.yaml
@@ -20,6 +20,7 @@ properties:
           - nvidia,tegra210-adma
           - nvidia,tegra186-adma
           - nvidia,tegra264-adma
+          - nvidia,tegra268-adma
       - items:
           - enum:
               - nvidia,tegra234-adma
@@ -100,6 +101,17 @@ allOf:
         interrupts:
           maxItems: 32
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra268-adma
+    then:
+      properties:
+        interrupts:
+          maxItems: 10
+
   - if:
       properties:
         compatible:
@@ -107,6 +119,7 @@ allOf:
             enum:
               - nvidia,tegra186-adma
               - nvidia,tegra264-adma
+              - nvidia,tegra268-adma
     then:
       anyOf:
         - properties:
