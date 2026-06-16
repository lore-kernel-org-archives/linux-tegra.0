Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010021.outbound.protection.outlook.com [52.101.85.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E406423A79;
	Tue, 16 Jun 2026 09:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781603750; cv=fail; b=Gptqp3Va0UQRN13J1vFt7eXu4fAR3H9ksO13pwry2f1rYzUn0gcff1unks57vvipe610UR17k95ho/1AhDdhozKZQAVjdfiP2xuzh2J/iN/5qJOr1039afch+0u2meAFMGrgiUxJXYOO7v4KWnSamkEKN5ncruHX0YCXT5d2G/s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781603750; c=relaxed/simple;
	bh=XiKLQzibs6a1Rz9zYhJjd+SJ7oCr2wH08bYgWQj8s1A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s/Wpwl9+c/axVKfmO46ZKdDkzW1NGptYGPyNdPbmJYElVy2LKRklcbXQVC9Exrd4RG9l2Jz7KVhwK6Rc92kEihjqBdlewu1JAadrIrNKCUZonaTEWxcXyH0BwtOUnQO7P97mptNrPAssVMLXirXXp+y/jtMz6heo0Orjxb9HlQU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ZAbxNFjH; arc=fail smtp.client-ip=52.101.85.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZAbxNFjH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x2ZtnrrAgGLt7FNnEK6sJ9a9SA9lbNKCI5E2qFGgN4oNHSu4U9SFH/m0QQDulOVGKRSege9WMH/sZcyYGmZHJN9cEA0JEuayUbhM2y0KMkNsGAFM9eH37YnwHWQcTzogOlwSlpBpXt32k46aOYC8MKDBXbhDXQQA7GsZoSHMbLrWxvxVP/ZrZc4SElGLP5bc1qc2TefahF6DGrmMVOQf8jNrINPSu9cqGHSQyS+HT+xUZ9HSyN573aSDBJ8cX8OBZDe67xbZlQhcOJBVYdW4abfe3fWxMKt/MLe9zUG78BlQonCVeFpR1Gbf5VsQnzdCpp1L0JrT0Q7eQTD/k0WeuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KOCKynqs0A6lP2bX7KGwqFqUYrJiLESjS9E+Qj3RUu0=;
 b=rNyMUPSya6HM5BlIQswWRL3E/aXd5QvbzTAwNwquhqPd+ByK+tOTRoj8w8DSmTKx13E8BvAVdwUJBn2XE9VUUP+4DAXZUAhI6iBFGVQKa3J+7uMfH2PnY4+4eVca6s12VW8nLV5gPkrVWt/6QuxeIr7PyrmZNJYaxmLO/lcA/1irXQuOXZ+z/yzYq+i4PSgX+Sp9f5MVV3ZiG9sw1bAp3bOJXigXGRqddxmPrqAF+7wi0sVNc8mm3j6RlvHMg1tIHp9yd/iroOpKIef2FDxI+hZNIxsxINgg2oFno8E9yDM2Pe7ljlwKRxsesK60fnxgSIYIXc25ulx9+6GseVapVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KOCKynqs0A6lP2bX7KGwqFqUYrJiLESjS9E+Qj3RUu0=;
 b=ZAbxNFjHsyDF6bJxRvDMyEbDr0JSokmhvyC62ry20BQZqlmZ3/CpjV8+rgJZcZv5l9SpnARTMzlahAnwUv9jog33kuquSogIQAzrcvFqca9e6mjV7lIEdZjVIuQ8cLzT1lefp7eKKKTFjzWK+VqreZ9ytsVmS93VYYQ1/QYrWDTYPZZgROCBW8t7dci/Uy/ND1kzkofROV0CBpAqd3XlWCkswJuNVG2is1Pq5LRNJ24tl3aTNA2qU6DmrS0pP0eaQZAnj5l4iO91ZdiRw9KC4IuzW73wJ/R878KcfnKM6LH+AVOKP/HSxY8JC9gUrHHzjjorL/jeK78jwXYLSmZ3yQ==
Received: from SA1P222CA0127.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c2::17)
 by PH7PR12MB7794.namprd12.prod.outlook.com (2603:10b6:510:276::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 09:55:43 +0000
Received: from SN1PEPF0002636A.namprd02.prod.outlook.com
 (2603:10b6:806:3c2:cafe::5b) by SA1P222CA0127.outlook.office365.com
 (2603:10b6:806:3c2::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Tue,
 16 Jun 2026 09:55:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SN1PEPF0002636A.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Tue, 16 Jun 2026 09:55:43 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 16 Jun
 2026 02:55:34 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Tue, 16 Jun 2026 02:55:33 -0700
Received: from build-akhilrajeev-noble-20260602.internal (10.127.8.11) by
 mail.nvidia.com (10.126.190.182) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Tue, 16 Jun 2026 02:55:29 -0700
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
Subject: [PATCH v4 03/12] i3c: master: Support ACPI enumeration of child devices
Date: Tue, 16 Jun 2026 09:54:17 +0000
Message-ID: <20260616095429.3947205-4-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636A:EE_|PH7PR12MB7794:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ad542d5-aea3-424a-f6b7-08decb8d6e42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|23010399003|1800799024|36860700016|10063799003|3023799007|22082099003|18002099003|11063799006|56012099006|13003099007;
X-Microsoft-Antispam-Message-Info:
	wyMG9hN03tqYU+s4tOOTtzCiJ6nIIwYcovlifDFZL0ixVMsnbNyGDwY48gkkazS8q6EwIWvJiXagsIkVgThU9VwEZiqXGx9H97PhyipOe6bkeaPWliPS8foZR3cAxP/+5Jj4vmVDipIsbn4qKwlIRvccMaumjzU9lJRbQUDUvXzn3VBudfx+JAUKSpuCwCvjpPPOI+4EBITkEtgi6uJUq6DzG3aQlBR4+9smPBjFdck2QAiH5ucy7i+qtjvIjEQhLhNaiblrHb/0Rf8i4LqHHHP9bh0CWNqFWxpKIGJvOMmIPX9KfBVIOpD2DIpClljY6GAjaGdpN6HFSQ5P1teNUdQbNTpcCqu+Mk2pLY/D6MOYM6jvpmm/Hl9ACAkNUgSVSnhRw/aA5VnsDc4G+/p+qOAMQOMz0PzkR3DIWrjgcf1oCY24ZL3ygW/Lja+h2S4MpXGYWzoPNKIeErJTSCYVErmqwUDCzJi0WjbzY693areg2qUXAwFEbSeSxWRiRUo1mKIj1vhHKy6nd/mCDrpWcgpy4k9e+WjixhSNZycBC6gvrYt9eoMTHPR8Sq5WuHADsZczkqfzHEVb+vA/U+RRI9KCXaDcA+xztnte+BhbNxJZ+kjDy5BBfzEXYIPwARVPoUHQDYp2tJC0UwJQzvaIcJ1jdkdQgerQgnqYcBluRGNkH06LgVgR4nBEKIZLwXMTSDy23IHM84cglJxJwm43igVCknPKcPmUrCB2Y9Iw09E=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(23010399003)(1800799024)(36860700016)(10063799003)(3023799007)(22082099003)(18002099003)(11063799006)(56012099006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6XplX2vuxMnnNf4C9ZRhafME28XbjYVAccVa8BZNPApDTPwPkp7xhtye1N6PuQkiTVacXkauZhDOG9m1WdA7kVDW9EfvRyRW591E2+e4pboPg95yRtK3EiEo3gSiGT4KpwqIvq9BC9dcheodXRwe0CukIEtaVmkJLT07vY08DRe/GkMGCdATdVLmof+TU/aN5vKTDr5gE8UQNEbNn8vpXwVf+Z+Vt0dPzTm6ZhBIzYZjjXj00m9I0fHla2R+SPcZ1tYTVDIlyqXQjmp+FeuSzZCjusWhX9L2tPnvt1koilWaK9VTzNek8c9mdHkl3eDPcmGy8jykSa4K0ymV/bI97TsYLgnagdjb1rEyGfnhiml9p/oOtCQHUQGtq2+7ei8tJCmt/+sqpeUJ/JwrYBR7f+nMdeBDlYmhjd+Z9eSGUFMQ7Lv7o/YCvIO0kQT8ARtC
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 09:55:43.2511
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ad542d5-aea3-424a-f6b7-08decb8d6e42
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7794

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

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/i3c/master.c | 149 ++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 141 insertions(+), 8 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 3b19a5e8f46d..f0e05bcac26d 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -5,6 +5,7 @@
  * Author: Boris Brezillon <boris.brezillon@bootlin.com>
  */
 
+#include <linux/acpi.h>
 #include <linux/atomic.h>
 #include <linux/bitmap.h>
 #include <linux/bug.h>
@@ -2596,6 +2597,55 @@ EXPORT_SYMBOL_GPL(i3c_master_do_daa);
 
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
@@ -2612,6 +2662,13 @@ i3c_master_add_i2c_boardinfo(struct i3c_master_controller *master,
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
@@ -2626,9 +2683,6 @@ i3c_master_add_i2c_boardinfo(struct i3c_master_controller *master,
 		return -EOPNOTSUPP;
 	}
 
-	/* LVR is encoded in reg[2]. */
-	boardinfo->lvr = reg[2];
-
 	list_add_tail(&boardinfo->node, &master->boardinfo.i2c);
 	fwnode_handle_get(fwnode);
 
@@ -2683,8 +2737,8 @@ i3c_master_add_i3c_boardinfo(struct i3c_master_controller *master,
 	return 0;
 }
 
-static int i3c_master_add_dev(struct i3c_master_controller *master,
-			      struct fwnode_handle *fwnode)
+static int i3c_master_add_of_dev(struct i3c_master_controller *master,
+				 struct fwnode_handle *fwnode)
 {
 	u32 reg[3];
 	int ret;
@@ -2708,6 +2762,74 @@ static int i3c_master_add_dev(struct i3c_master_controller *master,
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
@@ -2719,7 +2841,13 @@ static int fwnode_populate_i3c_bus(struct i3c_master_controller *master)
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
@@ -2787,8 +2915,13 @@ static u8 i3c_master_i2c_get_lvr(struct i2c_client *client)
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

