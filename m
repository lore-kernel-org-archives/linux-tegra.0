Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010070.outbound.protection.outlook.com [52.101.56.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A0F3815E2;
	Fri, 25 Sep 2026 18:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790362561; cv=fail; b=jVEX/13mpMkA/o5JgOaUyEi77v8Un0lj+dvNPmVCk7CSjTqos12yDIxC4bKBqyX1x12EaHUrDq8U7lsL03GNSldxGm2p11R0k7/bB3R5p9/p8oUSorbEppbxm6UW2jb1ToPegwR1dKs2Nux8u0tLA26fwPZbbbRcrv4WZ1E9Kdw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790362561; c=relaxed/simple;
	bh=sqb0KvFbdNGp7trPhSGe82wTwIAru/aik0oekywUQoY=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Oxj+nU95icnYLj0/gWFI0nsAbLS47XUgUYkpedwhYjcElsM3aIfthLIOrJUMVx3Q+pJLOrUmNONjqy69hXJzaMmfdPfOzJVz8rDcKEKxgbuXSECZa3SsEQEc/Em7qpSVACxBC8NhBhaXUN5MPaHEYp9Mko6hWEaL7FIibVWBUPA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=PAAgDO3V; arc=fail smtp.client-ip=52.101.56.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="PAAgDO3V"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hOIkBWGi295g6tNPfRGPn8dREkybeK81FRR66/u+YlIBKDQSNIaYzNNE7b+LJdBMOPfSabO8lwd0qZo4xeraPd1ubhIlOylDrfF9XXuuvUQ74+Zbq8tPBJBus3vaJAAsq1hmYq6aKlo6/kVGxK2ZPblzI/FsZfL/fDOTZFwOyo53aaosJWpBe1MF04leX5KrHM2YC85Iw9HwGQuNF1twKbvUdBSpZsgQo0yMLmgSa6GeYEYZBr5Eu7Ss/sZDlo/18sEPJQ6EuyiEu/23mXxla4fOZVzF5+R9UFPxP9i4miwmJWRPzr0odCKzziKY2lhlJa6UfkEH8liXnjC+pdBRIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CaREmK0Ck1kczWrBWGfh2pyTsA12QkEM7o2v3caFZ98=;
 b=Brgob++2niFgcMf7d6RKu4GcAa7hK7sm3umRakIL18xP5Xpo5NhIWvzuApD3e52q2P94qRbg8Fy1go0clmEfznsYSUSMOldxTP4tdBuamfv51w2SjPgOhhwEU7j/LJ+Brjf5L4PuVtzu1KK24mmQFWgpNM20YJ72/1wuRSSH8Oq2inn/Z0ExW6bmxSF/fweOxmKvZls/wxT3/e64b3sxVoXDi5a9mOhVzr+rPYdatklo85jspi2UGJvM8WC4h+ZzLf9M9gjAA+VHI6l/qtmCmAwM9pasMQ618bJBJ4Ir4k8E9UZelBmV4kQfjlNrQHP4mKXJlm/UgZen7iP7VbsQQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CaREmK0Ck1kczWrBWGfh2pyTsA12QkEM7o2v3caFZ98=;
 b=PAAgDO3V8kmA+FinZx7tHW4b9EebMsC3VtTJqyQjgRgTp7z1ut3RvaRHThzMClQHB22h7KEIYjYB9oGDZSzgLK9w51UJHVTKu9ur+3X+iNjqdUxd+fQP5dx+hh8mhcWdAEOymc4zqRhJUyX3l8IyaiC5eSjYJlup8scJ58ZCZVyT/FEYjweetwoyJnswybcW4pYiJkc7dtUMx/qqIRoZ0NCU/trLpZzo1SXZm/dXUtr8KdILOESJDKOT7f7pKrntRfKkPZb4RYSY0XONJNUOwpONAxZluPVJf5mGIPcbRe2VzJhlKTw255QszXNVVTURwJLJyPHvh6X2745ElJkc5w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV3PR12MB9356.namprd12.prod.outlook.com (2603:10b6:408:20c::21)
 by CH9PR12MB209431.namprd12.prod.outlook.com (2603:10b6:610:315::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.19; Fri, 25 Sep
 2026 18:55:56 +0000
Received: from LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286]) by LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286%5]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 18:55:56 +0000
From: Yury Norov <ynorov@nvidia.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Yury Norov <ynorov@nvidia.com>,
	Yury Norov <yury.norov@gmail.com>
