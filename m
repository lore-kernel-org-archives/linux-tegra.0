Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2051.outbound.protection.outlook.com [40.107.92.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C826604A6
	for <linux-tegra@vger.kernel.org>; Mon, 29 Jan 2024 12:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706529734; cv=fail; b=NOLbq8UTe9WuRjDPJDI4YR0FOei+shmGeAh+emByFeSvXz97GRiC+cAR+pHxI7yPalflRNnadKKZCDDBiPQD9MQVqSsIanKoUexVjjsEjvN/E69Tb1jzPESxIv+vmtFv2dM0l2dT2W6pG8d3wqUkogQQHBelhgPXJzMUGK5gV24=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706529734; c=relaxed/simple;
	bh=4QyJ2VHQ7GHhjOV4d/8xMPW5unfYbWH7UKHeIUHZxFQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LJ1OTGLrdERkv56gzL9Cm+Gf6KD6A5fA6W46FvBzA7i2Ny6aCAGTBmAs/5IJv5CGYVXiy3El87F3rcS5QC5ZScIBzqS7SMc8Cv4hi454D7loVukGGjjIDTpM8KBq0tbMS7rxi8QA54gUXK+glmbEVaDwpFhXIqhHOvML91YGq34=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ZWn4yZmD; arc=fail smtp.client-ip=40.107.92.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZWn4yZmD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L6wSBDj9SBpvdIhxkdK8EPNGr5Fl0xM65jbwqImUrAr8cP2H2HM6AHdylCFeHevHF0MUqAw2KwghHrquAJ7bLjbSazF6OQHShmVCOvqrSddIO7w72eHfmGeYRe2V334r09Pw69J7Ozy/RPcaSKj6O/Me4foXpo/odWc1h8KrIYiBHN820hCagMex+mo8uE1bfeLVlKkCj0XuQsAO6B0bcwRomFAWVb/YW2+rjf3BVOjD3OdBr714YFPbkmVUDCMVTcwsePtRrWCHwKzybFTtZSWk93KN4SpTrg5y+lhlFEBeAd1F5Ut04S7xOzaEgVLtWH2JDuME62o0pEPPlE/NVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HuzAiy6wmMyh5XQth0Tgb162gkRH+Zskbe2jhDk1ik0=;
 b=SYEExxo1oGsQwLDmCiVxq8zWulZc5MRofNiz3vpyMOKTUIyCmxyQZk62thAtI3/wm1dvjRIEoEPPHHjiJyBcvZLOTqnYlHr4tz2lo8u5m9Z+a5qFuB2QKrR09JuXOO2ub0d3HgCpsl7+TGhYWuX4BnXLen/zGkGdlH/6Co2XJQVayf9arhYqHfSsitF+oijomoF9xNEaCmBjzN4bCnTX/OnvKQoLhs8Kg8ldIzIJO5fLE+9SCqgR6hZvTnBMyL6/qYzie9tDlmg6uRaSwJ4ACJw8rp5TDDDJTztr/FksNNUEmci0wy2VZY/qNSd9WNJ7MmIAfNLAtkbMo6vPgUzuxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HuzAiy6wmMyh5XQth0Tgb162gkRH+Zskbe2jhDk1ik0=;
 b=ZWn4yZmDElhAnknsYNnD+jvOrOJDl1FYKkiYCdHSSg/VlV/spBqJyb62wpI10W7PGPMhN9qM18XZTbML5txWtkmjSAopBqpfZhJHcAdBqBzTVcMPyCBOUPVG4s8/EZAmOXZlCpB5i2ViDVT+RhR/fEXDrxbAwJ5IlalkTmeq23fh4/sfiG5pG3B750ItTNS6sqmGsakk8GThhYT80Qe+9jzzcIQEf5cbpai3vW7rfSbavfjHY+h4+Wfp5Eq6uNqJ/h0Dz3M+iRBmPmdmGmCKXBzLfu9u3GJ1yAwoxmzfbDMjhTR/Z9fnsjljPSH99nqo2vdxxU5rg3JEsYu7l7vxGQ==
Received: from MN2PR04CA0018.namprd04.prod.outlook.com (2603:10b6:208:d4::31)
 by SJ2PR12MB7963.namprd12.prod.outlook.com (2603:10b6:a03:4c1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Mon, 29 Jan
 2024 12:02:08 +0000
Received: from BL02EPF0001A108.namprd05.prod.outlook.com
 (2603:10b6:208:d4:cafe::33) by MN2PR04CA0018.outlook.office365.com
 (2603:10b6:208:d4::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.32 via Frontend
 Transport; Mon, 29 Jan 2024 12:02:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BL02EPF0001A108.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7228.16 via Frontend Transport; Mon, 29 Jan 2024 12:02:07 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Mon, 29 Jan
 2024 04:01:55 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Mon, 29 Jan 2024 04:01:55 -0800
Received: from moonraker.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.986.41 via Frontend
 Transport; Mon, 29 Jan 2024 04:01:54 -0800
From: Jon Hunter <jonathanh@nvidia.com>
To: Thierry Reding <thierry.reding@gmail.com>
CC: <linux-tegra@vger.kernel.org>, Kartik <kkartik@nvidia.com>, Jon Hunter
	<jonathanh@nvidia.com>
Subject: [PATCH] soc/tegra: fuse: Fix crash in tegra_fuse_readl()
Date: Mon, 29 Jan 2024 12:01:51 +0000
Message-ID: <20240129120151.16198-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A108:EE_|SJ2PR12MB7963:EE_
X-MS-Office365-Filtering-Correlation-Id: c984b5bc-8ce5-4cd4-8e42-08dc20c21e10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2e8Nkz+N3YcB/ZC4j+GI9UQvdigx5IY30IUPqp6CqtoD237hgKnRDFApTxfzREgjPn6OBNbY9w8YW1+QJTJZLs6dqDm+hcAq2HVvEBfOQejNXoK5blFvAGKNhwEDqMvOPMvDswjQirvw9Eeq3ULrVy7/jknSnRYp81U8KFZeJMMLGtTR42xV4ECAFbmznkRY99rM09wFQj52F27JUnAXla5DHYavLB4wlG4uskgFDLqJatDo9mWT08wnBenkO7qxXO2FFOwPBPQu87/FxIKnOS0RhTHaiPp5FMM/6lFd31FQgrRotbjuLGika3MQouiPC4fVqYdvtPPGwTPdi3tBhNX2kkOHBuTv/VhbDnZQ6dhHTFNXyWpVYRe6r6YKFGc4bMsTAZlLmerXKqCnc4HhaEEvSuP38BV2+yxwEvOLFKnugH/ds2CC6MjAXyzqF25Eq9y6f2wrE5SqviDmEY4RbqvwWX4AtsUG10I2EoJhFxnFb0Rrroep/AkTRMXJbLSFc9xF/Z7YbNC8pV1TXDmveKzau0tqsWXHlUIreNo8hUPSaFXvP8cvYFkpS1TVhHru4G584cLiKj/cH4YrEQwNUyoK3hYyUsQLK67O+bdQ336TYo7VwwWpnLQ0pHI5xmtNfoIPbvbMDPAAM+DoZOmRuaPQzRcZpnFLPV50tPIc8MXIYukuNAYlFQEzX6WwOl2bjqel8hrR3YsxaPrIKAIOcul51BU7ouLFaegUR+g3VZBOM0dg6GizxqydnE5eJBs/
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(396003)(39860400002)(376002)(230922051799003)(64100799003)(186009)(451199024)(82310400011)(1800799012)(46966006)(36840700001)(40470700004)(41300700001)(82740400003)(7636003)(356005)(40460700003)(40480700001)(36860700001)(47076005)(7696005)(86362001)(70586007)(54906003)(6916009)(70206006)(316002)(8676002)(8936002)(426003)(336012)(2616005)(5660300002)(45080400002)(478600001)(107886003)(2906002)(4326008)(6666004)(1076003)(26005)(83380400001)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 12:02:07.7725
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c984b5bc-8ce5-4cd4-8e42-08dc20c21e10
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A108.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7963

Commit c5b2d43e67bb ("soc/tegra: fuse: Add ACPI support for Tegra194 and
Tegra234") updated the Tegra fuse driver to add ACPI support and added a
test to the tegra_fuse_readl() function to check if the device is
booting with device-tree. This test passes 'fuse->dev' variable to
dev_fwnode() but does not check first is 'fuse->dev' is valid. This is
causing a crash to occur in Tegra XUSB PHY driver that calls the
tegra_fuse_readl() function before 'fuse->dev' variable has been
initialised ...

 Unable to handle kernel NULL pointer dereference at virtual address 0000000000000290
 Mem abort info:
   ESR = 0x0000000096000004
   EC = 0x25: DABT (current EL), IL = 32 bits
   SET = 0, FnV = 0
   EA = 0, S1PTW = 0
   FSC = 0x04: level 0 translation fault
 Data abort info:
   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
 [0000000000000290] user address but active_mm is swapper
 Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
 Modules linked in:
 CPU: 7 PID: 70 Comm: kworker/u16:4 Not tainted 6.8.0-rc1-next-20240129-02825-g596764183be8 #1
 Hardware name: NVIDIA Jetson AGX Xavier Developer Kit (DT)
 Workqueue: events_unbound deferred_probe_work_func
 pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
 pc : __dev_fwnode+0x0/0x18
 lr : tegra_fuse_readl+0x24/0x98
 sp : ffff80008393ba10
 x29: ffff80008393ba10 x28: 0000000000000000 x27: ffff800081233c10
 x26: 00000000000001c8 x25: ffff000080b7bc10 x24: ffff000082df3b00
 x23: fffffffffffffff4 x22: 0000000000000004 x21: ffff80008393ba84
 x20: 00000000000000f0 x19: ffff800082f1e000 x18: ffff800081d72000
 x17: 0000000000000001 x16: 0000000000000001 x15: ffff800082fcdfff
 x14: 0000000000000000 x13: 0000000003541000 x12: 0000000000000020
 x11: 0140000000000000 x10: ffff800080000000 x9 : 0000000000000000
 x8 : ffff000082df3b40 x7 : 0000000000000000 x6 : 000000000000003f
 x5 : 00000000ffffffff x4 : 0000000000000dc0 x3 : 00000000000000c0
 x2 : 0000000000000001 x1 : ffff80008393ba84 x0 : 0000000000000000
 Call trace:
  __dev_fwnode+0x0/0x18
  tegra186_xusb_padctl_probe+0xb0/0x1a8
  tegra_xusb_padctl_probe+0x7c/0xebc
  platform_probe+0x90/0xd8
  really_probe+0x13c/0x29c
  __driver_probe_device+0x7c/0x124
  driver_probe_device+0x38/0x11c
  __device_attach_driver+0x90/0xdc
  bus_for_each_drv+0x78/0xdc
  __device_attach+0xfc/0x188
  device_initial_probe+0x10/0x18
  bus_probe_device+0xa4/0xa8
  deferred_probe_work_func+0x80/0xb4
  process_scheduled_works+0x178/0x3e0
  worker_thread+0x164/0x2e8
  kthread+0xfc/0x11c
  ret_from_fork+0x10/0x20
 Code: a8c27bfd d65f03c0 128002a0 d65f03c0 (f9414801)
 ---[ end trace 0000000000000000 ]---

Fix this by verifying that 'fuse->dev' is valid before passing to
dev_fwnode(). Given that 'fuse->clk' and 'fuse->clk' are initialised in
the same function, test these variables in the same if-statement.

Fixes: c5b2d43e67bb ("soc/tegra: fuse: Add ACPI support for Tegra194 and Tegra234")
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/soc/tegra/fuse/fuse-tegra.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/tegra/fuse/fuse-tegra.c b/drivers/soc/tegra/fuse/fuse-tegra.c
index c34efa5bf44c..efe9853d4a8a 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra.c
@@ -348,7 +348,10 @@ int tegra_fuse_readl(unsigned long offset, u32 *value)
 	/*
 	 * Wait for fuse->clk to be initialized if device-tree boot is used.
 	 */
-	if (is_of_node(dev_fwnode(fuse->dev)) && !fuse->clk)
+	if (!fuse->clk || !fuse->dev)
+		return -EPROBE_DEFER;
+
+	if (is_of_node(dev_fwnode(fuse->dev)))
 		return -EPROBE_DEFER;
 
 	if (!fuse->read)
-- 
2.7.4

