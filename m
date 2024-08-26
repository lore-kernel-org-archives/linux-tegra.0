Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2070.outbound.protection.outlook.com [40.107.212.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56294197A95;
	Mon, 26 Aug 2024 16:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724690920; cv=fail; b=b6qO5xwJPfUd5xXCwvmV1ob8t62vbLSvcHz39ccQKIHIKQVnaSmGkg5a6XU0GXkXs3TT1DAvD1foa6zxdoKtDbgDFWnZhd3lneCiXFQborcH5wBQPo1MKC3Lzam2l6ID0zb09Krzhb6NSlxHXuj3LmKCiE3GnXcqeBLdPHs2IvY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724690920; c=relaxed/simple;
	bh=EoLh9QGb6BRnZjqNHWCFeLlfRWjwjxJZhBflPvVtNhA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YeT7lDbmcUPEwzieL2ly+XNlsP55HsFN/02abXV874EIm4yEm96t5EpnvSF0wlsRk22Q+uBggOS0LtnVpWy7RKRMgXpZj664czRVIq06wx+UUCTF1pwhjh6ZJEPB3n3aFPHqt2eaaWCY9ClvperUd22DWhaiEai+dMkBkeXNkv8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=VIIl2YSD; arc=fail smtp.client-ip=40.107.212.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="VIIl2YSD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B1UrUWB7LDYKr8Kaarg8WfXz2xEpkYMW1lT8JqYeJmhMS02Tn9pHQF6dBpMU416hRWDkaftKJ6+lRYTi5D6nF02CninnI6F+WJQSSPXv7vXHcssdkqby5SGBHspUimD/2zHyb3XHMC2V4A6uUz7nBDSHX4Sjq52Tr8TIHSfZjZ20vKLO879YP1NTlkukQqHHdnaVTpIylajErga0gieqRIXL1JVdjNIxYXl8joLqnoGgtSAkNWOe1gzXsaTVj1Lp2glvMnBXiKVGqbnfSd8u90o3Z8OpqXaJvdTja+XN8pWEFDgP4O+Xfl9JL66ZN0KcsNUqFBcC89RMofka48eiNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jvKWf9+e8EkSkADRCioIy3r3ClW8VqPjldz0sSZHgOk=;
 b=q3/ZCRcpW3lcFyBxuvCzqe4mmtbvd6dFg8XiUEDi6Mc1k51n9XDB2aH5AMiSnW0YvJvobIEdRidwZaW1qddqL3k+S+jCDkSDJMNNTXP8j6RMkSZ+aVnx2vWfeJUskckwiWvkYRjeFRNaYdLWtFe+TozD8RxQ4J5L/ivAzkRYuVoYzyP5CIkFfve+zse8yGjwM+/UBzmJByO9mrzuk4CGunr9EW/aZgdxKDYRbLgtmhAHwWVQTg1Fp7Sk89XU4+p0/DaMCiCae1vb6ucuKuWAcY897mkl7MUjmT8lLSORZG3TYxiLZ3t+Pm7oHHe++lDhnAHYVIclWl2w9kV9xmrdyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jvKWf9+e8EkSkADRCioIy3r3ClW8VqPjldz0sSZHgOk=;
 b=VIIl2YSDnYOjuFMd8blB883KOShCuVOP8rrzd9szwKGP7KrVsO0GM8DgiB6uDuL8l2LmLkX/C0ciy5HgsDae8LEjv4jG5feK4lzXsU45ZauPiIPTj25QidmiS5ljaFnttqkm1tr3fmgUeYYHVYgAtIWt038PeD3RXP4rcyIOMqnW3yqF/tNF9kW2Sy2cj9VHu7MKiQbvQKnNNFtNB3qbHkwEqS8oYAZ23HcL3IgaorQE730Ojy3HXLWPwEbVLKHCoUneNnlZThWJDQzUACukPl5qFIJRc0BNokO08IgjLQVUkf0RaBQ6pGFmqCFJ0kfJd1UYbx+/Wjd1PQNBoSuS4g==
Received: from BN9P222CA0010.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::15)
 by CYYPR12MB8989.namprd12.prod.outlook.com (2603:10b6:930:c2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.22; Mon, 26 Aug
 2024 16:48:35 +0000
Received: from BN1PEPF0000468D.namprd05.prod.outlook.com
 (2603:10b6:408:10c:cafe::ca) by BN9P222CA0010.outlook.office365.com
 (2603:10b6:408:10c::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25 via Frontend
 Transport; Mon, 26 Aug 2024 16:48:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BN1PEPF0000468D.mail.protection.outlook.com (10.167.243.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.13 via Frontend Transport; Mon, 26 Aug 2024 16:48:33 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 26 Aug
 2024 09:48:19 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Mon, 26 Aug 2024 09:48:18 -0700
Received: from build-dstotland-20240703T000904114.nvidia.com (10.127.8.10) by
 mail.nvidia.com (10.126.190.180) with Microsoft SMTP Server id 15.2.1544.4
 via Frontend Transport; Mon, 26 Aug 2024 09:48:18 -0700
From: Dara Stotland <dstotland@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter
	<jonathanh@nvidia.com>, Brad Griffis <bgriffis@nvidia.com>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>
CC: Dara Stotland <dstotland@nvidia.com>
Subject: [PATCH v2 6/7] arm64: tegra: Move BPMP nodes to AGX Orin module
Date: Mon, 26 Aug 2024 16:47:24 +0000
Message-ID: <20240826164725.775199-7-dstotland@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240826164725.775199-1-dstotland@nvidia.com>
References: <20240826164725.775199-1-dstotland@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468D:EE_|CYYPR12MB8989:EE_
X-MS-Office365-Filtering-Correlation-Id: e86be34c-130d-4f86-1290-08dcc5eeec40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lEqgk8QLEOEZlZTXnn5nkhMNOilYH60/NglNWSqAX255IRoI+JMX4b6zJKdn?=
 =?us-ascii?Q?g+vjaxd82bifMFFWMIFsRSrvCpZHHep29dk3Oo5HoySH9sT7mQiWDJvpYd56?=
 =?us-ascii?Q?Sb8ZApO1PhRX9XbW6UvtDZgIj8wafdOUUah/ag2T0T0iRHKA+fC6o8uj026A?=
 =?us-ascii?Q?+C+40gh2+HNu7rOvGuAj/lIbtH30oQ8N4+9zuhh3e18recV7ZJz3N8Ls0bFR?=
 =?us-ascii?Q?YvRkYXanHZh6+7ubhOMxvGr/oFX2Pije2biziSY2m1w9H9U3RilW5S1pPcxW?=
 =?us-ascii?Q?2CMkTFAgygMIM5rohEkakOA+uvEi31s4MHbqQHU6GXFsD/56zhzspQO5MlEB?=
 =?us-ascii?Q?8hbQKDsnUA8Wstgg8ALtX3TDV0bZZu24YyeQa0QnFyURZQLjldDj3Ypwcld7?=
 =?us-ascii?Q?jtH6UP7ZH1FSp8/CdSKNAGAcPNTWrwDcP6igGhG5MLQ/J6YizdSnQgW5BFf1?=
 =?us-ascii?Q?FH6LvFaptEAoBkTaicJcjsYirp0aK9VKDurJO2eSi0ONkLrXhOVw8wCpTqE6?=
 =?us-ascii?Q?1I+Q+kWu6qpDyYC3iwx5y6KUTw9jALmkx1bA+Yketz4Qj94kLCzIPvOoqpY3?=
 =?us-ascii?Q?BJ/hPI7wt7wsUiPpMgxVAcCu9snyA8kViEy24VtEvTldC927lIqB/0/5uK1S?=
 =?us-ascii?Q?9DI2DWmW9y5t/83ZNLbKVLPOeb9zNkjauDJZhhmk4nq3P5tRUwmlzqfxqtXS?=
 =?us-ascii?Q?LrsAy9DZKbBPoUv9zPpIi61njkwM6hwLQMVPUaQlLlKjk0qStOZHzS+x8Qtq?=
 =?us-ascii?Q?O5TI5f2xDDGXVoczMKWcsyhQpFu2E6muzmFPIRXMZvoSHBTNbWwzGJzjzRsi?=
 =?us-ascii?Q?bQ5s+bGCPIt6Fb6dnmfTMxNlNUWSmgCNrPiY+Eet1N4kU3iUljiB1ZKZUGQ3?=
 =?us-ascii?Q?z2aiTZZUMp15M6wvflD9d6coJQuJbSXeX3VbHcW1qF8QIQKQ23e/l/DqscL8?=
 =?us-ascii?Q?QFxnmcrAwkvAf4Y5eFyPgTSG+EwI4qljwmcMXACeryp9TyYjWjjXHyTGy8dK?=
 =?us-ascii?Q?vN8/yXGLADArtaaWdeXUvnEqffFjMpFr1jOzM0i8MaNSR0HSm/I9qqfjXply?=
 =?us-ascii?Q?RpQnTMJpgpzY1SdnM29uGynyAkdvbgsZ06kGPN11So6ZrYXsVHVryeAEjnxn?=
 =?us-ascii?Q?WSbRScZN4GIXPGMED+b09PHF3F2awBi7l2L/Nr6wo4pUT2q/ZuxWouDJ54s/?=
 =?us-ascii?Q?4FVTccYJFY6buOjVcxaQg6Ww/uyY+0ejNyaLrgmZbSKcZBP5NZWe8Q5ZtTqK?=
 =?us-ascii?Q?hW5OyO0ZqCr18gOlQD+6onqhij1WQfLxCw3PYqolPp7YxHqhnn9xn08a1hz4?=
 =?us-ascii?Q?0ikKQDsXIDgrI3VxcXBT1UMRohyaEpVWVzaTnC7LUsKiVspF/yjqM9mPiJYU?=
 =?us-ascii?Q?q8XMhhHzetskXM7cm2yr+x3X0y6lLJjsD3ftkpBK5RcJMQBhOGD/1lVNrFD2?=
 =?us-ascii?Q?zVxLCwf2hGJ2tLYxBpBzjdlgkUQAzepe?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 16:48:33.4246
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e86be34c-130d-4f86-1290-08dcc5eeec40
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000468D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8989

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

