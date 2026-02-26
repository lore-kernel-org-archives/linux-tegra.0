Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012068.outbound.protection.outlook.com [52.101.43.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B06478865;
	Thu, 26 Feb 2026 16:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772123539; cv=fail; b=T5PKxPQPxOugXE7xPL8Fr2EoWIO10ZH2W4BoO3ijQPwNhw1diOWBba4PMT+T5UDz7Dr2m/uWOlLuJPG9bbuXlWoQqLrxpCLX0/lHi1rg2+d3ztPI5QZJinL7kri7wntTK6J5y/ovJxaLUllEY9+deii9ohlbf7DUQIl4yq6VGwQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772123539; c=relaxed/simple;
	bh=ebN+qWB3//6BzVZsgNIoEkXVTtV+klJsD1DbQHP/rO0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QPmnnlv81dTafw1xBllU0t+ggSyqQlxVvBUiCV9P7sPbTBA05ALYxYf4gQVi+JmG2s10Svi7qWzjAPEBYd5n0qRCbqkWJok9B2/dNpBttHt4AUg1QMZDXo/5a4aFQIVPUg0kNXik97RPrEhJ5rRKBwV4v3oOp5p8J8W2GPgw4qA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Whj7dDAp; arc=fail smtp.client-ip=52.101.43.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Whj7dDAp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hAqLyQ/tNnPSdOysmmWA5/39KA6dlh+cVA197IAF+uLyox1Fk0lojGyWJT+dVRR6FvFtqpbP9OB4Hf2XHFYY5JUX6BRL4z8HvHUUirIEAakxUZMISM+uNcCa7R5YyyPG3xsPaVsAqhnMY5fCtkn/oaiRYatXzRs7VTlM/NZl6CbupAZP4lNOgPWFgHPxXzZlBWIuM/YWk1sFAnIzP2fqKcfP9kR3H756m0TLnPvA0X63KCLBJEwtwBdix0LTuFxC2OPhSiRPNeyiV7nDUPoNMp/LCJ5snrI4Intniz/fsRqs+IKsG3iWnYm3PXX5tc2gypj9kfx46twWC/1AjXz6fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k1SgDJsbHAtujB/mVrfGWeCr5Q8y/CjDOHI5+Vxzodg=;
 b=Ei3kQg/YuOeZlePZBhIjzH0VEX/mZe6+T/3Uc6LTziOqcqaBdEt+MU9i/TpeZF/OYkhd/KZNAc+zVM4mRYXTVjVPGZYtQ/QeUI0KpME7dgaE49M85VacJnVEZXMZS/MIdUpuPrNZS8oSIC18jZZDfDUPpD4bZ15aIeuPhXUjDErJ8yo8F7ZUr/YxIYgmrCqNWcWaZwPhDoRpRI4C2pgab07J8xUf2kOxicwKSZMezWOi4zZKegg+rqPYTOy0quKA9kRiQnnvd4QOU97X8rfvfFBC2qERNSgO9TbBB7LvpJ+A7ds8bJYQ88B0BATm9smGG5kGKW2BdeGjpMp8UX38eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k1SgDJsbHAtujB/mVrfGWeCr5Q8y/CjDOHI5+Vxzodg=;
 b=Whj7dDApIwcuReWa5yU7gHDSftarJ3dzdHQmYbjWpYwdKej8rNt4wCzxjMzUFPlICcQgSaW4ZaPBMN9hbWtak8kVbvAGaUaTvm/0dXR6nGqeaiZEiONY6oA11b1AjDF5QdbjDcIU+kl9XCF0Xt3zRqHYt6bKwRpH1OsYLKYa0eNRFYeL9PPBrqX8uAQjMOYGKKqrtDMR82p7ffNNw1gPl4flwym64KUR1DCr+p0oIsQC1JnaDhiz9wvqSMp2VKUm/OdqV6ljTuYy5hunJtvtD5LCB1B99qsmVMewkBIo5tDIWmicNsoS4clXTXNTe0pZ03padrgHclGZI2sjNp005g==
Received: from BN1PR10CA0006.namprd10.prod.outlook.com (2603:10b6:408:e0::11)
 by SN7PR12MB6669.namprd12.prod.outlook.com (2603:10b6:806:26f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Thu, 26 Feb
 2026 16:32:12 +0000
Received: from BN1PEPF00004688.namprd05.prod.outlook.com
 (2603:10b6:408:e0:cafe::98) by BN1PR10CA0006.outlook.office365.com
 (2603:10b6:408:e0::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.25 via Frontend Transport; Thu,
 26 Feb 2026 16:32:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN1PEPF00004688.mail.protection.outlook.com (10.167.243.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 26 Feb 2026 16:32:12 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Feb
 2026 08:31:44 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Feb
 2026 08:31:43 -0800
Received: from build-ketanp-bionic-20250813.nvidia.com (10.127.8.10) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Thu, 26 Feb 2026 08:31:43 -0800
From: Ketan Patil <ketanp@nvidia.com>
To: <krzk@kernel.org>, <thierry.reding@gmail.com>, <jonathanh@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Ketan Patil
	<ketanp@nvidia.com>
Subject: [PATCH v7 4/6] memory: tegra: Group SoC specific fields
Date: Thu, 26 Feb 2026 16:31:13 +0000
Message-ID: <20260226163115.1152181-5-ketanp@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260226163115.1152181-1-ketanp@nvidia.com>
References: <20260226163115.1152181-1-ketanp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00004688:EE_|SN7PR12MB6669:EE_
X-MS-Office365-Filtering-Correlation-Id: 84d91a2b-1f5b-46b7-1651-08de75549863
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	5BI/9wcgF3bsZPcCnYbbnPmg1vXM/grv90HqOf4hKZJ87mELY8A4/hzHLNVvGFw2BvBqAiphJm2HarJ7TtNMPwHUNyr8Jrbb8IamTJ5898qw2ieNYjyk5THzbVPI/KDN/BaZyh1Jz6xyUQkRa+mCL5E6aZyGtMRB/cHbDAGmo+ByM/674z5QOYZecLIng4P+E/RH2yNzDDQyBx+4uVOOroaelFZYme+1gH1Lfqlm67qKpU0HuneXaE4RxsSVZtkEClHeEngYsLaewN+XMlp7TdmZuuxzAEPzJK/idjLgiBgEFa26uwOc0RbIC4+pRo3/fdwhqo8xQZ1hQHhytKLSBu7tJu+vQpPj0eUQBP/n7kNjcOzh+eDk4Eo9P1qk0Uvn8rpzHlaoEK7URvMRF/gNLLKQuMmDyrBWlhPNg2I6EbljX5H93hZCgwYqnNBxLaScpIqxv7DZvHp/I3u4iJ1RyBMCqqW9aJ1q4GsKHP5fa98d01vtuPsQZIQBGYFXRxgJ3glCDWKkul32oZflMoTOIYfNghnWb0sc8xbhxQvLzSACB4wc5y1FZJ3pP2pda+mA7ca4EZTFxq8MQw+gO0mHNA9wuw1LpvVRmuduX6dz834FI0ymd4n7BXuVLjzduibkgsFDaQW5dXx5Ua1NJCaevmS4uFfdttrxOrSOaVQGHNbTcSXCIdlMXaOm+BX81LofCE79JYVP8SSuo9wiqj1lmONUvZszQj+eltaiAHUkOnq/hwLeBWmGyQGGZPxggxxdzcuJC55EBggaE2g3hIt1pvkmM1g54NztlnWl9+8mJy+iysQkcTqV7o8oks8Go3kGPyZSWNmXHe2bS813nXw8Hg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	YMCLG259bxVuXCApSsv5HLm4FXs/nWOPn/eNTE1N+JdFS2Ugv7RwWqwaR4BeSDBWnhdCL/biBLk0Nwco126s4sqhZ7035c4+I65e+kP2AF+VOhs8ppaY3emezBuxMthdouNFVJQME/Jx78K27KqyMBpzmFLMfrEKQCoQXFOjzgX3HNeD4vy4uhJxhLJLFWr4rD4/3JMSFqj4PC39ug7tnIWa4A1F+JhvQvjHWp7VY5HqZR5nOEyWBvRIZxOUos1LsUDDswmh56Jw/Y5gIsT3DAYR/08Ucoeju9J3Kfrb9u8b3ndm1WtDeGQbBgwcivTGDqjhctR7G8KGzK/Z2oILTQOlzcxICpbIkSfokDwaeTrNPe1JYYSocIQ72PLPCiPCgTVMvG2r9OmnEBlbFteSOk34nzuwfjP5bryUu6kQcgO6WuY01GHnr3dW+0hyvBZ3
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 16:32:12.6020
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84d91a2b-1f5b-46b7-1651-08de75549863
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004688.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6669

Introduce new SoC specific fields in tegra_mc_soc struct for high
address mask and error status type mask because Tegra264 has different
values for these than the existing devices. Error status registers
e.g. MC_ERR_STATUS_0 has few bits which indicate the type of the
error. In order to obtain such type of error from error status
register, we use error status type mask. Similarly, these error status
registers have bits which indicate the higher address bits of the
address responsible for mc error. In order to obtain such higher
address, we use high address mask. Make this change to prepare for
adding MC interrupt support for Tegra264.

Signed-off-by: Ketan Patil <ketanp@nvidia.com>
---
 drivers/memory/tegra/mc.c       | 12 ++++++++----
 drivers/memory/tegra/mc.h       |  2 --
 drivers/memory/tegra/tegra114.c |  1 +
 drivers/memory/tegra/tegra124.c |  4 ++++
 drivers/memory/tegra/tegra186.c |  2 ++
 drivers/memory/tegra/tegra194.c |  2 ++
 drivers/memory/tegra/tegra20.c  |  1 +
 drivers/memory/tegra/tegra210.c |  2 ++
 drivers/memory/tegra/tegra234.c |  2 ++
 drivers/memory/tegra/tegra30.c  |  1 +
 include/soc/tegra/mc.h          |  2 ++
 11 files changed, 25 insertions(+), 6 deletions(-)

diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
index de988c312342..72d967218522 100644
--- a/drivers/memory/tegra/mc.c
+++ b/drivers/memory/tegra/mc.c
@@ -667,9 +667,12 @@ irqreturn_t tegra30_mc_handle_irq(int irq, void *data)
 					addr = mc_ch_readl(mc, channel, addr_hi_reg);
 				else
 					addr = mc_readl(mc, addr_hi_reg);
-			} else {
+			} else if (mc->soc->mc_addr_hi_mask) {
 				addr = ((value >> MC_ERR_STATUS_ADR_HI_SHIFT) &
-					MC_ERR_STATUS_ADR_HI_MASK);
+					mc->soc->mc_addr_hi_mask);
+			} else {
+				dev_err_ratelimited(mc->dev, "Unable to determine high address!");
+				return IRQ_NONE;
 			}
 			addr <<= 32;
 		}
@@ -694,11 +697,12 @@ irqreturn_t tegra30_mc_handle_irq(int irq, void *data)
 			}
 		}
 
