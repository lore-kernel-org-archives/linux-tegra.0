Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012022.outbound.protection.outlook.com [40.107.200.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9388E39B4BF;
	Mon, 31 Aug 2026 18:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788202776; cv=fail; b=CTyCwx7+yooPXlpGGgZZsXElrdbCpp23Y1tHakVHd89L83zfv6UYKJbZACQbYS1GNvcfSSXi74cfFtiqIIO3I6WP9Bws1Q7hwL+CHzB6Y09TkI02yYjJR4jF8/c+XgEN1rYIbgKQvJ8hPzWskrVkIdEd/WDuNAz4lSnWBxXxWh0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788202776; c=relaxed/simple;
	bh=5xd2tEU6QfaqKb0ZmONLW8Oaip0x1lVdptzyBpfUTUg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sVEuGjCgBb9WJd8MbfxDmckzsjEB49OCScvvLloye2xhITeGY9wiuqBx2NGsvHAlKk1YYk//Kw74nyQo1gXJdEjBL+96Xq9E3UC6djqSGhMlmM+PZesDsHAo5Ie2W9gk2v2kMn+0gkiT6hDFyV8PrQQLygw3+QMdqO5Qf6OocHE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=n/4BJxJA; arc=fail smtp.client-ip=40.107.200.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="n/4BJxJA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lj0QGTO4ogxUh4DuTG0DywWpDBgTLqV5npaOJl5RNH5OuLnZ1Yeo3QiDx46u3atAqOI9w0+CjEj7WqOmpvmwDUQ+aNu95glRfVTYBpAoj+wN15FnMSE931KvOL7r35MKto4OjFWbTpFOJySJ9WJrohk3IqX0MDQ17qBWoJ8OTGURHcrKL9zqo023+f7r0KywelGmpJZxR3QwGAHVm1sis0AO/irTOD7Bn6Ei+5whIorlzc9Gd13j6tlSD3VFhUWaxEEc6BMcEuGvjvSNYFP976hOLAPWyiO0CxNeWQ2xt64sCuRquzcQ3wKJzKDAPgpPSIuan8tEPPhUOO5/N5ntcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hkWz2FhvhAV0VHF6Yo5SMLSewUq6fAWDCzYlvu6ZChs=;
 b=T/cL8PscIXUkdkODLGi3dPhZo8lrerBsUyIQGEZ15pgXvY1Uj/mK9O4NkT0tMVcw8OhGsVpRB3THTu2GolIIylJDqy0cbGXoYa2OrgsXKIriNUAG89Wsv5EwoxWgDrwQJeg7o/P3u8qEHF52A+8k+676lKCGBYjedGftI6TuxnncdlgHvfiX4BUYI3zCQZRYc9pAG5AiJl9FdJFtizK1xIePED8K/XP6O0gqtByiJpXWPZWMdbRj09yGfdyP6xvlZkYz1A9t/1xuVxZoaqjwVJ0zvBjYhL+qADbFK8nLtrhl5oe+d0cYOTXcUXApmR+p0XJOWmTcYfV6HH53LlIwRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hkWz2FhvhAV0VHF6Yo5SMLSewUq6fAWDCzYlvu6ZChs=;
 b=n/4BJxJAyeWdjp5VNQyqosGdE9YizZYWZdWZgQRkuHLAHv7tJFmwSZ1Cofh2Xzl9d+Mfcg5J5yIZ2jWMoAyJxntx+9NiSF1ErIuFoZ/DeCuYuJr7x4jdFItiw2Q5GkKWG4SLNL5PQH3WtY+JLN/fCTNpCb8sKYvDpKQh4Lx2GE+DTGYRZYMEEFMn1708kteFNgiHgBJ0l5qZ6gz40eq7hUfegtfj70UPk0qbiiCU8ZagsmDuEo6z9fKaLAxqWdr612OeTa6GL9SVDhbP3h1Od0YtCGMQ0bQgslHfcD0J3PJZOIXiwCIX+PODWqTMnLAYAPe2nxwTbr32WadFINuuQw==
Received: from BN9PR03CA0478.namprd03.prod.outlook.com (2603:10b6:408:139::33)
 by PH0PR12MB7096.namprd12.prod.outlook.com (2603:10b6:510:21d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 18:59:28 +0000
Received: from BN6PEPF0000006F.namprd03.prod.outlook.com
 (2603:10b6:408:139:cafe::a5) by BN9PR03CA0478.outlook.office365.com
 (2603:10b6:408:139::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Mon,
 31 Aug 2026 18:59:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN6PEPF0000006F.mail.protection.outlook.com (10.167.248.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Mon, 31 Aug 2026 18:59:28 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 31 Aug
 2026 11:58:58 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 31 Aug
 2026 11:58:58 -0700
Received: from waynec-Precision-5760.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.46 via
 Frontend Transport; Mon, 31 Aug 2026 11:58:55 -0700
From: Wayne Chang <waynec@nvidia.com>
To: <mathias.nyman@intel.com>, <vkoul@kernel.org>,
	<neil.armstrong@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <gregkh@linuxfoundation.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>
CC: <waynec@nvidia.com>, <linux-usb@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>, Sing-Han Chen
	<singhanc@nvidia.com>
Subject: [PATCH V2 4/8] phy: tegra: xusb: Use devm_clk_get_optional to fetch USB2 tracking clock
Date: Tue, 1 Sep 2026 02:58:31 +0800
Message-ID: <20260831185835.3732707-5-waynec@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260831185835.3732707-1-waynec@nvidia.com>
References: <20260831185835.3732707-1-waynec@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN6PEPF0000006F:EE_|PH0PR12MB7096:EE_
X-MS-Office365-Filtering-Correlation-Id: c3afc5cb-cadb-4ce0-f31d-08df0791fbca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|7416014|376014|1800799024|56012099006|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	QtT9F8Gj3u2raRJdsEjtZ3VE8aRkHDxuPqdDjEK9c0d/qbQjmaXZQelejUmBRGMZ9d2LJgP9sz8SjT3s9agOCe4GYRhOGF6rf9lfAAAa80H4n+d572vfm34hcG32XEAhZv417OfI9O8ZpYJjKBXRHTgBtjFk1owX9BIy1gMVCxZ/RXUPVNU/KFE9D5COZOvyP+41bPxORE/q84U3pKRfn40RpRMCwBEPqYpqsln/10gsIQOEeoE0m0sVjcUxovSOx6MwUfGkcygajwlDVs6Cyor1kRmAyMQUAT7OKCLSOOb8tZNUWIepve+FQQrTO6QHDt8GbMz10j547kzX2RuEplyZl/zUbmXyLu5lq4ng5/xh5gNZv+gs0Ug9HIDMmTPUD4eA6j1x7nALGqPohJkLxa97hGtPBYTuQHr5YIvH/cj8RMFnL+VE5JuADZPnKXfZORe3D6YS3PRnAknHstX95gjcjrF9pTNhvMgz0UX2UMB/NCUX588pGMNdYza/77kLv6AtWrLYl0envlyEEXJnYN7ljE3LDQ573w3wXrOTGdnVknpuqpK8yHkDBsxptbt/cBooPk7WoaI1AKXG2IMUC3/cYXGhd+bMYPABqkJ1p9PclWYVVzMu4XyzwQn4u0VHbwL6XCqYlM1UoGddYDky/ZVNuaVuRSctmZ5rtZpF0zHehZpppwaDHywY8ceLdiEb5rjCKZ9qDT6lHK1p/CUSKQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(7416014)(376014)(1800799024)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	nybagPHKBOMncBiWje1LKzWvIkiV272KwdJTCITuW0jN2MGRFQmAjw5OWi00I04RHNTLGHc8Ie0OpIGLDYuGSANaF011vKsNdkeHX9/zVemrQ8yyNOMPBJ5/xZgwih14x1RqHixfyCmUUgRvmKjFT7VFsc/raHUxxyvCS2QqkOApoVorEkPIZDeeo/BMcYqZsrs2IuR3bT8ZpsxvqBja8VajxY3Jh/BdsRC1KJEkfcVcjSqJC3ZF0ekd1HH10rkhrJueBJhdyX1Jx3sAkmFjIFmr5PLaJTMhyEK5qSsBQ/Yyre0WvmTq6YoGJy14VUQpv7ZjQnK+vZPL+6WBZQkM/e8KTPxieLTQkEe/AMh/rjc5brOeA6v59elvUZ9amQiDaJe7247v9xaNlABBxVf3lD/MLu3i+ndC53rkkYBQ9vactzVveTXU4qIA6xTXzKOB
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 18:59:28.4089
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3afc5cb-cadb-4ce0-f31d-08df0791fbca
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN6PEPF0000006F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7096

From: Sing-Han Chen <singhanc@nvidia.com>

The USB2 PAD tracking clock is an optional clock so use
devm_clk_get_optional() so a missing clock in devicetree is
represented as NULL and probe can continue. clk_prepare_enable()
and clk_disable_unprepare() already treat a NULL clock as a no-op.

Signed-off-by: Sing-Han Chen <singhanc@nvidia.com>
Signed-off-by: Wayne Chang <waynec@nvidia.com>
---
V1 -> V2: No change
 drivers/phy/tegra/xusb-tegra186.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/tegra/xusb-tegra186.c b/drivers/phy/tegra/xusb-tegra186.c
index 60156aea2707..800be0cbb3f9 100644
--- a/drivers/phy/tegra/xusb-tegra186.c
+++ b/drivers/phy/tegra/xusb-tegra186.c
@@ -1045,7 +1045,7 @@ tegra186_usb2_pad_probe(struct tegra_xusb_padctl *padctl,
 		goto out;
 	}
 
-	priv->usb2_trk_clk = devm_clk_get(&pad->dev, "trk");
+	priv->usb2_trk_clk = devm_clk_get_optional(&pad->dev, "trk");
 	if (IS_ERR(priv->usb2_trk_clk)) {
 		err = PTR_ERR(priv->usb2_trk_clk);
 		dev_dbg(&pad->dev, "failed to get usb2 trk clock: %d\n", err);
-- 
2.25.1

