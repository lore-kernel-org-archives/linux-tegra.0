Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010031.outbound.protection.outlook.com [52.101.85.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1E3350D7F
	for <linux-tegra@vger.kernel.org>; Wed, 25 Mar 2026 19:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774466820; cv=fail; b=KB+Xz9Gmsvp8xAm0lEu3A3nCN5oJheOJ70Wr0ByJDhAub3V9Hf3w8pS+2xCdn5Swgjsh6mdMPl2lzpDMNISqA7BIABpwvC/QzYdLoOn23kYcNhNFiZdvMasrwH/4M8VC3qhIhPf0O5cUCUhdNs3csT6fymJoTR0iJf3prUdjsMM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774466820; c=relaxed/simple;
	bh=yBEr1mBvz/ibFfObpu+VsGuMvlpA876rr5xI2HJ8QcA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ut7ucAQUgXXerTw+NjYfbnAViXffwwe5aOONKRjfVhJYw0Js1lpeTtQHvdCkKPHgQR/mwM27bt91owv/j42oFnyy+eZ9MWqfCK8mqWn8OvNuWm4Uz6vpd8/PGPHFRXUAoau9Qe2F6m/W8Dh06nZTPED0qjHWxW6E8+QeXdA4S24=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=W1Z/fBf6; arc=fail smtp.client-ip=52.101.85.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="W1Z/fBf6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nim3mmqcN8UZMFRoZFnYv2AJ5bl4jvyxXHQFN51nH8AyOOzXx3RSWY7F6A0S0LYDZnrO2fYAjwP3AqFRfPBndlZSngL1zB8pl8ly/qyXHEVmSrdRRtuEPN22sIUNnbTDVu2wxhmTVBH/ceGB0WAmiYKbEJGdL5ZWbGDRLHX2OSolck6CUbtYVQMYdwYIT3b3qCTzKhJKJhw7qtiqN0DlKrmmmqdtDesApYDqO/42VXQhkcvuASwR95aN/77DwVjEgVjwS6iOZ0dda1H7eyPx137hl14FfrXumG7tyUzx7R9mO486RknWdafqzs8UQWGGgLQFJKOghjBLbCEVO/nb7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ESaf07iqqBD5vjzuMSLUGh1NWmMX6eCSaK0Zuct2TDg=;
 b=NvAg9JKLLUqWQyWhsFO1vvrD3EPhLkb+ko5vmI9fybU4su9TtqRctTnn4x9yUfehL3kKP7XHqYYTHYQcOqpmpJZM8Rb4x1POENk7MoWH36CZR+TqFhgrsC1vZGiphHF9diuK6LDaqDH0HQPIuRv49WGYxnt/Sytbd2lOnaZEAZts+7rQ3iriN6lkfu8U0lAAEnjnRimuuufN1Bzvl2OHFgok0qD5WrAjie8GzDHwJs6tMQ0qejI54dQJrwcfuDZub2Lfi1IYGhl7gFYMxWkjRtm8e4WynMzG1ptLqbVu28IJypNPvNeApawgjgcP/Myqwg64ARknqpWf5kIovmYrJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ESaf07iqqBD5vjzuMSLUGh1NWmMX6eCSaK0Zuct2TDg=;
 b=W1Z/fBf6Ghp9K9hWv+tXKIlwdbSrx5qNrv7/kxp66mmhKRgBWxvPtKR/yweM1wyII6PlvuZVx3GzrfjqTOCASvFdhN3/HHV5T+h2fKOtwBsAfPaHtGinn5BpsmTZ4DVh4s+MO/SgCKH+2Y9+2CNYDHGo/UZ2uxlJ+zmpYXSefzfgLszV2fMc1sdEHbeJJRz/47HT0fIoKRM4dd4bG1Dr7D3N43YG5tH1w8/Eu5D+w5u0yLjBCOdE685naVnVuQKL1Mix+4S8ICyXDGU/Jznrerz7koq87qa0EwOZQZub4ZCTNSu8NiTghMunS1l8QRbJyW7GbE9gnPdQHqWfVXFsgQ==
Received: from BN0PR02CA0002.namprd02.prod.outlook.com (2603:10b6:408:e4::7)
 by LV2PR12MB5943.namprd12.prod.outlook.com (2603:10b6:408:170::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 19:26:52 +0000
Received: from BL6PEPF0001AB4F.namprd04.prod.outlook.com
 (2603:10b6:408:e4:cafe::65) by BN0PR02CA0002.outlook.office365.com
 (2603:10b6:408:e4::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.32 via Frontend Transport; Wed,
 25 Mar 2026 19:26:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BL6PEPF0001AB4F.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Wed, 25 Mar 2026 19:26:52 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Mar
 2026 12:26:35 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 25 Mar 2026 12:26:35 -0700
Received: from moonraker.home (10.127.8.14) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 25 Mar 2026 12:26:34 -0700
From: Jon Hunter <jonathanh@nvidia.com>
To: Thierry Reding <thierry.reding@gmail.com>
CC: <linux-tegra@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 09/10] soc/tegra: pmc: Rename has_impl_33v_pwr flag
Date: Wed, 25 Mar 2026 19:25:59 +0000
Message-ID: <20260325192601.239554-10-jonathanh@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4F:EE_|LV2PR12MB5943:EE_
X-MS-Office365-Filtering-Correlation-Id: 65fe81c6-11fc-4b92-aa6a-08de8aa477e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	o7Yxnn5CJshQbtle/xfpwcBZl/v+NcIUkcOHBQyKul2ZH0YlAnMJxfzYtmZE0BqUosbpS+wVUkRXAvENfMFVApMDO+HtYe/uOS8XaRl8H4s1BbQ3jX0Iid5fHvZ87o7ZvYCwRd/QMd2UGV4MSSnLtVLwkuGYwOvlKlbKek0X9qgMx5n0/kyGImYLXR9VwkDkGzuqKDS5J+gwkXJpwW9USaw0Koq+Hl52K53HI/a/3vNPXk5bZcTvxzH6AkZ8324HbBrFhwvVIH1EFDZFtt8hnceQ9zjLmIdocjzVKFAe/BrPh1dAkThpqoSH2uymAIoRhoHhEnajOEEvgHmVqdSlHvfS6erRh03/yaIXpaP9Z+KLAedwWyxbqkkdrqvtZ93MGRVPK+bmefasPwhaUyKfUgRDI/UNSXKdTdE9Cb+sbgZxM9c/6qVR9SJF3IsIaefNAIGOQP3zfmzttkw5+6nk5NGYQSuF7PRqO1KtG/vPfoCgItJ1zpSuyFAOUUhla0e+mN/JJnIg7kMWmC1RQZgpwFyp/rpjYcvEl1epPmcThFBcAkQtPNg9LAneOao0rU0ID7PGgdLJb5+7eldlXK966mOBgAYHrk7zsjRphy2U9z+gVZjksLNhDV0Y/0CnsFwRoert40mZaPobA0+k0eWLe3XmJPmDX5FgPT3nZzFzqJauvWSIhMrZAWxVdhyzF8DATMBHN8/6/fcF924Bk4GQfA/F6f559vGjrHrIgsyuCwXkExgDkpUnXyGpJ9fN3kK49EbBUA0zWa+Sp2OF9jlAdA==
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ORD8Ye/uNkgrVnO1sJSdrThIrIqgZOIkyF/MqKAATAbdHSglidYLBCR0yUf/NYmRL10bRzjDLGgm+LgyBvY3HqPw9NAS+NBKKwGxe2akKLi8EP+Z1Fww+tyqzIQugfzIhssev6T9aAJMmqLH9R/+PFErzuqtsn3nyzNNpFEZXlHSBYRJ7sOrFnb5+aUVCkeqVIjBVD8W6qTIq7OPfm1pEiVS00yCLcUwZz0GAa3vCt653wRLPjQWDnTxHNGmmO82jPQPGapchWk6YUPELDFGgFzUH026eWhxQz/VH0x+4ejVZ3WEB3Om6f7frhzUD8ZUnPbcBvBtuciJ6wPEYC5gHQuXaqpUI3ZweEOALNuh+TxD95Y/Xv2Rjpti2VwrAYTdaMZte561VWEN04S7L+5kRdy9UfQd6PwI0bKEszaUSxhcLqvN/m20qEz+HRltcXTU
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 19:26:52.1800
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65fe81c6-11fc-4b92-aa6a-08de8aa477e3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB4F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5943

The flag 'has_impl_33v_pwr' is now only used to determine if we need to
set the write-enable bit before we can set the bit to select if 3.3V IO
is used or not. Therefore, rename the flag to 'has_io_pad_wren' to
indicate that the SoC supports the write-enable register.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 3dcc679baffa..6f0808faf4b5 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -372,7 +372,7 @@ struct tegra_pmc_soc {
 	bool has_tsense_reset;
 	bool has_gpu_clamps;
 	bool needs_mbist_war;
-	bool has_impl_33v_pwr;
+	bool has_io_pad_wren;
 	bool maybe_tz_only;
 
 	const struct tegra_io_pad_soc *io_pads;
@@ -1922,7 +1922,7 @@ static int tegra_io_pad_set_voltage(struct tegra_pmc *pmc, enum tegra_io_pad id,
 
 	mutex_lock(&pmc->powergates_lock);
 
-	if (!pmc->soc->has_impl_33v_pwr) {
+	if (pmc->soc->has_io_pad_wren) {
 		/* write-enable PMC_PWR_DET_VALUE[pad->ena_3v3] */
 		value = tegra_pmc_readl(pmc, PMC_PWR_DET);
 		value |= BIT(pad->ena_3v3);
@@ -3536,7 +3536,7 @@ static const struct tegra_pmc_soc tegra20_pmc_soc = {
 	.has_tsense_reset = false,
 	.has_gpu_clamps = false,
 	.needs_mbist_war = false,
-	.has_impl_33v_pwr = false,
+	.has_io_pad_wren = true,
 	.maybe_tz_only = false,
 	.num_io_pads = 0,
 	.io_pads = NULL,
@@ -3598,7 +3598,7 @@ static const struct tegra_pmc_soc tegra30_pmc_soc = {
 	.has_tsense_reset = true,
 	.has_gpu_clamps = false,
 	.needs_mbist_war = false,
-	.has_impl_33v_pwr = false,
+	.has_io_pad_wren = true,
 	.maybe_tz_only = false,
 	.num_io_pads = 0,
 	.io_pads = NULL,
@@ -3656,7 +3656,7 @@ static const struct tegra_pmc_soc tegra114_pmc_soc = {
 	.has_tsense_reset = true,
 	.has_gpu_clamps = false,
 	.needs_mbist_war = false,
-	.has_impl_33v_pwr = false,
+	.has_io_pad_wren = true,
 	.maybe_tz_only = false,
 	.num_io_pads = 0,
 	.io_pads = NULL,
@@ -3807,7 +3807,7 @@ static const struct tegra_pmc_soc tegra124_pmc_soc = {
 	.has_tsense_reset = true,
 	.has_gpu_clamps = true,
 	.needs_mbist_war = false,
-	.has_impl_33v_pwr = false,
+	.has_io_pad_wren = true,
 	.maybe_tz_only = false,
 	.num_io_pads = ARRAY_SIZE(tegra124_io_pads),
 	.io_pads = tegra124_io_pads,
@@ -3981,7 +3981,7 @@ static const struct tegra_pmc_soc tegra210_pmc_soc = {
 	.has_tsense_reset = true,
 	.has_gpu_clamps = true,
 	.needs_mbist_war = true,
-	.has_impl_33v_pwr = false,
+	.has_io_pad_wren = true,
 	.maybe_tz_only = true,
 	.num_io_pads = ARRAY_SIZE(tegra210_io_pads),
 	.io_pads = tegra210_io_pads,
@@ -4195,7 +4195,7 @@ static const struct tegra_pmc_soc tegra186_pmc_soc = {
 	.has_tsense_reset = false,
 	.has_gpu_clamps = false,
 	.needs_mbist_war = false,
-	.has_impl_33v_pwr = true,
+	.has_io_pad_wren = false,
 	.maybe_tz_only = false,
 	.num_io_pads = ARRAY_SIZE(tegra186_io_pads),
 	.io_pads = tegra186_io_pads,
@@ -4399,7 +4399,7 @@ static const struct tegra_pmc_soc tegra194_pmc_soc = {
 	.has_tsense_reset = false,
 	.has_gpu_clamps = false,
 	.needs_mbist_war = false,
-	.has_impl_33v_pwr = true,
+	.has_io_pad_wren = false,
 	.maybe_tz_only = false,
 	.num_io_pads = ARRAY_SIZE(tegra194_io_pads),
 	.io_pads = tegra194_io_pads,
@@ -4555,7 +4555,7 @@ static const struct tegra_pmc_soc tegra234_pmc_soc = {
 	.has_tsense_reset = false,
 	.has_gpu_clamps = false,
 	.needs_mbist_war = false,
-	.has_impl_33v_pwr = true,
+	.has_io_pad_wren = false,
 	.maybe_tz_only = false,
 	.num_io_pads = ARRAY_SIZE(tegra234_io_pads),
 	.io_pads = tegra234_io_pads,
@@ -4704,7 +4704,7 @@ static const struct tegra_wake_event tegra264_wake_events[] = {
 };
 
 static const struct tegra_pmc_soc tegra264_pmc_soc = {
-	.has_impl_33v_pwr = true,
+	.has_io_pad_wren = false,
 	.regs = &tegra264_pmc_regs,
 	.init = tegra186_pmc_init,
 	.setup_irq_polarity = tegra186_pmc_setup_irq_polarity,
-- 
2.43.0

