Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012050.outbound.protection.outlook.com [40.107.209.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65DCD382F36;
	Wed, 25 Mar 2026 21:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774474049; cv=fail; b=lyuyGC5ywGbqGq09ROegWDtNK68XikM76uYdczQ+kO/4v5RHpaUl/OF0NrKOd1GSHRspTqwxhSpu0jmiV8rYqVCyjZAdHDX6pPBuLakK8GECfViCoDA+NV0ftob3mulcQltyG2RoJ/V+7PMSi7GSHcoSAshO3xvHbPfobttNggI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774474049; c=relaxed/simple;
	bh=y83/otcrfO2zhI6xLFC0nQcq1Rf9+qwKavRQVcFX+1Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J2TvEeKJ2sQ1/oy1873K8/eAJX6Eddfv00gLukHHJFELx5UXm/a7OY1PiTKSHXrnaudAkupk7TAlVRI/oOG7UTlSxkkJ3SUXw0dKVwv4Ul22wecAmjudrq6ddmUydbgGsOMbHrdfIZBd6WkcCnbvMnCpKcG2FNe3OrLJ+JGCKAE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ZZcHpgvW; arc=fail smtp.client-ip=40.107.209.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZZcHpgvW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uK1cQWiTPiOpooyfSs8uSbhcJ4+5fydM6n2YoNpM+os9dexMG5PVD61Jgq2uYlNH7ruq0dsovyOdwBg4PEnR1XShacbzGr8Pu/YFUA5ie8VkICduGvx3QXJKQCCYS/5bCO/cOhlu2Bv/Y1wxxr8aYFlb8ck/XBhXiVdU9h2/2MaDrqt40M04ZbDpy7SuQhhuUtMbD2/uY1819G1yphiXeLWAeNp6VwEoWfJC2evJmAnUZl/3DQLEzy/eeklq3W2ytXLajCNSEMTYT0I5Th/4qWeUUkdZP5RKQOIvtZQmZNhlPmsgXnaLR123IBvMiT5KVNPPIyCTvkhdPBUE3LLrDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AL++0AwLqWsd83Rt2nYRpph93x9c9nXyuYma+WcdZQY=;
 b=cnv1D+Jq2nNKqraswknE1mCPp5DhwFqD4nyB4m2kaB+ZM5I2nlbntKUZOaGzgqIQKWrEv9DYksGDZU55dE3fo6QX453PPDHghz3U0zpmymPM9qiRgQxTYZ3ikaelg4GaK4kvMh4z3TsIZAKLouhyFjktPwvlRtTF1DidG2L2Gd83fnzjLrgo8SrbjuyLvMGjtYnqG6ks3jTD9/FVIr2GFwGSBnaN8PRTOHx5ftd7R3uEhr7OywJrRG0W0LWVN8PYe7e1iA9sZYKDtToPSw/1mFtqpgkZHqfcP8/eFnMBWuuNGk13Hl86q1Xm7a2C0tA02bWTveN2PiM2D7K7o+RdfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AL++0AwLqWsd83Rt2nYRpph93x9c9nXyuYma+WcdZQY=;
 b=ZZcHpgvWtuY3LKlfzYzBc5o2RkyOg/Nt2RMhS/lkgqXfELqNyrgT9OGLJUtkJIWeA1a8lOWh5aAWWG+Zy0sYPBJJgIc/VtWMgW0vOi9z+ICTSAbtleO2bvsODwfVTrYRTVG8R7oqGJTODU23o4RD+eEhoH2uYRJIeHdw21huXyzZZkP8hGRTf/soW7DX5fCYeJzaTxWAiJu11bXffRCpF9xG2FcLBFW8MDhUnKvj73RXi/8Z8j3CEs5lVkH91jzIocdWJnIWcQgwUe9gLF87EM1cwaWJalDV3p/1zBbYFziRmyjA0gr4I5MmcKqPw8fmTWBnzq2IqvtaHPWc4019ag==
Received: from CH2PR19CA0006.namprd19.prod.outlook.com (2603:10b6:610:4d::16)
 by MW9PR12MB999208.namprd12.prod.outlook.com (2603:10b6:303:301::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.7; Wed, 25 Mar
 2026 21:27:23 +0000
Received: from CH1PEPF0000AD82.namprd04.prod.outlook.com
 (2603:10b6:610:4d:cafe::19) by CH2PR19CA0006.outlook.office365.com
 (2603:10b6:610:4d::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.33 via Frontend Transport; Wed,
 25 Mar 2026 21:27:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH1PEPF0000AD82.mail.protection.outlook.com (10.167.244.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Wed, 25 Mar 2026 21:27:23 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Mar
 2026 14:27:04 -0700
Received: from build-chunn-noble-20251215.internal (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 25 Mar 2026 14:27:03 -0700
From: Chun Ng <chunn@nvidia.com>
To: <linux-tegra@vger.kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <chunn@nvidia.com>,
	<ankitag@nvidia.com>
Subject: [PATCH 3/4] dt-bindings: mailbox: tegra186-hsp: allow doorbell+shared or shared-only
Date: Wed, 25 Mar 2026 21:26:27 +0000
Message-ID: <20260325212628.1234082-4-chunn@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260325212628.1234082-1-chunn@nvidia.com>
References: <20260325212628.1234082-1-chunn@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD82:EE_|MW9PR12MB999208:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b6f90df-bd38-4095-0438-08de8ab54ddc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|42112799006|82310400026|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	A/LGSZBlraSWuxCP6YM3n3oK5v2xUnpK5Ax9/2EqnwjIaXsrsh4WjN5W4jBMWe2JR78PaLXvrWzEvFJ0j4P52A+tNBCHAKBRTvKxEfqjeesBfIbneVuPjnbMdhrZO10JciSKDzxduV0dZUYNQNUSpL0zjBUun8c6OmTJh/CAB3HT0pMeVZ8+sbYg/5DLxtUVV/GYi5cxhCPQoNFyg1Kr9QjY0t4U1R+zyZ4JNONl+jkjqzzCgw2GBeIPlqeCdR8Qgy1GxZjKC3z+Gz5peL9GzCHi4x+yteuYH+/kYA0kcT8w9v6iHYT7l0Ej+7pPbAlf7qY0sWyHnV9ZCQd1ohoiJm32SaNFKP/Kf68Nwnt+c4WlYXA2Phk3akkDw+NamvIPnNrRSTl6ewItJxN8DVooHoaxOe6iYLXuHqnq5z4fiE1S7I0z4u4jdCcgqnNEweuuVlwaRnJlx9gW2ERqyDAj1iHUGmAGR3hYuYMpZqHGmjOM3YJH2wwAerS0aZpi/SyoSn2ZXdbyNHDk825qZgq94Z0c69/b2JNviyyHXQWeniQx0jNm4PMzV8EIZzVV6ehq9mPYaJhtnGj8ttz0MNOiHgSe6b2roZjCB4n2bEwXTYTqA4talapWHOokpOo5XPJaUDumAyFQp5/KgnvteRwtG7EXJvJdx5cGthGjwrYy4r9o6D5HR14nY0NGAIHLTc3t2gNqxe5G0MjzT/T/4yGZKMlIveIsb+v2P60CGaxxkhuGvt31a0SCVPrywvK23n2rcNjBY61Sh2T3FXnkqYd58g==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(42112799006)(82310400026)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2eTWzLYrF9gSkWSlLKMRXqAB/r0PASddm8Z176CcTbju+Q3f5Wq2xEovRpJr+IAH78/p6SSZq7F4k5/FiMF7oUQPiGVdb8dPIwSTiIhEo4/H9PLmlvWGTySixxGeHa6R7CrfOw4OlCZnIBqrwbnaZny0iTub7iAj0TDV0YMiQp3L6a/w9JzrSoxHRL4I2PEzUA6I+CJp3bdKjP2yDhypTc+RV2UMiKweikJCAiP58C7d2NCORk/yW82BBB+irweVARfVhhjkqap/nml5iGVMLHvsW3Fk+TB6fQwAI+8AMmr1d8WUCOZ8eziqznpZkufdVPDnF5eP3Y3UsUoBSLx33ia1nIAVbvlN3qHD5QgNKJYswjoOCFdf/TI41EGzRu9yF9oZAh4lX6fH4+O9ynsmb7Jw7sB7683GzHOJ8IvrCL0OgKEBjIdawgyNl8kxCrVi
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 21:27:23.1390
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b6f90df-bd38-4095-0438-08de8ab54ddc
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD82.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW9PR12MB999208

On Tegra238, hsp_top0 mailbox has doorbell plus shared0, while hsp_top1
and aon_hsp mailboxes expose only a single shared interrupt (shared0 and
shared1 respectively) with no doorbell.

Update the schema to support Tegra238 by adding an extra oneOf options for:
- doorbell with one shared interrupt (shared0..shared15)
- single shared interrupt only (no doorbell)

Signed-off-by: Chun Ng <chunn@nvidia.com>
---
 .../devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml   | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml b/Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml
index f833b845de0d..274480a04c70 100644
--- a/Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml
+++ b/Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml
@@ -82,6 +82,13 @@ properties:
       - items:
           - const: doorbell
 
+      - items:
+          - const: doorbell
+          - pattern: "^shared([0-9]|1[0-5])$"
+
+      - items:
+          - pattern: "^shared([0-9]|1[0-5])$"
+
       - items:
           - const: doorbell
           - pattern: "^shared([0-9]|1[0-5])$"
-- 
2.43.0

