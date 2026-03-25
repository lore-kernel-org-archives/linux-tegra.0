Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013008.outbound.protection.outlook.com [40.93.201.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F303AA518;
	Wed, 25 Mar 2026 10:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774433748; cv=fail; b=r9EznVUMju14MhUVkzcvqCji3sPo1MrJOc15L9T2UiNOu5/7E4iOU1iZFtWhsg2t/DxJQCL+3onDsHc8S7DspXH5TafS4GuVvc+uKR3TsO2DcXOKt1L5nLts73oFrJsrL5XWyvJaIjXwYFq6IbwM3vEi2otnFOvOmARfKCP1ENo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774433748; c=relaxed/simple;
	bh=4St56tf3IXLuLtLsS+14cEVfmJ64tobYGhQi+oD+xq8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h8XsViGAqihcZDS+1rMsvKyxAKj5LkvJ7UMnfxfMrGdkqBECkqPRBXZ+P0lHsscL5YzN0MGxULVAls4+1M/SKqrW/GVeY2z79YqQ3/8wQBRcGV2M1JUGY/5trHxiSJKKtvxbSEJdJMBH1vUGhcrXGn+znQ9n8duDTljRVMRq/mc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RAq1ljtw; arc=fail smtp.client-ip=40.93.201.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RAq1ljtw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XpxUkHRs59W6C36ik5+nq0RojUgU2tCcgSndbEkO45r07YRS71g4ghfJLd8gT8Ui6x58np1gx62pzysGvIDaDkdxvBMI6rCNeoP7d5JAw2PHBtWLYNo05Hy8cb4C6M3g6VXHBzy2FlKqbbBXQr9PKRJTGr+e0/CQccWX84YH5wLAKlv1A/bsQbWnlEBC8wo6J02Ihcotvf2R2UXter2Y9K/5WDccezfIwngDTBEsmWIYo0YYdzzkZ0HQ2Ywt1hbMYYUhyhBY2MyLGbk6Y4x9F7sDpX8zG0NyogKiWTTK3YAnWWk3olcQRVKrGfGfqWeQt2cv3ZfaRI+g+1SAFO9UYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YEyBHPgt74jzoO3gO6KPS+BPCXqk2ZLP/t+GaR0w08Q=;
 b=NlW6xKontOsVWzAT7VDhPEJ5BxtRfKSeNbJ3Vxm7HBWpIvXAq/oruO3OVxFbz/n7e+asnPiz1ZYxjZnxPEL2HKsptGrSWaSNAawQ8t/tW7ZOGnlR32TMwdSl6ZRgeulYu+CDwOtYcSVaJeTCEpKvV+EoEHv6oQPHHQEEKTpWGbHrcimMpSkqQLUAdqg/dPqUQlD/7DeXlRuLNlouFUn+dhviOA/ii1n+L343oDIU5VPgoHzNA4vr2UhXf5VU2a9IjYqoiZLkO4cHVq7VqRUs9GiM4sXjt90cVG3cYNyG9t9lXICM5nS3qDz4+O3m2Jk7Uuf7ZEGHQ/f+dG1myj+xlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YEyBHPgt74jzoO3gO6KPS+BPCXqk2ZLP/t+GaR0w08Q=;
 b=RAq1ljtwoKim79EgXzARkaIheo9uDo1aMJULV7p3hUDkiDsU2uW/Q7ODKjg2qeD9Ijd4uKgnlLx9DTQ3NJ+ZkIfH200oS6S8wWmNhKac0xoiPF1CB8LG8acvCpkAEy88yv04JkwWyFd+6+kFt+lthuLDKQxNpPmgPfbZ7FSlIvWb01MBe7OykNoUoCcKgrzN8MHFm/jgQp1zxZzGGmeQMvRMqIvGAlZLscaJNX7ILCuyPu6WcZnesNYN5TadeE8lIeEt0UsZLZUkIJNlyS8qOk9aUcr6JJZfkpSHDlfuF6LYB/OT1K7JVu0LOoNAzqD3cvv6YawD4r5yX8g4qETUCQ==
Received: from CH2PR19CA0017.namprd19.prod.outlook.com (2603:10b6:610:4d::27)
 by CH1PR12MB9720.namprd12.prod.outlook.com (2603:10b6:610:2b2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 10:15:37 +0000
Received: from CH1PEPF0000AD7E.namprd04.prod.outlook.com
 (2603:10b6:610:4d:cafe::4e) by CH2PR19CA0017.outlook.office365.com
 (2603:10b6:610:4d::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Wed,
 25 Mar 2026 10:15:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CH1PEPF0000AD7E.mail.protection.outlook.com (10.167.244.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Wed, 25 Mar 2026 10:15:37 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Mar
 2026 03:15:23 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 25 Mar 2026 03:15:23 -0700
Received: from build-sheetal-bionic-20251202.nvidia.com (10.127.8.14) by
 mail.nvidia.com (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Wed, 25 Mar 2026 03:15:23 -0700
From: Sheetal <sheetal@nvidia.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter
	<jonathanh@nvidia.com>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Mohan
 Kumar" <mkumard@nvidia.com>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, <linux-sound@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Sheetal
	<sheetal@nvidia.com>
Subject: [PATCH v3 08/14] ASoC: tegra: Add error logging in tegra210_i2s driver
Date: Wed, 25 Mar 2026 10:14:31 +0000
Message-ID: <20260325101437.3059693-9-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7E:EE_|CH1PR12MB9720:EE_
X-MS-Office365-Filtering-Correlation-Id: b907e4bf-5f34-4bcb-87af-08de8a577583
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	+Zye5yp3lPoxH/ZG+hL/faQjx//PqfEhrz0FEQgj2JqC7X5Mt0YDSDDXnKaaPgaCPeecztgJ5Hp1dZabBIPoJL49bp1L6PCfz3GF0TPwPcrhA573lktEtSgDU2lh+FY/94AAOVo5rpbZ9pKCYbiASWNK0bXbYKnQ1OCUnVioW7JdF6Egeb5lzQkP9oEgy5YHy2fwBpUlxOiBvYyVPv3+7oBggri+fNKUEfcGuXBobtq8gelJ5z9VSZ/G6N/Yblos9s+958GgTw1tfLcqo2gvoW+S5+YDUksrTIRNi5B96fL4dnKyBPdIHk1rvEkWwMFP/oDLreNKeZ1kK+AqBCIXYW+cpnBXZ9/6YcZvlShwi9g+VhHYc6O3de9Dovw6SqN80bW2UOnFByBCCzUkm5/Eln33YfC3W7V1MMgNTlrJbCDUS496/SxC7h93BqQUha77RGbm0351QnTAQvq7M/fc/fpu2MBEcIa+HrXygLTrvD4epbWif5jABYmqwU9hhdlixfhrPUxfw3TPYI5AhDsJ2XAyCr4MefFuI6wfXAGvw9vvDf558wbr2syHI6ly3kspfX5Ux/Jsj/5dIL8Ytx6beJMl5F/F4Btyao5/kkQgJAvZ6TTs/P6Jxn/BT42C1c7QRxCqJp2Kl3yOHBpkW/r4At1j3O0GOdD27coNWZpXScYhfTwyzxlbH8RKdrvRrQVJlx1zomMEWFmPAwm9EfT9R3vM9Txi9YbEMgF1mws2KavhOGQPK8K9KqpGllJwg+YXa8x8yg6IrhHcEWcEeL6RIQ==
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	OMNA+UT7yXoNjvNXUiu807Y60t1EgH5IelpLAAJpJKTKL7MrmEvqaU87rxI5nq6TQkxbS9nZ5Mzw/2OnTBC7vEtujgCaOtS8VlXkBJnYxJDf3QRSZiSUI194sNi8pOBg5zvlabczivA66u1GzJrGyc2++nhNHUUqPIOnjylx8WMQVm7cNypxftK+aTyBaqKDQrFY8crFj7ygKwzv3Ntor2clWwzb2CKwSP3p7Z+1tM2dd6su/438ZDir5lQJoFj3WnaLAN/CoMD22EihgohdHNpF7o0zBjfMZFRY8b/9dqXksQ7tKh1ZLbrYVVSTj4UllbQB+AYvcKspaLp3GNRbRISwlIzg0oNZKjccDzWM2YcjICukyufY6yL+OS6jOLJ0P8dhUnTvEv4BO1+7gtiEu47Gv+zyKaZCmp10p05MyXCmdLuKXW3o30mwmFmbBLuW
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 10:15:37.0022
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b907e4bf-5f34-4bcb-87af-08de8a577583
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9720

Log errors in the Tegra210 I2S probe and runtime callback paths.

Signed-off-by: Sheetal <sheetal@nvidia.com>
---
 sound/soc/tegra/tegra210_i2s.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/sound/soc/tegra/tegra210_i2s.c b/sound/soc/tegra/tegra210_i2s.c
index d8e02f0a3025..7bf76c9b640f 100644
--- a/sound/soc/tegra/tegra210_i2s.c
+++ b/sound/soc/tegra/tegra210_i2s.c
@@ -161,6 +161,7 @@ static int tegra210_i2s_init(struct snd_soc_dapm_widget *w,
 		stream = SNDRV_PCM_STREAM_CAPTURE;
 		status_reg = TEGRA210_I2S_TX_STATUS + i2s->soc_data->tx_offset;
 	} else {
+		dev_err(dev, "invalid I2S direction register 0x%x\n", w->reg);
 		return -EINVAL;
 	}
 
@@ -235,6 +236,7 @@ static int tegra210_i2s_set_fmt(struct snd_soc_dai *dai,
 		val = I2S_CTRL_MASTER_EN;
 		break;
 	default:
+		dev_err(dai->dev, "invalid clock provider format 0x%x\n", fmt);
 		return -EINVAL;
 	}
 
@@ -270,6 +272,7 @@ static int tegra210_i2s_set_fmt(struct snd_soc_dai *dai,
 		tegra210_i2s_set_data_offset(i2s, 0);
 		break;
 	default:
+		dev_err(dai->dev, "invalid I2S frame format 0x%x\n", fmt);
 		return -EINVAL;
 	}
 
@@ -290,6 +293,7 @@ static int tegra210_i2s_set_fmt(struct snd_soc_dai *dai,
 		val ^= I2S_CTRL_LRCK_POL_MASK;
 		break;
 	default:
+		dev_err(dai->dev, "invalid I2S clock inversion 0x%x\n", fmt);
 		return -EINVAL;
 	}
 
@@ -1070,10 +1074,9 @@ static int tegra210_i2s_probe(struct platform_device *pdev)
 	dev_set_drvdata(dev, i2s);
 
 	i2s->clk_i2s = devm_clk_get(dev, "i2s");
-	if (IS_ERR(i2s->clk_i2s)) {
-		dev_err(dev, "can't retrieve I2S bit clock\n");
-		return PTR_ERR(i2s->clk_i2s);
-	}
+	if (IS_ERR(i2s->clk_i2s))
+		return dev_err_probe(dev, PTR_ERR(i2s->clk_i2s),
+				     "can't retrieve I2S bit clock\n");
 
 	/*
 	 * Not an error, as this clock is needed only when some other I/O
@@ -1108,10 +1111,9 @@ static int tegra210_i2s_probe(struct platform_device *pdev)
 	err = devm_snd_soc_register_component(dev, i2s->soc_data->i2s_cmpnt,
 					      tegra210_i2s_dais,
 					      ARRAY_SIZE(tegra210_i2s_dais));
-	if (err) {
-		dev_err(dev, "can't register I2S component, err: %d\n", err);
-		return err;
-	}
+	if (err)
+		return dev_err_probe(dev, err,
+				     "can't register I2S component\n");
 
 	pm_runtime_enable(dev);
 
-- 
2.17.1

