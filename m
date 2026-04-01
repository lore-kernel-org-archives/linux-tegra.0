Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010022.outbound.protection.outlook.com [52.101.46.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C973F7E94;
	Wed,  1 Apr 2026 11:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775042758; cv=fail; b=Iiw2NCVP/OZBSZU4vPaZJHXQp/x0fmCHYSVhkK6o7vfameZ6At2WXZsw7GrFRqp5uyw4KevLN580VxmNFBU5G8fyq+VV0QRpDq8qQ/AbLOMsQHqXoXen7pEdlfUgpPxazYgPbE3VRJSLzikBxBOXLvvgFizoLYWF3wV6+6kLtWc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775042758; c=relaxed/simple;
	bh=yhDJC+TsLxYTd81b/aw0MiU2eVBm88gAm8DZ70cfR2E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q3uljZtDoiL2ktBv8ICcRRio++QFjruAUS0hGYCf3jFI+xuccNPc/HrEM9O6Sogp7s3gMzkxyllyxD8thS20DRWI0Zy/tkvXdvqXsM9rqvq7F5AeH9/yUppS8r6opGEthu8pdDdkMGUGZIhdbFS7MoPNRUDcyMfuXyv7AePKyJ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cXFtdnNb; arc=fail smtp.client-ip=52.101.46.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cXFtdnNb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ujuGCgP9K0JIwQPWj0Lc4b67W69tCst+4w5WuLbCjdfgVzjLbHFs3piOj2nhLrd+8DHq+fN9ElNpLGurqntS2MUnqJNGRonRos1RgH37bELsgJIgeiI2pLauY5seRSv2ir2Np7ccPhW0tgjpr71iXVtSKfNeUOKtr4v+0ixCN5FeOJEaHqkYoxCDm9SIUr/0wjIpfeXmp8YLEN0ST0nRSv7XwNv0KpEwja3P7a46LR3d0id1ed9F3wKYyFHTQRy6z07pONu1nx44K0NyGOVnW8EsATkxFadB9MLRf2CZfX8WRDZYYNzpnGrUebNU89tA4PmGQhVbN4kpGPI1LfAJGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3XngAbde1wUlbS7m3WjRe2mQnkWEHPo9NbAekOxADM4=;
 b=huE5bEBIzvQ/jTswknclb6Qi3SW2WE1LbQRMmW5DVJ8ekrX0hZPWNSToTLoDfG+0/2Ci0LxpquE6O5Y4oihOcHY+r84cCPoqdHcRWsJUnU8wfbQbqmSgfS11yHWJSIkzV2hFBegNrzBGZcEOKEuv2PyX+N3ajxaHJ0bD2unW0u4ntkXbra0brFAE7K67Aeqio9Y5zUmsuYcUirwaZgP9h3nxPBpJiyK5ODpKEyWZbitKUP8lsysNpSBKDIZGpkbZw6aLfuKhGqKBB4OxeKO4wyNIVxyQt2GoQVHtZI2U6A5tThlFm+RI0M+gsYRTop/Io9LlIqboxBhx6x1ubywi2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3XngAbde1wUlbS7m3WjRe2mQnkWEHPo9NbAekOxADM4=;
 b=cXFtdnNb8KiKsR03qdL5aVzGH6JRbBN593f/fPnojy4il7i9vXBQKyR5KZucXvjetqlP0NjaCVkUxbViMU2MftlScuP9Dj8l8KYp2BgWkz/I1ACh84/Grakp6QNOedoAQNyNSI2gc7TrxuqHylwqRzcJxoIycUa95Q5uF2A++8r+QSfTenWXX9UUOQWhkr5/5kPmG9uAUNXqXl7/A62cmoO5i0Om+IJX2vhK9JaUJAZHDjIZaCt9q+cvfwV+cftrNQFmmC5F5HR2noDs4Gwiv+BsMNpRDOxO3d6kuYDSlULtevOZOXLSTXUvSd2jhk8bkMVLGYTwjI25bcaqBf3gjw==
Received: from PH7P222CA0027.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:33a::10)
 by BN7PPF48E601ED5.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6ce) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 1 Apr
 2026 11:25:52 +0000
