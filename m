Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013014.outbound.protection.outlook.com [40.93.201.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337B23C3BF5;
	Thu, 23 Apr 2026 09:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776934912; cv=fail; b=o4KHdh3mAztMljzj17ubvAUdZWxvW9ISyNaJ2a8yzmopKtNo0JgtAm1HZVyMwQ5lEmzev/GKS6gjEiAMyYyzjVpzZ3L9azdNtUhu7JrFThy+rgKC5lRHkdBa32kZxpWJJbt8T1PxeNol4+Vkm6750n0vo1hI0o2GhSfhd2VsCPs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776934912; c=relaxed/simple;
	bh=ouQxf2yeR3GDfQhsBUucR433sYP7U1NHXmQPQJSkKnU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UbpzfXO3+Pc+3+g9927yZCdON2hQUn2qNLtmIhHNiYFnMNiI3du68XIHRZmO7NCQmF4IoVKED25J2hHtVL2JrjcZQut1g41fLcHQ9jOKeq8PWiwnJj0VCfOe24Eq+ZujVZHpAMXmpCZfXocHKPkJK2LiTVEn5vRm7TDfcRlGHqA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Vg/wbKKZ; arc=fail smtp.client-ip=40.93.201.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Vg/wbKKZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HOaD6d3yU9/uzvwB9ChiQ07BRHSobtsCBQEtZKepRsALKwglrR4/yr94awea38EU8vqM4Y9AeWMTQcW23axi3MsxnOUCg5JLrxP5ChVetdS8BpnTJ2Mlm177jOQmtrIUzD2DTlbvgEdKIhFfschHygUeSD/FUG1iUi/9QzWPyo0l+ZL3WTL9fAUOK12GgAc8VkCcb2GK3N8LaVjWk2kDLpaH4iZIZHbTdp+Incy/o9X19503G/Yfkpa2tsIn60w3sWFzvWrSQxLYrjDF9KvqqQ/s54sARrGJYQS6qlqGldUUgKmtxVScypSYkEJQSCuAqk3lSi2YLAUYKN6YiPDzKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p1RYpER9w5vgm1emdd9+8WObQub7TyWTMBKSL6ztCwk=;
 b=SwSt8Ob8sxxmJt7IxpKvd+x4InWrv20vdnkCiE/pmThektn2WoezYkGEDSUlqLTs4DXlD1pjVeNrLyC5P48XJrf7O7kRkCkhT3noPaXLW5NPlcVXTesxpheu+pPuKdzGGHCN7eD11MvkUjVdzmKiLWcxKHO9Uhaw0KJ+sD9hpOKnS5RBurEyTI5HapbELM7fx8DgX6KaXsp58teLLRlxe1e6CETFaXSv01rwqoWzHIH7/rJAF6axTG82uTIzP19sGhwFV628sfNUlfAqLjPRdYE+1IZaHrJcOsX2Hy8hIRbCFTi8nMk8mSL7WXMLD87U22UUAHRT/78Fr1/8dW0ajw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p1RYpER9w5vgm1emdd9+8WObQub7TyWTMBKSL6ztCwk=;
 b=Vg/wbKKZUdrE6wNnI/c6Q135hb8xhSoNUenxKcBosm8ISOfwBz0Q+Utv8KOSTZVI7u2ZEauwc0ccJb53ySt8Wm9MvLTPk9wJYH0QuWxsQNW3x813qRm7zW+cj5AxwuwlC3+T4RviFWmCKhvP6BYK7OV7HSicPJJ8o84Abux00KCzDoCNTTeCYatPvFLSc4pT7fps0bZ4YQWfhySLso+CXzgSgyWlbuumDiPFcGaqy45FlaLrV2P7vxaMCCMbjrTeL16JaBWb/uB6EgxqqSqXViQn7wYLJcVzkwQXEitR4e+DCaWiY/jFagnQ3JYE2/6d1zspGVL7ldr70rtsQWfOug==
Received: from SJ0PR13CA0235.namprd13.prod.outlook.com (2603:10b6:a03:2c1::30)
 by CY1PR12MB9584.namprd12.prod.outlook.com (2603:10b6:930:fe::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Thu, 23 Apr
 2026 08:59:43 +0000
Received: from CO1PEPF000075F1.namprd03.prod.outlook.com
 (2603:10b6:a03:2c1:cafe::8c) by SJ0PR13CA0235.outlook.office365.com
 (2603:10b6:a03:2c1::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.19 via Frontend Transport; Thu,
 23 Apr 2026 08:59:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF000075F1.mail.protection.outlook.com (10.167.249.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Thu, 23 Apr 2026 08:59:41 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 23 Apr
 2026 01:59:20 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 23 Apr
 2026 01:59:19 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 23 Apr 2026 01:59:10 -0700
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
Subject: [PATCH v3 06/13] i3c: master: Add support for devices without PID
Date: Thu, 23 Apr 2026 14:27:05 +0530
Message-ID: <20260423085718.70762-7-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F1:EE_|CY1PR12MB9584:EE_
X-MS-Office365-Filtering-Correlation-Id: b82e10a9-da32-402e-c82c-08dea116a87d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|82310400026|36860700016|376014|1800799024|921020|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	KhA+q0wIsDdZP+EUypkgRANQpS/+ea++Ag8JddW1kKEvudE3wH6WcD7XqzLJLRQf7k4123vTS11J8shDk7tZDsZkkREyHN/sEAZlunn7BMzizjIR5WEyfJ0KO180bp3OBmxpaa0RejkFHk0iAJUk+b5Sa/LV+oaHMnfiLwWRdhA5q4RNjzhWrHf2cYflI/IpoccOq5/NeOzu1/+ZKOxK1QQYOqFRRRonDX1Ad88RjsPkBz4lwGEEMZ5kZ7DS6tzNnL78S9DrrRh/TQFwCIkhb5mtWbtm8o6U+Jf3w48Cg4yk28bxcy86bj7F2CUzwdF2ts3u23UYL9gMDGxMjj9mk4W0o86cH6bJknRCwljIAPjlJDuZ0tbr1oo+ECUr9vzVvNx8X1lhXkCXoaXaYOkt4oU9nWbnZSk1O6U+6lnUm26nUF3UbPgt4k2U/d9ABNK0WOLfAy6CCROo49+7J9TngOQvUXilmQTyj5J9YJRM7cORhU7WtiEWwj8FsgdBpxAFbFOjkazQe2UlOcX5nyDf+M9OSG6yz4uZ6wyFxdkL3yJfs7ta8xH9d/HHrBh8Aq8JiFgfuFfKdE5YuoI4DJybuCXPjklzvSbAzSCeQtkuEwsSHnzn+DNx9FIKXoNJ63Ixn/y25oKGQV+95S8glGGliegU0ZZCG0i+88MQICMTw7ychyC9W9z0wV/CXXKCxs+nc7kFO0t8ALptisLiRBzW9jSMj4NSai/zdDNOdz/C2vNQ+H8O8N2Q6G49b/qM7M0Akt5x+Wr4kAmb0g+CUZKr1YyZqI3Wsu1AbrV7qYtwTX1ISuXSZlqCu2y/8trvA3XR
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(36860700016)(376014)(1800799024)(921020)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	oAZIG16McKJjJkgdbT+HPTwxIsXJWJYtMvkn0wC5bKcebt24kvNaBMvE6QKbVzBvVW/lba8/NPJ0r/0yL6P9f8owgevebztHFVZy7LyquN8jbGPhTg/UuqwdcTOBynVS0uuCnktR39UrbB8t++OhJ4HFKS7hYKpUsIbqnzo2ybu6T3dTf1borvqLEVnaa5QcZ9le3kzSJNrBKzUCbuLZrV7QnWSPT6kznXOcUwx0SmMlrS4seTdkrbZI4TExcHvSyh0zxLlGha19ku3qrZKJ9NKYqcSUl6j3jgJutfIwsJ8ZUCDeE4lU2byQ0Ywm5ITq4aMcpU2l3X7AfRVExohZxFWarsAtGTJGGn8IgXzlPenzIPe9cd6L8nSp6gE817lyJF/Iww/fKiS+jDbxxYTFx5MNCzw3xmU6wDGqsSvMWcf3FVnFkv97YzY1ybmMemfK
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 08:59:41.9964
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b82e10a9-da32-402e-c82c-08dea116a87d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075F1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9584

Devices using SETAASA for address assignment are not required to have
a 48-bit PID according to the I3C specification. Allow such devices to
register and use the static address where PID was required.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/i3c/master.c | 51 ++++++++++++++++++++++++++++++++++----------
 1 file changed, 40 insertions(+), 11 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index de72317c9a5c..fbe8710c4c56 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -1842,8 +1842,17 @@ i3c_master_register_new_i3c_devs(struct i3c_master_controller *master)
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
+			dev_set_name(&desc->dev->dev, "%d-%02x", master->bus.id,
+				     desc->info.static_addr);
 
 		if (desc->boardinfo)
 			device_set_node(&desc->dev->dev, desc->boardinfo->fwnode);
@@ -2288,8 +2297,18 @@ static void i3c_master_attach_boardinfo(struct i3c_dev_desc *i3cdev)
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
@@ -2303,8 +2322,12 @@ i3c_master_search_i3c_dev_duplicate(struct i3c_dev_desc *refdev)
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
 
@@ -2604,9 +2627,15 @@ i3c_master_add_i3c_boardinfo(struct i3c_master_controller *master,
 
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
@@ -2629,10 +2658,10 @@ static int i3c_master_add_of_dev(struct i3c_master_controller *master,
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

