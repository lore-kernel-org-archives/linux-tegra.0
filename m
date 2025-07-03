Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2045.outbound.protection.outlook.com [40.107.101.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816772E5418;
	Thu,  3 Jul 2025 10:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751539163; cv=fail; b=ZQzVpa+vKQ3Ph3azb0XE3XliDbnkux6Z3nLZ4dMQads3apBYXHDYk82Ii93nT0lJTFc8q28SxOoEto0Eh7GbU1ST9ZgmeTESVQAWapIoXgBMMI9FKoI3P0GprJh5hgj/Q/e0CKioua4CcAsXS7Z3CCoyAI1PpZc+NAZG8L9jzL0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751539163; c=relaxed/simple;
	bh=6/7rhnZWIpHqrF/Wc35G1F6jhFCOBHLHDRuFVSXyl7I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PIk75FroJEiOwb+KgLyMhSjNkFyh+N9GstTmpb9APpLY62jzW3pgNWiF5ATjilVRdgmxC3mkh4WkTwdkPH5nFeMDZp6Uytcd+Q+f2H2DlXTDrO/kJjzK743XRHgQPJ6ljFF8lcST3WJq/I48oSvwDomcrsZq3dTtMoYEKApFZpA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KuezRk05; arc=fail smtp.client-ip=40.107.101.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="KuezRk05"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MX1cwTadw1OeDV1LhR4q0UxaOCfEl/WXGtk5MEY8JV0i4kpr0Q7batnHTtNJrpidwLOVnxInvAjW/wU5Fh7D151KqIRUctjwrxoDiyX0obea6qAongvQ3dxxu2prK+0cshNXMN4/YBAW6oovBRs026wGUUHGYkxqi6wSKzvHCflNprE6FlMoIsQ08H5VhimOtkJwSa5Gdb0anQR32HKRqDk72o2MH5uzWJAy/rCUfKLeofZm+ouFQbY27W5OwDLPnisN6ybJiIf4EdL6NZDA3zjGlwjPpeLqt/HsM+u/YBbIn50Hv3MAK1GBDXtOvaDu7tcdEigCd4pGOmkIP2K/Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dIX9GOBru9T4BLwYt0IzAy8lxmgdXB887ttbYm3B4Ds=;
 b=xZoeFYgSpI2ahyrm4M0gw69eWVwVCJZozBJETMCb65V7ls1vf/nlTOwjo7MDbc3GubbUE5GIA/6fP+0BPP0f67yWMoMJflhA2S53g3D5qLltuCnG3NOgnt+eWYiVH1Ezr5svqvNfVXIUQt6VlrIunlmzA9WnLvYG5/gFncjMVz0Qj9Vd4JxoGo/m9tBQXVifPQl6JI6uSfVSO9W18LQeNSfkNSvKeNPCkiVwQddFklTXf6VaVnRHUxW1qXZr1y6jQQAEtR/QucOpOL2KtTEZuOmG0+wlck4eadWd00iEEcjT/RsCxrt75d4WfSU+e6AVEYDzGisvx6cB57wJOtJzQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dIX9GOBru9T4BLwYt0IzAy8lxmgdXB887ttbYm3B4Ds=;
 b=KuezRk053wOl316oxiZxHy0+S8ff935KNWu+ghG/+OsqTEgpWGu63Eg6xHAlts2EGru0MU7PPSgbiP/QTYYENSN86qJEBBbqJhFWxh5tZnsc1saqnUxxg96pWsd04LNC84HY3Ign7Z55Xo/xvm5aNHTIGVNSYihnEQJ9qPva61INCqUgh8jybMohHKF1FgKTISihVxPZheNEJmubkeG8Y8PwBSlHWARrWRMkf+ToFNSs0k/pCK13DFYTP42zTufb22rSvof7+aRDhuAdFUGF8ZRbkJLJY7j0KrAV7CgUqCrv1bffAsWQfglwR5hAUo8hwnqRDp6dF45mLChMhFB1hQ==
Received: from SN7PR04CA0014.namprd04.prod.outlook.com (2603:10b6:806:f2::19)
 by CY5PR12MB6033.namprd12.prod.outlook.com (2603:10b6:930:2f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.34; Thu, 3 Jul
 2025 10:39:17 +0000
Received: from SN1PEPF00026367.namprd02.prod.outlook.com
 (2603:10b6:806:f2:cafe::a3) by SN7PR04CA0014.outlook.office365.com
 (2603:10b6:806:f2::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.22 via Frontend Transport; Thu,
 3 Jul 2025 10:39:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SN1PEPF00026367.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.15 via Frontend Transport; Thu, 3 Jul 2025 10:39:17 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 3 Jul 2025
 03:39:05 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 3 Jul
 2025 03:39:05 -0700
Received: from sumitg-l4t.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Thu, 3 Jul 2025 03:39:02 -0700
From: Sumit Gupta <sumitg@nvidia.com>
To: <treding@nvidia.com>, <jonathanh@nvidia.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: <tbergstrom@nvidia.com>, <bbasu@nvidia.com>, <sumitg@nvidia.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 6/8] dt-bindings: arm: tegra: Add NVIDIA Tegra264 CBB 2.0 binding
Date: Thu, 3 Jul 2025 16:08:27 +0530
Message-ID: <20250703103829.1721024-7-sumitg@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250703103829.1721024-1-sumitg@nvidia.com>
References: <20250703103829.1721024-1-sumitg@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00026367:EE_|CY5PR12MB6033:EE_
X-MS-Office365-Filtering-Correlation-Id: f946ed6d-6837-4a16-84b4-08ddba1ddc78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cUSh5N4h8GQmAvtOLH5eQlmVn87bNT2HMEJSV5r/ql0DSJJNypHRDG5AgDe8?=
 =?us-ascii?Q?jnEnSqVOM4saRGgmMKxvd6Lj8v70yqDCHSoS87yhU1CyhcTmTAtUZtmei1sv?=
 =?us-ascii?Q?mhpIghg8+ll3YgRlAPFsEH2yt+iQBMQTWkNqk/vrWOgS9MHx2kCLNsakDLrg?=
 =?us-ascii?Q?AYe1OguFeY1BHUcuSxo5eWyATeApTNSoN7+FfWGT1nar14qysl2wPfj8TGGn?=
 =?us-ascii?Q?qjyYn9BIgXTNQetuJkrYNF+4QhMRZEM7QwFTypVc0hvnzqWo6NozbHdmXogR?=
 =?us-ascii?Q?F75VhutfLSEQPL938mCQjF/AtpMF406a6rVt1jkhDKVz2FX71JJUzHIHT07Z?=
 =?us-ascii?Q?o+qxYDdtFJFDS82E1qMDChHnq150dzBFCCk5/iCBlMsLzkBA9DRF7t3H0hcp?=
 =?us-ascii?Q?zqJPR2MwHuTYfEfRi8wx7M+6CrWreOzcxr/DpJfFWjnqnuZm6e001lkQcZ3g?=
 =?us-ascii?Q?zYtRIVrPcQC7+dhgwqbjr0jmcdFHUW61iGpXAmdMTwXgIPiTzR1sd1GJTDct?=
 =?us-ascii?Q?TGiCrh1xSMa/XT9ZnZYs+pkaPq6zhdAymGNWzRWVeoQnSYF0L7sMFBn6nYXl?=
 =?us-ascii?Q?9hPXh9zdqcpmgML6S/bhuQ9poguRNvv2aDjyXQTfjTRuIG9TkAGHYSk5JbjL?=
 =?us-ascii?Q?rfaM8gS8htEgXjMIWMm9pYURJRWqP2N9ILdD+uIc+jmKTyFoXXG86cXmFyQH?=
 =?us-ascii?Q?nGy1vFELKyX2N1sNRA08bzx2bwm1RXvhin8tAUo2QeEBD8DyJpkBBcfEgf1C?=
 =?us-ascii?Q?fOyTNDB/+/vthWOG1eYfZgfrc0kKxyApvdyWxIcJaGxJCl0jpmF/mtu5+Noj?=
 =?us-ascii?Q?HJihE1EwpR+cMGnP0wE9gXV5r0wANlfIO4pltQa3XKr+1vdX2tRwJnS6LJiX?=
 =?us-ascii?Q?4ve4IeUD0VpMSHR6gY2s0e5O0z0DIwi1xEh6+baac7fWicvEThc6ZcEv65uR?=
 =?us-ascii?Q?rfOHdMSkw/Kqk76ecwolsnhBhtpm7DkH2792bFmrket02Kace4+lIXBnN9TC?=
 =?us-ascii?Q?vlnoyiqgv+mDVq3v8F6otouOui19oTOwYo3oJDpo4LpNqNpmzvxSYd8DOVkS?=
 =?us-ascii?Q?sxn07WBzAVnZV4lLLCbVNKahYhdnUlkS6wrGPaZFTayc0D8fhtkTZ8rvH0/5?=
 =?us-ascii?Q?a9eNpIvxj7rINMkM1/ymIBJwkiW4HBeflU4ozagmPdGxQmufddRDQztsYr4g?=
 =?us-ascii?Q?iZzGfe36zLqiWqpjujll4HQ4Vu4dp7Qf+VJHBAOlUdNQLmAcqlE9ncdijwLu?=
 =?us-ascii?Q?8jZeHZ+6Z5Qi9jrSnHSjkL3JiaobSB4ZC2EmOVxyv3mtrJVHtbowyi+3xgX6?=
 =?us-ascii?Q?4ZQ/8otJsUrj0DLFkov+eYUpq7NgMRnh9JGpgt0lkpvBA3TLHNyo073uSIrK?=
 =?us-ascii?Q?6XS3Gg8u9Ou7ImnTCAiDZ04b6Ve8r88YQGhhUfc4XsFl13vhEEVXI8PMMF/z?=
 =?us-ascii?Q?rusPVxBkxxEjJi8j3U/mS0f3HL1zJjgPYjhQeaE3Vkbe8bSRy3ACB0zgAMo1?=
 =?us-ascii?Q?miRhD2eUMp59xfqE8cYp2J22aJOBx3hPHajh?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 10:39:17.0723
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f946ed6d-6837-4a16-84b4-08ddba1ddc78
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00026367.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6033

Update device-tree bindings documentation to represent the
Control Backbone (CBB) 2.0 based fabrics used in Tegra264 SoC.
Fabrics reporting errors are: SYSTEM, TOP, UPHY, VISION.

Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/arm/tegra/nvidia,tegra234-cbb.yaml    | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra234-cbb.yaml b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra234-cbb.yaml
index fcdf03131323f..28227dfbb1c71 100644
--- a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra234-cbb.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra234-cbb.yaml
@@ -48,6 +48,10 @@ properties:
       - nvidia,tegra234-dce-fabric
       - nvidia,tegra234-rce-fabric
       - nvidia,tegra234-sce-fabric
+      - nvidia,tegra264-sys-cbb-fabric
+      - nvidia,tegra264-top0-cbb-fabric
+      - nvidia,tegra264-uphy0-cbb-fabric
+      - nvidia,tegra264-vision-cbb-fabric
 
   reg:
     maxItems: 1
-- 
2.34.1

