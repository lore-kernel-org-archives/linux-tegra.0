Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2068.outbound.protection.outlook.com [40.107.93.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE1418891E;
	Fri, 23 Aug 2024 14:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724424264; cv=fail; b=Wc7iL+Dp0/7jMmOeRE9lMpAQG7oo7eApQa2j2MMTZz0cg6DpLZEYDzriHZUk8EdZPlmAMGRGrll0W9qbO9mV7z3XIw/GG/z0h0EhCDK8T3Uj2b4A/1wgws0T63oXJyjDFkuAHqMIVEPW8np0Ple0raAHbEDfZV2wsmfWT9plbP0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724424264; c=relaxed/simple;
	bh=/QI0WKxpfPUP2wNFljwxgUgm3t7ZhAYXiWLg01v9C6c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BWDOUhLynwnV2o1sytObYZcevNbcvgujKUasfyjs8uUg8LnNS/GmWVZXn5M0jdQDgLumYguLbcXEW/3xTrllWT1MfM59S8C28HioDjstUCqcQ2/FTK9ouhfWWKlPtNdXbsW70ptdxqFwX+GUYcMJ/VxWMxPQaloEx81bubFRmN8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=G/Tv2f/o; arc=fail smtp.client-ip=40.107.93.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="G/Tv2f/o"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pr6lH32kVD+cfGr8D/fTR55p+8c/lh7Kcw4jR/ZBUtS+Hmk7u7WCapzT29gqUbcROnP+/w2RmLBHfHR410/zXWWNO3/9r8haTbId7ltwdLNKR2GZGXL8s0I1K6HWRWfbcTrybGY70cXIfgaRyvBkn7260UV7TscvdjhzG3cdwdQMK0eI5d8Bdh6fg4JexdxG+1/3n1PAj0eLEqi3s1mTwckXpq8N/r/nhSjebTxI1xhUJalVPuak387YNM0vqUcUE7mIl0hHIlOu/goZK5zu5PJdYsXjJM5mf8PPncCTQZGuQ/LqTZE14yXlKBi34lCLXiBOPqPbXoQlrmEvvmza9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uC2u1MEL+x1Fwp/jddU86a/Z4fhXvTh7xU28dWQ0Md0=;
 b=ikt8/fHyPz5At1B5kzVgCZMcKVFPbwHyVVurx4prtXPFKIo0HxIWmNIGHTU80NrFBYRVlc3yh/YHPT2mrgBVSkBCDnoExxXOpPfxE9yXBNQk3jTIczfI5uWFss4HI84a+H2frrFvPLXhcjCEnvWnovpCx5qynPgMhP2CpWVUPclZs3ZNzlW9qVQYiP1uaSG2ij3ruoTaryZBqP9ITYiv0DFTTRxWFuxQXPHCmLOhlGaZXUX5y08vxbqfBl9L5HrXR01Wwx0qOkXfo2Eyl5KHEI1bsZDvahBu2BNl6m+XvbQE9mSj5THtmFzexrq+dGx63gkKhdekUkKhWtAmpiD7Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uC2u1MEL+x1Fwp/jddU86a/Z4fhXvTh7xU28dWQ0Md0=;
 b=G/Tv2f/og1KtO/imm49TuIWhDgi89G/U7rxKxwhKiBCyl2C2LsX3CKQS2bPdqzf7ScNzpvzuY2Ap6PF8kQBNrws6eG+3SeKst8hIHlpZkFeXZIClqMHDDgpfoS4YSvbHGS7o66/9sq+qtSXkw/gJkP0PdRLXfeKiZvnLAfL1T0aYGqrRsd0URRvGFgXAdQ8zhIgaFDJ4lkCTC9JinaOpqw4LW4CWvZw2CZmPAZzMHTJiRtiDyMfbeJM1Mof2TrthpWusZCeBBHHIsZpeuKeTjbBRQy3DLedEHFFU+J3jaQvP05GsjS6smtwIgQLXPt2cL0++bCuZczJucb1Lr2yQ9Q==
Received: from CY5PR15CA0257.namprd15.prod.outlook.com (2603:10b6:930:66::21)
 by PH8PR12MB8607.namprd12.prod.outlook.com (2603:10b6:510:1cf::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Fri, 23 Aug
 2024 14:44:18 +0000
Received: from CY4PEPF0000EE3A.namprd03.prod.outlook.com
 (2603:10b6:930:66:cafe::9a) by CY5PR15CA0257.outlook.office365.com
 (2603:10b6:930:66::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19 via Frontend
 Transport; Fri, 23 Aug 2024 14:44:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000EE3A.mail.protection.outlook.com (10.167.242.12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7897.11 via Frontend Transport; Fri, 23 Aug 2024 14:44:17 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 23 Aug
 2024 07:44:05 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 23 Aug
 2024 07:44:05 -0700
Received: from build-spujar-20240626T115404323.nvidia.com (10.127.8.9) by
 mail.nvidia.com (10.129.68.10) with Microsoft SMTP Server id 15.2.1544.4 via
 Frontend Transport; Fri, 23 Aug 2024 07:44:04 -0700
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <linux-sound@vger.kernel.org>
CC: <lgirdwood@gmail.com>, <perex@perex.cz>, <tiwai@suse.com>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <mkumard@nvidia.com>,
	<spujar@nvidia.com>, <rituc@nvidia.com>, <jbrunet@baylibre.com>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<robelin@nvidia.com>
Subject: [PATCH 2/2] ASoC: tegra: Fix CBB error during probe()
Date: Fri, 23 Aug 2024 14:43:42 +0000
Message-ID: <20240823144342.4123814-3-spujar@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240823144342.4123814-1-spujar@nvidia.com>
References: <20240823144342.4123814-1-spujar@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3A:EE_|PH8PR12MB8607:EE_
X-MS-Office365-Filtering-Correlation-Id: e0d34ae3-06ad-4940-71df-08dcc38210f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tLUE1R7PCHyxz8fQtpZa378bpOfw35Wm8Xn7fJyZS6YNkUX1FjxXA4a8pUQq?=
 =?us-ascii?Q?19TFWzLFAuYWa0H6I6Fp+ju++JdUwm5glqZrATDxtyJ8ycQtG7LdRAhy8R3Q?=
 =?us-ascii?Q?Zk/jEiVK0FsEHQfs/iqvuP4WT41PHAZriX70B4ItqbmK6W+BREOS/cw9VHLA?=
 =?us-ascii?Q?KfgU7nqNF11LnKCUf6u69mJIkq7ohERulaNaDB6jq62p4vqn18Y8x30feHHI?=
 =?us-ascii?Q?UdWU9yMFO5B+yELXopTrIKaF+epzwTN2XM3YRJ9V5WA98jnKQ0Nh6Y7Nsa+J?=
 =?us-ascii?Q?MF7toMkjTeNTPp1h7hg6RVRfMiNJxXTPAoHN35F5JpzDzHtIM6SVvexZxeq6?=
 =?us-ascii?Q?bQeXS1qovPkdyeBYJQCKT21H/+bzORhwB4gGWO1P5ObnLT7Kg14nokNkeFtJ?=
 =?us-ascii?Q?s/j9zUY41ZYxTy/MIqdSRkIAts5FaQLT4eFwhHNXKMuLxBYsEKjki3fI0msI?=
 =?us-ascii?Q?e7hbbHS1swemzrNzIDQOlX71dam7DTVwNbPA/hB3bzjUrAD3AtpNEked0I7Z?=
 =?us-ascii?Q?u3xEQ6QoYOiocuepkruZF3uVCVVA2FKd++PSCtLUwGkkJ4iKzr1UqOknesmo?=
 =?us-ascii?Q?Mrdrp163EoNuAKJHm5CAGSlKmnoYOLG6+jOAOuFktHe5J6Qyq49vVvnQm/3a?=
 =?us-ascii?Q?t6oiFfrBG+KoGiho8DHvgGAHHj7JqblZpS/ZSlT0YCbMncr+BrclFOnAIFKz?=
 =?us-ascii?Q?O7MHzLdp6e7J2LzTZ/up9Wm87Y9psquT1a6KrthNyQbOwN1u7ftJsZsE3nCJ?=
 =?us-ascii?Q?cR2K16RRh0KJlG8UFn+5AJ2rHDGQfcMVUNKPtwudeuUg54DerTbzYDvQlwkn?=
 =?us-ascii?Q?DJnKXcUPY45pmqHDl8Paa4ys3zNAe3PubOaJD2DB4AoklJCOw1S1J6zvaFLm?=
 =?us-ascii?Q?CFI5iDlgrEdwrc20bhKF6nGzMFj52Tf865db8UNTZexcQnUA7Xmf0nZYAk/B?=
 =?us-ascii?Q?CLUCdK4GLKO55sh3mFnSmCaIMsgcBrGbutCoLzEdcIpvp8N9fImExxfgxzNk?=
 =?us-ascii?Q?jlsj14HbcWXnpA3CIJ1LfsBn7HaFDtHNBvWudTYW8nCj96nXRgypAOD7Xwyg?=
 =?us-ascii?Q?CIVgl8wfkYLHeK3v6jetCOZnAHx9ZkypHXDbKYQCH8hz3YmMmj5haDJ3Txap?=
 =?us-ascii?Q?Fw/Nh9/4TgaNexQvbhutl8xj2ZjVBV/Tyor1EY1iXwF3Rtjcz0m0y7tT3e5W?=
 =?us-ascii?Q?gg/puA4l2xwkBk7XCnhmI1FOOAh7ebzWWOuwU5wYv+nEceaktIqamWUMTX7P?=
 =?us-ascii?Q?1/JKDtHDJC2itBVtBxjTnZ1WNuq5b7gpxogr9CKGBFDcH08RsUlAUbLWhqeY?=
 =?us-ascii?Q?4pmGRM2AS0p0y/dhjwIgiH+lqTOBDO8xmbR1OJqUKpYWT92UkNmFMnrDw0Wc?=
 =?us-ascii?Q?MeDaI3xxJLL8LzkUxjxVBI0k/mXZnWMa6n5yqeErKlZ+J19/rg0MdBLU2fAu?=
 =?us-ascii?Q?UuDw3/IeXtyX4VaZDpg3ICv1o6KGYSEu?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 14:44:17.6047
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0d34ae3-06ad-4940-71df-08dcc38210f5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB8607

From: Mohan Kumar <mkumard@nvidia.com>

When Tegra audio drivers are built as part of the kernel image,
TIMEOUT_ERR is observed from cbb-fabric. Following is seen on
Jetson AGX Orin during boot:

[    8.012482] **************************************
[    8.017423] CPU:0, Error:cbb-fabric, Errmon:2
[    8.021922]    Error Code            : TIMEOUT_ERR
[    8.025966]    Overflow              : Multiple TIMEOUT_ERR
[    8.030644]
[    8.032175]    Error Code            : TIMEOUT_ERR
[    8.036217]    MASTER_ID             : CCPLEX
[    8.039722]    Address               : 0x290a0a8
[    8.043318]    Cache                 : 0x1 -- Bufferable
[    8.047630]    Protection            : 0x2 -- Unprivileged, Non-Secure, Data Access
[    8.054628]    Access_Type           : Write
[    8.058223]    Access_ID             : 0x0
[    8.058224]    Fabric                : cbb-fabric
[    8.065056]    Slave_Id              : 0x26
[    8.068295]    Burst_length          : 0x0
[    8.071798]    Burst_type            : 0x1
[    8.075127]    Beat_size             : 0x2
[    8.078351]    VQC                   : 0x0
[    8.081146]    GRPSEC                : 0x7e
[    8.084208]    FALCONSEC             : 0x0
[    8.087450]    AXI2APB_2_BLOCK_TMO_STATUS : 0x1
[    8.092118]    AXI2APB_2_BLOCK0_TMO : 0x4
[    8.096255]  **************************************
[    8.101366] ------------[ cut here ]------------
[    8.106130] WARNING: CPU: 0 PID: 124 at drivers/soc/tegra/cbb/tegra234-cbb.c:604 tegra234_cbb_isr+0x134/0x178
[    8.116405] Modules linked in:
[    8.119585] CPU: 0 UID: 0 PID: 124 Comm: kworker/u50:2 Not tainted 6.11.0-rc4-next-20240823-00004-g0ed92c507dab #4
[    8.130260] Hardware name: NVIDIA NVIDIA Jetson AGX Orin Developer Kit/Jetson, BIOS buildbrain-gcid-37325339 08/21/2024
[    8.141384] Workqueue: events_unbound deferred_probe_work_func
[    8.147422] pstate: 604000c9 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    8.154604] pc : tegra234_cbb_isr+0x134/0x178
[    8.159093] lr : tegra234_cbb_isr+0x10c/0x178
[    8.163582] sp : ffff800080003c60
[    8.167000] x29: ffff800080003c60 x28: ffffd89a3d40b988 x27: 0000000000000001
[    8.174362] x26: ffff000006f90000 x25: 0000000000000001 x24: 00000000000000c0
[    8.181725] x23: ffffd89a3c030440 x22: ffffd89a3d6d1c48 x21: 0000000000000021
[    8.189089] x20: ffffd89a3d40b998 x19: 0000000000000000 x18: ffffffffffffffff
[    8.196443] x17: ffff27756663b000 x16: ffff800080000000 x15: ffff8001000036f7
[    8.203800] x14: 0000000000000000 x13: 2a2a2a2a2a2a2a2a x12: 2a2a2a2a2a2a2a2a
[    8.211154] x11: 2a2a2a2a2a2a2a2a x10: ffffd89a3d0a7520 x9 : ffffd89a3a9ebfa4
[    8.218513] x8 : 00000000ffffefff x7 : ffffd89a3d0a7520 x6 : 0000000000000000
[    8.225877] x5 : 80000000fffff000 x4 : 0000000000000fff x3 : 0000000000000000
[    8.233240] x2 : 0000000000000000 x1 : ffff000006f90000 x0 : 0000000100010101
[    8.240602] Call trace:
[    8.243126]  tegra234_cbb_isr+0x134/0x178
[    8.247261]  __handle_irq_event_percpu+0x60/0x238
[    8.252132]  handle_irq_event+0x54/0xb8
[    8.256085]  handle_fasteoi_irq+0xac/0x1e0
[    8.260320]  generic_handle_domain_irq+0x34/0x58
[    8.265075]  gic_handle_irq+0x54/0x120
[    8.268950]  do_interrupt_handler+0x58/0x98
[    8.273267]  el1_interrupt+0x34/0x68
[    8.276974]  el1h_64_irq_handler+0x18/0x28
[    8.281196]  el1h_64_irq+0x64/0x68
[    8.284700]  handle_softirqs+0xa4/0x368
[    8.288665]  __do_softirq+0x1c/0x28
[    8.292263]  ____do_softirq+0x18/0x30
[    8.296034]  call_on_irq_stack+0x24/0x58
[    8.300076]  do_softirq_own_stack+0x24/0x38
[    8.304390]  irq_exit_rcu+0x94/0xd0
[    8.307992]  el1_interrupt+0x38/0x68
[    8.311676]  el1h_64_irq_handler+0x18/0x28
[    8.315902]  el1h_64_irq+0x64/0x68
[    8.319406]  _raw_spin_unlock_irqrestore+0x10/0x58
[    8.324354]  regmap_update_bits_base+0x80/0xa8
[    8.328945]  tegra210_mvc_runtime_resume+0x60/0x80
[    8.333898]  pm_generic_runtime_resume+0x34/0x58
[    8.338665]  __rpm_callback+0x50/0x1b0
[    8.342530]  rpm_callback+0x70/0x88
[    8.346128]  rpm_resume+0x430/0x638
[    8.349722]  __pm_runtime_resume+0x54/0xa0
[    8.353944]  tegra210_mvc_reset_vol_settings+0x48/0x110
[    8.359325]  tegra210_mvc_platform_probe+0xd8/0x140
[    8.364350]  platform_probe+0x70/0xf0
[    8.368130]  really_probe+0xc4/0x2a8
[    8.371814]  __driver_probe_device+0x80/0x140
[    8.376302]  driver_probe_device+0x48/0x170
[    8.380614]  __device_attach_driver+0xc0/0x148
[    8.385189]  bus_for_each_drv+0x88/0xf0
[    8.389154]  __device_attach+0xb0/0x1c0
[    8.393107]  device_initial_probe+0x1c/0x30
[    8.397415]  bus_probe_device+0xb4/0xc0
[    8.401370]  device_add+0x598/0x768
[    8.404967]  of_device_add+0x4c/0x70
[    8.408664]  of_platform_device_create_pdata+0x98/0x130
[    8.414047]  of_platform_bus_create+0x188/0x3a8
[    8.418717]  of_platform_populate+0x60/0x108
[    8.423120]  tegra_ahub_probe+0xe4/0x180
[    8.427162]  platform_probe+0x70/0xf0
[    8.430934]  really_probe+0xc4/0x2a8
[    8.434618]  __driver_probe_device+0x80/0x140
[    8.439108]  driver_probe_device+0x48/0x170
[    8.443418]  __device_attach_driver+0xc0/0x148
[    8.447995]  bus_for_each_drv+0x88/0xf0
[    8.451949]  __device_attach+0xb0/0x1c0
[    8.455901]  device_initial_probe+0x1c/0x30
[    8.460211]  bus_probe_device+0xb4/0xc0
[    8.464163]  device_add+0x598/0x768
[    8.467762]  of_device_add+0x4c/0x70
[    8.471446]  of_platform_device_create_pdata+0x98/0x130
[    8.476827]  of_platform_bus_create+0x188/0x3a8
[    8.481501]  of_platform_populate+0x60/0x108
[    8.485902]  tegra_aconnect_probe+0x9c/0x118
[    8.490322]  platform_probe+0x70/0xf0
[    8.494095]  really_probe+0xc4/0x2a8
[    8.434618]  __driver_probe_device+0x80/0x140
[    8.439108]  driver_probe_device+0x48/0x170
[    8.443418]  __device_attach_driver+0xc0/0x148
[    8.447995]  bus_for_each_drv+0x88/0xf0
[    8.451949]  __device_attach+0xb0/0x1c0
[    8.455901]  device_initial_probe+0x1c/0x30
[    8.460211]  bus_probe_device+0xb4/0xc0
[    8.464163]  device_add+0x598/0x768
[    8.467762]  of_device_add+0x4c/0x70
[    8.471446]  of_platform_device_create_pdata+0x98/0x130
[    8.476827]  of_platform_bus_create+0x188/0x3a8
[    8.481501]  of_platform_populate+0x60/0x108
[    8.485902]  tegra_aconnect_probe+0x9c/0x118
[    8.490322]  platform_probe+0x70/0xf0
[    8.494095]  really_probe+0xc4/0x2a8
[    8.497779]  __driver_probe_device+0x80/0x140
[    8.502263]  driver_probe_device+0x48/0x170
[    8.506571]  __device_attach_driver+0xc0/0x148
[    8.511149]  bus_for_each_drv+0x88/0xf0
[    8.515102]  __device_attach+0xb0/0x1c0
[    8.519055]  device_initial_probe+0x1c/0x30
[    8.523363]  bus_probe_device+0xb4/0xc0
[    8.527316]  deferred_probe_work_func+0x90/0xd0
[    8.531984]  process_one_work+0x15c/0x3c0
[    8.536128]  worker_thread+0x2e0/0x3e8
[    8.539995]  kthread+0x120/0x130
[    8.543328]  ret_from_fork+0x10/0x20
[    8.547018] ---[ end trace 0000000000000000 ]---

These errors happen when MVC device, which is a child of AHUB
device, tries to access its device registers. This happens as
part of call tegra210_mvc_reset_vol_settings() in MVC device
probe().

The root cause of this problem is, the child MVC device gets
probed before the AHUB clock gets enabled. The AHUB clock is
enabled in runtime PM resume of parent AHUB device and due to
the wrong sequence of pm_runtime_enable() in AHUB driver,
runtime PM resume doesn't happen for AHUB device when MVC makes
register access.

Fix this by calling pm_runtime_enable() for parent AHUB device
before of_platform_populate() in AHUB driver. This ensures that
clock becomes available when MVC makes register access.

Fixes: 16e1bcc2caf4 ("ASoC: tegra: Add Tegra210 based AHUB driver")
Signed-off-by: Mohan Kumar <mkumard@nvidia.com>
Signed-off-by: Ritu Chaudhary <rituc@nvidia.com>
Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 sound/soc/tegra/tegra210_ahub.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/sound/soc/tegra/tegra210_ahub.c b/sound/soc/tegra/tegra210_ahub.c
index 3f114a2adfce..ab3c6b2544d2 100644
--- a/sound/soc/tegra/tegra210_ahub.c
+++ b/sound/soc/tegra/tegra210_ahub.c
@@ -2,7 +2,7 @@
 //
 // tegra210_ahub.c - Tegra210 AHUB driver
 //
-// Copyright (c) 2020-2022, NVIDIA CORPORATION.  All rights reserved.
+// Copyright (c) 2020-2024, NVIDIA CORPORATION.  All rights reserved.
 
 #include <linux/clk.h>
 #include <linux/device.h>
@@ -1391,11 +1391,13 @@ static int tegra_ahub_probe(struct platform_device *pdev)
 		return err;
 	}
 
+	pm_runtime_enable(&pdev->dev);
+
 	err = of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->dev);
-	if (err)
+	if (err) {
+		pm_runtime_disable(&pdev->dev);
 		return err;
-
-	pm_runtime_enable(&pdev->dev);
+	}
 
 	return 0;
 }
-- 
2.17.1

