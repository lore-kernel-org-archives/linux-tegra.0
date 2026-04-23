Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012014.outbound.protection.outlook.com [40.93.195.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61AD63DEFE4;
	Thu, 23 Apr 2026 08:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776934795; cv=fail; b=MbfB1ZxIzuCVarZCg4x6etOqCkPsQCbYf6BTu4DAAd7aenBg+26FZJfWwDGM59SwN9tTvgFCZzTktf19zL5o/GJWcRtOaFswKrXr0wia5orOkKc4GKzwfQ0BeM2yg0fOUGCQ8bOmamfCS4+KUxDP68rYcvx++z+4tjYFnxLr7Ws=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776934795; c=relaxed/simple;
	bh=LFADu6MpqpMZiRoddg5x1LqxWWTt/hAWNVeUz/OcXKk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r+JBXPbKE8KVrKwdAEfWCLTEhP22oFQcPq/nf/ANRvfXQcmBnMiMLybbPac09Uftmsv4Xr8VSijyXASFkXLyyYsI5vhYjUH39beltYss6WKdAnpjMIYRFboYJNSoxWgMQU8Dxk6romMthFlXodkTPdk/ElcsHdUVF+B3lgyQK4M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Za+tE2Rg; arc=fail smtp.client-ip=40.93.195.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Za+tE2Rg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uhWXAbp/EnDKcwvMmVYXKZs6j4LEA/jLYV2cz4qiuN0XQFGOxzYxgL2nXab21cOs06F5dusxrmXqHMiuQwad5Er9K60alF6l2VWAQZ/HvHwQTM0CfufhDlV2aI+CF3He8/OkLbgqf3o6nFbuHJMX7v2/Q6yKFX2whRNSolHIbakIxp7NX4Za3Z2NT7/nj4dYJtn1C1lg8BaHvTObNlZQ8hqoX/mJ62hPTorKNkAIoxTGDPymKG+75G3dUhH0j8+gJ3ID5WR+UIU/djSgSPxsRNe2FAjfV2sQukW4NpH4mAfLW1gy2nLMTcc1qiJ/AyBKn6lU8RctUqf7JXip2pU6Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eseIOnmHxTTKeOuVAI9/TdaeIU75cQdfJNzDDpITkA8=;
 b=hq7r7NK/UESLCBlBe+5poZgiGyWh8drNHkYluUS5bzdzEoT4WofB46lOEUVR3rQJTDR8hDEy6B1mKoFEc0eKZeGgaMoM63HZ1wKxth6m0pu8Zq3m/bi25AH+gZJB1/imRinT3fS3HfucHHhaUGuv0ffKA2fujz/hbbW5C1gmeBeQW2fv+K9vfoPRsbyML3v6hgiyToJWvD7DigK89q6BmL5BsxokZvbN5A9cE7HRbx075xL2WwDwWKHpbodMJmSvx0ojj4P3+uHZaVi9WZSocII5KNPZ2ZAMUlP5sa1EGhs0cCKSju1hvmrDp6FoUOLCsz6J5YT0tvYPv3nvv98qpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eseIOnmHxTTKeOuVAI9/TdaeIU75cQdfJNzDDpITkA8=;
 b=Za+tE2Rg7YAny+RWkhpHokCn5qZ4x1uXUex775Au5Vwjp1CQz7++L6CyxnytJTl2cA+O/qfu4GmZR5qKWG0o8A8JeabtjHffh8PI0LtaVpmRot50pVuNl03SmqVl8CczwGS2FmuP33UFENpl7sPoTKLZ42XZpzCrkpfAmfVtiRRksqZ8mim7RIWbBmTJ6svzTuw6SGI48B7zTS0A8Ct2+We7khsTSVPSYxnzykFu7s+/bziRSi0N22Vm1BBW2+guVUP7scDRDKy3PDyRC4umD6kE5hCWuu+SaEkAUklGPxdCO42HiG9i3vMCEAEraWcHTEjgBn8vqZKg9QT0uhpcww==
Received: from CH2PR10CA0028.namprd10.prod.outlook.com (2603:10b6:610:4c::38)
 by BL3PR12MB6545.namprd12.prod.outlook.com (2603:10b6:208:38c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.20; Thu, 23 Apr
 2026 08:59:48 +0000
Received: from CH3PEPF0000000D.namprd04.prod.outlook.com
 (2603:10b6:610:4c:cafe::a3) by CH2PR10CA0028.outlook.office365.com
 (2603:10b6:610:4c::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Thu,
 23 Apr 2026 08:59:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH3PEPF0000000D.mail.protection.outlook.com (10.167.244.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Thu, 23 Apr 2026 08:59:48 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 23 Apr
 2026 01:59:32 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 23 Apr
 2026 01:59:31 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 23 Apr 2026 01:59:22 -0700
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
Subject: [PATCH v3 07/13] i3c: master: match I3C device through DT and ACPI
Date: Thu, 23 Apr 2026 14:27:06 +0530
Message-ID: <20260423085718.70762-8-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000D:EE_|BL3PR12MB6545:EE_
X-MS-Office365-Filtering-Correlation-Id: 195df2a3-1a3d-40ee-103d-08dea116ac4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|36860700016|376014|82310400026|56012099003|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info:
	TYdxs4gl9tL+0N1b5CJ53AF7OY6wH9sWrvdp3y1SACQbO9HcOu9lIqGuLGykiss4z8XlHY769Pb7oCS80coqwciRmVsbfOLfB9VcUZ38UaOESnan6Sqeol2RTVWsM0id3xOooVVTkZQIHiB6iqyWy0TXHPejyt8Upt+ILm/1nDo6BPmKoQp2JBb5B8nXsgyeZqji2m4JXhrihuNSiK3ObY0Q8UrdJvYkcMZnOHR5HtzFG/9UYE2tGb8dXKW4CB0WOPrATBcyw3GHBTzKoKtWECsV11NCgUYKpIiHWcJwzcZ4NDJ3pQg6BtqnVxsA6hEBPP0WBNx4LySFmBRYVOVzGH/RWeyiwLIFSFmtOpGfdrxn2TGgdezwquQlCyzgs0THVixdgm07o8e/CpHoNv75Aw+VR9Ynyg1bPqpQkTlKXHeGx0u5RM4fZSj3WSL73hQ0CqxsbHdKwce7GQp5E4/IcJwnby+Ou3ztZCOBrJxx6c+4cP4TddGts26AE+nAWNHyGV511HwcQxFSP3XxgSQPQtdZjxE/xgaYATg6jrEb7LvEilKEjP5GEZlvsuoq8VjHdnBwdplLboz6AAR5Tek4rv69MmgDXZEM35RB78fwKj2ETac1PBJYW4ryENsJEDfopv1TZjH3kqIoXZovMdsm2rGaIFweWBHLLNeEjLb16Mx0K6hvaQwj8Ri+ti9Ml6mLP4Y8yk5dfVYHlye582eeO/B7mP+LUsjtGC0PLXjRuchFNSJm72ajSAifLsoAcRabUiOay5gjWpJmnG+ytJXaTtue4k6XyXkCwmoh/uSchEiXaLPHnpXX7PMRDuz9pwN3
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(36860700016)(376014)(82310400026)(56012099003)(18002099003)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	a4QAXe4lqEi220wlESf3vXKHRPk7Xr/rHilhXDEh4oicaXausqi2AtfQqTXZlhDUm+7W7qOVkDTPEbSWpRw6GtT5GCVL0Rh1ZBZ7BsU6qhSn4GoA37/dj1N7r2dblLK4Jjt+jxxboiluucpcj0GpBSVaKPlsSYLmxbu174tfnKkuDqln23eEBzXl+/SuT7oFFzNg2m641BBRo1BBjviJB9w6mMS9auMN18+epaB/jh23QO0bmyH31KyCA9X0gOy66ov1RIhiRjQQBbtEmg+reQhrNfUK4Ew+bpBDfvDH4wp/O+LDwLsbWdMUYEYO3/nv24IPDWHyGSDWDaU7OxMlKhAeZ9hisRxacMGHLUWchxgrf26P3LLqFu7RaAGjk9eZG9P4yCx9Jj1fyspkkhzR30PkXJKTSvbz39Yjc8X1DP4gWYGp6WW9/z8KZTXiNHIb
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 08:59:48.3752
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 195df2a3-1a3d-40ee-103d-08dea116ac4d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6545

SETAASA-based devices cannot always be identified by PID or DCR; the
standard I3C id_table matching may not be applicable. Allow such devices
to be matched through Device Tree or ACPI.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/i3c/master.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index fbe8710c4c56..0be83bfdb563 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -17,6 +17,7 @@
 #include <linux/kernel.h>
 #include <linux/list.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/property.h>
 #include <linux/slab.h>
@@ -343,15 +344,32 @@ static int i3c_device_match(struct device *dev, const struct device_driver *drv)
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
+	 * SETAASA based device need not always have a matching ID since
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
2.50.1

