Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11013020.outbound.protection.outlook.com [52.101.127.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4C8426ED3;
	Mon, 13 Jul 2026 13:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783949378; cv=fail; b=Y15jpkkKZfcNwHLl8RywH+U/zBs/sJwqdHsaAc5U1d3Pia+FSvq1emwuHhfaH9Mk9w2jZ43VTe31A0a8vZRN9Jfpq+0//J4D7Rtn3Qwmw5N7kCe4Z498BNaaOB7x5VD+7BLqYYhqEJJOMBTzwwrwic7ivC2lZLTeDN7yhTabfNE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783949378; c=relaxed/simple;
	bh=LtH3YJF8WFqpv07QnNH+TMzBz/Wl65o4dvRGzWCe7UE=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=sqSbT1bZOtmvkVw3/OiWa35bUFKUzrd/TC2S+CweM6xE6zt+5gFM5VIHFxyYtDhA/L+CfClF/Anfw+OuYYK4TKAGKC/v8N/Z2QY2Vw/+iQpmlvMLfQ4s0rFxS8Oc4JGrf1ZYGqxy08IariFyXMdnz9HvBRiWZ9xicKxrtXKhiXc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=eziH2/+9; arc=fail smtp.client-ip=52.101.127.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="eziH2/+9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yRDcXk0ngckr/jyjJjXaufzFUM0z5KY9e/Gx66/H0SsUc2TnYX9bIzbk0Fo30EetkhyRxEmivgWU/BjrzCUdUcWMkCUaAmSk4E1/ckCxPf1+2Yq/IpIt9oASCpE79KlIl8NcCs7umMrni8pdzdsejuR86RlMsA4QN9J65Hpsc5paPrKyowdfd8KF0a3vBYoO14DHTj5BDL8RVs3RANr4DFIVRbu/68xa/bbOSYbkv2RYpMcDKdah/d+jL0mce1PwfpUc3ebpDu1WtlUTWjLbIa+qOh3Z/dFQqabRLei0Y9j9MxHHAoNG2PIaBMIe1s2kWxKGYF5KM2ZvqnoHbSQGaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F69Yvdj56Xco8jeRlg6wVU1Bs+n0Zmo/UwbwQDBnpDA=;
 b=UKFemZtsYkQNHvUfLA/NXnAV7QqYNexWOuLO9jlPvn3TpKXdlHA48xbB0Lq38YrGumuG07FB0OBnkdLbkmrOGeP2GufdRGO9D64Z4CJOY9FvIF0CDVJAkVAyor14zJbw33bUUkcf3raqNWlR0B3dJJDUicGeHM8Ha4udcI0fE1SOnDcMmiOX4KjS9ViXcm7aW056TYjo7OJhZ2Mb9NN0PIJsuIHKOxcjUBr9E6M2tQyCxgetG6qInhSYJdgzswkbwgvHVUOqtHJoojmF/hvgWyNo6yqIaJA6b+/uI40V9WkcbkKRE/D8+MmlsfJg883C+55GAOC0QAS6MCMkMrYpSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F69Yvdj56Xco8jeRlg6wVU1Bs+n0Zmo/UwbwQDBnpDA=;
 b=eziH2/+9WkWxuX01H8s0SV8HVVMA5AVaZLU4Nq3VeDGSJ9xh0hl47AcUjKoTRq4drG9wqSDPQIu8ho7YIcOM1o8vTVq43GmLSSKKjFO3Bs0TSrXLOQN37LIdVPlczUZr6g/x/cX4PZTqQ9VCsKdW+pVHRJCKjmY2ITW5OREKSXGKd6FG+TnTYAg2WkRTmkKQWQlr7GfiUA+hxZihnFRs0c7LtaEtAS/dxu0Zyjf1nzDQdhQ2gCMMRGXNqgwYIJdRU1n2ZlbpfJAp7CYDzdXLfA2GJ73/yxi1gnO3QbqL2JWXZDTPn0e8dTyf+0ESYXO2bCkKuKDSNpi8+nQ9hi+E3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by OSNPR06MB8956.apcprd06.prod.outlook.com (2603:1096:604:49b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.23; Mon, 13 Jul
 2026 13:29:34 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0202.014; Mon, 13 Jul 2026
 13:29:34 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Dipen Patel <dipenp@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	timestamp@lists.linux.dev (open list:HTE SUBSYSTEM),
	linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT),
	linux-kernel@vger.kernel.org (open list)
Cc: Pan Chuang <panchuang@vivo.com>
Subject: [PATCH] hte: Remove redundant dev_err()
Date: Mon, 13 Jul 2026 21:29:23 +0800
Message-Id: <20260713132924.403440-1-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0058.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::9) To SEZPR06MB5832.apcprd06.prod.outlook.com
 (2603:1096:101:c8::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|OSNPR06MB8956:EE_
X-MS-Office365-Filtering-Correlation-Id: a7414322-07bb-4b56-ab08-08dee0e2c74f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|23010399003|366016|38350700014|18002099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	jlI5wjoVgBsyMGHA8knGTH+cM7+tSUB0KxXX++oiN5WwaRFR9zivHYdgYD6Qo+RnXo7CEOFzZ/gPDl/uZ5nfo0O9uNVxert31EJJ6j0b4FPyhP2DmhTaqc1H9Fd29+brOBcr8httOFj5lgfBxreJu9K/zjJ2RFRwb7juPx3t3af0F+eTW4TQusiiP8ePjBkgfl8aWaC6duHFbhYTCSH/dqHHhWaqYnFzp7hyiX8PQddxK8VZsrzsQz7+IAlayL0UlSl+JZEnYC7f8XvZPqJJqVBMuKvUw0eqK7QlIqaXs8AFQAZsGf/GqVY4J9jByiGfQbDlJUhi1R/HiXLPNrdouJ5qHPEVULgelyRPd7Uaf/98vFS4YYsDmof+QMy3DBo9x7tKhf2uc/z524duo615+wSItFTllweHtMtTRnaWyrJJacMu0g7f+w/zw1diQPIBQy9P0OKkWA3uT3fRu3bsyyI+ZxReN0dYY3EGQ3znLvJXtNnZpITl7hImIh01QVs8eWK+dAx76A/p0Td2Cu09TRlrvRvxwkqRKsVvFvyNqGETUX+EWTixVHSkw6WWM72j5py+J+WghI7/wyVJtbjlfWNe4YGdKdjEeeFi4ygIXq8ZbN4cqiBxFAMmT5gzxrMGbdZem6ZycmbhmoBHgbvzwADrhtZEOBKLAV4q+T6KTfXx4ydGpMftF7u2V2gHEpjU+U/9Fijl4D9ZQDANvpKB9IH/arGFm03jRnmNMT/zccw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(23010399003)(366016)(38350700014)(18002099003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?X7xdUHmHfmwsuCA+ZsABfKWznRb0bfa837RdpjBTVRlUvTziVEr8DAhQUjyu?=
 =?us-ascii?Q?LpXby/B4wffCR5jLOP3P1ZuN4lsN23ckh+A6pM5JZJZAikP68svQymmw5H7A?=
 =?us-ascii?Q?hylObQlu4p7KGBGRb8UXuXrL4Qn6GF0EhWeQIApop5j08b4eT8bzYjMvSvaz?=
 =?us-ascii?Q?ROhhDDUZHRcD7Mtuizqka7JdQ9n/MutqCIB8yg9rb5OcO6YufrI60KTnIGfa?=
 =?us-ascii?Q?zN9osoDRw6Hc8T7vaDDHFb6aBz42NdWcZiuiAJFSf0LeT8ZMXSf5W+xQGu7p?=
 =?us-ascii?Q?zxGXVQpBC2/nj1iIQyRKJ6uI8xbYwiz8QKYWAuDXWyiDgyY1bglhpW91Y61M?=
 =?us-ascii?Q?2FRNEvEiPMxC+u9Tjid+zzllfxoDZdrzvLI0DAgBOSaVO37pozhS7dzxzXYK?=
 =?us-ascii?Q?0zUZEtq94jvtyrgYeJ+GCEVg6mFziMjcXi79J9/pNvuA/2Qp6EB/b3x0cVjk?=
 =?us-ascii?Q?QgCDOeuLKWP6hn+Q5EzsnXCXMVXd7Xna5DtPl7J6/1w95feAPhQ7wmsAAGh1?=
 =?us-ascii?Q?Id7ubbX+3UA9XNvOCc9aMdjwl9LiEnHW1rb/idsTy8QIB/ZO0zmNWynuk8Ni?=
 =?us-ascii?Q?CAKCEWF9qtIezEY+1wbIWNjAyOwcNjY5uDQpPF2bGciuf1CoNC3nSsxGmgwt?=
 =?us-ascii?Q?kiR0EPAnRK8Jssq1tIACIeAmilC1eSv3JIUkFcJx5Ex0MB1I5cfTbXvae6rI?=
 =?us-ascii?Q?13HMPo/Xujj57YyyZi/cQY2ypY7EmVJPB8Iw2RkBhYmR7PYW++bTqfJVaYbS?=
 =?us-ascii?Q?ydnxvgNEHH4guMVHsv7/qTLAeb5rAwIFPIBGZJv+iEZ0nbjaDdk52ezx43gg?=
 =?us-ascii?Q?wdf1nAs/ZifsqTmm1O0PSTV/X2ORUOjA0H6EOqfMglkoPTk4MUYqHDRnrAb0?=
 =?us-ascii?Q?sLIC514tY4e6vsrsnT+vh8RXt1+LANsHrdxDp8bDrhUAVu2YiQBM9K7jGuWG?=
 =?us-ascii?Q?F3Hg1oxuqKyI6mG2xLtQBqhBy9OCftGopLDti+Xa8BTN7xrcjCe9H6/Yatdt?=
 =?us-ascii?Q?Rjh0mj7BrzsNo/antgtBsd7/2D2u+ZvBPYg2ec2NVwSjZjagLnGdXUiAF1fh?=
 =?us-ascii?Q?T3QAV4vr0io5HvJWH7Y05GW8lfO0BEACiwCLHN4EVf6YHK5asGVnaxiuPwmG?=
 =?us-ascii?Q?vvOTsqMVdQCnBic4cpfiqsEVKZ8iCS2FdSixGflNRbvjVC0BtpA4cwrGgPIJ?=
 =?us-ascii?Q?vn+fG8q7ERbnrHAJr14J87AS94+d2a4j+PHWzuIWmouhu8Py23be1d+fKrtJ?=
 =?us-ascii?Q?48dEAO5omy0hjyeFD9oX3lZyUoxtm2R3aXtrCJIs8GPMY3i/1N1tg46vDriS?=
 =?us-ascii?Q?l6WgbM1IiDWpOXoWt0zT/C5w/HMP5fVCJYJ1GAMUsTqbQ6dJg5LPH8XJcfuZ?=
 =?us-ascii?Q?WMYBRMhO8G+nA2fzjvkdBFxxq33+FFwnLESDk9H34hnrbn4S6VoEnIVYEPum?=
 =?us-ascii?Q?2zUgJd+8Y7M1G7suW5aTeF+ZIFevHK/X1VAZsyn+jgtGRcbIAvJCTXGvFLKx?=
 =?us-ascii?Q?yPUlu3pkuDoEVJ56lwedQWqV86FpULWF2Uy6zwVWbHcEta/bo6SY5078NIIb?=
 =?us-ascii?Q?a4WA0rg253CA1khvpuvZ8HPJ3dMl7tjZIRslv3fvQfdrHHxib2wrv/NM8UjN?=
 =?us-ascii?Q?hD7cjQkGo+JhgBrDtaF+hH5HG4x8Y0rGzzyqUBZjPmpw35nOoNbJIvY5HbW4?=
 =?us-ascii?Q?BEgWe+W84XAEGlWCgUmSm1r7UWhKyyeZXv3A422skcmCDiiYpsdJa7uSXy/v?=
 =?us-ascii?Q?eDxWCOERJg=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7414322-07bb-4b56-ab08-08dee0e2c74f
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 13:29:34.6571
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g6YuniYaHlmY6FhgyLdFc/y7H4aFK9b2Gn4C7fPxPgWvzNnuCi7u4X8Zxuz8mvskfI4OYGlITkw3WH5mg2hxgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSNPR06MB8956

Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
devm_request_*_irq()"), devm_request_irq() automatically logs
detailed error messages on failure. Remove the now-redundant
driver-specific dev_err() calls.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
---
 drivers/hte/hte-tegra194.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/hte/hte-tegra194.c b/drivers/hte/hte-tegra194.c
index 4a7702b32b24..e29fb105ca2d 100644
--- a/drivers/hte/hte-tegra194.c
+++ b/drivers/hte/hte-tegra194.c
@@ -856,10 +856,8 @@ static int tegra_hte_probe(struct platform_device *pdev)
 	hte_dev->hte_irq = ret;
 	ret = devm_request_irq(dev, hte_dev->hte_irq, tegra_hte_isr, 0,
 			       dev_name(dev), hte_dev);
-	if (ret < 0) {
-		dev_err(dev, "request irq failed.\n");
+	if (ret < 0)
 		return ret;
-	}
 
 	gc->nlines = nlines;
 	gc->ops = &g_ops;
-- 
2.34.1

