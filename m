Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2057.outbound.protection.outlook.com [40.107.237.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F288657A0
	for <linux-tegra@vger.kernel.org>; Mon, 29 Jan 2024 13:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706536044; cv=fail; b=UvtwcsWZHFL9sfER053N4gnkkd8WHkMBxktZhg5t+C3qxYDG4Xy6hDo/rLaTehgttcb5felieuqC0E/pUppX//DER7MAFs69NYvsFAEx7sP55/M9hQvvV+/Fb5/kSrYTGuzHElsb8+x7JueA+VAtm6lT0r4R/E1BpASt/Mdizis=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706536044; c=relaxed/simple;
	bh=Q5k7Qe18oVaXC4jKve0MnMa60fyrKGi/tB5eYC3FGgE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CG6wso+YuRToYFpsGNjoxZzUs9xJEEBVtsAYrcCuL1MUgUX10BnEokFkL8sNpkuaxIwLfIXXgxMW3V9wRA1hddbKlh7pywQbqYFdTgjo/kuJ/DgcxMz1g9TUNu9Ag6MPXycamc0lPQF6diwc2IGidW+Ho5pqjxiRBN+7WLDDIOA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=J+HhFIbU; arc=fail smtp.client-ip=40.107.237.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="J+HhFIbU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f6eB/D0m3+TRAVeN9vmMbymo7ivCGbpN9C0Ewg7Qeaj7ys1HPpGbv7mS1SdCSow40bJ+ljEb6yg6nzwrRWvHWA/YYsKQQMvJKRrBGh6hyw0E3QBWSMKBu+lFaQkLIYlEQZ82vv/cHVwcTpbVZ5cPc/wOISB019KL+BylVH4mi//s3sBMlUaHJfdR/ruoG9hNk1M8OIrGeJK68rJvFxQB41aqpfOej8VxQCOsLeLl5meyoJnUuvMrbi6ieu8juBEywunK/zbCXo9gw5534Xi+6NsmPUk7b0TT+93CYhN9AEGajdGhXjbJLkxn2mb/itiuwp9KlKNRz+hcywSZgTGQvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z7xHD7w+glqt7bhvun4dyZpkBJDXUVBE6eYyKYoUwOg=;
 b=iBg+ZySX9AHGLyPX2shAb1ChE6Wv9INxDfWIcS+LB/8ss9dYfe1xpLn2wzhKgPlSO9L0V2yuNyS06AZqW8eI/c71Gbgl47QXEZ3Ymyf+qB8UhZ+cwwwbaHi4JD/0/o2Z7ai3K1C4FFf8Q2ocSP2WUTElwLvImDAq/NLf0Z5yTDnXY+2t4eoICVSBl9FWicK/6kMa3HO0EnRjBFhkQdBZLKkkv2mtipyvxWdp0BScZkL1RhiUdVO3kz7rT/TqDFP+g6oIL9wlhKjPVR0SoOspWdrIGz1K+/GLW7sFxQ1WYn4K3F9+dAoVZmFDt2HSx0lxm1hJmgywOkh4noL4qXXs8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z7xHD7w+glqt7bhvun4dyZpkBJDXUVBE6eYyKYoUwOg=;
 b=J+HhFIbUUOQwpKs8Zm+llFQIdLhtYevM8DJVZEBiVu3zjhk+uMnD2Fk4dLOineEUDFMK+1i/uMwOZ1VldxQTR9rl2+g/O2HNlxpH5/M4l6D1zc2lfJG23yQAQMWSWGJw53MuEuby1ZXwehVyOGq4bo5E5vMwdVEM0D17ALxuodWtCHcdJQHbq0njuyAlVE2BIBLEktVwX9E7JXPBpXcdHvIW/613jddjPpxpjgVIdL0pmgirvOoq6Gm0KSFrKPv0lkzS8EsHW9Aejz6I0KRPnp7junu3xgLErJrN3NRkSgTXzpU7T5H18AUGk7fZY8BcKSm/mAawBiRY+LnALk1nxw==
Received: from DS0PR17CA0018.namprd17.prod.outlook.com (2603:10b6:8:191::18)
 by CYXPR12MB9340.namprd12.prod.outlook.com (2603:10b6:930:e4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.32; Mon, 29 Jan
 2024 13:47:19 +0000
Received: from CY4PEPF0000EE3B.namprd03.prod.outlook.com
 (2603:10b6:8:191:cafe::1f) by DS0PR17CA0018.outlook.office365.com
 (2603:10b6:8:191::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34 via Frontend
 Transport; Mon, 29 Jan 2024 13:47:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000EE3B.mail.protection.outlook.com (10.167.242.15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7181.14 via Frontend Transport; Mon, 29 Jan 2024 13:47:18 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Mon, 29 Jan
 2024 05:47:06 -0800
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Mon, 29 Jan
 2024 05:47:05 -0800
Received: from moonraker.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.986.41 via Frontend
 Transport; Mon, 29 Jan 2024 05:47:04 -0800
From: Jon Hunter <jonathanh@nvidia.com>
To: Thierry Reding <thierry.reding@gmail.com>
CC: <linux-tegra@vger.kernel.org>, Kartik <kkartik@nvidia.com>, Jon Hunter
	<jonathanh@nvidia.com>
Subject: [PATCH V2] soc/tegra: fuse: Fix crash in tegra_fuse_readl()
Date: Mon, 29 Jan 2024 13:46:59 +0000
Message-ID: <20240129134659.21266-1-jonathanh@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3B:EE_|CYXPR12MB9340:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d1b9614-e6ee-42dc-4c5c-08dc20d0cfc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nkzrRcQYKEhGvoOn2k6DOcjSNwsO+rsNgcU2gLadVn7AY6v/hl+N9GiDYKI+eZ6vGeLPEO6UlhtYkOYWIVXbCTje59i09lTqAx/1RS9dnwGwxw6JD1TuxWUXpJS/ctY/z+1yNnmKF9kB8O0FIasuqhbTLpwOlqhrEY3dwsIFMYen5uUqOdKUWiPBMvOqiJ7Yqipa+uWOCH96K0M3xErlVnLWh149ObOjrAOA3JG6F34uLcgJYQQFEXG2+DE+IE1WnXnTFVtPZySv64ueBlvOc5jRN+QwRT/w7jKBh9M9uyOYKHXNYjaSzqiEwrAsGiK3Gn5MVq1EJ/8ExuyHyOZ0GQJAQvDScXiTwRuBevYVFF8mG8Amqhdd7fpKAwovCO6o2U0bz7nax+2kJOrM4/NhcaFhbsLj7eTvaP2+U3hSn/wxotrUqr/voy/7WGtvgeoUNnBrcP7+P5q3RSK7qLdvyq/NgrUwnzAEHhFXdUrPGii6KvlLLobYC/7N9lVMEVV8WfBkuQ5qVb+R/DB5pBKaYUftG6ws/d6FSK6lmuj+uYaQg/w1E/ZUWE0epeMip6ntozz6mtnWEyjzM1sbtZi1MgRDx9q94iWAmjavrDVqyHhMeHjohzpCSzpZokE9RJ1c7ssqTF/+NaNs+Niz7ZJaw6nefjSLj+vTSLLVAg4ICtIJw5of7HLGw/NR6OvcOtNZICy7zpR5J/fRILdgtJJQ8Sit4TTEdNcdlZLx/dNQ0PHJsB7o8x1ZFBzzrySiN0Ri
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(346002)(39860400002)(376002)(396003)(230922051799003)(82310400011)(1800799012)(186009)(64100799003)(451199024)(36840700001)(40470700004)(46966006)(40480700001)(40460700003)(26005)(1076003)(83380400001)(426003)(7696005)(6666004)(336012)(36756003)(86362001)(82740400003)(356005)(7636003)(5660300002)(8676002)(41300700001)(8936002)(4326008)(36860700001)(107886003)(47076005)(70206006)(6916009)(54906003)(2616005)(316002)(478600001)(2906002)(70586007)(45080400002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 13:47:18.9708
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d1b9614-e6ee-42dc-4c5c-08dc20d0cfc4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9340

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
dev_fwnode().

Fixes: c5b2d43e67bb ("soc/tegra: fuse: Add ACPI support for Tegra194 and Tegra234")
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
Changes since V1:
- Reverted change to move testing of 'fuse->clk'.

 drivers/soc/tegra/fuse/fuse-tegra.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/soc/tegra/fuse/fuse-tegra.c b/drivers/soc/tegra/fuse/fuse-tegra.c
index c34efa5bf44c..b6bfd6729df3 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra.c
@@ -345,6 +345,9 @@ u32 __init tegra_fuse_read_early(unsigned int offset)
 
 int tegra_fuse_readl(unsigned long offset, u32 *value)
 {
+	if (!fuse->dev)
+		return -EPROBE_DEFER;
+
 	/*
 	 * Wait for fuse->clk to be initialized if device-tree boot is used.
 	 */
-- 
2.34.1

