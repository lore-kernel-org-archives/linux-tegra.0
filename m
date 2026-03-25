Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011067.outbound.protection.outlook.com [40.93.194.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57BC33A758F;
	Wed, 25 Mar 2026 10:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774433747; cv=fail; b=Mh+Z7ZBNemjDUnf6Zft5T0oKy1pX+UVEys+RK4JO80fgEHSfV1whOEfmCEnAEn7oHvpr/i3dhNt6O5smPp1Lc6112ohjMM/e+0p9+6JEIZgdKWvFx0t9XXf6Fc3GLtpyCyJz/vG/qIkpcih8PRdUXqMYBh9BgBjC7UjHjtZWEAs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774433747; c=relaxed/simple;
	bh=Pg79b5ZzexRxS82c0UX3efEOFUoU0mBxvJ1OPvNdz4E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EXE++rNYo0Rg9UoE+NOmaH1+L0A86N5wtsdnQj8COVR/AwEhkg30LmXH6Qjdy5dRol69t0QXlGSigqbcqrvuLr4qkzPmRxsXjGibjE6ZAdCtD2pDhsrXWiG8+i1zy/n7FGW5lqzD5RUFRFNO1lO/PO0f6WG7qQGRekPmj831UOs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LpNHNVLW; arc=fail smtp.client-ip=40.93.194.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LpNHNVLW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D88pT2J/dgMlssedeXLoQO/Nd/iMVpreMYncheehzTuxIAa0fnvan9SLCtiGh8J3FnsPSC3zSHLlA6fb7GQO68dtDXYBeJdPOxr385BNuURdPQpVE0y1+ENFP47QPlXuACbcUzB37VkqIy8cNDHVEczVh7AEUA8qfnTsaiornORs7IUAdh3nkkR0mhVpWX8Vv1199xXN3zETe9Hq9XkuAntYwj4wPpKsT3LJyE/V4A0N7ujv1sG2VWP9SZINNjMZTV3e1L1VeA4WDV/K3+OL4kDYn+LIK1IUMGXwQ/QCLY2N3mRzovpoNZ+PeGpg5ulg6KWwbWZjJWC0cTeJS8Rs2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CyGOlY2aQ/kiLG5zNmMtZQCXpAwC9tvVKK4tKa53nAI=;
 b=as3FD+JRibPttFrVOHgCkftcJgPyyKCZKvD8O5yp6sZ3OEuTJuf8LAKIT7Cxv2M2xWZz0SOXOoayMqscaV1yTEB85qiNMUYPAO2tS3yEfizvSEzvz/U9GqShWhAkwchebkhb9Bht7ye8ppUzwdqL62aMpCwYDNZqjFgARthyir8ZC+kCIWZPxOdBpAaTUGfkgT7pjkP0261pod7q6y3L8bOtFuvKsj89gU5EAMfVkPf7qzuHu7xHMSOQ+2v4kPJd4HSy4fPPPACs8KeDutau7MFkJVws3wQoE2vAzue3AIPuyA9i3ITnSVynSJ4S+zVAUaRaDUpUu8pZGzGPsBb9Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CyGOlY2aQ/kiLG5zNmMtZQCXpAwC9tvVKK4tKa53nAI=;
 b=LpNHNVLW2BzT+mXG5bZ4CaWbDCjHhApFvb4r4CLM4uQ1YrqvEVP0rtafx4QroLFJOKKXhdDw9s7rzY7RSj8rv5Vq34KO1BccTxvNI/CUR8o6YLgXhIzMIBr8gVTCSzz17I1TORYt6pipRW2m42HeXK6jJcHXCUwwn63qKTf4e3XiNcdYRderTVhCN3+UpMgf1+xhZDUACVL+nNt53rQtugjeQw4IvKUdFksUxuvESK8EacELGbE+SvY7fb4uYMey+C53Bgl2AXyjBgWGJOKqVGkfQhr4hcB1LiIr+K6RVb1bGzXMAN4NrBZbXEghDKPWp8lNsUaPqItyw0vO3cQ5Uw==
Received: from CH2PR19CA0007.namprd19.prod.outlook.com (2603:10b6:610:4d::17)
 by IA1PR12MB8496.namprd12.prod.outlook.com (2603:10b6:208:446::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 10:15:36 +0000
Received: from CH1PEPF0000AD7E.namprd04.prod.outlook.com
 (2603:10b6:610:4d:cafe::b7) by CH2PR19CA0007.outlook.office365.com
 (2603:10b6:610:4d::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Wed,
 25 Mar 2026 10:14:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CH1PEPF0000AD7E.mail.protection.outlook.com (10.167.244.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Wed, 25 Mar 2026 10:15:36 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Mar
 2026 03:15:23 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 25 Mar 2026 03:15:22 -0700
Received: from build-sheetal-bionic-20251202.nvidia.com (10.127.8.14) by
 mail.nvidia.com (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Wed, 25 Mar 2026 03:15:22 -0700
From: Sheetal <sheetal@nvidia.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter
	<jonathanh@nvidia.com>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Mohan
 Kumar" <mkumard@nvidia.com>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, <linux-sound@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Sheetal
	<sheetal@nvidia.com>
Subject: [PATCH v3 07/14] ASoC: tegra: Use dev_err_probe() in tegra210_dmic probe
Date: Wed, 25 Mar 2026 10:14:30 +0000
Message-ID: <20260325101437.3059693-8-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7E:EE_|IA1PR12MB8496:EE_
X-MS-Office365-Filtering-Correlation-Id: 8260303a-e9e5-418c-8799-08de8a577522
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	NQPM52vYk9+pksmKaONV+yunwtiQf9V6fEkFTb8+MqxJguuCPmmkg16scksEentl1yLUmnZmgBpA6rKZwvLFO8UpSG4T0Bj3o3ybAUolejhspFirThK0HkRg3voeBA/KKxAucixl3j9vNqQASOw/bI9wQOhZhbNPYIbApVO7NnnbTybfSn2RkmSolzo2h9u5AZkb6BnPyVHntl7R8VV9HxMetNlAczh310LJhSykb/V77vdb+jpGhglGcYP3UNJ5t9fr2oTdmT5I8ML9MAQHyKuoIfG2gNMZjfCp92YUNOF4Fkx7Bq7wqTEoGclm3t9pVbU1AeryG1i5iiSY8lDQB88/gRcivyoDJvIzcd39qIGnAnpt1pKAONOEj5wM7JUdsCGN9aIjcmT0Ws6Ba8dA1Vx8pryqYy5yyi8Jx9Id3PYPsXVBr7I+gnJ9HkBgwB7f6gQZZCzvW/UGl+lUH8XC7qZ6NAX7EJd7F4QWLk+zcNQ14JQJc0vQW7bRodgnFeS7y3l7etJ6O//mZ0tfEQYANC1+QZLGxh4DrDlEjxQyj3ATU8CJ46k07YcfbNZSlbZKIOXmrbtZndMpPUnJIBfarDLKOxeXd+TYjxrbXWD0unRkyD57H/ELeyteKXvJzFiEFPneYPd6ZIYBXH6b1rb8Y25MJaP+q2ILXeB5Fe9MMwzeWeGCWjIw/T+j4eMxcGzqB/kvHH1kxP10q0hKBnAZa8NsPa7x+X82pi4Elk6jUHrhXItmKiDiutOHLK+j7M8O+2RgD+wKW9aL9G50pcFmcw==
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZkUyj5vD5146hnL7Qv5DUkrlE1Y/9bUYwD7aSHswsT3bqAZn3RyGPOkwdgdZDsWu0DThzP4nRPbjxN8Yc3wQo8j5+r1apWIDtUOto+jqAcK46yi/uw8ALxIgHQquRXMKa053DeSPZcYys3AU3AfQniHo+FG5qO6moBdXvs/QVKuqrv0AnrpqxwseW94MVRCz9HDPqm3IYZEO9Myh5DiEoeW+tf1NTtIwjDXYTGl0PAlOx9ZxLoUgPEggGfNGo30tsSdEPF0A6gS6p7CT0j3vegpNZsntjLxA7qb9032PdwyLeWmyaEpkCSROvfq3h8WvVrxq7LeYS73DnJNwSHdZJ/S8ziJEuqKaraDgZXcCysRfoxbthkXq7+QW6oldAh92/4/o96/PkQbSCCPZerLEkecqMrPmJ4tLeonwRS/CzZBF8XT+H75LRLXByb9yYjiL
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 10:15:36.3787
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8260303a-e9e5-418c-8799-08de8a577522
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8496

Log errors in the Tegra210 DMIC probe path using dev_err_probe().

Signed-off-by: Sheetal <sheetal@nvidia.com>
---
 sound/soc/tegra/tegra210_dmic.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/sound/soc/tegra/tegra210_dmic.c b/sound/soc/tegra/tegra210_dmic.c
index 93def7ac4fde..5a4bd5cef30a 100644
--- a/sound/soc/tegra/tegra210_dmic.c
+++ b/sound/soc/tegra/tegra210_dmic.c
@@ -507,10 +507,9 @@ static int tegra210_dmic_probe(struct platform_device *pdev)
 	dev_set_drvdata(dev, dmic);
 
 	dmic->clk_dmic = devm_clk_get(dev, "dmic");
-	if (IS_ERR(dmic->clk_dmic)) {
-		dev_err(dev, "can't retrieve DMIC clock\n");
-		return PTR_ERR(dmic->clk_dmic);
-	}
+	if (IS_ERR(dmic->clk_dmic))
+		return dev_err_probe(dev, PTR_ERR(dmic->clk_dmic),
+				     "can't retrieve DMIC clock\n");
 
 	regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(regs))
@@ -528,10 +527,9 @@ static int tegra210_dmic_probe(struct platform_device *pdev)
 	err = devm_snd_soc_register_component(dev, &tegra210_dmic_compnt,
 					      tegra210_dmic_dais,
 					      ARRAY_SIZE(tegra210_dmic_dais));
-	if (err) {
-		dev_err(dev, "can't register DMIC component, err: %d\n", err);
-		return err;
-	}
+	if (err)
+		return dev_err_probe(dev, err,
+				     "can't register DMIC component\n");
 
 	pm_runtime_enable(dev);
 
-- 
2.17.1

