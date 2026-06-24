Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012042.outbound.protection.outlook.com [40.107.209.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E1222157B;
	Wed, 24 Jun 2026 10:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782296679; cv=fail; b=H6oJx3nPbKfnsSnWZQg8XpmQLroaqCgkthuA3k8iI0n/POy6JPG+NbrUk8T+zBPyJW2lsXzzIC9XxsBu0uAO6+3L0Ga90HsaHvvoplh+geTganoXplfudu9xdddg2mUJ02Nkn/4t4BtcXcC73/mnHqpXtz/apb40acCsJDPq7mI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782296679; c=relaxed/simple;
	bh=LfofP3IUjdB6T79sYJGgPf9QhkpkXdpbSH3icYRqKzg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U+XSceVPSFg+1zv0fWDh6AQjnKy+yc14JUuyuEYjOIerAc/nJwWaR9+/ZDb50CLWZWFqjXL/OivDc7mVt+sbCNSQYglaE9pRTU/pDMXOPANj+Q0n5eG9SRgiipSoKcGlVu5b5U1swz98NMyqwPYQ4+iRxOOLkHBh9FWzKIWPYkY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=gY/0HBc0; arc=fail smtp.client-ip=40.107.209.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="gY/0HBc0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lkt0PhPh9OsLs6jj2PkbLip7s3WWHkGEP4632x6Twr8a2KPtgetmmWPjVLSwplHVG5iQ6yU214HExIYDKh0zgrUzFh/FEXT6DEAb2O7K9+jWhygYZ+IJwxZAN1jRDvy0PDFG8Nshw2R0Jrt7wcEt6iOGlu39g2HXKCcTC9bAAfq/bybCRJ+6xxphc6lyuFpakIRjnz19W1UKubULRimMoHbPIttz7/SNZGdaePWFoq2T5muGLgMY5K6gUvfGTVbbl3XxIHUGzAF6FNRDq7/Q0jNE39e6n4aSPF4SmEqHAEiiH4jdIMmyTG4t0Acd/c+D4EJn/BEEqxEgeyCMFulLkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8E1ielkQSKVt3gv1HWhyw6b5abObJYo0dCOE40hp8JE=;
 b=JrB1A/Mp1cxDnthaPjforiMIkSqsDhKMBHnaRLXdZqPS3CdLnmZ8+HowexiyO0oioznbVq+r5+6KmkSzq5yH3Ut8frn4zWSWpIkjyeehpfOm3DzPmnTODtOH0sSW8TDeSEi/s91hOtpvBsD6bzIuz0a864nE1OhmmaZuuyKV7qj5Zqm+Qc6MdnRdqRjQL0I6KisJDsNVJ18xLLj68Nx4vAJ4jawueOW9rxGnTxX/WNgZUaK4egHoi1A3+gbnNtLL5GAPp3AAesn6zJ8wHKR/oPFoQ5iDVAm3jViVxuODHh4rw8o9W8ypvX6uJCdmH6d+LPkKsVtcE2O30L6VwqV+UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8E1ielkQSKVt3gv1HWhyw6b5abObJYo0dCOE40hp8JE=;
 b=gY/0HBc09WUHHGhDNnypGJ9yVJ7PjvCWybkhGqttBoCEJIrC2qc9wdqfNuW8v9JQGsXn2OPW2fgH8jiJdKPju7T6S1CRKQuqHMLHxY5adDzwtMogWg8GE44//DoEQNXosdmnlkgYRJmYkmbeSbDNrrf0/nDdPNTnTqLF//BPHi1/JvDsgEzU9umiRmU8kGd/GQc4MBfU6N6Ea8/R3ULtiXlD+/jfWxPA6D1xZXwBmrtGDf6jWjuLy1eZTgIBj5KmGJy/oEFJJEoLn3zNmj+pxoHKZLmdQX16+11FkSRDxkf2dTnjno4rgFfmts9m0D+0dnt+Jel68zVzkmUcSTwWfA==
Received: from BL1P221CA0031.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:5b5::10)
 by SN7PR12MB7275.namprd12.prod.outlook.com (2603:10b6:806:2ae::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Wed, 24 Jun
 2026 10:24:31 +0000
Received: from BN1PEPF00004689.namprd05.prod.outlook.com
 (2603:10b6:208:5b5:cafe::1b) by BL1P221CA0031.outlook.office365.com
 (2603:10b6:208:5b5::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.15 via Frontend Transport; Wed,
 24 Jun 2026 10:24:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN1PEPF00004689.mail.protection.outlook.com (10.167.243.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Wed, 24 Jun 2026 10:24:30 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 24 Jun
 2026 03:24:14 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 24 Jun
 2026 03:24:13 -0700
Received: from build-akhilrajeev-noble-20260602.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Wed, 24 Jun 2026 03:24:08 -0700
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
Subject: [PATCH v5 09/12] i3c: dw-i3c-master: Add ACPI ID for Tegra410
Date: Wed, 24 Jun 2026 10:21:03 +0000
Message-ID: <20260624102153.1770072-10-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00004689:EE_|SN7PR12MB7275:EE_
X-MS-Office365-Filtering-Correlation-Id: cbc787b9-4d31-4d2b-f64f-08ded1dac6fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|36860700016|23010399003|82310400026|11063799006|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	EaWfZr1v+wCMvBVso/UgHaXjJBBZvz3Neuo/dSaD3LqFpNd0MZ1YT18ETscCalk4m1EeZedUtQiDiJBMw2NWSWr1WucrWUXIzA5SdHN520U6Qzp2V0CWF31WUyeVVYsP/9KXjfdOtJuY4i+SqyfiDoVgTRVx8FOAveFpfNxbt0auVEEZFjv+sux3funGl+zAjZAhF8XoKpArMYFL7ocihcCgcXfnSZwlu/2HUPGIsYSbjRzOPsFwd5JnZt7e/IXPbfZX3oev7l3wHX7JBaHfqhron2EVx75UcuAdeLYQUjEAwELKd6sJufySAeHai/l51bcJ43K2KGWlAPGCc6NbDwHYIm2tgK7mwFTgHKm4Jf7jWfnV/axzGvYyvIGwRj68exz4iNbtIulYA4PeT7G+zkU/oCxaxTUhzcIA+LUzjRnCBdxjaq76D8pWW91LohcDqeBbBpm1dpoPdXIE3nODYsPhzkWfI+gulkaTFYwGlEE+WilGGZl9KXoMxaIE7xhDn8oHbQOjhcRG+UP6ZkxiFqoWlB3Tan8m+ISkYB24y6ncmJ+VWeV/AtDM/6SD6HT/nPn4YCdhYI5Z/alvCgBEgc/jT9DA1+VO9Z4rq9rVx1j32WyUMxu9UizRcZqR1szmSTKl/5u6R3YelS7n+nUr1E4hkeofn7rRoWUhduhTea0zdcsV08J5/duWdGhkVTkLyajkAhph3FoeM046Yh10Tg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(36860700016)(23010399003)(82310400026)(11063799006)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	rGwWz5edFeQBUR9umYE0eElvqHDlRd08LBwGL9BRDbnwknPQKBEIVTFh0O6WFS7T8Pd65Pj2QMfM4dTaqgymZip5o6gn96bj8BuE9AhxfdQXjBU9R+qv5hIzsv/Mka8LAFHaoYqobeBTdfvdtuFkFhgQUiBLAUhGs0ulI1X2vf+ezXiEFo51kGxy8aNUAstTZh6YEdkjAunRXO2OsiSNz0MzNQKxK0FKICOl0654s+W7F8vW2DCP2phIjg1s4u34Ca1reVu6KdrZB9ML8Hw99dYyXQPgHnKjdq34d00N+JZd0oWKwVjD2xdlC9S3mYemaGUSLFC3ZlE3z861AUxlUGLbvp82Izk8ikRtU2gsbvDZkQ6t5qZnQEthT7EW6TAczvj/dacGgk7LchZMx/8X2dn4wj5wdCaUnX+78MrnNF4uSnKv0BHV4jlwL8y3UT1+
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 10:24:30.2838
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cbc787b9-4d31-4d2b-f64f-08ded1dac6fc
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004689.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7275

Update variable names to generic names and add Tegra410 ACPI ID to
support the I3C controller in Tegra410, which is a DesignWare I3C host
controller.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/i3c/master/dw-i3c-master.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 8e40d178d500..0753f6c853b7 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -1855,11 +1855,12 @@ static const struct of_device_id dw_i3c_master_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, dw_i3c_master_of_match);
 
-static const struct acpi_device_id amd_i3c_device_match[] = {
+static const struct acpi_device_id dw_i3c_master_acpi_match[] = {
 	{ "AMDI0015", AMD_I3C_OD_PP_TIMING },
+	{ "NVDA2018", DW_I3C_ACPI_SKIP_CLK_RST },
 	{ }
 };
-MODULE_DEVICE_TABLE(acpi, amd_i3c_device_match);
+MODULE_DEVICE_TABLE(acpi, dw_i3c_master_acpi_match);
 
 static struct platform_driver dw_i3c_driver = {
 	.probe = dw_i3c_probe,
@@ -1868,7 +1869,7 @@ static struct platform_driver dw_i3c_driver = {
 	.driver = {
 		.name = "dw-i3c-master",
 		.of_match_table = dw_i3c_master_of_match,
-		.acpi_match_table = amd_i3c_device_match,
+		.acpi_match_table = dw_i3c_master_acpi_match,
 		.pm = &dw_i3c_pm_ops,
 	},
 };
-- 
2.43.0

