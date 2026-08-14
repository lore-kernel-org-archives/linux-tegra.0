Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012011.outbound.protection.outlook.com [40.93.195.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBAAF36894D;
	Fri, 14 Aug 2026 09:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786700226; cv=fail; b=o90IM4zFbXB74mB3StGW20ABX4cOD5Nb5peDK2mYGY3iqlChvX9zNaolOMvQFSCHX0wZgWzBDwd1bDzaQzYINDVSoGRSjun671lsslgoXNdHPUHXtiB0z0uXeZbEvo0XyTRvsERwd6KTbDeeJuyb8PQmDOEahYr97fJVKsgqwOE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786700226; c=relaxed/simple;
	bh=6pq7SFDXX40Pyv+VBpO9SKcFsnyY2N/mbfwE9YGMQcY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hljb4uJdDAypFSQGhysFWdX72HPA2eSMfH4Qqj2lwiYsPWQWoI9OFnm/nQ4ACFBCrJXvLydeC7hGQJn/pny9CCwAVJfLlW3BZk7AjLotIYUcU7toc44IVA5StvM2Z42nXC0UEOu6WCKV8vBo5ijAKW23VzY/G0vFeNydAsT6Aa8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YI0vCK5P; arc=fail smtp.client-ip=40.93.195.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YI0vCK5P"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kUncXqj8G91yK14xjDuG8Nq3mcyTE4XhxzPwWQvnL2yt9tE16EtoBIdmcbn/HaRsYEgeqP8cYKDp+17Fq7KI2mY4e9rBMNzY4NFj1lXB07Z5NWD9ZetQJo6EN3WA30l22bf+SqXbk+Bozmnaz5ObgLTxD5lTkxU0/XJlnMaggIIpMw9xVqxRDvvizSpGbbQwoR0sVJbpH9Y7vecBxHxCq9s+pgj2xIM9a9UBLpNHYaGHVOqRhXm1Omxy6OIcEnU0bfDRcvHlUISTLNqphbm7Y2Ke4ogSfO0wTjqvylIEbY2cEpp1UAb59y6I+56cLrlKhZXT64asMW//mbjnio/huQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nHuJ01QMsHEyuxa9vjXR14GffAMQAErlGB7gKs4ImxI=;
 b=IS9sS6PKGLN/Qu5IazFGk3fGeaSDHv62sx/E1xTaW//p7LUEpyiugjxJOuhun1IAlpDUHHELbH51+HjbqdKfwl9XBWwzfigqRHs7FqIYY5nmYQq4dPO9ouJF0lLIjRoBjKIOqy4j5srumTpFVXMaVVT9SYol+nKCggCvd2Jrfz0N6lvDfgI8eD4nrttxtRaCuuqi1jmaboHSFWqSuCtiWr/jMIE6pN1jMS8mjObtN3ZkrJQt7xr5WGaWsW/gTTHlzT8raThYlSYeAFf+FmOLBPQOLM3f7uyxn9nqjzW1Jbr7XMxQhnpb5Q3AvCE375dLyu6jByJ3xRPjUgJX/c1uNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nHuJ01QMsHEyuxa9vjXR14GffAMQAErlGB7gKs4ImxI=;
 b=YI0vCK5PEbtgSXZGhE3Au7Umis5njwyfKKIpVviDyVZfJxRccTNMsggaOZE2duLJVmaBMDsbflG7EQZnXODESnUnoficIFG5nDbvpeALn4Fr0GixvyOo8lDGjne6wqmUG8MVCMYYwtEO00UFkZXdLdU4pqKzlrNDbFtRXOduRdf4XT4OUcrOl6uFkqWNpk1Jsu1rv8TJpegniTMixyePzP34TVb4WV1l+sBHF1EG+7JYsbCJarc5pS+PwfE32CcG0vdCY9WgPutJyLH69ziTe/dR5Z+bJnU5fM//U/dCjugM/eHSGVJn0xyxfG1M3GPhQC+8Rq8Uy4oOfMxFKUf/lw==
Received: from BN9PR03CA0923.namprd03.prod.outlook.com (2603:10b6:408:107::28)
 by CY8PR12MB8314.namprd12.prod.outlook.com (2603:10b6:930:7b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Fri, 14 Aug
 2026 09:37:01 +0000
Received: from BN3PEPF0000B370.namprd21.prod.outlook.com
 (2603:10b6:408:107:cafe::57) by BN9PR03CA0923.outlook.office365.com
 (2603:10b6:408:107::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.15 via Frontend Transport; Fri,
 14 Aug 2026 09:37:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN3PEPF0000B370.mail.protection.outlook.com (10.167.243.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.0 via Frontend Transport; Fri, 14 Aug 2026 09:37:00 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 14 Aug
 2026 02:36:43 -0700
Received: from build-anrao-noble-20260527.internal (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Fri, 14 Aug 2026 02:36:42 -0700
From: Aniruddha Rao <anrao@nvidia.com>
To: <thierry.reding@kernel.org>, <jonathanh@nvidia.com>
CC: <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Aniruddha
 Rao" <anrao@nvidia.com>
Subject: [PATCH v3 0/5] firmware: tegra: bpmp: Add ACPI and MBWT support
Date: Fri, 14 Aug 2026 09:36:20 +0000
Message-ID: <20260814093625.1567353-1-anrao@nvidia.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B370:EE_|CY8PR12MB8314:EE_
X-MS-Office365-Filtering-Correlation-Id: 639e1bd0-d2e0-4a3c-c84d-08def9e7976a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700016|23010399003|18002099003|11063799006|56012099006|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info:
	ra+0/naIVQTrsEU3H6W9IAWHAVaY3ZIv5NgE//IchF7cYCUv/9PK+ULKjl0arht10iF6ft3yKR6wjm3HeAMS/5SFCrZM1CI2fxy6erqmmD+lajZNrH7xaayf9N/Zm5ecn/soCmQyfyCQnAYEGWO8nynMCK+d0qzslMifKm6Ki4hIZ9Z8ffXRpjg7I+NT3LsyQrhr5fl/b9ggtlr57LFOVMvcPTbo3xwZTjPRxGouwoWq4oQOSgSzJQFX7P/11rvw8elno1nm+ygHOk80GZo/ew/hF3gRIVSgq4zTCEeoMPJoNyKL3MKLtuFe+VjL1JezQd1mv5+MCIotMpN5qea8MilRntvyueavPByC5PGjxKwJCv9Lcp87kIDswUSRBptJs5CGOggwoYkV+ZCbXczkP0DUeHD/dSGqEvPFv4KQzUsemYPgOxJunq1n88IZ1yVfPZ9dDVjJyKY7YNsh9dIMkuL5RkAGSFRH+iGf6WL/6QtbgnKntxvdLucsFL2Q0hKQdVavVZKrol60tAontSNXvM+syVfY/RHXFYS0fQRpjkgwQgiUjtFpaVl5mskiPLryC+7JbsOUAEtCwtX9K9LfpbaGYJhoqLXToSwxur7k/Qk1abDwJPOQJ3F5eDf96ZA/+6l8reQ/77SstrwbZDHSBAnMu+HBblQGEY1FTKHFeMp5mm0V5swvjaj12VK2KVq4v3dm7P0sT8M6N9nbYk3UiQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016)(23010399003)(18002099003)(11063799006)(56012099006)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	uAxf3eLrKBHidiJVDmW/3Dl34+T2XwmvVKbMGMUD3LNCfHS1x20+RtpAQapFq3K/F5bHtJVQZT49BJ0z5A80DGJnLBjeMIYT6RyZaAwvw3w5hsomsIJWf3/vZZ1ASVztT+lDvlFzfBjYhunkG7ePch3pskeK24zYQmzIJfRXwF9IxGX2lXgECoXHudrJmw0XF13ZhlH4NuuVP3AtIoRaG7D/I4xjE+ho3M4sOGHfdZ3ICQeuCD4Cgm/K+49kERjzx6ylt4x4BeA9SufYFBR+nxvQscru6Iz1OFyragEU3AG8ZWB5KIpa1yeXWplXyezmrpNrGJ5GCjfOMbnRP7LGl9lBqRBVB+mFh3hhgn0NNkXg9ErrZ7PXs/RqO1/hv9nI1DvyGbDlwMUdiZoVoNiW6fShcR8ja2jtc3CfQwT4uogjfKowl2oPVXCcXGPx/BIe
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 09:37:00.4532
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 639e1bd0-d2e0-4a3c-c84d-08def9e7976a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B370.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8314

This series adds ACPI support to the Tegra BPMP driver and support for
Memory Bandwidth Throttler (MBWT) controls exposed by BPMP firmware of
some Tegra platforms.

The current BPMP driver depends on device tree bindings. This series
keeps the existing DT path unchanged while adding an ACPI transport path
for BPMP firmware requests.

MBWT controls are accessed through BPMP firmware requests. This series
defines the MBWT BPMP ABI, adds MBWT helper functions, and exposes a
narrow sysfs interface when firmware reports support for the required
MBWT requests.

Aniruddha Rao (5):
  firmware: tegra: bpmp: Move channel initialization to helper
  firmware: tegra: bpmp: Add ACPI support
  firmware: tegra: bpmp: Add the Memory Bandwidth Throttler ABI
    definitions
  firmware: tegra: bpmp: Add MBWT BPMP helpers
  firmware: tegra: bpmp: Add MBWT sysfs interface

---
Changes since v2:
- Rename the non-ACPI transfer helper to tegra_bpmp_transfer_channel().
- Keep the common BPMP message validation in tegra_bpmp_transfer().
- Remove duplicate message validation from the ACPI transfer helper.
- Move the MBWT helpers near probe and document why they are needed.
- Rename bpmp-tegra-sysfs.c to bpmp-sysfs.c.

Changes since v1:
- Dropped the SoC Kconfig patch.
- Kept the existing DT path unchanged while adding ACPI support.
- Reworked ACPI matching to avoid a dummy ops table.
- Added explicit error handling for short ACPI BMRQ responses.
- Folded MBWT helpers into bpmp.c.
- Reworked MBWT sysfs into per-traffic bandwidth attributes.
- Removed software bandwidth range checks.
- Use NVCLINK consistently in commit messages and documentation.
- Avoid platform-specific or transport-specific MBWT wording.

 .../ABI/testing/sysfs-platform-tegra-bpmp     |  48 +++
 drivers/firmware/tegra/Makefile               |   1 +
 drivers/firmware/tegra/bpmp-private.h         |  16 +
 drivers/firmware/tegra/bpmp-sysfs.c           | 205 ++++++++++
 drivers/firmware/tegra/bpmp.c                 | 367 +++++++++++++++---
 include/soc/tegra/bpmp-abi.h                  | 161 +++++++-
 6 files changed, 745 insertions(+), 53 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-platform-tegra-bpmp
 create mode 100644 drivers/firmware/tegra/bpmp-sysfs.c

-- 
2.43.0
