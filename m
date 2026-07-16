Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11013004.outbound.protection.outlook.com [40.107.44.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6809330DEA5;
	Thu, 16 Jul 2026 02:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784170377; cv=fail; b=c8+MzAss03t3ZNM9k2k8rbRh16VdIGC81cZ4KwyLGSH2jvHQFMeI8TyGhN9pnNbow34kiEqFplgfVpsqFrGBmtvLkEfUBu8mUQaf52Wc1fayHCvkrReBje4Mh8Jk3HBBi4hsiqNrR8cZv3wqeaBHh+7E1xydX6pkdSCeM66ZB0Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784170377; c=relaxed/simple;
	bh=yAViBLOmHaiikmcGDyx1XjICrbADd7txF0YMOH5Yubo=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=nVH4XlZvftnN/uKq5ufUSeOrM2pqKzrWDyULo/0e3RMIThtAVmLWnehTVK2ERLSAnRQIEC8k4j0vJ0Yb3csdpmoKfP1KkxJpQpvFpJ7ESrAWyK6zhdHvrcRoDvpID9cxFLx5drSx2PW7AtuuVxSbidnjW6XhQdPsxNOQDBcDFeI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=NIMjTTPe; arc=fail smtp.client-ip=40.107.44.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="NIMjTTPe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GE/FChoHl+CmhrvoTs8ypLwYjKtO9upcQ8Jcr96a1q8++bvQzfHL2gd60pGdadAE/PXaNhwHdoJ4elCbwDLQX9Qn1Fu2WYm/HIqbWrvYLQTD/a0m+neZM8spG2iF9DqkFFmpEC0C5zjIfQiCwAD8N8BaxRlj27aTmSoH4jo4AmB7gLw1meEgMNPH5T9X0x4cKusbJQngpKLzh4UWP+ej8xKdwt6uHZAOKPlel2J6E6NkmLhef7DvRlRmZqYB72vimL1YW0kUKwfKGRjU1JuIs1AD5SYaSsDemyi+yJ0JE6arcpInYWBS/5GmpXjP2p/fMTB3oVqMpsL3mKlCHRgZjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wXnMyP7fgXSqj28CdAoyyaN44ye25dj+eRCNL9NSZG4=;
 b=sQNj2LQm3iTl5jCueIEoBWlujXoSP/Zf/+knpSIke7uOP1slPKgPZjmzrXKZh6iTEotSNrY1epKpacghwXp9GoB8fUV4c/Isjb7AS154nYVtzoGcHTd0DpqUKR82YJqOH9JgzEwOfYopJfNx9rQWvH0qqu44z3DaZaUtCvV07ohuA+AUYZntN4243J/bM2aGb16kZrNiGoIX6046uov5l3UdYYmM26LDqneKFAH1lQoLP2AhGSR+SMPefuJ1J7G6zBx8BkMF6Djn/rUie01wMPy60tOGA4Ps1oHcPRisTCczQMVF0ku7XQ2WZryqupbLKv9WhLRjuYgsmnLzA1PQ6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wXnMyP7fgXSqj28CdAoyyaN44ye25dj+eRCNL9NSZG4=;
 b=NIMjTTPejDTkWOgv0Vab/7KSOyTBueKfAdpy81oqDqrA7SLWBrK8E4z7kuBrSS/l7HdbRPu+Z6FoFwxZxmHilfc+hPHhgrdgjF8D7ApYeaseVxx1lrAvg71GceSUSu0Qo3b9vrzKBCX1ZewTOUt/BiZA6FuIyweOt92NKSim1lPPlfHVZV2x7S6vxCWJZNpT6VtWJb20RSKpt0PXHI0/9srSh/OtEPq6EISdLnaEi411GKxwcWXM2ZHMtOZ9t46TgB7/xZVnRWKvXtX/GrnXXFnX7QQtIeLChPDn29a8Gkv1Bfzl2LH4pZK/sGgF6jf2nyvMOtxMJNmSQ4Y3MTRQkg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by SE3PR06MB9089.apcprd06.prod.outlook.com (2603:1096:101:324::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Thu, 16 Jul
 2026 02:52:48 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 02:52:48 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Jassi Brar <jassisinghbrar@gmail.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Tushar Khandelwal <Tushar.Khandelwal@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-kernel@vger.kernel.org (open list:MAILBOX API),
	linux-arm-kernel@lists.infradead.org (moderated list:MAILBOX ARM MHUv3),
	linux-rpi-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	linux-riscv@lists.infradead.org (open list:RISC-V MICROCHIP SUPPORT),
	linux-arm-msm@vger.kernel.org (open list:QUALCOMM CPUCP MAILBOX DRIVER),
	linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32 ARCHITECTURE),
	linux-sunxi@lists.linux.dev (open list:ARM/Allwinner sunXi SoC support),
	linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT)
