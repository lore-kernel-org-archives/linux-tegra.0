Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012007.outbound.protection.outlook.com [52.101.48.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519ED285CB6;
	Wed, 18 Mar 2026 17:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773854995; cv=fail; b=TEPax8rss8O78BBWw43pHGngKdx8HxcbHIA45kKIr6SkgIcI81Wkl610LSgMH3Cfmigf8LRNAZ8MFIkwhMbXOjraIiUZZ2b5bSyQPFSyjIVP3P4Dr4CvDgKBsij9hPNTOQ4Zs2VFPUblJVSbBL97OitPOVGCMMhAaTCk/Swtlfg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773854995; c=relaxed/simple;
	bh=vImboSbOHIHmeQf/B5Z9QRLkKFJelAANW/XcrSIyr40=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DllQRq+HgURyHyaRgGBskw6a8MDOz3g+Iqd09s7PMJEf2uQgpLMutyDHRUfGOV4Sij9XIcWwcNSnrhg8rkLTnGY/R6Tzjw3oiaeNrHAOluSADZkY0B+PK5aVFrJnIvlXaRiZy7XoKRcxzKLuK0g9dii8uz7zU7VGev+0DyvN6RQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ovDW8m72; arc=fail smtp.client-ip=52.101.48.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ovDW8m72"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PoZzer55pGAuKk3PPdL4bD89IA6YRRvnpTR7uANxV9YkVvd4EYw7C/gHPOGHz5YRbC4WPq1lp+QcTWgaWcklEXzm3zaFza67X1Y1+kRRkULMYr/3khCVEMJsI6eGJLVhscNB9HzBKDJfQ1bWhHVI6Dv4eo0t7Byqo76Hi9VYOYCRQtl2zApUlt9Yj+bLqK2f+7+YjdxPXEd23SCbmETt7nwGLRE2qECOpbl5cAsyxP19FjA2uvJOtyXwNvADnfqSxo7qFYMVn0ZgpGBvbtZSgK261HXDhZSjY0++b2z5lpdY99AECDUoa2Fc6sOSKnvGCd87yCDN4VEeohhAmzw3PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/DyxyFMtabEp5l1Jt2cx1jtrhl0hbQTqx6UkfoBKIvQ=;
 b=KoQF/P5nojIXY8Gxw27wWl2ro8aMutIepmPG6veIJU18g5x698XKGDpaZb9VJu8UE2asRpMchPO/C2704mO1RCMtarAI5p9tZ1RNgvHANRFByCa0cQfzjK3jZUmIvHZQJZ6xant7Cp9zw7CVq/X28z7ZsVtei/xU+iHL6iUV9O+f7+77nyog8Qbgj0pXlfA3EzrEV538nVXM3zr9Dc7ysCEpB16LcGNOLC4s4qWgeWH2DC8fv9+wDM+PyD96hsADKu4qJE1I179+jUaA6YJOE4cIxPdXbAyhfEUrGyU4M/0A8Xy6RWq8sRSse3EAak/J1AH0soQxjloY7VuWedSBJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/DyxyFMtabEp5l1Jt2cx1jtrhl0hbQTqx6UkfoBKIvQ=;
 b=ovDW8m72IpSTVwujuapSCgOwDOB48UDjrMydbTzhwhIFpGFaW4w3NiLALSUP+zEcBi/e+g+Hvf29bBYlre5kvGa6r/Zp/PM36HfKCnnvm3CMREx7jow9NV3To6xbYISf4iMspfKXUuBu/7w/S1dir8qFdmrHtyJTPHqDgx6x5M+LndkOWAeV+CT0LGlLdqmwM0I5K3P5CXuaRQdBx6xgVtL92v3YTeutcd+favhOl2rgAx4W/GzOdw94JITYAcs3xSsmANRYZ4I4gpsCUupWZYPoLQUFmTxTf9hsfxduUcQ7COPoWgr7g2f98GytoBV2sE4LarH63ygEv/K3Old0aw==
Received: from DS7PR03CA0226.namprd03.prod.outlook.com (2603:10b6:5:3ba::21)
 by CH1PR12MB9622.namprd12.prod.outlook.com (2603:10b6:610:2b2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.12; Wed, 18 Mar
 2026 17:29:38 +0000
Received: from DM2PEPF00003FC4.namprd04.prod.outlook.com
 (2603:10b6:5:3ba:cafe::b3) by DS7PR03CA0226.outlook.office365.com
 (2603:10b6:5:3ba::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Wed,
 18 Mar 2026 17:29:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DM2PEPF00003FC4.mail.protection.outlook.com (10.167.23.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Wed, 18 Mar 2026 17:29:35 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Mar
 2026 10:29:17 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Mar
 2026 10:29:16 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 18 Mar 2026 10:29:10 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	<Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Rafael J .
 Wysocki" <rafael@kernel.org>, Robert Moore <robert.moore@intel.com>, "Len
 Brown" <lenb@kernel.org>, Guenter Roeck <linux@roeck-us.net>, Philipp Zabel
	<p.zabel@pengutronix.de>, Eric Biggers <ebiggers@kernel.org>, "Fredrik
 Markstrom" <fredrik.markstrom@est.tech>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Thierry Reding <thierry.reding@kernel.org>, "Jon
 Hunter" <jonathanh@nvidia.com>, Suresh Mangipudi <smangipudi@nvidia.com>,
	<linux-tegra@vger.kernel.org>, <linux-i3c@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-acpi@vger.kernel.org>, <acpica-devel@lists.linux.dev>,
	<linux-hwmon@vger.kernel.org>
CC: Akhil R <akhilrajeev@nvidia.com>
Subject: [PATCH 03/12] i3c: master: Use unified device property interface
Date: Wed, 18 Mar 2026 22:57:16 +0530
Message-ID: <20260318172820.13771-4-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260318172820.13771-1-akhilrajeev@nvidia.com>
References: <20260318172820.13771-1-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC4:EE_|CH1PR12MB9622:EE_
X-MS-Office365-Filtering-Correlation-Id: 969a8c6e-bf0a-44bb-75b8-08de8513ecfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|7416014|82310400026|1800799024|56012099003|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info:
	ej+zICg4bNVepXK/1GH+c+3UEvJUU8bg/SW+dbJGtkzo9OjuNyxv2RGorwQn4xOUCb1w8awx7uigU9PFCq6AzDkyeIF8eAkrS+41B0sdcq2TSU03Ni9z2eCU7I+r+jvwYhhT/UfZlDfP0RgRlaZGMxSCG+EB/nZJtqjemkowH7SUKPDF+RYWagPmiZ0go8bRpyOiqjBf/odPMAzJll9yIcrx6kcqKXG0OYGOQB4AiwUrRjyfxJ1MExGmruv46Q29fFlbLtTfqHW7u5pIWxD9bDxE+JoLyXNmSTdfIY1fJ1jAjgnFkUraAgIACgJinBaBnO6XOX5K3R18GfF+YE1iVIstvWx03W32wiKUX71SHdLf8UrJZl7UjKn4nkjWRXvehoc+Wv+SeGS8BOcuwX6hLkSNPSljHGRfOkxvMK/JgXKQKag7A2m2fDH6/Mp2aVSq41A9QFHq5lmZIBux9m6r9gLEja6znEHGtjSNAM4cYf0zxjKNOkc71f0X9WBwzvBgFIUC0wcMkbblZbNWkGPidYWOcodpGjQbZ7m1qu5ofezZ/sAvoq0knZxO0BT2lqX7hZFxazi5AdaV9TiZNC0VyVUAjktOpDE10FaW/m7GvhGI91mYtMgL4BrQYvQ4Iri8C2OPRkByM9ar5t4ZBl1malnQ1d+J0VFEERaUZVPY72t8VV+q45wTHwKULMwAzMXnQkLbg86sCdXpijeT4lu3OGOSTdJXMH/5UhYUHcOXcIrDuhASS/S+tyBdfgtRv4zzhsiFoXnj2MIzzwFAd7iv+Av1/SDI88angiSdAtWu5iaTq7AFVhjmxustO1VmfXTd
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(82310400026)(1800799024)(56012099003)(18002099003)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mmnaPrX0nvnKrPNcN9SM00bRPbEhmhedQyUeEHgwaDC2atyTgaO2RG+wY+sWEyiyekJ2H4PVjwqmvLsdiCmYpscCxJs+HW5oupWmI7glI1CfyCGv2dSZwUFfF6DGj/C0y8ktcBkh5M7df1E8/BaN4sEUSuqw86FJcQASW+RO+Opy1aTQ7lWhvyGZp7idRyELb22jE2BaLi+4QTaaWvD8drnjWoVe1Pbch2hHYEtBVtEW0pBR2aHbqzbn9Tc9KFiHZ6GLUeuilSjPRnR9T4QuGNhXHePO1Eop1vEFJHb4oR0Srv/ne0En+f3cNLMzIOxMtsXxuv3/Dk1/+WNnagIyKQ2+VZkhl/qhgnwH2nG1L6NLhQrS76sfHqe6Wq34/8mHpTGg2I1SVZbW1AQbxYtmDRKp82bLglKlBVTTKNVyor8ms49CrpjYu0wxfo8gDX8W
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 17:29:35.8384
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 969a8c6e-bf0a-44bb-75b8-08de8513ecfa
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM2PEPF00003FC4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9622

Replace all OF-specific functions with unified device property functions
as a prerequisite to support both ACPI and device tree.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/i3c/master.c       | 91 ++++++++++++++++++++++----------------
 include/linux/i3c/master.h |  5 ++-
 2 files changed, 55 insertions(+), 41 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index c32847bc4d0d..2c479fecbfdf 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -5,16 +5,19 @@
  * Author: Boris Brezillon <boris.brezillon@bootlin.com>
  */
 
+#include <linux/acpi.h>
 #include <linux/atomic.h>
 #include <linux/bug.h>
 #include <linux/device.h>
 #include <linux/dma-mapping.h>
 #include <linux/err.h>
 #include <linux/export.h>
+#include <linux/i2c.h>
 #include <linux/kernel.h>
 #include <linux/list.h>
 #include <linux/of.h>
 #include <linux/pm_runtime.h>
+#include <linux/property.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/workqueue.h>
@@ -497,7 +500,7 @@ static void i3c_bus_cleanup(struct i3c_bus *i3cbus)
 	mutex_unlock(&i3c_core_lock);
 }
 
-static int i3c_bus_init(struct i3c_bus *i3cbus, struct device_node *np)
+static int i3c_bus_init(struct i3c_bus *i3cbus, struct fwnode_handle *fwnode)
 {
 	int ret, start, end, id = -1;
 
@@ -507,8 +510,8 @@ static int i3c_bus_init(struct i3c_bus *i3cbus, struct device_node *np)
 	i3c_bus_init_addrslots(i3cbus);
 	i3cbus->mode = I3C_BUS_MODE_PURE;
 
-	if (np)
-		id = of_alias_get_id(np, "i3c");
+	if (fwnode && is_of_node(fwnode))
+		id = of_alias_get_id(to_of_node(fwnode), "i3c");
 
 	mutex_lock(&i3c_core_lock);
 	if (id >= 0) {
@@ -811,7 +814,7 @@ static void i3c_masterdev_release(struct device *dev)
 	WARN_ON(!list_empty(&bus->devs.i2c) || !list_empty(&bus->devs.i3c));
 	i3c_bus_cleanup(bus);
 
-	of_node_put(dev->of_node);
+	fwnode_handle_put(dev->fwnode);
 }
 
 static const struct device_type i3c_masterdev_type = {
@@ -995,7 +998,7 @@ static void i3c_device_release(struct device *dev)
 
 	WARN_ON(i3cdev->desc);
 
-	of_node_put(i3cdev->dev.of_node);
+	fwnode_handle_put(dev->fwnode);
 	kfree(i3cdev);
 }
 
@@ -1783,7 +1786,7 @@ i3c_master_register_new_i3c_devs(struct i3c_master_controller *master)
 			     desc->info.pid);
 
 		if (desc->boardinfo)
-			desc->dev->dev.of_node = desc->boardinfo->of_node;
+			device_set_node(&desc->dev->dev, desc->boardinfo->fwnode);
 
 		ret = device_register(&desc->dev->dev);
 		if (ret) {
@@ -2402,8 +2405,8 @@ EXPORT_SYMBOL_GPL(i3c_master_add_i3c_dev_locked);
 #define OF_I3C_REG1_IS_I2C_DEV			BIT(31)
 
 static int
-of_i3c_master_add_i2c_boardinfo(struct i3c_master_controller *master,
-				struct device_node *node, u32 *reg)
+i3c_master_add_i2c_boardinfo(struct i3c_master_controller *master,
+			     struct fwnode_handle *fwnode, u32 *reg)
 {
 	struct i2c_dev_boardinfo *boardinfo;
 	struct device *dev = &master->dev;
@@ -2413,9 +2416,13 @@ of_i3c_master_add_i2c_boardinfo(struct i3c_master_controller *master,
 	if (!boardinfo)
 		return -ENOMEM;
 
-	ret = of_i2c_get_board_info(dev, node, &boardinfo->base);
-	if (ret)
-		return ret;
+	if (is_of_node(fwnode)) {
+		ret = of_i2c_get_board_info(dev, to_of_node(fwnode), &boardinfo->base);
+		if (ret)
+			return ret;
+	} else {
+		return -EINVAL;
+	}
 
 	/*
 	 * The I3C Specification does not clearly say I2C devices with 10-bit
@@ -2431,14 +2438,14 @@ of_i3c_master_add_i2c_boardinfo(struct i3c_master_controller *master,
 	boardinfo->lvr = reg[2];
 
 	list_add_tail(&boardinfo->node, &master->boardinfo.i2c);
-	of_node_get(node);
+	fwnode_handle_get(fwnode);
 
 	return 0;
 }
 
 static int
-of_i3c_master_add_i3c_boardinfo(struct i3c_master_controller *master,
-				struct device_node *node, u32 *reg)
+i3c_master_add_i3c_boardinfo(struct i3c_master_controller *master,
+			     struct fwnode_handle *fwnode, u32 *reg)
 {
 	struct i3c_dev_boardinfo *boardinfo;
 	struct device *dev = &master->dev;
@@ -2461,7 +2468,7 @@ of_i3c_master_add_i3c_boardinfo(struct i3c_master_controller *master,
 
 	boardinfo->static_addr = reg[0];
 
-	if (!of_property_read_u32(node, "assigned-address", &init_dyn_addr)) {
+	if (!fwnode_property_read_u32(fwnode, "assigned-address", &init_dyn_addr)) {
 		if (init_dyn_addr > I3C_MAX_ADDR)
 			return -EINVAL;
 
@@ -2478,14 +2485,14 @@ of_i3c_master_add_i3c_boardinfo(struct i3c_master_controller *master,
 		return -EINVAL;
 
 	boardinfo->init_dyn_addr = init_dyn_addr;
-	boardinfo->of_node = of_node_get(node);
+	boardinfo->fwnode = fwnode_handle_get(fwnode);
 	list_add_tail(&boardinfo->node, &master->boardinfo.i3c);
 
 	return 0;
 }
 
-static int of_i3c_master_add_dev(struct i3c_master_controller *master,
-				 struct device_node *node)
+static int i3c_master_add_dev(struct i3c_master_controller *master,
+			      struct fwnode_handle *fwnode)
 {
 	u32 reg[3];
 	int ret;
@@ -2493,7 +2500,7 @@ static int of_i3c_master_add_dev(struct i3c_master_controller *master,
 	if (!master)
 		return -EINVAL;
 
-	ret = of_property_read_u32_array(node, "reg", reg, ARRAY_SIZE(reg));
+	ret = fwnode_property_read_u32_array(fwnode, "reg", reg, ARRAY_SIZE(reg));
 	if (ret)
 		return ret;
 
@@ -2502,25 +2509,25 @@ static int of_i3c_master_add_dev(struct i3c_master_controller *master,
 	 * dealing with an I2C device.
 	 */
 	if (!reg[1])
-		ret = of_i3c_master_add_i2c_boardinfo(master, node, reg);
+		ret = i3c_master_add_i2c_boardinfo(master, fwnode, reg);
 	else
-		ret = of_i3c_master_add_i3c_boardinfo(master, node, reg);
+		ret = i3c_master_add_i3c_boardinfo(master, fwnode, reg);
 
 	return ret;
 }
 
-static int of_populate_i3c_bus(struct i3c_master_controller *master)
+static int fwnode_populate_i3c_bus(struct i3c_master_controller *master)
 {
 	struct device *dev = &master->dev;
-	struct device_node *i3cbus_np = dev->of_node;
+	struct fwnode_handle *fwnode = dev_fwnode(dev);
 	int ret;
 	u32 val;
 
-	if (!i3cbus_np)
+	if (!fwnode)
 		return 0;
 
-	for_each_available_child_of_node_scoped(i3cbus_np, node) {
-		ret = of_i3c_master_add_dev(master, node);
+	fwnode_for_each_available_child_node_scoped(fwnode, child) {
+		ret = i3c_master_add_dev(master, child);
 		if (ret)
 			return ret;
 	}
@@ -2530,10 +2537,10 @@ static int of_populate_i3c_bus(struct i3c_master_controller *master)
 	 * on the bus are not supporting typical rates, or if the bus topology
 	 * prevents it from using max possible rate.
 	 */
-	if (!of_property_read_u32(i3cbus_np, "i2c-scl-hz", &val))
+	if (!device_property_read_u32(dev, "i2c-scl-hz", &val))
 		master->bus.scl_rate.i2c = val;
 
-	if (!of_property_read_u32(i3cbus_np, "i3c-scl-hz", &val))
+	if (!device_property_read_u32(dev, "i3c-scl-hz", &val))
 		master->bus.scl_rate.i3c = val;
 
 	return 0;
@@ -2588,7 +2595,7 @@ static u8 i3c_master_i2c_get_lvr(struct i2c_client *client)
 	u8 lvr = I3C_LVR_I2C_INDEX(2) | I3C_LVR_I2C_FM_MODE;
 	u32 reg[3];
 
-	if (!of_property_read_u32_array(client->dev.of_node, "reg", reg, ARRAY_SIZE(reg)))
+	if (!fwnode_property_read_u32_array(client->dev.fwnode, "reg", reg, ARRAY_SIZE(reg)))
 		lvr = reg[2];
 
 	return lvr;
@@ -2707,7 +2714,8 @@ static int i3c_master_i2c_adapter_init(struct i3c_master_controller *master)
 	struct i2c_adapter *adap = i3c_master_to_i2c_adapter(master);
 	struct i2c_dev_desc *i2cdev;
 	struct i2c_dev_boardinfo *i2cboardinfo;
-	int ret, id;
+	struct fwnode_handle *fwnode = dev_fwnode(&master->dev);
+	int ret, id = -1;
 
 	adap->dev.parent = master->dev.parent;
 	adap->owner = master->dev.parent->driver->owner;
@@ -2716,7 +2724,9 @@ static int i3c_master_i2c_adapter_init(struct i3c_master_controller *master)
 	adap->timeout = HZ;
 	adap->retries = 3;
 
-	id = of_alias_get_id(master->dev.of_node, "i2c");
+	if (fwnode && is_of_node(fwnode))
+		id = of_alias_get_id(to_of_node(fwnode), "i2c");
+
 	if (id >= 0) {
 		adap->nr = id;
 		ret = i2c_add_numbered_adapter(adap);
@@ -3017,7 +3027,7 @@ int i3c_master_register(struct i3c_master_controller *master,
 		return ret;
 
 	master->dev.parent = parent;
-	master->dev.of_node = of_node_get(parent->of_node);
+	device_set_node(&master->dev, fwnode_handle_get(dev_fwnode(parent)));
 	master->dev.bus = &i3c_bus_type;
 	master->dev.type = &i3c_masterdev_type;
 	master->dev.release = i3c_masterdev_release;
@@ -3036,13 +3046,13 @@ int i3c_master_register(struct i3c_master_controller *master,
 	master->dev.coherent_dma_mask = parent->coherent_dma_mask;
 	master->dev.dma_parms = parent->dma_parms;
 
-	ret = i3c_bus_init(i3cbus, master->dev.of_node);
+	ret = i3c_bus_init(i3cbus, dev_fwnode(&master->dev));
 	if (ret)
 		goto err_put_dev;
 
 	dev_set_name(&master->dev, "i3c-%d", i3cbus->id);
 
-	ret = of_populate_i3c_bus(master);
+	ret = fwnode_populate_i3c_bus(master);
 	if (ret)
 		goto err_put_dev;
 
@@ -3300,11 +3310,14 @@ static int __init i3c_init(void)
 {
 	int res;
 
-	res = of_alias_get_highest_id("i3c");
-	if (res >= 0) {
-		mutex_lock(&i3c_core_lock);
-		__i3c_first_dynamic_bus_num = res + 1;
-		mutex_unlock(&i3c_core_lock);
+	/* of_alias_get_highest_id is DT-specific, only call for DT systems */
+	if (IS_ENABLED(CONFIG_OF)) {
+		res = of_alias_get_highest_id("i3c");
+		if (res >= 0) {
+			mutex_lock(&i3c_core_lock);
+			__i3c_first_dynamic_bus_num = res + 1;
+			mutex_unlock(&i3c_core_lock);
+		}
 	}
 
 	res = bus_register_notifier(&i2c_bus_type, &i2cdev_notifier);
diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index 592b646f6134..6b03a3ce574c 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -177,7 +177,8 @@ struct i3c_device_ibi_info {
  * @pid: I3C Provisioned ID exposed by the device. This is a unique identifier
  *	 that may be used to attach boardinfo to i3c_dev_desc when the device
  *	 does not have a static address
- * @of_node: optional DT node in case the device has been described in the DT
+ * @fwnode: Firmware node (DT or ACPI) in case the device has been
+ *	    described in firmware
  *
  * This structure is used to attach board-level information to an I3C device.
  * Not all I3C devices connected on the bus will have a boardinfo. It's only
@@ -189,7 +190,7 @@ struct i3c_dev_boardinfo {
 	u8 init_dyn_addr;
 	u8 static_addr;
 	u64 pid;
-	struct device_node *of_node;
+	struct fwnode_handle *fwnode;
 };
 
 /**
-- 
2.50.1

