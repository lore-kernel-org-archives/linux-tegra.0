Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012062.outbound.protection.outlook.com [52.101.43.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62653233ED
	for <linux-tegra@vger.kernel.org>; Wed, 25 Mar 2026 19:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774466817; cv=fail; b=SOAGNJ0QnlX7xtLqclPs7XJp4zzw25Ib99833Ul1GSwXbXQ23xjXBNxuPaDzbytuNrhbHdCpiK6TfMnZqlhqDfn9dSwfyjar2VtAL+nEGzJqni6JSCyHMd6aNftK9FcD7XZfk4K8PiBmNShtL8c8qWBvpVRs8X3RBaQJ98BN4Rc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774466817; c=relaxed/simple;
	bh=8pTIoLMvVuLveRBrPLtWTZlaW3O7ilb0VGOBAaVZd7k=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gZy6PNcZNbS+s6yRsN6JewPDJ8Dfdg2AUTbuNGCpVgfqttvXMOuMKn5Ug2HCGQCiqbUeCALlmLsyE2jNTMSr+OJMNob1MsP7nv1NAgeEm838h02BMrjsGJqJtw7cSoljBD7g4yMA39Wb1MDWEVR+K5/hVDUuq1MXoeumgp4BzRg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Jk0FbY/G; arc=fail smtp.client-ip=52.101.43.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Jk0FbY/G"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sYKtjeY1JrYU8IBijwlGU0OqiqmUllc6bBUR2aNgbIhk8OVk4cM1ztHiKVMh4Z3e8hytE6JVmn+V4wqXXdQhc8TU+/95L/4fYTq+7zySoA6gcghW8MD+lKMVaUgJzoVA9Jb9AHAPO4wGmcKxOxRdI+EcZ/O5g4awJ0z7M+cgJQp+AanyDjWLECjflr+A2U1ie0mQRcbLmoMUQsFGFcjnEv7hgkG5esxP9nRIIrpI8GGzLMIquHwZyZS+8cctGy8c+m8v51hZ1AlM9YJEn1EqAswbtESmOCovhSRFoKUyqldcM/5hiFu11f0c5kgXLfJbHvEMMpdOluk3vbw0/Yu9RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y9giL5Jiqz9JjPi/AOgzYIfKFk60fELMp1WodQ+s7FU=;
 b=CAYtNHugrWbmtzjGWl5FobRN7ufGgksEGpyKKzfO9vcX8ZRdURCtVrUjLKgRBAFG9ilrt0JyiQRSNjRn9aZr8bRs0a+Wm3JSfxRUi76ZBze7bCJ2quXOyAza02EnHemerV9X42YCvSqKKhojJ5su6Pq5nmHu87gNorgXfveYOcC6AR3hw5c43fiMqVKdRO7vh44j4Wl2IEpq48UCfYTHE5KnXu/lktDgD/E/yL4Vc7yF7i7463H95KNmAsAOsVUJbHs2omlygRqB7pH4zEzHBdZlF0B+O3RCtHS8cvcGpYvAkFl2O4YRfBt8nhycIecxlO/7SVBmOrykfpAv99QFrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y9giL5Jiqz9JjPi/AOgzYIfKFk60fELMp1WodQ+s7FU=;
 b=Jk0FbY/G3iuxVKtG6R9mXvbAvzna9mHU6lJBnqnfKwzecGNFgXZgTM+v0NWW6eYkBWaJlnJe4VEg6DCtodj/BlgLxSfG07I1DrgL1v+ToVDoeF50oDaqfSnkKaRd45SOAxR2Zai72fVaI+g07a8wI1jrjx+vk/Jld1cIz9e5vrRXvlDl6p5ZCklpoLEmda2Et2r8dq7JVaGNTbKcTauU/oXy/dc2/aUKOgWqENq2PMydskJrPl6bRBbNsCsyakzAt4ZwyfjGfUm/5VVn1SrmbFvVE2h3dc8u24TLFsBeGZzK1bWZmYNYzXB1gPmWhzP1NS76R2qsqM41N2zWO6Jitg==
Received: from BN9PR03CA0916.namprd03.prod.outlook.com (2603:10b6:408:107::21)
 by SJ1PR12MB6291.namprd12.prod.outlook.com (2603:10b6:a03:456::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 19:26:53 +0000
Received: from BL02EPF0001A0FB.namprd03.prod.outlook.com
 (2603:10b6:408:107:cafe::7c) by BN9PR03CA0916.outlook.office365.com
 (2603:10b6:408:107::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Wed,
 25 Mar 2026 19:26:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BL02EPF0001A0FB.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Wed, 25 Mar 2026 19:26:50 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Mar
 2026 12:26:31 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 25 Mar 2026 12:26:31 -0700
Received: from moonraker.home (10.127.8.14) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 25 Mar 2026 12:26:30 -0700
From: Jon Hunter <jonathanh@nvidia.com>
To: Thierry Reding <thierry.reding@gmail.com>
CC: <linux-tegra@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 07/10] soc/tegra: pmc: Add Tegra264 wake events
Date: Wed, 25 Mar 2026 19:25:57 +0000
Message-ID: <20260325192601.239554-8-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260325192601.239554-1-jonathanh@nvidia.com>
References: <20260325192601.239554-1-jonathanh@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FB:EE_|SJ1PR12MB6291:EE_
X-MS-Office365-Filtering-Correlation-Id: c7adb6ef-3984-4336-4cee-08de8aa4770a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	sB/6bihJFCf9t2ZRO3g98XESdop+LlMO+jjigNceCxv9lCMWFBzS5U2+JaDbms9eAFaKN2Iqxd1PC1hkJ2IvpBgbPc96GSKI4D07WoCb2b7uPqcBjDhrYFnYCiS0wyRcgoagvjpSEDZl3iS1mhTW5YnGS/a/GKTx0ZN30SqIfU01/v6w9wSf90LIkA6sBhaP4/5lqym0QkGTkaL5t95qIEx52JAaEYP/VOVx6pAzU0yKbnIfLx3j4GJWn6noBNhDuFZ0qq3wNiDqAKfigtE459/mOiiKRKLARSvUY4XExnsUtrvoWHrV8pE9fkY2EZ4CsIP24qz+iJ8zggkNNbJAXlciLljGUuq9jEtPwHthgFlvOXXdb8gO/g8SS/hE1dZkcKddxMICCJvjx0lgiJKHu4RUZWJ3kueG2g7LMGoWVcvoE02Wj0OjxKS91w+XrVKAjXY/6qxXMwR9nFgtO4iAWBVphZlC+mFCAvyZgbj2aRmId8MWkUzStjuP9lZc+8Gbb4zSZDnK/5bQoLkxWxNgzraFtXnNnyPOUJdXEiM5RSRIDa/Jq5bglTrnCIv74cHTYyNOxgEsXq7WaV9/HGFzWQGaDpCKl+N/bOnxQcB2vQIzaQCUgsWotCi8nRgyUSC5kFp8KjvpXEVdLKyBCef0c7O3q312mdOU2vw7/aF9UfELkVr7XoxlaRKssvUJ9N1Q+xatkxT++4NFUQSs/YmRDkKc9Hr3NqJ/WFEJuGOHOQnFEFHFGsWxzReanJW5ll1twruANxFT/xbhiuUFp1wWuQ==
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	M9wLIKG918Fg6EDVhW4R9TOfodlUNe5a5ZBPuukb/tOszQqh0cuvKvWUoDMF97yQ25BTl3f6JcDfhkjrUt5BBVb0WSzShvqCawUKR92F/DG9xQQnQgNt5jPz+c30hC1GRJpE/7bM4BVxFgN46qc4bAM7kAaEUGB8WBNBv+HRjW0otYdrLdFPkXWq9CQRJX3jT5TBBlMXhjX8o/hB6sbAopCy3ougyG7L10w/ZUVshU8KTibVgsJzG+65HiPKh7QlMlWmnMPuxshFQov9gZ6jtz84qzlm2Hk89Ep8CKRmOX1z989PIYf/tswbLopRFlV124BVRzwKT+Qb+HRgqiI6lI1jaEd4Sw1oKKLdErv2EnxYRxo6SkHPu0FUQlBVWSEVGyAy6DUmdJXzhqOvkhd1KtsTB+JXIDYjo+hB49O6GJPWJamWwbHIMn/lD6CP7554
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 19:26:50.7764
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7adb6ef-3984-4336-4cee-08de8aa4770a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0FB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6291

Populate the various wake events for the Tegra264 device.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 7a5262705d69..3899d8c76569 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -60,6 +60,7 @@
 #include <dt-bindings/gpio/tegra186-gpio.h>
 #include <dt-bindings/gpio/tegra194-gpio.h>
 #include <dt-bindings/gpio/tegra234-gpio.h>
+#include <dt-bindings/gpio/nvidia,tegra264-gpio.h>
 #include <dt-bindings/soc/tegra-pmc.h>
 
 #define PMC_CNTRL			0x0
@@ -4639,6 +4640,16 @@ static const char * const tegra264_reset_sources[] = {
 };
 
 static const struct tegra_wake_event tegra264_wake_events[] = {
+	TEGRA_WAKE_IRQ("pmu", 0, 727),
+	TEGRA_WAKE_GPIO("power", 5, 1, TEGRA264_AON_GPIO(AA, 5)),
+	TEGRA_WAKE_IRQ("rtc", 65, 548),
+	TEGRA_WAKE_IRQ("usb3-port-0", 79, 965),
+	TEGRA_WAKE_IRQ("usb3-port-1", 80, 965),
+	TEGRA_WAKE_IRQ("usb3-port-3", 82, 965),
+	TEGRA_WAKE_IRQ("usb2-port-0", 83, 965),
+	TEGRA_WAKE_IRQ("usb2-port-1", 84, 965),
+	TEGRA_WAKE_IRQ("usb2-port-2", 85, 965),
+	TEGRA_WAKE_IRQ("usb2-port-3", 86, 965),
 };
 
 static const struct tegra_pmc_soc tegra264_pmc_soc = {
-- 
2.43.0

