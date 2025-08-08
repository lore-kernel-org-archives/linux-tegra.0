Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2068.outbound.protection.outlook.com [40.107.93.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E76E223DE7;
	Fri,  8 Aug 2025 06:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754636356; cv=fail; b=tFvkwe5nI/OT6CVGPh0EGnMQRDXRFR8CHkUIG1aWSpUV01hWmlydqcfc6xCwW2igfD/kzCWsW6xItb2RN/6zngUpT78q8483a3wCRToEcNlda9U7Q6Y9+8aIu9SsN/oj0KK5engPKA+sLTX1VzL1TNQ4+HJeCyDjeiSc7YA+CLQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754636356; c=relaxed/simple;
	bh=4CdQuTqsVBtx4745UnkOFZFuBY0XX92rYEzJFa5PCqY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=etIdOXcq0d1R+utCUFt38o7mLNYETzT86LHr9YXCoSrSk3hbKYH21oz9Xl6ywYqNM47iJ8hn86EFpoyJ3tL21eoYvJTWF0MlAcCrXaGflyZopt+x46ciauX27ElnjGtB/9aO/gln3cGAwlk0eeEEuhR+SXzbEum7xaNNIXyHimI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Uw5eIY66; arc=fail smtp.client-ip=40.107.93.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Uw5eIY66"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=stoAPGZMm5AgOUqMf96ynk5EtipRHQ/e+W8YBptDfQ1assVXFDoryfiJ5T2CxyG/wNB5741U2EYDYysilnyq2CM3KfaIwmc6efVI9jwFBtNJg3zhhnTAik+PIs2A2n34iteIyrfXADIQTERrp0sR2bs8vEyWDqZkPa1UeTBN5P4k2FN27tUtBPu4hpknBucY5GFiTDIZDIqCKFe50my6ygo/VkOI39uK6MelZUAywzTzgdIK2mH/T/u/2A0xSn23CeuVpx6PRmBk5DxuM3jqY8MOo1rkgnF8ophd5S+182z7fTFPlElYuphnwPIQUnCBo1Eqpc0xKXszdEWc+hatUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=77NV8T61jyenSu0hqLaYARZQb33PSS1XgE4nh/1Humw=;
 b=E6cowk2rz9JDas36O6/k01hUz3TyvVbi9Gg4zccVuPg4i97ueihRtrl3hO5FvJ9b5JfFD1aO4MuB5SGmPsRsAAiKZA0ATDQ7xqnFCSaO+wXVfBfNkBvTScYX8d11WW0I9YH6SkxCdVb/DG6cXMtkatc9AOMjnSRokPC9s1o6+G06dZ9tyj2JN4vKwUXfUa/nT3u9u+9e+W2Nt/wbuQBS7kDwi+iNEqd8HWawIOS+X35UU3R3Y9oJ2v0Ek2kxY0gNXmwIZXhCcP2jHaR0YECDWl4suuTAwasnFwz3g05txKQ8TNS2K2fhc5xAkAfMkasPGfKppzujkxzFosushAMkiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=77NV8T61jyenSu0hqLaYARZQb33PSS1XgE4nh/1Humw=;
 b=Uw5eIY66PBsJ5sgJtYtrk31EVB4Az64702ysDCB3qyJ10N6f2xhO27wH3rK9y7aZh/0mVw8TXP/FnLJqBrYR4mZbFpzDrgfVv5SOApUFtUSvCGbc3Ox0KlcJold0KXSHTYilpO/mn6A3prwXrlKhzrmnxQDZHEob9Rl35LhOFKono7llIqIjZEnG1me9IgvvQ3z8XCZOI4d7Fl9w5kWbbP0j9+9Oc9E/6kq5P0PJdgrI7AOyim5j9h2wcZp49Y0Hzw+RonBzYGpgA9BQk3kMXPPY3zRQdYnZ7J/tZRR2tqZxfQMoAD6Z2v86PIVr+3OGNp73KZFDw5WnXamS8O4XpA==
Received: from CH2PR07CA0063.namprd07.prod.outlook.com (2603:10b6:610:5b::37)
 by DS0PR12MB7771.namprd12.prod.outlook.com (2603:10b6:8:138::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.15; Fri, 8 Aug
 2025 06:59:09 +0000
Received: from CH3PEPF0000000F.namprd04.prod.outlook.com
 (2603:10b6:610:5b:cafe::63) by CH2PR07CA0063.outlook.office365.com
 (2603:10b6:610:5b::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.14 via Frontend Transport; Fri,
 8 Aug 2025 06:59:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH3PEPF0000000F.mail.protection.outlook.com (10.167.244.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9009.8 via Frontend Transport; Fri, 8 Aug 2025 06:59:09 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 7 Aug
 2025 23:58:58 -0700
Received: from 553356c-lcelt.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 7 Aug 2025 23:58:54 -0700
From: Haotien Hsu <haotienh@nvidia.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, "Jonathan
 Hunter" <jonathanh@nvidia.com>, Mathias Nyman <mathias.nyman@intel.com>,
	"Brad Griffis" <bgriffis@nvidia.com>, Sumit Gupta <sumitg@nvidia.com>,
	"Vedant Deshpande" <vedantd@nvidia.com>, Akhil R <akhilrajeev@nvidia.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>, <linux-usb@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: Haotien Hsu <haotienh@nvidia.com>, Henry Lin <henryl@nvidia.com>, "Jui
 Chang Kuo" <jckuo@nvidia.com>, Wayne Chang <waynec@nvidia.com>, WK Tsai
	<wtsai@nvidia.com>
Subject: [PATCH v2 3/4] soc/tegra: pmc: Add USB wake events for Tegra234
Date: Fri, 8 Aug 2025 14:57:32 +0800
Message-ID: <20250808065733.347264-4-haotienh@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250808065733.347264-1-haotienh@nvidia.com>
References: <20250808065733.347264-1-haotienh@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000F:EE_|DS0PR12MB7771:EE_
X-MS-Office365-Filtering-Correlation-Id: a2804e3e-6e5f-4c88-d5df-08ddd6491317
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|7416014|376014|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vvfDnuudWCZYY04myhpKzy8Elzij9jtdXEwAJm61eOuFwlZ4XuNvticiOAKu?=
 =?us-ascii?Q?DRoGeO3IB2WrZYlhNfpeXv1vHLcOZdyhcWqxFiAIWLMitQOgk5i6mzq90l4+?=
 =?us-ascii?Q?3yo3K9k15rrTqFZ+kNz8MKOU6TdeywnMb5lfBcFh+kW37KbDaSI5p1AZpOTX?=
 =?us-ascii?Q?mX1TT4wdHBGp0GptWfJnOUh17H3iqTQHd2fT8bw8H4kNduF4Q2Ck/cowtJqz?=
 =?us-ascii?Q?iQDVB34XPis4KGMF6GBtO0HtKx+Bza15opTfUm3N8G2kvOVNLwHCMqz7tE0z?=
 =?us-ascii?Q?3Kdh5PLQsUuAxAzNwhXkd6mdaq+iOsJoRpEDd55nW/4EWTPkt0QgGmut8qF8?=
 =?us-ascii?Q?gJC6raZQ/Z4yWnyBVwBFPOoldzCmpv6JkWEuNkOu4OH5pidAfm9Up+yjW0Ea?=
 =?us-ascii?Q?6H6bTf26nZ7yJDmc1v+Jhc5zdeJDgGDI3SHQ2E6GJEDiL9Ng10ZIB0NaOGh+?=
 =?us-ascii?Q?txKzVus1tgslssBkaPBzKEKpZYk3LCTXBSx2dO9qQoRBJ9dj1WiV593b4RIw?=
 =?us-ascii?Q?G3c76l5yavBXjrBjc40qJ3ORIm2wzAAPDlG5MoOp6VOPTemzP1bMd4G0vX5o?=
 =?us-ascii?Q?ycmQ9Ji0sIGOaJbjpi6aplQISLXdQcA2TpJVADeZjOgf5PlHPPzNLAyZTWJB?=
 =?us-ascii?Q?Jy/bSG6HjA3L9MzBpKBJcKRiC/O55G21vOw/BsHW8qoKfNQkGM261zcpN1oY?=
 =?us-ascii?Q?8MHWXZxVgjQ9jWhcTs3PkaPo0qfPzhnQJC99RGWUsSm7/Monzemj87x1kzKl?=
 =?us-ascii?Q?RibfStWPQrygeaLYiKvmA66Uzlm/HbcQfZYJCIBVksWqBLZeufyW7X+A9PJn?=
 =?us-ascii?Q?3T2SK46OI8Cw9c5+zXM6yNdn+iZuWMf9doGz/tB26z5quKqWH23pkevEeDY9?=
 =?us-ascii?Q?cmTLzQbELRHEDUSchZMYOVfOs6aL2rG34/nBnUoxteBKKuMYIgeP3xWb/aNT?=
 =?us-ascii?Q?EZm0sjqY9y20rqMs2iqSUMm42+cHaOx7F+W0zRUwVKYkSsU5faheYnc1s6Pg?=
 =?us-ascii?Q?FJPxMnn4tUh74va/DRBWuzEgUr/UXOqMxto3Yz4+YYDG0hwSvwZGNYxPcq2q?=
 =?us-ascii?Q?8cVrg2o37Of+wczJIBj6ovoqL077lgMfMbLU20ApSz0Pwi8ARE9JtHp1TDTv?=
 =?us-ascii?Q?sb7Tfx4+F8u01KKgYcsWwKhVDII4bz9G4WP1tdpEg3OeZ70GZPVYyZeTQFRi?=
 =?us-ascii?Q?D5Uk2w3SnQiifZMraZZBYq881xKOO2WVKXHO915ONo5zzUtuSH9Vz5u5H4eg?=
 =?us-ascii?Q?vmnSVRMp2WbZkuRWH0P65JM0lirwdmH80kulI+NpVuXQXnitEWTygmPV6qyd?=
 =?us-ascii?Q?PcSxQl7rt+Pg78c/xYzvPP5VYsYBXbUMrEpqW/IDtSmTz4P8cgXM43LGVFHd?=
 =?us-ascii?Q?nrXWnlJoW197yVzfO1qAahIIBe4I9DlNHOkr19H3mEaLPt3962eG+wE6nlWh?=
 =?us-ascii?Q?PMnnefsixXowNYkm6nd1r4HkR5iu7sKAM2kOSf3Ky8yWmSHEU0a1APx5PO/h?=
 =?us-ascii?Q?xfXcidZhcYLNc/WlZ7VGPT/gGC5uV2oadoCb+DyR7GRzXMdJ91JpQuRvxA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(7416014)(376014)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 06:59:09.6248
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a2804e3e-6e5f-4c88-d5df-08ddd6491317
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7771

Add USB wake events for Tegra234 so that system can be woken up from
suspend when USB devices hot-plug/unplug event is detected.

Signed-off-by: Haotien Hsu <haotienh@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 51b9d852bb6a..bf3a46e24aa3 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -4209,6 +4209,13 @@ static const struct tegra_wake_event tegra234_wake_events[] = {
 	TEGRA_WAKE_GPIO("power", 29, 1, TEGRA234_AON_GPIO(EE, 4)),
 	TEGRA_WAKE_GPIO("mgbe", 56, 0, TEGRA234_MAIN_GPIO(Y, 3)),
 	TEGRA_WAKE_IRQ("rtc", 73, 10),
+	TEGRA_WAKE_IRQ("usb3-port-0", 76, 167),
+	TEGRA_WAKE_IRQ("usb3-port-1", 77, 167),
+	TEGRA_WAKE_IRQ("usb3-port-2-3", 78, 167),
+	TEGRA_WAKE_IRQ("usb2-port-0", 79, 167),
+	TEGRA_WAKE_IRQ("usb2-port-1", 80, 167),
+	TEGRA_WAKE_IRQ("usb2-port-2", 81, 167),
+	TEGRA_WAKE_IRQ("usb2-port-3", 82, 167),
 	TEGRA_WAKE_IRQ("sw-wake", SW_WAKE_ID, 179),
 };
 
-- 
2.34.1

