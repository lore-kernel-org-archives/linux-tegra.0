Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012033.outbound.protection.outlook.com [40.93.195.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A283233F4;
	Tue,  5 May 2026 11:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777978811; cv=fail; b=U+YAbYjX9Ih8Q1qcCeUSbCzAvRFf8hsyhW74ml8VudRqdI7L9c3SI+qlLJ+XaZ/IcMG+ndppWtRipf+t9/BFlCFYiyVk98ZsIWS6QY8WM3WF5wv/ypGYH8MM0YMUyVckeyMUEm+ksvqzdzDUFcWbD6TUGSxZDct2FZ4CjqL/DDg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777978811; c=relaxed/simple;
	bh=HPWGWlsFfwdc6MvcwXq0L3X9HTVL2k1U8wL5kV80skU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Lrtglwkdzb61Yaw3IL8iLKTwB/zsHRRulohyRVBNhK2InFgsCXLAJ/Xk2JPAJN1jw9jA92jS6jvhb2KmmhLWcj550bPZlQknlSgWLPcojmmKZyHkso81VJqUPsrBn6SFaa0vkbJXymsv9QDO5pSJX0boWHeNFWV5pQSOLRKNEy0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WOvyus6+; arc=fail smtp.client-ip=40.93.195.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WOvyus6+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wP6jXtEyiZzk/cZJQDUdUK/TEiit81pwpy8TKrOFVGBjrx6WJzX5hfviR4sa2iyU8mPlFyH6Va3mmKIc9/8uOsHz3BFwmOKeYw88XitDlltr/kOjHehQunOvpruTILuF764vwL8zeN6DKWv8JUdisUJwvpNigmcsz5Hq0W3VYpz9lvm/IxYba3xbeB68gtzyvV++wO4d2X7/IOdo/85yGZx3ClMsFiH0pghvLWqWihUg/Bs5mRVItersmjRsgo1pV1J4uE1rGz3R9PDs12ntbzwCbdUCK/ptsxR4D06ynfubdgQ+QlLkLmOKHANP41sGDPZoBAQlt8RZf+hk9MuHSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wrmZ+/NqaBsAR2MciiHWHkdVel9TH/N9izq65UnUjwU=;
 b=NCX9U4EQn2sCSJ6kPIsd3OLipTcBCH4w7fDMZ978Z6ESsxlGfRYEdlX2/j/ZCgYe7bResN4F7r6DX/qrPRKN525qL6PCENMk8AIOJrzKVcWtkB250Ebo2sHrDHzduhB6rsLpIqKXjniAyNbtgQdMXeqgHGaqH69tXlPM4K2Tn11a/0pMSPw3d6SyBmJs++0rJbdidluqYfxF8hkY/YbyuIs7xfyFRYKh/jyLjulxKC5Rg9yF0qxiz5mhYU2OeivoiGcU4EhCktcK5Tv/P2hKcivzXNEc4GM2G5u7hyR8jklJFMpzL8Z8dBHvfMLV7sIbj2+DLIp6xRPfxs147B8uPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wrmZ+/NqaBsAR2MciiHWHkdVel9TH/N9izq65UnUjwU=;
 b=WOvyus6+tltG0oIgRlhWc8ngvA8IEAl99hXPuxjYjnnlkVmdohU+aG8JdjxF5wprJVFh+5f1uqGJ2JvcsnGpo+IgHAVD28tRHxuwTRdtsCYEzzwHy8jlnA7+ixcBGao3454haNqmtSTAgywrTrXAScMIHJWYePBFTBP9uCu5LtNnCrsrOnbIFR9CxHOUpWmxKp5tz5o74eQDERz6z7LPMCvnZG4rzT72a2+ekixzD1uOHzEV9X9oTGzi4Ptj4w2+opr+RDssTtbH3xa5Lty3o1qlOgxIx30IbtPS3yLSCZftFkHcod2M9gszDzuncC+hDXbcg2Tl6a+GSlPwrFalug==
Received: from BL1PR13CA0109.namprd13.prod.outlook.com (2603:10b6:208:2b9::24)
 by CH1PR12MB9599.namprd12.prod.outlook.com (2603:10b6:610:2ae::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 11:00:04 +0000
Received: from BL02EPF00021F6C.namprd02.prod.outlook.com
 (2603:10b6:208:2b9:cafe::2e) by BL1PR13CA0109.outlook.office365.com
 (2603:10b6:208:2b9::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.15 via Frontend Transport; Tue,
 5 May 2026 11:00:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF00021F6C.mail.protection.outlook.com (10.167.249.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Tue, 5 May 2026 11:00:03 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 03:59:52 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 03:59:51 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 5 May 2026 03:59:48 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: Laxman Dewangan <ldewangan@nvidia.com>, Dmitry Osipenko
	<digetx@gmail.com>, Andi Shyti <andi.shyti@kernel.org>, Thierry Reding
	<thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, "Kartik
 Rajput" <kkartik@nvidia.com>, Wolfram Sang <wsa@kernel.org>,
	<linux-i2c@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <mochs@nvidia.com>, Akhil R <akhilrajeev@nvidia.com>
Subject: [PATCH 1/4] i2c: tegra: use dmaengine_get_dma_device() for DMA buffer allocation
Date: Tue, 5 May 2026 16:29:25 +0530
Message-ID: <20260505105928.38457-2-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260505105928.38457-1-akhilrajeev@nvidia.com>
References: <20260505105928.38457-1-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6C:EE_|CH1PR12MB9599:EE_
X-MS-Office365-Filtering-Correlation-Id: d65fc1e0-e36a-452a-4e3e-08deaa9575fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|921020|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ZTU/JK+wFwNgYEK+CN417z7iMZJLOFItDpmlE6UrRnRrFNwGCRXh67UCB/cAw/wATSPIbB61kCJ2RGfChamoLhr0ME4QzrPrK9ovYY2mBvUjrsD1SvGxlapXheNFCjWNkMPEcm/KQe7g9TyNvI7yjkxEDvA6NvSM4qVvlK4VftbcOqsFCoBWQpDSjjOWCY8QY7gr80jOyFtyeyI8n+HHkjW9PqwgibxYsxjKxM8En1gO1ROhoIMEpivCfMfpehLCfAgKUIRkPPIl4p5Zk+34i/GwsSeuQKgUwu07i/DpufymAMmMGPgJxG4peM/jvU8bTVrjQa6/IkFP/cSIKVcl7k8gAC+DxyDKOqg4NeaZ41mrXPgRNre0ax7PEyX9dt2FucUTQ8hEQJwLfZ9jydFScU4l4uj6eQh6xUWggHI4sUV3YTD1idgLN7sN3K3IjktXT0LK3EEh7rOaQesIBgh3lwE6ay+Eqy4N98Q22K73T9WM/LOUeqbRUJ+qQS7kZw5eSwLmt9ENeQ8M3xP9yVKs5yMDCS0yyRDmZVQsQmkWcxCScJyhqQPhHjQelgpHugxa+Fnyx8AVI6knUTzjxX9JP1pIEogmBaXBgo1iiV9DdXUDphPtojiSgusbLSUProowKHp6fN501tqxoXBu6deO8G2LtWc3lAXDyhMdXaTbL38Ga5y1m056DxOQxdyIgeW6BUeCJyN1Lp8RgvBKPbpjprhMhGg6Xg9JwBHyf7L9Ks6gW1zZ629+6bzTDl0pnToVxNb7tL9WCIMGcQdSCaS14g==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(921020)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	juVmsdPOlRCaYQ1o2JL7ANkmkjKWhCk3/45R2FVkc1wTJRmaqXOcDLUqxBfent6iWLC7UaaYf9Cgv+R1nwV9Pzq32X4myw4LjfZs8/Cg+Jxb9BmPiVQvIzpyFezhfyZcXb6yNKwDfqfjcGBHGRPa4Ens1cGBsUz3Q2qWyDgasL3ReuBR4AzhQs/V9lWWmpPT/pN3k/xM8awT5ykA5m+OYjdkUrLT66X8qfAR0MHTbK3V6kQmm4Cz+amxloyxG+h9rPI0M6aCQWFi1DSSF6SWSuasryKGwVACz1rAVkGMsKGUX8XBQgaAllLPIQzdijQmg5xQ2dlM2984NF5irfUyI9Du5aREDij8POX44Dphe4rcB8aHj9U4wvyA1bewPG866pZJf6ayGeeUtIX/OGfkeUv+LN/5sHyaYmEeU9ui9LXNISPh68IdrBSQJktA29qX
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 11:00:03.7572
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d65fc1e0-e36a-452a-4e3e-08deaa9575fb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F6C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9599

Use dmaengine_get_dma_device() to obtain the correct struct device
pointer for dma_alloc_coherent() instead of directly dereferencing
chan->device->dev.

The dmaengine_get_dma_device() helper checks whether the DMA channel
has a per-channel DMA device (chan->dev->chan_dma_dev) and returns it
when available, falling back to the controller device otherwise. On
platforms where the DMA controller sits behind an IOMMU with
per-channel IOVA spaces (e.g. Tegra264 GPC DMA), the per-channel
device carries the correct DMA mapping context. Using the controller
device directly would allocate DMA buffers against the wrong IOMMU
domain, leading to SMMU faults at runtime.

On platforms without per-channel DMA devices the helper returns the
same pointer as before, so there is no change in behavior for existing
hardware.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
Assisted-by: Cursor:claude-4.6-opus
---
 drivers/i2c/busses/i2c-tegra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 9fd5ade774a0..a21f6457d41b 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -712,7 +712,7 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
 		goto err_out;
 	}
 
-	i2c_dev->dma_dev = i2c_dev->dma_chan->device->dev;
+	i2c_dev->dma_dev = dmaengine_get_dma_device(i2c_dev->dma_chan);
 	i2c_dev->dma_buf_size = i2c_dev->hw->quirks->max_write_len +
 				I2C_PACKET_HEADER_SIZE;
 
-- 
2.50.1

