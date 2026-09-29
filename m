Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013015.outbound.protection.outlook.com [40.93.196.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10014FD7BE;
	Tue, 29 Sep 2026 09:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790675999; cv=fail; b=AJq8vAc+RyWdhvWjzLsJYDvq5afoGEH54H3YVhOoS7stXdPyOO0GXU+uGlELUo9YdhSK3awy2Oo4xr8wSEDZNG2pmSMDVlU6ERhmCSJDvhLfiPI+qniShTBvIkedTlfSyagaHK3vzp80zJynQI/C3YvpjfdqCcxRapisryPya6A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790675999; c=relaxed/simple;
	bh=28tEVs5Ly43A9athii135x+PZwpW2eQ0tF51krLCUzA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Sqmsiif5p0R739X+EaH/vTfb/KR/L3Td+t9uKrPiMj58H6g4iqkUWAq74RPYMV5Gtd/JbJGIkVIu0SEAjQ0g+xZzb4PyeChf6k3Jcu91U+ZAq6lp80S6PSzTCgUv/mXEr366pidxwJy//Z+2hvhB7Ck10zynxPu/CByB1P/oiXk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=gL8n+ODK; arc=fail smtp.client-ip=40.93.196.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="gL8n+ODK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jZN4TTa5NtWEyoXcC6xJelTWfCRYTof1axYqTxvciIfljCgx4tCVTf99p37NMnTQ3r9iuFWo51S6lUmMYtC+WX+iCJFpDf6GKEUwVvx89gXlLlUcqlfWh9D+FxckXbOEl550h+twDDYzxFFtSVykRIfSIB/kw2GjpID96JlsoVnPDA1Rv5tfF+jyPiiBzOgU8EtYdfgMPxOrOGufcc7dtJKnKukkzsFrEHZaI3bzwVIGddB0SLr1CNT/XVgjLxy9KGgDNzeCzfbP9jnyfiRFwm8Ueyd6A3+QyRB83BOkD61xO0BEdVT1Qy6D6OsgK7f9BBEeZSoxXRf7Tki74rYjvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xwxaqKJYujdvRz1ajDjU0y+/a7Uor0wsCBhSQz7LuPc=;
 b=LrcBajKlNsDHOj76nN9bQJzqT0034EqUeQk5f3Tl46J62jvtiEwCQMOPH8GngWC/JlTmpEr1Lg16958ql0ti50MdDS0ZtOVfWmE2v/1Rue7j6s8WfnwfhPh46fjGfihaCYR3fcpOuzoMEUIkkZqrVPp3Zg3D+DbTPdwn14ne0BFKFsHqt52EugJdPJ3NzkeBpRuMff2esrcEZ00zvyqtXLJqsqJUDN51/wEXv5Eu++QqQselXfrPB8Pt7B/jj7wBYWOZGuCrtvY8tJK7Q7VyxiBntIZI6cRuh/X6/7wtfGa3fFY0zG9pV5Mvsn42G4XOxCC/8w+HbOQEnwX5xpBHcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xwxaqKJYujdvRz1ajDjU0y+/a7Uor0wsCBhSQz7LuPc=;
 b=gL8n+ODKl0N5bVLUlzR10zkoQA2bt4q21VAPhQvr44TgOt8Q7M6facZu4rRZ16aH7e3d5u+4HRWnaRTbvqu57fkLL9WtGxsG98KOVpdpFNZSobk82DOT0rHOjkmTpnKzZTI075R1v0UufdR7spNkoEGAQ2kzxtvusDUZBdG51n6+LM+5nvEtXmpPdNxa569Em97w1MEHhzkuRshtLfreOwm2LZs1yKOu7rt+eRoATbdZQiPaZqhyJwixX62mIo8/0yJs5o+S80dYgAQJuPmtq0lXHnM9y75BVqmuxPsA7eixhC53UtstaZ/aDOyBovZDUtzRvMRBnJFML4eRwNlw4Q==
Received: from DSZP220CA0012.NAMP220.PROD.OUTLOOK.COM (2603:10b6:5:280::10) by
 SN7PR12MB7275.namprd12.prod.outlook.com (2603:10b6:806:2ae::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.24; Tue, 29 Sep 2026 09:59:47 +0000
Received: from DM2PEPF00003FC6.namprd04.prod.outlook.com
 (2603:10b6:5:280:cafe::36) by DSZP220CA0012.outlook.office365.com
 (2603:10b6:5:280::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.15 via Frontend Transport; Tue,
 29 Sep 2026 09:59:47 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DM2PEPF00003FC6.mail.protection.outlook.com (10.167.23.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Tue, 29 Sep 2026 09:59:47 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 29 Sep
 2026 02:59:32 -0700
Received: from build-anrao-noble-20260906.internal (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 29 Sep 2026 02:59:32 -0700
From: Aniruddha Rao <anrao@nvidia.com>
To: <thierry.reding@kernel.org>, <jonathanh@nvidia.com>
CC: <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Aniruddha
 Rao" <anrao@nvidia.com>
Subject: [PATCH v5 0/5] firmware: tegra: bpmp: Add ACPI and MBWT support
Date: Tue, 29 Sep 2026 09:59:10 +0000
Message-ID: <20260929095915.2215685-1-anrao@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC6:EE_|SN7PR12MB7275:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ea8eda6-1aee-4065-7ab4-08df1e10653f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|376014|1800799024|82310400026|18002099003|6133799003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	RPqcrAW+5m5b+6g23nX6ZgxDmGJgDJMJXtQPnsgDvHkLN7YiRReLcKyO4curb5EKfBuwsPA3PXXZhe6QQSxMkikXc8nPR1akMXjEAMAvVfCukMmVyIYzoiuQQpSAIuXUn6FAGnfHrWV4RKC9tOduiv4Sd0zS/7ZA87XF7xV9JStL27+EE9TaoukguLel2nt5+fpQazgMIJF2p2LgySl+B80WMcJNjTywsvF7+Cmoy09PUiFGELINizRR33dEFOQHXEyqfr/GoVUPLZkvWz9B8IQESjVHEWtjOhj7/wDR4T0u9EVboWixE14VkJQazdBGTdtB9wWJ4+DuUhtC06xO+c8XxpwMbkgAjRVochaJNHbdUWQ8H3+lfac9E8Rwm83Ey1hRSe0dRTAbocJjfsL91hWhhS061J09nuqUjhbkrNyYv5AT6rNQ4EQZQ+66PkNo8OtjieJsT81VXDHJ34l4qu5fGkPZ6cyuRrYFuUHLST0je06MybDjjA4qOnTjBt+pnKVCeog21BSghksQVJipYbg3eWblWtjcwvEH4nJL0IY4c57qglefyZUgvSz7bGujP6X5Hg+2MY8TGp7ZZW9pMd5LzrVRKZDC8SUBtGvbPZTdkmHDHqq5VBmWdqNLOa6p2+zZ4lhBnSmcwXglG4Ckvpw9QsEXntNBhWSywK4CbvsFX+ikG6MzP6WqxrzCU6yQTasCdksNPZs7nn0EKp3j2Q==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(1800799024)(82310400026)(18002099003)(6133799003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	oB22F/JfxBKLAT1kzA2OC/O6cO25+EGEiobMlSGDkhuJkSEAcK6Q5qGVlxJVUfFSYl/WsiI/RQhpe7o0lbozTBd5Du0ogFnZNZPQs0/LCob7xjDU/Tcf0DBF3qo8Ke3IE/OKB2gNBVStAHMlw/8fiHRO8zbh/eI3bLukwYRuSnsQPuDI0T3Av9NPFaM3LtIivzhkqigpIQw6b38BF9Lmh3X369pFBinEOZ9xBnskMdyvZxanVNBfuGb30Cj6xHpnNdnhvo8Ot2oDFw5UfxkS/BkVvjgPN5E2C+rGmlguPRkaWyzhNhYTCeXsw/41gdMckQc4GTo5WwXryyDhJRbwl0eal4VF97FkCASZ84hSvnJDBMtBzzE1LFKSS3Nhueg/I1GH/0uyxm+oqo0Sp8O+EOs+5f4iDkp913e/zGNyqvYHjgHSOVeFTgsdW8AunwZy
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 09:59:47.5364
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ea8eda6-1aee-4065-7ab4-08df1e10653f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM2PEPF00003FC6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7275

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

 .../ABI/testing/sysfs-platform-tegra-bpmp     |  48 ++
 drivers/firmware/tegra/Makefile               |   1 +
 drivers/firmware/tegra/bpmp-private.h         |  39 ++
 drivers/firmware/tegra/bpmp-sysfs.c           | 207 +++++++++
 drivers/firmware/tegra/bpmp-tegra186.c        |  14 +
 drivers/firmware/tegra/bpmp-tegra210.c        |  13 +-
 drivers/firmware/tegra/bpmp.c                 | 415 +++++++++++++++---
 include/soc/tegra/bpmp-abi.h                  | 161 ++++++-
 include/soc/tegra/bpmp.h                      |   2 +
 9 files changed, 849 insertions(+), 51 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-platform-tegra-bpmp
 create mode 100644 drivers/firmware/tegra/bpmp-sysfs.c

Changes since v4:
- Move BPMP channel allocation and ping setup/teardown into the
  SoC-specific init/deinit operations.
- Add an optional init_providers operation for DT child and provider
  registration after BPMP communication is established and the firmware
  tag is read.
- Add an ACPI BPMP init operation for the BMRQ ping path.
- Remove ACPI-specific setup and teardown conditionals from the common
  probe path.
- Drop the redundant NULL check after device_get_match_data().
- Explain the transport and provider initialization phases in the ACPI
  support commit message.
- Explain why DT registers an incoming MRQ_PING handler while ACPI only
  sends an outgoing ping request.
- Describe MBWT bandwidth groups and traffic types with platform data so
  firmware instance and VC type values can vary between platforms.
- Document the sysfs hierarchy using platform-defined bandwidth-group and
  traffic-type names.

Changes since v3:
- Update the sysfs ABI Documentation date to September 2026 and target
  release to 7.4.

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

-- 
2.43.0

