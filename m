Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010060.outbound.protection.outlook.com [52.101.193.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2061A381EB5;
	Tue, 28 Jul 2026 07:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785222117; cv=fail; b=fYV4uUzVFlVB5f5fLwVk3JmYBwLk85jx1bEzGmXJv7FvsS9Coyr1Zu1RIK962BAe02zbrNCAK8SkAhQsf0VTjKvc+od+5aF+OaGShlaOdS6YJxnHqqpsjMQMvHe15OWwwxbRACW0kOw/wWYrjA4vbHRUNLsZi1gR4lCvbC0LBgY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785222117; c=relaxed/simple;
	bh=fACVjkqbn9Vfsz92emILiPtPbdZ9uniCodt5OhEtNBQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AgSeHRy/qZ7Qt4fyumImfPDjPe7d9jyC0WCiVnarRP/WQ0ImUf4ah43wTpCbDSlOlurdecApkRI96NKG2I3mvbs/I8cm6WYdoqGeEokaitCiSjKJkhfyRPf7mAOse/hWZSQ+yKgIsZN3hGQLOhnMOPUX+CZHYfwzmgoKdza1gsg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rrn57Jgn; arc=fail smtp.client-ip=52.101.193.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rrn57Jgn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ioea7fVdxNVj3PwwANRTqYb5of9NIvA9TBQtqmQWP2jyqwKiXnrY4k5m2CkiDzOE0QwhmjnksndAeNR7KSWSRuvy8QEbDJ2vGaJUJUtp94ukNhTkIVXC4EhBUzurxaVKzwPXmWFgD8jEthyjmf9TtmbnyWZhcoSW1RgNu9/tefM89QfHHeWcjhVFuUOahi7Q02Y/Gs6lo7NoJOe9wp5upiOTLpsU3XLtzDxm6D1JeGKaOR6Ck3Htd7n3oJHy/qgTQ0PkWX5P5i/eppKTx1uQk6YViqsMkYAcbPGCzQ71pDb+PEIWUTMlG8alycRhbMn9cgvNuTI4loXIf/OZP3a4mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GnVeYdW/tNjwMbANmrPKKQUW2fE1qDKny0FujRxhKqc=;
 b=Gzs8mZQ0kUWU1tp+QJlX+1YnlTo0+T4kuLfxul3PsNlP855wK5hRLV1Wq3QOBeUBWzAaf1FTAb/onQobKUX0bCkvUG8j5amxbYjKAYYJuFdRT9FF+3KHlLtyri8F0BrL4UZ0yNw+ojHuOYEt70RpVaFBMrArnjKi4w7Ga5/zj+sOQ1aXPwxX6mXyqMWhnQO7BTLoQY5DuQ8gvV+6EU/u+Fd//qbINgpGrMhXx0ZlEE/olE7lw6T7WiwJ5oTtAMFkMWcos1soXaLHzv5DKbOTiy8Jq9vXqRhQiU9eayIQ9N0ZxW7+fxgrLeF5K5VGeqySdfNFcrin0ISKImlFhnd0/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GnVeYdW/tNjwMbANmrPKKQUW2fE1qDKny0FujRxhKqc=;
 b=rrn57JgnvlwhLLyJrs2cTnOEQWYssR/qiVVbXh//eH/2CIOyv4xxkYKRnCrt9yDWQ5pLMsjSmKipmO6MP/KQi5y5Qz5OJmMimGTd7ItrNckimFKMvtqmNykQbuYAyubgC8byHNF9sR3JWuUtNJ3TMxdW/azXDPypagU9b1QKUvDwDJzzRBlI/DkNb/gqN2sXDHlqxpsyUSYhpRnjNsunNXZh1YFh+TDBl9nQBB5u9VuXUNeV/rYKDo+g+tqmTXtLVoxK7qP2n299rPJsvOu+QjznfCE3C78gmd8Y2oLOF+nBwVyk9NR5gLxAQtSQ6Mvkj8DTIMh770CmdHd+X1gO9w==
Received: from MN2PR06CA0004.namprd06.prod.outlook.com (2603:10b6:208:23d::9)
 by BN7PPF62A0C9A68.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6d2) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 07:01:50 +0000
