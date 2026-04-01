Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010071.outbound.protection.outlook.com [52.101.56.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209F726299;
	Wed,  1 Apr 2026 21:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775079560; cv=fail; b=IBrd9VC+ebxZi93LKXREhCUfrRLkyRu0MevM9SeYJDVWSTOWyDtA3rW2Q3Bp2XmzBjtLHMLTdaLB7ed6gZ/JGDeu25YTNCn3BCYDp07gYqbEEulsLE+ZRmMutxbfs8BI7o5lWN2tHCvNlKIJB3vX3z0CwDzTvVTJiJhpKkBSn6U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775079560; c=relaxed/simple;
	bh=SJjOuMGWhLtrKgmfn1QwSQ0HGLzuM3Xb48ELf8y7w9c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jYmP0Fcp9EEG4A0JybxZYkdWDjpup+FRYBKchGyQ5PAKL7aDPQfiBJJy8oeL9AG1ORM7RmwHtlUox37Wu6HdRr6B81Vm6yCcEBs9MEkJEQ2ldef9TG/D+Ds8liNgjOV6aVuxI1Mz6X8qMWfW5If7eyMId0h+MYWLKfT3GwDUG/s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LYAbA0+W; arc=fail smtp.client-ip=52.101.56.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LYAbA0+W"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FvANxHx5vv2xFYUSyDgByvKgpjiFpGU6FsrSDk9662JMJyZ2TxyGKqrPzmSZFLn+GLjWf0LOWSN8rYMlh5VrdxLb+gqfB05Gh/0YfQgeLGoYoQVrCjxu/XwuD46r48OAwhGQOrXB96iwxAfFLiDt5LnxhsgLLHSGn5ey+m17vZFIaP5/rFKVlmQ+5OhM80vg+1aZaA26IvPfVwxkdn+72DFVNy4T9d7bQxVuxVCpm2VtMYCtdr/qwyOQiiJvw2nPamnamsDNRT/xtJyrlsRryxq5mgYbyIegQVqTL2XajVV5bHMiN+tcr2a1v7o2XAstdZdCWaGnZY1FJcA18xjweA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M8xJBKeAoYVF1cOfPe8LnDf0qRUemI4tCTu8vwVMgZM=;
 b=sh1ew28Gm28fwrrmchj+bSbM+h7E40YsHFurDGTsLF8F7bT8gW9n/lVKi9KJX1MmwqA3JtGx44NngNKOiKfdu7/VHX73wgDeZwM3WVIh0+pyzZDjHAVHdtyT0sog7FjZFvq/6SUBq9mVm5no7kGsKmO8uyGM9XDQqQcXdDL4/LQozPFg+70K83SInXJQ41BbcLmxz23HR2+jhM+3orWse5aNabBKDQPYAwQWLpnEBciyBATfRro+vex116jB3K7omjbtE0zFTAvdpweCm+dqFgy35E2kK3EXoWy4RZ6hxwJiM3H0N0b5yEYvtwLx1Oi0eyVkmRykL4zzjlH7aojMlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M8xJBKeAoYVF1cOfPe8LnDf0qRUemI4tCTu8vwVMgZM=;
 b=LYAbA0+WaQ/wP65ovYURULmY4W0p7i+hJtufaW/sYqFG/RVDsBkqBSTqM4aP2jy87v9t/mwUYqrKgURpc9KsHnvKHxBeFr29pWSFGhlq4WkODnzELaFeHTIZWNJk5erMFxTu2LRkLgj9xbNeHtQs4VwMYDIroflEJ9HHihc9rEo9vRNknhQ0Fa3FbKIdoxX5ORxbp62JXljzhGsbDnJyYWGKqwdHMQ5zjF205Vq+pDeIG9I0iEelbMJePHo5kJqMsXqTAtKZiYJo9Gi3XQ0fL56VHmByczTDrlPqLJ9XfWSba6QuuKImApb2qW6IedLtoMroP2y0OH8mDtw9t7k1+A==
Received: from SJ0PR03CA0079.namprd03.prod.outlook.com (2603:10b6:a03:331::24)
 by CH0PR12MB8530.namprd12.prod.outlook.com (2603:10b6:610:188::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 1 Apr
 2026 21:39:14 +0000
Received: from SJ5PEPF00000209.namprd05.prod.outlook.com
 (2603:10b6:a03:331:cafe::80) by SJ0PR03CA0079.outlook.office365.com
 (2603:10b6:a03:331::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.30 via Frontend Transport; Wed,
 1 Apr 2026 21:39:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ5PEPF00000209.mail.protection.outlook.com (10.167.244.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 1 Apr 2026 21:39:13 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 1 Apr
 2026 14:38:57 -0700
Received: from build-suneelg-jammy-20260204.internal (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 1 Apr 2026 14:38:56 -0700
From: Suneel Garapati <suneelg@nvidia.com>
To: <dipenp@nvidia.com>, <jonathanh@nvidia.com>, <thierry.reding@gmail.com>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <amhetre@nvidia.com>,
	<sheetal@nvidia.com>, <kkartik@nvidia.com>, <robh@kernel.org>,
	<pshete@nvidia.com>, <timestamp@list.linux.dev>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: Suneel Garapati <suneelg@nvidia.com>
Subject: [PATCH 1/3] dt-bindings: timestamp: Add Tegra264 support
Date: Wed, 1 Apr 2026 21:38:29 +0000
Message-ID: <20260401213831.187569-2-suneelg@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260401213831.187569-1-suneelg@nvidia.com>
References: <20260401213831.187569-1-suneelg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000209:EE_|CH0PR12MB8530:EE_
X-MS-Office365-Filtering-Correlation-Id: 5144c65b-2d2b-4e01-aada-08de90371e3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|376014|921020|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	9oXPE7YXGaDZ51bWg4rLtMV2n6pa0bFgL3/hvvQlx0R1cwoD9Lt5eXgFrf5ZmUSO99pXFLZHlhHNFEHjmjUyz8en74OgeCu/ql26ZdEFlVdRJmlKHRvcUIzvmEL+nYk5MrrSk2kI4Y44ncpvBsEPpw4ieVhRG+Z+2T7l0xQHa3SwvM3YKeoK8Rtrfl+KepXOxqmZwTd+P0mM+QHWwg872pIk0G09IdB7ig/aZ+MyHp/AhfYEmNpxxs0tPtZWtyANbfrTjobDpdbu2aPjrLnSXedn9+ovE7LwsEINaIrY12SUo8pFJ3HJUVvw+S2OWlpU+1Hyj7D+RODYbrph8v9HVGXThwKlIGOPX0a54pYugwdmQ6Se1NAdSHawV8dFoD5maKOtLM0cHR1njachFzwZNzeBFKJJpoipN0Sp8kN+3nQXDxtcOm907wI2ElFv2/MYMFaapv6hf4f8HsdhEIEmbLDXgzO/k/4ffgQpgqU0CmVapDaol28PscNu3pkYcEJBsArlw5Fnog3sxAteyEr+pXyfc0LLZD5j4PwENsmWyLJNVzksZ7SSa+xBYSmDy6DpJiViEoE1brxwfelxiLtKXimQkjBbaVEM99jx1wxSdbasY+DaErH3Kkoj2oqq9zdus0Y0qYMmIGVbLHCn4UUND73kbrKO0zmZdRM7YIm3fZaO9/nN/FUiQGehhGGIYBEzx59S0b38VADch7P+S76JB/EsDZ6JrVlZJ3mLaIzEFnrU3IbtVQn4Rs1ABYGYf7MVD+gjpb+9gAKYinLqW7ZP9TazOwG0fZHOuXcmx8c07UIjzv558N3hkRmPxLO3+Y93
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(921020)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	iTiAZkHNZxtcYD8yS3sDEoaFgnf0G3/D6iA+CrBtBIZxQS/8vOcmBWUOgiVBs5Ube9KPFAgLW1PbBMK8IeqDtE6KfJaP8MngwquXkt4QiSSoZML6POojFnhBgKomTL0ceazvr1c2JHwbn4B0T44rn1C9EsCvnGlEux3JlMGywoxUS2RJbm9pmcWV35Ob91T4dfA3NeYBUKwVqQH+a47uJT+iPymAjyEB+VKpJzSs/j+eXI4CAIU8pYQeiO5IO1N+OR5z4dUmCEzPN4idnh2HDK58RQKNZVefzMZDq57PJcaOUfs2gFwhKCucolu0krVx2QiH2Mp7rVwUN271QiTKrJ5WbmDNIV3pWTRanh5T6ve79g9Y77tDu5zZOAH3TX4UENx7iD6YXRRTiSuNSA0Yu7uxcQsLs6jH71nQdESFTALmfSO9OnHzS0OE2c1M3ycR
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 21:39:13.7414
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5144c65b-2d2b-4e01-aada-08de90371e3f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000209.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8530

Add timestamp provider support for the Tegra264 in devicetree
bindings. Tegra264 has two generic timestamping engines (GTE)
which are the always-on GTE (AON) and legacy interrupt
controller (LIC) GTE.

Signed-off-by: Suneel Garapati <suneelg@nvidia.com>
---
 .../devicetree/bindings/timestamp/nvidia,tegra194-hte.yaml     | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/timestamp/nvidia,tegra194-hte.yaml b/Documentation/devicetree/bindings/timestamp/nvidia,tegra194-hte.yaml
index 456797967adc..210200421a38 100644
--- a/Documentation/devicetree/bindings/timestamp/nvidia,tegra194-hte.yaml
+++ b/Documentation/devicetree/bindings/timestamp/nvidia,tegra194-hte.yaml
@@ -25,6 +25,8 @@ properties:
       - nvidia,tegra194-gte-lic
       - nvidia,tegra234-gte-aon
       - nvidia,tegra234-gte-lic
+      - nvidia,tegra264-gte-aon
+      - nvidia,tegra264-gte-lic
 
   reg:
     maxItems: 1
@@ -112,6 +114,7 @@ allOf:
           contains:
             enum:
               - nvidia,tegra234-gte-aon
+              - nvidia,tegra264-gte-aon
     then:
       required:
         - nvidia,gpio-controller
-- 
2.34.1

