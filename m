Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010020.outbound.protection.outlook.com [52.101.56.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462D939EF37;
	Tue, 17 Mar 2026 09:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773740993; cv=fail; b=M63SzcitDxW96GWeoTKxQbVrRxMW7bD0mRrbKEZpEIbUmToqTuuSuWKFNGqXlboNsr5gTy44LaY6mRsj/HygQa9Ef9BVyj7icfS3Fv+rP052uuzr4PVZG2vzQQ9ZCsNo1E0MxNLPefl5zkTUCSvJir5Eic//UjGuwclgFvlA85A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773740993; c=relaxed/simple;
	bh=ZRvY6UUroIUv3hGQgb+WGtyov0YeURIxAtgdSCe0xSI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nJ3EkNvboOuy67p8fgF9iTCYcoVmXtLaf+rPWw/lVSTveGDWIIDQ8ryhh/SIdsdyFBR7O4bT1umyes8XwH5Aa8om49Bc66RrZ9N3UtzlC5mJFxYCTVMUUQ60O5KJPmzM4K2DiyKrfKEAhVhx13Pspb0b9WQTcMxZsx/JSXkRNHI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HjiLQDkq; arc=fail smtp.client-ip=52.101.56.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HjiLQDkq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UqpCGqe20x1m/kU3JB7bipfzU/+QAeeVUX2argfu1ssmEaiqheeBJgUVOpKyl7RKbNxUTy71y9EdNnz+zyyeNjZXjgz1aESqTPEJFqNZBa3luz7NSWt4yiz/oWf66WeaiHaJnN7SbEK4Y1kDYoz03rc8dc15QCwSp1O8uhx8nhp21En/ycmvDPZZGL1EX9L5KYP1kwNssD1HQq4K8rBYSSIyPtphATl3UNqi9SrsRkpZlKd72L7nNL+DJDkk6OxurglLGSL3NhJ3uKPQUUTQIYqI3/QKK66PpqAKUSjM+N32DwrMy9PSKCBrzITal2K6nPXyoWoNqu6DmU9TER8n2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u6bw3FNe7emwytjjmoe6rK7y2a8nT9s27BDhVD6ecfQ=;
 b=j18/WyatOpPF4X+nuwv12H4GVpqx9dsKEuDkj17Sf8mkeB2CcpDMOxidzEKEqlONPnpzj0aHfD3W6/8CfLOH5z86GGy3U1YmgG/L+2NYyL3bLdQoW3JRzfLCTG7kS8+W1RP2qk7wWLxZKK4SOu5wpvLkMTm+JDk6w+6cs3/tnvey0dVRFpiveX097KOhaQHI6TXxlYEayjwBOuix5zu/wCm6WegaTTp4K2NpDH9q4RjtLnPVcPIc9ZnJx9fNIlX8GXRLLC8qz6GRcXvC3oUrEHIl2LlN+fNPoDQ0Trb7nFZ7l5SjAJlc36LIWBIdNbioEACRjMq2t7p5zCTvN6KXWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u6bw3FNe7emwytjjmoe6rK7y2a8nT9s27BDhVD6ecfQ=;
 b=HjiLQDkqYYwtw8Xkn1NTzfVp8HxEfX6FutUoIr7g1WSQoGi8F1JDOS4Mik/sLzU85CLVRtKH4SENvLI7L+pcOoxklj+KvXko0KUDdISV7WERzHp9lj2M+dlllHBkU7Yc+mApI1IIW4PHse76WD2SjbesO+rjtyuuPmymasfYcMhHcriP/jCyhBI4JZuRcqTX8A1i8i98zwSFVf0pRlvWkxNUgiEIlskRIEnNEJJflvdB9FQmrp3II9rV/OOyU0Y3x+5w2lZmEreAYxGQn774IxpeA2EPdeVfqk/OUxQoX5RykCLoI/SEoloCMmlLnjHDqlTxtX/DBG4ejfedF9zBlw==
Received: from SA9PR13CA0129.namprd13.prod.outlook.com (2603:10b6:806:27::14)
 by CH3PR12MB9729.namprd12.prod.outlook.com (2603:10b6:610:253::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.13; Tue, 17 Mar
 2026 09:49:48 +0000
Received: from SN1PEPF00036F40.namprd05.prod.outlook.com
 (2603:10b6:806:27:cafe::53) by SA9PR13CA0129.outlook.office365.com
 (2603:10b6:806:27::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.25 via Frontend Transport; Tue,
 17 Mar 2026 09:49:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF00036F40.mail.protection.outlook.com (10.167.248.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 09:49:47 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 02:49:34 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 02:49:33 -0700
Received: from build-sheetal-bionic-20251202.nvidia.com (10.127.8.14) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Tue, 17 Mar 2026 02:49:33 -0700
From: Sheetal <sheetal@nvidia.com>
To: Mark Brown <broonie@kernel.org>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, Jaroslav Kysela <perex@perex.cz>,
	"Takashi Iwai" <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Thierry
 Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>
CC: Mohan Kumar <mkumard@nvidia.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Sheetal
	<sheetal@nvidia.com>
Subject: [PATCH 1/2] ASoC: simple-card-utils: add ignore_zero_sysclk flag
Date: Tue, 17 Mar 2026 09:49:09 +0000
Message-ID: <20260317094910.1582011-2-sheetal@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260317094910.1582011-1-sheetal@nvidia.com>
References: <20260317094910.1582011-1-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F40:EE_|CH3PR12MB9729:EE_
X-MS-Office365-Filtering-Correlation-Id: 09e08f53-22c1-438c-7f24-08de840a86dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	nRiOmjwJq51HackNYh0FNBKiEGOwlKEflSF+L6R2dnghB+336xZVlETRmK/38V6FW43KDUKScfusKMU5+LbB4up+nqmo/t+V2rHYCJBI+QkNgkTpRRU+eJ9S3Li22nFREZaHLo1JfvhqRiV2yWCzvUPMJK/ss+ocpx16DpX2Yi11IsR/y+V+zrVjTH3X0zuzHoSSe4nAqvesXwBLN8ytWFoEhmG9PsPUNkIt6cyR1MUmbaFjycjdEt1SBASeRel2qGbSyMgwrhvBU10k0ljj3wERBhaNSs9uvaTI2YqaroUHxUj6o5NyfuDCc3SJYyOl8GTNP2PUYGID1nV01LfbiTR0NT6teNe+AypIsGGaul8YEw/Gd0XJJDAgcS4wvq0PTMxNuLe9CfX7ppnD6He8jtfLKmQsTnv+Sb42dwtabK30TnuYdCIJY+XRnHxGSzbwBM+HwkqIYeBWynQ7lb1wHohMBLP5jdgqTk4qN/C7GNAqOjkXt8vZxwZdU9AVdw2wc3TBzdDL6yRgFJ2Cu3N45xBAy+UzxY6e+91EZruiTv5enIKJtFlIT60OpfYGrr+MxiJZnMJpRp8KYDd+otBMqk20Zedcz++oulFhUAcxucgXjCJ9AlpZs1wh0zZyCbtxcZ0osRHQsPm8anSiZNwcTCEN7YkIaiCb0Zdau2jXFZjRUDUWtg+xAPZMhZ0dFrRfxAcBKltX0DVb579CB3vOTLrMQwScl2oz0jPdSXSajUU7iUhnZ9S92SyDVWpCzkEZ22RVTnQKdURjU9bgd5SENw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	n7h2c782TxsekZHzWvwWWUpHt+yposmU3m0/+wmkrfccf0HU9FKQxBPaRS2AFbS7hzfYsaLoX2G6TbD00SWQWcVToMZlY2cW6e6cVrcJLWdKxkbbzziJcwSt+JVtZTmv1ghM30VbAmzcLPHxkQAXpucs4vaju4/OE1ANO+jB1QkriiEgSEev5lL8Cm1VnpWCAjcKuDBzITkIubWKiPTOGIc4n/jjYljp9Gu5PHQvd9cPwu8LV9g1xfhe9sEkkQPPTEIE4q0SMpz5pqvoGnplSylIYXEifuWch8BwVIE6kr07dWRImmDhZnSibCik0XWH1w5oP+f77dTwxYqgoPZJd9kqyqvDr5BEuL7yVKgY5I1KG6AnFGGXFIZwOEXWZmxAWbdAbFJkh9j+dXKRQ691Tz0bugM7uxq9DViEB085kV6TRz46CbrEq2cXBGuq/qfA
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 09:49:47.8953
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09e08f53-22c1-438c-7f24-08de840a86dc
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F40.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9729

Commit 2458adb8f92a ("SoC: simple-card-utils: set 0Hz to
sysclk when shutdown") updated the simple-card-util driver to
send 0Hz frequency requests during stream shutdown, which can
request frequencies lower than a platform may support.

Add ignore_zero_sysclk flag to struct simple_util_priv to allow drivers
to ignore these 0Hz sysclk requests when they would result in a clock
frequency below the hardware's minimum allowed rate.

Signed-off-by: Sheetal <sheetal@nvidia.com>
---
 include/sound/simple_card_utils.h     | 1 +
 sound/soc/generic/simple-card-utils.c | 6 ++++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/include/sound/simple_card_utils.h b/include/sound/simple_card_utils.h
index 915e6ae5f68d..02ede92e8269 100644
--- a/include/sound/simple_card_utils.h
+++ b/include/sound/simple_card_utils.h
@@ -81,6 +81,7 @@ struct simple_util_priv {
 	const struct snd_soc_ops *ops;
 	unsigned int dpcm_selectable:1;
 	unsigned int force_dpcm:1;
+	unsigned int ignore_zero_sysclk:1;
 };
 #define simple_priv_to_card(priv)	(&(priv)->snd_card)
 #define simple_priv_to_props(priv, i)	((priv)->dai_props + (i))
diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index 3115e1f37c0c..04ae242a51d0 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -383,7 +383,8 @@ void simple_util_shutdown(struct snd_pcm_substream *substream)
 	for_each_prop_dai_cpu(props, i, dai) {
 		struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, i);
 
-		if (props->mclk_fs && !dai->clk_fixed && !snd_soc_dai_active(cpu_dai))
+		if (!priv->ignore_zero_sysclk && props->mclk_fs &&
+		    !dai->clk_fixed && !snd_soc_dai_active(cpu_dai))
 			snd_soc_dai_set_sysclk(cpu_dai, 0, 0, dai->clk_direction);
 
 		simple_clk_disable(dai);
@@ -391,7 +392,8 @@ void simple_util_shutdown(struct snd_pcm_substream *substream)
 	for_each_prop_dai_codec(props, i, dai) {
 		struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, i);
 
-		if (props->mclk_fs && !dai->clk_fixed && !snd_soc_dai_active(codec_dai))
+		if (!priv->ignore_zero_sysclk && props->mclk_fs &&
+		    !dai->clk_fixed && !snd_soc_dai_active(codec_dai))
 			snd_soc_dai_set_sysclk(codec_dai, 0, 0, dai->clk_direction);
 
 		simple_clk_disable(dai);
-- 
2.17.1