Received: from BL6PEPF0001AB78.namprd02.prod.outlook.com
 (2603:10b6:208:23d:cafe::86) by MN2PR06CA0004.outlook.office365.com
 (2603:10b6:208:23d::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.13 via Frontend Transport; Tue,
 28 Jul 2026 07:01:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL6PEPF0001AB78.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Tue, 28 Jul 2026 07:01:49 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Jul
 2026 00:01:34 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Jul
 2026 00:01:34 -0700
Received: from build-akhilrajeev-noble-20260602.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Tue, 28 Jul 2026 00:01:28 -0700
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
Subject: [PATCH v7 04/12] i3c: master: Add support for devices using SETAASA
Date: Tue, 28 Jul 2026 06:59:46 +0000
Message-ID: <20260728065955.809445-5-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB78:EE_|BN7PPF62A0C9A68:EE_
X-MS-Office365-Filtering-Correlation-Id: 9026055f-ba22-45a0-3b4a-08deec761875
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|82310400026|7416014|36860700016|13003099007|6133799003|11063799006|5023799004|56012099006|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	mpCq9m2ucdPoVEv+nRf8cahGokb61DIF4EV9TLhYVd9qlpRWl1zLLvPnI0ACFrmKdepgEnlIHcQPdCfrCjiTh9DpbQd/aVWplj7SVET26gBpltTR8AXmTZK0iOQnAZnOEcLgUeC9tDcGd2MfhYJWv2gNQGKDI57UdZjFdMmATkcNhn3klSa8zE50UW6R7wlHQ9o41iP+Np34YOlKdUMJvfgs+gRXKfjm/wkZ1owEazpjbS3RM590Rh2+sig/emSI7wwYA+Pznp9wGfHvMxwtGA8cU8iwiajr7i/TZqbVZl/LnEUiGjqNZlTrS5tGGad6YHrdOOkEzIQRPaYVXYJsFDVsxkQHjaV2tk59JkKHXJWgZcZqNAYqi+9Y6SguQGQy0C+UnESJGgj+1OMtkBqhPqC65I4yp4OJ18aF6LiYQ+Ef7Ipr8pvC5sR/VyTbFFrxJnWpNxFw26+7hFhxSHlUP9Z+H3j3Payt4uUNFHT+i1RhPWCEIJvSo5Dp4Jne9+y+4d3UQPS4a5wvREX4LNkrqVmHfXK9M1/I7dQcrVnZF69EWXnmR1zSjObiYPCr5nG4SJGG0N0X9hxWVZ9JclR7zoW/izlb6FggNcSxHy3lYAJmRg8QMBqgfveVOBmDnjhZjy6CLtDTBVCQk/UGmKznHTUW2Pua0ULmEywSd7vvC2Sr5WQPjOTe34gHSKOe2Q4CREfdXdwXhcgXQniRIvibnw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(82310400026)(7416014)(36860700016)(13003099007)(6133799003)(11063799006)(5023799004)(56012099006)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	c3XsxiYW0/eYEEPQzfjw++EQtLRhuVAIZ5eqlFOqaohk9EvK7jMFWBfF83Ly9uud7S/1McGnuKKFVZCHscp/ZqO9B5OHg2h/2aDfmozC1Hh3oa/OZ25NkpeSB/NoaLH5M4Rwfl4WYppliapnvRNmaxqZ3oasj+EY/HAGQNfjDqEJMoil8mrK1WAlYiXd43ECqGUeDmCathd4lLpRvRy7nG6SJUn/IiRbmghG4pg4uyZix92iGf/DEy+2cubuZN6Cv5xTVAjX6RDFC1dDfqUOb1sabEqLpyhcsqxMBSGeYTCceTBlZ+Rydq1gbkSPzgW64SS+JdhL0gE3NnoRnpLjeBkJRZ9k4RQ1BZ9lZ7vOSWdK3IOHAcrv9q1hd2ttzUjmgaxESY0DxSyepAis0jr3QiD2zyM3uDZcuajS2WM0Y34JWwCNvC/31tIHhR8aTRxj
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 07:01:49.2037
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9026055f-ba22-45a0-3b4a-08deec761875
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB78.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF62A0C9A68

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
 drivers/i3c/master.c       | 114 ++++++++++++++++++++++++++++++++++++-
 include/linux/i3c/ccc.h    |   1 +
 include/linux/i3c/master.h |  15 +++++
 3 files changed, 127 insertions(+), 3 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 623c6b2247d9..87749a739e62 100644
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
@@ -1869,8 +1915,10 @@ static int i3c_master_early_i3c_dev_add(struct i3c_master_controller *master,
 	int ret;
 
 	i3cdev = i3c_master_alloc_i3c_dev(master, &info);
-	if (IS_ERR(i3cdev))
-		return -ENOMEM;
+	if (IS_ERR(i3cdev)) {
+		ret = -ENOMEM;
+		goto err_reserve_addr;
+	}
 
 	i3cdev->boardinfo = boardinfo;
 
@@ -1878,6 +1926,22 @@ static int i3c_master_early_i3c_dev_add(struct i3c_master_controller *master,
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
+			goto err_detach_dev;
+
+		return 0;
+	}
+
 	ret = i3c_master_setdasa_locked(master, i3cdev->info.static_addr,
 					i3cdev->boardinfo->init_dyn_addr);
 	if (ret)
@@ -1900,6 +1964,16 @@ static int i3c_master_early_i3c_dev_add(struct i3c_master_controller *master,
 	i3c_master_detach_i3c_dev(i3cdev);
 err_free_dev:
 	i3c_master_free_i3c_dev(i3cdev);
+err_reserve_addr:
+	/*
+	 * A target using SETAASA may still get the static address on the
+	 * SETAASA broadcast even if attach fails here. Keep the address
+	 * reserved so that it is not assigned to another device during DAA.
+	 */
+	if (boardinfo->static_addr_method & I3C_ADDR_METHOD_SETAASA)
+		i3c_bus_set_addr_slot_status(&master->bus,
+					     boardinfo->static_addr,
+					     I3C_ADDR_SLOT_RSVD);
 
 	return ret;
 }
@@ -2272,6 +2346,19 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
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
@@ -2723,7 +2810,7 @@ i3c_master_add_i3c_boardinfo(struct i3c_master_controller *master,
 	struct i3c_dev_boardinfo *boardinfo;
 	struct device *dev = &master->dev;
 	enum i3c_addr_slot_status addrstatus;
-	u32 init_dyn_addr = 0;
+	u32 init_dyn_addr = 0, static_addr_method = 0;
 
 	boardinfo = devm_kzalloc(dev, sizeof(*boardinfo), GFP_KERNEL);
 	if (!boardinfo)
@@ -2741,7 +2828,19 @@ i3c_master_add_i3c_boardinfo(struct i3c_master_controller *master,
 
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
 
@@ -2751,6 +2850,14 @@ i3c_master_add_i3c_boardinfo(struct i3c_master_controller *master,
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
@@ -3385,6 +3492,7 @@ int i3c_master_register(struct i3c_master_controller *master,
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

