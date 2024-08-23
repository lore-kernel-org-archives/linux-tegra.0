Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2055.outbound.protection.outlook.com [40.107.96.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FDD11C8232;
	Fri, 23 Aug 2024 21:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724449890; cv=fail; b=VV9mkTzuokiDItBs1vjoYzRCz3Bl4zH//B6Y5FwDE+nK7SHt9MfxymEtakJGX416ZCuXeAlKn+ih4QicrmUzSZNkVAINv5dUbmYPkzJ6OhK7o9OPBWG3+/9L6wZCtapVwmueCb2LPbpIfyZFWNhOfdkjMNKaUC8T1bX0F4vD9jo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724449890; c=relaxed/simple;
	bh=XARwROfGQxDezvMX8ZSWG/d+a9bBnsYD2ysg749T21w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I4kCTMHPwM0GSILpwnJBviLcU0CQUCvx/+bT0Lw/LilD3CnSZVh7Hsdsm6HK/KspTAcGhVyHOR7kWypH++z9W5zu0YSLbngcA6dpCuxu7oEUSISz+GhPOSBEEsPwK97Y6CjDLUQ3b0F+5EleNOtL5eSifHEMHEVnITIuPQgTLAI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=P9/vwSFG; arc=fail smtp.client-ip=40.107.96.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="P9/vwSFG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UgQ19AqhNOfXNeGA0SPrtbHaeBgVo2onKpI59vZxpoj7S3JHZ/kxtYazCgUK8/lEePT2ysRDEeQ4bqVcBMSsJm+IV/CblakwaJW3qvUqm267DC2qp9ogSMFdNKWiS8GC/FK7pI4YQNVyA2pdJx45kYvRXPu77xNtdvIwB7At2L56RCxDI6BFeJkg3nsEV5qA8wYOWKUoxYDYDCfZUzxKSepCKKNFXquQoxCDzgDM2QLebI/0bHWd8Vrk6mIeuGKPpPJJP6DaJeqrqx/109Hx5S3t0i2pGARIJR0U2ow8SoZ9ZyTuING4VIHcxc2S/mOMyhBnciluW/C0FPz+LA6kJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KKuFkmmcMs1Ii7WZHkZrGyiiXq8ybrS59Nft7b/UMaI=;
 b=C3xbcnceVs9chjrHLE7JENVNh+1ty2iVloGFQUVk7WJM4gsxU0Zm52C92aGAWhBLeQ41jsUyBg47c5g++CXu/slE0R3h80/IzohQsZMvP5ebNW+4C4swNfxnVGoue8h+9a69IzmtaeGZHGUi+d90mcLghD9C+uQq83DvYA7hQMQx15KMPRRMdQtBCopK1xeyScS7cZdXSgeRCkHl+ky3YeblpQkQk1TnFqL4jD+oE7hG3cxiWd2n/wImZbqe1lmhr4Zf005sneUc/Otwm1AsWHwqLeqkoFg1pOInerX5C6s+jHYQ8m+Q+TptVmABgmn3cmpgs/uhXV4AcJSfcZ/Pug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KKuFkmmcMs1Ii7WZHkZrGyiiXq8ybrS59Nft7b/UMaI=;
 b=P9/vwSFGVhkv9avO6v2SUS2lb1iltGcgmkaB0GYwKGZcrvU/mCWUonabl/YuWq50mTGetfIrz/Oj785wK/qWlZmZQxlOlV3z3hmhqVwmlMHCNvBz2YBJcTs2MmjOq6o8jHE/03x1a4gjF2vo64X4z5/nN2mpSKoep4uRAZEGigaC5r/0z3d6ZubVllQ7rRMHfhaEnPG+FXyJMm0QSpQIlIgBEUTRfB0YjeavnCzKBfWcIclYQeOuZvnprTQ0HTxrsKKpAb0kMzAdbayC3MB2pEtj5GvMla3gZ3tn/WSXRNxr/DEto+tQvfNDJuoTnnq1pazOFu4f7JS+jSLzSStpsA==
Received: from DM6PR04CA0014.namprd04.prod.outlook.com (2603:10b6:5:334::19)
 by PH8PR12MB6987.namprd12.prod.outlook.com (2603:10b6:510:1be::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.18; Fri, 23 Aug
 2024 21:51:25 +0000
Received: from CH1PEPF0000AD7F.namprd04.prod.outlook.com
 (2603:10b6:5:334:cafe::35) by DM6PR04CA0014.outlook.office365.com
 (2603:10b6:5:334::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19 via Frontend
 Transport; Fri, 23 Aug 2024 21:51:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH1PEPF0000AD7F.mail.protection.outlook.com (10.167.244.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7897.11 via Frontend Transport; Fri, 23 Aug 2024 21:51:25 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 23 Aug
 2024 14:51:10 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 23 Aug
 2024 14:51:10 -0700
Received: from build-dstotland-20240703T000904114.nvidia.com (10.127.8.10) by
 mail.nvidia.com (10.129.68.10) with Microsoft SMTP Server id 15.2.1544.4 via
 Frontend Transport; Fri, 23 Aug 2024 14:51:09 -0700
From: Dara Stotland <dstotland@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter
	<jonathanh@nvidia.com>, Brad Griffis <bgriffis@nvidia.com>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>
CC: Dara Stotland <dstotland@nvidia.com>
Subject: [PATCH 6/7] arm64: tegra: Add thermal nodes to AGX Orin SKU8
Date: Fri, 23 Aug 2024 21:49:56 +0000
Message-ID: <20240823214957.771297-7-dstotland@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7F:EE_|PH8PR12MB6987:EE_
X-MS-Office365-Filtering-Correlation-Id: be9e2752-eb11-4f89-cf1c-08dcc3bdbc27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gtUhdTB+Hq08NVG0G9vu8jgR6BOm/SuOR04dKYo+fvQDUP+ce7/BPPPmM1Fc?=
 =?us-ascii?Q?59oPxGcfCGZrGxXFLrKw+/EHuruC/aFwCN9eQ/gTY0O3oUnVa7RTqUpm3AA2?=
 =?us-ascii?Q?p3LzoOtPwaG3QitXLH5QzPIy+pybGh2oz9SB8pqladM/dLoobtTmEoykASec?=
 =?us-ascii?Q?xWR7vMTkpUH5KjrrNCOUZBXUKrh4NPyWx45gQ2gfUfFB7ImknNqoy2/K1wpv?=
 =?us-ascii?Q?Wie62qZueFr9zEXADsdmcr7KpD0V8omt0VBIBlV9KKmcKXpa5FU2Hka60QQP?=
 =?us-ascii?Q?9L8XQkV0LLUS84lkUGDk9WqG7bdTCUgmHzv8mx15ySQGsch4AZmEitkqq3gx?=
 =?us-ascii?Q?8QyzW0eY49LKmVYtnrj2WCdfiN9m2JjVwCu512SWgrsfUaDu16fJjy6/6AbE?=
 =?us-ascii?Q?zov4RbwGFolwIURSSox5oaQNB6NK2bBGggRbDpBtVVcpSo6judCqrbpZ7vLO?=
 =?us-ascii?Q?BfQQkqD/rwx3Ydw26JF6RRuSkcLmrtB9laYHpJ51GSwYXslaryh4MZbCRLTn?=
 =?us-ascii?Q?wv7nctQFNmkKJprLRZUY3LZz9W2NphrHf73s3V7U8J/HQW/hGNgg4lQ7DRs3?=
 =?us-ascii?Q?XlTmErGnvEYRJaiiqfyq28WTdT5FIzwOTpRjeg9g6Cwa0YQE+B9PPGrBfkXL?=
 =?us-ascii?Q?U6FDzLkgcbyXBLvZ3rCZg1zhdB4/r7N+Lctd5MZVPNdYK+VBVoQb5XFCQhxl?=
 =?us-ascii?Q?WWuH6neYJpMd/NTjRnrIGVrUUC24qKxXVY6Gvuly5HmeYuHRK4mvj5MZtL8z?=
 =?us-ascii?Q?gFrh73svKekQ8lolgHwRwsvd8BZ3fZhnu1FdcgEDqRujp0uCl6YfbPfN3TxS?=
 =?us-ascii?Q?2qDvIKQIaT1b7dfu5zZwhW8vqOvaFG+g8qQ0xXqQJQFyr7TtYWCIkz3iBLq4?=
 =?us-ascii?Q?UDDLWYDeTcUapb7iV/pP94Bep/EAo6Z7dk9YPNTdTB0ZLTk0y1UMMw5mwFWR?=
 =?us-ascii?Q?Yf58tlX4uFOpb5j+ju4v2yskLDv305yuU4eHT70g9YWX8CY4xDrAK5tzG6uK?=
 =?us-ascii?Q?Vdt/vTj/rIg7fxHqDLdiNM0gQ6qwGD1z3skuTDjdOqO8bNH4bB/Ce6vWIOc2?=
 =?us-ascii?Q?s4G3m6SctTJgO8Hk4ZcMc7aiNEawUCvadozQ3WG+tg17HhwmZxmWl49V3R28?=
 =?us-ascii?Q?0HcztAxzRKjKgTvbEHoz0XoZROlvyg/LW4vVlJBPzaMZELiQqWhw2WW3LNrx?=
 =?us-ascii?Q?m77z7u6XcEBYZbdOFAx/fWuCM64vLpZOg9x8I488bw7bsvXhMBGahvtyKZ+K?=
 =?us-ascii?Q?OgvZTJEZ5t4qz23a3VOqtVRnhmPgN249U0ndgL5rq8ILMWYTulwYh04Kria4?=
 =?us-ascii?Q?WN+7JXpBI33bMXVeYCY13f1xnXdzH+NS4wcNFzZd3pxLl+xXTzYoVGHgfXgu?=
 =?us-ascii?Q?39+RvlXqHVOefWQpjDSRV24VYOjYQmuopBQ6BacmSuzssjYsMPq7vs1/s2Di?=
 =?us-ascii?Q?Wk+47l+D3UWHV+vQiX/A8bRy0wTXJgvr?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 21:51:25.0853
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be9e2752-eb11-4f89-cf1c-08dcc3bdbc27
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6987

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

