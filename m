Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11012034.outbound.protection.outlook.com [52.101.126.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB35E3BD644;
	Mon, 20 Jul 2026 13:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784555077; cv=fail; b=OzRN65HIArZEnJMWnYYfpF/7VqAoGnoZkvUe9mONUtqMctWiWB8do/tRm1HjrEO8UD+DEnJDP+jyd/nFqRwX+uR3eemmo7Rz9Hg78PiZ87ovYJtq/nA3OBymhRX52ygQwrlJQi93OZ0CBlC5cwVLRGJuwcwDFbn2ts4eMvzxrWw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784555077; c=relaxed/simple;
	bh=hOqYo5fu2rbAbxHFNxZ9RcAXPZy826erujSJ5YwgKGM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=spyz/zNNuWBo8U8C2wPLOzg9+ETAkiXpt8OuQvSx18MU3PWVDbXxoPBqurGlzG6kqlgmh+f/ZbCkqLCD1X5UtDBPgPfhNxAp6BkFQorQxflfwu2JKH8l9quHlToWFr8jFURThrsROWuDJ5uY1Mqn4owE+C9bvdPfu9IaB1sXeZk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=gSPFnRTO; arc=fail smtp.client-ip=52.101.126.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="gSPFnRTO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JuaAHpFXzMza/4T73j6+qh/PNjxHDJJbwZKYBilbDzzxtLpBr2lz7hQD5RMpqwVCVdn3cDHkc6ucsaOgldcbQiK1Bk/NqcLQuB8NufqVuyBleJ4IFkTPkOQKpdjoi/8z1z108JYCWkW+OhhyxhC6oDJE6kAzMGThF5pn4xNFLUNYfHFK0pCqMTip6n1N8fFg5qHV0LJlYj8z0w6TkpnfqbfaARyav/RI07fWfm8KifHYPY94j8BphBOFxF6KGmer9dmq61Mbo5faQnKGhAN5GuOBXGrf/CeJWtYZqtZfHC0q65tihjpzizKIyHNPUUloBRhxtpGe/+RkFIbZXys4ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6M4t386ZK2fmr+f9z7qHA1SZxfmIdaBdW9FlC6Nwhfk=;
 b=dTtGLEjH+Cxl20amym3/9jGa90Im9KAS9fihHG8s9YOocSclGL7N42iKx1D3wD2cF4vb6+m3rsJg4Oh1duCeui5Sn64CFEK1NSO8HFamxhLBqWIlVRi8aoKS5EGLn8I4iiafoCc8eezYOILVoqbD0gTLXcgvUE0+JEOPE8YAorCY+EFcOf5sef+zhzGPsUuVHRwVPZxCfGuQ9vuq/o80RTj+PipjM8aB/3bopf93Odz9jkXmwenYfmNYfiuerfhnPEh8pLWypegHk6b6eS31TPuvoZqEQ/PfWACl1fN8suvSIUYm9lJ2W2BXPOh++fxglNjG+7k4b7yZiSFXo1H9Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6M4t386ZK2fmr+f9z7qHA1SZxfmIdaBdW9FlC6Nwhfk=;
 b=gSPFnRTO/d00a6UEq7r5+GeXsdCbgBJK5ei8GYzbljOZ4v8pRgptv2l6wjCUiqFOrGvkQXwKn/lc+/681Zl7RzlwB+KHgz/Jpl+NGGQuTCadFb0D1SlnyhcPrn1vO09L6Aht2mgadwNdE4UC0ML+/Qu15zK4ieGLApZSGlAwFvRdCx4ZW8dCKR95HI6wP5I3yY7Z6TCG99qVpLqakiAilkp9uVHMw93uaz7jUaEk3C2p8cEIsn1RF4xp9EZhYPaC0KGw61ryjuvUlcQ0mNkQB72R2HUkHS0dl/ZTOU4ZOmhqKaxbUnETMU6/6t9YgVXnvJYfhzbUu4/xAcziN9O+iA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by TY0PR06MB5457.apcprd06.prod.outlook.com (2603:1096:400:32a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 13:44:10 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0223.017; Mon, 20 Jul 2026
 13:44:10 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Marc Dietrich <marvin24@gmx.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	ac100@lists.launchpad.net (moderated list:STAGING - NVIDIA COMPLIANT EMBEDDED CONTROLLER...),
	linux-tegra@vger.kernel.org (open list:STAGING - NVIDIA COMPLIANT EMBEDDED CONTROLLER...),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Cc: Pan Chuang <panchuang@vivo.com>
Subject: [PATCH 7/7] staging: nvec: Remove redundant dev_err_probe()
Date: Mon, 20 Jul 2026 21:43:13 +0800
Message-Id: <20260720134324.239391-8-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260720134324.239391-1-panchuang@vivo.com>
References: <20260720134324.239391-1-panchuang@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TP0P295CA0038.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:4::11) To SEZPR06MB5832.apcprd06.prod.outlook.com
 (2603:1096:101:c8::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|TY0PR06MB5457:EE_
X-MS-Office365-Filtering-Correlation-Id: fa812ead-3c68-4419-4d59-08dee664fa63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|52116014|376014|6133799003|10067099003|56012099006|11063799006|38350700014|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	1UboE5fo/+qqb91EkJ7wLASJ3CXSKTm57CPHwetRMWJmrxnSLT2FEiNLwaAkxH8iSrHVJ1v3Oig8X56bq5JkfbrcYWDLDOxgsD36LFFM2NPkLx23RgqD5T+ehKoF0gIlDsoGbeQimdjWNI8cHbl6xJMj0rtGVqVLkKgykyyG5Rzj8EpgqPP1FLRqhnrj6ebh+IMMNk8VsSWv4knUrYPYR7ltcGFiPIdB1hOT/BM7AtOG1gV4vdTgA+dPS6GwWZH7fR2j1+t7irq2Ge5FSfttfN+0YM4BNRWwUaAYpmOnCWg4ezLnqqAsucd1gMFYKRr1pZ37LX1IKzc8qzRRnk00zgWuvgN2xoO56HdCuGawwXkj0VohEMWuPdDC6groecJ0NLPNCIKWUyr5LVquP5FR2ooJJsdSzZGR/U8uOG5+HbshyhdRYkHmib0xffrlu3l2VvntmMq9XHDM/nB8eXOM4n58r/nTKVepm4OQiqgwf2xXCLkOak4JWxhzfJOL7oO9qLq9EOEwg1q226qFMmxbrjQ29GzgMR00n2JRpIGhdfZU/IFLLK/h7RExEnwvdFIdstB/KnnZzSiNPXc54kShPfHkG6TTXvpEM0zq+PtdZhX/YWIWJT9uZk5XXziFFBlWoUa9JOxIU6Y7ynr1FAAGf+mOYlbEqBPYmNxzElgFWKUftxMoFhCh7IJwDXW2uEfOiyo6RXq2Knej70hQY4wCE6VQ4hZ+hsUTK27IeF2Etok=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(52116014)(376014)(6133799003)(10067099003)(56012099006)(11063799006)(38350700014)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?11l+FDVQBVros3wgor1mp4N9qyo5rTgDSamzdHhgxdS7jVOBtHZFMFjxqMOE?=
 =?us-ascii?Q?/hB79vJI8mEs3Aa2CiFD7Qk80oGastSc1EXzGKcVYMmpO5nID0VLYLdmXl1g?=
 =?us-ascii?Q?XPui4U1HXHOMPaCuVtDxNCBz7occXgsAolc+AczV1nfEx5S+pMYnVyN6KCno?=
 =?us-ascii?Q?RMr9q/LCwkvumBviZsX+MPAvLZGoOTLZ16fPcr+F+v2alZfXVLHiNJDSHP+B?=
 =?us-ascii?Q?tbNZLXNSzUxoeezFjYIpqbYrMjLQ3uCBvmvc4qe5uEAGWKwId3YT2BSI1kcm?=
 =?us-ascii?Q?OVuO9bXwoJD7j6bgJwOWIhX8VP4PkQp0fSgxCk3Fba0DWkI4b7jNt+ZkJr2e?=
 =?us-ascii?Q?p4qSgjsRC3Kmt6d4A914APt+5WkXtUChkV26fe7Iw6GKkuHyua8wbvgRYXa1?=
 =?us-ascii?Q?jAqv2V29iOlReHJi7cNdGMlyNy2USN/nDMHe6iJUQTl0piWeoCVSJ2AYY7tq?=
 =?us-ascii?Q?DZF/l8EeYpLLIZHwrchERA6KpG6iPnpniriwaa7L+bvzGT3AF98ZTq9tqlUY?=
 =?us-ascii?Q?P36dX6B+s7Or2RHp6NmOLIawdUBrcWhDJ8572YBCdNW4nPaPnAymIsJeSyY5?=
 =?us-ascii?Q?ocqYZXmB+zRYMzYyNZap1vYdMd6200D92BYzQYu4hi2HMkl4JdnzvO49gYQu?=
 =?us-ascii?Q?2DfqfXYJBcD4sFslq7RMQ1QmmtT+YguMqu7lNnHih9iWpdZcwMIUlDq8YAx3?=
 =?us-ascii?Q?YMzGEl7tAwryQVLjOaqJN+RShD7biDZeQ59+5KaclcI0xaPL1okYwyhRKCsI?=
 =?us-ascii?Q?17jZcoKDj5dtySw5h5gaj+18w33jAeUu3ckSWkB72EPvnshEn3nkYczIIKK2?=
 =?us-ascii?Q?GWNFlexyKSf0oPtSRHw1lpDmk+0s/fTqAJL3Qu5HqiWhA/oAvnLexC7bRI9M?=
 =?us-ascii?Q?Xg9QG0n+z4m2NuRJhlO1MFWCyKXOrVX5j3RsAFp82ujCyaTo16RvsHppahpg?=
 =?us-ascii?Q?2F1DtaW87MC2nV+wrmXOl7GXcXVh8WF0M8SFwFYXw08zL6H0EsHJdGAqPN1I?=
 =?us-ascii?Q?MqMziMcGnARUnu94PEkwlojWLZL2qY6Nj6fc4nXmYwOscuRhYJE5Srocnlrb?=
 =?us-ascii?Q?4e/Fllmzm/MCD7LpyVLJOECijbFJALgnuxM2p3fnFJ+ldoud1+0HbiZhYIwq?=
 =?us-ascii?Q?WdesiYn2e66TFx6QKwmvSRJkuRyICZHwa6fLAsqXyfmYEuIXdcInQZxu+8OU?=
 =?us-ascii?Q?QZ33nh0AUPoqzh5A3aNrENtyTksq6s69sdNsV1fkWPoNFRkweRcvW1nfTcMx?=
 =?us-ascii?Q?CVOzeP2U1GgSseZQ9LhJE+p3PV/QxeU5uMQjzAWy8+8VxXu85gRVHk+napy1?=
 =?us-ascii?Q?8mch1BMK8BEvuNQ/Q9E9LnaznFD01dlmXmr+BpGPc0yDpPdNOc5WhcQscl5h?=
 =?us-ascii?Q?J8MDkAHUPSlbx1WfGBqWEn0fo55XzMPS+SdYzB8aC2g6fjby0lgqz+o+/MIf?=
 =?us-ascii?Q?yQdSlAk64+HkFbo0ESuW9E/viK4PYdLoxfNaFcGaDnf8VbFateaJLJ3abIXt?=
 =?us-ascii?Q?9ItN/xLtty1FUcHQmZWfa3eBuF97bCvNTboTUBFT8x8BFP2pAJoy8eGrv+FK?=
 =?us-ascii?Q?yviIVq8cdQlDwEZ92EPgr8OWlhelKlspkmVNWeSEjS4F/vQu6mQuSMAKosHz?=
 =?us-ascii?Q?YuoNuSclPBSsn2WoOQDOzQTv0N4kkzI9vNJ06BB3dW1g+1p7cOeOLryqhNhJ?=
 =?us-ascii?Q?QmNNEg0yseZ8xh9zAoyBs+D7F/71TL6dC6KLGaZbu4km/VmcbsHPC+BxWvXv?=
 =?us-ascii?Q?BjZCnIW4Qg=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa812ead-3c68-4419-4d59-08dee664fa63
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 13:44:10.6713
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RsJNjcyL5ufFcEfxcInoswf2VIl1vUdUVL13ib2/+/lenq2kPX+zlbg9sv5oOk49aORiJUCdjI/OOLQu1PCv+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5457

Since commit
55b48e23f5c4 ("genirq/devres: Add error handling in devm_request_*_irq()"),
devm_request_irq() automatically logs detailed error messages on failure.
Remove the now-redundant driver-specific dev_err_probe() calls.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
---
 drivers/staging/nvec/nvec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index 41cbdfdc1da6..05b130aea870 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -853,7 +853,7 @@ static int tegra_nvec_probe(struct platform_device *pdev)
 	err = devm_request_irq(dev, nvec->irq, nvec_interrupt, IRQF_NO_AUTOEN,
 			       "nvec", nvec);
 	if (err)
-		return dev_err_probe(dev, err, "couldn't request irq\n");
+		return err;
 
 	tegra_init_i2c_slave(nvec);
 
-- 
2.34.1

