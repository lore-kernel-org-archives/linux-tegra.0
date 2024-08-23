Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2040.outbound.protection.outlook.com [40.107.102.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76501922E0;
	Fri, 23 Aug 2024 21:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724449821; cv=fail; b=c67pOhPD8rSPaKCTP3vYUWhD2vN2ahp+rvQxDbSg0866eDS/vX0ohC/O2Yx0J1VdZrHEZ9D0I7b/9716UroHzf60zJnlLEo5q8xKaFNztr9dBHJjNZsqrNypnvXCl+KjjDYEsBvKFMpDdTejOnmuMfrcNYIoens55XmQKtJb9cI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724449821; c=relaxed/simple;
	bh=To6inzjkEVoFlSlnRw4pPxSCH80TxFAu+r3HadTSMTI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ia8lLBT9FkXT2im+62P7nK3CQ9dcboEzKHedsItYTWp3e8YjW8++DiqGNbGW5VB1IOf9Pd7j5sHryUm2RbRCoGJWSekIDGythYgotd60RPU36GSCnt17bPVoJ3aaIK3x83Nm0hgdha4RQcTd4e4QiU6lX0VT6ZeE6nX4FxBp9QE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=BiiqNx9P; arc=fail smtp.client-ip=40.107.102.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="BiiqNx9P"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TEhcS/Zn9n/uoJB9W7YGZ9+Y1J75o3uSM/nTOeoNhDf7/2DYg0yeAErAKaYSpqza8WlkguavT6VK6Pk5MF8gO6TU+yT1FjWnjaFk1KkixSNc1kuA38urLLarpGfPDayS54+jx4fRgGUlZbyVIDun4o397C8RwuHs5IH0+DV+R/+QeIBv2rt9Y06DxYhm4SM9bKESpjf2LGUxss91b09+TcijIaC2xNdhvkacm80vijMMooK39Yh82ajPpk3VT0tKG55mmLJq/GjmlBmDSkPqpHV7p1IK718ulaLSa4pOrH2cj9UXarvGcCFULPw4A1zlvVBoWg5u0spcrw7oqHsJ7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=veII7E/GoFNdk2euxjbRX6opfxFCIKgn/OvcMsOV3CQ=;
 b=oezJZxd86t8KNQJkKwML3FiCJ7wrs8FsVVglaKsHyCuTHsA1iM/RB8LYODOf/mNC9K320erK8R1xK2kkBTIGWXJvotJEIZJ7EEhfumc25cvOnV3D/FsBRN7Gf5wcTCOg/+vF77m1d1qRr9nQZBFivuepqi7+f/Pl0Huzgzy3EvD7yCNJ8K6dTNcZ4wnAvu535cPjMavn+gHe5+aSqYllV2WOugGY9j63vAyQnbYKJb/2OD0sT0GiUHlzUs1r0X/xU1YthmpibR+M/BWjceks0uFLNcLyhg3SM9EtcYHomJpifsM7ZnmkRr6yLEdBrMS9wwmJdJJuS+yByUy9j3kZcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=veII7E/GoFNdk2euxjbRX6opfxFCIKgn/OvcMsOV3CQ=;
 b=BiiqNx9PrfpzcXGduysbQFhxOSCYINewh5S1L+VqWwn/6PuB56CqPHgfl1wlzwmCR4F0fC3IzUNruz4LTQIZqIbyEXJj9xSa9QbEot352E3Z/gKiycfreJ8Rm3mhfOFyTEMOgAdPzPGFiaXP5i5q9iuXihqRss4Wa2qd4txqiziOjZ+I5hjlbJ0YptPXKHgQB9oLhI3w27XGSLgSbXu1DDMegCy4EKfm8vjr7kPYqngmVVuOsFqN4HgepsDEOdua9w5ywSh3xfSuSY/m/uiODgPmbGneLsTvo6hV8cBCyp55TTOY/P2kHIlnzSJQ5WCd9hNtbeydTmMbt0t0vT5WgA==
Received: from BN8PR03CA0020.namprd03.prod.outlook.com (2603:10b6:408:94::33)
 by DM6PR12MB4452.namprd12.prod.outlook.com (2603:10b6:5:2a4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Fri, 23 Aug
 2024 21:50:16 +0000
Received: from BN3PEPF0000B074.namprd04.prod.outlook.com
 (2603:10b6:408:94:cafe::e5) by BN8PR03CA0020.outlook.office365.com
 (2603:10b6:408:94::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Fri, 23 Aug 2024 21:50:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN3PEPF0000B074.mail.protection.outlook.com (10.167.243.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7897.11 via Frontend Transport; Fri, 23 Aug 2024 21:50:15 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 23 Aug
 2024 14:50:06 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 23 Aug
 2024 14:50:06 -0700
Received: from build-dstotland-20240703T000904114.nvidia.com (10.127.8.10) by
 mail.nvidia.com (10.129.68.10) with Microsoft SMTP Server id 15.2.1544.4 via
 Frontend Transport; Fri, 23 Aug 2024 14:50:06 -0700
From: Dara Stotland <dstotland@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter
	<jonathanh@nvidia.com>, Brad Griffis <bgriffis@nvidia.com>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>
CC: Dara Stotland <dstotland@nvidia.com>
Subject: [PATCH 0/7] Tegra234 AGX Orin DTS Updates
Date: Fri, 23 Aug 2024 21:49:50 +0000
Message-ID: <20240823214957.771297-1-dstotland@nvidia.com>
X-Mailer: git-send-email 2.17.1
X-NVConfidentiality: public
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B074:EE_|DM6PR12MB4452:EE_
X-MS-Office365-Filtering-Correlation-Id: f18062dd-6d9f-4e34-90c7-08dcc3bd92dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Z7GnzoF2XtPRevqqpXRR5CPiAdhCjtiFUOVVtheh7/K5JNdTMZ0hu5A32dIo?=
 =?us-ascii?Q?/FV5oQd0xFWDWTE8awcnCz5KavmWhDxLTWB9xVSPUGc87KOQGGujuGaCSDug?=
 =?us-ascii?Q?5+AkFJT8+FqJ4WOEWbVFp6z9xvfWAEXJBYQP6VFNHtbZLtzKiMlJjHO25HTB?=
 =?us-ascii?Q?l3denGfq3efq6b05Vunr8/UzQJ7v2DYrR2CDov2Iyvzbetrh6JkVxhbJDcR/?=
 =?us-ascii?Q?B8gASBVDkXcSTu3/bQkxD5O/AmEZ4vsKMwoICJGbgrUg0DFrcgzT61z7uaIm?=
 =?us-ascii?Q?KVdX4CLAvoaZv2DLI8z0PanFttzNUqvFXTDnm2Hs6BFt2HOa50Lep7J4xeBD?=
 =?us-ascii?Q?WsP5sXk+/Fd5rm5q7wEomawo2B9bfMBuf3aIUfI5zDnWX6RHbDhQZG43ZaUa?=
 =?us-ascii?Q?qZY5XmHArGw4ZkUP5/7Q/e47Bjn84X0ojN6tv4IqhYbbt6QbINXbgEuLz0xD?=
 =?us-ascii?Q?hOV3WH3c/pnbn+i0qvyh3mY0OG01Np8b0RMtcO/cCJGnPGEpsnxrwQNsDbtw?=
 =?us-ascii?Q?dwQ+p4meSsSSZQis7dF/tvEx55dW6Q6+3x/YcyA3LTKlbQTx8MjMcsJD/DRp?=
 =?us-ascii?Q?+vO4fL6z+cs8EsMnaFaRy+rGYoqb9XeBMqzN9zCftV/QRU9MpCAGVTWdXPqO?=
 =?us-ascii?Q?juDS0qcw4zoueKrmp16bro9g6wiusbFRCpLMSEmeiWow5GvrvnogZuhKl0SP?=
 =?us-ascii?Q?Hi5HW5dJ1CVoi627+sOO3pTuEUqAXMd0PNx9WSfDOo4B0tqMtQkwTdJsIOEq?=
 =?us-ascii?Q?UfiArMTzKU81d1Q8sJmhQnpRx3+sO1tEiVSYIRCgL3m6y8+xRXu7CJO7qugj?=
 =?us-ascii?Q?03geyYAo53VIlQiDqiXGEjiIUW5vqmAcPf3l6uJthIvp7FDGqLiRNf5pEnF0?=
 =?us-ascii?Q?BPiXm+mhiTwU+WnyNvgRb1Ht//7IEDb1Nt7RiuNRBUeL7pdMEwb3jFYmv0l8?=
 =?us-ascii?Q?jZZVCXwDh/CylwTNhx+kUKZDvdl6RaUoMU3NWZCj6p3nEqHiV4C/H1G+ZFr6?=
 =?us-ascii?Q?Kpw8PiaEkycl2isFFYvneU0Si2mibnrbOylNN0HbMCOKuVLcQZPQJ2Tubacg?=
 =?us-ascii?Q?Ap7vy+hr8dXPuYoGw8iAGxamNjWEIuxsEHCUNja2d9kRZ+H8z01OLVd3P54u?=
 =?us-ascii?Q?IrQicbKpgLNkCbWZOrd3pGw7dYzA0HtWdckvQ2xeeUe9f4fFrkdb04//GYqh?=
 =?us-ascii?Q?bAtrkZpJ+E+72WSwb5vWTPSTU9Sx7/U6G3tkdrhgVw38wGuQ01rVaLPbRHM6?=
 =?us-ascii?Q?nELea2I9kG0KLhL+lIUYy4kTMYd0QT4RF6xslrXj5zfn6muTXjFmlTRvd50d?=
 =?us-ascii?Q?C+cN+s2B48yQQn93ySOw1EiLvYYoxTOhp1+JDBdvmfqERnD1YM9Ed6BD9A44?=
 =?us-ascii?Q?Lt/8ElV/4tQswdytkQ84yA/RwzFdL5KHMXIBUiOgBkUNeQy2M8gfp6fmq4DN?=
 =?us-ascii?Q?27ft/9k5GnjaPbVGC7qOG0IyDJgNHVud?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 21:50:15.7965
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f18062dd-6d9f-4e34-90c7-08dcc3bd92dd
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B074.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4452

This patchset restructures the AGX Orin device tree for improved
adaptability. It also fixes the placement of several nodes to be
in the proper files.

Dara Stotland (7):
  arm64: tegra: Combine AGX Orin board files
  arm64: tegra: Combine IGX Orin board files
  arm64: tegra: Move AGX Orin nodes to correct location
  arm64: tegra: Move padctl supply nodes to AGX Orin module
  arm64: tegra: Move BPMP nodes to AGX Orin module
  arm64: tegra: Add thermal nodes to AGX Orin SKU8
  arm64: tegra: Create SKU8 AGX Orin board file

 .../devicetree/bindings/arm/tegra.yaml        |   5 +
 arch/arm64/boot/dts/nvidia/Makefile           |   1 +
 .../boot/dts/nvidia/tegra234-p3701-0000.dtsi  |  52 --
 .../boot/dts/nvidia/tegra234-p3701-0008.dtsi  |  26 +-
 .../arm64/boot/dts/nvidia/tegra234-p3701.dtsi |  40 ++
 .../nvidia/tegra234-p3737-0000+p3701-0000.dts | 440 +-------------
 .../nvidia/tegra234-p3737-0000+p3701-0008.dts |  11 +
 .../dts/nvidia/tegra234-p3737-0000+p3701.dtsi | 547 ++++++++++++++++++
 .../boot/dts/nvidia/tegra234-p3737-0000.dtsi  |  90 ---
 .../nvidia/tegra234-p3740-0002+p3701-0008.dts | 230 +++++++-
 .../boot/dts/nvidia/tegra234-p3740-0002.dtsi  | 248 --------
 11 files changed, 851 insertions(+), 839 deletions(-)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0008.dts
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701.dtsi
 delete mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3737-0000.dtsi
 delete mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3740-0002.dtsi

-- 
2.17.1

