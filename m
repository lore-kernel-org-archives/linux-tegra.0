Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012006.outbound.protection.outlook.com [52.101.48.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E1A3822AE;
	Tue,  5 May 2026 11:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777978861; cv=fail; b=f1klN+fUB+x4UpxzvpO5yOj3oglwybMPCAMlMYR8zu/jNGMlLd1dsOO+l+5mQaM+1/fZ/g3CIs5ikqxDvO5G36evXVAYMBCxXKts3HP95yPu4GimLOZYLEhUCiQNDSpmrPK1jJjwDkADgEtxOXq2zNSEz6OdW4wm5Q9qrzkODWg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777978861; c=relaxed/simple;
	bh=+Nk15Sw2DWW8Mr2h/dz/1yZNEXPfL+7lNayPe59cfOE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FB8+u1Wt79wOGORBDebue0TC5GSd6DOVsDX9P57THJZ5BUwXwEbdUSyRhCMoKxDle+IQEP1+xs5nvXYcrAr801UsPmQI3DN1B+weZX6ewIrb3GIc3SOfY9H342yEog9W9oa3uSmPEWLuDnr2uilWHIo1oxb85GA1C54oJfo0p3k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=pPgQhWos; arc=fail smtp.client-ip=52.101.48.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="pPgQhWos"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vLHo8T3KyJCnGMlT2k5JsKc19iGXXInCr2EJSpSa2s0mrI8nSOxYzeZkcRXA8a1CR3aQEOXZZWkeQrlNfPQne6SL5ofy98/jpPAN7ZxH4+005vZ5Yx8sNkv3vIr4P9orOUFYxaUhAdtiQgUcyrN9rIgWXGVnSwkOpYHzUnl786WWjuZWxd+WqR9mg8BQLB67BsxtqB/ACg9KsYdEp1aWmwjajBHrcxWm3kBaG8XA/nUxfg/5CS3xhuSYLgIDha8lnV+qN82yBRdkXiv9x136ZS5eWDDYrbzzwTDQklyrcfHkiZI70lo8lr3tFOiSAAeYt486EiGYcr2R3ydP4Cf2PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S/G9ksQYs9p+Hyeh+10UmF9Tiuiewn55CXBtVro1aZk=;
 b=h7W3sToOuRe/3ckAN8hRE3JfHoZT4LKARl0O6hqEzsjtzYftXXnTvQPbPq8STsw+4zSjisEj934UOCRQWPcJZNBNIDzrW7YgkyS2thRY1ySdloVns/QC7t8lxXwUL+hgxYpRB2Ppuhlz9mt/Pn+iW8gUHKT5HzK43KKEr24l4B309MlU5MH64prdcAn/JkddML4u9dQ0pbc3No547ItX+7EiZXN4Rcqt8h60fsJg45vd91p+CW8ynUosY7j3MFcm1nKgyDjetCuDdNGgFSOArhpwftbLcoJ1m0TtyJZeZsdAyjfFp0xJcQZpqKuS0uy5MUV/oQhQ0kpthdYX8ksssg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S/G9ksQYs9p+Hyeh+10UmF9Tiuiewn55CXBtVro1aZk=;
 b=pPgQhWosHJLrEy//S4n55pygLdQGRwJCG6YlUdWW6arKYdbYx0DpCG/Ibz7X5zQLhfmmo9iuhZarKOgyuGGWOHK6SA4JqSI9EY1Fhhg94cg6kPX+wFCXprogeM2PTR+XgxvWNZjKoKOCn/QRIIG1QltZbKJw5BDDeijArL2FBcQiXUBmkceVZtGDyXqyhaTE4EpOjkAbSwI8UBi6A7IPDJXpi+fg6gTjbZtag4CtjHPv9Hs2J85VG5fBr25oP6fUxmLSjRv4Pc80pK8494P7uzy8nj4Gs8Ha25qgKiCOarSYx5V9bPBtV70ul+WCTZc2YKuu7brm34DQzTGbBY4aVQ==
Received: from BL1PR13CA0096.namprd13.prod.outlook.com (2603:10b6:208:2b9::11)
 by DS7PR12MB6048.namprd12.prod.outlook.com (2603:10b6:8:9f::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.25; Tue, 5 May 2026 11:00:51 +0000
Received: from BL02EPF00021F6D.namprd02.prod.outlook.com
 (2603:10b6:208:2b9:cafe::a) by BL1PR13CA0096.outlook.office365.com
 (2603:10b6:208:2b9::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.15 via Frontend Transport; Tue,
 5 May 2026 11:00:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF00021F6D.mail.protection.outlook.com (10.167.249.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Tue, 5 May 2026 11:00:51 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 04:00:26 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 04:00:25 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 5 May 2026 04:00:22 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: Laxman Dewangan <ldewangan@nvidia.com>, Dmitry Osipenko
	<digetx@gmail.com>, Andi Shyti <andi.shyti@kernel.org>, Thierry Reding
	<thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, "Kartik
 Rajput" <kkartik@nvidia.com>, Wolfram Sang <wsa@kernel.org>,
	<linux-i2c@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <mochs@nvidia.com>, Akhil R <akhilrajeev@nvidia.com>
Subject: [PATCH 4/4] i2c: tegra: Fix NOIRQ suspend/resume
Date: Tue, 5 May 2026 16:29:28 +0530
Message-ID: <20260505105928.38457-5-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260505105928.38457-1-akhilrajeev@nvidia.com>
References: <20260505105928.38457-1-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6D:EE_|DS7PR12MB6048:EE_
X-MS-Office365-Filtering-Correlation-Id: e75c210d-5b2a-433f-85e9-08deaa95923f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|921020|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	CvDku6xbHGMdaxDlzKSjmWxUqHKppE2B77+c8bAPeyQ6SsIae5CDcaDexmiaXLTcFcC39zqTClj7e1mPQTkdiIfiJ0cq0Ja59cOuOZ7uw9NTgW0RP8PSrVErACpeP2T9OBLcWwPrJN8ep6n0Agw29dxySrFy2UC7YZOHkOgaTbW8cvz/3ZRd2JkSgLAd6n0Galf298g6D4M1s7m61E81cEQnRWxjz3xLH2ym4G9BFx/AXHWdOyEh7R+aPEvjWgJg1S6OKPeeQiKZqI9S0cBucDdMrL5WWKVe3cPB2Lfk5b9j6io9q9E3pQZtG13sVO7YxgcsJYiUM/Q2Wlg3A3EB90lp47WvBWCx/B9al3x5JEKpnTeEuvTLvUI9zbD1E/+jJW/bYfXoUJlg7reVGq2tKga/ikO/Wq9rcMNfV6zK0tDp0rd4o3e00pUzGStpCr+8p1daMTz/2U3jKV1iDhng3yfLgfTIBG4TZxyPNlw5asqHpdO7bNQGh0ZKsZ06MYdtISZJ7bYF1ewnB6tpjrD381pUIYAzimbGiHTnhQgNSX9kmafZ5T8GJB26weKgWAG+TZgYxN3AlJTQB5i/qvQjaV2qKjRPHLaOPaNrpVdfq4FO1K2n7KhbMS6yWdH78oGwkj/zLoTB5jqCoxNr7BcMxqusoVcS5WrKXjLZaNEDHDRZY7ufuzymq84PKLjH1rsr6qwu04De5kac1h0CfM3h9+Ugr3mawiG81aqFvEUS7jHdYG8KSeX7gO7a9+IFmHUR2AG8bEP9xI1FizMdS6NmZA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(921020)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	WbD5+ZaYAP7QxvMnv2YYoG2xPlVqVXq/QlR463K2gw/vC95etL8ijBtzOy0chE+qcMok6aKICd3Cg26f2eGfNH40pDfJFvcVpMxq5PCCe9PcVpM3aM0XNzLkga3FzlkHD5dD0fIvDg23ZeyWsp10NSg70FmEshSNtaGeKVo+PG7eV3ZD4/0q+DtPOSkR6q4k2oildx8Smr9dD0fwBsu1OmspqYWxUc2q3BPtgnRCwPcZBYkXzolMnu3LFywHjRt3WXD3BDdv/oZY6n48xkUvh09Pia6BguSPAA1D9x+ePL3tgtXtnSXAthdpq4Av9BaMsuirpssrShs5x0J53wyY58YruoGdaGsVI3rw2JaUPomwJoXh1tq22J+NQsLNMGan+aiAsJEwXlZn8sujkUQiuMVZKGx2/Vr5O4CAYMv1XpAlU5R5rINKvzAGxTpLTtrp
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 11:00:51.1998
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e75c210d-5b2a-433f-85e9-08deaa95923f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F6D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6048

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
Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
Assisted-by: Cursor:claude-4.6-opus
---
 drivers/i2c/busses/i2c-tegra.c | 53 +++++++++++++++++++---------------
 1 file changed, 30 insertions(+), 23 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 0c26139b4721..4fee1d2d81cc 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -2425,29 +2425,38 @@ static int __maybe_unused tegra_i2c_runtime_suspend(struct device *dev)
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
@@ -2457,24 +2466,22 @@ static int __maybe_unused tegra_i2c_resume(struct device *dev)
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

