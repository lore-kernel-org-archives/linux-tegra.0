Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013024.outbound.protection.outlook.com [40.93.201.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F59A2FF15B;
	Wed, 18 Mar 2026 17:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773855028; cv=fail; b=qc0GDWHr/jfeH72xaFEVoWVCEwgGlRpcrQAAPgYiUE2apsk1EwzPurrl+kUGXqSGe0CAgjf5wbNUSpeznFRouSfPHUqBT94NC9KCjnGAfRIFecuLQmLSw0lzcASmZhnS9ZjZiQ6pzQFlFihD5zM0Z+/mMl5j22QlzUbJE2xh6xA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773855028; c=relaxed/simple;
	bh=SelHleVnLRK4gZ75qOH66KqEB6LJxZo6mmw+UQJn52c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ELaTRw7TGFJ0BXm4Pg+Scv8yTv8Eszw+OlpWwYj3ABLzMxlY1SlTz4MWhi0+35x87WUCmtFYroLP8mwhIpo2a220VgxImTu170JkmMZYZY1pOunp6GxEh/hg6I9LQz+Q3SIQQLI7raCXCu9U3KIs1irbVrMXtH4Muo8ojYdP8us=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hZXPq5+k; arc=fail smtp.client-ip=40.93.201.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hZXPq5+k"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bpnl8LqhbCeioQyBRCIefUazTCL5JGsHNu3+qneLU5CGhQIaRa4AWPbDAAvoMRuEt23Ibh20aZ8HxLAugMQ6l3B3D33FXlp1SWbZj+CtWLEl7w5oJIt8eFirtE1/CBPOXWPhbRIzREaAPoxriE0IebkUPfdMyMu5H383Gb8T4ob6zU/fsD2jn9jMbSbfFDDSv5mvJ0tcAG9xiKkUomOa/dVzVtJRhDN3F7iBRihMgweW8pNnKkr/No47656Xt8eYk8w9i4GRx3mvEBnzeS6t9YQzhylzazAwgzS3o8gk5scb4fYS/3jMPDxS5zPZRCZUqhU9iJTnRqQk34a0CIgB6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ox3/fbf7Tt/cg5RdphViNs6PKc1sfisJyea+Y+LUzzI=;
 b=crd9oTovktGRoQH9zpNxV2AtcxvhFEsippL0efZWd9bu0PSjgv7ErYRzbjmp28clh+kLUZOLw6qBC+uSKIOrrflIGpne+yXNhJG/wVwQXZ3RC2ptkIJqlbSL0XugPk6uJGHyiTwgrKcIrwnMaYmlaFvcYdeyNZoqEgoMcbz30Eui4OJU/kmuhTTe2HXfyGQMP1YYfjiXYDYEZxuutV032enWJVYESsbSWkNqkCk5IOOv8oxFIZsjLQ1FU87lvp2y/KIaddGq8Hdhw+sWKMEC5r55Qa7VUtFHfvJr+aLx5R3aE7HpwQd9om2c+fyiTG3IX4B8tDqXpdpuG8Jhz5DxtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ox3/fbf7Tt/cg5RdphViNs6PKc1sfisJyea+Y+LUzzI=;
 b=hZXPq5+kB9fXyy/a6l97A2qiIF1fX/2gPGRWArnpHwjwPzVNPkPouL5iyXaFOG4WuNjpI2BsY1FGdeycmS453eUtO+K1w2Uv+f7x8J/eJL0UxnO94o4WUyulWjwMr5j/fupFBuaB+ZAxDaZCVIpwCUK6hJ7RxoF1a66R1DwBxVz/3+YTFXeXm9NfxJpRvXrRxlQPKf2f93eVAdX5EnK2sSbFJDFJBkPjVMZ+TF0AjAyG6U5KHrzncMIbcfN8i56E4z4FuSgM7lgzqNSxEqh/AI8r+Jx6hd7ALDqLScyEplRO/JJVF9jzChKaSxk9WyAnvyfM7DgYzX1bZ850/sZ3kg==
Received: from SJ0PR13CA0151.namprd13.prod.outlook.com (2603:10b6:a03:2c7::6)
 by MN2PR12MB4173.namprd12.prod.outlook.com (2603:10b6:208:1d8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Wed, 18 Mar
 2026 17:30:20 +0000
Received: from CO1PEPF00012E80.namprd03.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::79) by SJ0PR13CA0151.outlook.office365.com
 (2603:10b6:a03:2c7::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19 via Frontend Transport; Wed,
 18 Mar 2026 17:30:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1PEPF00012E80.mail.protection.outlook.com (10.167.249.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Wed, 18 Mar 2026 17:30:19 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Mar
 2026 10:30:02 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Mar
 2026 10:30:02 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 18 Mar 2026 10:29:55 -0700
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
Subject: [PATCH 07/12] i3c: master: match I3C device through DT and ACPI
Date: Wed, 18 Mar 2026 22:57:20 +0530
Message-ID: <20260318172820.13771-8-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E80:EE_|MN2PR12MB4173:EE_
X-MS-Office365-Filtering-Correlation-Id: 849e53b2-b09a-4e33-bbc0-08de851406ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|7416014|36860700016|376014|921020|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	yp+0qCsV8uhrcgVIGsbHEdFYxVJjUIH31Twgm0jZ5F6gfDvVr9QWRsEJ/4SaaAmwDVIrISZOTR+0x0yWvYkjtUjWpkvBblwkweHHfIrxkUiXhw0RHOGell60RRzHrTHOuwXYQUIKA+tLf9anO9V5iYQoEIMZ9byi3NHeKV1+wvQvSh64L79ndbKTbFguShRqYiK202Cnf3TwQW1T/kwhiiETa9RdTyYOQzLgCU0NAlWPxcU5M/Z4hBxXHx/XAgYh8jBwJgfdwp/UzsX2qJHFA1asMkUZBMHg6UgBtLER52vZEWh9v9Lm6CbuEeYwHnYP7B6npXlZxf4WPt2NU1LHhJt1rzJNfuHsO+oIkjYFl2O6wrAr+GH3SxYNCPV0CjaXn/BL0aCzmX9kMb9Ohz4LOe4pAoZTPOZf1krzeHbNubaTC8/+b5DBy/iRLBXg+yKilNl4WzQV5lyVnJXvsRF6bGPCrea6htCLhDvn+zaMPAsPtvJ/YVSelwlmEKAADHhuQYx4Y7P2PI0gck48jIVM/ZUQSAIah3wcOobzAe85OpQr7YXmVq7ZwmNCmYUTrxDXH3xbjO7nZRzYnLGEufrOQVWdMkMSSZooD8lOdF3pV4tj7+ce2nMDEloxvjxpCD21HMMrKdMpZJfJiPNBGuyS7NpdmCsycgffnUlIDwlYjP2YCg5fYSKTz2ndDMVo9swGt2aU/IB5uGENuzqf9lcjteDlgaQNYTzUzlQl/LmKvYpyaLiHj2FSdwbul8tdkcy2KhC7u6Qoe1soekYg3IePX7JbKs/d59AoEkThANLFrGIG5yx3Wn2x+ZZCQT95pFte
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(36860700016)(376014)(921020)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	nLxv0aNDROmBSJOtB669NSnyubJW/xmEJCgYKXlSxiSomP0Jqrek+ypXLoHaiARIaSF6r6OHOhQagHmUaNmiNtrAbpBEbkYXd7pqBQ40Ds4ZTzn6emHgH7oWVme8Akv1C8p8scwB2S+e43IoCatUW1mxqw7bWhOI4+5g6y2Wiwa25ywgu/1WlWJAHb/h66+/mK5q8DKjHfKM8ErkE4oFeT5SYpxVzAt+vqnoVg18c5cZaUOyvprNQtIdw5RdGEuwX+vZdx/DjxKlb9FKESgAT0Lm5F2jWWr4Y20ybOREVGW6AiHV0j86Sh6eBw+K8KBlwaqD++WdSt4HOPUXm67inU1rSjeJ1PRgeZ8JeT7enL864RFGeeJQJNaDQrJytyHq+M9e/UPoVE4plLKEqZL8aI35pDSnmXbJli5I7Au+EYh0uwYWNU/achBY+ZIDR5yI
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 17:30:19.4268
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 849e53b2-b09a-4e33-bbc0-08de851406ec
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E80.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4173

SETAASA-based devices cannot always be identified by PID or DCR; the
standard I3C id_table matching may not be applicable. Allow such devices
to be matched through Device Tree or ACPI

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/i3c/master.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 0cce75bb05b0..ef96518558fb 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -16,6 +16,7 @@
 #include <linux/kernel.h>
 #include <linux/list.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/property.h>
 #include <linux/slab.h>
@@ -342,15 +343,32 @@ static int i3c_device_match(struct device *dev, const struct device_driver *drv)
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

