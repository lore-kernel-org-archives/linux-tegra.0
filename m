Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011035.outbound.protection.outlook.com [40.107.208.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F523DFC6B;
	Thu, 23 Apr 2026 08:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776934756; cv=fail; b=rNHBfoO3S2+9O1MmqipF1mkRtzmeuPCx9IEgFK1ZCqbu79F8UdEE/ghBfNd4sPOOSf9V5iAs+xbBxw308NBKVJsAcEv3l7rEsAASmXBleI64YKOvugiWETklt4eBtqwxP/7x0Hxl3oCb3y79ps/JJyHO6dA0tnmgt8JmcuhCWtQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776934756; c=relaxed/simple;
	bh=Myjzc3Xch/GT2D5vkLkEObWRhP9v2wjnL0Lo3aE0U/I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NxtWIsUWmQv8fXsq7gzAi9UnD2psMBU4bt9JbAnPka8H1B9aSbYDcT+8wHIo8WVpUy3fdXCGQtMLnctiDkPD99T249urULdU66FfuWTvMu8uhjCw/jlQJge2W4mCzhdioSqfVlIxGJeg1W6HEyRrC36QHQgVVNdMoRccuFpLPL0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=IrQSy/Ya; arc=fail smtp.client-ip=40.107.208.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="IrQSy/Ya"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WYXCKGJIzUuZfWKYEliPHqOrjUZaggU8e8ZM3PEaAsyKt8CTRBjNfmVuGYKrG/zHbsFN3GPd9D8VqXurxyacoTmwIUTxOlvHJhvSg05DTIdgZgw4zc8dCxXL10Uvh2sYgqGoWBaAS6hf2rdsJZ6G5rD6jqfUQazxzE7dalEUpV9hkaGFuVyl7vSHHjzurSnaJJx2ouyn01cWvdbzck/yXcLFCkf2VIWoW7PoDKz4gUeKb2AA32sipFGSRQ2fg0oWpzlaYfDqM8KTPtWF0gDe10tQu3JjPmE413OJe0J3IM2vnEk8768HBguNnaDVD2/TZoSNRt7is06gQTnMG9Phvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/oO13TN0bYaIX6MgiDPfO/k6cFCMqHGXAZ2+0IfZ6Gg=;
 b=K5Oi44JVxGQ0NyR1syxhha3k8Mr0PTj6ykOdaHuzsMeMYiHUtpFgRIRWcy2FLGe+A6Y+/Z/Yf0EB/5vQHLybpRkAxgbP+vO2WesdJR0rDFsnsfgjfC33qEW+3rxmyJpO0btuTtWMvH/qU/WDloJxXU/HFmJ1NBnCz8HpQ9C8Y0MTGSRoYzhg2cy+CcbRQf7Wwzw/SyzlDCtI8FJn40Kqru5uGCN5ocIYv4F74FYcPzv53ZQnuUEEfeauqOCU/u7/QvEXEectme/c9ezntlgmZGGrXzx9+yr49u9I3S1P958Ph46Jp2BDPr2mCUbeUkEIIaheQMB88JXSCcbjBAlkeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/oO13TN0bYaIX6MgiDPfO/k6cFCMqHGXAZ2+0IfZ6Gg=;
 b=IrQSy/YaVRkx6H8th/JnPY7bWuUb5VQsj0kaL/O3KLmKs0yz49p5rptTqKEUdeR2TjN60Fms6OYTgDf9bS5fUqcwvPZYxJcqusu6emGEmwBf/aabEwBZLsqf8rRSAq5Qtah23jHd4b0LdSRuJqP4djEDoKLrvd8Dqr1XfYOOnu3CM2wPV4avcB15LvmPWpabY0jxWadDRaw4JIKw9ysRu3NmtWO+YEiLC/mWghrenlzGrOzUOjZp55mMQGy37f/uyvHX6feJSBtAV7W5KYB4R8WI7xB34p2qArNXNZebioH+S5hV6l+NYmAm4F96EmBHd8bx/rRNc5SQjAxcMVVfTg==
Received: from CH0PR03CA0219.namprd03.prod.outlook.com (2603:10b6:610:e7::14)
 by DS0PR12MB999080.namprd12.prod.outlook.com (2603:10b6:8:2fe::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.15; Thu, 23 Apr
 2026 08:59:08 +0000
Received: from CH3PEPF0000000B.namprd04.prod.outlook.com
 (2603:10b6:610:e7:cafe::90) by CH0PR03CA0219.outlook.office365.com
 (2603:10b6:610:e7::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.21 via Frontend Transport; Thu,
 23 Apr 2026 08:59:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH3PEPF0000000B.mail.protection.outlook.com (10.167.244.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Thu, 23 Apr 2026 08:59:08 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 23 Apr
 2026 01:58:53 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 23 Apr
 2026 01:58:53 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 23 Apr 2026 01:58:44 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	<Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Rafael J .
 Wysocki" <rafael@kernel.org>, Saket Dumbre <saket.dumbre@intel.com>, "Len
 Brown" <lenb@kernel.org>, Guenter Roeck <linux@roeck-us.net>, Philipp Zabel
	<p.zabel@pengutronix.de>, Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>, Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>, "Eric
 Biggers" <ebiggers@kernel.org>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Jon Hunter <jonathanh@nvidia.com>, "Thierry
 Reding" <treding@nvidia.com>, <linux-tegra@vger.kernel.org>,
	<linux-i3c@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
	<acpica-devel@lists.linux.dev>, <linux-hwmon@vger.kernel.org>
CC: Akhil R <akhilrajeev@nvidia.com>
Subject: [PATCH v3 04/13] i3c: master: Support ACPI enumeration of child devices
Date: Thu, 23 Apr 2026 14:27:03 +0530
Message-ID: <20260423085718.70762-5-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260423085718.70762-1-akhilrajeev@nvidia.com>
References: <20260423085718.70762-1-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000B:EE_|DS0PR12MB999080:EE_
X-MS-Office365-Filtering-Correlation-Id: ace60fd3-1eea-49b4-3db9-08dea1169465
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|7416014|1800799024|13003099007|56012099003|921020|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	H/kwA3HqXCKD5UUzX21VndCeVns/jDBLl76inPPilrQfb/+z3YbI40wpRB104E60LDVdeU6gTC+R7sWaOsxU/vn3r3qoQ7AIXmq2FIE7yOTCpM/kE1r6MQEGNbncUL0wjaEbXaMsLg9OegT9WNjrOvfaPaNRm5OrySf8NvMrctqrG7egN1XTa10S+dHPsfDrOVDDMx+2K7W5CLL6hTvd1TrLtjawpxPOOVEX63NnS0DY+drXDZBK9sFIBJlTFgiMnJX/MicFQgNuFI3o8WS8Q8yc/DW+jkdA5s7Zs6tXFCLGwiDjG1rj/kzLdrIJtfjuvuaJBXufVYv9eARfVKCWUc4zExScLBMCzkBMytxIZaPXWDhdq7kAkCxHd+tMhS7OEEjLEifG6gMFd45l8jcNCPVqk7P9P8IIEOY18tLfE1yF6wEGkwl0s87j5T9FTPivOKyL15X8VDBeiJmSNo1Tk33siXeoP8RBmPbgGcc6W++RfNyUtKMc5VN3NeymjGQDLhUyW924mYfwJkAm17fyopz1FywpzHv5+aPOu7jna92bRR5JFze3aU2zJVcVZ/E9clHEzuVqqGQb3GVpErUYlwqCT7vI0VcH+DItpnH18EfvUzbV524Gmcb/8zQ08mRIvTCl4AHh8tjedSkx/q6Y7nARLPnFWyhNhNLvQT32hDiaI3luBNHfeZ41/XJfh5bkzrK8oEQnqTg4Qc1L+kuL5aCRrx1Mf8Rai1OeKHbDZrk4XzKmvIGsNDsZ0zyaafHFh324HPNbLl0nG8lxyqyXcEgTuZAoYYYTMCyOjilWlXVEEjqpTfamfJTA1jETOTkdNAPNesR0uIk0tVWblDm50A==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(7416014)(1800799024)(13003099007)(56012099003)(921020)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	owjvJYCVTfxa0uqJOrYu8+12ROnfQ6Ew7MYlPxQEhlTTYTfjC9nECh8e00qcc0WuMqvwe4Ybc5TujVc2kcrvWnULPwvZfoOnIupwyTdeEdWgU4DwyXR+CgdQ35la+ppBanwIRi95ME008qe9yFZYf4C4929XMIbvpegNSF7EeQB9v79o5AXKORaCkGx4h61w5G46jcjaYohv5m+NgVAfIUHB9q1EWWXxeALtsJiyjpELoBpeR1OF/tJrKW4VmKo3RVWHL99MOSVG32DU+HbVhk176LcVRrjNfyRkBPvZXEbxkyhMiv3KELdCRuaxc/h73kMQaR/35IR+xi6Te2CSYwW3QJcAlHiOXtywHg0UaphkS3NBLBXeKkA7cTAs90WO/nz2fxHZ2JGVZls5FE8Za5GjpjMU+QdhOjIHpSr3e+6l7OABqr/eO/IdFkJdbJ+Y
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 08:59:08.2712
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ace60fd3-1eea-49b4-3db9-08dea1169465
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB999080

Although the existing subsystem allows host controllers to register
through the ACPI table, it was not possible to describe I3C or I2C devices
when using ACPI. This is because the driver relied on the reg property to
retrieve the PID, static address, etc., whereas ACPI uses _ADR or serial
resources to describe such devices.

Read _ADR and LVR from the ACPI resources and extract the data as per the
ACPI specification for an I3C bus. Also read mipi-i3c-static-address as
per the MIPI DISCO specifications [1] to get the static address to be
used. Hence enable describing the I3C or I2C devices in the ACPI table,
which is required if the device is using a static address or if it needs
some specific properties to be attached to it.

[1] https://www.mipi.org/mipi-disco-for-i3c-download

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/i3c/master.c | 140 ++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 132 insertions(+), 8 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index d0677061faab..ffec97157d48 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -5,6 +5,7 @@
  * Author: Boris Brezillon <boris.brezillon@bootlin.com>
  */
 
+#include <linux/acpi.h>
 #include <linux/atomic.h>
 #include <linux/bug.h>
 #include <linux/device.h>
@@ -2409,6 +2410,53 @@ EXPORT_SYMBOL_GPL(i3c_master_add_i3c_dev_locked);
 
 #define OF_I3C_REG1_IS_I2C_DEV			BIT(31)
 
+#ifdef CONFIG_ACPI
+static int i3c_acpi_get_i2c_resource(struct acpi_resource *ares, void *data)
+{
+	struct i2c_dev_boardinfo *boardinfo = data;
+	struct acpi_resource_i2c_serialbus *sb;
+
+	if (!i2c_acpi_get_i2c_resource(ares, &sb))
+		return 1;
+
+	boardinfo->base.addr = sb->slave_address;
+	if (sb->access_mode == ACPI_I2C_10BIT_MODE)
+		boardinfo->base.flags |= I2C_CLIENT_TEN;
+
+	boardinfo->lvr = sb->lvr;
+
+	return 0;
+}
+
+static int i3c_acpi_add_i2c_boardinfo(struct i2c_dev_boardinfo *boardinfo,
+				      struct fwnode_handle *fwnode)
+{
+	struct acpi_device *adev = to_acpi_device_node(fwnode);
+	LIST_HEAD(resources);
+	int ret;
+
+	boardinfo->base.fwnode = acpi_fwnode_handle(adev);
+
+	ret = acpi_dev_get_resources(adev, &resources,
+				     i3c_acpi_get_i2c_resource, boardinfo);
+	if (ret < 0)
+		return ret;
+
+	acpi_dev_free_resource_list(&resources);
+
+	if (!boardinfo->base.addr)
+		return -ENODEV;
+
+	return 0;
+}
+#else
+static inline int i3c_acpi_add_i2c_boardinfo(struct i2c_dev_boardinfo *boardinfo,
+					     struct fwnode_handle *fwnode)
+{
+	return -ENODEV;
+}
+#endif
+
 static int
 i3c_master_add_i2c_boardinfo(struct i3c_master_controller *master,
 			     struct fwnode_handle *fwnode, u32 *reg)
@@ -2425,6 +2473,13 @@ i3c_master_add_i2c_boardinfo(struct i3c_master_controller *master,
 		ret = of_i2c_get_board_info(dev, to_of_node(fwnode), &boardinfo->base);
 		if (ret)
 			return ret;
+
+		/* LVR is encoded in reg[2] for Device Tree. */
+		boardinfo->lvr = reg[2];
+	} else if (is_acpi_device_node(fwnode)) {
+		ret = i3c_acpi_add_i2c_boardinfo(boardinfo, fwnode);
+		if (ret)
+			return ret;
 	} else {
 		return -EINVAL;
 	}
@@ -2439,9 +2494,6 @@ i3c_master_add_i2c_boardinfo(struct i3c_master_controller *master,
 		return -EOPNOTSUPP;
 	}
 
-	/* LVR is encoded in reg[2]. */
-	boardinfo->lvr = reg[2];
-
 	list_add_tail(&boardinfo->node, &master->boardinfo.i2c);
 	fwnode_handle_get(fwnode);
 
@@ -2496,8 +2548,8 @@ i3c_master_add_i3c_boardinfo(struct i3c_master_controller *master,
 	return 0;
 }
 
-static int i3c_master_add_dev(struct i3c_master_controller *master,
-			      struct fwnode_handle *fwnode)
+static int i3c_master_add_of_dev(struct i3c_master_controller *master,
+				 struct fwnode_handle *fwnode)
 {
 	u32 reg[3];
 	int ret;
@@ -2521,6 +2573,67 @@ static int i3c_master_add_dev(struct i3c_master_controller *master,
 	return ret;
 }
 
+#ifdef CONFIG_ACPI
+static int i3c_master_add_acpi_dev(struct i3c_master_controller *master,
+				   struct fwnode_handle *fwnode)
+{
+	struct acpi_device *adev = to_acpi_device_node(fwnode);
+	acpi_bus_address adr;
+	u32 reg[3] = { 0 };
+
+	/*
+	 * If the ACPI table entry does not have _ADR method, it's an I2C device
+	 * If the ACPI table entry has _ADR method, it's an I3C device
+	 */
+	if (!acpi_has_method(adev->handle, "_ADR"))
+		return i3c_master_add_i2c_boardinfo(master, fwnode, reg);
+
+	adr = acpi_device_adr(adev);
+
+	/* For I3C devices, _ADR will have the 48 bit PID of the device  */
+	reg[1] = upper_32_bits(adr);
+	reg[2] = lower_32_bits(adr);
+
+	fwnode_property_read_u32(fwnode, "mipi-i3c-static-address", &reg[0]);
+
+	return i3c_master_add_i3c_boardinfo(master, fwnode, reg);
+}
+
+static u8 i3c_acpi_i2c_get_lvr(struct i2c_client *client)
+{
+	struct acpi_device *adev = to_acpi_device_node(client->dev.fwnode);
+	struct i2c_dev_boardinfo boardinfo = {};
+	LIST_HEAD(resources);
+	int ret;
+	u8 lvr;
+
+	lvr = I3C_LVR_I2C_INDEX(2) | I3C_LVR_I2C_FM_MODE;
+
+	ret = acpi_dev_get_resources(adev, &resources,
+				     i3c_acpi_get_i2c_resource, &boardinfo);
+	if (ret < 0)
+		return lvr;
+
+	if (boardinfo.base.addr)
+		lvr = boardinfo.lvr;
+
+	acpi_dev_free_resource_list(&resources);
+
+	return lvr;
+}
+#else
+static inline int i3c_master_add_acpi_dev(struct i3c_master_controller *master,
+					  struct fwnode_handle *fwnode)
+{
+	return -ENODEV;
+}
+
+static inline u8 i3c_acpi_i2c_get_lvr(struct i2c_client *client)
+{
+	return I3C_LVR_I2C_INDEX(2) | I3C_LVR_I2C_FM_MODE;
+}
+#endif
+
 static int fwnode_populate_i3c_bus(struct i3c_master_controller *master)
 {
 	struct device *dev = &master->dev;
@@ -2532,7 +2645,13 @@ static int fwnode_populate_i3c_bus(struct i3c_master_controller *master)
 		return 0;
 
 	fwnode_for_each_available_child_node_scoped(fwnode, child) {
-		ret = i3c_master_add_dev(master, child);
+		if (is_of_node(child))
+			ret = i3c_master_add_of_dev(master, child);
+		else if (is_acpi_device_node(child))
+			ret = i3c_master_add_acpi_dev(master, child);
+		else
+			continue;
+
 		if (ret)
 			return ret;
 	}
@@ -2600,8 +2719,13 @@ static u8 i3c_master_i2c_get_lvr(struct i2c_client *client)
 	u8 lvr = I3C_LVR_I2C_INDEX(2) | I3C_LVR_I2C_FM_MODE;
 	u32 reg[3];
 
-	if (!fwnode_property_read_u32_array(client->dev.fwnode, "reg", reg, ARRAY_SIZE(reg)))
-		lvr = reg[2];
+	if (is_of_node(client->dev.fwnode)) {
+		if (!fwnode_property_read_u32_array(client->dev.fwnode, "reg",
+						    reg, ARRAY_SIZE(reg)))
+			lvr = reg[2];
+	} else if (is_acpi_device_node(client->dev.fwnode)) {
+		lvr = i3c_acpi_i2c_get_lvr(client);
+	}
 
 	return lvr;
 }
-- 
2.50.1

