Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010067.outbound.protection.outlook.com [40.93.198.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D893038239C;
	Tue, 21 Jul 2026 04:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784607010; cv=fail; b=g5Chn66nDT81VTcf/ulw3UQLC8buHqlXhzsi/Al8dxdmshVqDOLzq9oVF0wuUYfV5fu63sln4DXsTwme2oW4qhxLVQmx/sAdBXs8Gptt+hemP72GOdQHbz+YH6LOLdTC+OGGCZfSUhr4iinOK1ZaNVfosAUUphdPFm9czJ+1Qng=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784607010; c=relaxed/simple;
	bh=rZ+qdnjj/8lNOG7tPLQ2HW9zyhHyFHyl+//wFSSGE/Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nw7UVJbdn9csBHwVG4c3L7sGW4iRKJmW4WTa4I3cdjvySj6XS0bP4DXIvCaFM2SwStwGf+5A2P5sDO+xzptZqfp3J8mc95/xdnaro5uj40uhqbuK29Bq344Kn2aOVnIdUpVivWmtqD+QXle60e6U+ibtoUODMZT+DyEtbwe2c70=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=DX0XYqBx; arc=fail smtp.client-ip=40.93.198.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="DX0XYqBx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NcFar59jo+9AZZ8esbVEhbP+xxiuO502bzl3xZiOaCml9VZuUJggiak6vvwEOMGoFvX5+56OOlKQhIRxig4IwVBjF8ozj+t8O/IcDsT51dbWsbX1LUU0I3FE/8N+q/J7IF0Z8etTutdnh+XcjsV4hgeINzWmk55rJJ0E9O2eOoaMi66wi50sd1PpV0tQh1Aq5Gmu0JJXNvBh4Sr7DrCL81j/EZczHE0942Ke9JUJRZhnMFfjsROx4AcF3vYCSpp6a/FKncdqZEhw5mXiHuKSRU4Tw0yX5z9KsTMGRWhmI2qwSwxuL2V/K54tsi9/5g8WgK/Ot7/RfNlSkWe1Nz/LlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RzU4edY5L5tlUhQvonXWMX8fnWw95mmqaeYsObMnS10=;
 b=TMI9Tbq+nsreUw94XVgiVJuTJqj8+fMka8Q75DU8h9XN7ciJ/JYSBtEfMvSUS/Vt82nYDPs3EGEcv0wk6plp138NtYy1zjrSMXltc4gvfTIdguHdS4ixNHs3PfcUCdux+fDWjZP5n4jKxC3OtIVZKuHYGekKPLoFsWk8xdBddEPeNOOEH91NVCvO/fSFYX86OKGH8Ex02h9zEm6aNO0T2Ne7ayfR/VcvHJx/dTsgnoVpZxu+aze7dhrQuOSVmHqyYbJlZvKyQzo+N1tWCyvcdGHB5oSwXyzjhSBtgB961UeFOBQH77gUJ1A8kHQoCfVDEmXsqAv2oln/F9RorRLLrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RzU4edY5L5tlUhQvonXWMX8fnWw95mmqaeYsObMnS10=;
 b=DX0XYqBxoWDsREBIMm03X+PWfYFNVoUmmzBnWKs7CrTcRIC2a/kT4jSO8yFmK42podbyQEz24WVPrf9eEbhesOxzQJ1bTj5NEyy0q3c9SOV0idgUmvY3KC08x4rMkUT6OxIbrpt98kEEMdHuRJOiZmsKUoTxqoBFbS6UUQuFjxQh3HcWgsbX6vENepz4niP66d/2T6F4r8qQgWpebYVNEc63rEZii1r03EK16LiPJyZp/6AT2dKzbhnS5J/kANbs+Kv7M7GEKKV7qbYbOyDzgk1CojPN7OM2ankpDGDoU7PPSQMyBx20jzX3uQMkcBhIbgDr3R06FPBnWNwNNhsxCg==
Received: from CH0PR03CA0104.namprd03.prod.outlook.com (2603:10b6:610:cd::19)
 by DS2PR12MB9797.namprd12.prod.outlook.com (2603:10b6:8:2ba::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 04:10:00 +0000
Received: from CH3PEPF0000000A.namprd04.prod.outlook.com
 (2603:10b6:610:cd:cafe::ad) by CH0PR03CA0104.outlook.office365.com
 (2603:10b6:610:cd::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.18 via Frontend Transport; Tue,
 21 Jul 2026 04:10:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH3PEPF0000000A.mail.protection.outlook.com (10.167.244.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Tue, 21 Jul 2026 04:09:58 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 20 Jul
 2026 21:09:40 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 20 Jul
 2026 21:09:39 -0700
Received: from build-akhilrajeev-noble-20260602.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.6) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Mon, 20 Jul 2026 21:09:35 -0700
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
Subject: [PATCH v6 06/12] i3c: master: match I3C device through DT and ACPI
Date: Tue, 21 Jul 2026 04:07:54 +0000
Message-ID: <20260721040805.1696503-7-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000A:EE_|DS2PR12MB9797:EE_
X-MS-Office365-Filtering-Correlation-Id: e5cc349d-cbd0-4b5b-36be-08dee6ddee15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|7416014|376014|1800799024|3023799007|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	+64zfNDV9uHwL/f09V8zNIzwE6bxGCu+6YTQmOB4Emy64mkhfqsa+7hjuGqRR2FomKC33t8fUokcQq45P6YosF3ALBq9n4+rTHzvGRMjDeebF8vEVzUbmqkY68BiJcSwoC5GrP/7zvLxO9O0GgO8GnAoe6FK4bQ2fJWx4fRhJ84yLfzKIglFian0PtwuqTpb7OWr/GqoJ3QW0Mr3DI9GXFAl2w3EQ6Q1FSrH1No4wFQ1rp0F8u5D4YXVbrzzFACoMZSiLl8QaxCuOEND2yV23AvIsPERf+iQpe600q+4F0Zn3LGRMQ3NCcn/FJLix80nAvVzoIdOWC0FUP2c2cyhfgPfZvwtVu7Wm/84guPGDMbRLVNf0DeUO+i9F/di1qJfDcOZfGDWC2H1p9PDQfQ58YmrAn5Je9ywdBBLnp/sPiBuoA5lICfdnowX1rDCpaLaZe4c7w++BPTCoFetdVByfZ8EosokKm64Xjer8hzEaUiliKd2nJdZQe8MzJhigOGJCYhGWi6fcFI/1MfSqvlnkjDCPExKtAy8rc+aLb5DHnMlu1NgitigBoQCB6/LGnu4yamO4PRUyvq8vD/9Y4IIaa16MqpVyRWwA8QMHP+B5VX42flHDL5c8Lfd6DroUypW9LKcAS3lRgdaHNeYj7DnRT4deClG9e4INQprHxtSuT957D3BzpfP9U4B4mpi7S8R+j772KizlTBYy7hZ2YCJ/A==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(7416014)(376014)(1800799024)(3023799007)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	EG8peYeysYAlV3xomhuYDBg8TtUJzuAEwOxuiIV6Jq6A4jTaYFI9Legb8APTGzDfqJLvmhzkoA4XKqgH583IooXrITY4MVa5ok2BlaV2HlgkpH9FQWE4wLRVNn9WOjU1efwpV5bDl5DG+v7ruiVpPx4G1dU1kmbCp7wzYUl2wgHOfkDjAyzWmaZoqw+rfp3skHztuU8XdfWZ9gseW6X4E5erL+tsPxIdBeumhoQsicKShgJmSFFTdg3nKh/oIM781mJRdbKOCs5jgWRZX/0dAFIREPUF66lukfYFOAOri3sfUMhOB2wCcuDHRr4ppGcEOgHmjxavVY6lv2VK1S0XJGqiXIYeIsY3G4QcWqQHyF2oMb7yr2rhjARPmy/WKfEF/n3R7GcbkgbUwNjk9DAPSBiI0WKxobcZnXVuMPBU4RIwavEQDTDp9HZpUCa2/YeQ
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 04:09:58.8102
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5cc349d-cbd0-4b5b-36be-08dee6ddee15
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9797

SETAASA-based devices cannot always be identified by PID or DCR; the
standard I3C id_table matching may not be applicable. Allow such devices to
match through Device Tree or ACPI.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/i3c/master.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 7b2f819bf443..43bf530bc661 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -19,6 +19,7 @@
 #include <linux/kernel.h>
 #include <linux/list.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/property.h>
 #include <linux/slab.h>
@@ -345,15 +346,32 @@ static int i3c_device_match(struct device *dev, const struct device_driver *drv)
 {
 	struct i3c_device *i3cdev;
 	const struct i3c_driver *i3cdrv;
+	u8 static_addr_method = 0;
 
 	if (dev->type != &i3c_device_type)
 		return 0;
 
 	i3cdev = dev_to_i3cdev(dev);
 	i3cdrv = drv_to_i3cdrv(drv);
-	if (i3c_device_match_id(i3cdev, i3cdrv->id_table))
+
+	if (i3cdev->desc && i3cdev->desc->boardinfo)
+		static_addr_method = i3cdev->desc->boardinfo->static_addr_method;
+
+	/*
+	 * SETAASA-based devices need not always have a matching ID since
+	 * it is not mandatory for such devices to implement deviceinfo
+	 * CCC commands. Allow them to register through DT or ACPI.
+	 */
+	if (i3cdrv->id_table && i3c_device_match_id(i3cdev, i3cdrv->id_table))
 		return 1;
 
+	if (static_addr_method & I3C_ADDR_METHOD_SETAASA) {
+		if (of_driver_match_device(dev, drv))
+			return 1;
+		if (acpi_driver_match_device(dev, drv))
+			return 1;
+	}
+
 	return 0;
 }
 
-- 
2.43.0

