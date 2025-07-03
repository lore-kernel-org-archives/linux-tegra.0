Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2067.outbound.protection.outlook.com [40.107.220.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1C724B26;
	Thu,  3 Jul 2025 10:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751539134; cv=fail; b=WZtXrubPoAEzZGaSVOdQs74cRYUR0sKQNPTrkAI5JBP+HlVh7PssZA6SfovdNcDdlQFDoTLyplUFez+W1ubEUiUt9RXL3iKFfu3p0F5NNg3t60nuV7dm1JVJK4svDsDYtdk8OimIpU8MXkmxcjlV/OVXm7rmNWyyY/17G3uBJJg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751539134; c=relaxed/simple;
	bh=bOXaV8lSkG3yms72/8MB2m2y66XqKPi8A/Ur5uHSnxA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PdkHx70BrKQ2+O1TLJX52PLpk84goBU2uCSU1fiKeQ+/38HyTv8F82x8vHSOJFdt7or0X4B1wnCpOuW1ch4irN/zDN9L2AhKAq4uxCNTYlNtOnhWvRuWIfPMkFFghV0sYi85XykGzaf1oKN97pghOrXFozUMci8F3ythOXancCE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Xke89Uvp; arc=fail smtp.client-ip=40.107.220.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Xke89Uvp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aL/IvOJ8+ZtNML+DSKnX+h4P/RrXw31K3d70q3pbiwwfMhGhzzRtPSHzFpoZm2OA6VTOYVDIbVuXjPvD6ji84+VN4SWUY5ylA/07nRba9emT4LKhbPzIMh3L+tMxgPQ1xfLUma76HtSzt5StcdLcjzjS7qWAtEXtU8QAITvAichtaSK/x3LJZ2IUuKc+2muSUvFFUHf/wJ3c02+c+gUeTcMK3igOSX5o3mCBaGeATyT407kC0uUILdW1SJb7HK0CCI3b+SEBgYsBPV0ukaiiRjO0HMJ2FrSLxWQzBlp1bKl3pNjpnzWIlQ8/afa4Qvk9QCuASW2KXXQiXpRPVQ1Skw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k3ljgyHqnVcMuqZITx1T0tvxKlSgfYPIJt8M/PtRyLw=;
 b=HJkA0WV62wAtZBLNcJ+LKJn30wCkIWhenOFv5AmAth0SsCLgg+xk14NoKWfyIzVDIWvUVbEM+s1fFrWlsUQbckwOHSXACcOZVfFGEvBtemMPKEPA8FARuzmeu01ZxnGLC1q/WSTbB0VnqjjB+7qHA8aFc5Acr7fLYVMhq1XUFxbwqWYzXCiohEQqtyZfwTt5cEwQs0jJjs0H6vQVuqemyFq0Ke+yNcbvdWEaeJ5+2IXPam3SuA7HDPatbJwZ52lt/5oOEp0X8Pgrl9R39Tj0Mna9Eg9ASfXmuBEpf/LPnYPzbRfnAsqiu4nLMTA1SJ96ANbHSYPgzLinAAV/aTr14w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k3ljgyHqnVcMuqZITx1T0tvxKlSgfYPIJt8M/PtRyLw=;
 b=Xke89Uvp/EvhlrJNvilz+UMsY2U0ez0vJnRBcvxTACw30CCVviXiWmR9mUm4Nb8O2yR79VGDF7/TeCztPe9d2vmiNz5AAQUiSalp45N7Gpxz3qXqzTmMYVzW5FlmkraQOJ0pr0y1JdeFEeqX3KmJ9PoEi9OPpxJQrX3srffzvhGRhrdSTGnJovsVxJV/Ue2ZkSJjts3FT/aOdtYX1ivGsiLZQRRQDPb523ab1IAA/DsalZkxuCmVnxzGeRyBLRsUa2NI5zfNfNBleUTZI9E1v96JfoiC9GIL//iIVkiqnQvatTCoYG3i85FtVr4wTWQjjaOHmvcM0YPiGhb4Og6Rlw==
Received: from CH0PR03CA0185.namprd03.prod.outlook.com (2603:10b6:610:e4::10)
 by CH3PR12MB7522.namprd12.prod.outlook.com (2603:10b6:610:142::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Thu, 3 Jul
 2025 10:38:49 +0000
Received: from CH2PEPF0000013D.namprd02.prod.outlook.com
 (2603:10b6:610:e4:cafe::c1) by CH0PR03CA0185.outlook.office365.com
 (2603:10b6:610:e4::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.20 via Frontend Transport; Thu,
 3 Jul 2025 10:38:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF0000013D.mail.protection.outlook.com (10.167.244.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.20 via Frontend Transport; Thu, 3 Jul 2025 10:38:49 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 3 Jul 2025
 03:38:40 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 3 Jul
 2025 03:38:40 -0700
Received: from sumitg-l4t.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Thu, 3 Jul 2025 03:38:37 -0700
From: Sumit Gupta <sumitg@nvidia.com>
To: <treding@nvidia.com>, <jonathanh@nvidia.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: <tbergstrom@nvidia.com>, <bbasu@nvidia.com>, <sumitg@nvidia.com>
Subject: [PATCH v2 0/8] Support for Tegra264 and Tegra254 in CBB driver
Date: Thu, 3 Jul 2025 16:08:21 +0530
Message-ID: <20250703103829.1721024-1-sumitg@nvidia.com>
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
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013D:EE_|CH3PR12MB7522:EE_
X-MS-Office365-Filtering-Correlation-Id: efc30e90-ecfb-46bd-64b4-08ddba1dcbd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TF2ekwkF09a005fFqA8iK+RXcG9Y74VFpOMPrA3qsNadkY8J/FFkFR6X2MkF?=
 =?us-ascii?Q?ao+n34ZCKRkUAnG+u2MWJK8WFc2SrA6jJ/oeH3vMnNn8ZWgTv6vfsklhs8Gh?=
 =?us-ascii?Q?dP1SOxmmup0ZIjaqe6RZdiHarWLBoy08uQ6GnE3DS/FDm73TKA53WFTM/OIQ?=
 =?us-ascii?Q?Ee4qsEPj6uWqksVDjvbYYJSdCnY9r9Y8rAGfw4Id+p0rYd1ly0TK8kZWA72a?=
 =?us-ascii?Q?0xruQnvdu/vFTf0TFaF7vC11yHEnIzZ3ZGZ8queAJAa3CZGhIYa7Fo/18l/A?=
 =?us-ascii?Q?uwu71SFkMRfs2MRYHeioPVrtRybmzGtMzCmxXixdzvFGvys31Vx12wTsdCU9?=
 =?us-ascii?Q?iVQrhWoE7b/CWHrS0rciuwxlWP4BKm4pgssuXQ5F+VeugAqr2Kt0P76Sb7Lq?=
 =?us-ascii?Q?WV/FN06mAt2Xn4BUqLxzxzr6IA8vz8fphi7RXtSygdutiSGLHxyJWFU/hnfh?=
 =?us-ascii?Q?mWGwXmfDyKwMvCWVRg+v1xlpWw5qxTwAUB0sV7474mLV2Ddm9SHJav4UWWGM?=
 =?us-ascii?Q?y4OREQU8sYuy9GvL4d6xlmGVNg3bFGUGlmqXXX7hrmfk4iU1Ozwcc8IjhtBI?=
 =?us-ascii?Q?ECLeS6hr6RDo3YlweqBfTYzAmuO9JB/+gVPmS86HMxd5zCgBf1ZcQFwf8FTn?=
 =?us-ascii?Q?PFCgtOlhV/jVfArROPJGIvnf5yyPTvygY7j4EBOIA+L0RC1fZ5U9jgAZP7L5?=
 =?us-ascii?Q?hw/kLZXJzGxTa2JwW2ahppu9kbIUEJpkmDuTDkNPtWmjBsTDKmmlCe5kwVL9?=
 =?us-ascii?Q?uCzAn8Ta9USGPyWgiswqTFJK5+K5wsTsNChqb7WA+RUdaYzY/K0LZEkxx/2b?=
 =?us-ascii?Q?DVZ/m4u0YhjdHt6V0Yty+DBWkxUyuMYtSH7o305BNF0d25MPcKHC1+9FWfXd?=
 =?us-ascii?Q?hmBbwSqY26ev0ykmIcwBFkEBw3SY/A1pgMZVCzvNtx8Wpbgg7hGn7UNvLXoM?=
 =?us-ascii?Q?bKlZkU9oi+FIEFg0BPwGqcCkEzMPCvoly3Z7n8Jh0v3OupJYT0DhxmqsAmCQ?=
 =?us-ascii?Q?Hcx9usjmRsCzS1q4LTP+q7mlvqhg8zuuqiPD9B1M+zGTbFmCxJE8SPgprMLn?=
 =?us-ascii?Q?zlU/brau8MHvaKWq6v+b5so8b02auqDmPuqoY6oVwKtzBkeOKIlZ8DAIxg8M?=
 =?us-ascii?Q?3hoUdKcUVP3ZZS9vxn+aAu2uGR5FNYqceJlimVOqtnRjLPHa5cG7Y91pcf64?=
 =?us-ascii?Q?BC9fmBXsQ/SQ2vj4oCWj5TFAJPFZBi2zRia9He+HOoRdON87vjuJyt041SM5?=
 =?us-ascii?Q?mt7ko+ZU3iSnsgLAPrD9TlKLxvLoMQWB/TNjrUQTkkL/JK999viVBz1z+9Qi?=
 =?us-ascii?Q?k61k0wty/Yu1g21cxcXyM6OJOG8hKixDJ7kyRHxFQquSul0rvtKve3D8Jy4o?=
 =?us-ascii?Q?FqvevX76DKsFAikdlCUHXUcqPlV8RFJG+NlwdsHa8SLTTG3Zh7z6NM/1yi8w?=
 =?us-ascii?Q?IgdMswJzjJhxJYGHZ68frrAPZ1n7w4WHoXX/80H3glT/3jvCCdhF6yarWpnD?=
 =?us-ascii?Q?lHdN1GVU/62KIwizkE+Gdi9EowhQLlC95BC5q3rEkCxcFw5zAf9HnjEaTg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 10:38:49.1463
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: efc30e90-ecfb-46bd-64b4-08ddba1dcbd3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000013D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7522

This patch series adds support for Tegra264 and Tegra254 SoCs in the
Tegra CBB driver. It also includes a fix and some improvements to
make the driver more generic to add new SoC support.

The patches can be applied in sequence. Patch info:
- Patch 1: Fix.
- Patch 2: Change lingo from 'Master/Slave' to 'Initiator/Target'.
- Patch 3 & 4: Improvements.
- Patch 5: New feature for HW lookup.
- Patch 6 & 7: Tegra264 SoC support.
- Patch 8: Tegra254 SoC support.

---
v1[1] -> v2:
- patch 8: change name from GB10 to Tegra254.
- patch 6: added ACK from Krzysztof

Sumit Gupta (8):
  soc: tegra: cbb: clear err force register with err status
  soc: tegra: cbb: change master-slave to initiator-target
  soc: tegra: cbb: make error interrupt enable and status per SoC
  soc: tegra: cbb: improve handling for per SoC fabric data
  soc: tegra: cbb: support hw lookup to get timed out target address
  dt-bindings: arm: tegra: Add NVIDIA Tegra264 CBB 2.0 binding
  soc: tegra: cbb: add support for cbb fabrics in Tegra264
  soc: tegra: cbb: add support for cbb fabrics in T254

 .../arm/tegra/nvidia,tegra234-cbb.yaml        |   4 +
 drivers/soc/tegra/cbb/tegra194-cbb.c          |  34 +-
 drivers/soc/tegra/cbb/tegra234-cbb.c          | 758 ++++++++++++++----
 3 files changed, 606 insertions(+), 190 deletions(-)

[1] https://lore.kernel.org/lkml/20250530133336.1419971-1-sumitg@nvidia.com/

-- 
2.34.1

