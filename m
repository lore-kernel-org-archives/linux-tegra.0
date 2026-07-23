Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11012054.outbound.protection.outlook.com [52.101.126.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4256B433E82;
	Thu, 23 Jul 2026 09:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784800519; cv=fail; b=YEZGmWYG4uCHeAq0rj4JFZoIMz0xgfLcLDv3tCGbyUVbLSb5aaExGo8NBQNAi91X4rkf9bYMG7NEb6Dtn92BvN8LiDUzc2iYSPQ4lVH6+XKagr6oQz/90WlLu0mRbmHvgWUpXHBxD5jK7yUSoNeG51faKa2C11ydVElpV6bsFY4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784800519; c=relaxed/simple;
	bh=DHQLyXq9Kt+KbTBr2EFoXwuRTXPqe8+88lQv07l+uYY=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=kU9fudZTDv6XYEj2x2JGvNe/w1CnAlW56q8mQ/RRk7Rd8004+LCl4WMncq9+vCavt7XW0m6p9C/m+KdzZqvzjN61LKqEsYbDLm81qVX9f1285LAIlV75kE7zlMkuzJOZRcuhn3O8Z0u1ZqxkA6BJ/87HUsFtK+6qa8NLJLGrlD0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=G7VWjJ5A; arc=fail smtp.client-ip=52.101.126.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="G7VWjJ5A"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f5IqJ8ZLPVhRl8ArrsM5tzmg+L7jgR564jKosgaqAwgtaUGXRnSbNnHhHuNCi1UzlCF+L0hexuKple625E1sxXi7HQGAAvPT0fzHHh2f42GEOKnQojVlfxliF1OdPOIYvlJlOf7nk64hPSMYaEKgt3QsSnVVd2CPl2zqoRWGzjvb0XpsbhLz/jrP+segEWulpv8r7WUAKOxg99wAbL59zX/lt09yrpc7180KToeAnMMdIB3pi9C+D2ceViEDV7PqilXxjL8ZIBgqw0mE9844WLv/h8inGuKXUZgpTSfJUq7+sqwFQmNuloJptshc4CXj5iq0nlulSPHC2KT36mcjqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4yBtfAS3Tt+H3ZRsdG9M/etI0671ZgseiSO/zuZ1Wp8=;
 b=TCAAXvw0oMajGDVwi4DxmySO1+iQxMIYnBgxrUjZRFdVWQzcKWO7L4YX0PCXce+jLD6ce8xMFUJ2ByjI8bcJCyPuRPly1U7V3uVL4/y1KLfP7TQRX8lfMT3/9kvkxgJv/jRqzAM1BBDbHIyZ5FDMGVt9ofKn2mZ/xr2ySlLDqsOrhVg6dNpcdXM+fK5546BmIUqpPObvfMXFmmKzHwvSsMq75MI0qTi8my4s++FfrteH6ZsPQ8ar8M9clhEGg8Yh4gCAHBqxvFfTUsUlxJyGR1ChDdSGeeUrQQBlp1JteGWeUfUOTvzTI+eIWOAjmxHJJ2TzFjsA630ucl2OmByDCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4yBtfAS3Tt+H3ZRsdG9M/etI0671ZgseiSO/zuZ1Wp8=;
 b=G7VWjJ5AzEKzoaRkXj57mN/i8aZ7oYryiJi385USsRqhIXsllJoocd6Zvr9BZVFnSRr5eWGnwzhQ2EJpKIt2t/KQJUH/IEgQMM3Hnv49RDVn/M02qW6yy0dHqYnrTtwrRJKh19vkoJVdbfiGsNOCq5JvN57Guut6dQwpF0jwSBR7Azq7I9lLsgNpTiGUanOLzRWDXrJSDBS9w9xv+70yal0O3vIBRycbEtlj3NVEjEVPFNomAWy+/jN/+ij4tLTEjaG7y0ZFCZKD2K0jwOITF5Is6WHbP32wAwowkInlvO+m+jy5AWs4NrHMWIBOmdqLylcjHBIfcsaYS2xWBrj0Mw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by SI4PR06MB8778.apcprd06.prod.outlook.com (2603:1096:4:2ac::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 09:55:13 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 09:55:13 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Ettore Chimenti <ek5.chimenti@gmail.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-media@vger.kernel.org (open list:MESON AO CEC DRIVER FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:MESON AO CEC DRIVER FOR AMLOGIC SOCS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list),
	linux-tegra@vger.kernel.org (open list:ARM/TEGRA HDMI CEC SUBSYSTEM SUPPORT)
Cc: Pan Chuang <panchuang@vivo.com>
Subject: [PATCH 0/3] media: cec: Remove redundant error messages on IRQ request failure
Date: Thu, 23 Jul 2026 17:54:56 +0800
Message-Id: <20260723095500.523448-1-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TP0P295CA0052.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:3::14) To SEZPR06MB5832.apcprd06.prod.outlook.com
 (2603:1096:101:c8::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|SI4PR06MB8778:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ab42649-6ce1-4fe3-1548-08dee8a07d6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|7416014|376014|1800799024|366016|921020|38350700014|6133799003|18002099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	c1XnP35noiRNdURLTbKZVlHlrOyds7T8wW/Rw65bCxZrzfcfZj3gd+E57Y4T5MTvd8EC680lDZXotNlMitDRmJhoOck+U68ZjFSLiRATWd/rLtSiDnD7ADXVhIePeZctw/jJi+jSnH3k4m8cQ9yFXhidl7QbqVl5wmIT2WNjfKYXl/v8GxpuPP4S87WzkuufBPE3Co9/q9Z045o0Ublyqgdj6Y4a/Jm+c8wCxDWtpIFkEZuwcmxTOx99qobE4oFFkneOg/xlNTwTPcAqdWvw8/eV2qzgxtNUa3Vp+4iZaqUnv+pyAoLGYU5lDGSHz1tCu8suMSs+6MZ1TvWJeB0edTmtMPY88o4Ewn4b0eyw/C7vnv0p78mYVNdN1Hmcv35ABBQpZ1heTXKgVSloliADo6bsU5LNbGmSNw7whLWnbhI6BwDkysvdurmpTkO/nBza5LWp8UbM6Uogt8gn0aTWbUUhKEt77MtB+RsaVsPWMklCYUgKRQ3lSi2btatzyK2wYJI3Bq9CHDBn00shrf8n3OT18pk08S13IrlVMkthzh5Fp+ut2udL5Ota1cR8K4MiFtMjy50MxMw1CsTOah64YS4avN4jzynFF5hc1gPLEa3tuDUiW9mUrkl90f5fh8KkFgOzp6xCDHttMgvE3A6ClE2W/824viJ8avbKcVVLWJGEzBcqEkosF7XN6OplBr8A64iGu2sEilB+M0RLQP8yhE6RtY3c3OMf6zXL2sFh85WmvMagax0nCpvINW14VDvF
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(7416014)(376014)(1800799024)(366016)(921020)(38350700014)(6133799003)(18002099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QF2jQQt/bF67uN1BkcnBrkk2WJ0BDp0SKeKgybcx9Wuc9y6RKD9il9zQTvuP?=
 =?us-ascii?Q?7Bh2J5uC+jC/4H9Tu0CB6y8sH6FO03wdscdkYJkE01IHO3PxQ0FcfevzddQf?=
 =?us-ascii?Q?anNJ0aNw4j2U+5Hsehi9PvSgXzHiVwck+pA6fCfIN+JGZrOjAk0ZhZv/Si7F?=
 =?us-ascii?Q?pOKXaRO9jRYKLp4wtrjNsNiw6NfcNxmGjQEbsJTrC7KeyGh6vSthv5QQi5gl?=
 =?us-ascii?Q?29WukJYC4Y+bgw8COd7Ike4iBUHinTDwLtefwjLZ1ZaqMSKLwIR0OPtskXFr?=
 =?us-ascii?Q?NxEbL7GEIwZKjL//nOiBlX0ydVN/idszSRdmTCXk58u+CXwjGeHgWMDw9+4k?=
 =?us-ascii?Q?itZFPSkzWGi7Gkg2K8WRwNaH7tkh0yEWZjqjnO7Ex3X0TSEaS2jyEBlXR49N?=
 =?us-ascii?Q?1CaMPrmXAO0hQTBrIkmC4OY7NIpmT1QXMCJyzV7ibrHzcN4J6LQ5ZKqprmxK?=
 =?us-ascii?Q?5EEDivOMBMlqXBqH+01/WUvPd65pNQS9lsyOeGtNskshp/UM0n7lo62FFpj8?=
 =?us-ascii?Q?vxYWBwOWyo+DKGnjb6q6u0ymfN68iiioz0f/BQoN4VAqKWjYXUkgfMVSs5rL?=
 =?us-ascii?Q?Amt6U06pe+BUiadlv6ytf3IB0xgAOILnIt/HK2PhLdtTb/CHynAOaQv9+WTh?=
 =?us-ascii?Q?1vO6x7bhUxz/g5qDcuvSp33JGUwSbYTpfshGma4OpVH6mKuyUsHvl3/2JeGh?=
 =?us-ascii?Q?O/OMJ9MO03TcdIIR6cRnF9Jcaf6QJxhma4trOBBYoNmYderIsJ745Zr+KEiU?=
 =?us-ascii?Q?oB+nZ5KDv1jxOXWvVqAKziRa7AnBcWpKo0/VCwYAhGt3eD5ACnfunZmnmnfR?=
 =?us-ascii?Q?JRlD8+enrAxvJTLafSqA4WM09P/Nqk1xklUIOeQFmkIaZGzyGqmjB0r0ufk0?=
 =?us-ascii?Q?qcXiQEBIiHDT7cgW1/S4BjcDTojmCNz4aMTCgOVidkJKUsZto0c/3/404GsI?=
 =?us-ascii?Q?/JER2zKGoWJO08lPULt2mI99FF3gHyOyykNXaXG14W5tnWHI+F2WPnuVZqP/?=
 =?us-ascii?Q?0R8uqznhIXsqSlZ6ysvO6Ht1Gq2IN8AkCmqa5C3JnY2QFfpPohlPmvG2nGcI?=
 =?us-ascii?Q?VwWbVZrVGnPSabQ6hW+ZT62Dtme84Rde5Gp/MXr2dVtkFMrSOtJHvfKBZTLL?=
 =?us-ascii?Q?TV9lF3eTZDKiw+0rh++Luhw+OlKVg+jxm+dVSfMmmwgSKoAujqZzYxIIVrjg?=
 =?us-ascii?Q?h+kPDQLn1fA1YuLZm5vNDqPsEQ70PmMXUHhk8AklY9GWIpMHFxMeDYo6SqUH?=
 =?us-ascii?Q?93J06ftfi3lCtgsjxhY3bzr719CahMEokeMl+YVo+UAggyIup2iLQe1Zyuxm?=
 =?us-ascii?Q?UuvK3JQyptO7A8bsaVsEqghyPDKGQj6BBUMRCTkuxrCosNOMw5QKyOY77d9v?=
 =?us-ascii?Q?PTsXbT+PdRDiBRq6YIIoF79NIHWxGKNji6db9TWEEFBG0O8qwNAc11ib7cW1?=
 =?us-ascii?Q?s5FCJgWnqxz0bBA+sca9/JlSb5B6a6RFlRW6mn30Uv6aUqPw2pkjqQAzDkge?=
 =?us-ascii?Q?YhSwoSwthPeJwV/crfrGBnQCYis3h6fFzElSxwRYW77N9AgDfZSlEu/CnGn/?=
 =?us-ascii?Q?3VcSxCHLvJ+HAtZB0k5NaBOVzgv/yuvQkliWLZ+G5kkxgkY6usUzOgN7wus/?=
 =?us-ascii?Q?k/4/iMlChDOc3nMZg1/m6gAsAEcJnHQGRT5+ZTpqFCTvjccUG9gi/H3uPVWI?=
 =?us-ascii?Q?FboEVcSL7zSZOhw485rQDSQck9pBBr6BP+2PSQK867I29n2lRHvqXfBJz7N1?=
 =?us-ascii?Q?ZGrLwsz2dw=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ab42649-6ce1-4fe3-1548-08dee8a07d6f
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 09:55:13.2742
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pvKNMZKeKS1Qk04pENOAXu3Ml7taVN90B+QEUqhs5F9KLitlUVAtUoxlhf8ms+U/JqDJ3dPFjSU1nuCaLPGipw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI4PR06MB8778

devm_request_threaded_irq() and devm_request_any_context_irq()
automatically log detailed error messages on failure via
the devm_request_result() helper, which prints device
name, IRQ number, handler functions, and error code.

Since devm_request_irq() is a static inline wrapper around
devm_request_threaded_irq(), it also benefits from this
automatic logging.

Remove the now-redundant dev_err() and dev_err_probe() calls
in cec drivers that follow these devm_request_*_irq()
functions, as the core now provides more detailed diagnostic
information on failure.

Pan Chuang (3):
  media: cec: ao-cec: Remove redundant dev_err()
  media: cec: seco: Remove redundant dev_err()
  media: cec: tegra: Remove redundant dev_err()

 drivers/media/cec/platform/meson/ao-cec-g12a.c | 4 +---
 drivers/media/cec/platform/meson/ao-cec.c      | 4 +---
 drivers/media/cec/platform/seco/seco-cec.c     | 1 -
 drivers/media/cec/platform/tegra/tegra_cec.c   | 5 +----
 4 files changed, 3 insertions(+), 11 deletions(-)

-- 
2.34.1

