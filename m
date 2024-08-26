Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2086.outbound.protection.outlook.com [40.107.94.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264AA197558;
	Mon, 26 Aug 2024 16:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724690924; cv=fail; b=nnkmG/B2RgUGQ/2w2/l1EyRT2V0TUtgl+089GL1GU2COf3akb8ZU84mZOmGD7vHZWXwNbdEoSHuDDJJZMbgArWSJC61yK/HsXDIFks5m9d62q/sXANj7GVVZwwJOGw729GiReW0OXgeN4qJdp7efuY3e8IJGvJIkB1C6WSkEZj0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724690924; c=relaxed/simple;
	bh=XARwROfGQxDezvMX8ZSWG/d+a9bBnsYD2ysg749T21w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SSEf2VROrEgi5u4/IwDHQ+khjaUmbXF9h2HKh6JEKXg8K+JO1R61A5oU+jWgeoh3b018X/f+46npHEUX61H40yFp2ZXXC5aGOQk6ZehXROabD8Yh4UgwBM0oc21mzw5WhnYvOKKv6hwpdeO7RsGZ2JYCUuEK/2x+oD8X6UhvZ5o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=L/7+p9Hy; arc=fail smtp.client-ip=40.107.94.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="L/7+p9Hy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WIeHj6Y3wUdK1HkDbzVlYA/sv2Ck98xdHOva5tY8BAVH1aioCTcpVo1b9cK47QYPCejrPjKNDa+WwkIsOKOPCVbT1w8gfxdxQ9WroJpzCn7vfgeKcLB3xS0KEjZOiAZBk/aGlFsZ3AOHvhD0LhetySUVJm11d0pS6g4clsAYaRYMmlZ7SnpPMMjX9QnhPwC93Tc6Xgf0qPQ0xpOW6aGkM9mW64ZXTDeczJFxlqxkOvpaK9Pkq1zwpOoJQ1mJzSwpspNY0kJ/DsYgWdlpkwtA9US1BKisN9HDzlM3oa56gM8DINmsBmNShE206e2uh7Pk4DGYM/W6d7YkE6RaVcu3Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KKuFkmmcMs1Ii7WZHkZrGyiiXq8ybrS59Nft7b/UMaI=;
 b=KUAMnMkXm1mxmhJwMDjZ1EVXk/I+nMYVXB3Cfhe+7qk+7MlrPqK4qvz1Uk2il+xDqAZt+wy4wlKMmapbzw3qA+wymmM5DZZqSGDbVCdPpFAexkRH+LO69zbSaD62ZJvlptTAA26zBEJNsMuSR9BFDtm5obLwsHhLhzpeX1mVY5Oo+nDmOtv+vj4QNj2g79aQsWdUw28AcjpZP3wWxOh0XJghsiP0VUB8lmA4oXLeLHLSD0qEi5/QIyNKOziU2EUTX/x9Gtv+yop7h+otQGtLe571aNDa/iUKa3K1a9eH/dNKf7HN9vtA/9XhWQ1i7yjlDdybu4BSkpYGhZuSF7vL6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KKuFkmmcMs1Ii7WZHkZrGyiiXq8ybrS59Nft7b/UMaI=;
 b=L/7+p9Hyw9O/+8/FqnBgWD8AKjvgFHXwWZflilrvJvcja7FEZ0blqjlw/0sdwaaCGGSAMHVpEPsvTcDXDZsJRGFxHDVNoK+h4uMFUh0UMSOD3uCVI/kwOe45DyxLO3LEgMovfIWqe7YKTY1s2t8dxZLUMcfJPYpG6OY48rcsKkT3lUT+Aa9CpsXrij4lvKOlSwwugYzxb/B2N+kKYOeeeXJtvD5H42iCuQzTPHwvpp5fJZagjgBQcLFGAE+dURl4/StyDrNQMIYhbKdbtQLBcMUsOY8q4dNzaNbhZPKGV7ypPSuguAg8FQ3NmxAaeZwrS69v0+kNhm0pgRCuNo8N6Q==
Received: from SA0PR11CA0150.namprd11.prod.outlook.com (2603:10b6:806:131::35)
 by CH3PR12MB9282.namprd12.prod.outlook.com (2603:10b6:610:1cb::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Mon, 26 Aug
 2024 16:48:39 +0000
Received: from CY4PEPF0000EE38.namprd03.prod.outlook.com
 (2603:10b6:806:131:cafe::63) by SA0PR11CA0150.outlook.office365.com
 (2603:10b6:806:131::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25 via Frontend
 Transport; Mon, 26 Aug 2024 16:48:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CY4PEPF0000EE38.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.13 via Frontend Transport; Mon, 26 Aug 2024 16:48:39 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 26 Aug
 2024 09:48:27 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Mon, 26 Aug 2024 09:48:26 -0700
Received: from build-dstotland-20240703T000904114.nvidia.com (10.127.8.10) by
 mail.nvidia.com (10.126.190.180) with Microsoft SMTP Server id 15.2.1544.4
 via Frontend Transport; Mon, 26 Aug 2024 09:48:26 -0700
From: Dara Stotland <dstotland@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter
	<jonathanh@nvidia.com>, Brad Griffis <bgriffis@nvidia.com>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>
CC: Dara Stotland <dstotland@nvidia.com>
Subject: [PATCH v2 7/7] arm64: tegra: Add thermal nodes to AGX Orin SKU8
Date: Mon, 26 Aug 2024 16:47:25 +0000
Message-ID: <20240826164725.775199-8-dstotland@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE38:EE_|CH3PR12MB9282:EE_
X-MS-Office365-Filtering-Correlation-Id: fe6bfd8b-db19-4fb1-13c9-08dcc5eeef90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?G/yV7nAdumQih759mvD21ovxhXioc21luYjH7cjXCfzi4X2L2rMhzs683l+a?=
 =?us-ascii?Q?WQ5cOy4Jliyf6hWWViQMDa8Uxt06VI414Lhr4L3NI5FuN6Dx1eSLs65ls4IR?=
 =?us-ascii?Q?VIkCnSOK1DyXeI4ZKH5+7H0uE3r3vXUaNrhv1FtXmGjqM7ThdefaTfccoCsH?=
 =?us-ascii?Q?wnDLxXSzRJiuTK7RMoHr8xIxcJzXAZ6b6vc7yi9PIPHwAoyRU/6+gzZzd02R?=
 =?us-ascii?Q?0o6+uUgDMJcq399Q5qP+4Ah7Nd3/RIptcf2Y5Dxg7XiX66v9kAfOzCyafg+7?=
 =?us-ascii?Q?xNyv7dBa9kGrFGfrF9EgNuL8rFF69JVcAHeHs9lwuAnNZhBCzP/8pzTTfsip?=
 =?us-ascii?Q?1r5Jmy51ot43IEsbSVrmBxazwyk/NmXaPJMP4MHAznc0bv3+DXqbkIwxIgEu?=
 =?us-ascii?Q?Jawry/XRkH9LzSxwWPZ7MU3brH5KLZhnrEcTem56yRvzDc7i+96K0ZrvMDmn?=
 =?us-ascii?Q?gKm5gZHRXyYbk9UyNxSPor0/HR7WXt8PUIY7M/eX3ma/HDwQIPeHpbmhrpdK?=
 =?us-ascii?Q?bsutcLpgWmjgdlUUACJY0NDA5+e2Gj/Pqzf+eI4MbKy/gj6bFIBGu0vgjk0T?=
 =?us-ascii?Q?jaKNleA4wlJCPJay2/yl1kHVVVutX91sjC30bayk1y7NwWTDqM4xGJAzmrPn?=
 =?us-ascii?Q?5Sh04kitOOVy4VyI9UI//ASQJJPynIQSVvg7c3od5FLhtDkEW3Hrgpa9Bbtd?=
 =?us-ascii?Q?2oMatJQ489pucLnqTFi5Ov/8DoZHsbIGhxLJSAOCDrqMIeIlkt1Nz8B5kxl7?=
 =?us-ascii?Q?q3CWj8PPsc5/w0NgQhedUXKAz0L6rnaz80d21kc+P6NIOg1jMQIg7rnGgACH?=
 =?us-ascii?Q?WPVbmaxgpD6tb9vcdI1nn68IGk1238SePtAp/I9TLdk9xdqYsB0Np/FAyVMo?=
 =?us-ascii?Q?AufDwb8RpJ4BjOe6bcbfgS2A4uqRsiQjZxKX7nRUvjNIKMPwURqlEM91HMg6?=
 =?us-ascii?Q?8j6Ox3akr1cPXb/FjP1cGh6jtNZgJlIY4wKe8OaAFJ54DbiIZU7qsVTzeb26?=
 =?us-ascii?Q?dOJPES3Pkp0+q4wl5myC92tFZ7KdQIBm9H2UV8xv8NzhuPSna8+h5mCZ3f5d?=
 =?us-ascii?Q?dO95mHK6fCmnoZTyst+/RWbkkGz0rPXT4/QlR0vgjBH+BGJWSUy1lsmJzfEd?=
 =?us-ascii?Q?BYlKSbbVTCfj3xM/kR4Le1XENnsHOpiMAazQ9poBU6fewNhCXwf5n/R/VGmZ?=
 =?us-ascii?Q?PJSoWVJzbBDOe8RZSN+efj8KKIIJCRsTbTvhTnbe/gp/qg25xfoAJdumlaZ0?=
 =?us-ascii?Q?27YtmpKBKDvQi3Ukyp9Bgb8vn8OuEDUrJiGjJncbRvDGgGTMBmOBH/5/WP5R?=
 =?us-ascii?Q?SnHwXv0aYg/Kae4QIKQNLNSQvbRSuA7TUZuIvuDUjxYRsgHAnyB9ssEp+IXT?=
 =?us-ascii?Q?tiPFj4UbnLKF9pQtexCmRqmdsemyg6fCj8dtA5G963/OOc1ENhNIDiOPqeuR?=
 =?us-ascii?Q?09gVVKwGAQeJX27J2lFmTh2oW+GvNBYl?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 16:48:39.1384
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe6bfd8b-db19-4fb1-13c9-08dcc5eeef90
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE38.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9282

One of the key differences between p3701-0000 and p3701-0008 is the
temperature range. Add this info for p3701-0008.

Signed-off-by: Dara Stotland <dstotland@nvidia.com>
---
 .../boot/dts/nvidia/tegra234-p3701-0008.dtsi  | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3701-0008.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3701-0008.dtsi
index f0fa6a76149e..0809634e5732 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3701-0008.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3701-0008.dtsi
@@ -4,4 +4,26 @@
 
 / {
 	compatible = "nvidia,p3701-0008", "nvidia,tegra234";
+
+	thermal-zones {
+		tj-thermal {
+			polling-delay = <1000>;
+			polling-delay-passive = <1000>;
+			status = "okay";
+
+			trips {
+				tj_trip_active0: active-0 {
+					temperature = <85000>;
+					hysteresis = <4000>;
+					type = "active";
+				};
+
+				tj_trip_active1: active-1 {
+					temperature = <105000>;
+					hysteresis = <4000>;
+					type = "active";
+				};
+			};
+		};
+	};
 };
-- 
2.17.1

