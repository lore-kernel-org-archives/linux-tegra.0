Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012045.outbound.protection.outlook.com [40.93.195.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A477831AF2D;
	Tue, 21 Jul 2026 04:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784606982; cv=fail; b=M7uX0KBBk05Rqe6ZGXlvBOOYf25gdQqeNRXr5B+J1K5sH6W/uOnDtWzBBAkoRuFWf6WRSfNTLkz8V/pptj2W0OZkRQ+FPMmpWWndSInlqDZepFhApp36lrpagMOFzUn+DvIjpsXzfHoMN7LP/p5gqjuWRY1aWXsq5yx9sF4+9SA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784606982; c=relaxed/simple;
	bh=mZAldA9p7Wn9wYizbdcuGQVPv8XxWSam0hxtchVzceA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m8UNjgfxwThnMn+gYSD1xAazArKWGI+OR3b2f0U31QchxftLFk4MD6Wqp12WFbGHJXhmuJAATz54WNHQcKTuBmDYPmQtkngVgMfTg6sdgvaMDdUi+2BKHVzFVt4spMysXWikq4d5f3nFSN1ALD/zyyi01D8eX1L5C89jSkUytvI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nJWDE4F3; arc=fail smtp.client-ip=40.93.195.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nJWDE4F3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m8g9550DDg1tjcgxDaVuAFTkwF++s/AC40P11JBLlA9m+/CA+WKXW3mfFLN0rOaHRxx8MiptCfUh5FRzYclmzbECUgg/ed28EscoSQxKndln6kuQUAWKwCUK8WTQE6qgubjSNlpDpUoPNE8F0riPl5b1/BlNqGUuHyGQzbSIwBiRNsXz/tRxsaGTffDwDFxZX+wI2w1k/yp3YigQBrmF7mCgm03QMUgTf3pBeurSPoUKSNLVxk3I/ljfP5rpHIsSc+JQNsdTghMfdRd/SMXZ6jxrwu6JiAB89CQ4sdayHkLRT70E2mjTlW246/SCqH/1CCFiDgril4qlHqJUt+VSCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5tM29QjlfxY6WHV5Mq090YXd/R2iTJTveeFBrOS3eug=;
 b=VYthu5Ugcam/ohivc/pFd+skD+N40uwHVG9R3j4SZ2FI0WuihytDwPiE5rbQs+HGgtngnSfH4AjK1+21PybQMtLYb4EWHGCJX1D308j9j8/qZjCHXq1AsA7S3R6IhhCsMzoulWWlVewRyVCzjJJ8mkeGskvhVLMpltuitQbUva08BvIq2BLRIAtGMVjpW/F9rC7Mzo0MpS/Kuu7Twuq43BYpcQIIT+FrckUH0jeWnj76c+WlLSNh+vdsRDZ2vFNhwVVL7qjvbN/W+wNGbn4CkuG8UeAb7iRfLjh23Zy2rNTjkNWcM/8Fa1Uv29NlZKVXiXito1sbrGP3cTRMCg5k5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5tM29QjlfxY6WHV5Mq090YXd/R2iTJTveeFBrOS3eug=;
 b=nJWDE4F3kkd8duYL9Y+o8fY0THfw5YBpb0CWH3w8M+FdHCbJBO7wVS7WlNvgy6mFCjPKdTpXu6elzcQ27Oc5F+FJMiZL/e0T0h4Ipebl9xwkzZol5bwJg9WOaX6IDqHPHPKbvUyxMQeWqNOFzz0hP4oTaHDU43WFfsx3/ZLf0vCw4S4A4OAtYCQJIuVMZX4mi458PeDapCC4cfw/sdOflwp7WIa3Yf1IYW2kTCUtmQT30405LYUO9jzkkPydYM/nx2wpvcKDimYeH8vfwamtG9W02hSic3Kr85QRqdaUikB042OaK9u9tWa5fRiMKmBo7X2xIwtr8Ie9tPktZRBkfw==
Received: from SJ0PR13CA0008.namprd13.prod.outlook.com (2603:10b6:a03:2c0::13)
 by IA0PR12MB8896.namprd12.prod.outlook.com (2603:10b6:208:493::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 04:09:31 +0000
Received: from CO1PEPF00012E7D.namprd03.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::35) by SJ0PR13CA0008.outlook.office365.com
 (2603:10b6:a03:2c0::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Tue,
 21 Jul 2026 04:09:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF00012E7D.mail.protection.outlook.com (10.167.249.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Tue, 21 Jul 2026 04:09:27 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 20 Jul
 2026 21:09:10 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 20 Jul
 2026 21:09:10 -0700
Received: from build-akhilrajeev-noble-20260602.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.6) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Mon, 20 Jul 2026 21:09:05 -0700
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
Subject: [PATCH v6 03/12] i3c: master: Support ACPI enumeration of child devices
Date: Tue, 21 Jul 2026 04:07:51 +0000
Message-ID: <20260721040805.1696503-4-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E7D:EE_|IA0PR12MB8896:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f32ed76-44a3-4af8-c4f6-08dee6dddb51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|36860700016|82310400026|1800799024|13003099007|10063799003|56012099006|11063799006|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	ajRC0S9fal+JTHc1/iZiVi4XCJFlRAQ9ky9atBkwsFB/aCLh2Il2wFP85pFLevu/ra2EERIAW+VyfFNDUOWH6kzaIPopeldrCSkDZbTF3DpORWhxXoPSVf8GoekyyNccM4jFNf1z6VLyvnfFg+UT1O+CLrjIsCk4cuX3vPJbWHLKPGoKo4phsUTUTfxoyyTqheKJ5mYKpEtpQBycCajY7P8UZoRzqrvlV34k3j/AKliL6LG0pR8YEf65tOZk28+k/FQ27OBoMFZyd1cicHZZCVp/URo3rjid2A09SIR6ELBa2bum3ygnrY6f+WwsoQ6zu+IoC7KHBGrdbleZbwA6gbpzM2zq9GH045VtNCp7rbllysMOuyXmT6mFEIlnwzGWLiUpXxRC2maNU8V06ONd52qpNuOuWDT4FZgFaZUJsvGMm8Fk93h4wEDJLGcePQjcEnot2i1/vnCDy0/1MrnyBaZma7ASHoKQ2oExLu8QXDLQ3iVX/h28dcUSTKfup1EXjrDE7D3l2hRW0UGx4FCda0yc4DoXnMWRGNMIGBr0sexAxkfS8mK0yxSTDXwWWxBaNrn2k+p6Y0Gzk5aYvhu8+Wo9+O+nOK72gJ8p/9RzVcTgJfjM/KFM6a+BtGBQgQiT/CV5tPms63AZCgf2eG5xonpYjxqPCTfu+v82wIK96ydDxl0fnAIWh0h9E4WhkxdkX06xttme4uPvNUbZWkwiPQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(36860700016)(82310400026)(1800799024)(13003099007)(10063799003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Dv5QyeMdaq9Fh5hc6sFHHozj42wI6WjmaMPW2xeqXKA7Cx1XpGjNp1uoz2FlvRnAVhmciO8ApK+6vBsO7/4Zhl/zEW7ZQqwU0IJYpRFmKG66xDppjz9dxOuLFyM/MUjzPWFj4W9rpSgH6ji3WRzCaaZIf7+1TjHHso/YCp0v+OCaTuEMtkAWzT78eUt9u8zZnV8pzo4ZllscRSKWojIN64a478u5oW1f3C2JV7yxtoqZ8X2lNetMHE7+nJtIvVRTujewSa+fAV5r1VHwwz510LPKMQVbElhMyVcb2qXLa2YtCqZqglLKwOWHlIixymlZXT4vFrb+lFxFrtV7Y8ZJd3m9YlfXsivemEdeEtcc9bosgTcuVeYlIUL9FIvrOE0H2Ns5LtqBR6U0pIeYlAJwfC6u8WraZaNm3EWycLao1QJpoVL5gQvUtUPecNFYX53t
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 04:09:27.3431
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f32ed76-44a3-4af8-c4f6-08dee6dddb51
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E7D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8896

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

