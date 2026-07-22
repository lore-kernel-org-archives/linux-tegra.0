Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11013011.outbound.protection.outlook.com [52.101.127.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0019A3ACA7B;
	Wed, 22 Jul 2026 02:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784687748; cv=fail; b=XOz4HuBqqwhqgPqGlRiwoctXOloiWw7vmlRYNWC6dyvT/Xbi80+VKwMgV+V2yEINWdLfbDy8vFk4SPUyTm4rGA+3sXS1vJsQhq77Bc1lZyrgk7+hPLbTLUhHJoNQ+cCfnEbFx8+g4YwCohwf2x6upuVmBjduO3mFj++JAyHwVhs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784687748; c=relaxed/simple;
	bh=f2y5IoyRsVo625tw/4ONsmLR2r3QdccnVgPmleoY8CI=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=q9Sj3ylxLXN91pVNCUZbORdhR3Sgn4cXBDUCGNfyktDBm1oq0dXuN8nh7a5HdHGC8Mq9wc3j5qSrekvH7oxiWEvO8/GCNEY0KiJJdbrq/zQqvakVPMiHCtkroS+7Q96FavUmtQs8jZ9XuzEzxpd4/prdC72D9pgeQsEYpRDvHDM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=PITB2ci/; arc=fail smtp.client-ip=52.101.127.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="PITB2ci/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WJ5Qb8ntvabVtGOem+nLOlnzg7hBoU6+vh/ScZGq/morxBS6InVVq7vuGw32m3xxrtJFb2uXFAJBOdIN3jDU0lGNVJs3U9Kj4fouREc7qBePAip3YxDLAa1vFb4hVg8wfh+iD2hfgutowQ/ZeR1Vbi9jqqaEjTH74Z6JC6CstpAqDxHKNSILbTX5GQ70l02EIXb9HBhhNM0yjX65oVxLXEwW5iJ5rwoDzazRK/nYzmO3aRDL9FlvkrlNmzxYkEbbhXRVyMEmZF7hMw07bTBGzrHMNQca7qshc+tsreskJcQXZ6QOWxqdUKlPC4yFOxlsxpAI78lTc2L7tyj3ZKyspA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Coof0Ig6LFxjL2XopV7Z88B1ZXyxYx/OOQmbszRM7Cs=;
 b=a1Fmig+45ix4laJ5pvmRmuQheVZSHy0wlRI0GwrIHR4jfH2MLgJkcgeQ0HIwQF4+WkwhHG8wThM2RBgUI7agQA5ATbl6Qi5GBkwJcwfnXroCOfWT0wxQs6RW07IPi0/m0y5BtrnDTSiqn3rMonNrStaf7pqBFV37k8k7G8bVxlWfsqvfUyx3o9nbg/SLJCz3/VL5rUqVaC4T3XIk+ZpueoFHcb/ebbYCkmY3j8jrVBNrL4pIYSwSsWID+z1MHLn8hbJybk3R8jkzZ5DW/iz/bQRjGKt8YAcBdZ2/aSVb0Ayi0lnbx0KpL4iVtDmVThWOXjZ6+LTfxA0Ktx1AG/UDxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Coof0Ig6LFxjL2XopV7Z88B1ZXyxYx/OOQmbszRM7Cs=;
 b=PITB2ci/J7phDPiqH856I9C+tsffDAhOInPUopkvtZTZ/O1cv2p4yi3IpxQXaegLrfljLpOtYQgu5iZib3RzS2IQ8liIP9K9/1XNHM2pNHW8vWtVb67aFQveaduXnbbWP8+nnD6gcUlNKED3jKDg7mGEp10w79Xulz/Ikqj7U1CcR1JCTtCqcZACl045/w244mLFCVNEGCbdmo2L/fZb+dHMWhmaHgqMt7+uFl+hUmtYvlWwRMfeohWOFefhUJvi5D+AST2xFQO67++wRMSz1YRb0euWJe7JcTsz6NHYOUz5iU/WZenQw8uKEaKF74sj1pXWiF66LCesOD0NoJtF/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by SE2PPFEBA6DFDFF.apcprd06.prod.outlook.com (2603:1096:108:1::7f1) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 02:35:44 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 02:35:44 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Rahul Bukte <rahul.bukte@sony.com>,
	Herve Codina <herve.codina@bootlin.com>,
	=?UTF-8?q?Bruno=20Sobreira=20Fran=C3=A7a?= <brunofrancadevsec@gmail.com>,
	Shashank Balaji <shashank.mahadasyam@sony.com>,
	Pan Chuang <panchuang@vivo.com>,
	linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2] soc/tegra: cbb: Remove redundant dev_err()
