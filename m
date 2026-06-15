Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010034.outbound.protection.outlook.com [52.101.85.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87E3378D7D;
	Mon, 15 Jun 2026 08:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781512688; cv=fail; b=YVssUEqoP/OjYeAS8UWlGdjEnoyB5u2HIdtgSXRO98iI03q1nIKb8OYTdrfkstjaX2YaFToo5EBHExc0S1QbMtBhbN1nGAqmKh+kM6+tWjJ7jQLtDovlkxekE4JPh9veb/r2sebpTR+OL78lfktSNXQSnvGaXvTNqKAaKHVlGaY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781512688; c=relaxed/simple;
	bh=9l9d7Zacn/opVmY+aT+ujel6znCSVNkLnwUsnqnzzb4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WENaGf9I20RbCdKH6DbYenYsVM4fb4zY0S502OtbLvx+rP6+DKdWdBpiamxEPTX2D5vCDJp/cGzG3z/WwFV4I3hpjkHv3LtwAXLj9sJPnPbE4AudVFm+lAhUGlJ1vg0na9hZcW9HErL0LIBe03FH1kd4vwiasMqnTPd9r6QFw4I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=H5k3XGkE; arc=fail smtp.client-ip=52.101.85.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="H5k3XGkE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LFQEPT+oEkojwOvpmfuj2nIH1hWcxF1iLEmm1G6GhTWvsBdwBR8CAEFmuekLQWiH+zuBZjLOp2RFGLcVfCBxhx7BaRcQQn8gBC78OrxRg8NNaGb7/9r8/DoxBM2gJZLsXIk0I8YZWF5S9DPDK081F0w16kG3rY0OdcSrWuRl4tvyW600OYwE/AuLO1Kp0UTKNFfLlMossJ4dMyQYGN+Et2MaB/GojwePXzOntcsiybhlloU7Gaz9LJkVui9ACU3Ibel/dAUBbGWa9rIDCceG8/IfABn21HT+VBHrjSUXIIfM3yw2+4pc7U7uo4QkGvc+hCjhLJlraPtqLDuzqZu+2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Doih3XkjZIOA8m/ak9jMhfVHxvbGJpU3Lm7EHTdr2t4=;
 b=QYPPlt3myb8pF2B23jKOrN5sgoWjIKiaqyrfpvIb+9bH15sCFW7JazY9kxClIfjQf24x5feoek8siuxh4bky3e6nDowzc+OtbTJ31ZOqsunthEkZRETjZhr7m37fzK+wIM4PSXuzjeHG/aQDPfc7QyV5yCGLgjqhTMMH3U+/ZSmbZSyrz2nqohfOf9Vma05zq8iNPlc9SYVGnGxpALOlHQ+fDCYRPlHPiMLXqTh4RNrIECm1Z9WkYg4EpoElMK5otsHG1gZha7ySIjQzFm2+81ccS1vECXGfPwXVxgoGLJpRTh6qnaFPCtiezw85lb6PArs47RQs/FO73qTakUxLQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Doih3XkjZIOA8m/ak9jMhfVHxvbGJpU3Lm7EHTdr2t4=;
 b=H5k3XGkE8mN45us78fwHL/r8Eio7IuJfGMZfa1/HnmcbE4K2R8jkMHCQSQ0UZy/23rsxduQkOnifFRYbbPCvWIkpWjFouLdtXPLKXwBGUwo/3xuzRkU2537oHxrZhXZSSd6qwtxjwbLXhqJTbugKm/1U1LbvdRZ51xv7BEw+GlKVHZkSXUebkuz909kHd9LR9WRGV9sddWvaZtQ5ASvcxX1kcefWaBoGyDJATAjgThrKzFlDo6A5Gg7qX45QKWP2+PbVsWYWw6h1S3yH/693m0Ws1s0Cmv0iU9dhq9fgDjpxGIdBlITOHqPCRT6JR7dLaSiCwoKDOrwsNyTN2lgg9Q==
Received: from MN0PR02CA0020.namprd02.prod.outlook.com (2603:10b6:208:530::31)
 by PH7PR12MB5620.namprd12.prod.outlook.com (2603:10b6:510:137::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.16; Mon, 15 Jun
 2026 08:38:01 +0000
Received: from BN3PEPF0000B370.namprd21.prod.outlook.com
 (2603:10b6:208:530:cafe::11) by MN0PR02CA0020.outlook.office365.com
 (2603:10b6:208:530::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Mon,
 15 Jun 2026 08:38:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN3PEPF0000B370.mail.protection.outlook.com (10.167.243.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.0 via Frontend Transport; Mon, 15 Jun 2026 08:38:01 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 15 Jun
 2026 01:37:48 -0700
Received: from build-anrao-noble-20260527.internal (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Mon, 15 Jun 2026 01:37:48 -0700
From: Aniruddha Rao <anrao@nvidia.com>
To: <thierry.reding@kernel.org>, <jonathanh@nvidia.com>
CC: <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Aniruddha
 Rao" <anrao@nvidia.com>
Subject: [PATCH 0/6] firmware: tegra: bpmp: Add Tegra410 ACPI MBWT support
Date: Mon, 15 Jun 2026 08:37:25 +0000
Message-ID: <20260615083731.888055-1-anrao@nvidia.com>
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
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B370:EE_|PH7PR12MB5620:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f760c6d-b402-4d53-f51c-08decab96910
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|82310400026|36860700016|376014|18002099003|11063799006|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info:
	qJEz5L/AT/fzXYWXb4CCSBwf1mRobni0l0bPKrDbtKRtV01vETZvHw5QkLM7XFIBNWn9lR0jU7FFnFNMo0BvNxCnlvt6K2ePqx7pDnv0C+kx/r3LxiDN7rEKOBOhL35hmqzlcXbtd9UWW2HXE+U5cSTgQzXaM3lNUxeDW4tKIkzbLnDNrZKpo1Y5+8Y176c3rAbDwtlYqlCqXcUARoNm1+9fdlh65xzDcaZHRH5Am05dALPSSfeK9c/8Ul2cmnIbdXS6PR1FBjCydU+MRYoJJ8+Sf2ENfwxeG0zsrqZbk6ubLG4sDeJDn76SVD/OrnHnCpXMLAYvuLu9WYg4YapptaPL1mRMf5m3ENnM5UIqbzsLhAx0EWz1nFf0OucgqjBjzXm7OGKdkc3oGovWJ6SY/x/flKwGzcx7KAceGLOo285UTffDMYSvYGVCh34fOk1lp5WPEgOSWa/tOQrq0A14F+dfV7i5iNnWgEbCzg3fVcl/Y55196EwzCjClN7uayNCjdMJqd+OghiLvy+mlNL14C/I1KviHfnvmTBtrR8AvWFd+RPhjgrTu8sUJUC4/Q17wLqC/gBeGpeOIbxi9dHbVfB5dQqHtWdR/6sfciqgFQ7EqKv/KjE7ZsCqMVKu8WoeqRFXdPbaZslc/7yKHjh8d7CNikZOVrqdizebXEAcu+tNWEALSHcwRd8YPfQihH2FZwHeLSPMaO+kMTbUY9YaDAxELMwM/smpVyCfjNJqWCo=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(82310400026)(36860700016)(376014)(18002099003)(11063799006)(6133799003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	AIuZTrqyoVjX8gJEQQZaRK7+R0ogYePqxwybWcbOZJGTyRum8G0+iN0eBmqrsL3IECuyKYYsIKdRSyd6kIYdcQHRPR/7BM37UUlzjv+EHzOPhWVVb6F4PK8FtzOPxxnIcmuiN3q+gRtkOlGAkkKeGvtMYPrwJbAbVBSWAEU0wUeaLdbILFKP/ReLEl9LYT+dbnOzfwvEc3K07qlbdRAXC41KqfQtDsUm3+g6tsoQlLxGP3REOfMfRYXFTs/eL6i+bpuaUCSSsWTZPrA6egFIDn1I79foP/nbW9hBZR3UO3u6enDdFZVYrObPMIXxDj7LYcZ+aH6ZrQavLajv1PlzK7BtXWI/6LUGiLfQqwSpn2qu1AF7h/iU/z0hv3X3uYRXQ9I7cTRutwvKZz7QW64+mClCwaV4DnO2o/E9X8xyv7OyJ4XANlQP2xVowE9AoMEB
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 08:38:01.1812
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f760c6d-b402-4d53-f51c-08decab96910
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B370.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5620

Tegra410, an ACPI-based platform, provides Memory Bandwidth Throttler
(MBWT) controls for PCIe and GPU connected over chip-to-chip link
(Nv-Clink) traffic on the path to DRAM. These controls are accessible
through BPMP firmware.

The current Tegra BPMP driver depends on Device Tree based transport
setup and does not support ACPI-based platforms. This series keeps the
existing DT path unchanged, adds ACPI support to the BPMP driver,
defines the MBWT BPMP ABI, adds Tegra410 MBWT helper functions, and
exposes a narrow sysfs interface for ACPI-based Tegra410 systems when
firmware reports support for the required MBWT requests.

Aniruddha Rao (6):
  soc/tegra: Add Tegra410 SoC Kconfig symbol
  firmware: tegra: bpmp: Move channel, resource init to helper
  firmware: tegra: bpmp: Add ACPI support
  firmware: tegra: bpmp: Add the Memory Bandwidth Throttler ABI
    definitions
  firmware: tegra: bpmp: Add Tegra410 MBWT BPMP helpers
  firmware: tegra: bpmp: Add Tegra410 MBWT sysfs interface

 .../ABI/testing/sys-platform-tegra-bpmp       |  51 ++++
 drivers/firmware/tegra/Makefile               |   2 +
 drivers/firmware/tegra/bpmp-private.h         |  42 +++
 drivers/firmware/tegra/bpmp-tegra-sysfs.c     | 210 ++++++++++++++
 drivers/firmware/tegra/bpmp-tegra410.c        | 108 +++++++
 drivers/firmware/tegra/bpmp.c                 | 272 ++++++++++++++----
 drivers/soc/tegra/Kconfig                     |  10 +
 include/soc/tegra/bpmp-abi.h                  | 161 ++++++++++-
 8 files changed, 807 insertions(+), 49 deletions(-)
 create mode 100644 Documentation/ABI/testing/sys-platform-tegra-bpmp
 create mode 100644 drivers/firmware/tegra/bpmp-tegra-sysfs.c
 create mode 100644 drivers/firmware/tegra/bpmp-tegra410.c

-- 
2.43.0