Cc: Pan Chuang <panchuang@vivo.com>
Subject: [PATCH] mailbox: Remove redundant dev_err()/dev_err_probe()
Date: Thu, 16 Jul 2026 10:52:13 +0800
Message-Id: <20260716025215.33592-1-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI3PR03CA0010.apcprd03.prod.outlook.com
 (2603:1096:4:297::7) To SEZPR06MB5832.apcprd06.prod.outlook.com
 (2603:1096:101:c8::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|SE3PR06MB9089:EE_
X-MS-Office365-Filtering-Correlation-Id: 9493be70-187f-453d-f8f8-08dee2e5516b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|52116014|7416014|18002099003|10067099003|56012099006|11063799006|6133799003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	TGGYvIRLYLiH4h2shhjWL5fYGbxWagLqtrPiNnDf4VQjX7I89if214raNnHJ+3cXs2PLRW1U123hSIBCaqDRNi1MoMFHy6eVmcp4cuCHPdqseDOMG/S8p+86D8K0QvFr1+EgWAN5lYpwT18rAnW5wzlF57vJwGmuHD61daurk33DyU2QdEjY/0/f5U/k3iFihULhS0TxTDjYUY/jBOovIvxuipTaCSU2SK3DAKpLezZeZlAKvTznclQO+ImmW41PliZfPbTKCUUL/TySP6AxnSeWq//31DJ9UBD/ZzndKmR8Mhm46LWBQx8pT/zJptte9XNOoaID6BO/nx3dnyIQm6M4uPtl11st6Vm20MauMr0mg8tQZj5KUmolwAwv4GPQSeFeOED4mMvchCECG8bogk6eSJV6SWIAfUQyRNjj70O/cyG0HXVelP5qe6QVxUb3gM4tlDIHtJ4QSPQNFtUzTGK5OeOB4hgp9lGqX25koMU5ghqSLSBKPpGEIPV1qE71rMrJnaS+SUWD45EX10Xtsu7OwQ3gD6W27E7PKYhcSMJ9e9Ih5gZRh+Ans8ZwSxcQHcz6KOgcU+gr8fic1mVrLPL6ApQ/tDgeEydS2i15ME/ALZ8/CbvA4UInyq4Y8abGzzm583zdxOBjwjwK5BG0D1jT6MPgf3T/t+jI6dUwd6ANqozd0019NUIsUkZ8G9//1saH2aeNedl8zTc19Q45B5ucFwS8cK+qfTKarvE2IIg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(52116014)(7416014)(18002099003)(10067099003)(56012099006)(11063799006)(6133799003)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MkuMoh4HrkTPqJg9dX+aR344AsgxXyK6ysyyFyw5ynp09L8Rf3k+/Z5scYKM?=
 =?us-ascii?Q?WO8LLW40GpcI7lA1KTntIDkcLJVQYL2h3MsLeJ+Panc2SwH1IHCWVb+OAxAN?=
 =?us-ascii?Q?wRujuj7y8nCNcFeChGDNjA1BY29ZAznC6+VEi5w39YSUlfYYhJJhOARZ5SzB?=
 =?us-ascii?Q?i1xc0bhdoqxQNM4BzcD5TOrsbzD9i3IM1PaT2VpwhtIkWzcz3IUcpPz9Vg7o?=
 =?us-ascii?Q?x5pSdh0v1lZCGyVohfZICVt+l00RQxO2kP0O6Zvv6Fl0F4VAcDgAIioPv2HZ?=
 =?us-ascii?Q?WpZwzMLZNe0z3k0hJ0OI+bALnMhKIBhA/GxIL/6scM+PGq1pKI54wHciADc3?=
 =?us-ascii?Q?iVGQ2HZiSggole+w+JUFpmyQZpGg0UfJFlLrG9PpvA/ajXx/yufUtgHPzfM2?=
 =?us-ascii?Q?nOxDWTAv+AZJIlr9KjMzZ7EzcEBFamoaSQ1JcCnYrDVGYwQY6KNUdcb5WPv3?=
 =?us-ascii?Q?iL+V+NmtvDlPKJua72/UixU9zVbt837JaTyP4WAssw2gfiZECKgltZMCURGP?=
 =?us-ascii?Q?fYPsVtetfcI9B3I13lB4wALNA7n0VsCAmH5oi5hN0zzfJOS5dffeOi4Wqiwn?=
 =?us-ascii?Q?3l0bg9tX5i08zgTqin/OBoQHvRUTgmtLgavlp2PJz8IJRiS3eGBZom9plKLE?=
 =?us-ascii?Q?fp3S7E/hXcwA2Edak/u9PxOVlm3TL93En7Dxq36EN3XqpoDD0QdBzz9OhRtI?=
 =?us-ascii?Q?ml248vDTbicabRyx7sdaWGozTGLWFkVx/fsHstcVnqcgAnB3PMePUJ/IjDCV?=
 =?us-ascii?Q?/ek9nLb+ir/G4ufbqYDpJ/kNNLdleE2sXllX2uDLA9mQUHa47z0kWGY10XGO?=
 =?us-ascii?Q?QW0pVFGiMfoiTEc6Y49pY2WzMJZW9jcdH/R87ffdkGVAYi+7rgGNu8aqa8qr?=
 =?us-ascii?Q?2f2C9YHZjwKRtOY9tty2cZayCXfBj4vKukDtKZu2qTc/VRg3v5X25UOgjV5a?=
 =?us-ascii?Q?W0PchaZ/lyNp+RJMp1zfmIUKy/D9PZfY/HumvU6eOcs2gmLLvAYHUH69MAaI?=
 =?us-ascii?Q?ULfbxdQk/JFzNBgusNz1gT+woZocPnpry3EdhN5ebPkReyKgn7MADKUMJQ//?=
 =?us-ascii?Q?RBCBjn/vDkxka4MDKPZfoyVw4di9s2qO7tn97SP9XiDcJ0GxRrgAFCA3NrcD?=
 =?us-ascii?Q?D2GolVJZ7fwyA4CNAueeaJDWLTWZWxLhehG9T5GKRJTKiogP/XOyc6MhCC9q?=
 =?us-ascii?Q?L3nYFCgu/OwMEzWtDIJQTIJajjGm5TjAbn84w19kDeMjidkcAnRuKt+Bv576?=
 =?us-ascii?Q?opYdyNZCBn4woAa+kSmF7vi5gayHyrFi2V/iFl3zUkAyh7xGRl5CVDc/NE3p?=
 =?us-ascii?Q?Eq44w4cGp5CAw5mzcsnP3JT3Swu6sq7ttNhOKXG+bzEzPtTvGvJYYXeCHvU2?=
 =?us-ascii?Q?OEqH5tztbZG2o2EJ9Emup7ichnorLf0L+kkcsBPMGHzhGFmWVX1lMr6TgsoD?=
 =?us-ascii?Q?MumRZ03uE+z/W3nexYIHRU9E1J++CYbIB/eZfn7a7MlPx6ea9SR82BBFyZME?=
 =?us-ascii?Q?8H5k+F/VMYTbcC/HsllMyXv/uzCTD2bztQ0fXahDFl8/DSReZzgmo/vmnaIQ?=
 =?us-ascii?Q?kB+E7hdJwyWMwzh+vy7P302tQzQxokHL+D737csCVTyCl/DRtqyn92+LcaqR?=
 =?us-ascii?Q?UM/Z73VvLHo3Gs9FAF6Qjc9EXSz8yEoJ5L90KRGAMl28xgV14fuLU0/OO7m8?=
 =?us-ascii?Q?GHhuOzOss2ImQqJsJHji8D32zAHgVc/yQIWkFvbRjRU4iO/wwOx5OeQ9UJKl?=
 =?us-ascii?Q?2n137RXITA=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9493be70-187f-453d-f8f8-08dee2e5516b
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 02:52:48.2269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8EdCg3JLZVdR0oxf6/Egddy/6I46i/579tlm5WpEVmbgmdnd2frNo/9L4tJJkvsrzfYwhxtUf9i3Ws4E8BgLYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE3PR06MB9089

Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
devm_request_*_irq()"), devm_request_irq() and devm_request_threaded_irq()
automatically log detailed error messages on failure. Remove the
now-redundant driver-specific dev_err() and dev_err_probe() calls.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
---
 drivers/mailbox/arm_mhu_db.c               |  1 -
 drivers/mailbox/arm_mhuv2.c                |  9 ++-------
 drivers/mailbox/arm_mhuv3.c                |  5 ++---
 drivers/mailbox/armada-37xx-rwtm-mailbox.c |  4 +---
 drivers/mailbox/bcm-pdc-mailbox.c          |  5 +----
 drivers/mailbox/bcm2835-mailbox.c          |  5 +----
 drivers/mailbox/bcm74110-mailbox.c         |  2 +-
 drivers/mailbox/cv1800-mailbox.c           |  2 +-
 drivers/mailbox/hi6220-mailbox.c           |  5 +----
 drivers/mailbox/mailbox-mpfs.c             |  2 --
 drivers/mailbox/mailbox-sti.c              |  4 +---
 drivers/mailbox/qcom-cpucp-mbox.c          |  2 +-
 drivers/mailbox/qcom-ipcc.c                |  4 +---
 drivers/mailbox/sprd-mailbox.c             | 12 +++---------
 drivers/mailbox/stm32-ipcc.c               |  4 +---
 drivers/mailbox/sun6i-msgbox.c             |  4 +---
 drivers/mailbox/tegra-hsp.c                | 11 ++---------
 17 files changed, 20 insertions(+), 61 deletions(-)

diff --git a/drivers/mailbox/arm_mhu_db.c b/drivers/mailbox/arm_mhu_db.c
index 9e937b09c5fb..a39239e38a47 100644
--- a/drivers/mailbox/arm_mhu_db.c
+++ b/drivers/mailbox/arm_mhu_db.c
@@ -318,7 +318,6 @@ static int mhu_db_probe(struct amba_device *adev, const struct amba_id *id)
 						mhu_db_mbox_rx_handler,
 						IRQF_ONESHOT, "mhu_db_link", mhu);
 		if (err) {
-			dev_err(dev, "Can't claim IRQ %d\n", irq);
 			mbox_controller_unregister(&mhu->mbox);
 			return err;
 		}
