Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11012040.outbound.protection.outlook.com [40.107.75.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292B3470E99;
	Thu, 23 Jul 2026 02:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784774305; cv=fail; b=JkWV3biCB/LoRxafIOcB7j9TLBhEhL6f17ma0WqCMzQLcFVGO1/mwdqNwilyW7hN8laENvxr0NFLZZrrwxzRYa/MpOJeqsfO59oRkHT6Y8Tp10EVqUb6dDNgN1bq1qD9vumpezdDEPIB66TZmpbMPgncnOwDZNUddwV/uBs7xsQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784774305; c=relaxed/simple;
	bh=f2y5IoyRsVo625tw/4ONsmLR2r3QdccnVgPmleoY8CI=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=qgk+D1KXQFnMipOC0smajsvNO/sYXlAHrh1FULVhisTnVqR5uiwryfjyjKuMVRH63wMyyNszGJlh0rrqq/zygQqd5kcgyzVwyUSTHMjOQngtFBdZxOT3YLf33cNzzat8CNEQbSqzVtjrKHkPV0OLgg5hN1inRG+JGDuAC5jfLC0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=jqb7GdYa; arc=fail smtp.client-ip=40.107.75.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="jqb7GdYa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A6y6szZIw1oKusnJb5bpFpL5Obywo7/9TDp1TxUncruWKyZNRMUfeSvUz58X/RuJhNfypHPDz9RG9yz7YFBveTjZBCrO4BI1r73tyb1a7PWlR07dqivNKy62zsgUaoer1vJaH5UaPK/Vo3q8MmA1eQI7LswQCoPmWOqqRd9NdUghrhEkcUV3bmSXol1rGDyxMVC5EOC5CA2uVwOW4i/ZHm8UMf5GWaD4pLtchgud2gBHfiktZNdJKNvGYr9ohPL40X0ScyWEufJWtSQkVOhxYv3/2dhF0RTYlQ0xrnL6Ol4YyFw7H0dh7OmEDnWLYG/5wgU7xYzbzfhYxff5XSuYnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Coof0Ig6LFxjL2XopV7Z88B1ZXyxYx/OOQmbszRM7Cs=;
 b=OTcMdJHCb433acWq30LO3RAEEjTpkuLDKz0r/zlwNowc77kbM6IpvnTCf87MI6nSeLgDxHs9iJJO3+oee2/PpwUDUYV0i74IAixUXwv5P8scVPlwWqeWk5WUBjE07V6Eh4Rk+y69ETOeZwt1y5ODAihoykBk9yujpQHLJZs4Kv1ZATi0lUINhsQ1qRdkCPnwz5ig/l+2kfWTDU8h6JQJjtUSImTvViMXyRPAh6IcNqEVY2SokfKppda0koNyaL4OKM0Nzt1aaDpdMzhQWKCJA18H3QVyfLlipWNrjxrYm9o1wrKMdQOZEAhsXi8ar669NPKM5yt+P7Efd50StiUuUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Coof0Ig6LFxjL2XopV7Z88B1ZXyxYx/OOQmbszRM7Cs=;
 b=jqb7GdYaBon1/yCax4+4it3jwJuA7+YHW2Z2PNNRIvWiXvtY0HeH0pm2hX6a8Y8CTuaP7sXkJN0dzFLRTdNGCfVMs2ywU8skSoSjKstll9grbGZ74/2VoNZT1nWfMNxCetWIkwIoCxiy7PyMG9OQn7t5FSDzg8TH9xtcXYJGVjOf/M6mvyRWL75lXoV2Jiud9eYiaXLRj4tYF0dPAsF4wRd8pp6adaXMPL3Lz1VErHrhtn1JoLIPm7AMOvF2RgXhsg1coIDa6f3qs/vCgOua8gU8zAvqIUoCISC9DkB/VbKArShAnDMLOXpXTBF0eFbua9SUgjDa3Vg87t+taCw4jw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by TYSPR06MB6542.apcprd06.prod.outlook.com (2603:1096:400:481::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 02:38:21 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 02:38:21 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Shashank Balaji <shashank.mahadasyam@sony.com>,
	Gary Guo <gary@garyguo.net>,
	Danilo Krummrich <dakr@kernel.org>,
	Rahul Bukte <rahul.bukte@sony.com>,
	=?UTF-8?q?Bruno=20Sobreira=20Fran=C3=A7a?= <brunofrancadevsec@gmail.com>,
	Pan Chuang <panchuang@vivo.com>,
	linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] soc/tegra: cbb: Remove redundant dev_err()
Date: Thu, 23 Jul 2026 10:37:58 +0800
Message-Id: <20260723023803.4304-1-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0147.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::10) To SEZPR06MB5832.apcprd06.prod.outlook.com
 (2603:1096:101:c8::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|TYSPR06MB6542:EE_
X-MS-Office365-Filtering-Correlation-Id: ae0cfb07-8e26-4d34-8d4b-08dee8637638
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|23010399003|1800799024|11063799006|6133799003|56012099006|18002099003|921020|38350700014|10067099003;
X-Microsoft-Antispam-Message-Info:
	GFy1U7wsL2UccwQPbxTa3Fu80IR+uCi49H786Yvu6yOg15R2a5C13FDqane36VAop6SGfyE0Ue45fdGl5CTxFt6MPG/Zo8KwLr4+0rkXyf9W/9EEGQYCw6h23zgM/gtxCwLkm2FAiVqGdDDd0Fa1XcZUzVjq/Leh+9zamd6GCdEb/JZHyrq5W7lZutCtmo+AeZkZCzHIdszGsZneUZufiYW7AHca6roaY3U5Or3JkHMKvCfFia1WS0J5MGMuSPaJhEFQ0i/d9c0PjOm4XrpbcXxVbODEa1D7FA0TIWkfFctpfA7sTMHcaxtR8qEqhPEHzPBVjYOAMAZjvYC66+SKf511UgBDcsMps38PrA4ytv9B49qD5ah80i9DLjSSsDBYA8k7YotPsG4wYpwq/dwS/uCoAGbhDLX52ZrGV57zVQxZRilb2DzfBjrPUe6+10aArVpQzDXYD0hIv41XrH6bSX+F1GZ1UDKHgEdI10T1eaMh7wefV0gL2vVYagHN27ZuRQmslFnlGRhHXtkt/tptxAlpz1VaOXmrFZ3phD8+1fvfszqIWWYYl4ckMmmu5lTZyD8oV6bwixsxhz65qzRQFZ46jJFJND3GzdkAqYu8Jn+LSFy1yxSuXhsfuCi4Ich2QpfgRLOr62O//b0aZQf6qX3/eKojCgwCjsBdKqnDTXQWLooS2iAAowNpeB/bsbu9Za5D0hbM5fr9M1nSulCx8B7so6VemuMMtI6qV3NIaGQDFROIYdwtL3dpzlV1arRo
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(23010399003)(1800799024)(11063799006)(6133799003)(56012099006)(18002099003)(921020)(38350700014)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?h3MQ9o+wS2ZTgvd2d+qpbbOtiDSW4kknp8oqTUFHiTJFlJlKXqs2XLHGoAc/?=
 =?us-ascii?Q?453gZkWJXRlc0hbj45R+T71CkH68nIv38CE+QINOlVYNEno2IOcseQi2YfJi?=
 =?us-ascii?Q?HcpfTEZ+iPXvo2FWO0Lw1EebArphFlFBP3tjVZC52SEkUNt+PrmnuxxUEjL9?=
 =?us-ascii?Q?lBZo/MwGqnc53FkxvXSegdmIoUhvRNndL6Rh+76Llwz/a97Zy1zsY2V/zUkd?=
 =?us-ascii?Q?ZelHjl77CH6rJiHMX1Y4TwG3e7LQudhTWPCqa7DPs0casECtZB/Aako+Yffg?=
 =?us-ascii?Q?04iZqRW24wgF3YG72AWGtNwhlq/XwOG01yHpfsQ6h/YAOjmb5JIYCDYkAF2/?=
 =?us-ascii?Q?ZXix57/W9Sa22YkmIxeASzgQynz8qK3+Jru5HZDC8zyvhJg031/7hWDF2yZr?=
 =?us-ascii?Q?tPz/LafWiyCRNE1p5IcNKJVqVhxvo+u9GuAI9B+OEJ4FgvXZ1yHkLd3zDJr0?=
 =?us-ascii?Q?AWvvUlLL23y3KYFrJ3rudQgNyT3iqOLcs9JHGN4pQMmLfyBnuwqXp0X7Js89?=
 =?us-ascii?Q?8vDOee3dukDr3Cap+Fs4dD1KxH0ZUG5YoFadGCCPkrrfBjkdTtjfK2flbAaj?=
 =?us-ascii?Q?zpyWVObmyua6kaCuMwwm+MJXCi60CZoVxbz27B+/Yui5Nx6k3Ag3Ft8/mtaA?=
 =?us-ascii?Q?Aan4Ldc2m8ysQ/uy3+G7VjOgK4lPVkfrB+AhvViayK9sV8oCqLY5BIkSdK4O?=
 =?us-ascii?Q?GCw4EQ2Pbb4yEMPJ6J8RNMb0gKHrdHLC3+F9mvRT3W1HdCMSiOL4vcDx5U85?=
 =?us-ascii?Q?zZDtWwE838uip7Qgk7GmWe0MGKSW1cMSmsbZ9WNG3r0As8MlUgnwK3TtAYDk?=
 =?us-ascii?Q?UYheIyV27covpMkzerZSXfozIHIWEOXB/IuaBzi1PEMoN6LbQClxx4lHU1Vx?=
 =?us-ascii?Q?0cbnW6Pvujm60I1IWPp8b6CXlVY13nUKUTXTDu+ZVvibwzV61QONqQWtFRsn?=
 =?us-ascii?Q?p4/A60DIPwo0VM4q/HZ/tJIzTVsP0uEuVgs1oUj2308ns5/RkkbJ3pq4Z9Wx?=
 =?us-ascii?Q?MawH7jI1m6+3c61hxyZm5glkFzKjvEw21H1BsXdnjpPyEORE1hVFQcqX11gX?=
 =?us-ascii?Q?TgkBEcjFSaZYflMaBEnMBQuXPb7jeeeuvzN+EwyUF/Z88blZzaK37MelIL9e?=
 =?us-ascii?Q?K6KklxNzUu/wSjqU7Dg1pXC5MdavUIeRrsnCbDHmogh7mK9U57IfD5g+/MsF?=
 =?us-ascii?Q?T92XTp9OdxjQ7gRCxkkH0oCm5vTlmKJvjNOlxr57KHae4sFedVEPnzzPChLb?=
 =?us-ascii?Q?t0DatvN5lSnhFbNTfBzdLZ7swdoozGnDZMW2o5N+W2BGkI+/BoZiXcvU1rHX?=
 =?us-ascii?Q?tYzORQWweTY9Tlj0vPWh+Tv8kfNU4QkVpBoGa1VA6w1BrZP8Dgx5XnYBA0q2?=
 =?us-ascii?Q?ftuzWzAuz2bo9q0kU4+DbxpmwlMfC3X+V5flR8TjYW/O28fXAYcj1r0iDwQ7?=
 =?us-ascii?Q?ipRgg4eySKly4vmHC1UfsZcua7cCeZJUSLH6jo3xPd/P+YZAACtuqOyxgEoo?=
 =?us-ascii?Q?bKOB5/St/y3lrdYh5EO245akTk/zJa6zjr3W2X90esTT1J++gf0m1PicqRA+?=
 =?us-ascii?Q?fHOLIx2zLVsXgGvR1NG143b0XMPS7QYQeTWJf1NUj0U5fL3/xUjGllCyZnZH?=
 =?us-ascii?Q?oGE6wUw1nmAd+H+Q2S5W7CMJTgVxWMWG83WM9dFH3YcqtO/hj4tdLMRuN7dl?=
 =?us-ascii?Q?C1asgf37Y/GnHtNrZaQN5BeVmeFHYuREY21Yls15IZTWyX3ICc9p5CtieovS?=
 =?us-ascii?Q?AAKBLGcJSg=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae0cfb07-8e26-4d34-8d4b-08dee8637638
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 02:38:21.7750
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l6Y7C9TPqrsZx8VRPWDSZ0f5fT46eyvQAeQ83jESlstK99AXWruItconK5VeAzArG/87vg0jb1graU7KafWXCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB6542

Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
devm_request_*_irq()"), devm_request_irq() automatically logs
detailed error messages on failure. Remove the now-redundant
driver-specific dev_err() calls.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
---
 drivers/soc/tegra/cbb/tegra194-cbb.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/soc/tegra/cbb/tegra194-cbb.c b/drivers/soc/tegra/cbb/tegra194-cbb.c
index 2f69e104c838..69ef929e04f8 100644
--- a/drivers/soc/tegra/cbb/tegra194-cbb.c
+++ b/drivers/soc/tegra/cbb/tegra194-cbb.c
@@ -2072,20 +2072,15 @@ static int tegra194_cbb_interrupt_enable(struct tegra_cbb *cbb)
 	if (priv->sec_irq) {
 		err = devm_request_irq(dev, priv->sec_irq, tegra194_cbb_err_isr, 0, dev_name(dev),
 				       priv);
-		if (err) {
-			dev_err(dev, "failed to register interrupt %u: %d\n", priv->sec_irq, err);
+		if (err)
 			return err;
-		}
 	}
 
 	if (priv->nonsec_irq) {
 		err = devm_request_irq(dev, priv->nonsec_irq, tegra194_cbb_err_isr, 0,
 				       dev_name(dev), priv);
-		if (err) {
-			dev_err(dev, "failed to register interrupt %u: %d\n", priv->nonsec_irq,
-				err);
+		if (err)
 			return err;
-		}
 	}
 
 	return 0;
-- 
2.34.1

