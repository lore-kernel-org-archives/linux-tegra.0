Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010070.outbound.protection.outlook.com [52.101.201.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9376404BC4
	for <linux-tegra@vger.kernel.org>; Thu,  9 Jul 2026 09:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783591011; cv=fail; b=Lopbya7zee/OwDivBUTtHV9+eSOFdc/3+nSS+0BI/zeebpkAQRxCmhKcBT6ybV1Xc6Cm12Lf1UUjVCwLkpcPumMKzpCbOgSkUFiFtVZKPlAav975u5y67+uEZ5KoSo3sT2rnoFucKthxMwGb6i3dI1k+1YEoPXZQBk5Oam420M4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783591011; c=relaxed/simple;
	bh=b5rBhD0uWjcT16V4AQYp1QLjfXtkCeq+CTdBmFO6+OI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WkK5VysyvMGVjCddMshQIbNv3eIzuHE4MNeUUn0FB8EIVcs5mSJ9+JyU1ZLWcAKiclckeFu+iZ1KjVvissjTJem2jKso07zHzmMbegMWUupCa4ZNefdvQ2GN9l0WjP3XKJSyWWB4J2uGNTE5ZVFyr2BTBmkoDcdzbhRIajsvsTY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Svobn59u; arc=fail smtp.client-ip=52.101.201.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Svobn59u"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VLCM+xkgIk5MvtabBPVh3SdQePt5ajiiN3EmR4V7+qPUJbg319DV6//LKgvr2XS+bVHj8Y+62QVGH4gaJOyBcDKVCSxm8qyurAI9ZaQ5G7eWCnAX6wLW2DdqeRtqfeQALLDiLPTkwbc7nTzL/aPtnVXd9mOgEvQQED12j341tOv80GY6VqvhdPyXwNZNHu0IaYCoxQ8jz1ytaBpK4Yzj/GiWt/ng7KuzHXxdYqkFyTX2S8tz0g8vKXwFx7O/oJg50QTXSHhF0IihuXeawZv8jsV93Esh1tRZLY+5U7S3ghL+v4u0btnuDRS8PCiaVWtw7UumVIcDHYcW6yyWuKf4Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QYSk1hliKjXlwrhpavoUQFDcv0NxkNpZIo3vK0UjhAU=;
 b=QqkW4onUUZcuoTn0zteGWCZ+eU6bMrxxt6nOMPEof4+tkrw0fisrx+YRknhX3H96N/O8OsFk710Xy9pCxaqnrpBcFIWTQQTTstrpfp7VsSiPsiegrujCGLVhpltJ4os9IgvDVz/9dKklkkVZVP8jORk7cUCJPdSF+4/HzE0e2C8GB/C3YV7XpsxuuQy93ZdkIebknvuezCXAJWSrLquXyLn0XeKEZk5wOlnVDPTFQeAZz8BI4h/YpscFrUfEVDAwU+/yjSUdtmXowTw6zkAsOpF7LOY+NSbbp0n6N3Q77/FM1so/Hu+KqMdMwOjAQasFlqJCLN9T6Rkm6sp4HSxn2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QYSk1hliKjXlwrhpavoUQFDcv0NxkNpZIo3vK0UjhAU=;
 b=Svobn59u3JMc5SQyNRi8iMnbWNCU+YHG8IpDph54v+9tDZmDSjRQzzyYYekdKhmFhz3Golc92IZWExug9IQGJph60vP/frHL0l/eksV0wljO6m1/71//RSwOiKih0l6Ql315wit7FeqZvrbkVpUpFe0vrnEaDvRyG7qSG1r1fcqPA5uBZtgAK7BvsprevvXNd6/L2OMVzjjLrtvoNS4/ceG+98qItCwrqPa/8JCs8BL6XzEkb+ugo5T5tp7B/ilsT+v+y1g1GFKNC7fnL2nIXvJd1gppSnuJX/gUImJeas0eERB9RK6VYDS8BdPTUCYl6eh0XOXPrad796K6LgpsCQ==
Received: from BY3PR10CA0021.namprd10.prod.outlook.com (2603:10b6:a03:255::26)
 by PH7PR12MB5976.namprd12.prod.outlook.com (2603:10b6:510:1db::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.16; Thu, 9 Jul
 2026 09:56:43 +0000
Received: from SJ5PEPF000001F0.namprd05.prod.outlook.com
 (2603:10b6:a03:255:cafe::a9) by BY3PR10CA0021.outlook.office365.com
 (2603:10b6:a03:255::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.10 via Frontend Transport; Thu, 9
 Jul 2026 09:56:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ5PEPF000001F0.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 9 Jul 2026 09:56:42 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Jul
 2026 02:56:21 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Jul
 2026 02:56:20 -0700
Received: from build-amhetre-focal-20250829.internal (10.127.8.12) by
 mail.nvidia.com (10.129.68.6) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Thu, 9 Jul 2026 02:56:20 -0700
From: Ashish Mhetre <amhetre@nvidia.com>
To:
CC: <linux-tegra@vger.kernel.org>, Ashish Mhetre <amhetre@nvidia.com>
Subject: [PATCH v5 0/3] iommu/arm-smmu-v3: Tegra264 invalidation workaround
Date: Thu, 9 Jul 2026 09:56:10 +0000
Message-ID: <20260709095613.831769-4-amhetre@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260709095613.831769-1-amhetre@nvidia.com>
References: <20260709095613.831769-1-amhetre@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F0:EE_|PH7PR12MB5976:EE_
X-MS-Office365-Filtering-Correlation-Id: 80adb1df-1cd0-4b3f-953a-08dedda06169
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700016|23010399003|11063799006|6133799003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ABHz9j0UmlMszzGheT1wzIAvhk4pByosLaJWN7E+82Fd0Gy1P21EpEctx7mJ3vHWFuke4GIslsqTDc8q3GiViFGfMd2Jfr+7LpArYWtTK92RKjPvdjm7mvAgWRrPCifVU2cIxouD9Y1Qu4wB8xFkrn85+xFpbh7pnWDAfaOqnMFR9FIHFOoNIkISCurc2rURmKZQ8n6KLKH4U2Y0O5SkWKa7lWfeH0XzlxIl/yf9lISq/nNGfV4zX8eOnyr3snh8FOB2AjbWLrwr9ivuVDzkcrvjiLc5P7WdjofuQtTHw668oucJyg4+mufqPV8o/NTYEp8n0so408mFdeIM5IyEGfoxG7N6s15c9oibs0BHwszB7yGY/cMUoNVjoYYnWlJSDjFKEpFDbtdEzWZKvdXoCVa/c2k+gf+OBBLJ8e5+OqlHXFWnjMjqn0Mx4yEP25HCqWZPO4DEoegmD8xad1T+JYXCLYS7yhufT07kojhGMRvXkPKmn9Z/cYl0qwVAmbjzj9nuoiC75LBcPbi3lBjW9CwbHnjq5PclqDO3ht9qRQpYFBmIDsM2I7nTCTSM2ptaeFlvSuPQbdxAVW2Ymnpx/q292KFUZhQ/1+pFLhg6Kf3mAP/ZOfQKH/pBH+jiQtxvHjF8bjHQTGrSZXhEZCzzej0uFgh7rCX0fOOrim8Rzds6Jh4t3/dqQMWmqGK5z01GStJwQZyDzFEabqTW66Lp2g==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(23010399003)(11063799006)(6133799003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	O3QAjo78HmDRt6m7rv+Ol6itTtdGt2r4DXbZ++O20DwykvhpQLkYMRfWZwDFQH0PWd1YbF/C3Q/bUVA+C5Unc09gGr/Mv9K13q9pWAKDokgBLbK8/hvYP5i384S889hLozqmnrXmjrpH+Y1Ac6Pj5Yph0Ss+0iSNhc7Ca0S5xwlhbYxixXE08c7KRa+SLS6Yu8pb1ZUFGNOCWQCqqHONmUp/OpMPXclHJQ7e8visM4I9v4eA06nMglSHIBos1KP7nM6wo4KdLhliYztwpWR7kry2ERPj3tBnLpYoEPp+4rWJ3rFiCd25rpgpWSCAhuVG0xk7O9THU/36or1MdCMJFm29EhaieYqSbgqzxES0U+dFp8ZIwLY0X5TZB5CMWjRshJkMb/CeLg3lJx2gvHjdoNY3bLrAibQmQNCHeBVo+JyR+TkUyoiKUA92hJL266sp
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 09:56:42.7850
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80adb1df-1cd0-4b3f-953a-08dedda06169
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5976

Nvidia Tegra264 SMMUs are affected by an erratum where a TLB entry can
survive an invalidation that races with concurrent traffic targeting
the same entry. The hardware-recommended software workaround is to
issue every CFGI/TLBI command (each followed by CMD_SYNC) twice.
The second issue must execute only after the first issue's CMD_SYNC
has completed, giving the sequence:

    TLBI/CFGI ... CMD_SYNC TLBI/CFGI ... CMD_SYNC

ATC_INV is not affected and must not be doubled.

The erratum is not flagged by any SMMUv3 IDR/IIDR register, so it
cannot be detected from hardware ID. Tegra264 is device-tree-only
(no ACPI/IORT support), so detection is purely by compatible string.

This series is structured as a small refactor + infrastructure + enable
sequence so that each step is reviewable in isolation:

 1/3 Pure refactor (no functional change): lift the existing
     force-sync conditions out of arm_smmu_cmdq_batch_add_cmd_p()
     into a new arm_smmu_cmdq_batch_force_sync() helper, so that
     adding another condition (in patch 2) is a one-line addition.
     Authored by Nicolin Chen.

 2/3 Add the workaround infrastructure without enabling it. Defines
     the arm_smmu_erratum_repeat_tlbi_cfgi_key static key, the shared
     arm_smmu_erratum_cmd_needs_repeating() predicate, the
     arm_smmu_cmdq_issue_cmdlist() wrapper that can re-issue matching
     cmdlists, the batch-helper force-sync condition, and the iommufd
     batching split for mixed command classes.

 3/3 Enable the workaround for the existing "nvidia,tegra264-smmu"
     compatible and document the erratum in silicon-errata.rst.

The series applies cleanly on linux-next/master (base-commit below).

Changes since v4:
 - Drop ARM_SMMU_OPT_REPEAT_TLBI_CFGI entirely: the option bit was
   set and read on the exact same "nvidia,tegra264-smmu" compatible
   as the static key, so it added no per-instance signal that the
   static key did not already carry. The predicate now gates purely
   on arm_smmu_erratum_repeat_tlbi_cfgi_key. (Nicolin: "Are they
   redundant? / Drop the deadcode then.")
 - Reorder the series so the compatible-string detection lands
   last, once all the infrastructure exists (Nicolin):
     1/3  factor out force_sync helper (unchanged)
     2/3  add static key + WAR functions (no functional change)
     3/3  enable the key on nvidia,tegra264-smmu + silicon-errata
   Split the old v4 "Detect" and "Issue twice" patches accordingly.
 - Update the /* See ARM_SMMU_OPT_REPEAT_TLBI_CFGI */ comment inside
   arm_smmu_cmdq_batch_force_sync() to reference
   arm_smmu_erratum_cmd_needs_repeating() instead.

Changes since v3:
 - Drop the cmds->num == 0 early-return so the refactor is
   truly "no functional change".
 - Rename ARM_SMMU_OPT_TLBI_TWICE -> ARM_SMMU_OPT_REPEAT_TLBI_CFGI
   and rephrase its kdoc to be hardware-agnostic.
 - Rename arm_smmu_cmd_needs_tlbi_twice() ->
   arm_smmu_erratum_cmd_needs_repeating() and drop the kdoc
   above it.
 - Replace the explicit opcode switch with a single range check
   opcode >= CMDQ_OP_CFGI_STE && opcode < CMDQ_OP_ATC_INV.
 - Introduce arm_smmu_erratum_repeat_tlbi_cfgi_key static key:
   the predicate gates on it first so unaffected kernels pay
   only a single static_branch_unlikely() check.
 - Drop the verbose Tegra264-specific comments above
   arm_vsmmu_can_batch_cmd() and inside the batch helper.
 - Document the erratum in
   Documentation/arch/arm64/silicon-errata.rst.
 - Guard the repeat path in arm_smmu_cmdq_issue_cmdlist() with
   an n > 0 check so we never inspect cmds[0] on the bare-SYNC
   flush emitted by arm_smmu_cmdq_batch_add_cmd_p() when the
   next command is unsupported by the batch's pre-selected
   cmdq.
 - Drop the carried Reviewed-by tags now that the patch
   shape has changed; re-review appreciated.

Changes since v2:
 - Split into a 3-patch series (refactor / detect / apply) to keep
   each step small and bisectable.
 - Move the classifier to arm-smmu-v3.h as static inline so the
   iommufd file can share it.
 - Add arm_vsmmu_can_batch_cmd() to split iommufd batches at
   "needs repeating" transitions so the per-batch decision based
   on the first command stays correct under mixed user input.
 - Spell out in the commit message why detection is via DT and
   not via IIDR/ACPI.

Changes since v1:
 - Detect the erratum from the existing "nvidia,tegra264-smmu"
   compatible instead of adding a new property.
 - Centralise the doubling at the CMDQ submission layer and only
   apply it to CFGI/TLBI (not ATC_INV).
 - Drop the binding/dtsi patches accordingly.

Ashish Mhetre (2):
  iommu/arm-smmu-v3: Introduce CFGI/TLBI-repeat workaround
    infrastructure
  iommu/arm-smmu-v3: Enable CFGI/TLBI-repeat workaround on Tegra264

Nicolin Chen (1):
  iommu/arm-smmu-v3: Factor out CMDQ batch force-sync conditions

 Documentation/arch/arm64/silicon-errata.rst   |  2 +
 .../arm/arm-smmu-v3/arm-smmu-v3-iommufd.c     | 15 ++++-
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 63 +++++++++++++++----
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   | 15 +++++
 4 files changed, 83 insertions(+), 12 deletions(-)


base-commit: b9810cd75b9fb56a3425d391cba3f608502bd474
-- 
2.50.1

