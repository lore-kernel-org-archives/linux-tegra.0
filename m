Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012035.outbound.protection.outlook.com [40.107.209.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2AD194AE6;
	Wed, 27 May 2026 14:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779890533; cv=fail; b=Q3w5oXMO9AiAENpkhxKAuVMX5yvglqoRiBtBM2FSEzvIJ7kcwZZX6Reafd4GWujAe0YwokMizDf+BSNQsZEedR/d2r2XxMTS2gVlj2kQ3K2GtxboRcnz/Q/CkR1yKXeLzk2IBNVBpPc/ShfhGonRfyNCE98Nj4QLjU8uUUzlycY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779890533; c=relaxed/simple;
	bh=/oXQ/iFHQC9SFN4qVZViHEy8bV5LmrwU5IToWq9Y3tg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aF2E6WIBZFGR64kPtLAsCezMyRgx/3HDN0lq9n6f29P3Rsl0lXwEeAjHMc5vdIaiF8VjRHBmiiurGS/MTUGDwQ517kAO1ZzbCuXlzaYgLa3k0o87rV//AUhU0llpaGfRb9kCeM29thVKRB4dX3X5vkGyiSQit3awnqFoRHiCds8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=NewHmkO3; arc=fail smtp.client-ip=40.107.209.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="NewHmkO3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zNoR7yvofE8yTxUr+cECbys/HuGv5ZMaNlKwxZKe/2keSc7n8xwTkxJbT6KOMg+YHgK7grbZy/eb9YeM7SVnTYlkq26xKAi/E1RQBTLzm80VFvvBcfhFFZVDACZeab3X+kx8iF5gxGokQIH/OigBhj/V2QKrx6i9QeOoNPOiHDk3Z+qLnpYCRVfbSUvlC3YhM6+pLGyprwmEwZzWA/4Rl1kfkpnCm4UPbCOftF+Jr2S2XDljNB9Oec3C9/BOq++qcxRD+KXsiGaTv2SkLbHctc/UZTRQlU4O75HWYJEzguI/mKAylCTHMYgkYgzLH4aOE3fIC1ahgy6m9SzASMH8yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cEedZOPL8tkUxsVn0xrRwcgIRlOnDA1ySfbqRhMcQQA=;
 b=mGHcNMBQ5+1KNAgeQz+t/23AChIJ3fhC6J4gDA5IzQZ6Yt36y8poodb5JkQbTYkK5NsBJXxiQbF1TP8a8HzEuUQzOyAImr85nDU1tpop+wk7DgcQnzea31A9Zi20KasYUcjA6yv3KbOLomBakiZlsc0iHri5Tu/7ylipsF7aEaHfGtKtHNTmnb1brvFjBWCaA4bHvoT8CAKysrC3USu9NtMjypethazJvMlOZrSbPrl8vdDz8KviTutHd+JzDQgdOB4BeTtKhqsiW+Utx4EVKwnKgqNLLBEkpw0SLNmmWzKPJFYe6fdT7oo5gRn+lA0pdcVX6SQ7NzD8kTjA05X5pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cEedZOPL8tkUxsVn0xrRwcgIRlOnDA1ySfbqRhMcQQA=;
 b=NewHmkO3MQX1cBQOesnEqC7AExRZHYfxLEcV5Ycwx3FPG2DE4phvijdEo4XWFgSj5Q9IBsY2HnLT9+krGCvlTrZg52CFF30So1VSoGSCGS2c12Z4AGVIzHKIuhDwYUDbFJBDGJILwxQ2mOT66Tj/1ONHxooblqUxQw2jvzET7CZ4bc7Y0X3+Pg79f4BJ2jB2kVnE41XTQ51ID8UDX/bREKHPwoeYAaHaYhesc8pmUwcIUdcoGIIG3yZ5ZpKa+DkLvH5gMrRSDRez36keZhOqoyoxCjT8omLuP/6TAG5/eMQSWleoyF2HRg0/+7DRTn+jvJlGjmUAXyvgwziJpDEU7Q==
Received: from SJ0PR03CA0110.namprd03.prod.outlook.com (2603:10b6:a03:333::25)
 by DM4PR12MB5769.namprd12.prod.outlook.com (2603:10b6:8:60::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.20; Wed, 27 May 2026 14:02:02 +0000
Received: from CO1PEPF000075EF.namprd03.prod.outlook.com
 (2603:10b6:a03:333:cafe::7e) by SJ0PR03CA0110.outlook.office365.com
 (2603:10b6:a03:333::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.12 via Frontend Transport; Wed, 27
 May 2026 14:02:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CO1PEPF000075EF.mail.protection.outlook.com (10.167.249.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Wed, 27 May 2026 14:02:01 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 27 May
 2026 07:01:42 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 27 May 2026 07:01:41 -0700
Received: from sumitg-l4t.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 27 May 2026 07:01:39 -0700
From: Sumit Gupta <sumitg@nvidia.com>
To: <krzk@kernel.org>, <treding@nvidia.com>, <jonathanh@nvidia.com>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>
CC: <bbasu@nvidia.com>, <sumitg@nvidia.com>
Subject: [PATCH 2/3] memory: tegra264: drop redundant tegra264_mc_icc_aggregate()
Date: Wed, 27 May 2026 19:31:26 +0530
Message-ID: <20260527140127.49172-3-sumitg@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260527140127.49172-1-sumitg@nvidia.com>
References: <20260527140127.49172-1-sumitg@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000075EF:EE_|DM4PR12MB5769:EE_
X-MS-Office365-Filtering-Correlation-Id: f2cb298c-2970-4719-5bc8-08debbf886a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|22082099003|18002099003|56012099006|11063799006|5023799004;
X-Microsoft-Antispam-Message-Info:
	O63tti//A2wog5CG//8eH+jPOJ+PQkw4T1XJMLlOD31aHGrtGFoedkxg/0RH9B+rU/L1qni7mls9J3XLoUwCt24wOMsiUpZ6900fCtaOwf+mOKGM8TU+Ie8x9X1RJJQejV3AKoEwLzpkqN0RxrW3NZNV7TJZ2HKHPYessig9Bg4my5MH/TABrW44VwcpaqQ7bm34gQERPokezmMudV4XIMPOfjPVw+A7gEtna0TUWudPSAAsJqQ/uNJXAcN7PyZCxqtd3NbcS/JwoLE2J6k7eXSUyd8DBrAAIeBdac9Z4wWschKWbIJgwKiGfaXccQpAtlTdo/Oit6v3rh4H29SS2+VnOiwLhmNzWjbs0KpFwh1H26tRMCdv2LvwpzHcKf2xeE4k6kO8x9IZOykXMUiS35ZJtPj0rO5/Lyfc3HbMTOEMVL0fE0O+Z+UWVAb+rLLtmonaCAMLaSe7ugoVanKwcXR9Fzogl5UXLQ5HXi/MFC8E09azYa0RIM17CimJcMMkMVdLjq8H5SekWnM+xfynYAX1nGvWYDVaOR7oa++PlBli6+VBpipsRocd5XTLF8yBBNMBpnktA0Pn47mKgxvfmvnn9RggnERm1DjyUthojl0b/wcyR75jwEItUB+oCUMu4VVBm3m/dhXc2sNJyaZePwvgRUUQRNVJyOiQabwaFjwcPZT7V8GKOhtkxS7A4hheKz+EgCkBy2T8o/MIwjgUEKU5v5Gw7XrthpPU9l+9iCM=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(22082099003)(18002099003)(56012099006)(11063799006)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qWqajmUA5s5F50U+SVforVGQSiAnRdaQJq7keQ7huvuAWGxrB2dpgjop4iG7s8JfeZcS9Jd9pruKd/e6Ngj8eZuQJwAwArnBZajgGycVM71rC+bn9qf0VIruREIQpaD5Eus/UovEQPk/nAgfMPh5UO5ncdLTsocpuHDjY+5FdOuNHAppYeyCr/qnaJb3Semzj+UBe/WWKT178FXKpMP1mD77F/uk0J7Qyw96xMkF6OU5JZ1hDMSWHdcXVul9kBeQYfe93LvjiP1tjO9xKvHOuLFKJjeE6tiDF4KVZQEYqxo/wbfOV4ynu6liqTW/R+9JSwJed/iiEbTxJbLkZzo3BpdtbAU3XYmoc+xT4JbtmJ7GB7g8GphnKoGzc/33E83o3Rr3L/faHBON8GIFIyeRE4bZdApIDVaZRKXevG7RGfKN0At6aC9dbFBOXi7Cdkc4
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 14:02:01.7942
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2cb298c-2970-4719-5bc8-08debbf886a9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075EF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5769

tegra264_mc_icc_aggregate() does nothing on top of icc_std_aggregate
except an early return on !mc->bwmgr_mrq_supported.
tegra264_mc_icc_set() already returns early on the same condition,
before reading any of the aggregated avg_bw / peak_bw values.  This
makes the early return in aggregate() redundant.  So, set
tegra264_mc_icc_ops.aggregate to icc_std_aggregate and drop the
helper.

Reported-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
---
 drivers/memory/tegra/tegra264.c | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

diff --git a/drivers/memory/tegra/tegra264.c b/drivers/memory/tegra/tegra264.c
index e43ef14da1ee..bad7d61165b0 100644
--- a/drivers/memory/tegra/tegra264.c
+++ b/drivers/memory/tegra/tegra264.c
@@ -295,21 +295,6 @@ static int tegra264_mc_icc_set(struct icc_node *src, struct icc_node *dst)
 	return ret;
 }
 
-static int tegra264_mc_icc_aggregate(struct icc_node *node, u32 tag, u32 avg_bw,
-				     u32 peak_bw, u32 *agg_avg, u32 *agg_peak)
-{
-	struct icc_provider *p = node->provider;
-	struct tegra_mc *mc = icc_provider_to_tegra_mc(p);
-
-	if (!mc->bwmgr_mrq_supported)
-		return 0;
-
-	*agg_avg += avg_bw;
-	*agg_peak = max(*agg_peak, peak_bw);
-
-	return 0;
-}
-
 static int tegra264_mc_icc_get_init_bw(struct icc_node *node, u32 *avg, u32 *peak)
 {
 	*avg = 0;
@@ -626,7 +611,7 @@ static const irq_handler_t tegra264_mc_irq_handlers[8] = {
 
 static const struct tegra_mc_icc_ops tegra264_mc_icc_ops = {
 	.xlate = tegra_mc_icc_xlate,
-	.aggregate = tegra264_mc_icc_aggregate,
+	.aggregate = icc_std_aggregate,
 	.get_bw = tegra264_mc_icc_get_init_bw,
 	.set = tegra264_mc_icc_set,
 };
-- 
2.34.1