Received: from SN1PEPF0002BA50.namprd03.prod.outlook.com
 (2603:10b6:510:33a:cafe::e8) by PH7P222CA0027.outlook.office365.com
 (2603:10b6:510:33a::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.29 via Frontend Transport; Wed,
 1 Apr 2026 11:25:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF0002BA50.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 1 Apr 2026 11:25:50 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 1 Apr
 2026 04:25:33 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 1 Apr
 2026 04:25:33 -0700
Received: from build-sheetal-bionic-20251202.nvidia.com (10.127.8.14) by
 mail.nvidia.com (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Wed, 1 Apr 2026 04:25:32 -0700
From: Sheetal <sheetal@nvidia.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter
	<jonathanh@nvidia.com>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Mohan
 Kumar" <mkumard@nvidia.com>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, <linux-sound@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Sheetal
	<sheetal@nvidia.com>
Subject: [PATCH v4 4/4] ASoC: tegra: Use dev_err_probe() in tegra_asoc_machine probe
Date: Wed, 1 Apr 2026 11:25:00 +0000
Message-ID: <20260401112500.4076861-5-sheetal@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260401112500.4076861-1-sheetal@nvidia.com>
References: <20260401112500.4076861-1-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA50:EE_|BN7PPF48E601ED5:EE_
X-MS-Office365-Filtering-Correlation-Id: afecaea1-d0cf-4754-b54d-08de8fe16e16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	dhcZ0pR0m6OmfzJZmDC9EcSAkfgaKckTR9FFfI0+JvRxadsn7G3xFoUXn0VhplHwSrwPWnnO8Pr8WF6AmA6pOvEvZjNs6lhP4ALTiacqUzgwZBMbQKHHzOKoMP2rJdfHVPHh43c6Nb3ry+V5AzHxLLQLIPs7bMygAku41dVCTxIrjJf6tIAnLS4bu5KQs0pZ3dXOwbeWKHSCuzYZMeZfsz+ikgnW7cUpIyemklLpCy0dddaBjaByvCThFhm4RX88YvR6VirK1A5jXzWG1t322xQsZ2AUFNiO2X0bkYxwqSdwwlfTJexNZY7yvvt/NSUddHfKa40EFqpanK0B0Psa+gocKmbohpKF5z7AqYOSo3oX8euPhxQIw07FSHcHaCzuOlI1deusHiEhWL53pnd4mFxVQBvtKU6pcwtXA4SxrDOUlRnnId8NsdGEa10VyxWrZDju7MP4mYkZBZMh7DTUdN6QqriqnEK+n83uyD6xv9HE5BUFDIQt8Pi8YYAIsCfTbGP2BHQUEaScok71d7dZ7E2IADA8/C4DRgsZTLlPF9engZ5sYj0dpG9GEYl6OrfBWIrofLTFsYo34BRWwBfxmmsKbYUtLnkFaS0iua6/vMBXoqJtCQIbfqgTLykqwWEoxc109Bk1UVw06AKaKM0wAz4sipspFNqytJLl+t4QQ2dC0kvn8mo7cunNDYNmJ35WBX+yt6JQgvOXHesbDrV45VP9HRgIJM3/pvZjCFjJ594+Atl+wDMRrspihlNftPwK/gi/CVqX+tI10ekkoOf+Og==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jTkKAEAWTRhrVvSwOIn4PD91UiV5VNVl5SEkwTW569p9ArWyygO6vDsZjGXkfDajubzgR3ro9cm49RGcfIhPdNdKL3Vphwd1qNtQ2DbHPKPLlEcx6Tv09+QWpSfU7jJRrCW263W+q11jRgWlv0aWMgUv84B+3Z7lbjSchKrIq9JKHX050wxhQZrqc00Hd4IP9qxX4JPB/opncBAmPry8jTiAVpmT4g8vK0rRSbtAMysHOrRSMuP3TnByLAmQyKeyrAs8q39qfGpg/bfEmscHJax0z5Mcnk6vFemaueFV+AoFfgYiGX7v/Nnt/Y6EY8ZT+8YZgufyYpJPxamrrsnZFYHuNcz/0dJ/WOLQ0aW8LvzjLHhO2PmP3ogCTDTK+I0G+vRAj4fzlInkSIEq4KoFnSQ5cKVLZ+zwkuVPyvKUODBG/mJPaOl/wzs8VZGrcwZi
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 11:25:50.9079
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: afecaea1-d0cf-4754-b54d-08de8fe16e16
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA50.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF48E601ED5

Use dev_err_probe() for clock errors in the tegra_asoc_machine
probe path.

Signed-off-by: Sheetal <sheetal@nvidia.com>
---
 sound/soc/tegra/tegra_asoc_machine.c | 21 ++++++++++-----------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/sound/soc/tegra/tegra_asoc_machine.c b/sound/soc/tegra/tegra_asoc_machine.c
index d7245a10bba1..e1f2a3b4c5d6 100644
--- a/sound/soc/tegra/tegra_asoc_machine.c
+++ b/sound/soc/tegra/tegra_asoc_machine.c
@@ -591,16 +591,14 @@ int tegra_asoc_machine_probe(struct platform_device *pdev)
 		 * host controller and the external codec
 		 */
 		err = clk_set_rate(machine->clk_pll_a, 73728000);
-		if (err) {
-			dev_err(dev, "Can't set pll_a rate: %d\n", err);
-			return err;
-		}
+		if (err)
+			return dev_err_probe(dev, err,
+					     "can't set pll_a rate\n");
 
 		err = clk_set_rate(machine->clk_pll_a_out0, 24576000);
-		if (err) {
-			dev_err(dev, "Can't set pll_a_out0 rate: %d\n", err);
-			return err;
-		}
+		if (err)
+			return dev_err_probe(dev, err,
+					     "can't set pll_a_out0 rate\n");
 
 		machine->set_baseclock = 73728000;
 		machine->set_mclk = 24576000;
@@ -612,10 +610,9 @@ int tegra_asoc_machine_probe(struct platform_device *pdev)
 	 * only needed for audio.
 	 */
 	err = clk_prepare_enable(machine->clk_cdev1);
-	if (err) {
-		dev_err(dev, "Can't enable cdev1: %d\n", err);
-		return err;
-	}
+	if (err)
+		return dev_err_probe(dev, err,
+				     "can't enable cdev1\n");
 
 	err = devm_snd_soc_register_card(dev, card);
 	if (err)
-- 
2.17.1

