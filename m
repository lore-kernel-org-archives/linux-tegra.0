Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012044.outbound.protection.outlook.com [40.107.200.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC522224B1E;
	Wed, 24 Jun 2026 10:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782296634; cv=fail; b=UxypG6M4HodXKUh/1AMRPg4FLG6jOE2j3MvQVTwuNr0gZOwOH7xWKyMuiHFZ0YLLoNi5b7b5HWAnaLq3efM8TBBrypuI8BMyICFN53PEWTF/eF8Iu88OyK5Q+AXfTkKEGEwm54QGh2TTWO0aBtUubPYq7b0bWcR6TRBA/5Lu6XM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782296634; c=relaxed/simple;
	bh=QZoXaDKB4rDmCbZH/uY6i9Eas0ECxTqQQe1IukmnWaQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L7dBLZYF6v+H+nJy9sdgDUapHsjKz36GteOmGHr31B/Xxm0eJ1VQdhUEMOYG5+qCroQAyt1h3EJglzzS5bys28yR+oLA+l9tWUnJfNXrewp3WWQvVHN0J5g+wKXPsfpeTdnzpKfMkMTrKUoqz7jNV6VdCTDYWJlWRROdyW/dPt8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=UbvzQz2i; arc=fail smtp.client-ip=40.107.200.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="UbvzQz2i"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qKF0jdbpDIFihiE8A8TGellTPR/zO4RL2mZhtoFoQrZoqE0Y4ziQmwATWnbk33ZSI+tvQAO+laumik7GZoJR0Ig05YzPmpzSgr5Dp4HnO+L3rtO6H92M+Oyme+CsP2NQXcqsjFTHumUCxF/k63qxw24QtLZi85ycsjcgppU7TVm9tfeOeaU+Mjbwh+n+IqAa/Ppg7t2Wnb/9l+ExSebSj/03X/g96HM/j247/wnZM70k0C+gE5yU5ZwDKQk0X9mCi52MJKoiC4S6wBjsbyLbwWaEdAC7W+Wb4+/d+IuiWSgkkjL5sPziv+VO4+N2hvP+3pOwXc4fQW2VvtJqDn2MbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6EgNXZYILcLZQuGrFfmkWNEyoa7q8D6P+r6MwaIBchM=;
 b=QcfOjUBs2WrF7ihXIrMNZJ6gPxEoCmWo8rcDbWIoXPJeJZB00WNtrxqDC8+MNYc2HEcK9EkkllaLgXwpMq9nD6ytjt8/gKhFMNS+uIct1x90GDyMeDQ1yzwq2Eo49HaN67mxzdGHCECRECk3MzzjCM0Khpah3VE2q0cpd3lr/2IfZJiokUAgnjl9jRI3oFVuN8GpTK3FHnepiUj2IMHTa679xKnFl6C2pAlUKbbtdE9LisMBA9pWzad7Ls9MOBKslQZnOO8sthWmnlzIREq8Bbz5QdQWQuLC0hxzdphDOaEDieDFTFX/nkENMIwDwszARueIXC0buclOnVuVrZCQ4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6EgNXZYILcLZQuGrFfmkWNEyoa7q8D6P+r6MwaIBchM=;
 b=UbvzQz2itGOPuB/btCbEALfVK9bxvN51+18/bb9qvVAj5t0SNkEsUNZSrHapjZ28dMS6MdI3ddzdeLKxHbHqePIYlYeqLQA5PYvHMPEOVni6BdO/TByIyMMGVXThOJj4966bDwxCX0PgCPDvqjRtm2Jql4HQhL2gqTc7v5N1ooTKt3caEj1pXDwmJSeFFURpIH5C2Tx5sZTIOK+wmtqP3OtN70nCcqUWPbvE225sz1wZPlGSpfgmyna5bHSF4wNPQ+q7wFSH0cfxpUrpHOpV+Fgls8MN34wCrBnZZXAR5qLLQTmXOUcqo/p/ypZQoVhnA79zFBQ+1Jb/mNTcMlY9lg==
Received: from SA9PR13CA0166.namprd13.prod.outlook.com (2603:10b6:806:28::21)
 by PH7PR12MB8426.namprd12.prod.outlook.com (2603:10b6:510:241::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.12; Wed, 24 Jun
 2026 10:23:45 +0000
Received: from SN1PEPF000397B4.namprd05.prod.outlook.com (2603:10b6:806:28::4)
 by SA9PR13CA0166.outlook.office365.com (2603:10b6:806:28::21) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.5
 via Frontend Transport; Wed, 24 Jun 2026 10:23:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SN1PEPF000397B4.mail.protection.outlook.com (10.167.248.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Wed, 24 Jun 2026 10:23:44 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 24 Jun
 2026 03:23:24 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 24 Jun
 2026 03:23:22 -0700
Received: from build-akhilrajeev-noble-20260602.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Wed, 24 Jun 2026 03:23:17 -0700
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
Subject: [PATCH v5 05/12] i3c: master: Add support for devices without PID
Date: Wed, 24 Jun 2026 10:20:59 +0000
Message-ID: <20260624102153.1770072-6-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B4:EE_|PH7PR12MB8426:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ae01555-b346-494a-745a-08ded1daaba3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|36860700016|376014|7416014|82310400026|56012099006|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	TBedJEGro/Dv+Pm7/YylHERb9wOIPr7ws5pUYNTNliYr8edR8+HD0KYouE+haEaqwfQI+gsnhcv3NE8WdvUEHHb+Bwx+m6E1Zpa3nuyMCSAm20z8QqotS5kK2pW7w3qNJ3m1Q39wLySFOBkP6UUXatg/P9inQnPbY1kSo3ISMLIHecq8bgBpqk3bMgGeSTrRAIFvGKnxJKhH6FKjyzs2cBUcG/04ZGpnrxGePrsb+64fQc+SNhmje77NemwmP2f5NgwW5wMorZwFHLR9rPKenAubkLYk4sW5BBxl/h7mjAQOaEUkS7E8jZU0tpXedMYIEE6DqOZhVZwzNloTbog/2zW0aDWdaAS2pzEFPuMd5CyiM9lYv0ptOFnQH1y9A/Ze9/et1jgZfNoEuz+v7pHRhPlBOu3wDvUfujPdMHHUT2JcWCCS0KE3vuZOBBhnY576Q2o3gjSJY7tfryDeUbWIRPlUC7iiFdIUhq+XO971T0qtAMx0TOGQCIivFQabpdtQYOlkSv9Bb1qAWV+ybqwGTZ7LQRvCgNawjHYK+9yyBc/epkt6xtlwkL0jje9hPvXWk4IP86iOJ7kX8m6sYCdIISxCVeswS/gcChAFM7ngOpvXLpJXxnzPdFd9AgJCgcxIwlIe9uF/waXMCafJfwCM/yytf2RlLR9j3gHyvE7SpKfpW4xNPxWwnYZYcZGQUT2I/NNQVtuJhV/eHKLwVlBagg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(36860700016)(376014)(7416014)(82310400026)(56012099006)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	H8H585L9vBEHP2IsjsIcZNxZMZqmpSKlLLSfHmN03ryb/INGI0baKsRAcYqR8AKeE1k0v3EnsEY542N34Lfqp0y5ekzNCuy+VrMAQi8aY2MrxfFy2X74/TjEU3tfhTwpTO5zd2gdmYy5z3nWKs7Z/rD0di19WwPv1XY4+KtBhGiWAdqB600taITz4K0kzHRmzXw2EiF76pDQ5FwjULRwN5Py7U76ARDiBrd4L2aSiVYaS8xJVA2O9URpRBOAuBAuli5gKtr+z/kDiDuMGrge4Z4K2ydfBSmPr3whbJOxuLRerYT1lx4FRnHzYmCXRn4aJuWzTS05wMkoCwKvFzUcPx5dov9FhdNYKHtnk1FsZUUsbgoZ08fSBWwlV5F5Ze0sDBbM+3jlFtCzofCXjE5swBPaOwCo3ABN5//52N/Jjv6nKY08ySWH9ml1Dg2SBK9B
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 10:23:44.4032
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ae01555-b346-494a-745a-08ded1daaba3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8426

Devices using SETAASA for address assignment are not required to have
a 48-bit PID according to the I3C specification. Allow such devices to
register and use the static address where PID was required.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/i3c/master.c | 51 ++++++++++++++++++++++++++++++++++----------
 1 file changed, 40 insertions(+), 11 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 3deae8cdae52..bd0dc76c7ba1 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -1989,8 +1989,17 @@ i3c_master_register_new_i3c_devs(struct i3c_master_controller *master)
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
 			device_set_node(&desc->dev->dev,
@@ -2383,8 +2392,18 @@ static void i3c_master_attach_boardinfo(struct i3c_dev_desc *i3cdev)
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
@@ -2398,8 +2417,12 @@ i3c_master_search_i3c_dev_duplicate(struct i3c_dev_desc *refdev)
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
 
@@ -2832,9 +2855,15 @@ i3c_master_add_i3c_boardinfo(struct i3c_master_controller *master,
 
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
@@ -2857,10 +2886,10 @@ static int i3c_master_add_of_dev(struct i3c_master_controller *master,
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
2.43.0

