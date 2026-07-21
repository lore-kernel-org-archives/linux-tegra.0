Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011041.outbound.protection.outlook.com [40.107.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54AB73815D5;
	Tue, 21 Jul 2026 04:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784606998; cv=fail; b=meKlkRHAns1Ftt8r3uaidZroYGrdZzwijmlc95j8xC9KSlPFVjnpacyL6ZZaFv+x0jMQy93X7Ru2lP6Xp1BPckVBH6CYUpJLoLrq2Dje8F9DgHX7Cp3FGXLBcLMV2cnXHbb4u7EUQZMZEN8TKlXtE8bDW3aEBjsZm+xtD4Cq6JA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784606998; c=relaxed/simple;
	bh=8vwx60oPtu54qGE2WiOjCk9EDV3oLvXNz+QUZxdrnk4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D3MfqrX5GlEmXbO1xu6FvZ6lkXM8OkR9K/fRUoRBjR/KxWv1Oiyf+BX/Y2BTJHT9opxZl7ecFXhUsWrp+7JsnT7Ls/vSXCdj7gmSXgqJBlwelh2zfZZeRExO9M6eWpw23jvsXyQ2VD3Q6PyJFsA96OXwIzfiNwUMRW3XUKxgz0w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=op4goMzx; arc=fail smtp.client-ip=40.107.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="op4goMzx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jmi4WNmd7S4bvsaiyrOImiM39bL9D6dbLNDPaQPwq6gFTEzvNNZ6S2oM+PdE2dPc24orGcZnGXKuaDj+rt4JYf6N666xQbjHpn5SdQqWxMkoUNTJQ3wRk0n3P83lht9xRKaYHQU8JWq5g6xVcSj/+3pC4UmTJ8ilsx8ufVS2ll5HjH8BtheHGsuexWLyh7d52miJE6EkMgSSIFAlJT+LD1rlscH7TLecWtUH46kjzs6svZKb0B2BJ7vtRXc8d2tpmrS6jnXbT5Bq9Um0anQVV2K1HfuAsc7AQQHjZH4vNoV0UnJdpfTBeri2jShwLji6AwX/obCDQcnBgrJvV77cEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d0KvMEGdivcyfi4VJcwy8JfhNT/9IT9/puyMMiZKxYg=;
 b=iAjNV1/aBmS38iQC57dpkcht94HFm/tDr6DHd9xBbHhxo7gieJVWDUdJRa0NY5Rdwyext/rQp+xsL2QvLCQhIl6nGUYPZDhpDbKLeo766LLlhBXuqsGgSsejara3PjVJLWBzWj4G2Z1e35Il5D+bL3bsMTdq6pFcs+WTBHzaanFm6CzVNZbkCH8sc+4a0jlJl8QpMNrYkMt1hvdGDMkZn2zZCr8GCYpQ02hHhUp52yZAHX5WfUuXSHneHLiEsdd3L7rmB8wp2dg3JhPsw1xGE1beTruOPV6clt2VpTMmqWLQqYRO1JzHMIvIBP4F0HZv0Strd/W51x5KO6ACnc5vDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d0KvMEGdivcyfi4VJcwy8JfhNT/9IT9/puyMMiZKxYg=;
 b=op4goMzx7A9NaICn8wGBPrxA4LUEbYwl0k8HVQlL0dxDHfDm/DM01VaAAD0ACp+fjypIf2Qb15wAWJ48JYC56dwtF64pKRt2KkdJhuTi41OZq9CFwR5Z0AXWyAEh83oQtq29s+5arkZ/m+RhXZivszObqg9nnMGuut9b2XXRpYU7f/bF0/vgtqdJKrWtFgtwtNpXXam2xXeShMabF1YoGl2WQzabWGm89iqYpFfItjjGHgHpFBkLCntGOtKbJMMlqWHOA02frfk0hq35I9f7kD3Bc0joT8R0iVggeOzWFSfx1/9owdqY3mst4AdqDgCjQftovsaxf2DcCVbhiumMRQ==
Received: from IA4P220CA0001.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:558::14)
 by SA3PR12MB9091.namprd12.prod.outlook.com (2603:10b6:806:395::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 04:09:49 +0000
Received: from BL02EPF0001A103.namprd05.prod.outlook.com
 (2603:10b6:208:558:cafe::7) by IA4P220CA0001.outlook.office365.com
 (2603:10b6:208:558::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Tue,
 21 Jul 2026 04:09:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL02EPF0001A103.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Tue, 21 Jul 2026 04:09:47 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 20 Jul
 2026 21:09:31 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 20 Jul
 2026 21:09:29 -0700
Received: from build-akhilrajeev-noble-20260602.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.6) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Mon, 20 Jul 2026 21:09:24 -0700
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
Subject: [PATCH v6 05/12] i3c: master: Add support for devices without PID
Date: Tue, 21 Jul 2026 04:07:53 +0000
Message-ID: <20260721040805.1696503-6-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A103:EE_|SA3PR12MB9091:EE_
X-MS-Office365-Filtering-Correlation-Id: 87b6c412-75f7-4948-f300-08dee6dde79f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|7416014|376014|82310400026|1800799024|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	kN3xtrWy8QAiJPPjNN8HBCAxenyj4OWZzZjEpUiRRZaIXSbv6b47ROXgY/eJC6+rVN68JysWENos5h8WH+cO4VVYkc2a6SmpnJexN7zPERf6Fd0rJ8cOgXzFzvKq15tedjzfcUWf9FjcoRA1u1Xn5MeWe3lXk8YkbPZAE856WGkEXZxTlAaDh+Ftcfcv93+sGmYF9oygVqA5iBD2IipLvLvxzmq121LsFQbsZ1UPhefjM+U/Eu6eTZQ7+nvSyoLflZBz61JvM4fcjjI0IPiElCD0JHmWZrSdO0spv5Pb/HEfNCc0ugu1zuVDk49iSexrg9gIXYzxTPsbqejbPRVLxvblDAnWoq8aGGiuK92O6iLJO1XTnlZ270ZS8rrp8+sp6OGli1RYmRhRqB9wC9AargCx+KJ+pfryWq2PBRhtcKYB8jZlMAIKxfWAzo8M75Hxy8eB7ZL6O+WxWvmp5RpDX80RD2JDz87006ETcgqvQvIlbjIpIhF1s69XL5wfiFTmTF4j2v97jFSTWVbVWpEFWs198EV8Iy+sMvwDYhs0GKYW0qDASwt6cl7wUNf96bTozriYCUtRk1nqE4S44BqZTfP/1yaJ0xCWkWXHzWE97EFCfk/GXMdaoITbYwm49kV5m6U1SFjVlYZOcXLQh5usPAG0Mn0gQtHVJzkwmvcYKX8IcNpRM3AYhxJhjuZjgSIkcq7krtT4Wj7J0UaFtiGiRA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(7416014)(376014)(82310400026)(1800799024)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xqjZcEpOhZ9dZpnx2IwMzKyb/t/pbWC4Mv4+zx7hOcupweHQbw0Cc/7FLFwueHk8SK3poYNZuXo7HEvYp2/0ObqLxcUjY6e5pCCIf+ct0UBuT80xU5uWOC6rYlFagTIDsbbh2feIwjfae/tnfzs5HK+BXb0GL+jEU1ionHNXHvcabo7FZV3z0WuszCHRGUowB3+DdQmWdegZ/J4RSFO4Uod2eQtsE51w1Lu73xaGV2fXj8GA+FaQc0t2b9zmBsu94nveYCb0ervc7j3LOTnTKlcAN5uKOb7DgecN6iEJUa/lV2cxcGPlqpCYgHtkXIaERo00CDXEI01kw3PwjWi1aHYkHcfYN/hSiJzLWFJNPfYwW8JrPcEVzo2f19VtEYywaYE1bqV5k3PZP8RLJ5flwY1nFaewmN+bx/sDP6XPHZtzhqZ8S5U3DKMmZKYhN8hQ
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 04:09:47.9586
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 87b6c412-75f7-4948-f300-08dee6dde79f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A103.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9091

Devices using SETAASA for address assignment are not required to have
a 48-bit PID according to the I3C specification. Allow such devices to
register and use the static address where PID was required.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/i3c/master.c | 52 ++++++++++++++++++++++++++++++++++----------
 1 file changed, 41 insertions(+), 11 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index b18dda89c473..7b2f819bf443 100644
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
 			device_set_node(&desc->dev->dev, desc->boardinfo->fwnode);
@@ -2389,8 +2398,18 @@ static void i3c_master_attach_boardinfo(struct i3c_dev_desc *i3cdev)
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
@@ -2404,8 +2423,12 @@ i3c_master_search_i3c_dev_duplicate(struct i3c_dev_desc *refdev)
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
 
@@ -2848,9 +2871,16 @@ i3c_master_add_i3c_boardinfo(struct i3c_master_controller *master,
 
 	boardinfo->pid = ((u64)reg[1] << 32) | reg[2];
 
-	if ((boardinfo->pid & GENMASK_ULL(63, 48)) ||
-	    I3C_PID_RND_LOWER_32BITS(boardinfo->pid))
-		return -EINVAL;
+	/* For SETAASA devices, validate the static address instead of PID */
+	if (boardinfo->static_addr_method & I3C_ADDR_METHOD_SETAASA) {
+		if (!boardinfo->static_addr)
+			return -EINVAL;
+	} else {
+		if (!boardinfo->pid ||
+		    (boardinfo->pid & GENMASK_ULL(63, 48)) ||
+		    I3C_PID_RND_LOWER_32BITS(boardinfo->pid))
+			return -EINVAL;
+	}
 
 	boardinfo->init_dyn_addr = init_dyn_addr;
 	boardinfo->fwnode = fwnode_handle_get(fwnode);
@@ -2873,10 +2903,10 @@ static int i3c_master_add_of_dev(struct i3c_master_controller *master,
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

