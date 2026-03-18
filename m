Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012026.outbound.protection.outlook.com [40.107.209.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF5830F957;
	Wed, 18 Mar 2026 17:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773855016; cv=fail; b=omD+4Y5Be11k2pm0mhkJVsMlnOmZ/oUFrn1He3MDmQlMTtkG0V6cA6tOqgni76KZ0inH7OYurPFi5yrpmUrNJD1hiG0Nb4jb6cYJc1VQiA0zbLkU/iHMjCG1vPu7CakOphLN8kweRZiyQViXEj0uIs1f93muRV49z//6Tj2yRbo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773855016; c=relaxed/simple;
	bh=LMhvhV95x9BzHpyKHBMere5vuqamebc9jSFZ5sPgOJw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YvbY7AI7QMHViHOf2KhwnKfyEsmwp0NbTi741tAF4AXlYZsla3zpUURvYBqZ62vp4ttytRSs2IwtZfvmraVtPLszbvr8eQvCqQCZHvX5ppnbQt6UTsIe4gbRYsfWNYSQX6Ti+WAucCufwGaZh+93ntMEYDPCYkD/T6jkEFeFLKo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cerz9M7F; arc=fail smtp.client-ip=40.107.209.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cerz9M7F"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rdlOF4gytph5zkhkT+VTpfkRxSPriX3wGD5dn7o4rgTAbpbH45tyAgntyC6i2EY/hDqHPowisGUjcEm9LqZiPH1jdR6MEhNwWyTxB4boMDCpBmAfosJ5q3UkZRQFc3Tx40ha/ndwlt333I4HGH/Yob9zuTDkzGqY8t8eny72esS/TEDs4syQVoHmLzsbAUGBjq1wy/t9HdzHfT/PjLU52rZIOXy8IHKJgvEtHLtwX0TwHUfMOx15qkcPOymprslhlHkbkQ+Y+ExBgi4bgL38dlxPjZMqUvY7ZZXoCFLm2thYuAdekrIG7hPU3BZ1wcn8tBXql6aHpP4yk9Qtfy7HgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PHhLpgHwb5j2yifNn+ZguUjf017Y1aaYsk1VvHpf+sk=;
 b=CSrPc9L1qcMLvXHoemetaTUULT+YpDMXGYnK6xRsb6Kxs/Rsc2bsSfkrmZ0WEcA11H/5/cCuTIs9CdiaDy4yPrgz9bX5cZH67h1gjm/1G0zMjoSdjPTzrbW4k4fw38D/aRmtJC/Nkkeyp1h19gZ8W8uFUVsED997+A2OF2nhdbsukS+ZO9XPhSlWV9PXcdbxAoR0LlzqcVyTyb/wwLQaUItiqM+W23lNCIAOzGMdIpEmVcUvaA9TGS2ncJ2zKi1z/fxr147ccbHHWZ0aRh0Ycn7Xq3siwYb8TKejRu887iWLLJxZhcgaGAbJLJa55i36usyrAx5PWvPny1eCP7a+Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PHhLpgHwb5j2yifNn+ZguUjf017Y1aaYsk1VvHpf+sk=;
 b=cerz9M7FA9TqMcnECt8MT4Fo4A07h/HdfP7S/UEpMggHWIyDw2OTNvuCgymgOqHBoTtEyBz/qg/UwUPJnWHPFVZWbvKWhY4BGGh5AuJ2rI96XSNq6FhdmurxXG8O2DcwXh9f4pyv+eRq8qnX6wnqXpcl43lgMqWcXyKrqqVDxG0HdUlQg5CiEKcKJqpqUlVoazTMABPVI0x8DP7lnCtBbDn7H7VRkfz+t1t3FfwSbvqrq0YBh4LeS+99RsvHLyiLwr+RyLrZ/ZD6Dkfi+r0wHKzPS5D+WYuyunAXz+EaT+e/FjN6+8Yfv9/bKMx1YE8fXZPIkFLZgy4umvNqRC++dA==
Received: from MW4P221CA0029.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::34)
 by MN2PR12MB4359.namprd12.prod.outlook.com (2603:10b6:208:265::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Wed, 18 Mar
 2026 17:30:08 +0000
Received: from CO1PEPF00012E81.namprd03.prod.outlook.com
 (2603:10b6:303:8b:cafe::2c) by MW4P221CA0029.outlook.office365.com
 (2603:10b6:303:8b::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Wed,
 18 Mar 2026 17:30:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1PEPF00012E81.mail.protection.outlook.com (10.167.249.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Wed, 18 Mar 2026 17:30:08 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Mar
 2026 10:29:48 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Mar
 2026 10:29:47 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 18 Mar 2026 10:29:41 -0700
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
Subject: [PATCH 06/12] i3c: master: Add support for devices without PID
Date: Wed, 18 Mar 2026 22:57:19 +0530
Message-ID: <20260318172820.13771-7-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E81:EE_|MN2PR12MB4359:EE_
X-MS-Office365-Filtering-Correlation-Id: 60a35f49-eff1-4d27-f478-08de85140025
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|82310400026|36860700016|921020|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Gnv9S+N8z9E69YhHPo/8Daecjrt7FhfOQLS6es1Nf8+Y7GMcTobDj9+K1rUefJupfmPXXhhVL4J8yQ9O5VntOYJ7kzGfXc+NPxV7+pFi1JxPIiQBXGxdNJniA3T7r0I7CpvTYhNFFZvQbavDYxIoofYvX+84wbcrMoDWEZbGpOaHkLNjzeMBiF1MD/3Hjv+5sQ1kqppTBGyoq7Biwe9X+63DXJ78POl7kiLW7J13NomEflTW7m7GihjSZq6u2/OKt5Geg8OmszZnlwRnVlS/hte7gChC7y67U9yGuelFv1uTjWln2EWAvZ8l0oR7vQeli+lV9oPMvO4ICOphuj9EwfrQ9Gb7TpkmHheL3Y87jZBe6b/Ey1IiAY8AOiIp1oAvsVndtMV4HDiAZUJ9juGRwjJQYuAU06PotfK+aebGQCRTRI7HgSIcUb+recnJbAO4jxIoNcjQ9ltynVS44ULkmuLushxztEt4CbD6qAqPrmOokfkep0d3OKYKjQcu/YJ906UCkJOA1jKjknoyEAdxeFmdAqGvoT56GwSn2w3WnwpESMQGOgyypOFkzUJk5HbZKM1ySzdJK6jZNGi/mjs7xtK1o6NPcGPYQ+dNL4tnmzYDSX2iMTNtpyFm0cHnC83Z8y+kRy27FimJGhYwMR5bv8V+CYrEs/7qkhNRME6v+GcRPe6owDe+1oSNAnKE0mxjxG2LStv3xRKLgBDcoK6lkGb1EF3TYm6idDPXxtMA0I7u9S5+v4SA45nmeSVUQhgNYKqFh1/lIWsd8KDVgBsRlC1EWmDFcmZ3DsViimrwxvrFSI/Js30iCZXgM7x6T90I
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(82310400026)(36860700016)(921020)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	GmvKvUX3gJtj0WxLZGBgXhIZmknL8U3wLDF/85e3e+wNB3N+DRDvoIkKaAPX5KNoVCAn1Npf3w18K6bmX9B5xMPiBKiLr2zMhMQRdzhzkr0KAMWUx/2cDTS3rNI0maJMlLChbzHgj6RY2gYxuwWtJfLFkyBbaWbvFf6oigHii5jRYv7ZyLQ9etXsc4tzfz6KqYjqFHzczEIz63IN0a8WTg0nA98DQcQ/71DYAA6BV/Hw7ytvOlAp+QlBW8aYKWoN5rNNSQhC2n3ZYVoJyXGfLtUS56AD5INbBSITx6x1q0pcbwhaBxHchopztp77fz+hD/ie+194ikP/XaIAZbpEucplX0jLx5f/R5yRdHk73f5D7rZf5KDgftdTy3BM+hQggxeGlUA7mZJZaZc28AOuRc9WKCC13DOvWYMEo90ONT+LeX4/r39MlunEtJcNom9k
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 17:30:08.0541
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60a35f49-eff1-4d27-f478-08de85140025
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E81.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4359

Devices using SETAASA for address assignment are not required to have
a 48-bit PID according to the I3C specification. Allow such devices to
register and use the static address where PID was required.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/i3c/master.c | 51 ++++++++++++++++++++++++++++++++++----------
 1 file changed, 40 insertions(+), 11 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 40a3bb734234..0cce75bb05b0 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -1835,8 +1835,17 @@ i3c_master_register_new_i3c_devs(struct i3c_master_controller *master)
 		desc->dev->dev.type = &i3c_device_type;
 		desc->dev->dev.bus = &i3c_bus_type;
 		desc->dev->dev.release = i3c_device_release;
-		dev_set_name(&desc->dev->dev, "%d-%llx", master->bus.id,
-			     desc->info.pid);
+
+		/*
+		 * For devices without PID (e.g., SETAASA devices), use
+		 * static address for naming instead.
+		 */
+		if (desc->info.pid)
+			dev_set_name(&desc->dev->dev, "%d-%llx", master->bus.id,
+				     desc->info.pid);
+		else
+			dev_set_name(&desc->dev->dev, "%d-static_addr-%02x", master->bus.id,
+				     desc->info.static_addr);
 
 		if (desc->boardinfo)
 			device_set_node(&desc->dev->dev, desc->boardinfo->fwnode);
@@ -2281,8 +2290,18 @@ static void i3c_master_attach_boardinfo(struct i3c_dev_desc *i3cdev)
 	struct i3c_dev_boardinfo *i3cboardinfo;
 
 	list_for_each_entry(i3cboardinfo, &master->boardinfo.i3c, node) {
-		if (i3cdev->info.pid != i3cboardinfo->pid)
-			continue;
+		/*
+		 * For devices without PID (e.g., SETAASA devices), match by
+		 * static address. For devices with PID, match by PID.
+		 */
+		if (i3cboardinfo->pid) {
+			if (i3cdev->info.pid != i3cboardinfo->pid)
+				continue;
+		} else {
+			if (!i3cboardinfo->static_addr ||
+			    i3cdev->info.static_addr != i3cboardinfo->static_addr)
+				continue;
+		}
 
 		i3cdev->boardinfo = i3cboardinfo;
 		i3cdev->info.static_addr = i3cboardinfo->static_addr;
@@ -2296,8 +2315,12 @@ i3c_master_search_i3c_dev_duplicate(struct i3c_dev_desc *refdev)
 	struct i3c_master_controller *master = i3c_dev_get_master(refdev);
 	struct i3c_dev_desc *i3cdev;
 
+	if (!refdev->info.pid)
+		return NULL;
+
 	i3c_bus_for_each_i3cdev(&master->bus, i3cdev) {
-		if (i3cdev != refdev && i3cdev->info.pid == refdev->info.pid)
+		if (i3cdev != refdev && i3cdev->info.pid &&
+		    i3cdev->info.pid == refdev->info.pid)
 			return i3cdev;
 	}
 
@@ -2582,9 +2605,15 @@ i3c_master_add_i3c_boardinfo(struct i3c_master_controller *master,
 
 	boardinfo->pid = ((u64)reg[1] << 32) | reg[2];
 
-	if ((boardinfo->pid & GENMASK_ULL(63, 48)) ||
-	    I3C_PID_RND_LOWER_32BITS(boardinfo->pid))
-		return -EINVAL;
+	/* For SETAASA devices, validate the static address instead of PID */
+	if (boardinfo->static_addr_method & I3C_ADDR_METHOD_SETAASA) {
+		if (!boardinfo->static_addr)
+			return -EINVAL;
+	} else {
+		if ((boardinfo->pid & GENMASK_ULL(63, 48)) ||
+		    I3C_PID_RND_LOWER_32BITS(boardinfo->pid))
+			return -EINVAL;
+	}
 
 	boardinfo->init_dyn_addr = init_dyn_addr;
 	boardinfo->fwnode = fwnode_handle_get(fwnode);
@@ -2607,10 +2636,10 @@ static int i3c_master_add_of_dev(struct i3c_master_controller *master,
 		return ret;
 
 	/*
-	 * The manufacturer ID can't be 0. If reg[1] == 0 that means we're
-	 * dealing with an I2C device.
+	 * I3C device should have either the manufacturer ID specified or the
+	 * address discovery method specified. Else treat it as an I2C device.
 	 */
-	if (!reg[1])
+	if (!reg[1] && !fwnode_property_present(fwnode, "mipi-i3c-static-method"))
 		ret = i3c_master_add_i2c_boardinfo(master, fwnode, reg);
 	else
 		ret = i3c_master_add_i3c_boardinfo(master, fwnode, reg);
-- 
2.50.1