diff --git a/drivers/mailbox/arm_mhuv2.c b/drivers/mailbox/arm_mhuv2.c
index f035284944c0..213fd4a39993 100644
--- a/drivers/mailbox/arm_mhuv2.c
+++ b/drivers/mailbox/arm_mhuv2.c
@@ -986,10 +986,7 @@ static int mhuv2_tx_init(struct amba_device *adev, struct mhuv2 *mhu,
 		ret = devm_request_threaded_irq(dev, adev->irq[0], NULL,
 						mhuv2_sender_interrupt,
 						IRQF_ONESHOT, "mhuv2-tx", mhu);
-		if (ret) {
-			dev_err(dev, "Failed to request tx IRQ, fallback to polling mode: %d\n",
-				ret);
-		} else {
+		if (!ret) {
 			mhu->mbox.txdone_irq = true;
 			mhu->mbox.txdone_poll = false;
 			mhu->irq = adev->irq[0];
@@ -1039,10 +1036,8 @@ static int mhuv2_rx_init(struct amba_device *adev, struct mhuv2 *mhu,
 	ret = devm_request_threaded_irq(dev, mhu->irq, NULL,
 					mhuv2_receiver_interrupt, IRQF_ONESHOT,
 					"mhuv2-rx", mhu);
-	if (ret) {
-		dev_err(dev, "Failed to request rx IRQ\n");
+	if (ret)
 		return ret;
-	}
 
 	/* Mask all the channel windows */
 	for (i = 0; i < mhu->windows; i++)
diff --git a/drivers/mailbox/arm_mhuv3.c b/drivers/mailbox/arm_mhuv3.c
index a1c528be47f3..6569c3dda377 100644
--- a/drivers/mailbox/arm_mhuv3.c
+++ b/drivers/mailbox/arm_mhuv3.c
@@ -982,8 +982,7 @@ static int mhuv3_setup_pbx(struct mhuv3 *mhu)
 						mhuv3_pbx_comb_interrupt,
 						IRQF_ONESHOT, "mhuv3-pbx", mhu);
 		if (ret)
-			return dev_err_probe(dev, ret,
-					     "Failed to request PBX IRQ\n");
+			return ret;
 
 		mhu->mbox.txdone_irq = true;
 		mhu->mbox.txdone_poll = false;
@@ -1020,7 +1019,7 @@ static int mhuv3_setup_mbx(struct mhuv3 *mhu)
 					mhuv3_mbx_comb_interrupt, IRQF_ONESHOT,
 					"mhuv3-mbx", mhu);
 	if (ret)
-		return dev_err_probe(dev, ret, "Failed to request MBX IRQ\n");
+		return ret;
 
 	for (i = 0; i < NUM_EXT; i++)
 		if (mhu->ext[i])
diff --git a/drivers/mailbox/armada-37xx-rwtm-mailbox.c b/drivers/mailbox/armada-37xx-rwtm-mailbox.c
index 456a117a65fd..047926711e96 100644
--- a/drivers/mailbox/armada-37xx-rwtm-mailbox.c
+++ b/drivers/mailbox/armada-37xx-rwtm-mailbox.c
@@ -108,10 +108,8 @@ static int a37xx_mbox_startup(struct mbox_chan *chan)
 
 	ret = devm_request_irq(mbox->dev, mbox->irq, a37xx_mbox_irq_handler, 0,
 			       DRIVER_NAME, chan);
-	if (ret < 0) {
-		dev_err(mbox->dev, "Cannot request irq\n");
+	if (ret < 0)
 		return ret;
-	}
 
 	/* enable IRQ generation */
 	reg = readl(mbox->base + RWTM_HOST_INT_MASK);
diff --git a/drivers/mailbox/bcm-pdc-mailbox.c b/drivers/mailbox/bcm-pdc-mailbox.c
index 406bc41cba60..6fcc4002ad4f 100644
--- a/drivers/mailbox/bcm-pdc-mailbox.c
+++ b/drivers/mailbox/bcm-pdc-mailbox.c
@@ -1403,11 +1403,8 @@ static int pdc_interrupts_init(struct pdc_state *pdcs)
 
 	err = devm_request_irq(dev, pdcs->pdc_irq, pdc_irq_handler, 0,
 			       dev_name(dev), dev);
-	if (err) {
-		dev_err(dev, "IRQ %u request failed with err %d\n",
-			pdcs->pdc_irq, err);
+	if (err)
 		return err;
-	}
 	return PDC_SUCCESS;
 }
 
diff --git a/drivers/mailbox/bcm2835-mailbox.c b/drivers/mailbox/bcm2835-mailbox.c
index ea12fb8d2401..5af1e434c71c 100644
--- a/drivers/mailbox/bcm2835-mailbox.c
+++ b/drivers/mailbox/bcm2835-mailbox.c
@@ -147,11 +147,8 @@ static int bcm2835_mbox_probe(struct platform_device *pdev)
 	ret = devm_request_irq(dev, irq_of_parse_and_map(dev->of_node, 0),
 			       bcm2835_mbox_irq, IRQF_NO_SUSPEND, dev_name(dev),
 			       mbox);
-	if (ret) {
-		dev_err(dev, "Failed to register a mailbox IRQ handler: %d\n",
-			ret);
+	if (ret)
 		return -ENODEV;
-	}
 
 	mbox->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(mbox->regs)) {
diff --git a/drivers/mailbox/bcm74110-mailbox.c b/drivers/mailbox/bcm74110-mailbox.c
index 344cfc35984b..c8709d509912 100644
--- a/drivers/mailbox/bcm74110-mailbox.c
+++ b/drivers/mailbox/bcm74110-mailbox.c
@@ -601,7 +601,7 @@ static int bcm74110_mbox_probe(struct platform_device *pdev)
 	ret = devm_request_irq(dev, mbox->rx_irq, bcm74110_mbox_isr,
 			       IRQF_NO_SUSPEND, pdev->name, mbox);
 	if (ret)
-		return dev_err_probe(dev, ret, "Failed to request irq\n");
+		return ret;
 
 	mbox->controller.ops = &bcm74110_mbox_chan_ops;
 	mbox->controller.dev = dev;
diff --git a/drivers/mailbox/cv1800-mailbox.c b/drivers/mailbox/cv1800-mailbox.c
index 4bca9d8be4ba..b062c2c4fc61 100644
--- a/drivers/mailbox/cv1800-mailbox.c
+++ b/drivers/mailbox/cv1800-mailbox.c
@@ -189,7 +189,7 @@ static int cv1800_mbox_probe(struct platform_device *pdev)
 					cv1800_mbox_isr, IRQF_ONESHOT,
 					dev_name(&pdev->dev), mb);
 	if (err < 0)