Subject: [PATCH] staging: media: tegra-video: simplify formats enumeration
Date: Fri, 25 Sep 2026 14:55:52 -0400
Message-ID: <20260925185553.242102-1-ynorov@nvidia.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DS7PR03CA0339.namprd03.prod.outlook.com
 (2603:10b6:8:55::18) To LV3PR12MB9356.namprd12.prod.outlook.com
 (2603:10b6:408:20c::21)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR12MB9356:EE_|CH9PR12MB209431:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b8fa5da-f53f-4663-f014-08df1b36a166
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|921020|56012099006|10067099003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	5v/vqhuv3VzSQnnLFC2TKc+z3bhCyamDWlAFDkSghZszwGtRWIXlS0oDaekmurFQrljYuaO5NORmyGIrYcOi4pQ+OM6LjlZft9+ijo9aodz9OHI5hhbN2bjftffBkZ2kDlVSVlk3PJlEzAdlau6IjsIal13ygx9I8wBU3rZnzY9tJYTknBDCcI/1gCUDBij8Vh6ffNH+dLykwPqBTBI9+4s1Z12xGEmlWA9IkukaqPjHjg50zrqKN7/3CJNXuJMuLjPTrbEoG6D1Ne9RjuPnDfttbkuUzVl3+unNK5Fn9ozZA0C12eV11KL40BtAS7m3z1nfl4zrFDpqEQTPOIucfS5I+cSazzUjGXPhvm50Ok3LxCLIv7J7U1mzOrTK/AKWylsZpzEMYL0SXCDvj8dDgEY35MSOYO6Ao7CyJCRkkmkeT137JIBJmxgNbkes68X/yQrDbQvEsIZFMc7NPtpibl+nBpkLq2elC78n7I0JuxbnX3NiM0rnoJiZBPU6yVk4xIDL8ltBwjcTagXUpdzSJw/8EsN+ZPwuMWYXzLlCbdBk6jwM81oKbkAaZXKuSYivwPNvAUChqBSrT3xBomRgAPvG6xswXCBgQ1hZ4baALv2RBwHbnMSVebr0u7CwbpFYd6l9sv+RHdG7CjrJPCssAKuUPg0Zg6nPlZtdRJO6lNOCuBcw9y5nyY1Kebq1h7CEZ1gjDrlzDNtshmaxCsKOBQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9356.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(921020)(56012099006)(10067099003)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NNeEgakMaMmYq/Y3QdG+lLH+fH2IRm8YLVx0+xURJYBiTQI7nZb0kSWR+Xwy?=
 =?us-ascii?Q?O68cc1a08Z0QS4MWchfbXnNNSTz3UhxizY0Je/YeMVsRVG4z3Ck/7l5pDvvd?=
 =?us-ascii?Q?DmFF23/9ZxpCalmxsEeNYf1KSDnt/ELMjo8Cw/c+VM4vdRkspgs/eWDHLxDD?=
 =?us-ascii?Q?bghol5y7sFxSdFGLCyuSTWbpdzBipK4qNE2ugo3yTn78hwUOfI8JB7JW1JBC?=
 =?us-ascii?Q?OSwgzdq+G+dIpJQbaTQmg5oDEdGrqG6ls4ZPK4gLjvtUfwp+femzoxmL7fbI?=
 =?us-ascii?Q?Ffzq8k3I4Yt9dXwH2qjxW1ubA6CEve9WdgxFnYxl86mhmu6n01Hb4vQsRPoE?=
 =?us-ascii?Q?XqE4xQP3SUdgApAvBExpI0hjZaqaqstT+2T3FgKwF4X13gSlr4otU194i/lH?=
 =?us-ascii?Q?blppYP9ySDP5emQ+8YLbc0MrV7fWj8VVrTi8J1MCCxwsd99ByX+aAwrQ9FSu?=
 =?us-ascii?Q?ASW3H95KkctV29eB+5X4JVulWwk/bJDDzWU6AqWABShJcj4fQ3CJdEttMsFl?=
 =?us-ascii?Q?IcLTCiJI9UXGrD2mMgP6w/YVBb12YtFS/jj84Pgfh92/R/NKAysV4uzaJXqo?=
 =?us-ascii?Q?STCXtumnYSSgNPljeigLivLXK5j107KrNJo25S+rpUNnDDgIAxT4xXRx3aB4?=
 =?us-ascii?Q?Y2arBR9vXQ3RNFoTHz4VLJsSFrmaoBWVsQZ19P0qxlzjLkcV9svXaGmNr2Oq?=
 =?us-ascii?Q?xDwhTzayzgXAHeblFGZ8UU82942EGYXXLK3WAC4KvLH9mFZ3+PjAb6No1yO7?=
 =?us-ascii?Q?RmlvoaKmSVyMC98wu7tVFFE6GSZBzNmdgZPWOWPT0oK3NCSQ1htO5nqyBd2I?=
 =?us-ascii?Q?VzfCHRTn5kUbsx8Lr+fwbN4cEvwrO0zk+7AlL0MCrdCDkjdFccFNz3NVqbLk?=
 =?us-ascii?Q?Fxdy4jiWERuEXK1ZQu/fL3JIoXrBjsutEN/w4kGM7HKmw+4yGyGsMZo4DORU?=
 =?us-ascii?Q?Bl+8Nxs7nfCuAZjtfexb6mo7zr7e5xOp94G11mxGADjvhHwCOugTSghwN5Xc?=
 =?us-ascii?Q?wbxdZWKnC4C67/FTR1zJPpUc6K+ZvFVJpT9RUsGnqpwNf6ec64ZKOoJqWD8X?=
 =?us-ascii?Q?GXqr2nwHZfhNR4vSHZnWWKTC5swV+qaZTtkXXkZ6uAPnAi+YoPdkKeRfIEpr?=
 =?us-ascii?Q?zX3dlQ92RhqSQ00DYF5FdT6JsNVKzMdiOcNEPx2Yg+pR8hY/vpy6Azcf/1/c?=
 =?us-ascii?Q?4Bh/AYfa16LxJHnleVx2FZXhr/YMezU2Ng36Pd+lGyVtUC3+MfzmhpfBL0c+?=
 =?us-ascii?Q?EYC9mTApy3lZ8SMcyrB9k30oi1wuM9mPIlPs+q7bq5xpfvFdQt4i+SfGXvnc?=
 =?us-ascii?Q?2R7RVPsOvJxqtpkbKrCWY2VZp0RDSZP+nGx0DfLNdb3BuvDBxmz31M0iM8ZO?=
 =?us-ascii?Q?b0XCp3lCSIDicpSYOERznMH9jesRi8eWhGc4wxTt9DBqHTtyIOYwSRx8z5at?=
 =?us-ascii?Q?TyMh6vV4kACcY69vlRZ55zHu6PtuTTkOP9hGpm/Hq/jg2Izv8nq2AiXpRyx0?=
 =?us-ascii?Q?9IjHVUkkiKkT5LbnS92EXTY+MgJYRlatcCP4TNcvh6y/SXv68J2hRDsl9cfH?=
 =?us-ascii?Q?RXR++rYC+OZHbuH1MudeakZdXztjjiU2diywORv93sgt5DeIUOG8S802XmiE?=
 =?us-ascii?Q?LRozogglO0VplNrHroHBKIQsA1q+Ux/Zvssyhns2ZlaOamgR7QmzOeI05OQC?=
 =?us-ascii?Q?5LkakjfFnerQERsxt+XOvbWn++if9gJ/U9eBgrVA3AKkWjY5?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b8fa5da-f53f-4663-f014-08df1b36a166
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9356.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 18:55:56.1619
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lr2iVKQZSvZ+U9Mw8eZsUEgkf34t2R8FsOgLBcYRuGSdRugf+7zRD3F3l3z76IjBK7Cicu+sW5McmVvSNGwOAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH9PR12MB209431

