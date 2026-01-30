Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010064.outbound.protection.outlook.com [52.101.56.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A22339861;
	Fri, 30 Jan 2026 17:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769794290; cv=fail; b=jOHN94EexxnUe24MvXdT1eZ0F2xqeTZn/Ex2Leusl+l8wNynUtLxkcfCjkFrgSzDd3SNAWYh/ct8V+uzNXLuaFu7BOhgbAm65LYM3ewA64m5YHq9UPVaHwutw7sxHMnjPPM0taqEjfMgw1dV+n7idE0taRb3RH8RLW0WgsJ9+xQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769794290; c=relaxed/simple;
	bh=lHDp9ER2nsRLKC/gYfQ//F+/zxChTGOfzsV5NISLuxk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=r4rEIQsCV6G5cA/w0P8HuSMG4fbFYQDNjPKM28ktM6cdMT9nsuqohwmIZiVzFaWCUTkwpmvotYY1U8athVC0E1CkCT0Kw8byimsJK+LdByhf+Hj/UEe7LzaJAMHKGlC0bu2dza7FLVAK1xaOCOqhXHjEBSj+T+6fjOIHcibaqEU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=q+U6awHB; arc=fail smtp.client-ip=52.101.56.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="q+U6awHB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YM8rWQRUpMrEEFIE+MynjwF1DP80Ajif8+qqpLSHueTCR/V/QkKNTuWkXHoHaKTcAhJ/Om6mGSQnSpr83sgLQY5jU7ulhlNnp1JioD6zm8gWOuaxpta1REV9dKeXaYYCIJCX388uyMVq66T2hxlqZN3D/GomQkWWMJeMhHWdzWPlavaRErHVa+2xcxBqWCjCWu23gsbqgE85z6v+mCYqCqZyJTe7IyLYEII2yh3zMJGPWY05SofmQNXK8mI4WaM9pWo8IhWuIDumtWmWeJlAc6w3a4JYyYzVrMHXqUKUSTNf9Mc7S/q7dD3d8/rJmqHmAnRPjsx3y04R1/+u4JSDZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lKSFSC3wWQAmoFjG10Sa+YDcMzvPS5d61C+VVm/0rZQ=;
 b=B+2IGB8sJRQwfeHEVwc/fhhT1fvTnkq9WKbh+wPbGZWH8K3KJr4XxUCbc2ifeYA42CGI4GltkfrVU6/ZVLDbmIGNQZvQ6tptuVigjwC9v1XdnRuopQviH2ep0kn4tmOOaytO9MKTYnW/UPh81QY20+vJtG6hYQ4ibcDXs07+ONUDn96SCu6vbC/ZqH6nh+Skf4dnv2B3KB7MY4pKPb7WXdLqbtRNvCF0keFNzpwvJPlQhNokGECNSWhkgszlhdexp7okhzVM1HU+OWRjVlMOqc1XP37h+dnFXOoreJB1tOvF6Xd0yfDMaDFkYkupMT0LfIyKm2jpmxpju22lSJGoNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lKSFSC3wWQAmoFjG10Sa+YDcMzvPS5d61C+VVm/0rZQ=;
 b=q+U6awHBMZSLOLKsF3O2UT5QH+wcWeG16MdVD6iFsgbGHDoxHKGUYz4DjhNqMzioef8uO5WSqvD0L+FxIHQUYfry4Am7NJE9dJqYTzwvfwUrYcJUIwd4dZzRfj6btIdGNI8E4zgRZoH7gaeeMy+phb0N4flcLmA8YhoaosG/54uGU+vZOA9kczl/XkUFU1wZX9dUKfgkITDJu1v3KtJ7nbsCvj9omOzEFwKrTKWnnwn/UhmTpmMPD0nbl6FiPVLJHVevskXecmFAVWwUVnDZFxzxf8w/wW+Tle/0fFnwaevh0U9EFLHIs2EMk05N76Jvyzu5+fUC0SeHOQjn6Jizbw==
Received: from SJ0PR03CA0266.namprd03.prod.outlook.com (2603:10b6:a03:3a0::31)
 by CH1PPF934D73F2C.namprd12.prod.outlook.com (2603:10b6:61f:fc00::61a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Fri, 30 Jan
 2026 17:31:23 +0000
Received: from SJ5PEPF000001E8.namprd05.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::7) by SJ0PR03CA0266.outlook.office365.com
 (2603:10b6:a03:3a0::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.13 via Frontend Transport; Fri,
 30 Jan 2026 17:30:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SJ5PEPF000001E8.mail.protection.outlook.com (10.167.242.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 30 Jan 2026 17:31:22 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 30 Jan
 2026 09:31:07 -0800
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Fri, 30 Jan 2026 09:31:06 -0800
Received: from build-ketanp-bionic-20250813.nvidia.com (10.127.8.10) by
 mail.nvidia.com (10.126.190.182) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Fri, 30 Jan 2026 09:31:06 -0800
From: Ketan Patil <ketanp@nvidia.com>
To: <krzk@kernel.org>, <thierry.reding@gmail.com>, <jonathanh@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Ketan Patil
	<ketanp@nvidia.com>
Subject: [PATCH v6 0/4] memory: tegra: Add MC error logging support for Tegra264 SoC
Date: Fri, 30 Jan 2026 17:30:51 +0000
Message-ID: <20260130173055.151255-1-ketanp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E8:EE_|CH1PPF934D73F2C:EE_
X-MS-Office365-Filtering-Correlation-Id: aa684325-da9f-42b8-b9c5-08de60256350
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sTgGogtY5PH5jUgqM2dynE316JdKM+YDICdolLxrNqX1RshzZ+zBgXW0txF1?=
 =?us-ascii?Q?4HwN3Z9pBXjFy/JVO4WsId9DNt7fD2Suvf4ddn59GQxGPJVYRQ7r+igA3qmu?=
 =?us-ascii?Q?8B+gamjXlvPWZ9+kpmn4frnkzqt8LGKm5uAHrbNDyY2B0CFTNeVZHKL5Udmm?=
 =?us-ascii?Q?irzTuE1RHnIpr2PKIA4/a88vcOuim04zKQyr3S9KJWnqaAyPIaRwqig1IwOr?=
 =?us-ascii?Q?AqMiC4Ycun2oURWDwULQGHeqD81ZjQd/byXBmNmF90vftQskb2oHS7PAob37?=
 =?us-ascii?Q?0BFSW+00UAqlcHwImA8LTjFe/n6Eb9Bu+fsnWXg9cjHYA40gDi3sNGDHOn1X?=
 =?us-ascii?Q?vJ9ZsfOiDtjcF0n0hq73PRUmLyYNDbDHvfSiw3iZHR2RNfsSSKShlsH618J+?=
 =?us-ascii?Q?uuFTkhRA+IfcaWgAsSVes11pFKvjVMud71KmQRxp9hjptJ2DVrxgYV/hQqgR?=
 =?us-ascii?Q?k1Kzv4r2sgXz+ySHyUuPKNh/Ttzlw2zKYhArgn3w6TiHsx6qRExFQ+9AMbro?=
 =?us-ascii?Q?OcAHwAVTWEOn3op5rz5MZB6z0Z0osjpmgmuQBjlW29Tv1mat7ZU01DrxvjHO?=
 =?us-ascii?Q?w3T1aNJsb0B4HXLA4NhhZzgbH7h/fhwkZAPF5MR6EkJX0KtdQiURLoHkXCfE?=
 =?us-ascii?Q?uaNtwW1YGGdA0eE1j5CGFu7sSHoi4vPDcwTPODpDU+HgdFgSs3pi+J5IKlF0?=
 =?us-ascii?Q?3vQggFL1tzPoX483FRDJ0KRErAUezG/G+AM6kBfeyOBF3F0gpDpX5JKw5q2x?=
 =?us-ascii?Q?t6c2P0ARkanSWRr+ikiq/j6LPQJTM560m4MrTbYGjxY9BTgXl8v7mQHM/Ao1?=
 =?us-ascii?Q?mxxOnCxv5wce8RIKsMW3q6ZH+v87DpNUIyxRj8Qk1zOkKQH9KB+lvS48cYHL?=
 =?us-ascii?Q?tLLddwH/LK1ql4VSWXsrLWJYtFhpEXPPOHO1Vhce1dG8rebXbH1rLPtWsYbp?=
 =?us-ascii?Q?860xfNoFE8/HAWVbBjcoLkjrB6SQEsIPs3vT9jiuLQegdg/mYw1ke+6pDr1U?=
 =?us-ascii?Q?CpAVQ4kzlDJjwZEZzoj3IS3fJK82TvQ9Bo7hWLb1sRVH1azPOlvc8C+E29bg?=
 =?us-ascii?Q?X/SvpMi6Y67w+2uB6TwuTp/zQNDwbWSEKd9eOI+ss2gQpvrcuJywTJvP9jPk?=
 =?us-ascii?Q?OZ0IZoRbLdd/xQ5hbdc2AT8UHL6ncWWmT3rbAUMj5PeY6TLPnu5i2cUo9moz?=
 =?us-ascii?Q?YxncQGJX3M3k3WwSwQUYJGY+4Rr0wzmD9fNw8N6ODg5OEx98x/Wy0OhyNaVI?=
 =?us-ascii?Q?eEitZRXEEjzOZqMb6HqdqLhy1Ve9q6caTr7GWqr2ZqpIs7n9v1/NnLedN7T2?=
 =?us-ascii?Q?lwi2mgUEIDeD8KgeSDEFK1AuTPbXUz69RLi96SE+czXb22aZT+fqZSbvCA5t?=
 =?us-ascii?Q?mu34soPUAVtzFh4xJxA2yr47WnkDhb5WbfJqB6lTkJM5f1qTv1OeHV33ymqR?=
 =?us-ascii?Q?yJdSVESvv6+skljdnKse0rcEB20+h7gcgMSWTCzunnxKWm11FVVv8YjeIpd9?=
 =?us-ascii?Q?E+J/kcsmkSa1fkIh6iwWDP6ocJZA7QsDQ/Tk3LwHtmbtsOjnuznR02/hGa90?=
 =?us-ascii?Q?Ca197zyWkANpHAXjosvltmzOdWfK52hpsiHONDHa5vMlQkLLODyRDmcosumi?=
 =?us-ascii?Q?8zUsjK/jz8myIiItJd4izMaeqF25VmYnquQ9snRwG6Ry9T4lA4QnTgt+s/vZ?=
 =?us-ascii?Q?vJqjEQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	AFqeRLabWe32jvs98JbIplQO0qwQPWLp8ZEZGLP+qNoyIMrsoxmkG+8x4iO5jNnwn/zOFFbr9fXCPzB5uyqIHN7anDSRe81+4tbWwXg4M/0f+vQouk68ylkHZORg927YQyrSWotXI41Mhu7MhJMyM3/gkW0brEijO8o1bBXnA0AXdjxkwoN0kSpn0a8aSxJ6zUGU+iH3RK/99m9Z0JnpW7jwEpKgaWoe2Gznd9+Lljn+6dWyqP7DCda+0NeAZmTLaBHJbqb7NE3fmhvUVjUj+gZoLhNzYDxEmd5u4eMOdP1n2j04X/yYr0P5Y1v8wlIzyXpcWoYNJRO/BL+Sx8AnH/UdbCEXBcv8Sjp+jMRknHfWg7CSfTTVs6AgVTB5mYC/VZoyM/TNVPzREqHuImiT+3WKk33azQNOWX75v57zxJIsKYSIVbumqISpZrkNbzny
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 17:31:22.9223
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa684325-da9f-42b8-b9c5-08de60256350
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001E8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF934D73F2C

In Tegra264, different components from memory subsystems like Memory
Controller Fabric (MCF), HUB, HUB Common (HUBC), Side Band Shim (SBS)
and MC Channels have different interrupt lines for receiving memory
controller error interrupts. This patch set includes changes to add
support and enable Memory Controller error logging for Tegra264.

Ketan Patil (4):
  memory: tegra: Group error handling related registers
  memory: tegra: Group register and fields
  memory: tegra: Add support for multiple IRQs
  memory: tegra: Add MC error logging support for Tegra264

---
Changes in v6:
- Updated copyright year and commit message.
- Removed redundant mc_ prefix from few structs.
- Grouped the masks and bits next to the associated registers which
were missed in previous revision.
- Separated out Tegra264 specific registers from previous SoC
registers.
- Reduced variables in mcf_log_fault, hub_log_fault functions.

Changes in v5:
- Updated commit message to clarify the need of grouping of mc-err
registers and support for multiple interrupts, so that it can support
Tegra264.

Changes in v4:
- Fixed typo in variable name
- Added MC instance aperture mapping for hubc registers and corrected
irq handler function to read from respective mc aperture.

Changes in v3:
- Fixed compilation error with W=1 build

Changes in v2:
- Fixed warning due to use of uninitialized variable by returning back
from the function
- Removed unnecessary extern declaration of tegra264_mc_ops
- Updated tegra20_mc_irq_handlers, tegra264_mc_irq_handlers and
tegra264_mc_ops to static

 drivers/memory/tegra/mc.c       | 112 ++++++---
 drivers/memory/tegra/mc.h       | 162 ++++++++----
 drivers/memory/tegra/tegra114.c |  16 +-
 drivers/memory/tegra/tegra124.c |  36 ++-
 drivers/memory/tegra/tegra186.c |  30 ++-
 drivers/memory/tegra/tegra194.c |  20 +-
 drivers/memory/tegra/tegra20.c  |  33 ++-
 drivers/memory/tegra/tegra210.c |  19 +-
 drivers/memory/tegra/tegra234.c |  20 +-
 drivers/memory/tegra/tegra264.c | 428 +++++++++++++++++++++++++++++++-
 drivers/memory/tegra/tegra30.c  |  16 +-
 include/soc/tegra/mc.h          |  38 ++-
 12 files changed, 785 insertions(+), 145 deletions(-)

-- 
2.17.1