-		return dev_err_probe(dev, err, "Failed to register irq\n");
+		return err;
 
 	for (idx = 0; idx < MAILBOX_MAX_CHAN; idx++) {
 		mb->priv[idx].idx = idx;
diff --git a/drivers/mailbox/hi6220-mailbox.c b/drivers/mailbox/hi6220-mailbox.c
index 69d15b6283e9..8eb8242209be 100644
--- a/drivers/mailbox/hi6220-mailbox.c
+++ b/drivers/mailbox/hi6220-mailbox.c
@@ -297,11 +297,8 @@ static int hi6220_mbox_probe(struct platform_device *pdev)
 
 	err = devm_request_irq(dev, mbox->irq, hi6220_mbox_interrupt, 0,
 			dev_name(dev), mbox);
-	if (err) {
-		dev_err(dev, "Failed to register a mailbox IRQ handler: %d\n",
-			err);
+	if (err)
 		return -ENODEV;
-	}
 
 	mbox->controller.dev = dev;
 	mbox->controller.chans = &mbox->chan[0];
diff --git a/drivers/mailbox/mailbox-mpfs.c b/drivers/mailbox/mailbox-mpfs.c
index 6c40d865b3f1..704a259bbca8 100644
--- a/drivers/mailbox/mailbox-mpfs.c
+++ b/drivers/mailbox/mailbox-mpfs.c
@@ -219,8 +219,6 @@ static int mpfs_mbox_startup(struct mbox_chan *chan)
 		return -EINVAL;
 
 	ret = devm_request_irq(mbox->dev, mbox->irq, mpfs_mbox_inbox_isr, 0, "mpfs-mailbox", chan);
-	if (ret)
-		dev_err(mbox->dev, "failed to register mailbox interrupt:%d\n", ret);
 
 	return ret;
 }
