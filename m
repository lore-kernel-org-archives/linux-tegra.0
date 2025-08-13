Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11013055.outbound.protection.outlook.com [52.101.127.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2B7212573;
	Wed, 13 Aug 2025 09:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755078019; cv=fail; b=q3vKpIo2lRhZxYmkvzx7fJFz9MGXC/zItOqxP0du1bLxVfXFl8aqv5gKgznn034kDS+1vHrn/KcVmx4pFbwfcKIN6wrROwnxuhM7AjiyZq7fL2bWx7tG0Bj7ycB+IS4Y9CQSASgMQ/kzpRieBRDcbV2kAIDtOOSatamF3LZyOcA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755078019; c=relaxed/simple;
	bh=WJzCLIs8Dsq2YtpQWGPDMz4+Ogz3V0k7mAoE+votmf8=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=lG+nG4xVduzZRktXcgTOt3E0nhyFnr6NJ08Y1EdBw1OgZASh9QNNHzU+N5Nmmp71zqol6irrnW0n2beGbDtgzgJQM+f91Xal4jyMtwaNuxnRSiO8Qz3GSn0qYdVW7BGdP+j3prsoxnFn3y74XJYMIvoz6FeFUPO4DwZqnxu2XZM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=fVd7vwVP; arc=fail smtp.client-ip=52.101.127.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="fVd7vwVP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SfPuLlm3pW0t5tnPfAG1OkugvpZkP+ITLNFCMT+ZxpkkWPIV0ZscsuNQYewdjPB1dPSb4ePHzKZWRoV7hyQhw/hjaDO4T6+S0/QP+ntOyPEIg8Cl69FeXE4vWeoVyKf1SncKuOEyGUjImsaurv4SvEoQZxUwuRm5r+pYCRQA+IKR9P9k12bFtzrni4q6FNEKtsj5cNt4LRsDbRMWvH2OMWkutpmEjPYzkesLBzvdffbgx3LvGzthzx5fUSea6wDyZyEp8xh+reXzYYvmP8Tkiz1w/MXM3LCj56W366yCvhBrOwO63d+Ymt6YHuc7VmLkrhUGGOMFjw3fMSt8EQQvHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pYHwBwpesfflBo+drxKh7ePIDdqOgSRHHjAEh9jnV5Q=;
 b=werXwq2gV4Z/5SoAoDKA0zoqBT5YV+Sz8OfPvAUGFuFvbnuC8Pok7ZPCgMo6m+qg52YN3+fcVWB7lUC40Yy1JlQYY7XlnngnUBwuViwvU474BvGFxDBlbNO5Y09wQJ/OHmavggsGbpvZXXaejNhXYe0YoMxwvjLnPKdSQkoM9xBmUDsWExItK1YwX4F5XWc/mYOmc/wezAwZ43GCq8Z/Sh0v/s8mG0am1BreYpi4agwAaCPsqK2EeIxgIf28E4VYfdgb0fzAy0q7N2AfPLKc/REi4rnIDgrY9ZdQOcGZLw3s20MaXBsh98M/rk/MWPquV6xGDnPmWfdoz6kohR6U1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pYHwBwpesfflBo+drxKh7ePIDdqOgSRHHjAEh9jnV5Q=;
 b=fVd7vwVPS7kpMLNK9MM5ZrEiQa83uyNSr1ZDtmgXhzSkr237WGrewKUpcxPhNvzq3h+qpOnBHKWh4OSkA3F3BFhxFHFKy5rZ/vXqO9Qkpl4xSWrUsBCKUAi3uK107py7vTzo1FiQz5kEujYoe6dXqd5caNhRfiUAIx11YPn2nLpoknRS4lkJWxpPC4Oy0q3OH9vaDmFEQMN8K20/GniCSLwed0709YrWvh/qgJevIerY/B2gPn36vYTaCZVIKzhZjA6oZlRW95/j+bmEeiXh3zKSBznORLg2GiLmmk8VItdwPwYGlOfnHTl+o4X83g8m6XCn8Vg7JNTv1OtRRn1ScA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by TYZPR06MB4978.apcprd06.prod.outlook.com (2603:1096:400:1ce::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Wed, 13 Aug
 2025 09:40:14 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%5]) with mapi id 15.20.9031.014; Wed, 13 Aug 2025
 09:40:14 +0000
