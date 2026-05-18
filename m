Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013002.outbound.protection.outlook.com [40.93.201.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125DA3246F8;
	Mon, 18 May 2026 11:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779104454; cv=fail; b=jcVF0Rj2WTQaY6e5zvHqB22jucmj5hkp/EuGjndvljqw54juLUo/siB+49OPeyxbWQib/OZK2721FOE6fWyUvnXAXN4SPR6vfyPCTIjNnqtdQ/70tx1czh8ZeNI+kZtyzONRWo8/6rHUKOcw/giRpsxc/H07DjFzNxLetZFun4M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779104454; c=relaxed/simple;
	bh=eUhe2nZpU82CFKcjTiYxV7IzNNh8kfk1hQU3OMgUIeA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DZM6ce367vPOodfomMWHQsdrdTb0xTVDbDcMSke3hDh49NVrX7R7ROvqqHHBcImk2dyqJ+0w0IUXe8xnvP+c56qILnvCKP3xmzQNBMzAl+XOK/e7jP4FAat5tzANXOpw1gJrB8JrJGFrHw0hT8SU8ee9qLaT/k1KRMOdiO/7A+M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=h14q6XVH; arc=fail smtp.client-ip=40.93.201.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="h14q6XVH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XkvqW/PekkADvKGZf1bdZmSvAhA07a9eyLS2vsFbnCezn8auJajBCVblTBAalj392jXlvdnFBf9crddgfiz7DJJYbHect1Y5zHHD/w/CtvVWYOKnLirvUZ2J6T9kAXs5JELLEGa8P0Qmo0jvlO2KWriIiQ7On0wmDzgMvSPx5novHxBEpNs1WrjfWttzOCJ6w3UC0r+LLwJEp4CUuK9MjiGgRdvxLFu/m7HWyufSqYTi2Qbo30ebvl8skX2Yg9cEOuZrX1RLPqrEDUSMRLSBMQUU6GH9DbYFMdiWR67ABiLhOVdzSVYCYjf0h5tfOSQZp+Nm2ibh75yEzZmrg3lwBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h54fNV91XBHvL8vAbvuH+idCDjj9xKbk2xa95Y3Jofo=;
 b=fKFGflJGAj/AFJ6hQSFmOnBMvGVsDyrha/ojxACEmHQ7oSJywZZ9JpmhbOrcpo4B457hBJbXpcS+RbMn8xFJ6+cy1sQMX056Frr4m6C1py79Amzhu5XYUeASld0x1/Xrux3ApPppIbMo+F5QDy+JpxbdYpQexqLgCV8psSXFwgnM26cyhhIYn58oZ22f16Og7eXp9p3CZ2Ni9VBge/YxUfVGb5uYSEI2F5o2egyXlYDA28dNXozZnNc+MY09qHnjWIhFgWuKA5nfY3lBPiV5M5GNlzMtQ/r0OfYS/AZSQ22F7A8qC40oVowSlXH3lbXPc+H6nG+TIHuY7ZpwOLKqWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h54fNV91XBHvL8vAbvuH+idCDjj9xKbk2xa95Y3Jofo=;
 b=h14q6XVHN15+s6MNBnoDNR77I2SuZ6+Upq/dKoRNq32eSikbxQB1IZbjRXecDaIUeSO1wlNntwVitgyVcXV3h4PJ2H+Fteje/Qsk69P/YJIe3l2seVojeKK7lto+NxXrWptAkqo1JsA7zW15aJRhaAud0L6KtDQ4Aej30ZJoeAZF0M1bdfplsdu8jPnCzIou2rb0Fz7WbbvD25+UYIS0z8C51M1BII1g2ICTEWyhkDV+LBpVYyWXYZLQfHrRhYSCiYF4rTanVzRpPwy3OkxUSoClACefhrvof6/w2dmq/gpV/tGPJPOsP882HHPg4/fRRAt2z0ROlumCo5bet3NWQg==
Received: from SJ0PR03CA0247.namprd03.prod.outlook.com (2603:10b6:a03:3a0::12)
 by SJ2PR12MB9139.namprd12.prod.outlook.com (2603:10b6:a03:564::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Mon, 18 May
 2026 11:40:39 +0000
Received: from SJ1PEPF000023D9.namprd21.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::5c) by SJ0PR03CA0247.outlook.office365.com
 (2603:10b6:a03:3a0::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.23 via Frontend Transport; Mon, 18
 May 2026 11:40:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SJ1PEPF000023D9.mail.protection.outlook.com (10.167.244.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.0 via Frontend Transport; Mon, 18 May 2026 11:40:39 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 18 May
 2026 04:40:22 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Mon, 18 May 2026 04:40:21 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Mon, 18 May 2026 04:40:18 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: Laxman Dewangan <ldewangan@nvidia.com>, Dmitry Osipenko
	<digetx@gmail.com>, Andi Shyti <andi.shyti@kernel.org>, Thierry Reding
	<thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, "Kartik
 Rajput" <kkartik@nvidia.com>, Wolfram Sang <wsa@kernel.org>,
	<linux-i2c@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: Akhil R <akhilrajeev@nvidia.com>
Subject: [PATCH v2 0/4] i2c: tegra: Improve DMA mapping, latency, and power management
Date: Mon, 18 May 2026 17:10:09 +0530
Message-ID: <20260518114013.62065-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D9:EE_|SJ2PR12MB9139:EE_
X-MS-Office365-Filtering-Correlation-Id: eb536bd4-f64c-4412-505e-08deb4d24929
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700016|11063799003|18002099003|56012099003|3023799003|921020;
X-Microsoft-Antispam-Message-Info:
	CYsnFFW81ogt+q28w62jj76A5tBTH3YQlkc/dimr9LvbyjD6SAqXmz+c/RVNUQW7p+6TyNiwgA1ySNZyEE920B2PB/IJS6DDXMm9Hfddv9ksJJqHbqrYE/1Kpemoo3bK99jTUf/M7AMmF3hrOJzMrCzoZT7iIs1tyJcxka0n/HkgeQZez5HJj12xQyZN/fGl2WtUxOlsxuwk8RZcsxc6ZDcsAd7txENJWNmZi95AlMVV0hYDYor5wj9CjkeYqxF5BZJTUv6o422DiCCEL9W6qWm5BmjnN/MnWgZ1BPorIc/llyHz7yr6f66CiJFaSvcHo46FzQxx+xxiQRYkkVXQBPdWsGDBypEHNusQVg/TIWT25ril8gaLjypqifZtp2vErgb5v6UeW4wuE0px2/u2wTOLSTjKLfGWZ9q3y9Ek/z9OmptQ5db6g/vYpfK5fd5fgOQrl/I7xTlZfQPNrs8zQxKw5nA8LVclAtkVE8Twia42cz4xN5RHzsbgakcsJFUzx41BDzFIFeJG+e+EeHYb2JGoIbgG9eFPaRMwQvgvhB5eBk/nvLcmrbZXceUSg57AgRRqFMELaCw7bogCeEWA/1Hf/8D1ODEBngiwsJ5llCVWHSfgnOs2qYWDlo3s/CiyiMCAAqpxhReO73POG6cp2oJxWaXNdwWlbzsoMj/5F1o66NLfZOiZwtXV5ohD9T52BlN/wnRrIpjfvmFQ0nlVMfi+gY9aVIhrXjVi9V8UJKhhLMGFB+DDm47QjHwGkq1D5H2WeQyhjQZhZVg7F3KB8A==
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(11063799003)(18002099003)(56012099003)(3023799003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	WVvFd3DiyafFl9cidUO4G/SwkZevP+Dinr9oXKcjk0HnnE5hNwbjpklhtOsxrpFvwRo6+hDEhP+7XiOS7KBe0ofqRS/ZfNa63as8pzFwOcc5K7JHFD8aPRKyT01Ae8DJEHsJJaX8mtCNdswpGYc/cfcaF3oTqPWQej04YO53Qtke15PdwwCq7usU8tJCkmifDTEpDG0nULey704pwS5UmvC4UMNz7CReSMfqlmYV5EEIeA1DRwvo4D6ZrDr5QhAdt3k1FM0e+0/J207Sgl/AAVC7ARwZ6+zQvN8JrpwI3Dm4vRRplIoibFTEUYBP5z4vto89LxNBenfr+H1iJEJnzGvhDWaX3ziT/lL+g1Tchs4JRKupD6xLgW2w4LeOO6MunBD27pGWRE2W8+qI5B3o/9xDpWGA/hVxnrHwdSOiP2kWjVfPCY6Y4o3/FVG0C39y
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 11:40:39.6594
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb536bd4-f64c-4412-505e-08deb4d24929
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D9.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9139

This series addresses several aspects of the Tegra I2C driver:

- DMA mapping: Use the proper DMA device for buffer allocation to
  ensure correct DMA address translation.
- Transfer latency: Disable fair arbitration on non-MCTP buses to
  reduce transfer latency.
- Timing parameters: Update I2C timing values for Tegra410.
- Power management: Keep the controller available during noirq
  suspend/resume phases for system dependencies.

v1->v2:
  * Add description for is_mctp in the struct

Akhil R (4):
  i2c: tegra: use dmaengine_get_dma_device() for DMA buffer allocation
  i2c: tegra: Disable fair arbitration for non-MCTP buses
  i2c: tegra: Update Tegra410 I2C timing parameters
  i2c: tegra: Fix NOIRQ suspend/resume

 drivers/i2c/busses/i2c-tegra.c | 87 +++++++++++++++++++++++-----------
 1 file changed, 59 insertions(+), 28 deletions(-)

-- 
2.50.1

