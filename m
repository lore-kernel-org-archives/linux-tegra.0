Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2080.outbound.protection.outlook.com [40.107.94.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6961C8251;
	Fri, 23 Aug 2024 21:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724449876; cv=fail; b=H79boR0ESeu+xVbRgpmhesejsWrV8w1O9t3fh1B7tj1CMt/Lvw21Gw4+t1JT7CjRDgoobMxLPUOKJfipRgpsoPdOt4vrwyvwr9Bmi5o1wiydqG8/z0/tbTV/ChDS7aOuGlphlPvNUICHAp/TQhigmwHcYC5unmmYM32Za8KHwW0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724449876; c=relaxed/simple;
	bh=EoLh9QGb6BRnZjqNHWCFeLlfRWjwjxJZhBflPvVtNhA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ipz/DIBWImotf5EeXtvkZu13BjuaJBi9Tg0/aFIgbxasKMnto9ZowvchSSlnkICQ5i+tkQpL6/7CNlMkNx9U6bb3UCDhrUHsa8vu7bBvwI4bNlI0v6h0ILUdk07bf8zNPIFO5hxXBGLblSfFsDQKQE10fB2E4S0f3YMAGXaM8XI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YKjz/9w6; arc=fail smtp.client-ip=40.107.94.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YKjz/9w6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TKVXostCWbG0xd6onsPuF5e6GTS3lZAexDTnNUwTz94XBfyc8K4In/nAvEjERNhpfj5dPaSKuVc3Yb7ulGDgN6Zq1WpeUraAnb0/aIVUEE3WZxnZOItB55nmJpU9iS/nurG+d0DYLkpbiYitqsuYQ16ZYR9/4Gf0lvtSrPiFv/QCS/G6bJdnqsWbf90dXCYbK8ZzqndRS9mbR0piY0r35mJanwuGqXF/mgMmYLt2AJI1i31FV3L/GUKM821z0WVI2nxaXbl1jpYLTSO8oKgN2m8wiDTlL+T2QmT7GNHBjYGUBb7W8fOYD69c8iFxvTYlcIImfBQ/N3m0Do6BD3YPeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jvKWf9+e8EkSkADRCioIy3r3ClW8VqPjldz0sSZHgOk=;
 b=raq1x2OMu9i5YqHoZtXokX+llV1DPrvg8VVjv0Pj1XcmHXXpO+/3F5lTdBRcrmefyrLWtmpDQTy4ISPK+6dqIII3P/aP/a9KD8HtRX98BO4YBkR48RgPZZtGN82OC7Y+tsr5F+w4HW5sjBqaXcnmdVa9g2LvVjYZXAMqb6UAfJAQtOUNy/EoCl4Xd9rHhyv2LmVT92o46MTS2TnlR0Oj/c4YkfidoBBEHisSAJsmbCyAlhJqZpt7AAZHJV7HCkGnCfpxxMdcjlayONe8xHq3Dc1SalBGWnDtcadVC9xYCKgJMcctrYAnUjrQ4DRDJbBvQGQF0BfSnwV+DSHFlkAtmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jvKWf9+e8EkSkADRCioIy3r3ClW8VqPjldz0sSZHgOk=;
 b=YKjz/9w6/x0Ce0SmEF5dFTBNgbwnjP2h+sHq/w7uONHimvMO6o8gbYsP7m9dijZabA+USeY/yd4hdjeroOqqpsUMQp6BUJzhW3D1o/+xSFsd2ZdfgDP7O8pVxXegJ54jJZMWAt5eJo4j+P3SiBeGWieINeIbZvpY1defxctynxFySUXimNTeOlzZS0BQ/mrjET5xqj58zpSTUVC7x9h436ieK9I1tg+weXHkFWpr4AEGpB0lzHE8GtemG7Y3r+gcq+OAx1eBe+65yGdAHAl3O0iDZ9ci4SZGG8MTNfo38TBEmw6oGmqAR3amE7Qv5fLgD7xJAdt/hz+6aoVQwvp30A==
Received: from BN9PR03CA0654.namprd03.prod.outlook.com (2603:10b6:408:13b::29)
 by DS0PR12MB6654.namprd12.prod.outlook.com (2603:10b6:8:d1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Fri, 23 Aug
 2024 21:51:12 +0000
Received: from BN3PEPF0000B073.namprd04.prod.outlook.com
 (2603:10b6:408:13b:cafe::76) by BN9PR03CA0654.outlook.office365.com
 (2603:10b6:408:13b::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19 via Frontend
 Transport; Fri, 23 Aug 2024 21:51:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN3PEPF0000B073.mail.protection.outlook.com (10.167.243.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7897.11 via Frontend Transport; Fri, 23 Aug 2024 21:51:12 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 23 Aug
 2024 14:51:02 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 23 Aug
 2024 14:51:01 -0700
Received: from build-dstotland-20240703T000904114.nvidia.com (10.127.8.10) by
 mail.nvidia.com (10.129.68.10) with Microsoft SMTP Server id 15.2.1544.4 via
 Frontend Transport; Fri, 23 Aug 2024 14:51:01 -0700
From: Dara Stotland <dstotland@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter
	<jonathanh@nvidia.com>, Brad Griffis <bgriffis@nvidia.com>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>
CC: Dara Stotland <dstotland@nvidia.com>
Subject: [PATCH 5/7] arm64: tegra: Move BPMP nodes to AGX Orin module
Date: Fri, 23 Aug 2024 21:49:55 +0000
Message-ID: <20240823214957.771297-6-dstotland@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240823214957.771297-1-dstotland@nvidia.com>
References: <20240823214957.771297-1-dstotland@nvidia.com>
X-NVConfidentiality: public
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B073:EE_|DS0PR12MB6654:EE_
X-MS-Office365-Filtering-Correlation-Id: 43f43c19-f6c5-4277-b4ff-08dcc3bdb472
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zuV0UAxMZ9gYUo2/SXecMSWrDkN45OhANPHZva55Ujc+5FzGoFsXLkVGXw6G?=
 =?us-ascii?Q?d2VIROTXY8lp3CLQr450vpJRBfHPl2aMRu5MstHdf6z21WwW8BZIHVq/UxFv?=
 =?us-ascii?Q?+y55YCqzptCvpfyczyKsFtFcSqQqGktuhwsZluM8ZsX44uiTrvEBYilQ0AIc?=
 =?us-ascii?Q?rFMm9xmK4bo74A7im1N2FWYW/gqfe5dc/gVSz87v1/4rgXUZ0GqORQQOla0/?=
 =?us-ascii?Q?EO9qRVYoJJHOuZVeL8PL3bLxZUgwhYfjAY2tKoCPpFXVEzjL6bWY12x6zNF+?=
 =?us-ascii?Q?UXbvpKsDs2N3NSLN60vFLXA975OXjQeQeKsfFTV7TfGUvVpmuHHSSjeR/v/m?=
 =?us-ascii?Q?T5Lpokf9hWDb8jvHk5yLe2KtJawUfnXzIPMdggTnZnWeQRwpoBM2h3Kys8bh?=
 =?us-ascii?Q?iL/5asJDVk0mu3AnrPfJQ1EFKLMSjd5+7TJB1hhkyN4vmqU0v8soChKNQRPk?=
 =?us-ascii?Q?kYdLcQAO+8aUy9kgqiIv2fd/PHgucZPkjKg3A+pXeZA2oJe5amQaDZ2HtQq8?=
 =?us-ascii?Q?BiRcpoy6UApZ5SK6qdYIotyQNhNRKeZgvuA7AZCW+9y6HR9BT30fp9dimKMi?=
 =?us-ascii?Q?Z9ct+jyQxaBaHj1dzHaBtTCXcpD75FUktgjcTiZL2JVzlyMl0YBXRpkYvvqS?=
 =?us-ascii?Q?32YHqOeW1GYrr71PKbuKFKrmdJoGFCBddNWK/rJeRSxURuJ0OS3ow5wI7Bdn?=
 =?us-ascii?Q?bY78ThS551bVJtNxSzN9rq5uTIiasvvibsIBlJtlhfr+FgZXr9MgzRHyLE3O?=
 =?us-ascii?Q?X+lzEXmKjMdj2PY3O5u/2sUffU+JCzp8OrV1xqsM79XoqWkac+3xlApt2C/D?=
 =?us-ascii?Q?k2W1iysnCbpljPAWza6Map6jDv21Pu1h8+V+xI0kCxz1sleDpcIc4KkqnGDR?=
 =?us-ascii?Q?vaKFC/+nI91T9tzvvziVXMS2u4lJJKZKXl6MYsyZ+mHSwVB81rbEWQ+vi8c1?=
 =?us-ascii?Q?puSpiDNGShoBUxtzAf6VJ4CpRZ2Lwgkjek45W95M3OW+vI+9KZGxhaS+0Q+/?=
 =?us-ascii?Q?q3ljUrC0KOoloLKAbXEBRqh2hre01tiwkTeNzqUxFCdljsgGecg8T6UgC5KO?=
 =?us-ascii?Q?mH+/6ewHlsJljy52RapaeEbTpYkOTtNX0wCNqzaAmyrjhioA2i8hendnKDvx?=
 =?us-ascii?Q?8YfwipLcWxbQPvJdGmV0N8fRSn3Wst1hbS5NU5JTmPuZot7kme2ICCxGuw+X?=
 =?us-ascii?Q?XtCI5vSgUJ1m5NEePB3CzP3mwdDiCM7IIwchc2YLg/q5eST+SXWFY7OAxlzc?=
 =?us-ascii?Q?Jr5VFxgGxbvalA6epEKyhhUHUV2tY7FD41/WjkXgAdyP2H+AOJuEr34WOwyL?=
 =?us-ascii?Q?0ImAn3K3bPKSNF8mND5rbJXLG1b3TCKNYl7UBE9KVyXh3ZdcOjvvNBHEQbuC?=
 =?us-ascii?Q?ivhcgdPwT0sF0qeg9NFajgyQeb+qUEEdXIvJAzUyVsOWaPef41R/qIiRaeUV?=
 =?us-ascii?Q?uQ73550NXORf4q/gvR3WhyfG8jafod4B?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 21:51:12.1388
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43f43c19-f6c5-4277-b4ff-08dcc3bdb472
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B073.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6654

All SKUs of the p3701 module contain a temp sensor connected to the
BPMP I2C. Move the associated nodes from tegra234-p3701-0008.dtsi
to tegra234-p3701.dtsi. Add missing compatible.

Signed-off-by: Dara Stotland <dstotland@nvidia.com>
---
 .../boot/dts/nvidia/tegra234-p3701-0008.dtsi    | 16 ----------------
 arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi  | 17 +++++++++++++++++
 2 files changed, 17 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3701-0008.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3701-0008.dtsi
index 9218ea8d43e6..f0fa6a76149e 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3701-0008.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3701-0008.dtsi
@@ -4,20 +4,4 @@
 
 / {
 	compatible = "nvidia,p3701-0008", "nvidia,tegra234";
-
-	bpmp {
-		i2c {
-			status = "okay";
-
-			thermal-sensor@4c {
-				status = "okay";
-				reg = <0x4c>;
-				vcc-supply = <&vdd_1v8_ao>;
-			};
-		};
-
-		thermal {
-			status = "okay";
-		};
-	};
 };
diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi
index 0471cea31b73..9086a0d010e5 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi
@@ -166,6 +166,23 @@
 		};
 	};
 
+	bpmp {
+		i2c {
+			status = "okay";
+
+			thermal-sensor@4c {
+				compatible = "ti,tmp451";
+				status = "okay";
+				reg = <0x4c>;
+				vcc-supply = <&vdd_1v8_ao>;
+			};
+		};
+
+		thermal {
+			status = "okay";
+		};
+	};
+
 	vdd_1v8_ao: regulator-vdd-1v8-ao {
 		compatible = "regulator-fixed";
 		regulator-name = "VDD_1V8_AO";
-- 
2.17.1

