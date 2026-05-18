Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012041.outbound.protection.outlook.com [52.101.43.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3DAE3F6C55;
	Mon, 18 May 2026 11:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779104469; cv=fail; b=B/qZsD6a8d+nl64CWLawPKXYizhuam0qHypEJlLArpUTxBB+PTvd+iORENwo4AFVd9XwSYHmzq42B/LFcIsATZYQ4CVkY8fDHxVDeflP699t6+LIsHeO3Y0mEpgBpsCscptpQ6Dj9jedOERjgI9XNP6aY29TOdRjl2FAFki6edY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779104469; c=relaxed/simple;
	bh=nSpaOhp7JQo37Ppr+8YZAKaei5HEaI1GyAUNACQluRA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XM3lWNRS1hIlL02ASUqfQTV3k1o59drH9CqlxwjRcc/eBno+/b49U6AInHLFniO3vHpZZnLBhyNrTFEmYrAr0QH68zUhH5n1/Wp1aZc5Os2FejffSMp31WRc1f8ZzZ5pgSXUkWPIAwj2L4mjbiCzB+WIC9CquSeJ1rABn+vym+A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Cd727YRQ; arc=fail smtp.client-ip=52.101.43.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Cd727YRQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dQJa5bnxHacIdHLQZjnMXe8q+zRCLFhtBxUjDS/RyEQiX1Hz68AnfwCIBk3Wl1nCLxuciUSiA0tsSabm+yUieQArVUZB2Amt58uph9tk5XnrWhNbe/oe3VlLXOgBTDl+PkkwwSzeLK6KZVa+PeGmI4ZahJ3L7VjaOKLuO3YgdD4Fd7kPt9SMh7yk07tv2XL6TEA6/9wM9qnhxlkTpbpn5o+8pXzAfTT4AHekHFxgOcHbnnjcDzPrEQcE/g2ruRUVJv231GbUOm704xxfUgSam/8VPCLrxQnpDNWNnsD/+WA860WGkvmIEOMz16fdi9XP942PALWEEiRpDUPO/P/uqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VFawLTOj2bgZ5Q52p6jwRTREsDJuLNRWERHKeTBWKwg=;
 b=irP62OpJJ8gJiPXhnDWzAaCrtUH7r1LkLKXkAa+Z0KLTcF75yTuzYBnuOHVaQnQEMvb4v8WY6iWRJdJXT/227GxyzDgCHoMFq7JD4O4vu5fnBgdisPkuJXoODoSBcegZh9RFe9iR0IKD9VHpnYZm438a7h63V7ObLS9JW1TWNYnkxu/7JnBm+PLcL513gAqIu8Z2tnE4evT3JHCKQrRkOIJ/sGoWorUrllnKvHm3ddNxXn5hFPgwLIsBUMwcgqZjevy6+A82Wb0NQYp/LdBiuO063L+8Ywin9wryX7Kv2QBe802SN9ighvu9ltq4mcri6BQcNQ6G/dlfdvhgcxEEKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VFawLTOj2bgZ5Q52p6jwRTREsDJuLNRWERHKeTBWKwg=;
 b=Cd727YRQqMpYt97GpT4FJy/I8GRLeNhb+VWlqjEt//p13aYhILpKuJ1jhtK9ETEnOFVTk4/ZM1/ZauwT3GYSLGZ/ftJpXA/xOA2Fhp7e+Wh5QQcXIKylDZEnDF5kbwJrHMNvj5+nR7sZvSl/gqz5cBSbFBo8+ymYbSJGCKH8IEnSuvMy9i3wmnP2vO9wMmGH3OyqdnoTz0UnnBiVFsU46h6LvOxPeaUNw/RQaPdnjsMpuKeQU3cOrbMTD/d3tycUmdBeX8nNtUnWTuBm+lFom1wS2cyVuLph5yGwnpRIjijaLhfyjml6+zqu6GkMd028A/1jiPTiOe065ijlkkmgeA==
Received: from SJ0PR03CA0019.namprd03.prod.outlook.com (2603:10b6:a03:33a::24)
 by DS0PR12MB7897.namprd12.prod.outlook.com (2603:10b6:8:146::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Mon, 18 May
 2026 11:40:54 +0000
Received: from SJ1PEPF000023D8.namprd21.prod.outlook.com
 (2603:10b6:a03:33a:cafe::c6) by SJ0PR03CA0019.outlook.office365.com
 (2603:10b6:a03:33a::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.23 via Frontend Transport; Mon, 18
 May 2026 11:40:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SJ1PEPF000023D8.mail.protection.outlook.com (10.167.244.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.0 via Frontend Transport; Mon, 18 May 2026 11:40:54 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 18 May
 2026 04:40:45 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Mon, 18 May 2026 04:40:43 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Mon, 18 May 2026 04:40:40 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: Laxman Dewangan <ldewangan@nvidia.com>, Dmitry Osipenko
	<digetx@gmail.com>, Andi Shyti <andi.shyti@kernel.org>, Thierry Reding
	<thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, "Kartik
 Rajput" <kkartik@nvidia.com>, Wolfram Sang <wsa@kernel.org>,
	<linux-i2c@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: Akhil R <akhilrajeev@nvidia.com>
Subject: [PATCH v2 4/4] i2c: tegra: Fix NOIRQ suspend/resume
Date: Mon, 18 May 2026 17:10:13 +0530
Message-ID: <20260518114013.62065-5-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260518114013.62065-1-akhilrajeev@nvidia.com>
References: <20260518114013.62065-1-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D8:EE_|DS0PR12MB7897:EE_
X-MS-Office365-Filtering-Correlation-Id: 42f861b7-9731-4873-c5a3-08deb4d251d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|18002099003|22082099003|56012099003|921020|11063799003;
X-Microsoft-Antispam-Message-Info:
	W/jLs6G4l838A8a6T9+aOcd+wwuJrIVZGQdrzN1VSaZFadG0wqjJz4eMJ99CNO3la3DcLNzWGDQdD95PQLjB+7S4ecq3dB+z4XD8XWWFh7Y08X35VD5baz31RbwDWuHG0WK+Vq4aJhHBLm7otgLD1RfCOvqN7+72YMzpZanKeWeDix+CyhE8YPDTo2va4ZALg//LPHHXgvW4xR1ZJQK7//3uYTody1IsnIp6xiSKkcx/TyMWmaTlWrKAYfFTeaEr5JBK8T0XXn4bO8Fmkf/WdO3h3PpUurwog2eJPXiVePcYTHaiOqp7BEB+GSKxzLl6nosfUNYh0k8Zxe30rXkEy98w09lBglg6KCXWuNcM8M3J58Zv9evqmi0kA4qBvZNEf+8SYA0eh77NorjQX7xUaPln2485CTxNGXniR03pxTZ71nShVLpjhbzozQHQOrO3FM/Z/yfNfg+yfFLzJgdBviHFfbwbN33rypbMZKpGXoj2J4UaFRPtCwLOduS1BB9IAKMaK62FjJj8vWdo86RZZ9Mlb6aA4FicGmi0X1B+BSDX28rrnny4BjKWuGtCCJ+y463Zx39gvOyNTJgTpDzc8Xel6lw2qBEFLLaArYzubuVM2OctFJ+Y7dWWV68LZgWFsr1EVMPkWyd97JpoHFX/i8Q1r839p3lqzNuEYOzSpMiq0/OvGV5To8BoYLCt3IEmFAxZKOsWLTUUTCQpGZGwUldOTqPjJi6i6iBcZGD2AQFNlkDs3BfJJCetoGGNE1AZRpQPrSqqso323GoDaADB5Q==
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(18002099003)(22082099003)(56012099003)(921020)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wIXjfRUXUzBR6+SiN+622pBnfomxRTcSyzSHpmE3Dv/0ASrrcke+jtMf2Mfz8oVVZvNbTlYmgJHARfFt4Hbw7SHkptgKrmU/5mKZJ7BvFdO8QN+57mFbPvLuRyZNAzVjF/VkTK9msc7lmGID8r/eJqaxAmkcPPeOyTP8PdqjTCKCJb3GKAMB1jaFmU7xGq1E6XOi/PSO/XDXcPAfwb1YF1SOAaUcZdyJKAOLDpEmx3Q2GnXMZwaf6EP38IS+glsuh70ZgFy9xTOR6gKBtdnGdAe+Mh1YIjDiBiG8XLhAgJq2ubF90rEnRkkQKqnyHIAdq5hTw6o5yi/Xwj2t5c8vmrfUZUYk6UHPnKsmC8J2/Jd1R7t1qz8Ew2c5ARhE55MjK8DmjgySmqP0yj5BFoyFV8VejP9+fl7Bm2XkFwJOj4rjQ0Zjt2qx2pyMK+5z9gGp
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 11:40:54.1935
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42f861b7-9731-4873-c5a3-08deb4d251d3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D8.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7897

The Tegra I2C driver relies on runtime PM to wake up the controller before
each transfer. However, runtime PM is disabled between the system suspend
and NOIRQ suspend. If an I2C device initiates a transfer during this
window, the I2C controller fails to wake up and the transfer fails. To
handle this, the controller must be kept available for this period to
allow transfers.

Rework the I2C controller's system PM callbacks such that the controller
is resumed from runtime suspend during system suspend and it stays
RPM_ACTIVE throughout the suspend-resume cycle until it is runtime
suspended back in the system resume. The clocks are disabled in NOIRQ
suspend and enabled back in NOIRQ resume by calling the controller's
runtime PM functions directly.

Fixes: 8ebf15e9c869 ("i2c: tegra: Move suspend handling to NOIRQ phase")
Assisted-by: Cursor:claude-4.6-opus
Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 53 +++++++++++++++++++---------------
 1 file changed, 30 insertions(+), 23 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 93677bd2d3b1..a24b6ef26dbe 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -2426,29 +2426,38 @@ static int __maybe_unused tegra_i2c_runtime_suspend(struct device *dev)
 }
 
 static int __maybe_unused tegra_i2c_suspend(struct device *dev)
+{
+	/*
+	 * Bring the controller up and hold a usage count so it stays
+	 * available until the noirq phase.
+	 */
+	return pm_runtime_resume_and_get(dev);
+}
+
+static int __maybe_unused tegra_i2c_suspend_noirq(struct device *dev)
 {
 	struct tegra_i2c_dev *i2c_dev = dev_get_drvdata(dev);
-	int err;
 
 	i2c_mark_adapter_suspended(&i2c_dev->adapter);
 
-	if (!pm_runtime_status_suspended(dev)) {
-		err = tegra_i2c_runtime_suspend(dev);
-		if (err)
-			return err;
-	}
-
-	return 0;
+	/*
+	 * Runtime PM is already disabled at this point, so invoke the
+	 * runtime_suspend callback directly to put the controller down.
+	 */
+	return tegra_i2c_runtime_suspend(dev);
 }
 
-static int __maybe_unused tegra_i2c_resume(struct device *dev)
+static int __maybe_unused tegra_i2c_resume_noirq(struct device *dev)
 {
 	struct tegra_i2c_dev *i2c_dev = dev_get_drvdata(dev);
 	int err;
 
 	/*
-	 * We need to ensure that clocks are enabled so that registers can be
-	 * restored in tegra_i2c_init().
+	 * Runtime PM is still disabled at this point, so invoke the
+	 * runtime_resume callback directly to bring the controller back up
+	 * before re-initializing the hardware. The adapter is then marked
+	 * resumed so that consumers can issue transfers from their own
+	 * resume_noirq() handlers and onwards.
 	 */
 	err = tegra_i2c_runtime_resume(dev);
 	if (err)
@@ -2458,24 +2467,22 @@ static int __maybe_unused tegra_i2c_resume(struct device *dev)
 	if (err)
 		return err;
 
-	/*
-	 * In case we are runtime suspended, disable clocks again so that we
-	 * don't unbalance the clock reference counts during the next runtime
-	 * resume transition.
-	 */
-	if (pm_runtime_status_suspended(dev)) {
-		err = tegra_i2c_runtime_suspend(dev);
-		if (err)
-			return err;
-	}
-
 	i2c_mark_adapter_resumed(&i2c_dev->adapter);
 
 	return 0;
 }
 
+static int __maybe_unused tegra_i2c_resume(struct device *dev)
+{
+	pm_runtime_put(dev);
+
+	return 0;
+}
+
 static const struct dev_pm_ops tegra_i2c_pm = {
-	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(tegra_i2c_suspend, tegra_i2c_resume)
+	SET_SYSTEM_SLEEP_PM_OPS(tegra_i2c_suspend, tegra_i2c_resume)
+	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(tegra_i2c_suspend_noirq,
+				      tegra_i2c_resume_noirq)
 	SET_RUNTIME_PM_OPS(tegra_i2c_runtime_suspend, tegra_i2c_runtime_resume,
 			   NULL)
 };
-- 
2.50.1