diff --git a/drivers/mailbox/mailbox-sti.c b/drivers/mailbox/mailbox-sti.c
index b6c9ecbbc8ec..4fb5d1b5504a 100644
--- a/drivers/mailbox/mailbox-sti.c
+++ b/drivers/mailbox/mailbox-sti.c
@@ -468,10 +468,8 @@ static int sti_mbox_probe(struct platform_device *pdev)
 					sti_mbox_irq_handler,
 					sti_mbox_thread_handler,
 					IRQF_ONESHOT, mdev->name, mdev);
-	if (ret) {
-		dev_err(&pdev->dev, "Can't claim IRQ %d\n", irq);
+	if (ret)
 		return -EINVAL;
-	}
 
 	dev_info(&pdev->dev, "%s: Registered Tx/Rx Mailbox\n", mdev->name);
 
diff --git a/drivers/mailbox/qcom-cpucp-mbox.c b/drivers/mailbox/qcom-cpucp-mbox.c
index 862e45e8fbd5..8d0000e2b2f9 100644
--- a/drivers/mailbox/qcom-cpucp-mbox.c
+++ b/drivers/mailbox/qcom-cpucp-mbox.c
@@ -156,7 +156,7 @@ static int qcom_cpucp_mbox_probe(struct platform_device *pdev)
 	ret = devm_request_irq(dev, irq, qcom_cpucp_mbox_irq_fn,
 			       IRQF_TRIGGER_HIGH | IRQF_NO_SUSPEND, "apss_cpucp_mbox", cpucp);
 	if (ret < 0)