Get rid of bitmap_weight(), and use find_nth_bit() in the function,
instead of the for-loop.

Signed-off-by: Yury Norov <ynorov@nvidia.com>
---
 drivers/staging/media/tegra-video/vi.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 01622013c109..302a1bd29a68 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -6,6 +6,7 @@
 #include <linux/bitmap.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
+#include <linux/find.h>
 #include <linux/host1x.h>
 #include <linux/lcm.h>
 #include <linux/list.h>
@@ -393,19 +394,17 @@ static int tegra_channel_enum_format(struct file *file, void *fh,
 				     struct v4l2_fmtdesc *f)
 {
 	struct tegra_vi_channel *chan = video_drvdata(file);
-	unsigned int index = 0, i;
+	unsigned int index;
 	unsigned long *fmts_bitmap = chan->tpg_fmts_bitmap;
 
 	if (!IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
 		fmts_bitmap = chan->fmts_bitmap;
 
-	if (f->index >= bitmap_weight(fmts_bitmap, MAX_FORMAT_NUM))
+	index = find_nth_bit(fmts_bitmap, MAX_FORMAT_NUM, f->index);
+	if (index >= MAX_FORMAT_NUM)
 		return -EINVAL;
 
-	for (i = 0; i < f->index + 1; i++, index++)
-		index = find_next_bit(fmts_bitmap, MAX_FORMAT_NUM, index);
-
-	f->pixelformat = tegra_get_format_fourcc_by_idx(chan->vi, index - 1);
+	f->pixelformat = tegra_get_format_fourcc_by_idx(chan->vi, index);
 
 	return 0;
 }
-- 
2.53.0

