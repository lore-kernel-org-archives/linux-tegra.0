Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011058.outbound.protection.outlook.com [52.101.62.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A08A423A7B;
	Tue, 16 Jun 2026 09:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781603774; cv=fail; b=P0IuzrOiT2fXfRQpx2Cum6O7IvgiYRy7UfJtDjGM1rbr/L5atwS/T0qvgubqv41pokkZwmGyYGU35n+oNuhcXara72yGR4oSKvtUD+L1KoUy8Tmu6LhiADszKEboityhJNv3fJkNoga30iKrv59XF60k8f0WhyDmP35Uz2xuldg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781603774; c=relaxed/simple;
	bh=S9056EOrXBC7fwVQhql6LWCyn8BoR3KtPfAhaADjF7A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uBb+agit+2Z5wVhxvlKJUmiTDHMd7ut6rYzpENk/2FMhPnRPkGpFJ/KifRiIyz63dDHJo8geU8aFG4Qop7MC61NnU8wfIG2IpujTSGpf5WfPdbNdE7IA3CCSmDwVk/kEm4q7Jhfy9QVYQ/NQSjrfm4c+N3hoJ2Ul6VHssXZiOBE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=eW5YtZ+f; arc=fail smtp.client-ip=52.101.62.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="eW5YtZ+f"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gl0rfL68C2v2k4ITxwcZfmbwunmZe95xrVxGaPCPG8Ac1MBO6ssGb/fQ+caDH7SXMmjRevLyY6Hz3V8246CuK/IFIeCYWRCCgrnZnYH3FAocSnn0XbCj1JOnprxyFleanFs99xpLq8JImRGIFvJygKQKx1BUpyaXYyjS42R9YhVNKE8HUJy9RPjkFIiYA1D/K4VSPjOIikF8LcKYD6S3fuvsjCgiVcTuVxTN9pOUX0uYe9bJQM7IRKpLHSmxRNB+Y4huw5clnoaAElkOTULE1LG9xzAV8rdO0HPIo7l6xp112nhf2gF3Hc+hPH/LHt1wt1+LvahiVWRBmh1r0zX3rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VjnMM9CgDTiHeOYR35vRZ0Z025562Oeyts2eOGgavJ4=;
 b=uHP5mjpIxEOkphqRNSpn70AoEaRgnq0T+FwuSTJqWztmpeuJSDrB7dNNcQ2C9kN+1SWjYwyvbL/GKvnI3hom0Xpr92eilJyg/Q7hLD1fr3hbz+PLI2Hcjkyp/RxCYmHCx+L0DlNSQo77EUuABvcZjTv0RQYK54D+A+mHwoiAviqSpU7VTnbSQ87rLssA9mXUR3GYXSiWFq7G0ULGT5rKnbBteWjmYMQT9N3zQkiDcjNZkPmeDMRoeXqfhpwjtjtLAdCTkVoSj3E+7eKGrKDsUdGDTkY+ZuNY9QtrR61Z9B2XF7hTzova1J4KpRyRjoA4goWq//sa9x0WXidG7bLi1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VjnMM9CgDTiHeOYR35vRZ0Z025562Oeyts2eOGgavJ4=;
 b=eW5YtZ+fMUuu1dGDFv6DtPVYMWNSODn7uyvtX8XnfbgyGxS4S8VXN1FxoUh7HlLEFLTO4mnSPLXfZgu3tDluZKfgmBb/4gI2wRS/xoIy7KiHEiaMunq+vTV6oK3yQ9zZ1RiwimaYXrI3Wh+PnE+mk6Gv5YnRf9Cgw6DynQn1YX3zGblOQZIJXkv0UucwWZCDBLNlYCn67iCpKX3b1kP7LuqdsIToNzGQg7I/i2Mn2tiGuqLOMrOV2rdjFi/JL+b9R7L3oVXlVWvzMOyeYsazvmRQl2Q1Hswqhks67IMwGmVkMMgVSWxhJ5eruF/bH/+WQOSgm0ySZwUOiqukMrfKJg==
Received: from MN0P223CA0012.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:52b::13)
 by MN2PR12MB4423.namprd12.prod.outlook.com (2603:10b6:208:24f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Tue, 16 Jun
 2026 09:56:06 +0000
Received: from MN1PEPF0000F0E4.namprd04.prod.outlook.com
 (2603:10b6:208:52b:cafe::76) by MN0P223CA0012.outlook.office365.com
 (2603:10b6:208:52b::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Tue,
 16 Jun 2026 09:56:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 MN1PEPF0000F0E4.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Tue, 16 Jun 2026 09:56:06 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 16 Jun
 2026 02:55:51 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Tue, 16 Jun 2026 02:55:51 -0700
Received: from build-akhilrajeev-noble-20260602.internal (10.127.8.11) by
 mail.nvidia.com (10.126.190.182) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Tue, 16 Jun 2026 02:55:47 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: Frank Li <Frank.Li@nxp.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
	Philipp Zabel <p.zabel@pengutronix.de>, Jon Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>, <linux-i3c@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Akhil R
	<akhilrajeev@nvidia.com>
Subject: [PATCH v4 04/12] i3c: master: Add support for devices using SETAASA
Date: Tue, 16 Jun 2026 09:54:18 +0000
Message-ID: <20260616095429.3947205-5-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260616095429.3947205-1-akhilrajeev@nvidia.com>
References: <20260616095429.3947205-1-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E4:EE_|MN2PR12MB4423:EE_
X-MS-Office365-Filtering-Correlation-Id: 00df36ee-de3c-4c3f-79f4-08decb8d7c0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|7416014|1800799024|23010399003|3023799007|56012099006|6133799003|11063799006|5023799004|13003099007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	vYckL3pMvD5RhvLDA4YkDW4mQQfK8v9yij8He/xYdgNJEO4zj0ex+QJ3Kr/LKlgbnlS+xiFk6WNgj5VfnqwhlhgqT/UAlHL/2jxrbaKHXpg2lVITOUICSiJff3DnSn3tAx5m+T7WyTrpPAKZ6BEQsN7Uzf6SnN1YXJkaCPZMThOcAL1zLSYDlLCw1YNynKWGHK8oz3Adp3LAuIvCyuy4VusVMUWHzHb/9yVW4BCOlWk+BG+oDpf6fQbyhQeQYlqGb8AzNjAI4/ML9zZIQCX7DxSG5U25EVcTkpAR6tRJK8M4ZbLZ6jR/OMzh77Uic+xlSf+pRQH58/sLGWYJ6XgT6uxQ4UTb2xv5CJlSw1xGgQFQofKtA2x5PLuzUhBBLEBpBT2Y5xOe5wjmoRCdo3pmjdBa4sQLLFvySBKMXDUQDDC3LTDVZqqFCjsG2pQVmpNzp8JueK5lo9rc/TDrOKXb9TsTH3dzWeoorJujeg/cMLR96b5j5+GwSy+jNUHWPWxTcwB1j/EPRU8o0EtuD+PWzCSslmJg9iNJ3AROuwYfWIAjspCqXYlO25uVuqMpXMW0yBDQUfp5vlDK5BVYYg5tEqI04IE6UdimlJSyhe88wleJ0AdBTTtvQ4U6x76bQROOCLEGvvxS22OzClMhmrK6AC/quOv53pTVKNjcU35y1QxgJM50oBbZofMgyUrO/eU0gGyLCLNyEp1oaVFxPQQUj+pCKUSVpSzZj9x7ME9tHnMMtkrEi+PfbiBunL9SeBc0
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(7416014)(1800799024)(23010399003)(3023799007)(56012099006)(6133799003)(11063799006)(5023799004)(13003099007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mk+GW/T7k+IoSYiQB1MUuOpnNwLvvKNBsKRSfaWtyrDVR3KcjTeULAIUP81rIrZp74d1ezh0RpvJRFDhYsES4/5QQQuc9P436DkE9OOk3AFwU8NQxwbxhECnOFYjAFeppvIZNBuwv39rg2CXI0VgtcAMsjDRpAD33obax+AgmQbgT/wXzn37nV3fus1DKx/oaGo0W3K11Ftjn91w2iTsOXCPi09H4DEVm5JW0OK4SUZFVICHiH7G6aU7fbbGRy013BG6d8syOjADXqn7Y+/xTyUu43il2oaqvy54v7S+FOx6VhnoMcXuJZYhwvv+tUnG67HY8Q493dUEeizVTuQBqGWofHqphZ3zn+/pPtrfIBxw9VEHTKlGAc4qHVDuvm1yxSd93jVCv2BzTRR9tGlbmumE/X+rKAoUQ2nBp30t/QKAEbNeRLyG1saKXnDRw7I2
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 09:56:06.3065
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00df36ee-de3c-4c3f-79f4-08decb8d7c0a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4423

Add support for devices using SETAASA, such as SPD5118 and SPD5108
attached to DDR5 memory modules that do not support ENTDAA. Follow the
guidelines proposed by the MIPI Discovery and Configuration
Specification [1] for discovering such devices.

SETAASA (Set All Addresses to Static Address) differs from standard I3C
address assignment that uses ENTDAA or SETDASA to assign dynamic
addresses. Devices using SETAASA assign their pre-defined static addresses
as their dynamic addresses during DAA, and it is not mandatory for these
devices to implement standard CCC commands like GETPID, GETDCR, or GETBCR.
For such devices, it is generally recommended to issue SETHID (specified
by JEDEC JESD300) as a prerequisite for SETAASA to stop HID bit flipping.

[1] https://www.mipi.org/mipi-disco-for-i3c-download

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/i3c/master.c       | 83 +++++++++++++++++++++++++++++++++++++-
 include/linux/i3c/ccc.h    |  1 +
 include/linux/i3c/master.h | 15 +++++++
 3 files changed, 97 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index f0e05bcac26d..557332d93257 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -5,6 +5,7 @@
  * Author: Boris Brezillon <boris.brezillon@bootlin.com>
  */
 
+#include <dt-bindings/i3c/i3c.h>
 #include <linux/acpi.h>
 #include <linux/atomic.h>
 #include <linux/bitmap.h>
@@ -1092,6 +1093,51 @@ static int i3c_master_rstdaa_locked(struct i3c_master_controller *master,
 	return ret;
 }
 
+/**
+ * i3c_master_setaasa_locked() - start a SETAASA procedure (Set All Addresses to Static Address)
+ * @master: I3C master object
+ *
+ * Send a SETAASA CCC command to set all attached I3C devices' dynamic addresses to
+ * their static address.
+ *
+ * This function must be called with the bus lock held in write mode.
+ *
+ * First, the SETHID CCC command is sent, followed by the SETAASA CCC.
+ *
+ * Return: 0 in case of success, a positive I3C error code if the error is
+ * one of the official Mx error codes, and a negative error code otherwise.
+ */
+static int i3c_master_setaasa_locked(struct i3c_master_controller *master)
+{
+	struct i3c_ccc_cmd_dest dest;
+	struct i3c_ccc_cmd cmd;
+	int ret;
+
+	/*
+	 * Send SETHID CCC command. Though it is a standard CCC command specified
+	 * in JESD300-5, we are not defining a separate macro to be explicit that
+	 * the value falls under the vendor specific range.
+	 */
+	i3c_ccc_cmd_dest_init(&dest, I3C_BROADCAST_ADDR, 0);
+	i3c_ccc_cmd_init(&cmd, false, I3C_CCC_VENDOR(0, true), &dest, 1);
+	ret = i3c_master_send_ccc_cmd_locked(master, &cmd);
+	i3c_ccc_cmd_dest_cleanup(&dest);
+	if (ret && cmd.err == I3C_ERROR_M2)
+		ret = 0;
+	if (ret)
+		return ret;
+
+	/* Send SETAASA CCC command */
+	i3c_ccc_cmd_dest_init(&dest, I3C_BROADCAST_ADDR, 0);
+	i3c_ccc_cmd_init(&cmd, false, I3C_CCC_SETAASA, &dest, 1);
+	ret = i3c_master_send_ccc_cmd_locked(master, &cmd);
+	i3c_ccc_cmd_dest_cleanup(&dest);
+	if (ret && cmd.err == I3C_ERROR_M2)
+		ret = 0;
+
+	return ret;
+}
+
 /**
  * i3c_master_entdaa_locked() - start a DAA (Dynamic Address Assignment)
  *				procedure
@@ -1852,6 +1898,22 @@ static int i3c_master_early_i3c_dev_add(struct i3c_master_controller *master,
 	if (ret)
 		goto err_free_dev;
 
+	/*
+	 * For devices using SETAASA instead of ENTDAA, the address is statically
+	 * assigned. Update the dynamic address to the provided static address.
+	 * Reattach the I3C device after updating the dynamic address with the same
+	 * static address. It is not mandatory for such devices to implement CCC
+	 * commands like GETPID, GETDCR etc. Hence, we can return after reattaching.
+	 */
+	if (i3cdev->boardinfo->static_addr_method & I3C_ADDR_METHOD_SETAASA) {
+		i3cdev->info.dyn_addr = i3cdev->boardinfo->static_addr;
+		ret = i3c_master_reattach_i3c_dev(i3cdev, 0);
+		if (ret)
+			goto err_detach_dev;
+
+		return 0;
+	}
+
 	ret = i3c_master_setdasa_locked(master, i3cdev->info.static_addr,
 					i3cdev->boardinfo->init_dyn_addr);
 	if (ret)
@@ -2206,6 +2268,12 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
 	if (ret)
 		goto err_bus_cleanup;
 
+	if (master->addr_method & I3C_ADDR_METHOD_SETAASA) {
+		ret = i3c_master_setaasa_locked(master);
+		if (ret)
+			goto err_bus_cleanup;
+	}
+
 	/*
 	 * Reserve init_dyn_addr first, and then try to pre-assign dynamic
 	 * address and retrieve device information if needed.
@@ -2696,7 +2764,7 @@ i3c_master_add_i3c_boardinfo(struct i3c_master_controller *master,
 	struct i3c_dev_boardinfo *boardinfo;
 	struct device *dev = &master->dev;
 	enum i3c_addr_slot_status addrstatus;
-	u32 init_dyn_addr = 0;
+	u32 init_dyn_addr = 0, static_addr_method = 0;
 
 	boardinfo = devm_kzalloc(dev, sizeof(*boardinfo), GFP_KERNEL);
 	if (!boardinfo)
@@ -2714,7 +2782,14 @@ i3c_master_add_i3c_boardinfo(struct i3c_master_controller *master,
 
 	boardinfo->static_addr = reg[0];
 
-	if (!fwnode_property_read_u32(fwnode, "assigned-address", &init_dyn_addr)) {
+	if (!fwnode_property_read_u32(fwnode, "mipi-i3c-static-method", &static_addr_method))
+		boardinfo->static_addr_method = static_addr_method &
+					(I3C_ADDR_METHOD_SETDASA | I3C_ADDR_METHOD_SETAASA);
+
+	if (boardinfo->static_addr_method & I3C_ADDR_METHOD_SETAASA) {
+		/* For SETAASA, static address is taken as the dynamic address. */
+		init_dyn_addr = boardinfo->static_addr;
+	} else if (!fwnode_property_read_u32(fwnode, "assigned-address", &init_dyn_addr)) {
 		if (init_dyn_addr > I3C_MAX_ADDR)
 			return -EINVAL;
 
@@ -2724,6 +2799,9 @@ i3c_master_add_i3c_boardinfo(struct i3c_master_controller *master,
 			return -EINVAL;
 	}
 
+	/* Update the address methods required for device discovery */
+	master->addr_method |= boardinfo->static_addr_method;
+
 	boardinfo->pid = ((u64)reg[1] << 32) | reg[2];
 
 	if ((boardinfo->pid & GENMASK_ULL(63, 48)) ||
@@ -3358,6 +3436,7 @@ int i3c_master_register(struct i3c_master_controller *master,
 	master->dev.release = i3c_masterdev_release;
 	master->ops = ops;
 	master->secondary = secondary;
+	master->addr_method = I3C_ADDR_METHOD_SETDASA;
 	INIT_LIST_HEAD(&master->boardinfo.i2c);
 	INIT_LIST_HEAD(&master->boardinfo.i3c);
 
diff --git a/include/linux/i3c/ccc.h b/include/linux/i3c/ccc.h
index ad59a4ae60d1..a145d766ab6f 100644
--- a/include/linux/i3c/ccc.h
+++ b/include/linux/i3c/ccc.h
@@ -32,6 +32,7 @@
 #define I3C_CCC_DEFSLVS			I3C_CCC_ID(0x8, true)
 #define I3C_CCC_ENTTM			I3C_CCC_ID(0xb, true)
 #define I3C_CCC_ENTHDR(x)		I3C_CCC_ID(0x20 + (x), true)
+#define I3C_CCC_SETAASA			I3C_CCC_ID(0x29, true)
 
 /* Unicast-only commands */
 #define I3C_CCC_SETDASA			I3C_CCC_ID(0x7, false)
diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index 22b10cff476c..9323b6af051c 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -174,6 +174,14 @@ struct i3c_device_ibi_info {
  *		 assigned a dynamic address by the master. Will be used during
  *		 bus initialization to assign it a specific dynamic address
  *		 before starting DAA (Dynamic Address Assignment)
+ * @static_addr_method: Bitmap describing which methods of Dynamic Address
+ *		 Assignment from a Static Address are supported by this I3C Target.
+ *		 A value of 1 in a bit position indicates that the I3C target
+ *		 supports that method, and a value of 0 indicates that the I3C
+ *		 target does not support that method.
+ *		 Bit 0: SETDASA
+ *		 Bit 1: SETAASA
+ *		 All other bits are reserved.
  * @pid: I3C Provisioned ID exposed by the device. This is a unique identifier
  *	 that may be used to attach boardinfo to i3c_dev_desc when the device
  *	 does not have a static address
@@ -189,6 +197,7 @@ struct i3c_dev_boardinfo {
 	struct list_head node;
 	u8 init_dyn_addr;
 	u8 static_addr;
+	u8 static_addr_method;
 	u64 pid;
 	struct fwnode_handle *fwnode;
 };
@@ -517,6 +526,11 @@ struct i3c_master_controller_ops {
  * @boardinfo.i2c: list of I2C boardinfo objects
  * @boardinfo: board-level information attached to devices connected on the bus
  * @bus: I3C bus exposed by this master
+ * @addr_method: Bitmap describing which methods of Address Assignment required
+ *		 to be run for discovering all the devices on the bus.
+ *		 Bit 0: SETDASA
+ *		 Bit 1: SETAASA
+ *		 All other bits are reserved.
  * @wq: freezable workqueue which can be used by master
  *	drivers if they need to postpone operations that need to take place
  *	in a thread context. Typical examples are Hot Join processing which
@@ -552,6 +566,7 @@ struct i3c_master_controller {
 		struct list_head i2c;
 	} boardinfo;
 	struct i3c_bus bus;
+	u8 addr_method;
 	struct workqueue_struct *wq;
 	struct work_struct hj_work;
 	struct work_struct reg_work;
-- 
2.43.0

