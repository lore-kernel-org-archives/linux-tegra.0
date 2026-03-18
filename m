Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012016.outbound.protection.outlook.com [40.107.200.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39FB309DD2;
	Wed, 18 Mar 2026 17:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773854981; cv=fail; b=qr+JOQ/yzjeepcTEc+BY4aVZO2XTiKHuJRQwi2C4aFCWPenV0zKE/pJYw03dg46wEbhsKfieWO08+HY0VymbagQDyR+o0Xxl9nWVz+OhfAKPUrIaui0uakkLdNoa1OlCTfS6/GfPX8vDsvqpvtOjtgk7FrdQZPK/xDVUjRE24CY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773854981; c=relaxed/simple;
	bh=GKomfaWpnYD2eXKWEnkxdSMZCEOA4l3DAmAcjfosyTY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X/OrSCJzBjrczAtto4Hn87nDZcI1CfYH/njPb++OKPMAPo1zF1WNNkPEgLpcPCtkdwT9sJFsddO5MlxZ1Lck6g2kSExHsWjE00tO+wkzSXMV65Muz8l2PLtNUkMRUU/05EztIpA+7Rg0KvUcwB013AyLmXpMJpJb8G0gBgnxmXQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JKSCca5W; arc=fail smtp.client-ip=40.107.200.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JKSCca5W"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g+ftIAWDy4F2194My1PVI07P5cotFGfc2fqHlFkhitYm4WqEJSaUmjPvb2yEesQEyvORCJ7X5ecJ3Qw/BOf1fsGcQB7olNcWseeMucgQB5jx4CUQTqsYBEYSzH4kMcTlCjAXlSn1t8bTMEDM0FV1rN87Q2KGYJZLDAQTQ0/XS0IYaL6dzgxcL5WPpLx3S115laKQ2B2KqO2RRwvuyw97EzvKSkYaKDaG2VaK+v3kD8Rc8VsOepYRZwuG7dpfBWBfAwdnALCq1nPPy1f7r2C6gLjDBti3C8UoWDpym9HANMMrCwHls0HnKUPuguuYW8NxSCrixw8PPboVlqxITXrfUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bW/98tZuzpeypHTbaLlolnhW5jM6gorI6K4c3+KQ7A8=;
 b=V2z5waOY+C5EU1zDWJu+jCYJfHZ6lDFPaxqlF7Z4PAMrmeqQqvg3ApGGC1cIvTqd37QVsONveJDna9jd0ftt4KNez2NIU8KNS9NzThp5uWo8Y/WcM6lJAOSeRAOSGFwypeg6ZhZi3o4ieWAxEuhJwj2R69VRQC1VcPTVTPYugzO+DHg8ONvvrcy99PZWrTdOwXokxAA2qwn5MtUGgx6BjzQEbuNzuKuSLFcVAUdrnyYSawtJ6kNYk8aemh4+iEj1rDqEJAhQ4CJ/tA4ti1tMjOunw8BMqvMxrGvJwtmDjjtFGbmhAS9gVNA74g8Ob0bCMgMdEwawbf/1Aayxuz62Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bW/98tZuzpeypHTbaLlolnhW5jM6gorI6K4c3+KQ7A8=;
 b=JKSCca5Ww/rLQ8FIqE9/hkgrkF+TPLeSP29a+yjTnPk33VQ7XRuxvO2IOfebZxnW0KGIJYfCjPCrwHA72tAiKks6fnvo8tcmKDZMOY/adZq83DyCrhd3gmYMIUCG/YDd/a8IB0ZxVR2WIIbPHz4QUs9Hk7cD3KSlbm0yQJT/6nEPcgvNv5hkdCHTqke68GNlh4OeM89yqzo/7HEzq9Ac/WhrnuCqeuA0QEy/5Iaxig/97ynK/9u+X69C6vHiVA/9oW/ENpVX7ghEOa+sQezCqpWJghKBptg4FC+VEBVqMv2OxELC9iQwbi3LBQxB50dHF8HEJwARirbnIPB/PNOutw==
Received: from SJ2PR07CA0002.namprd07.prod.outlook.com (2603:10b6:a03:505::25)
 by CH2PR12MB4277.namprd12.prod.outlook.com (2603:10b6:610:ae::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Wed, 18 Mar
 2026 17:29:31 +0000
Received: from CO1PEPF00012E83.namprd03.prod.outlook.com
 (2603:10b6:a03:505:cafe::60) by SJ2PR07CA0002.outlook.office365.com
 (2603:10b6:a03:505::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Wed,
 18 Mar 2026 17:29:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1PEPF00012E83.mail.protection.outlook.com (10.167.249.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Wed, 18 Mar 2026 17:29:29 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Mar
 2026 10:29:05 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Mar
 2026 10:29:04 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 18 Mar 2026 10:28:58 -0700
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
Subject: [PATCH 02/12] ACPICA: Read LVR from the I2C resource descriptor
Date: Wed, 18 Mar 2026 22:57:15 +0530
Message-ID: <20260318172820.13771-3-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E83:EE_|CH2PR12MB4277:EE_
X-MS-Office365-Filtering-Correlation-Id: 615e374c-98a9-4c2d-47aa-08de8513e906
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|7416014|376014|921020|13003099007|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	gP4eTrkkLd07z06SEc5iGHO02xdM1zuwQKF+bqsm+SXpjgv8VKYb2XdHDdkRfZVUIk0v/TTtqiOcIp0aevL/jCneUaLIYUfPJrTeOBwk9eGkP+7YzTLaK3sa+rb0Q8fb7/ikIGXJguIausUl4nJGkVdpkOWunc94vtwaXO0IVBgUljHt683I5mc3GEDb8lxHYyoAcx1eyUIO/T7pIiK64lDtAt+UUHd/Jm5g11tGR+qfSuNliR6X2cjevaAma4RUI1lLuOl39g5Mi40fXAuwZvknMvXd5V4o1M63RVtwOx1qJf78sr5C3zBGqC/IQWBWn/x1cgdjL959u/2MrOCoX3QgntJpI3BN6L2WIlba8gcETF722PZYQDa02S2w8fpEuavXq7uany1pBMTZVF+9Oby25UKq9vRIVxVHUIAUHdCaKgKv7sBt7IgmFlLZkqYgwELcNESAj4+oF9crZUOjowqK9dceIMmyKdj0A90Z6iN+NZO99lawJ5M4NdHTX/hKIYSaKcaRaq1CGhOzHRY6nkJPjgt1AIl9NKAb1EA+buFEGXuOFJPMRpXcJCHbmhQFr3UvTu+uo60PLn8JOJ/9gpOo8WNgQXc2jZe8WnzF2MEVvLljA8rku4TQ9QG5lboAYEYsW+ehgWS2NUaISczEbMmOIKBLlp2HiUNyMwXfR98khn9Rdo9qjwFUaQmC8OY1q8Mlo05LrLPJibiQBCR1ThQMdUqpfx5bx+Ou5P3oE/jzsJDCN3qtbe6ngwu8cWMGZWbRgE8gh43QiIuTgqtiv23/NkiVqS5Z20/MIl1AnrxAe8/G1/gKER5R6sEfyYypmkW1iqEE6R20mq/crB+Swg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(7416014)(376014)(921020)(13003099007)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	g/NXMGUuFCSTyYWryMMZ21dSZz/b+WEZDapWZOni3QHIRESnEB6SpoO9fAxGYIktKRFwkEKY4580YSMjZdR07t8BG/dHqQm3GFiH3yxMtDh/NZWepDbJkR2RQphHXZA0QUzhk6DUYOGKvsXy5NLthHhn0xHm9QyMSY8oUPSYlWkDEqoV60dEtHKht03svbYR3dPNeQAtXz8mk2H+HbdAlkooK6m3VSEdIOKlEqn0n2b+Bybn4/S7D4LSEVeUV4CsfYL8Ddm7Vyk0tx5NTEBYjhsc4oWlo7u68ByvELfS71SgdRTjilx/KToS3UBGZddy2tJ0XYQjs9WvX/DGpeW6TmIuatvNLUcaIsoAGQPzHNqr2UBi76OQe5x/je2sF1ICPr+9HsdDTawMkM4+RNuaBv9W8t+w7SCwhHpmyQElBxSwmUoHDm0MGurQ5hQwx11B
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 17:29:29.2624
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 615e374c-98a9-4c2d-47aa-08de8513e906
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E83.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4277

ACPI 6.3 specifies byte 8 of I2C Serial Bus Connection descriptor to be
used for Legacy Virtual Register (LVR) data as specified in the MIPI
I3C Specification for an I2C device connected to an I3C Host Controller.
LVR will be read by I3C host controller drivers and it provides details
about the specific speed and 50ns spike filter capabilities of I2C
devices.

Update the rsconvert_info to include this field. For I2C devices on an
I2C bus, this field is Reserved and unused.

This commit is the result of squashing the following:
ACPICA commit 70082dc8fc847673ac7f4bbb1541776730f0b63e
ACPICA commit e62e74baf7e08cf059ec82049aeccd565b24d661
ACPICA commit c404118235108012cad396c834b5aabe2dd1b51a
ACPICA commit 7650d4a889ea7907060bfce89f4f780ce83e7b28
ACPICA commit 014fa9f2dbcc6b1bd42a4a4a6f6705d9cf7d460b

Link: https://github.com/acpica/acpica/commit/70082dc8
Link: https://github.com/acpica/acpica/commit/b3c38dc9
Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/acpi/acpica/rsserial.c | 6 +++++-
 include/acpi/acrestyp.h        | 1 +
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/acpi/acpica/rsserial.c b/drivers/acpi/acpica/rsserial.c
index 279bfa27da94..c06e918ab889 100644
--- a/drivers/acpi/acpica/rsserial.c
+++ b/drivers/acpi/acpica/rsserial.c
@@ -315,7 +315,7 @@ struct acpi_rsconvert_info acpi_rs_convert_csi2_serial_bus[14] = {
  *
  ******************************************************************************/
 
-struct acpi_rsconvert_info acpi_rs_convert_i2c_serial_bus[17] = {
+struct acpi_rsconvert_info acpi_rs_convert_i2c_serial_bus[18] = {
 	{ACPI_RSC_INITGET, ACPI_RESOURCE_TYPE_SERIAL_BUS,
 	 ACPI_RS_SIZE(struct acpi_resource_i2c_serialbus),
 	 ACPI_RSC_TABLE_SIZE(acpi_rs_convert_i2c_serial_bus)},
@@ -391,6 +391,10 @@ struct acpi_rsconvert_info acpi_rs_convert_i2c_serial_bus[17] = {
 	 AML_OFFSET(i2c_serial_bus.type_specific_flags),
 	 0},
 
+	{ACPI_RSC_MOVE8, ACPI_RS_OFFSET(data.i2c_serial_bus.lvr),
+	 AML_OFFSET(i2c_serial_bus.type_specific_flags) + 1,
+	 1},
+
 	{ACPI_RSC_MOVE32, ACPI_RS_OFFSET(data.i2c_serial_bus.connection_speed),
 	 AML_OFFSET(i2c_serial_bus.connection_speed),
 	 1},
diff --git a/include/acpi/acrestyp.h b/include/acpi/acrestyp.h
index 842f932e2c2b..38a19b1d19ac 100644
--- a/include/acpi/acrestyp.h
+++ b/include/acpi/acrestyp.h
@@ -423,6 +423,7 @@ struct acpi_resource_i2c_serialbus {
 	ACPI_RESOURCE_SERIAL_COMMON u8 access_mode;
 	u16 slave_address;
 	u32 connection_speed;
+	u8 lvr;
 };
 
 /* Values for access_mode field above */
-- 
2.50.1

