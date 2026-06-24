Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010037.outbound.protection.outlook.com [52.101.85.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA0C224B1E;
	Wed, 24 Jun 2026 10:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782296620; cv=fail; b=aHelHRbEHNaZyAzd4mEqGDjc+/yLSfMWKAJOlfpsMuPeW8CTYytCrHzoRGoSkusMJ/NvgCtOeGqT9Fn5chsNkMaGQEjjraDkkjLbP8UC+cGPg7saaVv9lfIDJko+kEk4BSGsEQgfuakF32VTsMyL+Cjryxm4a+cgFaXq7DT5eHk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782296620; c=relaxed/simple;
	bh=6uHjuVHp4RHxonffbKemVVdd6NZ2YgUkF1R69MuXdUY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OBAnwrVz9y+bzIcc57ReGMU1Ax5U1dYbIXUOQ9/g+8vhSSUlku6N6NVsWfnxUrb9g1MTewmFM8CaioxkHFP5aRV/bomAVQXFYl6R9HK38eoQ3wFwhpm/BFHmgwT8RcIzjMfQ4JOZZmk6ZyRIAe9q4rm92O+kNwEHAv5mV2oeQoI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=GvqiEU4E; arc=fail smtp.client-ip=52.101.85.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="GvqiEU4E"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cPVctdE7azFC3xOZhWgqLbus8Z4E3N+Wq3V3KI7GuDP0Jjjjh0wuDNcnbPeomEBQse71oAjFJxYMqHe5qv7plTO/q2ux+KYjB2pcwJEMKY687w2f/lyKKpbF+/5BjMtvvYCPYxhZCSAf2SD4MB8Nnx5rVZYeFJznvpX2uyqRgFCDeMKe6pa3BJs+FnF700bE1e0knJ32jpYONrI8yA6Jsyw3ut6yGhZ00Gt+Wvj2UsV4FS8hEzeSOGwfPDpPi4+sgrI0PvoGLIOYzO3gTJqLuDsJqzc20UmP7qaLQFfx4DuGOpayHM1qq4Vhgcce5qab+kXC/k83Zl5raHimtBc23g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uy59+mI0jYGDhZD9icpz4WVLiErmSpaXkLBG2zlIc3U=;
 b=HBcUaWlNTN5B2WOes3pmTOTilV//Qq22Ce5UblmZchxXTCuSo6s/J5Jzbk1pBuxvOkF/WNhDE/WzgrMxSiWimclmdkrEdFYYidIoQnlNmAgN7yEi02jImgYsPmqz8LMyQMt7YBAXA4IdgOB+7afXS4TkOeZX7uz13TGSjiyxMazBViXGjjB2Yjm1AYi57xJz+KZc5O1DsYPK+WeDm6PEzC/ltFjPv94VGXV+kOTtYKC5hiHLQZ7hfpdVjhNuta7aveyeoVX3/2GvXMKR3rgLrCoTDgwaxjpomibnKMrLkJ9FO3Lj8EulNGOoBkyeEC3Z6ERzldf6xb++PX6mF9hWig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uy59+mI0jYGDhZD9icpz4WVLiErmSpaXkLBG2zlIc3U=;
 b=GvqiEU4ES92IcRig9WJMaqxiJC7tyjCkp1O0aoRCYyHmCnBk4kqaH5BjZso4hGRtzlAln6opkRZV7qogzWWTzlleZnm2F6uDgGtuZ6sR5Q/uZ47Nq+5Rvf63M5cgb6CHjZC6KSuajpY7ZFVhFWfwuPQoTpDRsKf+cu2WMTBl7QGWSKUe1id1uvjkyuemjDg8/2lOJMXtnQSDe8KOn4w9xVHkWywZCpgpxSPeTFGwl1sRJL1gv+3dzueaFXqZMyGMy/hCdNVeHEW2dOJchoIbJp/G1L+GnYDGSV0IQ6k1JHUnnDjmax/3/inXMW9SVKiRBxTwbdCcdMU1fuIjzS66JA==
Received: from DS7PR05CA0004.namprd05.prod.outlook.com (2603:10b6:5:3b9::9) by
 MN0PR12MB5931.namprd12.prod.outlook.com (2603:10b6:208:37e::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.13; Wed, 24 Jun 2026 10:23:32 +0000
Received: from CY4PEPF0000EE39.namprd03.prod.outlook.com
 (2603:10b6:5:3b9:cafe::14) by DS7PR05CA0004.outlook.office365.com
 (2603:10b6:5:3b9::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.14 via Frontend Transport; Wed,
 24 Jun 2026 10:23:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000EE39.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Wed, 24 Jun 2026 10:23:31 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 24 Jun
 2026 03:23:15 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 24 Jun
 2026 03:23:13 -0700
Received: from build-akhilrajeev-noble-20260602.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Wed, 24 Jun 2026 03:23:08 -0700
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
Subject: [PATCH v5 04/12] i3c: master: Add support for devices using SETAASA
Date: Wed, 24 Jun 2026 10:20:58 +0000
Message-ID: <20260624102153.1770072-5-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260624102153.1770072-1-akhilrajeev@nvidia.com>
References: <20260624102153.1770072-1-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE39:EE_|MN0PR12MB5931:EE_
X-MS-Office365-Filtering-Correlation-Id: 09f1f61d-4c38-44d2-e23b-08ded1daa3d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|7416014|1800799024|23010399003|22082099003|18002099003|5023799004|11063799006|56012099006|6133799003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info:
	9nv1kzq7VEXQe4saNS6JYa/OXnvqqqyMb2nqBJ0mwAdlKkmtopUhHX6T902ObIEfwsninFITV2aSd1Mgzszuntj3M84k5cLpP0eQcoCYWIgJLOkH+ekELVRkda7/a/tptqIkq+NZAIEOmY/osEtqO909ZaSTfUBUZ9hpj49tkzwyQRCOQ1+g4BiYHl3HHmZtZpY7OYaE2QNGcthAPE00VWWGdsI/i86fnhPB8uumtDvGc6n32Wem0O2Vue7u6H35OhVJ3Y5NGsmF6jW78eZht/AyvxPxvID4yhoRBSz8EvQpsLzODgAFajczRnkdot+gtDmOkGPPS+L7Y3I3bqluZApzPuHugXlUxpnuYVk0/aWbqbTkRIH+Wf+kGLEJxLe/4ioX2x8gnWN++uqMWlOQMPTOLIowe18BO19Ggo2AcVPqokihCvTtCkitI2D68IdC4b7PG/g2soFGzLNB4JH69/3MnDxR5l4ygquC3HiYwy5/Ay1qX/z1CCh8NFpzEyUJ6TZucP1j2rHXkANV5lqtXY94nX1NONDTSr6nlxJBOsNJ38IVDysRjYO2Rb5faY2gvOJJrda9uTgcSP4EqQ8CxaM63HWcIXKy5w4TKslKNdZwNGmoC1ZF2iPlyXdxXtwmJ3vZyhtP7/1BfTCpatcrcwLkWW5vVoe3oWXFeIvYIUp+WiQglDN7F5NZe3kFDle4kUsHJPQJZeE9Ov/Y5H7Cyw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(7416014)(1800799024)(23010399003)(22082099003)(18002099003)(5023799004)(11063799006)(56012099006)(6133799003)(13003099007)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	XGVVUQaGdnjVTwY/sdQkH7UurSV+y6Pdx7JI/B/DnclO6/AEgpo10QEWxheHK1FUWMV7sMhiHz5qAjHRpeLLlZD3p1Q++UCAn11qmNvGTU2vno7yVjx3xQ+IJSA94JeusXyF7gukJpW80L0sBM9u0YkvPEuhoVlU/by0e51SzDeyZgGbv7yfaVDzilhedfoU6SFaDEtLO6N6IumNUulRAnAN77CFsAMq9nShI4FDAvAjU2EI4eDWyhdjHVARwlH0i2Ce/6kDika5R/0RM6SBPpB6zsTYooultxaXpzFEjT9unT8QxBRPddNdEy7FD5Q/GBctwScraOIsbNcQWuT8nuG1jYVHsBJ2A4Qr0XwEd1ppA5pR52Wf3bbmp7jRlgzicwcmIIQ6q5GYmgbuTlRD9HuyOdsY2doaWkzX2Qyvzz9Rs3gkRBaiuY+Df7R17MAX
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 10:23:31.3618
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09f1f61d-4c38-44d2-e23b-08ded1daa3d4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE39.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5931

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
index 4bba2bad897a..3deae8cdae52 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -5,6 +5,7 @@
  * Author: Boris Brezillon <boris.brezillon@bootlin.com>
  */
 
+#include <dt-bindings/i3c/i3c.h>
 #include <linux/acpi.h>
 #include <linux/atomic.h>
 #include <linux/bitmap.h>
@@ -1102,6 +1103,51 @@ static int i3c_master_rstdaa_locked(struct i3c_master_controller *master,
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
@@ -1878,6 +1924,22 @@ static int i3c_master_early_i3c_dev_add(struct i3c_master_controller *master,
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
+		ret = i3c_master_reattach_i3c_dev_locked(i3cdev, 0);
+		if (ret)
+			goto err_rstdaa;
+
+		return 0;
+	}
+
 	ret = i3c_master_setdasa_locked(master, i3cdev->info.static_addr,
 					i3cdev->boardinfo->init_dyn_addr);
 	if (ret)
@@ -2232,6 +2294,12 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
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
@@ -2724,7 +2792,7 @@ i3c_master_add_i3c_boardinfo(struct i3c_master_controller *master,
 	struct i3c_dev_boardinfo *boardinfo;
 	struct device *dev = &master->dev;
 	enum i3c_addr_slot_status addrstatus;
-	u32 init_dyn_addr = 0;
+	u32 init_dyn_addr = 0, static_addr_method = 0;
 
 	boardinfo = devm_kzalloc(dev, sizeof(*boardinfo), GFP_KERNEL);
 	if (!boardinfo)
@@ -2742,7 +2810,14 @@ i3c_master_add_i3c_boardinfo(struct i3c_master_controller *master,
 
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
 
@@ -2752,6 +2827,9 @@ i3c_master_add_i3c_boardinfo(struct i3c_master_controller *master,
 			return -EINVAL;
 	}
 
+	/* Update the address methods required for device discovery */
+	master->addr_method |= boardinfo->static_addr_method;
+
 	boardinfo->pid = ((u64)reg[1] << 32) | reg[2];
 
 	if ((boardinfo->pid & GENMASK_ULL(63, 48)) ||
@@ -3386,6 +3464,7 @@ int i3c_master_register(struct i3c_master_controller *master,
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
index a16deb04b2e1..2dc139a217bf 100644
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

