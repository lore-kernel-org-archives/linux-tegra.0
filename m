Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010039.outbound.protection.outlook.com [52.101.61.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14B63D952E;
	Thu, 10 Sep 2026 08:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789030806; cv=fail; b=olH/7XfuUFicIYRHHm9+XXSeu8ZK200XF9eolclPW587dRZhGT+QZRfwTXGkd7sNb3IbwaNhrcIPmrWj5cqNpiMT7bVYg6fO+78zg+WW22V8uAGlgAA5jA0WAvq9AGLEHMT0duOXnReLUTF4bqt6fJr02NirW2lgbulCBTF8Pes=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789030806; c=relaxed/simple;
	bh=SfGJS29mC6sE4XqHHOkwahec+HzNV+YZIzr0EkFoVPc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YO4L/lsGdeueZGbP8pANzHI3ZbbkMbCh4PKJkkTU6fvHAn/M2hQPe2C5n6of2zh9YBEuyzR8+IHrkmeNMlq9MYDm98lkc+CeQ0frCw7sLxREJI55B7FUic9HwFMGEn7ZwFCixySXj8UTrjzU6NhUwu7f5xVEmz52y7UJuv3YWZM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=IYEkLJVa; arc=fail smtp.client-ip=52.101.61.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="IYEkLJVa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TfNYlf8tkV0VJ8hdjmIdPwII7ju9N02FAClOQaeRHF3DKGn3uBKY6Dmf4EKOjKE7AMamQIYkxaZLYygCxfCjEXVnqiH3paLKMnJSeODaYnCt66z0NElVD9//XPbSQG3nx+e/YJ0Clt+oq+MunHglpnhAHuk7imxvw6QS64qxn3LqiKQ+GPvlifL8o8VleFsnS9GPN3Qbqtkom6d6oYiIUTFcXSjA4YGm2TtUhelMvrOH9U8Zcm3Qas6gQX1nk+KLWZm2a/X3SGQwKqXgqawPYiElbMuOXkFHkFXEN+oj8p42v+mFbrSiyLC1aw6373U44cJqouJ0of4a0VZAZDdZJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=viBLihiH0giA+BKj/od8WiuXs5HFcETE5LO6/XU76Rg=;
 b=EB52LBlZNzFh8favec1CGbTWH3LwRI3evNU1vbE1K23nxs6vR61wJ8vS4tYHb8wiPEa52CdxRshOPGhqMVHrHVKUTi49R3UpUMYn1aHFOsJh+6jhgCqXwF3QiorKQtAnXdk0IYaoo2cUTwAKI9BJgr5jaZBuuWouYSXf+JHjIgPIGWwnw5HTU+ue0dXh09zMNcIrZHJAd/YSYVJnoV8rxwzPRb+sKAisZnpIGQBmgauVI8ee4LZDDqvkeZemapQgy0sXAXEBewuUWtT/JEX8mxK1rkHVWBG9axYLDpQJEQ4UEIHssZe+iJjsWhjMRY18+hhbdV0W6uYpNC2cMVkfPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=viBLihiH0giA+BKj/od8WiuXs5HFcETE5LO6/XU76Rg=;
 b=IYEkLJVa/vXChX9u91xuqUo5eIwe6CVpKi6+fv1Q8n9joWmRKvNcF+PYtgm6R0wDjl3B6ltVEuCiEGlORdBZrviTeJMRYRpLmjo30y0lmoXYA6cP1vUPXOUIBc/DJ5bK5t9MVBGAJ3RW1+it8Mwx0OdU6LLN2uxlAWtGabf59wKOK/3tQSOyO3fUek5IIkiRsxEB3qepaeu7qksj3elQicIvfROsk45VuB4MiZFaMmHNTNbda3Xfu388Vy1palDxAT/N4V/aUaCMr0BsYfDqLgVfTpTs0dPe94MSV/cn3UFKG71PKLiO4SD2/72Vj8qtnpbtOAIcFOMfDvKbvcckyQ==
Received: from PH8PR07CA0022.namprd07.prod.outlook.com (2603:10b6:510:2cd::21)
 by MN0PR12MB6175.namprd12.prod.outlook.com (2603:10b6:208:3c4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.8; Thu, 10 Sep
 2026 08:59:52 +0000
Received: from CY4PEPF0000FCC1.namprd03.prod.outlook.com
 (2603:10b6:510:2cd:cafe::19) by PH8PR07CA0022.outlook.office365.com
 (2603:10b6:510:2cd::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.9 via Frontend Transport; Thu, 10
 Sep 2026 08:59:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000FCC1.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Thu, 10 Sep 2026 08:59:52 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 10 Sep
 2026 01:59:37 -0700
Received: from build-anrao-noble-20260906.internal (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 01:59:37 -0700
From: Aniruddha Rao <anrao@nvidia.com>
To: <thierry.reding@kernel.org>, <jonathanh@nvidia.com>
CC: <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Aniruddha
 Rao" <anrao@nvidia.com>
Subject: [PATCH v4 0/5] firmware: tegra: bpmp: Add ACPI and MBWT support
Date: Thu, 10 Sep 2026 08:59:14 +0000
Message-ID: <20260910085919.2522241-1-anrao@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC1:EE_|MN0PR12MB6175:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c7fd0b1-03c4-4a32-a800-08df0f19e087
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|23010399003|376014|6133799003|10067099003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	0lHQWJ4N08m7e0JVbg8aD10CK55ly4/ItXMxnL9m32DSN/ecbuQoIEkI5ZtWawiEZTcbEBVfGxve4iKCqWLao1sDcl3ap8qsyHQdHKI9CjpgSZVFW0Pd5ATP25mtuqglpvU/rr8xvvQZuC+ZVwKN1ud0lXHg0sT+FEyhwSnTT4s/gElVk3zoH/xXpcGEctYWMzUKOEXV9PMGl1o21WVXSiBUeNzIiV8PE2EI+iCasa4F0xPdLtdzjJGjaY0Vkc+lsvR2Q4/nINQWg0oJR8vsZ2nLmY7anvnt/aUi2/pmmb8oe/FHhrIrO390/DuLRoWwukFTYCrRNhDyNKmD+sNebAX8A9jmYZJMyM15ZsCDQBhyhai0/5hCxfsInexTV6FL46TJmM6bHomzyO/7FdJrCyJNMmggK7EV4p6CNYlT+nwxKIz9cCDuxIsfSIznJ3v9Jm2mS3/2lJaMFFCmKLHdwf3sEnPe6s/u55a05cV1j6l5Tw7z2NV7uW7+zTOnbYOQiBXUa8aKFjESkrlaO+Nb5CODomKH5RrH+T7Dos38oI1P+ZXku7sU1qXcJGerhrqFrDh77Y+LnNeHJwbp/oQkWWRcTuBmsx8EZJcWZX3LhXuuVilINh/9BVXC4Kepaickj/He5kF3qxAdT/qbsnpTyYl+liIUR7v8YhyWk4Nqs8krhSn784ySaarsGWrUAc61hCktzGuqp8Uj5zFUdTemmA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(23010399003)(376014)(6133799003)(10067099003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ENDpNxLCLUheVtHWONtQk/rAReIn1t59xIrjvLTY+AjffaMX/AIXrQVfYsk1pEYYUEXzNlPiw0n8S78bD7O1RzP0SGXmmLY/cJgpcsMmh+wOpletUXQ6ibCFpyP3FyxcNzt8An+SBhymHCMpTO68GMczBkx/qR6qPrxiIzdRGC4+1arXrthx6k/s+hITsforbEsSDao+Kzzx1kmY7QcKRu7Ax/A3otJe08i2XnMVLrw689/lJ85/f9u7igWc/MZMCEJtQwP5v3ACPV7LWlkuh8MifMrKicwYsWgAJMM/SruPh5gosGg6PSHXXTCMphOslM1omR9LjKbtMQIqERCC4/j9nHAHDA2yejXHtSJ4wUVl+H0y/QTs66m3TAj7F/7g85VXMSHSiGnGyxc21iiEo24rPVX28Zxj1pLZQkzziITVbrbIFwuvWCS3Av6adTsN
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 08:59:52.4440
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c7fd0b1-03c4-4a32-a800-08df0f19e087
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6175

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