-		type = (value & MC_ERR_STATUS_TYPE_MASK) >>
+
+		type = (value & mc->soc->mc_err_status_type_mask) >>
 		       MC_ERR_STATUS_TYPE_SHIFT;
 		desc = tegra_mc_error_names[type];
 
-		switch (value & MC_ERR_STATUS_TYPE_MASK) {
+		switch (value & mc->soc->mc_err_status_type_mask) {
 		case MC_ERR_STATUS_TYPE_INVALID_SMMU_PAGE:
 			perm[0] = ' ';
 			perm[1] = '[';
diff --git a/drivers/memory/tegra/mc.h b/drivers/memory/tegra/mc.h
index 34ce03ebc51c..b286c2558fd5 100644
--- a/drivers/memory/tegra/mc.h
+++ b/drivers/memory/tegra/mc.h
@@ -78,10 +78,8 @@
 
 #define MC_ERR_STATUS_TYPE_SHIFT			28
 #define MC_ERR_STATUS_TYPE_INVALID_SMMU_PAGE		(0x6 << 28)
-#define MC_ERR_STATUS_TYPE_MASK				(0x7 << 28)
 
 #define MC_ERR_STATUS_ADR_HI_SHIFT			20
-#define MC_ERR_STATUS_ADR_HI_MASK			0x3
 
 #define MC_BROADCAST_CHANNEL				~0
 
diff --git a/drivers/memory/tegra/tegra114.c b/drivers/memory/tegra/tegra114.c
index fffb28eea57f..3a061a2d881e 100644
--- a/drivers/memory/tegra/tegra114.c
+++ b/drivers/memory/tegra/tegra114.c
@@ -1117,4 +1117,5 @@ const struct tegra_mc_soc tegra114_mc_soc = {
 	.regs = &tegra20_mc_regs,
 	.handle_irq = tegra30_mc_irq_handlers,
 	.num_interrupts = ARRAY_SIZE(tegra30_mc_irq_handlers),
+	.mc_err_status_type_mask = (0x7 << 28),
 };
diff --git a/drivers/memory/tegra/tegra124.c b/drivers/memory/tegra/tegra124.c
index 2cf733198782..4d394889c1e9 100644
--- a/drivers/memory/tegra/tegra124.c
+++ b/drivers/memory/tegra/tegra124.c
@@ -1278,6 +1278,8 @@ const struct tegra_mc_soc tegra124_mc_soc = {
 	.regs = &tegra20_mc_regs,
 	.handle_irq = tegra30_mc_irq_handlers,
 	.num_interrupts = ARRAY_SIZE(tegra30_mc_irq_handlers),
+	.mc_addr_hi_mask = 0x3,
+	.mc_err_status_type_mask = (0x7 << 28),
 };
 #endif /* CONFIG_ARCH_TEGRA_124_SOC */
 
@@ -1313,5 +1315,7 @@ const struct tegra_mc_soc tegra132_mc_soc = {
 	.regs = &tegra20_mc_regs,
 	.handle_irq = tegra30_mc_irq_handlers,
 	.num_interrupts = ARRAY_SIZE(tegra30_mc_irq_handlers),
+	.mc_addr_hi_mask = 0x3,
+	.mc_err_status_type_mask = (0x7 << 28),
 };
 #endif /* CONFIG_ARCH_TEGRA_132_SOC */
diff --git a/drivers/memory/tegra/tegra186.c b/drivers/memory/tegra/tegra186.c
index eb1eaaffc79a..94cad76c52ac 100644
--- a/drivers/memory/tegra/tegra186.c
+++ b/drivers/memory/tegra/tegra186.c
@@ -916,5 +916,7 @@ const struct tegra_mc_soc tegra186_mc_soc = {
 	.regs = &tegra20_mc_regs,
 	.handle_irq = tegra30_mc_irq_handlers,
 	.num_interrupts = ARRAY_SIZE(tegra30_mc_irq_handlers),
+	.mc_addr_hi_mask = 0x3,
+	.mc_err_status_type_mask = (0x7 << 28),
 };
 #endif
diff --git a/drivers/memory/tegra/tegra194.c b/drivers/memory/tegra/tegra194.c
index cb0e7886857d..38852b2a0f44 100644
--- a/drivers/memory/tegra/tegra194.c
+++ b/drivers/memory/tegra/tegra194.c
@@ -1361,4 +1361,6 @@ const struct tegra_mc_soc tegra194_mc_soc = {
 	.regs = &tegra20_mc_regs,
 	.handle_irq = tegra30_mc_irq_handlers,
 	.num_interrupts = ARRAY_SIZE(tegra30_mc_irq_handlers),
+	.mc_addr_hi_mask = 0x3,
+	.mc_err_status_type_mask = (0x7 << 28),
 };
diff --git a/drivers/memory/tegra/tegra20.c b/drivers/memory/tegra/tegra20.c
index 6750b08d875f..a5cc770437ae 100644
--- a/drivers/memory/tegra/tegra20.c
+++ b/drivers/memory/tegra/tegra20.c
@@ -784,4 +784,5 @@ const struct tegra_mc_soc tegra20_mc_soc = {
 	.regs = &tegra20_mc_regs,
 	.handle_irq = tegra20_mc_irq_handlers,
 	.num_interrupts = ARRAY_SIZE(tegra20_mc_irq_handlers),
+	.mc_err_status_type_mask = (0x7 << 28),
 };
diff --git a/drivers/memory/tegra/tegra210.c b/drivers/memory/tegra/tegra210.c
index 8283601ab52c..aa606df8a679 100644
--- a/drivers/memory/tegra/tegra210.c
+++ b/drivers/memory/tegra/tegra210.c
@@ -1290,4 +1290,6 @@ const struct tegra_mc_soc tegra210_mc_soc = {
 	.regs = &tegra20_mc_regs,
 	.handle_irq = tegra30_mc_irq_handlers,
 	.num_interrupts = ARRAY_SIZE(tegra30_mc_irq_handlers),
+	.mc_addr_hi_mask = 0x3,
+	.mc_err_status_type_mask = (0x7 << 28),
 };
diff --git a/drivers/memory/tegra/tegra234.c b/drivers/memory/tegra/tegra234.c
index 9586d7528fb7..67d5d4e01a65 100644
--- a/drivers/memory/tegra/tegra234.c
+++ b/drivers/memory/tegra/tegra234.c
@@ -1155,4 +1155,6 @@ const struct tegra_mc_soc tegra234_mc_soc = {
 	.regs = &tegra20_mc_regs,
 	.handle_irq = tegra30_mc_irq_handlers,
 	.num_interrupts = ARRAY_SIZE(tegra30_mc_irq_handlers),
+	.mc_addr_hi_mask = 0x3,
+	.mc_err_status_type_mask = (0x7 << 28),
 };
diff --git a/drivers/memory/tegra/tegra30.c b/drivers/memory/tegra/tegra30.c
index ff89b9078772..8a26a2f204e9 100644
--- a/drivers/memory/tegra/tegra30.c
+++ b/drivers/memory/tegra/tegra30.c
@@ -1403,4 +1403,5 @@ const struct tegra_mc_soc tegra30_mc_soc = {
 	.regs = &tegra20_mc_regs,
 	.handle_irq = tegra30_mc_irq_handlers,
 	.num_interrupts = ARRAY_SIZE(tegra30_mc_irq_handlers),
+	.mc_err_status_type_mask = (0x7 << 28),
 };
diff --git a/include/soc/tegra/mc.h b/include/soc/tegra/mc.h
index d07de04c0f33..b9b1763b10b5 100644
--- a/include/soc/tegra/mc.h
+++ b/include/soc/tegra/mc.h
@@ -217,6 +217,8 @@ struct tegra_mc_soc {
 
 	const irq_handler_t *handle_irq;
 	unsigned int num_interrupts;
+	unsigned int mc_addr_hi_mask;
+	unsigned int mc_err_status_type_mask;
 };
 
 struct tegra_mc {
-- 
2.17.1

