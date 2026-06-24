Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012041.outbound.protection.outlook.com [40.93.195.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3585222590;
	Wed, 24 Jun 2026 10:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782296608; cv=fail; b=RZ6EqckPW861Fl8TEhyilfYOxCroNhte6TagJ4qXjon4H+Bi1RUM1Z/tBICK6NlcDbwEyk1qnfZAVI8uptDneKotIIpC/TfE4rsQfiu+/sUqvvUrTLHk8XOg4nnXBMR7RTu8Wocp9lRskd1BlZUaMO4PA8g/9ll0bl0JanUzF6I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782296608; c=relaxed/simple;
	bh=XxB7YdDL7ZTd5XM4vMiXP3KDOnLh7loPYCE2rAnyfG0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K2FD2RBzZXcIVmUbDaBiNfanTD93sNlKHRXhl+HlUhMU0TZFobXKS0Tr52y49OqRRp/99p0/fRVINPcjeo47HAgQEO5LqYZEib5OGjZNuWbpoCB9P7ULW/RMCflR9Z+u3wcroTf9c01Ydj2cXT1uLSLEpyhvqHGOucJkC5/7Ep8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cYtyWvZg; arc=fail smtp.client-ip=40.93.195.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cYtyWvZg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cbxMinfaK4l2eqQ/HwwBdp+/I3orjFZerIXbGO7Cbrl2krL1mmoBLlx+QJAmIb3atULmhovQJF6Ah0osYrwzV5aHvFzlyMyfdgGtusABPujYjc5Mqkdnjb2JKzHmkdxUIqQt2ZAv0CyXOKn1wLz6QPCzfBJvbBKJnI3QFsyqCYtgFL5KneoF6vImbu9yZ6UWfh4f06Flld+otHTxTqJOPIQdejg2kVv571xIzrt4y1GzB02AqsWS49diCGJJThrQBX1XdDkEau4kUmPYlXL5+shWIwwRHCzgMe4SZvrv9P6tzMjPJe3NUPCp9hb/28gufQFls/Fwzswflc+xDskGxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bRhB3HxWFrqlOXuULsN1CmLYEQhSQ/1I6LSkoTHCWuQ=;
 b=QRVSLiii8dAjdtHW9tz6SZJ1q+A8wWGgfcmtvSD6SyzHng762CrFGFkOr5V6mW0TSuNKSFdn1riP8XKi0WUHGv6TEZc97/EedvTCXuXLCZj9NiMQfJBrASOreLMc8wVEaJzxfjBGCWpw4GYq6ysFfqvt0CFShg0k/5gEbV7f+5JnhYhQsV3GjXDYe+Fyp6H4CzecVgyUC/Vw6VqzH/fK2X0LSFpcHSbCzsI8imUKeesYVdIrcQ+pn/qJwKPnOF4B+2VsJAgKUz0GQUyTnW2R8KguL+PyeXEGuUgQ9O/UDY0FvqRMwB7cJoYaSbbmieVJMcN77trTuMTXsRs2Rw2JzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bRhB3HxWFrqlOXuULsN1CmLYEQhSQ/1I6LSkoTHCWuQ=;
 b=cYtyWvZg93iyga69srjacN2UqGha1IMkmI1wrsnXIYQNBWhaHrGTQUd2g0kDHTGIi08aqwsaLeEbUdgmnED5+xu73PDwyKEFYQp2PEY9zgVeUYq9p8JnxW17SJriT6zfSeOLrtcUvegPRjANK5NXNHxCSv9/h5nmhQuP3t5+qBUnquO1jPt33Gc7TpDFAkQI/zfeT81X/sXcprqkl+dgndcln3xBcx3UcQqCEyGO5eCHIvxUx2EW+rO8qfZuHC2tQbVkEO7UxOBcyrAg+VWoKCxDb735V5ZwG2dit8RZorVx8B6VnzvdNJFW7EoBfeAbSLivkUxHojFCrr8Ai/S81g==
Received: from DS1PR03CA0001.namprd03.prod.outlook.com (2603:10b6:8:450::14)
 by MW4PR12MB6705.namprd12.prod.outlook.com (2603:10b6:303:1e3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Wed, 24 Jun
 2026 10:23:20 +0000
Received: from CY4PEPF0000EE38.namprd03.prod.outlook.com
 (2603:10b6:8:450:cafe::ad) by DS1PR03CA0001.outlook.office365.com
 (2603:10b6:8:450::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.15 via Frontend Transport; Wed,
 24 Jun 2026 10:23:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000EE38.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Wed, 24 Jun 2026 10:23:19 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 24 Jun
 2026 03:23:03 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 24 Jun
 2026 03:23:01 -0700
Received: from build-akhilrajeev-noble-20260602.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Wed, 24 Jun 2026 03:22:56 -0700
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
Subject: [PATCH v5 03/12] i3c: master: Support ACPI enumeration of child devices
Date: Wed, 24 Jun 2026 10:20:57 +0000
Message-ID: <20260624102153.1770072-4-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE38:EE_|MW4PR12MB6705:EE_
X-MS-Office365-Filtering-Correlation-Id: 7662d918-8bf6-4465-c8a5-08ded1da9cb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|376014|36860700016|7416014|1800799024|3023799007|56012099006|11063799006|18002099003|10063799003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	PDyX1LOIMTsOdDsvEreSSjAygiycnWbD/K5hE5bz+O0QUdMukuSSs7C/tTW46kOS4Mz4+8O4GLPPbU98z5aqQUdQ0p4dgxRv9SA8JdeoXEKxi3jPxEv8GUHocsA90qakBWsm8cg8F8Ny3aJ/UiUHycirjinSVVxYV7kkxrg2dcWZS3IHDN1tbV/kMZ9GryGc4keTDGMxhs313nxUsDiUAm6k9Rze+lnK2JQ8VjyEH6Vc/iGHpamFN3c1XbacURJl422y2++prMSt7Min3G4WI2J4LIVvT7vBVJMKMSutQClOkog6w6P2yo3e1Dt+SDFBY+7qVkWqbrjroHp9y6KWDWVZHU9TadqmZ0WoW5ttiWBgEhTOgNxvettIh6AXBFGvWxNJ3xBQShX+6YW5rYb2AOtiBFxoPchE4wm6ZCx3WYSr21BfEyFbejNZA0wo055g0Y9AcT2fwBJU1LDeDgiCc94NdfpXhOtV3Ql3h5VNMYUzbT3yKYYtiQ1mNenrpZMX39VqnXkfP1v667OFsmzvmtarMRaWri0oZWb3TrKESKLX6q4IaW2tgWgeRry/NLXnJBiXUqzejFsX3Zsttvo53IHf56Eg1k7WfnuReVYDwcpeZsE9syZ/1PGYe4BBaMWkJe+MNN31CJQ71/MMAACPh7AT/L2GtrY95JqHml+evs6OVzTZAcvX4C2Km7gg77z2fCZCcFnM7OAb7uTamhs06w==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(376014)(36860700016)(7416014)(1800799024)(3023799007)(56012099006)(11063799006)(18002099003)(10063799003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1dCHCTmlGraZ2KRdOJF+IncCUxvNo3Bxh80T0b13nhuOzRfGugFQZwia/Xb6o3oU0DkfP3z8fhiZI+CN2d8pNkUdq1YULtglrRCUXBVPbGiooGs2I2RMJYU1vkRZ3iUCbXllCRJlnQC2JbKaCbxIHS9vNAhzXm4Wkxmy35Nt0UdBcgKXntbxOEyYbLu7EyFTtx3k5IBVPvK797ooz+jWDO+bAvHuQvMN5INoDH+vLfyc8VMxbTye+fz/1YCkaxQweqVRW8X2pjjAuUImjTQIaNuG59UHIio/H/zBKWSZjgJ+DauPNdd31Rxehd3GGESxSX4JvdHRRgmQ9DLmVjR4w/nvQcjbpzlPgtUGCc04t6IsNKdUgFYdfMn/6st8tANg+nMXlBdZ1bnxmALjgfHpnqONRRNnmygVaYXAIKysje/O1pmAshGmP9P4WIZTvZih
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 10:23:19.4052
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7662d918-8bf6-4465-c8a5-08ded1da9cb6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE38.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6705

Although the existing subsystem allows host controllers to register
through the ACPI table, it was not possible to describe I3C or I2C
devices when using ACPI. This is because the driver relied on the reg
property to retrieve the PID, static address, etc., whereas ACPI uses
_ADR or serial resources to describe such devices.

Read _ADR and LVR from ACPI resources and extract the data as per the
ACPI specification for an I3C bus. Also read mipi-i3c-static-address as
per the MIPI DISCO specifications [1] to get the static address to be
used.

Enable describing I3C or I2C devices in the ACPI table. This is required
if the device uses a static address or if it needs device-specific
properties.

[1] https://www.mipi.org/mipi-disco-for-i3c-download

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/i3c/master.c | 151 ++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 143 insertions(+), 8 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index b20f56f7b68e..4bba2bad897a 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -5,6 +5,7 @@
  * Author: Boris Brezillon <boris.brezillon@bootlin.com>
  */
 
+#include <linux/acpi.h>
 #include <linux/atomic.h>
 #include <linux/bitmap.h>
 #include <linux/bug.h>
@@ -2622,6 +2623,55 @@ EXPORT_SYMBOL_GPL(i3c_master_do_daa);
 
 #define OF_I3C_REG1_IS_I2C_DEV			BIT(31)
 
+#ifdef CONFIG_ACPI
+static int i3c_acpi_get_i2c_resource(struct acpi_resource *ares, void *data)
+{
+	struct i2c_dev_boardinfo *boardinfo = data;
+	struct acpi_resource_i2c_serialbus *sb;
+
+	if (boardinfo->base.addr || !i2c_acpi_get_i2c_resource(ares, &sb))
+		return 1;
+
+	boardinfo->base.addr = sb->slave_address;
+	if (sb->access_mode == ACPI_I2C_10BIT_MODE)
+		boardinfo->base.flags |= I2C_CLIENT_TEN;
+
+	boardinfo->lvr = sb->lvr;
+
+	return 1;
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
+	acpi_set_modalias(adev, dev_name(&adev->dev), boardinfo->base.type,
+			  sizeof(boardinfo->base.type));
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
@@ -2638,6 +2688,15 @@ i3c_master_add_i2c_boardinfo(struct i3c_master_controller *master,
 		ret = of_i2c_get_board_info(dev, to_of_node(fwnode), &boardinfo->base);
 		if (ret)
 			return ret;
+
+		/* LVR is encoded in reg[2] for Device Tree. */
+		boardinfo->lvr = reg[2];
+	} else if (is_acpi_device_node(fwnode)) {
+		ret = i3c_acpi_add_i2c_boardinfo(boardinfo, fwnode);
+		if (ret) {
+			devm_kfree(dev, boardinfo);
+			return ret;
+		}
 	} else {
 		return -EINVAL;
 	}
@@ -2652,9 +2711,6 @@ i3c_master_add_i2c_boardinfo(struct i3c_master_controller *master,
 		return -EOPNOTSUPP;
 	}
 
-	/* LVR is encoded in reg[2]. */
-	boardinfo->lvr = reg[2];
-
 	list_add_tail(&boardinfo->node, &master->boardinfo.i2c);
 	fwnode_handle_get(fwnode);
 
@@ -2709,8 +2765,8 @@ i3c_master_add_i3c_boardinfo(struct i3c_master_controller *master,
 	return 0;
 }
 
-static int i3c_master_add_dev(struct i3c_master_controller *master,
-			      struct fwnode_handle *fwnode)
+static int i3c_master_add_of_dev(struct i3c_master_controller *master,
+				 struct fwnode_handle *fwnode)
 {
 	u32 reg[3];
 	int ret;
@@ -2734,6 +2790,74 @@ static int i3c_master_add_dev(struct i3c_master_controller *master,
 	return ret;
 }
 
+#ifdef CONFIG_ACPI
+static int i3c_master_add_acpi_dev(struct i3c_master_controller *master,
+				   struct fwnode_handle *fwnode)
+{
+	struct acpi_device *adev = to_acpi_device_node(fwnode);
+	acpi_bus_address adr;
+	u32 reg[3] = { 0 };
+	int ret;
+
+	/*
+	 * If the ACPI table entry has _ADR method, it's an I3C device.
+	 * Otherwise it may be an I2C device described by an I2cSerialBus
+	 * resource. If no I2cSerialBus resource is found, ignore the entry.
+	 */
+	if (!acpi_has_method(adev->handle, "_ADR")) {
+		ret = i3c_master_add_i2c_boardinfo(master, fwnode, reg);
+		if (ret == -ENODEV)
+			return 0;
+
+		return ret;
+	}
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
@@ -2745,7 +2869,13 @@ static int fwnode_populate_i3c_bus(struct i3c_master_controller *master)
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
@@ -2813,8 +2943,13 @@ static u8 i3c_master_i2c_get_lvr(struct i2c_client *client)
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
2.43.0

