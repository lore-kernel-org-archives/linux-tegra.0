Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012021.outbound.protection.outlook.com [52.101.48.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5142BE051;
	Thu, 23 Apr 2026 08:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776934779; cv=fail; b=BlrokGGlviDRNgNGObNbnZKb3KahTHUE/FhpXBTAQ1Bky/nQU4eHwsKALqBkmyYl9MufUyZEbqnpejsgV0DZb7WV2b4isbXCP9AdjUa7wrZp9Kl1KGSrEaBkhzTlCCDGDVGETd2GPudEZkyG/0IJimuKs2rDj5TnNvo8BcaeOi8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776934779; c=relaxed/simple;
	bh=fZ5XWuogKDmJ1lTD8A/rKfEtaUwiizHOaldw6wDOYMA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T7U3SGJMjAUT28B44X5wqEfsfBBOVp9vq0xrcpRf9wvwBOSz+xYnZv5o1ZQ/9oj/Q4ux+0cBOQdPCPjOTdRTmCIL0Kl2zPaz8EGBK3CnQYeRGtA+Szm7CwfioHqFyJSo4NhGXQIAuK504rtNjjdnO+kokaJ8rRWns/NkPS3VOU0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=l2KrNN1Z; arc=fail smtp.client-ip=52.101.48.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="l2KrNN1Z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DHQUwGQzvKDidNWFiyBgICveKIHb6G58Mo5KzghSwHdC1vksgchFaTZjeqKmfo5CS1IfbfcsTvUJfpfi7Ik6bDwYxrlrW6JnyuWHpP2a12voz7aBIdd1FyXXLxL3IlXMmUXonRnPKOpA57os2T1UWDw3tWeCkXmH2bF0f00Vtxf+Hl72U4IU7I7rB/UA7qX9paK+BRyPi18l5ki9F3egJycRIl8AiwlNnsmJ/rTZd9lnpFA4c6OHf/feJq9uTMjScHtCe90T1a0LRT4lQgFGt1yrIre41G2ELkAsHcHB7L+liHOgJNbnpnu0Z8uqsQXMopChUrKY01h9wAIbb8l76g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ooaVzdn3sSlCMJLzWatycfbdzAExOJc0Dox7UopvLhw=;
 b=jAgRy3WBlVHR3vnbzrf9jphCmdAA99Xsje+QF3apVzDScmg4Sc6ZPRLjE9zC3bhzFM+i5gFHkpl1p+pBXOz/Bo+ygj4Dg1ry16WP6B8ioXIZG3qpm29j5mgOmKtEzGqWpMhhdIdTHVSW0l0TjKuE2pg5rFW3C+GyId34gM8Exk+yd2MVdhRg9Utx47+2n6YMKWVghM1WxX4mqt+/0UUqN9QhMkhwzUNkzQThUv2enrugfvLyPKZNHRuUin6GZLpZC97t2q1lAhb+RedTnh1b0Zvo+ktwT8Wf8kxee2FpGV33nLN9oWkX1n9EjE/xg5id6BIK9Q27qA3udeqp9h0klQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ooaVzdn3sSlCMJLzWatycfbdzAExOJc0Dox7UopvLhw=;
 b=l2KrNN1ZC9XBFDEsLVpEYsL6wY92znaXcubMDM29ABT4O15WeXMD16/6+RO5XkceSCe3yelXTc78kLh9QFDrrhMwdM2eey1nqGyc9zqUUMh8N3fMCGmjdlUYEw5ryfdTz20NamqegsuQQQZ3Myt5ifLKjNQ2Rcfyi37XwQMH5pyUfmp1vaCHOTR34oPJSWuXdSBRQiZismZoC3OHLVLZoZf60LKoLpBfy4hufPVl1XT2neqBYhmbntGX8fcY8jYCgB0jYSwh5CaZVMmzItAEZUL6VuCOBNYD5arnuLbGw8lddst62UezWnyoj43/b9NH1vLCntlt6iCttOeUL0gRUg==
Received: from BYAPR05CA0069.namprd05.prod.outlook.com (2603:10b6:a03:74::46)
 by BL3PR12MB6379.namprd12.prod.outlook.com (2603:10b6:208:3b2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Thu, 23 Apr
 2026 08:59:31 +0000
Received: from CO1PEPF000075ED.namprd03.prod.outlook.com
 (2603:10b6:a03:74:cafe::3f) by BYAPR05CA0069.outlook.office365.com
 (2603:10b6:a03:74::46) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.20 via Frontend Transport; Thu,
 23 Apr 2026 08:59:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF000075ED.mail.protection.outlook.com (10.167.249.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Thu, 23 Apr 2026 08:59:29 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 23 Apr
 2026 01:59:07 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 23 Apr
 2026 01:59:06 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 23 Apr 2026 01:58:58 -0700
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
Subject: [PATCH v3 05/13] i3c: master: Add support for devices using SETAASA
Date: Thu, 23 Apr 2026 14:27:04 +0530
Message-ID: <20260423085718.70762-6-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000075ED:EE_|BL3PR12MB6379:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a5f75fb-972d-4f76-789c-08dea116a150
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700016|82310400026|1800799024|22082099003|56012099003|18002099003|921020|13003099007;
X-Microsoft-Antispam-Message-Info:
	E/z/eK1dtHKPjU5QxDGe1nEYau1o6lhP3Ge3OvYF1hadK4rP9DJnUMMqz3dvxNifZXlVXHVA/jhFm+iOS9vOjeVtJB3r08HX/+psb/W1yXpvBPzZpMx99TY2VRXWgfbJ1vBUfGiKhrkOCzumIihjXeIlPZWNMfd3yOau2v5zWCjTZsoXCP8BX3DKCvLpBxzEiOUEXARupUfVO1g35bsFCZdNMvXLgK/Nv2YkCCFutVWfvYdWY0KBkoabEaSHR0LpDnRd0ncck4c0vbxLrsfs/qks1L9iWTQM9YkN47GdB6yEyjJceFSSGwNX0oj3cA4IiExE1AfHRBtsJYsfy33pgtHbPqZDick4+W4cu5gimbdq7jWMcWJl00I+KP/SgwxOBju4Waz91bJoFnwniIgj07WBOX0YfzKb9a67YDn2BXpAhjVtTIwEQkawhuxP5AIFY3lZF2qm3+/PQ0BfzV7Wf3PEP+yOtHv1hxX9vFR0cDQtsVl0yJbFOFVAwy+a+L/9M5rXSwyFzbkBNXMThcMpvefkeUKVW1xMhwTNZzvEKO88aYybv9xJuZoWMdTra2QIS8OT1B2ZBfSxSom4bjfXxY2PKU+lHA8QjU1cbKIJkNediI3uwnpZeOulCHNIom0tYJPAbodppiDsdgZdbCRUAreAZzDxt2grCTgwfWFoOsRx+y2e55IkdQhsOVLlQkTRkUHRapWQk+4fOaursIb6G3P21lE+7eCYSBEt3Zj7OtQ1hvK+V1i5aMiUoBYUHQG1X4cVGDmmKTayo6DbWfKSLHUqqQYjx5WS2eD/WzkT9I6wskc8mWtLuEOGamJMEbuUHd1izkGA/R2p5DrFoM5soA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700016)(82310400026)(1800799024)(22082099003)(56012099003)(18002099003)(921020)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	V9S2VzXdAxs41heCM9h8nusJuPCIw0v1N9bLGQHffcFnO60OmIl4zLykktzwEdqaTCDi1761oj4m4DCJ8FNwBppl0xX92KFKQ1MBIKzSGT30i2t2acqHEDB3upu/cz1DEMV014Vg9xHBNWGD9JLlA79vWPPWQeAOl118AlhtBa692HwTYQmQNBm8rJzcamBv8WnCxwwl4mN1Kmjy0i2CZe/2qP+Ye9fu4AU8qfCMXfBNt7UQQMS2qJiS8efxEbIgoLK8mnidzGCx2I1qpd212BsW6mhIArB43seoIUEkjAFSj6+xCfQZjoMj+Yt48p+U2xrPS85Vuz9XY8f4monqxyKusYdNVO2LCH2O/Kg3NxzdDdRyXQQqWKEWtQZ/DALmLtAdFDhnkQx14qzuIRQC8MypyuuaWiuSMuoFZRJQ+i1/wupBptxbnKNi2oWEM0Pw
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 08:59:29.9545
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a5f75fb-972d-4f76-789c-08dea116a150
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075ED.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6379

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
 drivers/i3c/master.c       | 70 +++++++++++++++++++++++++++++++++++++-
 include/linux/i3c/ccc.h    |  1 +
 include/linux/i3c/master.h | 15 ++++++++
 3 files changed, 85 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index ffec97157d48..de72317c9a5c 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -5,6 +5,7 @@
  * Author: Boris Brezillon <boris.brezillon@bootlin.com>
  */
 
+#include <dt-bindings/i3c/i3c.h>
 #include <linux/acpi.h>
 #include <linux/atomic.h>
 #include <linux/bug.h>
@@ -1051,6 +1052,47 @@ static int i3c_master_rstdaa_locked(struct i3c_master_controller *master,
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
+	if (ret)
+		return ret;
+
+	/* Send SETAASA CCC command */
+	i3c_ccc_cmd_dest_init(&dest, I3C_BROADCAST_ADDR, 0);
+	i3c_ccc_cmd_init(&cmd, false, I3C_CCC_SETAASA, &dest, 1);
+	ret = i3c_master_send_ccc_cmd_locked(master, &cmd);
+	i3c_ccc_cmd_dest_cleanup(&dest);
+
+	return ret;
+}
+
 /**
  * i3c_master_entdaa_locked() - start a DAA (Dynamic Address Assignment)
  *				procedure
@@ -1739,6 +1781,18 @@ static int i3c_master_early_i3c_dev_add(struct i3c_master_controller *master,
 	if (ret)
 		goto err_free_dev;
 
+	/*
+	 * For devices using SETAASA instead of ENTDAA, the address is statically
+	 * assigned. Update the dynamic address to the provided static address.
+	 * Reattaching the I3C device is not useful. It is also not mandatory
+	 * for such devices to implement CCC commands like GETPID, GETDCR etc.
+	 * Hence, we can return here.
+	 */
+	if (i3cdev->boardinfo->static_addr_method & I3C_ADDR_METHOD_SETAASA) {
+		i3cdev->info.dyn_addr = i3cdev->boardinfo->static_addr;
+		return 0;
+	}
+
 	ret = i3c_master_setdasa_locked(master, i3cdev->info.static_addr,
 					i3cdev->boardinfo->init_dyn_addr);
 	if (ret)
@@ -2145,6 +2199,12 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
 	if (ret)
 		goto err_bus_cleanup;
 
+	if (master->addr_method & I3C_ADDR_METHOD_SETAASA) {
+		ret = i3c_master_setaasa_locked(master);
+		if (ret)
+			goto err_bus_cleanup;
+	}
+
 	/*
 	 * Reserve init_dyn_addr first, and then try to pre-assign dynamic
 	 * address and retrieve device information if needed.
@@ -2507,7 +2567,7 @@ i3c_master_add_i3c_boardinfo(struct i3c_master_controller *master,
 	struct i3c_dev_boardinfo *boardinfo;
 	struct device *dev = &master->dev;
 	enum i3c_addr_slot_status addrstatus;
-	u32 init_dyn_addr = 0;
+	u32 init_dyn_addr = 0, static_addr_method = 0;
 
 	boardinfo = devm_kzalloc(dev, sizeof(*boardinfo), GFP_KERNEL);
 	if (!boardinfo)
@@ -2535,6 +2595,13 @@ i3c_master_add_i3c_boardinfo(struct i3c_master_controller *master,
 			return -EINVAL;
 	}
 
+	if (!fwnode_property_read_u32(fwnode, "mipi-i3c-static-method", &static_addr_method))
+		boardinfo->static_addr_method = static_addr_method &
+					(I3C_ADDR_METHOD_SETDASA | I3C_ADDR_METHOD_SETAASA);
+
+	/* Update the address methods required for device discovery */
+	master->addr_method |= boardinfo->static_addr_method;
+
 	boardinfo->pid = ((u64)reg[1] << 32) | reg[2];
 
 	if ((boardinfo->pid & GENMASK_ULL(63, 48)) ||
@@ -3162,6 +3229,7 @@ int i3c_master_register(struct i3c_master_controller *master,
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
index 6b03a3ce574c..5a6d217fa5eb 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -174,6 +174,14 @@ struct i3c_device_ibi_info {
  *		 assigned a dynamic address by the master. Will be used during
  *		 bus initialization to assign it a specific dynamic address
  *		 before starting DAA (Dynamic Address Assignment)
+ * @static_addr_method: Bitmap describing which methods of Dynamic Address
+ *		 Assignment from a Static Address are supported by this I3C Target.
+ *		 A value of 1 in a bit position indicates that the Bus Controller
+ *		 supports that method, and a value of 0 indicates that the Bus
+ *		 Controller does not support that method.
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
@@ -516,6 +525,11 @@ struct i3c_master_controller_ops {
  * @boardinfo.i2c: list of I2C boardinfo objects
  * @boardinfo: board-level information attached to devices connected on the bus
  * @bus: I3C bus exposed by this master
+ * @addr_method: Bitmap describing which methods of Address Assignment required
+ *		 to be run for discovering all the devices on the bus.
+ *		 Bit 0: SETDASA
+ *		 Bit 1: SETAASA
+ *		 All other bits are reserved.
  * @wq: workqueue which can be used by master
  *	drivers if they need to postpone operations that need to take place
  *	in a thread context. Typical examples are Hot Join processing which
@@ -543,6 +557,7 @@ struct i3c_master_controller {
 		struct list_head i2c;
 	} boardinfo;
 	struct i3c_bus bus;
+	u8 addr_method;
 	struct workqueue_struct *wq;
 	unsigned int dev_nack_retry_count;
 };
-- 
2.50.1