-		return dev_err_probe(dev, ret, "Failed to register irq: %d\n", irq);
+		return ret;
 
 	writeq(APSS_CPUCP_RX_MBOX_CMD_MASK, cpucp->rx_base + APSS_CPUCP_RX_MBOX_MAP);
 
diff --git a/drivers/mailbox/qcom-ipcc.c b/drivers/mailbox/qcom-ipcc.c
index d957d989c0ce..e5ebb4a237ff 100644
--- a/drivers/mailbox/qcom-ipcc.c
+++ b/drivers/mailbox/qcom-ipcc.c
@@ -323,10 +323,8 @@ static int qcom_ipcc_probe(struct platform_device *pdev)
 	ret = devm_request_irq(&pdev->dev, ipcc->irq, qcom_ipcc_irq_fn,
 			       IRQF_TRIGGER_HIGH | IRQF_NO_SUSPEND |
 			       IRQF_NO_THREAD, name, ipcc);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "Failed to register the irq: %d\n", ret);
+	if (ret < 0)
 		goto err_req_irq;
-	}
 
 	platform_set_drvdata(pdev, ipcc);
 
diff --git a/drivers/mailbox/sprd-mailbox.c b/drivers/mailbox/sprd-mailbox.c
index 565502904e1f..9013d2ece55f 100644
--- a/drivers/mailbox/sprd-mailbox.c
+++ b/drivers/mailbox/sprd-mailbox.c
@@ -377,10 +377,8 @@ static int sprd_mbox_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(dev, inbox_irq, sprd_mbox_inbox_isr,
 			       IRQF_NO_SUSPEND, dev_name(dev), priv);
