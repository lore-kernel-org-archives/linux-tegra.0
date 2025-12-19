Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013031.outbound.protection.outlook.com [40.93.201.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA5A2D3EC7;
	Fri, 19 Dec 2025 11:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766144665; cv=fail; b=gw1yhweqdMKS1diJkxCu6OGxpHuA2VtXLq0MKB0cwlDPsCtzxp0Ea/q2MlenzRgptEKFQ8X9LxKhDcFGGgbs25dIS0t0dZ590dWxSAxfqmayj8mN+tlVPFG8fnuhmGbLaKS8FypSqM7gKLaams7ehxobPlbGq96dSpQTW5fCW50=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766144665; c=relaxed/simple;
	bh=l3v9N/4/xzT1qBhyZV4Wx3xQ9EQPMU0yGZOr1sFZ4Qk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FsPeBdrAavS7ERCV6ezjDintgzIBmyf2PMFdQY9CQAHSH1/wcY7wethY94f/r7BS4IdVh+6vXH3C07nikPOtLgx9kQVjtlA6Ol5bYM0k/wY6x9vTxXKVLhnlAHGOdj8PAmZvjOMVm5BefsKDc+thYPNQ4zUmzI3bpE28+p6ctis=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YUL/gNBB; arc=fail smtp.client-ip=40.93.201.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YUL/gNBB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HdkbCoWsXscs3P+M7rXw1rFm0RNoEF+BxFustfdW6HqcOhKoWQJveSY400g5IVx4GDdysUoJYsX8yI+sxg7rtvgg6RRRb3opN24xF+ZcghshBYzaDWiWsBeDkpNe/0rhdwyCUBaMko3v/6oe55QWaSgWhzbzmK6YxJxaLjvY8Lqo98mZxjPdd3Dg06qdUHA2eqBjASH5oQhTGWLOaEgv/TUqYhBqSejrrVZrxqbdkiU+obmDWc1K0e0KTttG3eEI+SorBocWv4gZRd/WWW3Yja+bKL7u+q8JSKGTSQbP3o41o0fzPaCg+jfhi3HP+HPgWocdCrV37K4cyX9fqGDqQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WSJyec37FW7GsI4NyvMeO3eUP6Mo7uxg9vBhZFuA6l4=;
 b=o5+aFaMDr3ERmoBCf59f3QGLbAHgxjY487f71bezeSKx2rNusWapxZEujS/a2qyQ8v98L6cOTFgOO0ydTiCHS9jViE+AniNPOhSfpgVWlYegioDgXniVaalhWlbRJRMxQOr7z8EJUNf1HLocsY+A7Y3R+5kDSsl5Lf3FE+VZDiH8/toxWes2vUAozGYy0E7wSH7b/ekIGreeiJd8jMlnj1XxSaMyAwUoNMh6sHqPH2XGHJiYG9gHEPffLFU60xa0YJEqWVrrRCCviNVkIQrbRDGw/1cpblaLY1UcTNXAgg1zLUGqyg09blSuWdbOgh/vcxgxBCCtyKa457c6yqDqrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WSJyec37FW7GsI4NyvMeO3eUP6Mo7uxg9vBhZFuA6l4=;
 b=YUL/gNBBD81CCbF+mbMqoReC3cALZgAc5o0XtOV2CkWT7Y8Whr0LQAKi41cDZ+923C/PiFHBSdCohGhuBLRz3bvdAM3f5HPj+V13G03+W81C2F5kcGlY5GA3IUm9lJtUJkDLFKUorAnZDULnx//41JlzBOdINBdvB0kJlzhpcrhYPU78NGM6IQ2gAniKMuIdPIDzecBJzuz7bHUNtxc/gAwgPa0jseMm98tymJn9lckjHlkQlq1GDhjDR+rmGnouEVUHtTqQmcWacP/ujEvyP7V14nrrhYn/JtLDUnda3PYk3YlAXr2LCMfqBiX+Yi+qyEu4ma+Fpra+4LeJM9P4FA==
Received: from SJ0PR05CA0041.namprd05.prod.outlook.com (2603:10b6:a03:33f::16)
 by IA1PR12MB7494.namprd12.prod.outlook.com (2603:10b6:208:41a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 11:44:16 +0000
Received: from SJ1PEPF00001CDE.namprd05.prod.outlook.com
 (2603:10b6:a03:33f:cafe::b3) by SJ0PR05CA0041.outlook.office365.com
 (2603:10b6:a03:33f::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6 via Frontend Transport; Fri,
 19 Dec 2025 11:44:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF00001CDE.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Fri, 19 Dec 2025 11:44:16 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 19 Dec
 2025 03:44:06 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 19 Dec
 2025 03:44:05 -0800
Received: from build-ketanp-bionic-20250813.nvidia.com (10.127.8.10) by
 mail.nvidia.com (10.129.68.6) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Fri, 19 Dec 2025 03:44:05 -0800
From: Ketan Patil <ketanp@nvidia.com>
To: <krzk@kernel.org>, <thierry.reding@gmail.com>, <jonathanh@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Ketan Patil
	<ketanp@nvidia.com>
Subject: [PATCH v5 0/4] memory: tegra: Add MC error logging support for Tegra264 SoC
Date: Fri, 19 Dec 2025 11:43:50 +0000
Message-ID: <20251219114354.2727906-1-ketanp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDE:EE_|IA1PR12MB7494:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f55fbff-74d5-4afd-f0b1-08de3ef3f02f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lwaj7sGZvLfDsJT4sBgSH7ZUC5q2KDhhPrVHciaMMEckyXHMR+FhWzItrklY?=
 =?us-ascii?Q?6yYVAMZfvNuxbVZCeLrQigzI7c6m9MqSxRsLJf9Gg5HjI1WbX9ipgsG5vNFd?=
 =?us-ascii?Q?mkoaRdqUQrVPOpDN+N6eZShkm4zU5nLFGUSdpL6oBoxhBnkKpc6ENHWJMyFL?=
 =?us-ascii?Q?Xjcxnx6cwLtDUd3tloYLzSSpFxFe/SWQJLof/HKIF/wn+fw9lSd3QpfO9l+F?=
 =?us-ascii?Q?nPKc9Qkj6e4l86k6EuvyDsa6OMXJvsuZdrge9bgniQXp2I5OzB7IDJyzv909?=
 =?us-ascii?Q?HaPNFIu2zOpM7S/GBruFwVazeWIFJEiX+tMdDH+U4qVu7msOPmQKfX0IkDo0?=
 =?us-ascii?Q?0MU6yHgFcLTuRBRIO+xn7VFPQNPR7o68AX7m3IXFY5WJU6OIWjiF6RwSp6W2?=
 =?us-ascii?Q?SYXQfxaxX3F/fr27AZuP3UTgmlSlWCAlO6z5KiXwqctbCIt5o8el/EeqlGaY?=
 =?us-ascii?Q?zIMNBV260QCEksQiKK3v/1qKRtoU+9i+D2cuqv/rLFLn7fjBlVulbSOqjvk/?=
 =?us-ascii?Q?0okC9YCKO/mkIMGZ9lcgz+bVinMwj1NZ4bmQvUKleWCTnx62uspTbdizztPM?=
 =?us-ascii?Q?8Ycie2LG3bClRKjaPCma3vTjWWxGHL0ptIKqihfCUxc902aMYzCRCKI8Ty+t?=
 =?us-ascii?Q?LaMCo5xK8Fbe45LHrLi4U8FOkhfYayHzZdrD9QkxUfdGuvyFpxDsqFcV1EkV?=
 =?us-ascii?Q?gREhem/jGCFHe7MZlpLap+RSEpEvQVDdYSpWIbwc2jcuojHrhqK2CUVZxLik?=
 =?us-ascii?Q?IBREvgojZuHHbqM83ylL4jQCYFe/G/BayCtvujW7sPKZZvjSCV48nMT+Q0aF?=
 =?us-ascii?Q?k5tZIQ/MiSLBoxXBumWDyxHdfGINpY010EWpkfyjfiAhC+rpx/Rj0OpxF+DL?=
 =?us-ascii?Q?CcFHBMil65sS7SyiMk51+b3Mht58gS4lsCnmBi8W00cG1ie1FM5+T7FKn6Bl?=
 =?us-ascii?Q?Au/9OwG6Va3M6bNRctv3l/mapsJFi4pk82ULHLtPzQmP+rT5PbiEnXc/D+Sw?=
 =?us-ascii?Q?vyTeBKqxfJSmzP7usm2FtlgR1Ud2O2CpSsHbd7gauN+WFoXOLuVyB5bWTeVb?=
 =?us-ascii?Q?poaM6cafR3iTsWN5ZiGfbpciB+u06WensWpJPLbDc9wBkijrjU2R2hjhcnJ9?=
 =?us-ascii?Q?CI/+WMYQwCI28CVV5EildOQEk1TJzPjoqW2LiSJA9Cwbd49KYfqbnC2mYEJ9?=
 =?us-ascii?Q?5v63HyOAxTK4E4oigwt0jcVh0rFNID5gnehPtfB9Rzq4qOJNcwN0gCI/hP6j?=
 =?us-ascii?Q?iteTf3bdWUa+ln1n7I89rFgsk2IbYv7r385dF2iVuAVJEGKq1akCSD1w8JTF?=
 =?us-ascii?Q?zqOAONx/rTjZBHg3i1GLhNa6rUdHWnmSc0TNNZc1LDWxzTtIOp2EM5SZLdYy?=
 =?us-ascii?Q?i/w7EXUN5X+cbjkGXzFHn33vSaHR7XZje1PVCxEYIkdC67rL38rT1Yg/NhkD?=
 =?us-ascii?Q?96nyvLRy8dguGuEJ2ocAFKzvtIagY7lCZXyb065nAX9EvX2rT0U9TTEh5obQ?=
 =?us-ascii?Q?tpTf3YymDqHLvs88Z10ek7Vdpj5hdjjXygW9erdZSW3l7vhU6qNBwIyJeXBV?=
 =?us-ascii?Q?Gk9J63r28GSLNxn6sjg=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 11:44:16.0532
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f55fbff-74d5-4afd-f0b1-08de3ef3f02f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CDE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7494

In Tegra264, different components from memory subsystems like Memory
Controller Fabric (MCF), HUB, HUB Common (HUBC), Side Band Shim (SBS)
and MC Channels have different interrupt lines for receiving memory
controller error interrupts. This patch set includes changes to add
support and enable Memory Controller error logging for Tegra264.

Ketan Patil (4):
  memory: tegra: Group mc-err related registers
  memory: tegra: Group register and fields
  memory: tegra: Add support for multiple irqs
  memory: tegra: Add MC error logging support for Tegra264

---
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

 drivers/memory/tegra/mc.c       | 125 ++++++---
 drivers/memory/tegra/mc.h       | 140 +++++++---
 drivers/memory/tegra/tegra114.c |   3 +-
 drivers/memory/tegra/tegra124.c |   4 +-
 drivers/memory/tegra/tegra186.c |  14 +-
 drivers/memory/tegra/tegra194.c |   5 +-
 drivers/memory/tegra/tegra20.c  |  20 +-
 drivers/memory/tegra/tegra210.c |   3 +-
 drivers/memory/tegra/tegra234.c |   5 +-
 drivers/memory/tegra/tegra264.c | 439 +++++++++++++++++++++++++++++++-
 drivers/memory/tegra/tegra30.c  |   5 +-
 include/soc/tegra/mc.h          |  32 ++-
 12 files changed, 694 insertions(+), 101 deletions(-)

-- 
2.17.1

