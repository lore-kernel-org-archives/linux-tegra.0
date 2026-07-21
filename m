Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011033.outbound.protection.outlook.com [52.101.62.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF9D379C3C;
	Tue, 21 Jul 2026 04:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784606975; cv=fail; b=QVp242qCCS6HHQ1k5dAkrDu4M5J+HHCM7twJeHTphGcuunE1KBwLOz94bV5HlZp4TFAjKR841KFchPNCwjcRJZJkJtK0QxVRizVZwIn28Bft+hI3mPQlgPMvhgECjUIBJQYWo5i7EacOltHv55Zt8n7KPmXmOH+ca19OxdAxNQk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784606975; c=relaxed/simple;
	bh=YEIqOiGJFfMwB9eeqhdXDzdmBHNfbPRMMBAsJJJ+DAY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lA33GQCkUBrWSYkqRmkfYwbtH628hl3103jpBHtSsrKs93sRtMnNlTyzKKmuMd3wjODEUhzRFePLW6tBSvE2slvZAyf2H8KpTLB2XWlkJk9TzSGi14TK/w9zqpr1ot4EMocxNFyjPcKUcEttzMg1Z7blSjga5CovkJBxi5KNUvs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=oszy8fEO; arc=fail smtp.client-ip=52.101.62.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="oszy8fEO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qGfkeCSf3MpDDAicxLRj/LOj9GsqrqNRXYFDYobO7VKLAkUCQNDpKyGCoARKpakJ38WIw7m/JMCT8qmCfBvj8j6Qz7iOl2xJBZgq6XobKgsiV6UyKmtyOsFrGOhCTU5lvJDXjo4egsv7sPPaRUDPZZTRnRSEz26DUcSMs/H1XRAaTNVuRY210xmg4IerTDvecoNLy2SYYeRuxYMkOkcvff6GFDpgYy1qJvQUGOlWQELDcMQ5dsLDG32ZY+4Fsed4+/NDrqGZGcJsOPxRfS0PT+ALIGehLtYdg3eiB4ZABVEuC3nnI1dOpqwnZBY4gaA2B3Bbz5GtKJBzrQU/yw3Z4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LNIpXwL2xFo3r30scGGx0jDCO7cC68olMAJd8271DKo=;
 b=x5U5vtkXYu6DL923w6oOs/RF21FKpGuPiavOC6pVjRtughzHUeeWPWFZoYcDtoQac3pWWOBXCZ/HHF7Q4rzqCa+9N9AT6yzIdww1o3CUan8yNF5/O0HcSLDkmodKBuNnBgararoALPFysCrvWKJauyWglTi1jPZd0VripBKOAL7mUdzq3Xfg4CFbVsLaL+WTzGKiK/gEQPhFY03vpXZpmD6YXjiFR3GAXUs2h/jttPf+9YAYwQ0vY7NTHgkkX1OcyKtR4j4d6BVsFZ1mCSt6nxGtveA8htOGCkrgJS7g745okM2XHgOr22zDkQ8swjzutCbMilJjfiJirM7B97vPwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LNIpXwL2xFo3r30scGGx0jDCO7cC68olMAJd8271DKo=;
 b=oszy8fEOD/snDz/4ZpCcpIrtdHf4Tc89QKRqtjY9wiedjcMp3GgU7460zZ2gKNSRLaEcH/XectmAZD5qni4x5Lg/usIQu6GahNlUH8R9dXlD1RU3FrwkwwjSTupE/O8H2XEnUsITYCS15cGWEAeZGylJsqCocQg0gHout8OvOtGA99NUpdziKly3V30JcR7SX/l2wPnZJ4USOM7LLFtj7wGU6W6GwBjmmz4gDRnHbSZ52VdT7ZydUSBdfvVCAwN5FOLa8xv5rRB2IO+5N/f282vadPCKJcow+E7G/SIpy2BgN16iNRBF+9fz4b2oxqpb8aiRmUUTGVvg7mvC0SCEoQ==
Received: from SJ0PR13CA0021.namprd13.prod.outlook.com (2603:10b6:a03:2c0::26)
 by CH2PR12MB4165.namprd12.prod.outlook.com (2603:10b6:610:a4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 04:09:21 +0000
Received: from CO1PEPF00012E7D.namprd03.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::7c) by SJ0PR13CA0021.outlook.office365.com
 (2603:10b6:a03:2c0::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Tue,
 21 Jul 2026 04:09:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF00012E7D.mail.protection.outlook.com (10.167.249.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Tue, 21 Jul 2026 04:09:20 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 20 Jul
 2026 21:09:03 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 20 Jul
 2026 21:09:02 -0700
Received: from build-akhilrajeev-noble-20260602.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.6) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Mon, 20 Jul 2026 21:08:58 -0700
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
Subject: [PATCH v6 02/12] i3c: master: Use unified device property interface
Date: Tue, 21 Jul 2026 04:07:50 +0000
Message-ID: <20260721040805.1696503-3-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721040805.1696503-1-akhilrajeev@nvidia.com>
References: <20260721040805.1696503-1-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E7D:EE_|CH2PR12MB4165:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d653b87-c79c-4ce4-809c-08dee6ddd71b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|36860700016|82310400026|376014|7416014|56012099006|11063799006|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	r+q+i+W2LmW0lqfpOncUG5/QvMT55msqsHtoOn5b97tcwqh5c8fDrqHDYD8oZVoKJUV8+2EsacTGXcl+bBoJWCv0dO705YjbiTb9c+tea6jxdXYtv5GjAaCdWcHOxMEn/ixNEdYwvT2DqRmA4HBxtEO/e379b+rT+wZn8mVfpNFVeztfp7tvdn06xtEGD8WCU6TyaLOZOTxmZZm9vz5sm+2HISUM6QqPM4vtXQqkxfMO6RIaOtmMouZ0PyUaM2YcTyedTvcYMGo3IXRdDSmJ+IB+N7zK1E7+9RNzSEajFG/VkQflljLG+IzTDnuYW18W3i0OYTKX5hHQVOkCMa8cXDyoVYOhyYnuovAgEiXbAxKnyre/n/3cAyUwSJaRirnd4qViYLpY48O78+2MvQbUMbm7aW01Jwe3SVd9S4fMswEKYWwnayAVlR9uKH21wAulVmi5O6MJ5rBf7fdTxCgIfc9eFjSVVe3UMVFonNyIxSOc8uEI++j9aHDdsoznaKUsoDeKal/S9J/lazsuWd0FlSGPBwssCKl6qPLWSb8yJBv5v0i+6nukn315vrI48XuRoqSbk9j17hcVlEWCTEBE2HCeWupyUnVVgksdQWABRIHrZT5QFWmoEdyCheZJvX1VR/kKYvZ9xfgrdbCeLMXX5ElwLgHc1MGVUoxRW1HFX7Uodpb3FxFLYNKePIBmxfmsBTGyGuQnv5fSkUvITYI8Wg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(36860700016)(82310400026)(376014)(7416014)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	y/B3TDVnSgXbnQbz1mINuhNLwhu4ETAqNUgY1vDww4qexZM+MfXI7J7rHeDECQka/MITgGK8Co3Pj4YrPKWJJjuBXkWDZWgslhJ7FsFZ7VTWRAQAKou2uk0vD1f4pZnYF1vHPACTja4tO5qDOWeXYjG8wxlUtMskwV2eY+r64xPZKm+K3J8J4JQNciTmmOA4Qm2ZEES0T+gmrX0E9XIH6ErmAYsFfQnWqDXWOqCE7p7M+kQioF2Dw9Gt8ifGbzR9JIOwO06ME5tnc3arOMfD9da6OnTNRkkuSFTys5a4EFl9Y3tpZ0spaxVL9OOPPdZuwQebR3Y7X3V03xXSbze16LmPYN4tOM+0zihrT43VeXovA8vMXyNp0nRfEVKFMuejRaffQZZE5FjAO78mkCZcR3k/KWiKGEkpu9VqHDe02PfhXG5PSLUSoapxHUO4gceO
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 04:09:20.2762
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d653b87-c79c-4ce4-809c-08dee6ddd71b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E7D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4165

Replace all OF-specific functions with unified device property functions
as a prerequisite to support both ACPI and device tree.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/i3c/master.c       | 77 +++++++++++++++++++++-----------------
 include/linux/i3c/master.h |  5 ++-
 2 files changed, 46 insertions(+), 36 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index f1be38a640ca..4b3d9628bc39 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -13,10 +13,12 @@
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
@@ -491,7 +493,7 @@ static void i3c_bus_cleanup(struct i3c_bus *i3cbus)
 	mutex_unlock(&i3c_core_lock);
 }
 
-static int i3c_bus_init(struct i3c_bus *i3cbus, struct device_node *np)
+static int i3c_bus_init(struct i3c_bus *i3cbus, struct fwnode_handle *fwnode)
 {
 	int ret, start, end, id = -1;
 
@@ -501,8 +503,8 @@ static int i3c_bus_init(struct i3c_bus *i3cbus, struct device_node *np)
 	i3c_bus_init_addrslots(i3cbus);
 	i3cbus->mode = I3C_BUS_MODE_PURE;
 
-	if (np)
-		id = of_alias_get_id(np, "i3c");
+	if (fwnode && is_of_node(fwnode))
+		id = of_alias_get_id(to_of_node(fwnode), "i3c");
 
 	mutex_lock(&i3c_core_lock);
 	if (id >= 0) {
@@ -837,7 +839,7 @@ static void i3c_masterdev_release(struct device *dev)
 	WARN_ON(!list_empty(&bus->devs.i2c) || !list_empty(&bus->devs.i3c));
 	i3c_bus_cleanup(bus);
 
-	of_node_put(dev->of_node);
+	fwnode_handle_put(dev->fwnode);
 }
 
 static const struct device_type i3c_masterdev_type = {
@@ -1044,7 +1046,7 @@ static void i3c_device_release(struct device *dev)
 
 	WARN_ON(i3cdev->desc);
 
-	of_node_put(i3cdev->dev.of_node);
+	fwnode_handle_put(dev->fwnode);
 	kfree(i3cdev);
 }
 
@@ -1928,7 +1930,7 @@ i3c_master_register_new_i3c_devs(struct i3c_master_controller *master)
 			     desc->info.pid);
 
 		if (desc->boardinfo)
-			desc->dev->dev.of_node = desc->boardinfo->of_node;
+			device_set_node(&desc->dev->dev, desc->boardinfo->fwnode);
 
 		ret = device_register(&desc->dev->dev);
 		if (ret) {
@@ -2620,8 +2622,8 @@ EXPORT_SYMBOL_GPL(i3c_master_do_daa);
 #define OF_I3C_REG1_IS_I2C_DEV			BIT(31)
 
 static int
-of_i3c_master_add_i2c_boardinfo(struct i3c_master_controller *master,
-				struct device_node *node, u32 *reg)
+i3c_master_add_i2c_boardinfo(struct i3c_master_controller *master,
+			     struct fwnode_handle *fwnode, u32 *reg)
 {
 	struct i2c_dev_boardinfo *boardinfo;
 	struct device *dev = &master->dev;
@@ -2631,9 +2633,13 @@ of_i3c_master_add_i2c_boardinfo(struct i3c_master_controller *master,
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
@@ -2649,14 +2655,14 @@ of_i3c_master_add_i2c_boardinfo(struct i3c_master_controller *master,
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
@@ -2679,7 +2685,7 @@ of_i3c_master_add_i3c_boardinfo(struct i3c_master_controller *master,
 
 	boardinfo->static_addr = reg[0];
 
-	if (!of_property_read_u32(node, "assigned-address", &init_dyn_addr)) {
+	if (!fwnode_property_read_u32(fwnode, "assigned-address", &init_dyn_addr)) {
 		if (init_dyn_addr > I3C_MAX_ADDR)
 			return -EINVAL;
 
@@ -2696,14 +2702,14 @@ of_i3c_master_add_i3c_boardinfo(struct i3c_master_controller *master,
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
@@ -2711,7 +2717,7 @@ static int of_i3c_master_add_dev(struct i3c_master_controller *master,
 	if (!master)
 		return -EINVAL;
 
-	ret = of_property_read_u32_array(node, "reg", reg, ARRAY_SIZE(reg));
+	ret = fwnode_property_read_u32_array(fwnode, "reg", reg, ARRAY_SIZE(reg));
 	if (ret)
 		return ret;
 
@@ -2720,25 +2726,25 @@ static int of_i3c_master_add_dev(struct i3c_master_controller *master,
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
@@ -2748,10 +2754,10 @@ static int of_populate_i3c_bus(struct i3c_master_controller *master)
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
@@ -2806,7 +2812,7 @@ static u8 i3c_master_i2c_get_lvr(struct i2c_client *client)
 	u8 lvr = I3C_LVR_I2C_INDEX(2) | I3C_LVR_I2C_FM_MODE;
 	u32 reg[3];
 
-	if (!of_property_read_u32_array(client->dev.of_node, "reg", reg, ARRAY_SIZE(reg)))
+	if (!fwnode_property_read_u32_array(client->dev.fwnode, "reg", reg, ARRAY_SIZE(reg)))
 		lvr = reg[2];
 
 	return lvr;
@@ -2925,7 +2931,8 @@ static int i3c_master_i2c_adapter_init(struct i3c_master_controller *master)
 	struct i2c_adapter *adap = i3c_master_to_i2c_adapter(master);
 	struct i2c_dev_desc *i2cdev;
 	struct i2c_dev_boardinfo *i2cboardinfo;
-	int ret, id;
+	struct fwnode_handle *fwnode = dev_fwnode(&master->dev);
+	int ret, id = -1;
 
 	adap->dev.parent = master->dev.parent;
 	adap->owner = master->dev.parent->driver->owner;
@@ -2934,7 +2941,9 @@ static int i3c_master_i2c_adapter_init(struct i3c_master_controller *master)
 	adap->timeout = HZ;
 	adap->retries = 3;
 
-	id = of_alias_get_id(master->dev.of_node, "i2c");
+	if (fwnode && is_of_node(fwnode))
+		id = of_alias_get_id(to_of_node(fwnode), "i2c");
+
 	if (id >= 0) {
 		adap->nr = id;
 		ret = i2c_add_numbered_adapter(adap);
@@ -3235,7 +3244,7 @@ int i3c_master_register(struct i3c_master_controller *master,
 		return ret;
 
 	master->dev.parent = parent;
-	master->dev.of_node = of_node_get(parent->of_node);
+	device_set_node(&master->dev, fwnode_handle_get(dev_fwnode(parent)));
 	master->dev.bus = &i3c_bus_type;
 	master->dev.type = &i3c_masterdev_type;
 	master->dev.release = i3c_masterdev_release;
@@ -3254,13 +3263,13 @@ int i3c_master_register(struct i3c_master_controller *master,
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
 
diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index 4d2a68793324..a16deb04b2e1 100644
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
2.43.0