-	if (ret) {
-		dev_err(dev, "failed to request inbox IRQ: %d\n", ret);
+	if (ret)
 		return ret;
-	}
 
 	outbox_irq = platform_get_irq_byname(pdev, "outbox");
 	if (outbox_irq < 0)
@@ -388,20 +386,16 @@ static int sprd_mbox_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(dev, outbox_irq, sprd_mbox_outbox_isr,
 			       IRQF_NO_SUSPEND, dev_name(dev), priv);
-	if (ret) {
-		dev_err(dev, "failed to request outbox IRQ: %d\n", ret);
+	if (ret)
 		return ret;
-	}
 
 	/* Supplementary outbox IRQ is optional */
 	supp_irq = platform_get_irq_byname(pdev, "supp-outbox");
 	if (supp_irq > 0) {
 		ret = devm_request_irq(dev, supp_irq, sprd_mbox_supp_isr,
 				       IRQF_NO_SUSPEND, dev_name(dev), priv);
-		if (ret) {
-			dev_err(dev, "failed to request outbox IRQ: %d\n", ret);
+		if (ret)
 			return ret;
-		}
 
 		if (!priv->info->supp_id) {
 			dev_err(dev, "no supplementary outbox specified\n");
diff --git a/drivers/mailbox/stm32-ipcc.c b/drivers/mailbox/stm32-ipcc.c
index 4f63f1a14ca6..c6134de1a93b 100644
--- a/drivers/mailbox/stm32-ipcc.c
+++ b/drivers/mailbox/stm32-ipcc.c
@@ -263,10 +263,8 @@ static int stm32_ipcc_probe(struct platform_device *pdev)
 		ret = devm_request_threaded_irq(dev, ipcc->irqs[i], NULL,
 						irq_thread[i], IRQF_ONESHOT,
 						dev_name(dev), ipcc);
-		if (ret) {
-			dev_err(dev, "failed to request irq %lu (%d)\n", i, ret);
+		if (ret)
 			goto err_clk;
-		}
 	}
 
 	/* mask and enable rx/tx irq */
diff --git a/drivers/mailbox/sun6i-msgbox.c b/drivers/mailbox/sun6i-msgbox.c
index 6ba6920f4645..1cbc4d478beb 100644
--- a/drivers/mailbox/sun6i-msgbox.c
+++ b/drivers/mailbox/sun6i-msgbox.c
@@ -257,10 +257,8 @@ static int sun6i_msgbox_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(dev, irq_of_parse_and_map(dev->of_node, 0),
 			       sun6i_msgbox_irq, 0, dev_name(dev), mbox);
-	if (ret) {
-		dev_err(dev, "Failed to register IRQ handler: %d\n", ret);
+	if (ret)
 		goto err_disable_unprepare;
-	}
 
 	mbox->controller.dev           = dev;
 	mbox->controller.ops           = &sun6i_msgbox_chan_ops;
diff --git a/drivers/mailbox/tegra-hsp.c b/drivers/mailbox/tegra-hsp.c
index 500fa77c7d53..03ee73aad488 100644
--- a/drivers/mailbox/tegra-hsp.c
+++ b/drivers/mailbox/tegra-hsp.c
@@ -708,11 +708,8 @@ static int tegra_hsp_request_shared_irq(struct tegra_hsp *hsp)
 
 		err = devm_request_irq(hsp->dev, irq, tegra_hsp_shared_irq, 0,
 				       dev_name(hsp->dev), hsp);
-		if (err < 0) {
-			dev_err(hsp->dev, "failed to request interrupt: %d\n",
-				err);
+		if (err < 0)
 			continue;
-		}
 
 		hsp->shared_irq = i;
 
@@ -856,12 +853,8 @@ static int tegra_hsp_probe(struct platform_device *pdev)
 		err = devm_request_irq(&pdev->dev, hsp->doorbell_irq,
 				       tegra_hsp_doorbell_irq, IRQF_NO_SUSPEND,
 				       dev_name(&pdev->dev), hsp);
-		if (err < 0) {
-			dev_err(&pdev->dev,
-			        "failed to request doorbell IRQ#%u: %d\n",
-				hsp->doorbell_irq, err);
+		if (err < 0)
 			return err;
-		}
 	}
 
 	if (hsp->shared_irqs) {
-- 
2.34.1

