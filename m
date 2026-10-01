Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011062.outbound.protection.outlook.com [40.107.208.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D96B4A3D4F;
	Thu,  1 Oct 2026 13:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790861352; cv=fail; b=PP/JOCN+iuoYLKK1xuFO83zkxeHX9Inh2qUG491ddwrRODor6ECptfy5Z7QKqFv6+V2biuBxozd9jhHubemTPa6Bi403H8TR9/R87qkHXX7XAq0Z4RjhesneIhecAKbp5E049W5/gpKczrsb5chETQ6P2sJRnaGLSbjdxF9PGjY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790861352; c=relaxed/simple;
	bh=+wQVvasso+6OUBHxaJr6muapwvzwamvOQ/iq8++OlvE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Gc0Z87die7fNFA8BNr49/hL4Sd/jxjqahdqX2wgc1Em+FMDMzQqj3+gfdkVF1V09K0Uvc3N6EKvIoDB/oIA3K++LwTKn5NWCGetIeot8o7O3wKZl9yjf+dF/Qs5PMc1zeySBbeZ+wjPehyJjAG0cndjf9jPx01lyTc4LOf8V1tM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=QnUJjz7G; arc=fail smtp.client-ip=40.107.208.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="QnUJjz7G"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e9DwsE9zIwdzSrxqHQ2VQi+MMptnPtFn+1K4pP/SpqccKT3qJxm3MnyamyDUcr9IgPZPRRO6+s0mtT5hdgrAHmanHEgLmaGXJzEydqnrOacmmiZEqVdQrWz+Ge2XKOGKJyQZ/yrm71cCuM12vZn3f6HLZVhAJZ0P3wgxRi1agQ/v9OtIuZpqOHg9nJrdrDe30o+pxJcD2+Y8I1TNqlTfP24H92T1rAgGnMD6cpYexb0CKvadcm+2l+oUWMCnoCsTbRkNO3S2io4L17cdGl7XLrrnuALno3JJlKbVYaTS+qf5BHrbrEHlYT5EMf6O32nv57C1J52G8STxQTNhy/zrNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PE4h/asf2k9V0YNjRzLvrfgzQEVDGb4W+n/vlxZmeg8=;
 b=rYv+Q60R2M4NdOX8BVVtB2kAIDL2bAd0pB+kQT/E+q1wIQa5+/Z6rvD71Ro70LGSrPLAP54ua8h28sRFXKMy/xwD9T73OUIptM0if+e466w8/WQ3pXlCb8ydNdd42OklWpcO3xNHw/G8lh9Wj+j+Eh0qr34um5rnFstksZdvMAxezT10ZG16ucI412AWwrrLsAE3SClhyHRv/4Tu1LePGaKRPivCefm0OqOjr8EE//FF3pLGda6uWhYQyrbiYyTMD7AbEfuGwYYFks1K/z3cTO/OaegGN/+xOTHyVUA0xcnS3EHx3itWsMCaObuRBeyJw8jdcU5J3963V+uqvCeTCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PE4h/asf2k9V0YNjRzLvrfgzQEVDGb4W+n/vlxZmeg8=;
 b=QnUJjz7GDBYSeTMTNDEZxBgSm5cXLoKBuav1fiPqrW/hvMkWhmtNA3BOee6YpFGSYuQ/hWQuYGsVOWQRXz8GD+Hoh8ShRBoXHyyMUA/lYmuPuBEqvs+oXXjxwDJ83f3hIKReF6tXVf3xb4c3rrFygQ9ubKc/Gqte+HOWMaLRb366wciPyaGg5nQWEp4kSzzGlI1jvUS6szfCcUHTB3JUFTh3MBsJJa4fYYgf0kwXJK8MvweEL5s74O5jtIc7sakZZ+PDl2IMOHl5glzuAo7L1Q+E/jm1EP5cVaGi0rZUHUVatc6orT0TPMaLGpqL86ZBRZKmpce3ROOqg1RqhnhvVQ==
Received: from SJ0PR05CA0114.namprd05.prod.outlook.com (2603:10b6:a03:334::29)
 by IA1PR12MB8554.namprd12.prod.outlook.com (2603:10b6:208:450::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Thu, 1 Oct
 2026 13:28:59 +0000
Received: from SJ5PEPF000001C8.namprd05.prod.outlook.com
 (2603:10b6:a03:334:cafe::4c) by SJ0PR05CA0114.outlook.office365.com
 (2603:10b6:a03:334::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.16 via Frontend Transport; Thu, 1
 Oct 2026 13:28:58 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ5PEPF000001C8.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Thu, 1 Oct 2026 13:28:58 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 1 Oct
 2026 06:28:34 -0700
Received: from [127.0.1.1] (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 1 Oct
 2026 06:28:31 -0700
From: Jon Hunter <jonathanh@nvidia.com>
Date: Thu, 1 Oct 2026 14:28:19 +0100
Subject: [PATCH v2 2/3] phy: tegra: xusb: Use dev_err_probe()
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261001-tegra-phy-v2-2-3e453b1fb271@nvidia.com>
References: <20261001-tegra-phy-v2-0-3e453b1fb271@nvidia.com>
In-Reply-To: <20261001-tegra-phy-v2-0-3e453b1fb271@nvidia.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>, JC Kuo <jckuo@nvidia.com>
CC: Thierry Reding <thierry.reding@gmail.com>, Wayne Chang
	<waynec@nvidia.com>, <linux-phy@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Jon Hunter
	<jonathanh@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001C8:EE_|IA1PR12MB8554:EE_
X-MS-Office365-Filtering-Correlation-Id: b59b4bfd-97db-4761-d30a-08df1fbff324
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|7416014|1800799024|23010399003|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	rG10CZ0+XiKbe6mlCnCFr+p2lJMQBLk9ynv5jz/5Z51JY3EzSdom/iMUrb4YUHMCRezRy14Q4cy+ZTGPsbQUSG/42qlM1eqejq9m5eA3YsV12kYBiVcj954CsMY7IDkH5lkkLFPigdNhzM1Ks6Lrh8cpGVvFSrHVflBRv929PNVmwkyDCC+dhbLdsCxtkqn3TT/9phc1gC20IEOOvq8a46fWROn5bxC4qrIHBkpX/wxuS/4Cns0UidWzRIgg3bG2H6+NnbUrnWVQU8KYN3wr8MFX9gsc8zAnjivFrlA+9v2s+fnFjxwRQkUMOKMuGquE97nZ/uOgISVB8Fmu/0oGC2Bnkq4Dney38VbIB3MC1wvv+ldDtjn8mn0gYdO4eHZc4XSxtX/2t/4nTxqONCMYAs7GBXZ8IY3ROvwTqlG4P/Svj4B8bQYj76V732dm11+iaTeHRdwJyBqPVGU5I/e+0i0UQTl17hISqvIxVkxl3kuQrIyzaJZvaR0Hlik+Uywq+38qyDHqFKFpAa6QWOcVS3xD4YrR/vaDFTF39HPvrDyurzNuX1SnfcQ9V0XEBfdsn5yWhrwX/346hOhx69K6N0i1nHf17K1Gj4F3+yLJLYEaqSXzxIkgU33U7hjChyOnlkn86xpleJwwyfRcducf65fG3CetXfEIi/zxoT4JmBDI7vAtn5FTOvMY7ScwIeouAqjx/dewXJ/nA9vaIXKeVg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(7416014)(1800799024)(23010399003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PWIBWcScoeM/TWZyDo+ISFxj1SSqfxKDNViP/ej7roSSrx9rQWFgEnWCXz/efivzyorgPUc/bZu6m/oF5Kd6+m6BScVKhk4jakHmvQ8Mg3T8H0MO5XH+gV3MwjwY5X+M/QrzEADaj/k//SvpSKVhJBZVWK6gZMyuq1HDCI9x2CJ2TeaiSX/6vTN9d4xjQbi4H7al34rS6d0bIuixVf7DLqUAA+bEhcfENUWy+aWcCzdLzHC6ldhgN030z86Ob9SoKyV6VJDGd3gpL2Cy+t5F3Q+LfUGCcAHy8k/38UvSViokcsF0A2P2DC3gBpqj7Q7hc4MP9F2fo3wsUmMhrjIHpMs1Od9WH10ScZNFsGXaamth7wIsN37hgbnvUKowlKs2NP5MO9iK06Xkh/uALPWM+2fcJ71YR2yPNyhMirur9YNAleQQ2KwYznAdhP3EMTO0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 13:28:58.8137
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b59b4bfd-97db-4761-d30a-08df1fbff324
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001C8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8554

Use the function dev_err_probe() instead of open coding the same logic.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/phy/tegra/xusb.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
index d0d0b252a205af6c15aa8ad010eee64ead6b3529..0635f0d82c963514603b4265fbaba28b44c2e057 100644
--- a/drivers/phy/tegra/xusb.c
+++ b/drivers/phy/tegra/xusb.c
@@ -1257,13 +1257,7 @@ static int tegra_xusb_padctl_probe(struct platform_device *pdev)
 
 	err = tegra_xusb_setup_ports(padctl);
 	if (err) {
-		const char *level = KERN_ERR;
-
-		if (err == -EPROBE_DEFER)
-			level = KERN_DEBUG;
-
-		dev_printk(level, &pdev->dev,
-			   dev_fmt("failed to setup XUSB ports: %d\n"), err);
+		dev_err_probe(&pdev->dev, err, "failed to setup XUSB ports\n");
 		goto remove_pads;
 	}
 

-- 
2.43.0

