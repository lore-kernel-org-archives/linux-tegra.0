Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010045.outbound.protection.outlook.com [52.101.61.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1333823BD06;
	Tue, 28 Jul 2026 07:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785222100; cv=fail; b=LuDZ8uBrH48VzuexD+MJqsEW61+sGP+CMiAs72D3NfdYgr9mGAhmcPPgjFUXw61r1FcJHRNfqMjXC5jPMp9+hJ6u581IwR8Hp1KHpila09Afu/qJt9mMhtLrJ/w0Z4//o3FOaJKWIGIGS6qKvNlk5h5BvpkS88lgEzzhtuL/T24=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785222100; c=relaxed/simple;
	bh=mZAldA9p7Wn9wYizbdcuGQVPv8XxWSam0hxtchVzceA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h8xZyjtr350nW69WD7WUv2I3Fws3M5M9rxnenUQbWRJD/9QSYqTXE14Gvfdzavc4wIi7RSLiU5XMnbnV3CThcWiY8NKH6Wf+Dflm64NKzGgfG8MIQU9KhwKvvXoY3QTJXWZDyFJDpCcW1QFYbY6voX6WnFNvDwIreMxi9kbhuyM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=r7ywd0M4; arc=fail smtp.client-ip=52.101.61.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="r7ywd0M4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dWT7xax1Pu04sgdb30c7Zfit6F3clodFzJ/SqgQYhkf5LUO+s8PaeOFZ8cjoimGHEv5RMSSMBn28SV1raVp3vK9pC9lDvlWP1Ww/Z91rpUyQtE/zOE9vmsVv+x2WcTiFN5ZHZffoTBCZbs4++SpJ3lPrEVFVN1ciQHMgvgTxuyMvvuD6reEdOO1ZIll7kEc9Q3WbYcttJczBujTH/KruZj16gz6/tPeaaOq9kmwW+z9emkRLPafovMStuTzaOAcTjZhsNpEMB16GXxvVNZA8KsQbPMjSJ6O+l8DkOba8eAWzfkzRXHOauHjdNHGyVPtzXYtYoxN1VDlWh+Gt6R9oWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5tM29QjlfxY6WHV5Mq090YXd/R2iTJTveeFBrOS3eug=;
 b=hoO3n6kUkODttn6cZ4SmpjAvVLEvFcOiEVe5bphsvG4UYzdvagrs/QoZTfTndlZ0uI7lL3sxj4VVl2tbMRg+U+3ilDlqLNCoa3QMhCnfxP/4V5nhL1puc5R7eM/orsBlvfMPFOo23PzJmhHy/szgfyCwBZwzBGG5zj2xvuqCQGLFvjtprr3Y6M0sStdwSZIRJD+IGZmwgD1hM588r5uZBamZ5P/EHW5lWwwcpaL218RFKEY6ubCGUODmC5CwHFVTufuKCqwqNEyb0wf8/0tRWtQrIeTk5LHQ51ZdAY7cdUOHZWCmAhVIouwk6O889xfpXRBi9tKv9W4kobLtpTFLuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5tM29QjlfxY6WHV5Mq090YXd/R2iTJTveeFBrOS3eug=;
 b=r7ywd0M4SR1C29Q4TItoIDa09GWLoXYuVROYFGqnwp0o8/DGdNDu4BmCjzJf7ZEUWqsjBpIhRh1AgT61h1TFdcZwPReTezHmNTk7VjJsN7J1Y/P/aCDkxm8mJbHXkuMRebQaWG+utYqjc8GPJPWco32LmDaYzHFycmqohZsETWvCyj8FrHM5AtOmcVkCDFvOWZykw4aIKAM73GL1QnWwrKHz47NS5nQOHj7x7SqSvLYXXitOW3gvj2WB3dx9HEvrkMFQc+Rsfset2nYqsmptnRO6UUdQPBoIvt3NBPFaYST5N+v/giGQEvV2Qa1Gv/Dxue2FkSpT4ndBIIUPEE76XQ==
Received: from IA4P220CA0006.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:558::7)
 by IA1PR12MB8261.namprd12.prod.outlook.com (2603:10b6:208:3f7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 07:01:32 +0000
Received: from BL6PEPF0001AB76.namprd02.prod.outlook.com
 (2603:10b6:208:558:cafe::66) by IA4P220CA0006.outlook.office365.com
 (2603:10b6:208:558::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.12 via Frontend Transport; Tue,
 28 Jul 2026 07:01:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL6PEPF0001AB76.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Tue, 28 Jul 2026 07:01:32 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Jul
 2026 00:01:16 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Jul
 2026 00:01:15 -0700
Received: from build-akhilrajeev-noble-20260602.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Tue, 28 Jul 2026 00:01:10 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: Frank Li <Frank.Li@nxp.com>, Frank Li <frank.li@oss.nxp.com>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, Rob Herring <robh@kernel.org>,
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, "Guenter Roeck" <linux@roeck-us.net>, Philipp Zabel
	<p.zabel@pengutronix.de>, "Jon Hunter" <jonathanh@nvidia.com>, Thierry Reding
	<thierry.reding@kernel.org>, <linux-i3c@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Akhil R
	<akhilrajeev@nvidia.com>
Subject: [PATCH v7 03/12] i3c: master: Support ACPI enumeration of child devices
Date: Tue, 28 Jul 2026 06:59:45 +0000
Message-ID: <20260728065955.809445-4-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728065955.809445-1-akhilrajeev@nvidia.com>
References: <20260728065955.809445-1-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB76:EE_|IA1PR12MB8261:EE_
X-MS-Office365-Filtering-Correlation-Id: 774d0594-e0e7-44d5-fd10-08deec760e49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|23010399003|36860700016|376014|7416014|13003099007|10063799003|11063799006|56012099006|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	OvTkxKHrcleoe1+QwntmXlG4wF0188EwT6xXrgb8ubQuGBuMtDW9gBxcOSPn9sBOdggjv7edEXaZ2cmOLnqKKd5kGqZ6TQ4tQkMYbZ2BOvxCyhzSstPT9Ai3mt8+ZHjeMiwv6qAoKCzozVoUa+cfkfMgdGkGCqo8v5kci9kiCThFFpFyqN10uAT83tBT91HbUAmDUhFywxUpQ/Uo29u+9syHN1DCJOGGoMQq9B2f89vBKXcNKfYmiS3uYVjgUxU+djxRXc79noXh9HKHqEBh0evg+NwNVPL3I+27IavZQItoHVWDYgeCJhN5Q72h0nHNJMGceyv78oXhs+vOlvKa5ZhExrGEOFNo0tiTmG+5aYG6/t9x0G35054yNiG8RWXt9gXNm1dagKiDbg90r0MQoHgFhLRvUcEHjTVWE4qzuE6hNu1yoHjrvPl0hMzQXxeQplHX9wrpYmyz65tfjtcHw4qeLWsRb5CGG2zGuLApzsRRBEpj3nQ8eInlN5XpjGeZOhrguhrS0R8itBRgpU1JHr9tclKawkAsv7x+kufFJbMdU+SblD5XJ6s47yWFRVOh0Lplzm8nVbGCQet2vP0cpEynZtkAZ5rsjgZHaKO/+GjS2J4urDM+UBkTuWTB3Mi19e5rHNsyylf29Z8Sg/DNxU4z7AZxbLe1H1Ylk8d9+Hp9xck6378C0cUrXJanb7+TX5CTJp0qyidwQkEtr6aCCQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(23010399003)(36860700016)(376014)(7416014)(13003099007)(10063799003)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1K7Ew5+0b31D4SKXggGG7NZmGXWBz5faNgoLwVK6/nEa/P0Dpjdxe4quPVMjlz05hXS8pCF5A6DaMNAAb65yUJu7PLc9I1xejOpNtd6rfxPhsWoyd9egS7D07Exct0VsO90OvoongnBUkDij6n2v/GrcQl5gemxEig0svpFGJlhdeF8Hw/17aQPOyfHR5RwzytVa/+SFItXIHmANOiio5r9YiWTDUfh6MFJ7TL37EJ3ppB4zxtYQurKF75ik3p7jKUWgQcn0h1G4IwNylGBsWSLOzMSOYTg6KD14NxpUI9XhF0HdcoBmQF0QA+21+Wghi3EZmW1L7mrfBAAQKYWXdEl77Jl63QvF9Yhn9QXPEywpZ5HQ4wmjSxp3fRrRwImjcm7tzI6nnsKCzvgv24bO4UKc2k8q8xcSuftarEjSca/ti1Hf02oX67RkSA2Al2Ki
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 07:01:32.1427
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 774d0594-e0e7-44d5-fd10-08deec760e49
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB76.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8261

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
index 4b3d9628bc39..623c6b2247d9 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -5,6 +5,7 @@
  * Author: Boris Brezillon <boris.brezillon@bootlin.com>
  */
 
+#include <linux/acpi.h>
 #include <linux/atomic.h>
 #include <linux/bitmap.h>
 #include <linux/bug.h>
@@ -2621,6 +2622,55 @@ EXPORT_SYMBOL_GPL(i3c_master_do_daa);
 
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
@@ -2637,6 +2687,15 @@ i3c_master_add_i2c_boardinfo(struct i3c_master_controller *master,
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
@@ -2651,9 +2710,6 @@ i3c_master_add_i2c_boardinfo(struct i3c_master_controller *master,
 		return -EOPNOTSUPP;
 	}
 
-	/* LVR is encoded in reg[2]. */
-	boardinfo->lvr = reg[2];
-
 	list_add_tail(&boardinfo->node, &master->boardinfo.i2c);
 	fwnode_handle_get(fwnode);
 
@@ -2708,8 +2764,8 @@ i3c_master_add_i3c_boardinfo(struct i3c_master_controller *master,
 	return 0;
 }
 
-static int i3c_master_add_dev(struct i3c_master_controller *master,
-			      struct fwnode_handle *fwnode)
+static int i3c_master_add_of_dev(struct i3c_master_controller *master,
+				 struct fwnode_handle *fwnode)
 {
 	u32 reg[3];
 	int ret;
@@ -2733,6 +2789,74 @@ static int i3c_master_add_dev(struct i3c_master_controller *master,
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
@@ -2744,7 +2868,13 @@ static int fwnode_populate_i3c_bus(struct i3c_master_controller *master)
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
@@ -2812,8 +2942,13 @@ static u8 i3c_master_i2c_get_lvr(struct i2c_client *client)
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