Date: Wed, 22 Jul 2026 10:35:21 +0800
Message-Id: <20260722023523.42269-5-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260722023523.42269-1-panchuang@vivo.com>
References: <20260722023523.42269-1-panchuang@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TP0P295CA0023.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:5::19) To SEZPR06MB5832.apcprd06.prod.outlook.com
 (2603:1096:101:c8::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|SE2PPFEBA6DFDFF:EE_
X-MS-Office365-Filtering-Correlation-Id: 59f5012b-86e9-4546-3cd5-08dee799eddb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|52116014|23010399003|10067099003|11063799006|56012099006|6133799003|38350700014|921020|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	i+qi7DlIQZt4lqA3swrGO0rq22tSwnxZmJcPYMnXcgBjm9Ip7YTrrTmvNP7acT68UcBln15386UBVvTe45egZUa8GJEfR/i2h/OwhTs70P1LXOhg1S91o+w3uQrPoNb801a9+i70nVNu+UUYKRWxcEye1dxejSBZfKh73JH1BW6Nd8zfSRk4d36fPSR2DxZJtW3SDMaGfFSL+x2EHsY7LO9k7eYDoH39tvMRtIMacnewoQxGtcpeP0U8H2u0kfrPjx7UHqUMklllreFY13rt3y/7h0etJ4dqWkKroNzQsquebxO5qyFaGjYis6KMtjkhbQ8WWEEW8huFYcuGl5oIZpizcwPIr2yKbJgwWTgBuM4YhHa8PJmpWG/k5MGIEQGuEGzJLhpbBlDRIJFM4bgPM/mnYBkyBKXWBVKbZddGaxkl6ZCx0c5XXWQDSOo2Jt5iS0ONBK80k7k+XoDMzV06Knzuf4aK/v9tYacUCYjf7RR94ktu539wuqIoTQlyTJMBq3katoEMUgfp2eSBNAdJIax1bECfT+b+NNGVh0Rxx8u9wqqRMlsvvgB5fHcCzH27q9kAt0Mx4AKiooKM2C6sJgVEmHhRGz/HZWan0QiMQUxMi65dAqMgnsii8GHrwJllY0uRTsJovNOCxsvh3ua9qSrrc82/6Y05reobAbdv/CflhGiwnuUERmykdmFt9oMq/zZcrXHGN1iBTM9zy9k76SGYZT1lJAG6Elcw6Ol900NaQzhp5nGhuz5wIV8Ao9nU
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(52116014)(23010399003)(10067099003)(11063799006)(56012099006)(6133799003)(38350700014)(921020)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EJOwpe8pwd9zlLdHJiWjy7HmYz87Ai3LZ+94CKEKHj8JDebNTRT2Seez+NYB?=
 =?us-ascii?Q?lMAwjykHQNgK1YTL2En83KyeJKE1gL/cA+/1Ju1TiZxW0jV7B9523pAiNKkx?=
 =?us-ascii?Q?cEXQe2Z95+5tzWcpmXc49cwSnb3wRZcx/ar3fm5/GipGpLGPWo76zoHmn56l?=
 =?us-ascii?Q?EyjO84DlWpeUM6kBfAm0qGyYye6KIFIJ/M9kFif/xOdC4L/7FwvCcOMORN8C?=
 =?us-ascii?Q?hn3meXB1SnTJiKJnNVwWXWbPm6xkC5nB3Sx2R6Q+OllWnEKByoTNcL7f8sA6?=
 =?us-ascii?Q?gyGjOta7QDW8QDoDmjBJZIoekC0EsTDHfyZULuQkDoZYQ1ZrMTSlh5e3U68u?=
 =?us-ascii?Q?duN8lG1IDtyz73JdxOw9d7z73ZlV7Ev8KQiF2MGgK4lnuxP8LRGpJzMf0nbC?=
 =?us-ascii?Q?GeuEAPyqhiMLW6tn9dJnsnbSgIFe30MOEAytY1fONYpPz1ZSLc908f4+sjow?=
 =?us-ascii?Q?N5NRwktM/G6aoLiPk0KgknNN6exfOgl/f/vxGoeG/esCdzEoCFMOYzQLfICB?=
 =?us-ascii?Q?ubT4VEj1UqLURdg+Cc/9oCpb4tR8RyARxl3NrVBSg72I71gnPfBxsK6rnmMc?=
 =?us-ascii?Q?5omPZ+30y25u0eZG+9SkiQNNnwxAY6dZZeNVWo6DcPcZu1bvi/e4pScGrkjk?=
 =?us-ascii?Q?oKXlL3G28QYqMeZZSZjOMOokMlSdIUFIDJqtxReAjs5UdvRcMjfvgLJqmUAi?=
 =?us-ascii?Q?cnAVQMIMB+sJ0KQlknfoC353LxCZIi1VSFAmBb+D3FzsMwYHn2pyXTPoFjOd?=
 =?us-ascii?Q?RtMlbq4z+z6i3/x75PBEi3zcm9CCqxhlivMl0+Td2mLj3r669lRhwyWqtLR3?=
 =?us-ascii?Q?OLxjRQsA4fAuG6j8XW+vMREcRNaRabiNIZGSLeGjO3rKY6XGD0VDEbJlDH8y?=
 =?us-ascii?Q?0PgnqdjTsUDSzFU/FdmZMGKsiIybo9zWz22GylDDh6eMPE7inTkZgeeWqk7b?=
 =?us-ascii?Q?FD5nUw0qWr48xJEuH1l5OlJhWPu0qLS9y+olAyPOglLna/1Ze8iyv5TuY0Y4?=
 =?us-ascii?Q?W0ayXkxP+GXWyaRi5i/sLJGHpaubAsHOI2rhC2gIqST+ufUztVzbEfYJb4ui?=
 =?us-ascii?Q?T29hhCgGNkZH4us4suNWtcMfyliJIm9gA5vhBEhl0mLvHc8bxkh5whpw8Fay?=
 =?us-ascii?Q?+h5foO3MreoU9DffZw08wWCg2jXcjOHeMuVZhg2FzHq9+HLAilBREKf9/reP?=
 =?us-ascii?Q?wKVyojSbo3VrRrKBAl+hBUpkqA5dkiiGIO6nWP5AIcx5HBdM5Xsj6bCDZmfm?=
 =?us-ascii?Q?oAyM087zdBSS6dICaGlUNZU7Z8N2j/OWYUylMwmiPHLaySSLjId/Qj5T7QRG?=
 =?us-ascii?Q?wtzrAOQiPV9FyWWOAHchYwiuqgKTh7HL3nsuVqoRs4GkHtM66IBDYrG973Lc?=
 =?us-ascii?Q?B0Ky1zkBq208PcYtwfIpymmbyPpnLbaJgYYw+8hJKopus0ptriTsOwRQUmLp?=
 =?us-ascii?Q?D5ymW7VepgXEpS/bodUm1pvqJFYEcBarn5K9G1n+vYu1HdGd7EzxPX44wgwZ?=
 =?us-ascii?Q?NrVOZ6/aVumCEDB6sjG4b+MHmUV7mPxlMNE7FTinsoE8Oj860O6pmruoDHDl?=
 =?us-ascii?Q?pFr+GnvpF/3Dy4sJQpz8WR/JNs+AHtBBZCXM3k3VDh4KQO8S4bGJqztPwKlM?=
 =?us-ascii?Q?GE7urNBCzsSNeD/En4b72GngzHFuRAFNPQRXpXmemF4xZI7edNJbAWy9NOlC?=
 =?us-ascii?Q?kpUIk7cgrvHcVf+YkWk3Yo8Di59bWezvJR4z2lZlSPBdCZ9tPcuim1N7SUFi?=
 =?us-ascii?Q?1CmR4S1LRw=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59f5012b-86e9-4546-3cd5-08dee799eddb
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 02:35:44.2269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w32nAXjyqrJzt6591N/ufJSsdDmbUYug0Tt4WHitfV2T05qy3vq3Uh8IlhuymX2knfMaElPjDouNY01Fxq3OYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2PPFEBA6DFDFF

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