From: Liao Yuanhong <liaoyuanhong@vivo.com>
To: Peter De Schrijver <pdeschrijver@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT),
	linux-kernel@vger.kernel.org (open list)
Cc: Liao Yuanhong <liaoyuanhong@vivo.com>
Subject: [PATCH] clk: tegra: Remove redundant semicolons
Date: Wed, 13 Aug 2025 17:40:03 +0800
Message-Id: <20250813094003.552308-1-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY2PR01CA0015.jpnprd01.prod.outlook.com
 (2603:1096:404:a::27) To SEZPR06MB5576.apcprd06.prod.outlook.com
 (2603:1096:101:c9::14)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|TYZPR06MB4978:EE_
X-MS-Office365-Filtering-Correlation-Id: 6476a339-0509-4b4b-d7fc-08ddda4d6776
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?odGk7xSIcxuTy62EI474BNuaSrjrbOhw3PboalZVO2+/ECRT7Rki5JJg0XEh?=
 =?us-ascii?Q?c3m51rq3Awjfu9Aeays+Bd2oRasPp75CRJZAEpsYsn75jak6ZKCExL7SEmX9?=
 =?us-ascii?Q?Wt5WJ/cc/ii9NdmzKyp2spbo06uKhpa6CeK7t5FmyqMZ2UL38PLGXqwFafSI?=
 =?us-ascii?Q?Iaew0vSJZzZRQlEXhowkB1wix+xL3hITKvQvkUHnIaONQDJGB9YfI7NavqFw?=
 =?us-ascii?Q?9naWX0XtDB6sQZqe7N7b1fw0AhZInL3kO5Xq+eFZOAABRwYGnbnlQyYFo6xL?=
 =?us-ascii?Q?i19/HiZh/8Fkvee/D7JL9XZ1gDafRaOoa2agMiloTHdc9Kim27JijoMmucE6?=
 =?us-ascii?Q?Z/00U2t53M6u4mDSpCs78mo1CuKGHejcQo9d1fCyxa1G+Tgjv+ItbbHRfb4C?=
 =?us-ascii?Q?JdlLbi87nxhcbRSZiSZOc0UzdBlNQfTAKM9B+Ydljsgwe4wbR5vgyfs4rYfk?=
 =?us-ascii?Q?8t9d8dEyIUSiAftC/Sf/lnRbEktqw63qSQO15mYVve4N3a5QjZ8he9eVBzHi?=
 =?us-ascii?Q?8rPgpDiSm6hxdlROEzYf5qcpeFoSngv+yIj7o+LbMc7/FrmgcoXwu2LRJPLY?=
 =?us-ascii?Q?PEqv77QG3Sjn8SBYWvAmDNnZnVTmYSoU0DJ6couddPb1T+CtASS+Zb8jR6Pj?=
 =?us-ascii?Q?hKEBohR6aS2rVLVZtHK+eRlFaSMI/MB41yuTPFcS4brT8oekN2WdhwK9VwYI?=
 =?us-ascii?Q?+dqM/s3/Xw+BYEOp2k5omIYmxNwANW+Vx7F3p9SWbJZXsE102ETDafH3Y9LO?=
 =?us-ascii?Q?rF3KNMwh5nrAxRj9dU2aLkCfylXqQZizCmTdfNJUGzbk05bB8dxH1bEnurNQ?=
 =?us-ascii?Q?3wt5mX4h1mRvM9qE6xYj9P0RPKzhPUU7ivw/NJOhquUoBZVULn/gbxPqha9c?=
 =?us-ascii?Q?f2lBLvEspX1muan0kYU8i7VwVqg2D1MosASiuAojGU0754EDj3y1ZRKcrP/w?=
 =?us-ascii?Q?hyckruCsfQuTijQ403ho572ZVjlM7SOAXUlDnKHZCvChCRjnRrVy4N1K7Cos?=
 =?us-ascii?Q?pgU5EaCGvALgQgTsZPmxpeIjTdA3TZiaxLU1U4z/Bh1lHhppqPBPiKz8Qyim?=
 =?us-ascii?Q?d9QG+JjWM5dwhEOF5bKzKb+eenxYwxB4yzdIYZXj4uVxBNHxaK3++w9hLCe5?=
 =?us-ascii?Q?BRv4S9OiFhme3iFdy1MDcx3r1afSj9D/YRpQ+rORV12vVA4FQgQJudxTJLne?=
 =?us-ascii?Q?0oumqRD09Tvxu98VCvMF8nuEs3dzCKFbXlGaNudFql0SJBO7eMkmbFTZp3lR?=
 =?us-ascii?Q?/wKxp+mu688hRbqDQM2AfDpFz0oFjfHt20H1tdPA1RNJ+ulY6hEmCieoHKGn?=
 =?us-ascii?Q?jvXFMGVFGjMJPr59JQs7vroqxk3KZWe7wj8Hi2RNShoZJyILaaYeQd31rcJd?=
 =?us-ascii?Q?M/we8iN98eWOslMFSHMd1o41jIP/dU12gAjAu3E7AuD7oN7cbhwv4ONx96br?=
 =?us-ascii?Q?2Z5frXzk2GsMyjVqZJVXpvADz1rGzEZ5MwJKTvTuhkWR/jQC3fT1gQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5576.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WHp25rY1ql/zjYBpVqr466l3o2nIH3p+0wN+oqWnBzdwt+sOdZoNnw3qEZYQ?=
 =?us-ascii?Q?OTYmkpzvaihgoLrrcJt7USkT9Cr6OjM92EIV8ipJl2w8Rz/wypgEXguvv6iD?=
 =?us-ascii?Q?i2fSn5o1htGxvctYGFdUysN/pdTr/NwuaT8XoJJswbKdn+zOud/lFBwZAAHY?=
 =?us-ascii?Q?DPCZ7BsALLvTejoRBc9Kuk6LfR9T094LbWfrNcTvypD67X+SFVBJUfvMuWMG?=
 =?us-ascii?Q?s819bqgb/EzgL71s1P5tJi4a2jhhP1KUw/bAj//9bGqTBFbBFtHHg/K0Wj6b?=
 =?us-ascii?Q?L0X6AwP1pn1C4O9kYMSr0lLnnoFJjrMt4GKBHJSmq04C/H/OzCX2CzssJDy5?=
 =?us-ascii?Q?/mxvXoK18/L1fW888yaOfCDgTOMwtHZKm6uoMOLGGEPMeBohA/icAL3d2kaH?=
 =?us-ascii?Q?EUVWH++4zcZKowfZuF9q2s3lrIvyX7j3SVPIHLfkuEIpNE2YQblIW6ZISIA6?=
 =?us-ascii?Q?KbglCVpCi/9Ue4OP8DwMTMZYdWTAcIvo9buCFabpGtcdDJPEJypPlb/S5CpE?=
 =?us-ascii?Q?6Zq73Kbpdg07YANMqu5DSSmwdnPkua/fcfxrilpaQx2K6Er6WN4Qpm7yoEag?=
 =?us-ascii?Q?aAdAow1MnAYrPhJ6OhZ8OFa1fXxtH4R227Y7iSfTPME13nDCRQqfM6GqfCAE?=
 =?us-ascii?Q?uMEDtGMYsMtXJXFXy9aQvD144fw3mFUQP7dtBv+uPSabYg6hzpQ/S0avgcH5?=
 =?us-ascii?Q?7+J1GeYQN07bxMiljW4LyWdgKe4eWEQqILKMqZOkd/uOEWWDe5SLuYnWkW0H?=
 =?us-ascii?Q?wMUFFBZOexzbZfNmanPldKVSCTd/n6xl6Z10qDPTv8sXcxFRG5Y0ajAs9YKp?=
 =?us-ascii?Q?t0176hit7MQ6meK5A7HJS3c9VrTSZcwu/Kfvmr+mXRkPtxfpujCmR5DppGKC?=
 =?us-ascii?Q?InxzB4ye5CBmV1XpMuWbnYsQ4uXJ/jr+KgwqQ837UxlZP8cXwJQxiCu5qZWa?=
 =?us-ascii?Q?dqORQMFid+fNUPm+Xv5kpwcEnWyYljpMmCZEfjv7ktfx1AwlBB2qEIW7Oyo0?=
 =?us-ascii?Q?oR2ws6MAav498P4S4bS8HUfKth8M4G+budeNMLKYLUJZUJx2Y1wxYDwu6lyF?=
 =?us-ascii?Q?T8QoDhRKtoG87ij0dqhDxd4yRsC9jMF8BFADyVv8FVBLxNuVVA+gvE6tlTEU?=
 =?us-ascii?Q?l3Nb+No+sizdXY5CquOnBeftcf2PrIMU0k3dZkIypY9NbT2+mzn5pjG3x2ph?=
 =?us-ascii?Q?0+MvnnD7O39sJ/CEtYLcAiKuP1toiR2fGVmR5oWFDSe3VcieD8dVGkF6MBld?=
 =?us-ascii?Q?ufF6TO2q3HmYFmnl+P1E7k9yCPiV7NpQ/uSABhwfmOzRwSmAyIsUFVuFSHCk?=
 =?us-ascii?Q?zsHn8quxpnPsXHF2DqDvNQn85xYNRQd4hbl2isKO5KnfUkoY8uT11mOgFS0t?=
 =?us-ascii?Q?xTta5L5y5hFwrZXL1+G2QOR+ee2wMfqyPXbkgRK6tgbwIM5QX8FGRRWQJiiz?=
 =?us-ascii?Q?7ZEHDDycVJSxA3Tv7TuCG9rNMwhELmrRu2bLVm3e4zEzRACjw6Orz5mcoK7I?=
 =?us-ascii?Q?ILLBYwMwMD+ltWij+SqOqPM3OdMhc27uXwINJQmfOe9Z5isHOHSdrJxP8SzW?=
 =?us-ascii?Q?Q8NR8Vd5CQqC0oA2maWbrjHgMvUC8qcH2N9Jj9oh?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6476a339-0509-4b4b-d7fc-08ddda4d6776
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2025 09:40:14.1769
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iHho0wA0VU6O6fFI2QqW/D0muHYG7lthyKbHGGdLLpy6bMMhF5NNR3qhw6fbxQWr+bElvLwzxsZt4T9mFwinPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB4978

Remove unnecessary semicolons.

Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
---
 drivers/clk/tegra/clk-dfll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-dfll.c b/drivers/clk/tegra/clk-dfll.c
index 58fa5a59e0c7..22dc29432eff 100644
--- a/drivers/clk/tegra/clk-dfll.c
+++ b/drivers/clk/tegra/clk-dfll.c
@@ -882,7 +882,7 @@ static void dfll_set_frequency_request(struct tegra_dfll *td,
 {
 	u32 val = 0;
 	int force_val;
-	int coef = 128; /* FIXME: td->cg_scale? */;
+	int coef = 128; /* FIXME: td->cg_scale? */
 
 	force_val = (req->lut_index - td->lut_safe) * coef / td->cg;
 	force_val = clamp(force_val, FORCE_MIN, FORCE_MAX);
-- 
2.34.1

