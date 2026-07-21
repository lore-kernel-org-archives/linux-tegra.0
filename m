Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012006.outbound.protection.outlook.com [40.107.200.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7AB37A830;
	Tue, 21 Jul 2026 04:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784606991; cv=fail; b=gD5R9Bhr8YPqpDyxNvPkaYNTPymNqvoDUNggSule4Ggx8pOyDnvJ3amRbMm3SX3ceKZtw2DVI0lrwOLqFL61LPAStskgEA9D23W70Ot0hBCneMGMsQeCWvYaaSXjLvp/CnocM/ImLBQSXLlFwbQtarp4BvIHM3rmvFXc4LZWrzI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784606991; c=relaxed/simple;
	bh=NNEQFtuJEazhQS0xMjvCnBK25S3y13Cp6HMiTnn4Kzg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OvWvDPsgKCYu5ywIG9tVQfjZ/PkiX25dGVj75bsTshwSCpc/gED9Bp75HPvaxyMaXutkqw5cL1YWE9bE82jNjn1QwrAFgqKzxnN6Zda54YEbS75sdqDCGn8iKbViLJtZV8aiqmASiL6SO13qqJxnzW1913wB7BKk9E/jiL1eXJ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ahYxH61d; arc=fail smtp.client-ip=40.107.200.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ahYxH61d"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gMimxcHOMe2vD8rbyS50fPFNExayHHPV9i7vaI1nqRwDEbOFNFekl/1aeInVeVeI7rvgvDaCLZb3pniCGKz67gXIVSJCdP05sY9qvAAuS73Qc0tP1jM5mgvNOuizXm1M4WkgKXJpgsXEV3hC1Om+6e19dwATs4vToLTydpMvFRvIlleHUqdnEiytdBYBSXwzVYjzjdjeupirE3t/v9BsQER6+ahOjdBVHG1A0pEVjvL2ckM008VK14s3RcKhgFtwOL0vL8LZkJgyH5w8g78q8Bcj1cbumqXQxsBF1Q4/yhh6pGTJO5D6VbR9txuCQYx27J/9ZhTLYZvB1zOKnPd3JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RKtedArzqpORfxTFslWjlQOjWlrGCvUH93J1jOEP9pg=;
 b=Svc0m1rdah+H1o9V/C/fvpb8enKVMKt3KMwAm/N4bg8TPA+UPsPfOkFzoTH5CNS52vcpGhI8mhJ8TBqyj2BtR2kv5mg+lhxnXW49jJUwYIEurNYxwOOzwOIOV+ira4bbUcc8/fMowLT7B11OuwBdLcdt5nEGLUmC7JaaPI86V5l6O27FsUTSlF76pnLocgGCRyeNvKVAxJNB/sQ66h+2iccpn/kfCJZpllXlFASLBVqc88sar083QgJ8bx+h/s/zaWXD5NUM0AU7yszOAlsrwyX/hPXwTPJ65Si2KOk5Pb8WnKARjj1zpmH72/6Cd6HyGtHYRChmt3kxtnSUMH70bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RKtedArzqpORfxTFslWjlQOjWlrGCvUH93J1jOEP9pg=;
 b=ahYxH61djrBfh3yQT2zSOko47YO25rdpPJTUR/BSXamGd00j9lzL6urCfCoG2QVHbHJE38Kzr7JVIF4taaj2uTkZAQ9XRaoqWB4VN0dewwEkGXDgMmenb74xtLl7npMiVKTWF8jFiriB6/vSTFVEza1L+hp2lmLFdGMU+BmiVaO+9NtUVUZkRO3RMXcYyQBaxIbjzb8dA0vqubHbnBQlUktKOeR72Nqy5ezYbG6et+PDvlGZzvqqA1mLkzISMePsm7XpJoptyOQLogRouLSMSkWDz7ibNwl03POLl9y6ps18zjfNPKa0uqGSKDgBRPPNsV7bMdiNT95uKFU+BW7y4g==
Received: from BL1PR13CA0085.namprd13.prod.outlook.com (2603:10b6:208:2b8::30)
 by PH8PR12MB7373.namprd12.prod.outlook.com (2603:10b6:510:217::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 04:09:38 +0000
Received: from BL02EPF0001A104.namprd05.prod.outlook.com
 (2603:10b6:208:2b8:cafe::1d) by BL1PR13CA0085.outlook.office365.com
 (2603:10b6:208:2b8::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Tue,
 21 Jul 2026 04:09:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL02EPF0001A104.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Tue, 21 Jul 2026 04:09:37 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 20 Jul
 2026 21:09:20 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 20 Jul
 2026 21:09:20 -0700
Received: from build-akhilrajeev-noble-20260602.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.6) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Mon, 20 Jul 2026 21:09:15 -0700
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
Subject: [PATCH v6 04/12] i3c: master: Add support for devices using SETAASA
Date: Tue, 21 Jul 2026 04:07:52 +0000
Message-ID: <20260721040805.1696503-5-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A104:EE_|PH8PR12MB7373:EE_
X-MS-Office365-Filtering-Correlation-Id: ded1cf30-a0de-4e9b-e724-08dee6dde140
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|7416014|376014|1800799024|3023799007|6133799003|10067099003|5023799004|56012099006|11063799006|13003099007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	vsLBgjAeZI/tfWsAWOvvvz65e0U4SqCwvVOxzLjRhbbc3P8BCswh+1vdinQxj6F/KRIXJKUkQ/XhuHCXySKW27PXeL1Xf8qbajVGnVCdeCMhdkXhI4rfVIzxN/oL3TDnyv2GaHfFr1hsmuDQgSBWba8tlh+vfJDbz+t2ZM0is70RsPZDAGuwoT6t+GZASEd4Gb6dP7HxiwnTMwI0pzb7wqXX2ULL5XlLDeCP5p2BseJUU8S+oIO/FmcE0amB8KWjqeVo8p3JtIQs33v27TrKqhUsrplzuYWrvJP+CrSGiMKMSBOhgNQTw59Q4LSLHtw9nPpnEbKXyYKb4fTnSC167XoClVv30ggvqZ/lZMBKxTE/qxNtyzHarNecKWK3lw/uH/hD75aUhDo45YslEiUHtYtzH+4GgoREsDLLqX3U4QV3xbr06/ZrU/3c2f/OwE0NWWyYlGNrASKt/tfGpIl6mGR8Ys1+apoTUDERbY8bmEkhR8I4YnGmU+tqGRt9qBCxdIDHvpHb3zVowwLnP3sGykjO3zle31KUXwQlJhckrdvluPic4OhwiEftzH43ZARFBm/r8D3PmP5q8y98Sk8uwHkUjYObxkaGC0rpd2VhhhlQMqaBGfmZeYRoeXWh24uJi/vXfKlX6l0XNbgqkEjGvB0ceLC0zaThDgjPbXtiqSVCb0a528s6CDFJq1S8qMgxzwNgiwRFV9NBH9dLisq39A==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(7416014)(376014)(1800799024)(3023799007)(6133799003)(10067099003)(5023799004)(56012099006)(11063799006)(13003099007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	XyDB2NYmyDIsBfw/7vsRQn/gXOFGXwzi1r7QkwPYW3+kIank9GwWgUci6rUlYWcTuI+P/Zh0xQc7fbXtCWHuS50ZQgQesAh7S9tYKYxQxwootNvF802sS7gdUzvF5fkla069e+6BlCI3+RdGBagfX+lO5gQTKexd1SbHGH7rqnkxlKL8ZWXOMTvetgbACwjr2O4o/tGfwYKR9L8JzV3AGzjODQnG1HlfH8vRJJGyBrtURb1iGGqOdoSuyMU5vcauW3+BhwAQDeEMP0LYwYxzjWdzRYXaIH6uMHi2VthbwTxNVErU+d/9bT+mwr7umNGMF2/3x90ng+2e8x3MJF2PMUe6m1jMaBVtS0Pf85lLeUq5eeYn87Y+T2abNzPpfc1NQCzU9CffMAqZn/Fs4bp8ZNcRN3QuyMCQ7moVLPWP2Kgtp+2G5P8oPHd8GuOHC3vY
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 04:09:37.2563
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ded1cf30-a0de-4e9b-e724-08dee6dde140
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A104.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7373

Add support for devices using SETAASA, such as SPD5118 and SPD5108
attached to DDR5 memory modules that do not support ENTDAA. Follow the
guidelines proposed by the MIPI Discovery and Configuration
Specification [1] for discovering such devices.

SETAASA (Set All Addresses to Static Address) differs from standard I3C
address assignment that uses ENTDAA or SETDASA to assign dynamic
addresses. Devices using SETAASA assign their pre-defined static addresses
as their dynamic addresses during DAA, and it is not mandatory for these
devices to implement standard CCC commands like GETPID, GETDCR, or GETBCR.
For such devices, it is generally recommended to issue SETHID (specified
by JEDEC JESD300) as a prerequisite for SETAASA to stop HID bit flipping.

[1] https://www.mipi.org/mipi-disco-for-i3c-download

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/i3c/master.c       | 98 +++++++++++++++++++++++++++++++++++++-
 include/linux/i3c/ccc.h    |  1 +
 include/linux/i3c/master.h | 15 ++++++
 3 files changed, 113 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 623c6b2247d9..b18dda89c473 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -5,6 +5,7 @@
  * Author: Boris Brezillon <boris.brezillon@bootlin.com>
  */
 
+#include <dt-bindings/i3c/i3c.h>
 #include <linux/acpi.h>
 #include <linux/atomic.h>
 #include <linux/bitmap.h>
@@ -1102,6 +1103,51 @@ static int i3c_master_rstdaa_locked(struct i3c_master_controller *master,
 	return ret;
 }
 
+/**
+ * i3c_master_setaasa_locked() - start a SETAASA procedure (Set All Addresses to Static Address)
+ * @master: I3C master object
+ *
+ * Send a SETAASA CCC command to set all attached I3C devices' dynamic addresses to
+ * their static address.
+ *
+ * This function must be called with the bus lock held in write mode.
+ *
+ * First, the SETHID CCC command is sent, followed by the SETAASA CCC.
+ *
+ * Return: 0 in case of success, a positive I3C error code if the error is
+ * one of the official Mx error codes, and a negative error code otherwise.
+ */
+static int i3c_master_setaasa_locked(struct i3c_master_controller *master)
+{
+	struct i3c_ccc_cmd_dest dest;
+	struct i3c_ccc_cmd cmd;
+	int ret;
+
+	/*
+	 * Send SETHID CCC command. Though it is a standard CCC command specified
+	 * in JESD300-5, we are not defining a separate macro to be explicit that
+	 * the value falls under the vendor specific range.
+	 */
+	i3c_ccc_cmd_dest_init(&dest, I3C_BROADCAST_ADDR, 0);
+	i3c_ccc_cmd_init(&cmd, false, I3C_CCC_VENDOR(0, true), &dest, 1);
+	ret = i3c_master_send_ccc_cmd_locked(master, &cmd);
+	i3c_ccc_cmd_dest_cleanup(&dest);
+	if (ret && cmd.err == I3C_ERROR_M2)
+		ret = 0;
+	if (ret)
+		return ret;
+
+	/* Send SETAASA CCC command */
+	i3c_ccc_cmd_dest_init(&dest, I3C_BROADCAST_ADDR, 0);
+	i3c_ccc_cmd_init(&cmd, false, I3C_CCC_SETAASA, &dest, 1);
+	ret = i3c_master_send_ccc_cmd_locked(master, &cmd);
+	i3c_ccc_cmd_dest_cleanup(&dest);
+	if (ret && cmd.err == I3C_ERROR_M2)
+		ret = 0;
+
+	return ret;
+}
+
 /**
  * i3c_master_entdaa_locked() - start a DAA (Dynamic Address Assignment)
  *				procedure
@@ -1878,6 +1924,22 @@ static int i3c_master_early_i3c_dev_add(struct i3c_master_controller *master,
 	if (ret)
 		goto err_free_dev;
 
+	/*
+	 * For devices using SETAASA instead of ENTDAA, the address is statically
+	 * assigned. Update the dynamic address to the provided static address.
+	 * Reattach the I3C device after updating the dynamic address with the same
+	 * static address. It is not mandatory for such devices to implement CCC
+	 * commands like GETPID, GETDCR etc. Hence, we can return after reattaching.
+	 */
+	if (i3cdev->boardinfo->static_addr_method & I3C_ADDR_METHOD_SETAASA) {
+		i3cdev->info.dyn_addr = i3cdev->boardinfo->static_addr;
+		ret = i3c_master_reattach_i3c_dev_locked(i3cdev, 0);
+		if (ret)
+			goto err_rstdaa;
+
+		return 0;
+	}
+
 	ret = i3c_master_setdasa_locked(master, i3cdev->info.static_addr,
 					i3cdev->boardinfo->init_dyn_addr);
 	if (ret)
@@ -2272,6 +2334,19 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
 			i3c_master_early_i3c_dev_add(master, i3cboardinfo);
 	}
 
+	/*
+	 * SETAASA is a broadcast CCC. Issue it after SETDASA so that devices
+	 * configured for SETDASA (or supporting both methods) are assigned
+	 * first, matching MIPI DISCO guidance to prefer SETDASA when both are
+	 * available. Targets that already have a dynamic address ignore the
+	 * later SETAASA broadcast.
+	 */
+	if (master->addr_method & I3C_ADDR_METHOD_SETAASA) {
+		ret = i3c_master_setaasa_locked(master);
+		if (ret)
+			goto err_rstdaa;
+	}
+
 	ret = i3c_master_do_daa(master);
 	if (ret)
 		goto err_rstdaa;
@@ -2723,7 +2798,7 @@ i3c_master_add_i3c_boardinfo(struct i3c_master_controller *master,
 	struct i3c_dev_boardinfo *boardinfo;
 	struct device *dev = &master->dev;
 	enum i3c_addr_slot_status addrstatus;
-	u32 init_dyn_addr = 0;
+	u32 init_dyn_addr = 0, static_addr_method = 0;
 
 	boardinfo = devm_kzalloc(dev, sizeof(*boardinfo), GFP_KERNEL);
 	if (!boardinfo)
@@ -2741,7 +2816,19 @@ i3c_master_add_i3c_boardinfo(struct i3c_master_controller *master,
 
 	boardinfo->static_addr = reg[0];
 
+	if (!fwnode_property_read_u32(fwnode, "mipi-i3c-static-method", &static_addr_method))
+		boardinfo->static_addr_method = static_addr_method &
+					(I3C_ADDR_METHOD_SETDASA | I3C_ADDR_METHOD_SETAASA);
+
 	if (!fwnode_property_read_u32(fwnode, "assigned-address", &init_dyn_addr)) {
+		/*
+		 * When a device advertises both SETDASA and SETAASA, an explicit
+		 * dynamic address selects SETDASA (MIPI DISCO prefers it); drop
+		 * SETAASA so it is not used for this device.
+		 */
+		if (boardinfo->static_addr_method & I3C_ADDR_METHOD_SETDASA)
+			boardinfo->static_addr_method &= ~I3C_ADDR_METHOD_SETAASA;
+
 		if (init_dyn_addr > I3C_MAX_ADDR)
 			return -EINVAL;
 
@@ -2751,6 +2838,14 @@ i3c_master_add_i3c_boardinfo(struct i3c_master_controller *master,
 			return -EINVAL;
 	}
 
+	if (boardinfo->static_addr_method & I3C_ADDR_METHOD_SETAASA) {
+		/* For SETAASA, static address is taken as the dynamic address. */
+		init_dyn_addr = boardinfo->static_addr;
+	}
+
+	/* Update the address methods required for device discovery */
+	master->addr_method |= boardinfo->static_addr_method;
+
 	boardinfo->pid = ((u64)reg[1] << 32) | reg[2];
 
 	if ((boardinfo->pid & GENMASK_ULL(63, 48)) ||
@@ -3385,6 +3480,7 @@ int i3c_master_register(struct i3c_master_controller *master,
 	master->dev.release = i3c_masterdev_release;
 	master->ops = ops;
 	master->secondary = secondary;
+	master->addr_method = I3C_ADDR_METHOD_SETDASA;
 	INIT_LIST_HEAD(&master->boardinfo.i2c);
 	INIT_LIST_HEAD(&master->boardinfo.i3c);
 
diff --git a/include/linux/i3c/ccc.h b/include/linux/i3c/ccc.h
index ad59a4ae60d1..a145d766ab6f 100644
--- a/include/linux/i3c/ccc.h
+++ b/include/linux/i3c/ccc.h
@@ -32,6 +32,7 @@
 #define I3C_CCC_DEFSLVS			I3C_CCC_ID(0x8, true)
 #define I3C_CCC_ENTTM			I3C_CCC_ID(0xb, true)
 #define I3C_CCC_ENTHDR(x)		I3C_CCC_ID(0x20 + (x), true)
+#define I3C_CCC_SETAASA			I3C_CCC_ID(0x29, true)
 
 /* Unicast-only commands */
 #define I3C_CCC_SETDASA			I3C_CCC_ID(0x7, false)
diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index a16deb04b2e1..2dc139a217bf 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -174,6 +174,14 @@ struct i3c_device_ibi_info {
  *		 assigned a dynamic address by the master. Will be used during
  *		 bus initialization to assign it a specific dynamic address
  *		 before starting DAA (Dynamic Address Assignment)
+ * @static_addr_method: Bitmap describing which methods of Dynamic Address
+ *		 Assignment from a Static Address are supported by this I3C Target.
+ *		 A value of 1 in a bit position indicates that the I3C target
+ *		 supports that method, and a value of 0 indicates that the I3C
+ *		 target does not support that method.
+ *		 Bit 0: SETDASA
+ *		 Bit 1: SETAASA
+ *		 All other bits are reserved.
  * @pid: I3C Provisioned ID exposed by the device. This is a unique identifier
  *	 that may be used to attach boardinfo to i3c_dev_desc when the device
  *	 does not have a static address
@@ -189,6 +197,7 @@ struct i3c_dev_boardinfo {
 	struct list_head node;
 	u8 init_dyn_addr;
 	u8 static_addr;
+	u8 static_addr_method;
 	u64 pid;
 	struct fwnode_handle *fwnode;
 };
@@ -517,6 +526,11 @@ struct i3c_master_controller_ops {
  * @boardinfo.i2c: list of I2C boardinfo objects
  * @boardinfo: board-level information attached to devices connected on the bus
  * @bus: I3C bus exposed by this master
+ * @addr_method: Bitmap describing which methods of Address Assignment required
+ *		 to be run for discovering all the devices on the bus.
+ *		 Bit 0: SETDASA
+ *		 Bit 1: SETAASA
+ *		 All other bits are reserved.
  * @wq: freezable workqueue which can be used by master
  *	drivers if they need to postpone operations that need to take place
  *	in a thread context. Typical examples are Hot Join processing which
@@ -552,6 +566,7 @@ struct i3c_master_controller {
 		struct list_head i2c;
 	} boardinfo;
 	struct i3c_bus bus;
+	u8 addr_method;
 	struct workqueue_struct *wq;
 	struct work_struct hj_work;
 	struct work_struct reg_work;
-- 
2.43.0

