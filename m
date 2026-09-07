Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010031.outbound.protection.outlook.com [52.101.46.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A331481674;
	Mon,  7 Sep 2026 11:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788780745; cv=fail; b=KZ+f5aJrUoCOUf87/kZ5wd6EiUtxpsYVMtmZCoG2RkSk7LC7hI+xbuzFVPLifkvabTekZCHoiPUsA9gnAB9QTOcKyH5uTku3nadKYdj2bzDjdbmea9in4HsSytZSSVjxnRaq3IW+JTiEV7aKqd5QbGtxm3G7y0/BvvVc7YxH7W4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788780745; c=relaxed/simple;
	bh=FPQbvxROkdXH1FMsg8gY99/kQFYL6yCDlKkPVYR91LI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TfWhzz4Fx+3lhobR4/DyvoFtMh3Xk9lCitOYHLCrxk9X/Zj1yiQazi3fwLQZaoZnQokhFFhtEeJsqcajsQPpBsIIWlIaKV2Toe7mckqSueuQx1xOcgGCuVgbh1t6sOwZ94N1KKcrxg43vMXirrvYnHdyXVqGB+JpJe8CpQdfR4M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=h5xu0ZEX; arc=fail smtp.client-ip=52.101.46.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="h5xu0ZEX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dwKp3vjPqRqUbIaNIQ7Krt9EHJ33eYdS9VOXCIKWLUua9n3B+0k60kBkVFArPsoRnJm8sQDhMSl4duL6qDr6YBV9vHApZgpxa4VqrDEUCaSxx0UQoMezq3PIrPoyRDB5hRLcrp5ozWom1zEm8VzPydp7pB5jd2/Nu7DidFVTNVGrDQv0zYM1c3fqN6D9W4Kk3KNGFuGOw54GPwOWKe8ndgRxwQLXZZMAUfd2QFaRhDj+j7rYFU0tHl0ZGKbKv6Gs7W5dNFjw93WwLYjm2UKdyyVFcbmDrtkuVOZAcCG4OsgYGwM8+zT92Ucm3vLxkpcTnxxx2IKF5ZhroHOlIv+38g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2e5EyPRo73WMezFsxiICx3IAQfV2xhcxyBK3Axhf5L8=;
 b=M5Ki0sjCunMiwjcW2J4tZGvuEMww6+/lBbRC2p3pVTMGUbkzWWxIY1woq67B0h/tlm20huLhfXrldZEdWi20LJmkirF/xbsTGuW6K3zrWfsGHn/T1IKhbId/aoJUjQlwTO1JS6sclCTUy0hEojePpavxw5jsXl7k7aJOdo6x/ZNzjRWoh5noSU29npkiX0mm7kLoyhuc5CDuYA5OT0UXvni4QfsRKJDNfQyUayUlQYLbGYFKbxdtBnmCyq5bl5wAEWgkjAMzk6VwKWd9SumpnjqvQ8LpSOgj4K0jGNk2h/QQND3ZlSJdsnmcGEH7Zui/Zga5OxxW7Lt5f8itod0xDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2e5EyPRo73WMezFsxiICx3IAQfV2xhcxyBK3Axhf5L8=;
 b=h5xu0ZEXtBByAM9DcQe8ypZfT45hjx7ezGe9e9+djdTkq8fELCdvH21RGyCP84vim8FzuQHs+f+MPrepH3c8LgW6JGoBcD/CTNGHmqK43whD3qcyuxzang0MSU3NfxZig65zdhi03me3EHm+gw7XZkHoyOO+z6tFCttSRTwpBTJ7fly0iHfw+S8uYjgl6WRz6mPcJGmbhH/gW4caYXLkKaVb9JwcgCrB3TTr2zYDKvDiryk7CeqmGRdeSEaoMd0XcVIksuS+JyxdddGak24YHCzqvFM+QvSCroJcm/h16/1WrcC1ouqFYA5QGz4HTB42L6ifkLxTPRVacrgstQOwdA==
Received: from BN9PR03CA0442.namprd03.prod.outlook.com (2603:10b6:408:113::27)
 by MN2PR12MB4286.namprd12.prod.outlook.com (2603:10b6:208:199::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 11:32:21 +0000
Received: from BN2PEPF00004FC0.namprd04.prod.outlook.com
 (2603:10b6:408:113:cafe::68) by BN9PR03CA0442.outlook.office365.com
 (2603:10b6:408:113::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Mon, 7
 Sep 2026 11:32:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN2PEPF00004FC0.mail.protection.outlook.com (10.167.243.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Mon, 7 Sep 2026 11:32:19 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 7 Sep
 2026 04:32:02 -0700
Received: from mmaddireddy-ubuntu.nvidia.com (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 04:31:58 -0700
From: Manikanta Maddireddy <mmaddireddy@nvidia.com>
To: Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter
	<jonathanh@nvidia.com>, Prathamesh Shete <pshete@nvidia.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Manikanta
 Maddireddy" <mmaddireddy@nvidia.com>
Subject: [PATCH v1 2/2] arm64: tegra: Add PCIe wake GPIO for Jetson Orin NX/Nano
Date: Mon, 7 Sep 2026 17:01:34 +0530
Message-ID: <20260907113134.2543273-3-mmaddireddy@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260907113134.2543273-1-mmaddireddy@nvidia.com>
References: <20260907113134.2543273-1-mmaddireddy@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC0:EE_|MN2PR12MB4286:EE_
X-MS-Office365-Filtering-Correlation-Id: b9d3bf73-7e0d-4356-6d7a-08df0cd3ad55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|23010399003|1800799024|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	fWmrfIypnUXijqIff9SazBgMEghfYcax2uKSmff34Yn8WEMwXoOOiDsAO5HFiCmNA1GmqZ0GrtxYTpjmmqoYdzFBMIStg5rbAN8U3L130khrtZyQzGhymzORw0jWKzKMBGSwd0GSjJ1/4VVKVnKtGFL/aoS7Gg+GzwokFD/HZZPYExSb8r4f84eGie2hzbTWCpOVC5vf9ZeD9oc4hP7MVgrpT86v4Ijx3LJnt01ObIZyQxh1Wd2QUbLCOVcKQjvh3/URqZflv0+LJJ2TujRkGrCzYVITaXYZz3PF6va7MYNUjGnJlEqrfegl4idR5yk2cp3kigps+TJLanv6bELDbLxc5Ht2ZilxkQ6A3GN+QPw8ky5BhXCzPSKRsE3btaVDNJL/WKWMhK/XPJNGsSwBv1shTC/+IfRm4lZzxRpf942GJw2mZ1c44ZSjEnyKLE75KhatqveanOfHzwZGXS8CJYDgoMgM+vpKRNmx9EGH3RlKp/UEeouBh3C8wcf8pTmSUIsRaoOf9WUZhfq4suuAS6fjaXyGeeGda/ypodtCTKKDvlipDHOv25tip619KksN1xH8tAifE+W2aWUJunR5hSrm65RGnVsk4rh/3keVPSG3wmzTXt8tnVNesjIDVs+W7wW+EkbafSTbgecE0nuLF748dzrn2wwrwSAEQnLTsEb/Z8KpNdVleAUmljLIGpvFsZJHCTskynVDQlCzRjhjYg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(23010399003)(1800799024)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	W0m9D93VrEs7sGDXBuc9Ja4adc3tAdiF4dHa5CXkQjTr8dJtg6nbOjI7gpV1W8g2wrD+00jIsslYqx5BH2oj+39nV51SVT4ZSxloJ5RWs0jmT0elvPhDSsKQYA3MLDsvPHc7uKw7qNzuICNGmY+m9ySNJDASY01xHrNMRJGqwyaQrEe9DF7lT2jFbKoqZol7LJHGQrpqlYu7fhUU4RA4byQmEe5HYpXIkwBd7wxJ+7yY6YSOBae+CtwKIH6uD0qHzitW6glTTbplvhBmxwpYJQ/NxjfFofJ5hb4XDhZ5DCyp1ErQcKFVIhwQMQ6+8Rszu2qrB4jFuNZw1BSMQ22W8Fm6IsZBRMf6067GZeoreGQEde8GVWYu/t9MIB+ItJgFknRdxFDKhC3U67FEd55IduxDTvKVV+LoM6Tmx1/qf4uW9rb/0n1dONhP51v4y5KB
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 11:32:19.3707
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9d3bf73-7e0d-4356-6d7a-08df0cd3ad55
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FC0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4286

The C8 PCIe controller on the P3768 carrier has WAKE# wired to main
GPIO L.2.

Describe the signal on the root port so PCIe devices can use it as a
wake source, enabling wake-on-LAN support.

Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
---
 .../boot/dts/nvidia/tegra234-p3768-0000+p3767.dtsi     | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767.dtsi
index 41821354bbda..2af32613b16c 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767.dtsi
@@ -163,6 +163,16 @@ pcie@140a0000 {
 
 			vddio-pex-ctl-supply = <&vdd_1v8_ao>;
 			vpcie3v3-supply = <&vdd_3v3_pcie>;
+
+			pci@0,0 {
+				reg = <0x0000 0 0 0 0>;
+				device_type = "pci";
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+
+				wake-gpios = <&gpio TEGRA234_MAIN_GPIO(L, 2) GPIO_ACTIVE_LOW>;
+			};
 		};
 
 		/* C1 - M.2 Key-E */
-- 
2.34.1

