Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013014.outbound.protection.outlook.com [40.93.196.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005A23939DF;
	Wed, 25 Mar 2026 10:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774433747; cv=fail; b=E6MPJhgYUFybhqW9UBltc0ejaLqH8/7VGvb+/lWJtapVseRVsH/lXXzF8NJIKee+PKDRUg09q59+WX+RSicuAO99at3/hv11kN9XYyvzV+dvFwWlJFW+VGgeehme5w421REcfuQ+TmiOAvXJbiKdlrP175nxUBlnNp8wx7CJKag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774433747; c=relaxed/simple;
	bh=fbpf89XPSZUCisOUEdBHEa1esGKKuqT2UKK+G2qO114=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ETDvLvkFXogOmOThUVU+fOZXyLGT8T2C8lq34USKbWB0YNAz0cUNSnMHXyCgeJTX2xqs2FePaxs9CzsCY0/Nu3pEfszkYhzVwO1lum0qn3uvWhP+fTjheWMu1HcPK8DACu9WhicHOGSmI/dSROpVN0LpDQTPZPop6Xb1FWPgj5I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RBHN5+SP; arc=fail smtp.client-ip=40.93.196.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RBHN5+SP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C4ybF9t8rBHPD+KB1LTOmW/CcrcVn9+0gDHvmtArDDjawxnrEcNETY2GtGoTCCvZseh7qizdsz4pT9gVzK5Pmvx5o+d8xLOog8hcWpBYdFudO6+loWGSPsz87MsEJv8eeK+Fu8sUd/CVeIrrsnGrh7YBIi/zjOhTbITQDnEjtdBSdgWUldUyjycv5d85xeHvC7nQ3HIb6j6Ns10pLHZWYIJz8nVhqsZL6ZDbXF+WbRJwOfIkBvJzvoWSS1STNIB6OTgD32DjsZTgrg/9o+3EFXNxdj5S1q3TIJj8CKZSxB5j4vZzjjVvezlbirxrCHT5YTgcr9DlpRBDjTRRtrMacA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jJJLTNQhFybvS/zX8BXpchck9E6g9Wo+c0gHThJJC/g=;
 b=t7JVqyfAgque8yxeD3UlkMbLVEZ7xvRinFrFNMqgdQK538UvNgp7YKs7UxlFTCkKPxXEp9lmZZZyVplzWInPqJuJ14sstZHh5rNtvToblwyJMWMN4w6uy4UgmRLBO7cmz85n1pVOyksT5XNT3RsUxKR5OhWWaWoiCi7WxOWACwn3KnY1PDUOp47wj5xFTtlow8PyOdkd3tD3OSAZ3T5fHhxtmeyJeOjLlxVVVFCB447fuwp9dzmMaW9zuF1CbezJ02sxKiCddoTKwq3OjgGEagrwsi0BMfKScM0zV9aJNoNkDe+qS9gNCSnvntNNeSZ9qDVfCpKAjXsD+nvSPBRG9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jJJLTNQhFybvS/zX8BXpchck9E6g9Wo+c0gHThJJC/g=;
 b=RBHN5+SP/oVXNQqfNCMI7EwrIC9tW0dwBkHAHXaE+/urdYHS641TFXalhC+30OfoZQHCXQMyv64qzKeQ9zfV5J6bE9fljsFaFiaIRhhkDPK47MreiJzxPxmTmIAQJuqvqSW3PlMlXUgW5iAFoM+vF8+dJjrxEzfWZaSqnsbByiz9WyWbBMqwY3xbRQxkdmsCnRuh5IYyZcCD+tB5hl1MINbfA26QvqE3zhwe8HUWOZbiXAx4q9FyawZ5aXapcx1iW/HADf6+9HDq5tbbXyDoRYecmUtp/ZKJhfChP3WuEcBWuKzAlu3Kpw2ziO+umwxLF2nlCRpefPgROZWwSnR+iA==
Received: from CH5P222CA0004.NAMP222.PROD.OUTLOOK.COM (2603:10b6:610:1ee::8)
 by LV2PR12MB5894.namprd12.prod.outlook.com (2603:10b6:408:174::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 10:15:41 +0000
Received: from CH1PEPF0000AD7C.namprd04.prod.outlook.com
 (2603:10b6:610:1ee:cafe::25) by CH5P222CA0004.outlook.office365.com
 (2603:10b6:610:1ee::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.32 via Frontend Transport; Wed,
 25 Mar 2026 10:15:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CH1PEPF0000AD7C.mail.protection.outlook.com (10.167.244.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Wed, 25 Mar 2026 10:15:41 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Mar
 2026 03:15:28 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 25 Mar 2026 03:15:28 -0700
Received: from build-sheetal-bionic-20251202.nvidia.com (10.127.8.14) by
 mail.nvidia.com (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Wed, 25 Mar 2026 03:15:27 -0700
From: Sheetal <sheetal@nvidia.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter
	<jonathanh@nvidia.com>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Mohan
 Kumar" <mkumard@nvidia.com>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, <linux-sound@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Sheetal
	<sheetal@nvidia.com>
Subject: [PATCH v3 14/14] ASoC: tegra: Use dev_err_probe() in tegra_audio_graph_card probe
Date: Wed, 25 Mar 2026 10:14:37 +0000
Message-ID: <20260325101437.3059693-15-sheetal@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260325101437.3059693-1-sheetal@nvidia.com>
References: <20260325101437.3059693-1-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7C:EE_|LV2PR12MB5894:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cdcaf86-43e8-4b1b-54eb-08de8a57781f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	2NUT7UvQHJS/CkfUu2OsaggFJ57+LGdS2xC4uIeVrCQfzhKLeK9nNOJKEPKf0By1BWwiF6j330x3dZvXWOKZDd+GayBcTrHM0weE40utpV9rlQ+q9Apr384EwPQ63UGvcdnUSWghfbugD9T4kTtKy/DeinVrZp/VMoLhp11VLWcHYh3lefEN1O66aAcl1U8ZqDdufCyf/+zlU84HvUbwivf+kTlKGNAc8g6z0aZqPBcb2BNvkQEPcZziteT23QJPUt9931KcTjgk+Q3uahaGjsAhm3/6mw3pAFys+7z53Fy6ACrFqpY/H7gId/qs+L+CsQt5jYUx/wg5InGcZmVAHNX1aOSIqZcC86hTMAspQOlnD+bU1r0zu2QEJRk4EnQqD1hARfkhBKyz1s9XgTBasivb7PKXrngQvPzpthazaTuGZJeJkDUGC730tJJlz0cJwcyZRsaTJ8Xwqy8AKOK5eUcs1hZqFhCo4MvwaulE/tXNy6TkfkdJ+QqPHRlEbwfyyv87QwDAsEYe/2x8yFBR3qYrQEcTytHuvt2IicnvNR+DzSC7fyHF9PkGoGJJUnvy6lBDvbR5EWJqpxjrzsrJ2MfoW0xj4FaP8J3+BCUK8+KUJ/KOZ/tcbxU75mEKcWND3NXDaorhpbSvu9YexQa/2UPK+iE1TmdZrFrDvGM9g5joWjwpx1TkOtF85oGpG2ZXGxfDyUBF7rEtf56ytpF99y0lLcSXjwK9EltOo0DKMu1ahV7K0eIJoihy50TLfnv5QG4ytXABFegOStfKEFZ9AQ==
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	A+LbC3A4/YRGJh2waxVWNHuVvYtrA+SojZU3whRpcZMdunUct7hJM9xUX4BEUFIsQOqbqv3LSwMTuvOmBm0dZVJcC2jo97I8dpCt18CdYKKt6yHCxxJSaMFsD840qi7KFabyfKp9WIUasd+q6cJOZ9ZyMwnv8I2HHHRHRFwoyZ/tMEAcHzPOGaaXu+Gq47Jf1hdkB+Jo2u+h/HEkgoCgKD3cnNnMfbbW1tG/NGN3F0V0814czC8f1O34iunbsBbllzBW2pyV/3nUPmHnYAH/+cNowN1+RQzWffPq9SA2hgTXKSEaiOjvp0Ky+MCGo39pOFOmF387x4ZlPsTH2mZ/StkA6D4BmHWDwKav1Bu1pz0BDeuNlFUF2uBS+IBX+dzn7oe8LWU0I8y+f/oiPiP8Hke1Ay6RL/4fqfRL1QwmeXWTcHuvdnRrUdNLB8hIBsm9
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 10:15:41.3882
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cdcaf86-43e8-4b1b-54eb-08de8a57781f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5894

Log errors in the Tegra audio graph card probe path using
dev_err_probe().

Signed-off-by: Sheetal <sheetal@nvidia.com>
---
 sound/soc/tegra/tegra_audio_graph_card.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/sound/soc/tegra/tegra_audio_graph_card.c b/sound/soc/tegra/tegra_audio_graph_card.c
index ea10e6e8a9fe..b93a61db9ed0 100644
--- a/sound/soc/tegra/tegra_audio_graph_card.c
+++ b/sound/soc/tegra/tegra_audio_graph_card.c
@@ -174,20 +174,23 @@ static int tegra_audio_graph_card_probe(struct snd_soc_card *card)
 {
 	struct simple_util_priv *simple = snd_soc_card_get_drvdata(card);
 	struct tegra_audio_priv *priv = simple_to_tegra_priv(simple);
+	int ret;
 
 	priv->clk_plla = devm_clk_get(card->dev, "pll_a");
-	if (IS_ERR(priv->clk_plla)) {
-		dev_err(card->dev, "Can't retrieve clk pll_a\n");
-		return PTR_ERR(priv->clk_plla);
-	}
+	if (IS_ERR(priv->clk_plla))
+		return dev_err_probe(card->dev, PTR_ERR(priv->clk_plla),
+				     "can't retrieve clk pll_a\n");
 
 	priv->clk_plla_out0 = devm_clk_get(card->dev, "plla_out0");
-	if (IS_ERR(priv->clk_plla_out0)) {
-		dev_err(card->dev, "Can't retrieve clk plla_out0\n");
-		return PTR_ERR(priv->clk_plla_out0);
-	}
+	if (IS_ERR(priv->clk_plla_out0))
+		return dev_err_probe(card->dev, PTR_ERR(priv->clk_plla_out0),
+				     "can't retrieve clk plla_out0\n");
+
+	ret = graph_util_card_probe(card);
+	if (ret < 0)
+		return dev_err_probe(card->dev, ret, "graph_util_card_probe failed\n");
 
-	return graph_util_card_probe(card);
+	return ret;
 }
 
 static int tegra_audio_graph_probe(struct platform_device *pdev)
-- 
2.17.1

