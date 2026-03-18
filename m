Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013004.outbound.protection.outlook.com [40.93.201.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F6F30F533;
	Wed, 18 Mar 2026 17:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773855014; cv=fail; b=YdtJW3aDCxBwCkFLN2JuBDTdmVqhkBKmpSFSo8PGvT1XPHs/CdUCoN3YpfM/ZBfQuxXioFcjboLg57rYFykrKCwdQQd+OTV18L4iNQl6/L+tkzGhOrGuXRhPz+G51LMjVfBbTDeVNf3ii/d49w9WzFVTPfozWWi2nkvIJalGRc4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773855014; c=relaxed/simple;
	bh=vmM1GG8zfsxbiJaGhtcWjitHNpRNyQrkJ5cvLzjd2Ec=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NJbdiRAd4v6ZJLYl8vHPO/ex85aoZtu3l3YssOuxX4h1r2Spqvib31VpNZlFIF+uHlWaHFdT1S8rA0Z1dFruxIQCR3TuqGCOWGaaDgxK4GFLGHH7Ww7tVwlcD63Q9WMQCzBOmIZ5wzsFCwghlGUd540l2Hd5wNNmQuff2a3hlpg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=VsuzNuuS; arc=fail smtp.client-ip=40.93.201.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="VsuzNuuS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vB9G/rubwt25lfvO+J6iHtsitu2jAjaxGnI37Whx2l1hiWeVNU8zF9iYbhp/y53u5vEUyfCra8Lh4hEE6rajBwGcHTgrmvIwDCefEfh0XBIDX1GqedTaWKZ3x74mbaufzBWSLWqENRZx3m1HLLha1gaBr/UG6VSXIOGH73RH/9HNMUKSDqrQt7pPJi33FvwV0BZoauMTXG3g3SspQI3BpVNLgt6c1BAngDXmFGCU0pVayY9/eNrew6XOVcQ3hlc/ICoHE08Gn2gBOUQZrZ9ahsWVkfSN3veFPo3PD48b0VhEheY3Nq8xs7UiGKFguTbCprjnDqsvAqaw4LDc8NJeTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gEaMwqum8cD78+g1icCLUIaHUuDIWmjUneWq6btrkkA=;
 b=j6I1cECkJgAU2dpkQV0utEdyLtP15p/2Aw4pLTygAdP1ojxK6sbGdribeHXKXO/NU8ipV4Wz1Bp2cv4HjFaLLN///vRV9SqTaGPPGJzlpFJcJFB9sYMb7bZeUspp1xQzDCPegbvWa/dH1NVBpg5DeDmCFmO92Kssar+fJe+qQJiwWjlqjBX3mXbYwdi+dcYZK3Cv+C0R9/kg5ud0Y/B6MDYLo8/hNRqZ7YfPHFxOG596eqz7RUyUNmjcINYJXE49qXvD2hable1tPOZTkDsNEctTVk8lzA5sQ3oFRFKQg4ZiS1yf9Js7xxTC96kOqz0sa3apqv/L/BOr51efiYyaag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gEaMwqum8cD78+g1icCLUIaHUuDIWmjUneWq6btrkkA=;
 b=VsuzNuuS/mBMgHgrsbj5anjYIgTP+g8frzuzIhRtLKUT8yVTt6/9RvurO3mE+tGm0RYxN4iclLUCOkJ8m3PuOmLFYhtIganoAQVQwqci4olSMj+7StbHsUNqo3k8xWBpzJWOEjAJ4/R27hStpNZoxE63tLadOWf/GD0f+PivYqJntquMIcxkv9sqwHegjO4Z0rzKZerGcfZknFYTrmzvP/mW947rZ6/iZ4G/5Sz3+pSsD436iMneqPKn11mPTNW40eKz+stBQhW73iWtY1ZXG2rBoZBBJWYajuJv8DCdJBCZX+yUjg/qggbeE/3giCP3KxS/0azqrHGnZg2NMZKJag==
Received: from CH0PR04CA0088.namprd04.prod.outlook.com (2603:10b6:610:74::33)
 by IA0PR12MB8086.namprd12.prod.outlook.com (2603:10b6:208:403::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Wed, 18 Mar
 2026 17:30:02 +0000
Received: from DM2PEPF00003FC3.namprd04.prod.outlook.com
 (2603:10b6:610:74:cafe::fe) by CH0PR04CA0088.outlook.office365.com
 (2603:10b6:610:74::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Wed,
 18 Mar 2026 17:29:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DM2PEPF00003FC3.mail.protection.outlook.com (10.167.23.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Wed, 18 Mar 2026 17:30:01 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Mar
 2026 10:29:39 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Mar
 2026 10:29:39 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 18 Mar 2026 10:29:33 -0700
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
Subject: [PATCH 05/12] i3c: master: Add support for devices using SETAASA
Date: Wed, 18 Mar 2026 22:57:18 +0530
Message-ID: <20260318172820.13771-6-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC3:EE_|IA0PR12MB8086:EE_
X-MS-Office365-Filtering-Correlation-Id: 9652bde6-58cb-40a4-e205-08de8513fc18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|7416014|376014|921020|13003099007|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Zn6iWMtD7P4lKpo95NKyVP7e/7UMQKWmHP3bPPli2LO/qPbhM0LbqV4yRGGA71IWPHq8CojAef1xXHp0IZN5iItJmw7FUwqw8+TcDIrpw4cjol16e8LqaP2DYZZIL97JTzELovLy+rtuO/IKERxGEr4q+Rgo3LpKtUMkHCs8I6qGyUoMCSQm+Y6ITt4RCRJC0p2hYRkYYk3SXcN2YjpPRW9U2XZz000dsvPldOsNKrDI5udpFj2WWQ3RkBgV9DSZHittu0d3TrDdcKzclWj3nyAly8k43MN9lK3k22aE/isk/2ovUiOvjrv4PHarDBVj0auZqhIcA/C4SDBdzG72lcvlf0s11mHyNdByoc2izLNkZTQgcCg6X0pQjVcsbvQ+NBEbr8+rKZ2o4wAuXBHakozNbhqtm2IVurqQ5LbMeKZex2MSt6aBS6zLRiTDhS0t7zcGnqZTMImnwaGrfQ10Bdwfgcw7EQmsBaSNEVCPqCyXwP83KADimzAXapkaEX9nSbGdg1CnUsgDP//LUmKDRc49UHQT9/+aBg7L3cErg11WLn+xngIi+YAG6v3hF6h0OE3WYojMH9pLChe1PLIZtSCljtH7sbNuwFmoUewYtVsBKDLS/uiBi5trIbgvGDJIY0BFLlxmhsyKBS1YWhhWVFMiIFDl8OW9dMkjeuIfdv7nuuWR/PYz5A0YYbY3I2Myq/s7xtcz56N4ssbCPvMRB/hEUNcp//Ry3l2Nlhs9jhTlFY/CSzdWLDrrXZsmW4tzJa384zN/9RrR666UULAtwECPpaLy2Qo4UM9/KddVCtXGU+W2djIDFX2JxEjFWrIN
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(7416014)(376014)(921020)(13003099007)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	bdk4iuB5jDZPx1AmXLwU/PrzTMgLsdAbtYLpg/hsMOiUTAxNCYXo97UhZK2L1T2ZnIvF3yQasGA6sc+/1Bfa6qwDG1rwmDEVIiWr1kNkgsASjZ6Fif2KdtfDSTqCYQIIdTxdNaFVuVM3GXxE5rAFo2sLnP+rZk/LmkF/47uUoei3oEj/AITVq9U92aPHpYTklr23CwTVzvvspB20rc/QJv/vrM8xVMrOMx1rTcTF0t6RCDlzIl1332QxLtmusR1hErz5UwUvXM1nR3uCAnZCUEDGtxwD8xHy9GwQl+7G1VhSYtTKp62vN6tprcx9rlMb7CpOtzxvoyh4HCrpfZE3NPBWrE/3Ynrs6mjR9xjtVvJHq6IZW/+vE2LcUzRohHPRaqcr+TwHhO+lUOIhPGoBINfZv+ZIZubyk9gVVQVpwRicm0aakjCuP2p0Pjubib8o
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 17:30:01.2228
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9652bde6-58cb-40a4-e205-08de8513fc18
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM2PEPF00003FC3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8086

Add support for devices using SETAASA, such as SPD5118 and SPD5108
attached to DDR5 memory modules that do not support ENTDAA. Follow the
guidelines proposed by the MIPI Discovery and Configuration
Specification[1] for discovering such devices.

SETAASA (Set All Addresses to Static Address) differs from standard I3C
address assignment that uses ENTDAA or SETDASA to assign dynamic
addresses. Devices using SETAASA assign their pre-defined static
addresses as their dynamic addresses during DAA, and it is not mandatory
for these devices to implement standard CCC commands like GETPID, GETDCR,
or GETBCR. For such devices, it is generally recommended to issue SETHID
(specified by JEDEC JESD300) as a prerequisite for SETAASA to stop HID
bit flipping.

[1] https://www.mipi.org/specifications/disco

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/i3c/master.c       | 72 +++++++++++++++++++++++++++++++++++++-
 include/linux/i3c/ccc.h    |  1 +
 include/linux/i3c/master.h | 17 +++++++++
 3 files changed, 89 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 15a356a2b3c8..40a3bb734234 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -1049,6 +1049,47 @@ static int i3c_master_rstdaa_locked(struct i3c_master_controller *master,
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
@@ -1733,6 +1774,18 @@ static int i3c_master_early_i3c_dev_add(struct i3c_master_controller *master,
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
@@ -2132,6 +2185,12 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
 			goto err_bus_cleanup;
 	}
 
+	if (master->addr_method & I3C_ADDR_METHOD_SETAASA) {
+		ret = i3c_master_setaasa_locked(master);
+		if (ret)
+			goto err_bus_cleanup;
+	}
+
 	/* Disable all slave events before starting DAA. */
 	ret = i3c_master_disec_locked(master, I3C_BROADCAST_ADDR,
 				      I3C_CCC_EVENT_SIR | I3C_CCC_EVENT_MR |
@@ -2483,7 +2542,7 @@ i3c_master_add_i3c_boardinfo(struct i3c_master_controller *master,
 	struct i3c_dev_boardinfo *boardinfo;
 	struct device *dev = &master->dev;
 	enum i3c_addr_slot_status addrstatus;
-	u32 init_dyn_addr = 0;
+	u32 init_dyn_addr = 0, static_addr_method = 0;
 
 	boardinfo = devm_kzalloc(dev, sizeof(*boardinfo), GFP_KERNEL);
 	if (!boardinfo)
@@ -2511,6 +2570,16 @@ i3c_master_add_i3c_boardinfo(struct i3c_master_controller *master,
 			return -EINVAL;
 	}
 
+	if (!fwnode_property_read_u32(fwnode, "mipi-i3c-static-method", &static_addr_method)) {
+		if (static_addr_method & ~(I3C_ADDR_METHOD_SETDASA | I3C_ADDR_METHOD_SETAASA))
+			dev_warn(dev, "Invalid bits set in mipi-i3c-static-method, ignoring.\n");
+		else
+			boardinfo->static_addr_method = static_addr_method;
+	}
+
+	/* Update the address methods required for device discovery */
+	master->addr_method |= boardinfo->static_addr_method;
+
 	boardinfo->pid = ((u64)reg[1] << 32) | reg[2];
 
 	if ((boardinfo->pid & GENMASK_ULL(63, 48)) ||
@@ -3118,6 +3187,7 @@ int i3c_master_register(struct i3c_master_controller *master,
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
index 6b03a3ce574c..71802d9b5943 100644
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
@@ -498,6 +507,8 @@ struct i3c_master_controller_ops {
 				  unsigned long dev_nack_retry_cnt);
 };
 
+#define I3C_ADDR_METHOD_SETDASA BIT(0)
+#define I3C_ADDR_METHOD_SETAASA BIT(1)
 /**
  * struct i3c_master_controller - I3C master controller object
  * @dev: device to be registered to the device-model
@@ -516,6 +527,11 @@ struct i3c_master_controller_ops {
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
@@ -543,6 +559,7 @@ struct i3c_master_controller {
 		struct list_head i2c;
 	} boardinfo;
 	struct i3c_bus bus;
+	u8 addr_method;
 	struct workqueue_struct *wq;
 	unsigned int dev_nack_retry_count;
 };
-- 
2.50.1

