Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013005.outbound.protection.outlook.com [40.107.201.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1E93101A7;
	Wed, 18 Mar 2026 17:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773855056; cv=fail; b=N7mAVD9eVb7Vk9ca1KbetOvf/mnUyP6epW/iOtz87uXL1QbfAF0y9OwZtPp7LMmX8xt3+o6JL/14NdsO6Pq4uLQ451RKU+nzKT0g0XJ/La93E1stWghueRomtVAcx62oJC2dM05ElN3gcDq3ZruAaCOV1BcHKFUZc9/aHlCdx48=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773855056; c=relaxed/simple;
	bh=XuKX0EtR5beRwSRMz0xFyEBacku/wOsGcCCJ6s1ud04=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Tm2Y7KMCg4T4SXcdFv26wfouh8SaQzPttqrR03vC2C2bzYkNCLb0u1A/MGed0MpSiL3ZNOpavZNSh2Kh9VqI28AXvsOIDs9chRJvdAVdDRKR3s0Ge9diAPXq7Hu7LF6cfAopKZWLa4ialxWQinShK5j/+f5IiNEqbFyoUtHkT5Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=S/8jdtj4; arc=fail smtp.client-ip=40.107.201.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="S/8jdtj4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OePmIxvo0mxlq4/Yi5HGdFR8Rcy7HZEBffKMKBMfvmfsfOjo2kuWgI+AObKe1ROO4C/zAZArEL/c5mrD4LJknZZzcpDMCWeVIOuGn68SWzn8DQzAdchv773tZ+BdWZ2qpbxQK+uvrTuvvI3Pr+lFKoIFwM3mHQjlB2kBPLsm2iLiz+OJMeugjrutc3o6beEUBZZsfDKGKvdVB/gYEsI0vW2HbszKnPTAg6JyhOergu1qC82aM59EU7svU+6fsy60jNKEeAQRSG5QoxdF8zveVBVSl86x2103dqp0uXdETuSB7vr9qZ5KamBDEfV8MPfkIhN3K7UwxLm36+JV5w/SDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8s01Smtrj8xmoxQsDcNGcjawN1QzoJz5+l0PfyFjgvU=;
 b=ouQHwKSHyYeQOreKZ/TN+rghEZ8OwuSoJiQNFynco8twMBzg7uNbgG062iaCHOf3bT6wPfViqonVvuU0/RzsI7qsKy5tLON4pPKBa+3FdsdaeCNQNghl5aDdUKIWxGrFj4XvkbWDeyjGc+EfkMqYNU3XVy0NKq8AizPYfSevnygfdYB5LKqA5/92qe1tWCG6+wxpuzzOLingn/wCasWqV+dJ54qxgNs7qK8BpsCp9XtsURbr4PytH6s8q2qMFxggGnjYYVekT5hiSStJ5fRU1aMoS4AQsTTasEpmwm/YhTDX5DU13JSeN9lYCaH2VyQcB/WE4mz2BcbnFMp+k1KWCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8s01Smtrj8xmoxQsDcNGcjawN1QzoJz5+l0PfyFjgvU=;
 b=S/8jdtj4cjIHwQPdX0+93QFjm1SCMlMtVW92pmm6Z+PAAiZgp+BFp9iWPAmMjkrS7GuHEXbvV4r11HXdrB9DGo8XYk7iaegpptZgyVPTIOA5OujTOwXksWkn1Rpsx+PbaQG9RODxtLIvDuEQCx8iuzjPRxQRZU8kWiJmfLmitoThsL82eWtUV0RzyM+kxmJttrCqEO9QNuTlHZPbmvRx0AOWradcqzJztZaNd8sCHQZE6RulrJMZ2JTLMqYNKBEe27xS+8DvQ3oTUjMUQRdGkgOdXpgxKi+2VRqagQqFF7bgtln1WjLMgngaqVWgxH9wTD6FjU+pYS20sk+1nMibww==
Received: from DS7PR03CA0319.namprd03.prod.outlook.com (2603:10b6:8:2b::27) by
 BL1PR12MB5780.namprd12.prod.outlook.com (2603:10b6:208:393::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 17:30:50 +0000
Received: from DM2PEPF00003FC9.namprd04.prod.outlook.com
 (2603:10b6:8:2b:cafe::9a) by DS7PR03CA0319.outlook.office365.com
 (2603:10b6:8:2b::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Wed,
 18 Mar 2026 17:30:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DM2PEPF00003FC9.mail.protection.outlook.com (10.167.23.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Wed, 18 Mar 2026 17:30:49 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Mar
 2026 10:30:25 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Mar
 2026 10:30:24 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 18 Mar 2026 10:30:18 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	<Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Rafael J .
 Wysocki" <rafael@kernel.org>, Robert Moore <robert.moore@intel.com>, "Len
 Brown" <lenb@kernel.org>, Guenter Roeck <linux@roeck-us.net>, Philipp Zabel
	<p.zabel@pengutronix.de>, Eric Biggers <ebiggers@kernel.org>, "Fredrik
 Markstrom" <fredrik.markstrom@est.tech>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Thierry Reding <thierry.reding@kernel.org>, "Jon
 Hunter" <jonathanh@nvidia.com>, Suresh Mangipudi <smangipudi@nvidia.com>,
	<linux-tegra@vger.kernel.org>, <linux-i3c@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-acpi@vger.kernel.org>, <acpica-devel@lists.linux.dev>,
	<linux-hwmon@vger.kernel.org>
CC: Akhil R <akhilrajeev@nvidia.com>
Subject: [PATCH 09/12] i3c: dw-i3c-master: Add a quirk to skip clock and reset
Date: Wed, 18 Mar 2026 22:57:22 +0530
Message-ID: <20260318172820.13771-10-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260318172820.13771-1-akhilrajeev@nvidia.com>
References: <20260318172820.13771-1-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC9:EE_|BL1PR12MB5780:EE_
X-MS-Office365-Filtering-Correlation-Id: bfafbbe6-e565-47db-5f2d-08de851418c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|82310400026|36860700016|921020|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	b+GaeNpmgpYp1qF80LYMDsZXBHx38qxiGexE+h3CdxXBmevtzFnBX3xfA5YYqwpf0hbozuVuG/NlhKpBFnLchKEx9jz5X6fSzyu2ky1TvwRJificrkDO3MHmNlH7xu7ceZQ7Wy9H/jFMLT34B0jb+UCUw4yLxJD/S+ylQ9aGDDyMw6B7IY7B9Lg0eh7CbMT0LlHc0tjfRmPoSvoSUXBINOeLHKgRoHlRRHW+Qw6gIuKBHOoMFVxKyMAq7ZW5jOm3wFbpGF39HPmZsqV68QLZOP1j69SQMzXUSGo3RuJAF2ben5ePzwMb1b3ZcS8YbVkF/Dy5E5D91A6FEIcnOrY9dKJuGuaIKrDGUgt/gX7qWlM5LOJ52C2EVz4pneJWRTUAPGoHa8mSuMhCUPSI7fJxmQ34NIBylVXM7pn5m9O+pRpGj9SiUnbQpdUWnXUBpoVNGWsK8u93Pz+7GxigSLkP2S9k/RHaO1CVUq+rUnLyEavgt0+diEIT1g4QXlJllYKqT9LiipycIEUMfHFcdV2kKXkVRdVVBp623GYwIsAIYvfhZH2Kor4dAHDjzuboh8UIHnVnVOp5bIJGgg34fQjpspv5o1g5fac+ci9iS9f9pDPP4XfvON4wdoUvwxfuMBM3k8LDqddAgmmGkICM4BbC/VCj11789nRHp2JcDzeLcKNjGp6tWgnmDYvvKsRDbCgK9f/7Yp0hbxCXraTFL2C/ODh7tGIlalP6V0rnS4rKrL0wGwovmuGxU6g4y4/sWmet8IV4xfEk57XnFuVdNFRre/OzLEBbvhKDCDZNmoDLpBIvqQudAL+C5yrtCEwGIQEl
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(82310400026)(36860700016)(921020)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	rZ6UIEnzdKdO2AOddqTqGeGw/dUWYkS+2kyMPnf4TTu5Lksky1BunkQ/wBFliENJcHsB1nDPPGMvUZe+rXzaKB/zN2l1oBdQ7qMh5Qw9x1kkKiyclQ/ikMgaH5Fqdso458wjT2EsN3qUsScdTyJd+wWDeBpaQlGf//w3djWFQ+WZIyJw5ebpQftKHUOx1vP5z2VtSwDTewnuxdJevTnjAet0Xl6oOnuPHSvmm3tszqn/esgJ/48F7xZgzhGFPXgPwPX8X/Z0HOB0I7qEBQthCiV0NlBzkGHhUcVeRzCJl6wKJ5fP2YwafB39/Bdo/XiHWfece/82GeAp7V1IP85piGYgWDuSAtadZjOvVF2ww3Xzhncj3Jg47gLsVojH+lkVqog6J9DzH5GP75zMHVgGiVnJJBzYSJh4bqe6eo4MRr9z15D8P8qXAPgs+EHyz3ZI
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 17:30:49.3335
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bfafbbe6-e565-47db-5f2d-08de851418c8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM2PEPF00003FC9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5780

Some ACPI-enumerated devices like Tegra410 do not have clock and reset
resources exposed via the clk/reset frameworks. Add a match data for
such devices to skip acquiring clock and reset controls during probe.

Move match data parsing before clock/reset acquisition so the quirk is
available early enough.  When the quirk is set, fall back to reading
the clock rate from the "clock-frequency" device property instead.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/i3c/master/dw-i3c-master.c | 57 +++++++++++++++++++-----------
 1 file changed, 36 insertions(+), 21 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 05ccdf177b6d..2dae63983303 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -241,6 +241,7 @@
 /* List of quirks */
 #define AMD_I3C_OD_PP_TIMING		BIT(1)
 #define DW_I3C_DISABLE_RUNTIME_PM_QUIRK	BIT(2)
+#define DW_I3C_ACPI_SKIP_CLK_RST		BIT(3)
 
 struct dw_i3c_cmd {
 	u32 cmd_lo;
@@ -560,13 +561,26 @@ static void dw_i3c_master_set_intr_regs(struct dw_i3c_master *master)
 	writel(IBI_REQ_REJECT_ALL, master->regs + IBI_MR_REQ_REJECT);
 }
 
+static unsigned long dw_i3c_master_get_core_rate(struct dw_i3c_master *master)
+{
+	unsigned int core_rate_prop;
+
+	if (!(master->quirks & DW_I3C_ACPI_SKIP_CLK_RST))
+		return clk_get_rate(master->core_clk);
+
+	if (device_property_read_u32(master->dev, "clock-frequency", &core_rate_prop))
+		return 0;
+
+	return core_rate_prop;
+}
+
 static int dw_i3c_clk_cfg(struct dw_i3c_master *master)
 {
 	unsigned long core_rate, core_period;
 	u32 scl_timing;
 	u8 hcnt, lcnt;
 
-	core_rate = clk_get_rate(master->core_clk);
+	core_rate = dw_i3c_master_get_core_rate(master);
 	if (!core_rate)
 		return -EINVAL;
 
@@ -619,7 +633,7 @@ static int dw_i2c_clk_cfg(struct dw_i3c_master *master)
 	u16 hcnt, lcnt;
 	u32 scl_timing;
 
-	core_rate = clk_get_rate(master->core_clk);
+	core_rate = dw_i3c_master_get_core_rate(master);
 	if (!core_rate)
 		return -EINVAL;
 
@@ -1600,21 +1614,31 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
 	if (IS_ERR(master->regs))
 		return PTR_ERR(master->regs);
 
-	master->core_clk = devm_clk_get_enabled(&pdev->dev, NULL);
-	if (IS_ERR(master->core_clk))
-		return PTR_ERR(master->core_clk);
+	if (has_acpi_companion(&pdev->dev)) {
+		quirks = (unsigned long)device_get_match_data(&pdev->dev);
+	} else if (pdev->dev.of_node) {
+		drvdata = device_get_match_data(&pdev->dev);
+		if (drvdata)
+			quirks = drvdata->flags;
+	}
+	master->quirks = quirks;
+
+	if (!(master->quirks & DW_I3C_ACPI_SKIP_CLK_RST)) {
+		master->core_clk = devm_clk_get_enabled(&pdev->dev, NULL);
+		if (IS_ERR(master->core_clk))
+			return PTR_ERR(master->core_clk);
+
+		master->core_rst = devm_reset_control_get_optional_exclusive(&pdev->dev,
+									     "core_rst");
+		if (IS_ERR(master->core_rst))
+			return PTR_ERR(master->core_rst);
+		reset_control_deassert(master->core_rst);
+	}
 
 	master->pclk = devm_clk_get_optional_enabled(&pdev->dev, "pclk");
 	if (IS_ERR(master->pclk))
 		return PTR_ERR(master->pclk);
 
-	master->core_rst = devm_reset_control_get_optional_exclusive(&pdev->dev,
-								    "core_rst");
-	if (IS_ERR(master->core_rst))
-		return PTR_ERR(master->core_rst);
-
-	reset_control_deassert(master->core_rst);
-
 	spin_lock_init(&master->xferqueue.lock);
 	INIT_LIST_HEAD(&master->xferqueue.list);
 
@@ -1647,15 +1671,6 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
 	master->maxdevs = ret >> 16;
 	master->free_pos = GENMASK(master->maxdevs - 1, 0);
 
-	if (has_acpi_companion(&pdev->dev)) {
-		quirks = (unsigned long)device_get_match_data(&pdev->dev);
-	} else if (pdev->dev.of_node) {
-		drvdata = device_get_match_data(&pdev->dev);
-		if (drvdata)
-			quirks = drvdata->flags;
-	}
-	master->quirks = quirks;
-
 	/* Keep controller enabled by preventing runtime suspend */
 	if (master->quirks & DW_I3C_DISABLE_RUNTIME_PM_QUIRK)
 		pm_runtime_get_noresume(&pdev->dev);
-- 
2.50.1

