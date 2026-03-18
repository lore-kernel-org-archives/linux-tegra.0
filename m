Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011047.outbound.protection.outlook.com [52.101.52.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A83281503;
	Wed, 18 Mar 2026 17:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773855006; cv=fail; b=eFoMsV7fSc7tMaRbaKrw1RW5ulDsP4o/JEUvCfGzePSfOEHvuQo+pwwimkkPuxYa1dDvMx7Kx8hHHHpqJ8apVRFiGcoOHSIEyhh1LXFG9VOa98TrQoei4mLsG5kGPtrPrzg5StcUVv+Uouy3h58unElrD9xuzrhICCyhD/Os3xs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773855006; c=relaxed/simple;
	bh=w1P6NNqtxlXKCsKr7tPNTIO9s/dJxLrMo2mh6gTaBA8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P6Uy6LzESzeQOfZQIR+zMAxAQybBU8sKSt49vTDUvkPs6n2Jlqpsoz4HW/b2oxb77XTzEpgM2tyC5jkMZ9M3WOwEjcu3o7dSB9dWJCxj5CNRv25cpf83sqYRf2WFHkPdUUxMrZfz4EBk7mEk9wVjCK/2pbYjzUghQt090vIPwQM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rdtUaBWW; arc=fail smtp.client-ip=52.101.52.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rdtUaBWW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sgao+XSxHS4g4EOL/UOB8rQeDysPprHChf+vYe+Nr7JRHDfFJr330UBs/lZQjfSAcUIVh820U+xVjrX5K0NtnuoPvUiK5RtsMfh/rKSWMKZ/4GacJrqn9n+NKnqEbqnko35g5FCesK9GxnBaenv/PD/Xxik/H5Vz9FGL5XXT5X08+Pg57VRrdBaFOq7JlCCkwW/mX9+1TnIrxLWlw6rLEoX7a9GWkW85TlBoznrapzXF2R9xfOFeZTwx2WWisbkhuZuEyZVwwOM1Jtmrk5hWr1sR5SqLbyeqhXYPdc0CaGbabwnCGrpILAbVxQ/Hl4b4qfcnhSSH6RHiBf2qWrrf1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c24F1wGB2xEVNRh3VxeJZ2NuYt9YFfsPnDjvpuQaMI8=;
 b=kLi41bYOTPSUUUYRZSJO1H2R1Hoj7lz67u9NMJTSvuvFO/LkjsTAh/YTFIBp6mWgIaQqM5Y8cWOB7q9XaMIj1ldSP+CB7zkfWlaWIaRS20wFQQkj95cf9ywVo8uLiqxWU1k1KnLlSBiqYvmc1rZOjSo6qVVWsWvb+vrMn+oG8ELD6A0xCKdYoF/QRbsJQDgW3oPdXhLci/q7Yo6p771894n8RZgUhr0/syZCRcYFqXsnSDCW3SyAWKxQgffsq4gRMePRyR/jPChjlm91UgrO7kzaYcmcwwv9pE7MRg179NOLzU0h47fOwCkmht0N4GD3qb1ka4PRTF4V6ZgXMjBEsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c24F1wGB2xEVNRh3VxeJZ2NuYt9YFfsPnDjvpuQaMI8=;
 b=rdtUaBWWcw4wka3+9vTaGvK4INKQkTAj6pfIYgYDarLzCR7whDLan6oqNHG3DIJBQCgiRIAF0OndIIjRqjDnVbf/9NZ7S19kbpyQtDOwS6unn5oegLxDjBYaq13TJDgducrk5vN48hbTvB7A7D22vaWa2SKzCqqFdmsossGOYibt7nr4djgxn4/1XzX1szaWwb6udkXVEvS4yQmZK2Zoept8zLwSsbw53aRpBDIV7dAGhZ6TdRBzuIIXzKgWyDiJrSaDz5lXFEfia5IFp/oLjq1wBWVpVG/858tKOKhvTCGa8nSjYZDiP+3GnqnIp04LwWq1l7Giui+VY92m1ixFQw==
Received: from DS7PR03CA0308.namprd03.prod.outlook.com (2603:10b6:8:2b::31) by
 CH0PR12MB8486.namprd12.prod.outlook.com (2603:10b6:610:18a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Wed, 18 Mar
 2026 17:29:50 +0000
Received: from DM2PEPF00003FC9.namprd04.prod.outlook.com
 (2603:10b6:8:2b:cafe::94) by DS7PR03CA0308.outlook.office365.com
 (2603:10b6:8:2b::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Wed,
 18 Mar 2026 17:29:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DM2PEPF00003FC9.mail.protection.outlook.com (10.167.23.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Wed, 18 Mar 2026 17:29:49 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Mar
 2026 10:29:30 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Mar
 2026 10:29:30 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 18 Mar 2026 10:29:23 -0700
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
Subject: [PATCH 04/12] i3c: master: Support ACPI enumeration
Date: Wed, 18 Mar 2026 22:57:17 +0530
Message-ID: <20260318172820.13771-5-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC9:EE_|CH0PR12MB8486:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a5e58fe-4be9-48b0-4a13-08de8513f507
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|7416014|1800799024|18002099003|56012099003|22082099003|921020|13003099007;
X-Microsoft-Antispam-Message-Info:
	W0e/r1JSIaRWmfmvZ7oLd1fJkF3FNrysTOkm90P6zK5ACnEzIy6LxIrcOC4/rnG5ig/P+oHh1J62tW55D8S5pZW5NeBPawWZp6KvUbly6/Mg3612R3uMOI2zed/GnfgSFM0S587sF4p9ic8Ywz4tLXXpQR7aQabQhEGm6UFiIEq35Wp4o0KkNez5oUL7zokt5riQAfcAcqTIVolU36eC0Eb6k411frzyRB8Shj/2BxLR+B3gcBToyMTW0x/S2v4WkBqSF++JPJmqgwaS8nx7clZvG21WZOd4gLL7Cc5D2Nb/iDhFCjHzA8FXgE40sPtQNBpr3RlBvO+AAKr/4Q0KA/K1SgQy0lJUwwrYKGJFHk+QJhVvKz1oR1ru35kVlAgNHGZlzSlxHwZIK/1nth5+tPOo9sXZ88fjt1BobvZtYXLB+UFgbwvmhoIWZ9wsVquE3Py2pI8tuZSqqm+TEKCDAs4TaxjYMmW5kaCfTj7mRF2OvWcuzeJ9bAL6kFEqj0FN5wGXW1kpMDd5WAq96uWUoZpAxmrLDu568drMHOYfbNwT+YZjxF6L1iCg5l9wRHWkyRL55o865vOLKXGJ2UBWtWxqSKJji0xKMoW2sAUA2xzz4NTqd9wh5GgofSPf2CQcYPkQSjYyw3tWuzF5z3vDrZsrYREjsevVLEOOke0iHlnV5MAHYWjw7trnWvyUofnLZm9762LcuSsPmwLPm8NMC+qp6av2hyJIwVMaLLOCVGiDQjHwOLQbBRUCXmFxLb8HvVFeRrNJ5eRh+zG6q7eNjFMEdV0yJEhs48DGL1vWdi0/M3Rjt6D0mHpom9B+Fl8u
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(7416014)(1800799024)(18002099003)(56012099003)(22082099003)(921020)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	bUFncu08YUchnn/jt3RcxjwOY26W7wMN1OVd8oGX/CwkEJQ5w1jcwQeJ1OL0urSz7TC/bmXn30GC9vyLTuCbbiFB1lvUMEGJObIf4nfGCaEzYkCePG77jDNMXWSsR6xMKXL5l3Z9hffcc/lK/Rs0f2ruyrott19OM40UxEzzbr+BzKWBlcPFijUs/Mb+3uXfeRV9bFw0pxaXqbHVx9kkDe3CT3Z43nrymnSLtdA96LFRKRxfULSS9fKX1FjFHXA/HukjMBYxPBE1fWKvwfVKG9uXIeT0ukN8ALZicGW8NKJekVY1WGFd3laHU+gh7EbNH7qpLAT0EvqtzQLpBUJqK86F5UzFf1DI2UnFTTk2JMJj4Z8ycZqjSmsKdoJwo4gnkK99w7E2lrbUim2TncMiI52t8arBJymYjrrvS5/CsE7RAW1j+KNaITEFI73jBpra
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 17:29:49.3699
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a5e58fe-4be9-48b0-4a13-08de8513f507
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM2PEPF00003FC9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8486

Support ACPI enumeration for I2C and I3C devices on an I3C bus.
Read _ADR and LVR from the ACPI resources and extract the data
as per the ACPI specification for an I3C bus. Also read
mipi-i3c-static-address as per the MIPI DISCO specifications [1]
to get the static address to be used.

Although the existing subsystem allows host controllers to register
through the ACPI table, it was not possible to describe I3C or I2C
devices there. This change enables describing the I3C or I2C devices
in the ACPI table, which is required if the device is using a static
address or if it needs some specific properties to be attached to it.

[1] https://www.mipi.org/specifications/disco

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/i3c/master.c | 101 +++++++++++++++++++++++++++++++++++++++----
 1 file changed, 93 insertions(+), 8 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 2c479fecbfdf..15a356a2b3c8 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -2404,12 +2404,31 @@ EXPORT_SYMBOL_GPL(i3c_master_add_i3c_dev_locked);
 
 #define OF_I3C_REG1_IS_I2C_DEV			BIT(31)
 
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
 static int
 i3c_master_add_i2c_boardinfo(struct i3c_master_controller *master,
 			     struct fwnode_handle *fwnode, u32 *reg)
 {
 	struct i2c_dev_boardinfo *boardinfo;
 	struct device *dev = &master->dev;
+	struct acpi_device *adev;
+	LIST_HEAD(resources);
 	int ret;
 
 	boardinfo = devm_kzalloc(dev, sizeof(*boardinfo), GFP_KERNEL);
@@ -2420,6 +2439,23 @@ i3c_master_add_i2c_boardinfo(struct i3c_master_controller *master,
 		ret = of_i2c_get_board_info(dev, to_of_node(fwnode), &boardinfo->base);
 		if (ret)
 			return ret;
+
+		/* LVR is encoded in reg[2] for Device Tree. */
+		boardinfo->lvr = reg[2];
+	} else if (is_acpi_device_node(fwnode)) {
+		adev = to_acpi_device_node(fwnode);
+		boardinfo->base.fwnode = acpi_fwnode_handle(adev);
+
+		ret = acpi_dev_get_resources(adev, &resources,
+					     i3c_acpi_get_i2c_resource, boardinfo);
+
+		if (ret < 0)
+			return ret;
+
+		acpi_dev_free_resource_list(&resources);
+
+		if (!boardinfo->base.addr)
+			return -ENODEV;
 	} else {
 		return -EINVAL;
 	}
@@ -2434,9 +2470,6 @@ i3c_master_add_i2c_boardinfo(struct i3c_master_controller *master,
 		return -EOPNOTSUPP;
 	}
 
-	/* LVR is encoded in reg[2]. */
-	boardinfo->lvr = reg[2];
-
 	list_add_tail(&boardinfo->node, &master->boardinfo.i2c);
 	fwnode_handle_get(fwnode);
 
@@ -2491,8 +2524,8 @@ i3c_master_add_i3c_boardinfo(struct i3c_master_controller *master,
 	return 0;
 }
 
-static int i3c_master_add_dev(struct i3c_master_controller *master,
-			      struct fwnode_handle *fwnode)
+static int i3c_master_add_of_dev(struct i3c_master_controller *master,
+				 struct fwnode_handle *fwnode)
 {
 	u32 reg[3];
 	int ret;
@@ -2516,6 +2549,31 @@ static int i3c_master_add_dev(struct i3c_master_controller *master,
 	return ret;
 }
 
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
 static int fwnode_populate_i3c_bus(struct i3c_master_controller *master)
 {
 	struct device *dev = &master->dev;
@@ -2527,7 +2585,13 @@ static int fwnode_populate_i3c_bus(struct i3c_master_controller *master)
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
@@ -2593,10 +2657,31 @@ static u8 i3c_master_i2c_get_lvr(struct i2c_client *client)
 {
 	/* Fall back to no spike filters and FM bus mode. */
 	u8 lvr = I3C_LVR_I2C_INDEX(2) | I3C_LVR_I2C_FM_MODE;
+	struct i2c_dev_boardinfo boardinfo;
+	struct acpi_device *adev;
+	LIST_HEAD(resources);
 	u32 reg[3];
+	int ret;
+
+	if (is_of_node(client->dev.fwnode)) {
+		if (!fwnode_property_read_u32_array(client->dev.fwnode, "reg",
+						    reg, ARRAY_SIZE(reg)))
+			lvr = reg[2];
+	} else if (is_acpi_device_node(client->dev.fwnode)) {
+		adev = to_acpi_device_node(client->dev.fwnode);
+		memset(&boardinfo, 0, sizeof(boardinfo));
+
+		ret = acpi_dev_get_resources(adev, &resources,
+					     i3c_acpi_get_i2c_resource, &boardinfo);
 
-	if (!fwnode_property_read_u32_array(client->dev.fwnode, "reg", reg, ARRAY_SIZE(reg)))
-		lvr = reg[2];
+		if (ret < 0)
+			return lvr;
+
+		if (boardinfo.base.addr)
+			lvr = boardinfo.lvr;
+
+		acpi_dev_free_resource_list(&resources);
+	}
 
 	return lvr;
 }
-- 
2.50.1

