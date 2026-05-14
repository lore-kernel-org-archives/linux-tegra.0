Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012015.outbound.protection.outlook.com [52.101.43.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FDD275B15;
	Thu, 14 May 2026 12:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778762972; cv=fail; b=pgrYaYaoWRITA4Cx1XUKwGZZt6B5uMu9CsiCqFEDsgyflmxLiESzZXh6HWGCYguYYJhtyR2uLg26Eji4pvFOpOWDrbXf3sLveaBlgqdkHYi/NQQBBtbC5t6bx7p77uWZRTDaRioFWRiBAfJjWx2xtvtu+Tko/adtWfA+/Z9OVhs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778762972; c=relaxed/simple;
	bh=JhRkZkE8Z8YHxDilOiP67Vf5mPF0CFnu4lrb3PUVUoo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=M4GwEV531yUlClXtUOR9HqCPCpXX+QQMFGN9vEUxE+km2kjppKTW6C+qeWsMumfV9R4PDtW4IQ+F3R3rBbhheLNu7nwikJu6hoG3sffSLMyk01qdnhozAHsKoZaAKKqxEfDgwbebxARoLSW7pNWCEVIN5J2T7aCI79XwzZIkN6U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ErI088QH; arc=fail smtp.client-ip=52.101.43.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ErI088QH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oda+6Tq9GKfjaHh+iVypNK0eN7gGJZ/VrO6F9NKpdYcEj+bo2lczafUf6AJUDko93OIw2Wk/g06Pz8jLUFuhEMeuoTdPi+Clkt1vXmOOkXORa5dhUuDB7BuSC/cfHuDGVsK34ssLjDpvgVjJeiz+36OWRjmdkbIX7fwt6vkE7z3f6hRw6efjTAQUbKy0rnD8JMDQVE2QjQpffCLOF1tPWnBUn0gEToqSMzkqvvhLzgt6fQxhsCblLEl7BQp1cl2mhF3ySbrTkM3CGxppUMyr/QiOn+hN/rKZk5NYxPtBw3g+M18WdJt965ISNs0fHHVFfySvDUNU1EgU5QXr+rtGKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cBocKMRX8wlQ7jC9uTwImEby4PEKo2tm139mqANRU5I=;
 b=j5E1EJAdxtDrXCZbNhZOPhd5dQ+s+dkR0+8e479bcPINeiBNBqi9Q8aTUWzPsfRfsS4IdUtBdCJSgMuPYQGjlgx0OM+QOHxlLixovB9vorB43nKAw7SsEHeRWc38K7v5KToKOAwc4LWRciQOk/oYtVNcZo5pkS9MqiCmKFX6s7/zuzS/lyNEc4uftUwikdxaK5l/bvQlwAnnIvI21gtITeYuZGYm970GhKalxQBjp/mhLsfUkNJRtza4TnUpjIsW8ROdWhoJgoQ+JXxIuOBZM5PQz3a7eKzVa8nl5UhmaDKBSHjFl39nkdCB9Oni5yQuRbSk9k2lqEOsV9wiBrf1Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cBocKMRX8wlQ7jC9uTwImEby4PEKo2tm139mqANRU5I=;
 b=ErI088QHxQpB6ci/4NkLLEE9vSlJggyn1IsQ/f/fyhOoZ9WVLrO2PHyXb5cE/fPMfmZUa+Foutwhu3VdnunWO1r2eSf/NsO8yYLlAdBgEIGBsGqTrDjjFmer018IkmZn7xF02dPTplEbqgzSgfOkP/5wzT+7vHCzbQ8d9aTrgKn1JUUW9FI+ui7TwmJx8NOcEuFeOXR6rVGUPWkUtdRGHUsmeqoJL9c0Zgd8yz49uxdf64CGPUc1EAT0oYMIJm4JmvTR1u9bLk3sHqW9G5sHHFaOrd/Me4O9ou6rfmJHLkJjQix5bj0kZOzS3EhxdR5G5cxbNIDJVOJrKc0cLE4zBg==
Received: from BYAPR02CA0003.namprd02.prod.outlook.com (2603:10b6:a02:ee::16)
 by MN2PR12MB4488.namprd12.prod.outlook.com (2603:10b6:208:24e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.18; Thu, 14 May
 2026 12:49:26 +0000
Received: from SJ5PEPF000001F4.namprd05.prod.outlook.com
 (2603:10b6:a02:ee:cafe::b0) by BYAPR02CA0003.outlook.office365.com
 (2603:10b6:a02:ee::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.19 via Frontend Transport; Thu, 14
 May 2026 12:49:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ5PEPF000001F4.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Thu, 14 May 2026 12:49:26 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 14 May
 2026 05:49:10 -0700
Received: from build-pshete-focal-20260330.internal (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Thu, 14 May 2026 05:49:09 -0700
From: Prathamesh Shete <pshete@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
CC: Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter
	<jonathanh@nvidia.com>, Prathamesh Shete <pshete@nvidia.com>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 1/2] dt-bindings: tegra: pmc: Add Tegra238 compatible
Date: Thu, 14 May 2026 12:48:55 +0000
Message-ID: <20260514124856.108606-1-pshete@nvidia.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F4:EE_|MN2PR12MB4488:EE_
X-MS-Office365-Filtering-Correlation-Id: 405c9015-7f3f-4c83-3d9b-08deb1b73b0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|56012099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	0CRKcN89oYlREZlt/uE6A2j8BU2GVUM6xZmKohfOkJsSA5lsaUVNDzBK081tmvcsbRlhkElzh0tnVxRt9kU4KlfTnMaru7S8Wl/DhwqqsGtTn2wZtSTPqjSV23kcRG+AmCVmvZVrJRJdclJUXLh2mXLsnrJOpvi42rEP4w3aTzWLsV6FD5a6EmTv4t5xwpN51Fw/juycMtoz0SfTcTS9LmKbABSn08A/uj89oBSXLhPWS8jpvEMBGilwgxEsKIhsT8IKxnvb8VQ2KlhFZ9GkJCHlXU2gr0ZSLJOtZPSjKZ8Wnf/WAdxol1brbBoiHtXBtrAcszk5nVFuAMUjTmgoVzhxQKskHhljNYyLidIkgUdolRvUrxdLbm+rTJcc3AA9+3v++ldcKG2iKQ3kEZEhG1iLZvBbnP5BKNQRqhAOD+R1PddydIr3naa0UnTyJJtMxG9cpz9ftgh+p7a2XALCLz8Xa6We/tqyvZEfGvLPCKPab2yfg7k8D8De9pzehjFVqNuSu8FfekxiH9t6hy7GR5dVrWcqetZBiKM0LThhUp8Kvy+lR2+KNAW8XjLEfT/CLjAwlZTkOfoQqj5dXdHBHccTjSVmUEZJlmGsbVKbpo9JYBeD1B8mMnkNCWp0jgUqjhrtJto41GGLnW2LoLA10DjEHecW31ZnGeGlnDKOcybyaI5Qcxyoo3JujCQHPy2wt01oZdqcsBaoTjggWNh1ZHb9wtrgBihhjUJWDBpqPSk=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(56012099003)(18002099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	V6X7Q6OIS9PohLx9NdyfAbRhCgig/JI1ZNy96Y9sGiUosdg6z0t4SeEM7o77RD2/KzgWis+3eORCCN13nOJUzr7gZMIg/g3iLgcyrojmF7NnksNKIjtMWxwkTnr9MDRcNgrVikwp7b+LaRvqWnYyZb+DcfRkhQxCsts8VKmSFXEgxiTff2uR2Q3zixgCJhEPslM4IN5U9nJEOoYIM/z5olOxGFr0XkqSxKrYdKflWsi2wtJ/kfLZhNJxoLtyC4wX93Oy+z8yRA5JkNHpS2H3MoTC7BfRhmD9fju2iP49ExZyjz4P3nS1dil5vW9qsHmjwALsO2y9YpN5AJuk/B05YesNimrA1awHCOee4hlUXgHR/MPJtqfhu6eEnKzGo+sZwjfX6n7NcpLtWxiPPfH0B+nFhIs2tTFZIf5OU8DvqjL6ggTdhIKNUyFQJSIfBlLX
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 12:49:26.0861
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 405c9015-7f3f-4c83-3d9b-08deb1b73b0e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4488

The PMC found on Tegra238 is similar to the version in earlier chips but
some of the register offsets and bitfields differ, so add a specific
compatible string for this new variant.

Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
---
 .../devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.yaml      | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.yaml b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.yaml
index dcd1c5376507..dd1f637e4175 100644
--- a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.yaml
@@ -16,6 +16,7 @@ properties:
       - nvidia,tegra186-pmc
       - nvidia,tegra194-pmc
       - nvidia,tegra234-pmc
+      - nvidia,tegra238-pmc
       - nvidia,tegra264-pmc
 
   reg:
@@ -76,6 +77,7 @@ allOf:
           contains:
             enum:
               - nvidia,tegra234-pmc
+              - nvidia,tegra238-pmc
               - nvidia,tegra264-pmc
     then:
       properties:
-- 
2.25.1

