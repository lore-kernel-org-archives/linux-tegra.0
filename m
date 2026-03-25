Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012006.outbound.protection.outlook.com [40.93.195.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77F439478B;
	Wed, 25 Mar 2026 10:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774433746; cv=fail; b=Rls3ZM6z++6NsIiKdgB513UXNw7Nq6g3RkMf+JjkEdNQzMdnsBfFxcGi/tyOsJcymk1vk7Vnc6B/XHHs1/UPmj7QDKKdV8bqwkMXXKm2YLmJDL71+x1n9PVJg0l0pRCkDcFqHMgyIpqgRHo2UAGzHK5w2AVfteZNl3rSMg/xs9g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774433746; c=relaxed/simple;
	bh=l8G9wfp89t2d/qloT3lw09O/HXSKV+US6Sy/LuFaaEY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FqW5AgqLGiz8Z2pukmau13V/IMg3+MR/eA4ypB/uv0ezHQCv9cPWx5d/Tudt5NpB6ILNS4IYZnirJ7xS/rcqO6WZN8CCosKT2QOnbYneRzmjLkJwVVEjioIwXRjcTI4NGdHjwLk4wzd10jhzFEo3GoFz4IOUM71k2IBeNamLS2w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nVzaW6g8; arc=fail smtp.client-ip=40.93.195.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nVzaW6g8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jebfWjYnVpMFacIvX8kdBOYXnYo4Yq8OO54BfVtXsET9EN3ykmbDnSXnp4nZgpfc9R9s4DQ8nhNWkswyalSsMOvXQTxbG38mJ/Pe2SVA5Mk0WlrQPf+DbNsvR64gW47k3gkUgMRMIyv0FPCoBPI8kdNkwXcMw9oP9pCsBYxMWD/icEfueetbQc5c1yTeOZTD53dIHbiSfm6G7zeNEE56RdpqWBf8nGbHKh+jGr1U9RmoEpJKi24ff33KkA39kV0pJSm2Fat6pPHSf0Ihcoyr/Cexzb8FanwwAW2bhPnBMpqZR6Z9YpG1HwX/eMVXCHyFmtU0h9R/LB27WHD00kyQhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2vAI37aKHlI0COqmuqMdtGsZN46MZwPQ8uP+2C03NkQ=;
 b=I3pMLO9TZvAE656yEPH1zyY4SUHP9mDLRNvG+rCiDA6r4u+Vr1O49S1igbtPOTVAC/kyhRpL5gjpSDWaNpyIzvwHIlI+V7ScAWY9IUzAp14uuPcXnoBg1Z9W1JjUUes4OQLscOJXcEzGnEDg0/yZAsWfpRVOB9mjqhkVmSVtKJgqE+ozIHQks7rE53Zq/VJUPnnSrxhLZsAGPbTxxHVkJgw/2e5xl+9se5lOgE6jxXeB0eOcpFWn2VEB43Q62hdIA8mFrmzhhKW2+Z87TrCYW4e10iMFaKZJMKC27QcPMBNj3y6RuJtXF+9Q0PXX7xUNqMdoYXYtGiVXPgkMz70UxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2vAI37aKHlI0COqmuqMdtGsZN46MZwPQ8uP+2C03NkQ=;
 b=nVzaW6g87UTT2PU/JjtbWP0kOYPjGrDSsDsXq2Cm+GwKNL6KrGswimwQ05scu95Pt3yzguDmqFGvGxlLz35uWvPAHkcYa+QsPbOu1DAhTcf9xvwlageKz4vO+xYEejGm4YBlSLwlgpED6Y9yl0Du4VwHUNTVvjIuE5jp6MRNHXaBjNJB13J00NI517Pj8f9/QgvaBbbr1KfORXZGhMRXo22jGK7dY/4R5LVSlvdaM3vvMFyrZ1iAcjpx1w0OjS6Upxj9h9DUxf88rCqk1RIHlL+5E49b675QmnGcTjypXk/pMMeN5NZeBAY11QiyUavfZvpJ48K3WmX8/MY39e2TeQ==
Received: from BL1PR13CA0023.namprd13.prod.outlook.com (2603:10b6:208:256::28)
 by SA3PR12MB9198.namprd12.prod.outlook.com (2603:10b6:806:39f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.6; Wed, 25 Mar
 2026 10:15:39 +0000
Received: from BL02EPF00021F6B.namprd02.prod.outlook.com
 (2603:10b6:208:256:cafe::e6) by BL1PR13CA0023.outlook.office365.com
 (2603:10b6:208:256::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.20 via Frontend Transport; Wed,
 25 Mar 2026 10:15:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BL02EPF00021F6B.mail.protection.outlook.com (10.167.249.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Wed, 25 Mar 2026 10:15:38 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Mar
 2026 03:15:25 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 25 Mar 2026 03:15:25 -0700
Received: from build-sheetal-bionic-20251202.nvidia.com (10.127.8.14) by
 mail.nvidia.com (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Wed, 25 Mar 2026 03:15:25 -0700
From: Sheetal <sheetal@nvidia.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter
	<jonathanh@nvidia.com>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Mohan
 Kumar" <mkumard@nvidia.com>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, <linux-sound@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Sheetal
	<sheetal@nvidia.com>
Subject: [PATCH v3 11/14] ASoC: tegra: Use dev_err_probe() in tegra210_mvc probe
Date: Wed, 25 Mar 2026 10:14:34 +0000
Message-ID: <20260325101437.3059693-12-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6B:EE_|SA3PR12MB9198:EE_
X-MS-Office365-Filtering-Correlation-Id: 9db0c276-f34d-48f4-cefa-08de8a5776b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	OlVPngB5g/tsRLn6LdqYIou9QUP8Igg05UhzyS6jGs/E+WvgZanRgIvM4CHZPyFk8BQfSwBqCqNigYg65aMQQYO7QF8ryEQmt0S7yTxYWmbKFbVXYrlyHgGm1fK77lVSU2UhHI1J2OfT7jg5iAf2M5vlOouQN+ngvONGmTv8J8HiDeuMbnZvzb03/KDkYjdiBsVccCQ2W86LqT7eoVfIPhCDzXBYFVxYFNuKau+62/igYAkPAIgNojD6fw8zhvR1ER7VJn2BHUfHXVTPKpw4TYAcHFO1gX1lSs90ctjAxKC4zH+f2aM53v6nJx8VLRuTdSw1Mwg0vtD00AhJyceSd+r+H09MHbLb1EluMn3Wji42aymseRN0pdggfU3xNQp/RlqVZKXDI+k8WzquzF0kUkELhyeyGR/CjHsh2CDJLyOKttBtHDmAvau7oGTc73nllkYQhdRrUxjfxi4dr/k0sgkhxIuekB47xnzaLKMIal9Wp1wp4qcoxJR3RQGg6AKWUAb7BUE0UWZJFeSglcN4OJSHi+EoFl4qh907gsqyKYm16Y228hrUxXQAhDHipnBbwagdVLbmixjoi7M2NxjmIH61j002U/k+xczlmdGaMRU3ydML5lvT76e/UqTaszR2VYmYxb8D7VTpxv5yJDtoWSAVQvrVTAaobkNSe/Jk4HKVfAoIn4em9SqdllzAB1pFMKEQCWoAIu4i+nzwpxlGWUCBCwlvEX5sTZL630z/5hld+8V7Opw31dGonpYauQwE8kGye10uuStyMokbvmxpmw==
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5W3YQ0K99m76NeVyFNicZp7sT9ZbtemrHMQtU6A+5XCbK0yQ2s8GmvRkefTlGy83AAaFrWxPs9Wj6IiByPm+LGCUENc4ipdoWBhhaIWG7rCBkX2vXNxnqcySb8Fsbu7spR9bIKQNMhoMk0RDLLjn/oN0ql/LYVeGTG8CvPpN6BElUGCfibVN1xsNC3az031ATFt9Hf3xBI1YNO+AcvhQTQzl24ExxLSOstynu1jcW/0ScNIxyJyExwdZHDqT7kkaoPti/LEvz4/P7irJ4tHtWUWOQrs6BtvR43YSy4STyA0oB/A9OQe9mDIM3USme5/GkFu7g0JatFfBzCi5VQliofRhNMNZ+1U8aPRdTAcLy/Z1QMj9kKFnDCKJROXn3YpHiD0JdvVoDgGj5F34HcRut64cE3NP7Viw3q0BmmCHobFx5/eGy5V9J+MIUawftxFm
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 10:15:38.9303
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9db0c276-f34d-48f4-cefa-08de8a5776b2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F6B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9198

Log errors in the Tegra210 MVC probe path using dev_err_probe().

Signed-off-by: Sheetal <sheetal@nvidia.com>
---
 sound/soc/tegra/tegra210_mvc.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/tegra/tegra210_mvc.c b/sound/soc/tegra/tegra210_mvc.c
index 6cdc5e1f5507..11bd0ea22797 100644
--- a/sound/soc/tegra/tegra210_mvc.c
+++ b/sound/soc/tegra/tegra210_mvc.c
@@ -741,10 +741,9 @@ static int tegra210_mvc_platform_probe(struct platform_device *pdev)
 	err = devm_snd_soc_register_component(dev, &tegra210_mvc_cmpnt,
 					      tegra210_mvc_dais,
 					      ARRAY_SIZE(tegra210_mvc_dais));
-	if (err) {
-		dev_err(dev, "can't register MVC component, err: %d\n", err);
-		return err;
-	}
+	if (err)
+		return dev_err_probe(dev, err,
+				     "can't register MVC component\n");
 
 	pm_runtime_enable(dev);
 
-- 
2.17.1

