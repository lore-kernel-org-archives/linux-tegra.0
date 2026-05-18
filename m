Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011013.outbound.protection.outlook.com [40.107.208.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5DF37C109;
	Mon, 18 May 2026 11:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779104459; cv=fail; b=TtrbXriZmavJbDjHgYVsxtKBcuZCBGp+S3d53XgfRcySO+YacLgb8IkPao1sDe0m5lVOZAmzS/hnfq/O/SWgZDf/D36Tz3bPN+nxlodqcENu9btazsRRcvAd5LJaYkyG3ZN3Ixu/JntUyvYpbinLG6hbmN42Lgn4kTcGdywEG8o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779104459; c=relaxed/simple;
	bh=tzqTdM5jTlFmF8y3YmZiwR5Df0yEEzruGo6vnjYLlWE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kOJ4raC4XiSVzQ+EwVNNi6DrttzcrYtl6fLZBvOscnDCNYi/3NC+SO4Em9UYtSUckrjvO5ZgGhUlmFFhGKFiOb8ML1EtnOHUMxPXyDj+c/GcanKMZkWTK+DUtg6oFQm3Sz5o4q9Y+l0KpFqSZFMdsEzzYXOSyMkwdECpjg3Sm2o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fmdkZJTU; arc=fail smtp.client-ip=40.107.208.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fmdkZJTU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mg/GpKSobPOXmMnUHKAuXb3LXcUQv42DWhSqJXjsr5puvhTDcrCWfmq1WR6tHoIg4QAq9K9UHSUWqRF6nOe4M1dEAh88PSyo95NaHchdrS6S5DaI+MQE9KiQNwyk/3L/pbs0VGjmGouICEAM3SgL7zohgFx1gorTC5kZpuU40oETP2d577WTF9wZIHpI9ldfLi0LZz8nVZ/IcnY4L+WocuoYCOo4HFqk/kD7x86Lfdti/jvZjJ22y+sFd0wOIBeRnncDgaauB0v3gW8KTuLrNYxf/mVnJ28p7IEBWr6TY4qtPVmNAMGH+iUSL5n6IO6ImFGIH64y7asIDWuwuzicgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r0ISK4GmjOjeF8Lc/fLYxoXQE8nlm+fYbFkLtYBjMkE=;
 b=KR5jCIoA5EsSri7cst80klpcB2JeihA1cqrZgczxE85CwdCu92eckx+1vOPWFpd1JDmsOJ/C0xgACYnsS+y4GDXFfJSs2hodMiAx/rinIrCnKbc9N6Xy0gs6Q5XFvNGMpImWsHxGd4f/SfKNLYe1ZIhhgqKli9s3K15+AiWYKKkmIEKtez/l6vobINR57Zff8XXWcXRosjVaO8qV6KbY+eDWfs8dLNiLd4QGJqZRAHKI7i11cqAq5oHmWLIyFzx4tPJt8xpS4VhmJglBP/P3rdcC0N1ic0RkhQ1bC9pdPTlDy+zaeuovxw2cOzsXL9SkbDeRl2JPzac3lV4ftRuHSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r0ISK4GmjOjeF8Lc/fLYxoXQE8nlm+fYbFkLtYBjMkE=;
 b=fmdkZJTU//V92GZ6EFv2Vvbauwes8C/mStuUB51/bvLfb9HcsWS6CHmuix6yhPRadtxuj4R4mLeIDV/CqoX6AoLgsvCaNf65ZJc1W4UndX2PB+6YRzWcQxz/J9oItP1EZtUVXpHsuKGsespaXzGYR6nobiMyGrnJ1Yjk94H0Q/t5/t076oNoOK1mfxYTU12BAqGacjeULoAfIdewQX2qMuX3hufAUd21dSngMN1ALUuyY2FszuDNctZAwzqeLK6Foe/5sEnce5BuU1+yRkkAXVqDkub4/rwl618A6l+S6vxqLiACmdWMwDNGt5MFaV7cWyZJZugX2i5BULysQ2e0eg==
Received: from CY5P221CA0094.NAMP221.PROD.OUTLOOK.COM (2603:10b6:930:9::19) by
 SA3PR12MB8000.namprd12.prod.outlook.com (2603:10b6:806:31f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Mon, 18 May
 2026 11:40:47 +0000
Received: from CH2PEPF0000009B.namprd02.prod.outlook.com
 (2603:10b6:930:9:cafe::18) by CY5P221CA0094.outlook.office365.com
 (2603:10b6:930:9::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.24 via Frontend Transport; Mon, 18
 May 2026 11:40:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CH2PEPF0000009B.mail.protection.outlook.com (10.167.244.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Mon, 18 May 2026 11:40:46 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 18 May
 2026 04:40:28 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Mon, 18 May 2026 04:40:27 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Mon, 18 May 2026 04:40:25 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: Laxman Dewangan <ldewangan@nvidia.com>, Dmitry Osipenko
	<digetx@gmail.com>, Andi Shyti <andi.shyti@kernel.org>, Thierry Reding
	<thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, "Kartik
 Rajput" <kkartik@nvidia.com>, Wolfram Sang <wsa@kernel.org>,
	<linux-i2c@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: Akhil R <akhilrajeev@nvidia.com>
Subject: [PATCH v2 1/4] i2c: tegra: use dmaengine_get_dma_device() for DMA buffer allocation
Date: Mon, 18 May 2026 17:10:10 +0530
Message-ID: <20260518114013.62065-2-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260518114013.62065-1-akhilrajeev@nvidia.com>
References: <20260518114013.62065-1-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009B:EE_|SA3PR12MB8000:EE_
X-MS-Office365-Filtering-Correlation-Id: f6fe8d07-9bba-4d93-e714-08deb4d24d7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|921020|18002099003|22082099003|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	UtGfzjfQzVbZLCquL6gZpiWxzQ327L8zvE5ibFt7wqKgiWqOvfpmxl2+fZ9eoJ3bmqzJ88xDehnTDxOjcQv8rll0oVSk9BCQyheKiRHe0IO9FeFStoCfD49dTpYcqhcHYM0mEndSrsUSJsVEFPhvLFyspE4YsWtslMMNFEY1ylePM/9j4lO/Jhft73ITWW2p7/2youpsz6x9o9TIMG96XVLR1Fhrx9IhqOb43p/zpQWdV3qkgZ/Rftulxnl/PkCb4wCp5u+W0icAjfRNt19wUWfiXExDuohzN6mPysMDVtJ3cVi/UxAEsnHBUIhr8opeKWNPF5yCGjMmzdy3i3feGa3lvb5w1ri7xwyo7A2O9HZ8/JwxJc+sipCMRRFL3S4lfoCYP8VprtTcHVuGJiaee5leDpE13IO38e1eyYFIbw6eTU2/AOcROSB6xwgkxSyFbBpQmp9UJ6gDA8LF2x+3Lgz4QNRFma9eyIRsgJ8af8Z30AU3JuY6SC5WmIorkgC9gXlKWuq4OrpYrw2Sl8eqnktSXheJeptjquWSwCYKxz9lgTOEfN6PyKaXPqhSksleT1gIaw4Q4kCxxBDlVJAgrtDtI9zjVEf5zSTl0919Q9uEX0RRG/bb3W14w1HPxYUyjtRpK7+klSk7V62o1m4SzNQ2OK8gC231tOUTh3VCxkJ4qmfEIVlVgjpf2GmzjrSuza4BB/vs1rq+eHB3djftiDbBTh9XhufU8m3J+QGAFhcWHp/4Ay2iLtjfks6mKRTOmb5gJ0J3MszEI6C86T5ZxA==
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(921020)(18002099003)(22082099003)(56012099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fr9Gp30sdX/vJHrsYT7a7rtnxkyFO8d/HEBLxp5tunjUBJQAxIq1Y2FSjo/iq5rQqDhgLIPsfQoR2G9OrWA9MnQIa9o2kFro/qaHZgWsJxbipua2jfoWNJkdPm0T+9SF+ILuiigi9gpoCmrAou/Fbo16b6882inlrNPg3nYohZ5WsOJkmU033mLV7laUDBCMkxlh454YQ3TdQBmDvFrrxXxfWCjsLJ8wycIALajbk0VbqE6PJdRHCli/4bM9Oo/33874M8D3d+D7YlWjSofrNylmSgQcb4HKdLlcEXjut08EgzTGlucePRgKXy2jDGQjnytGTypGeFJ3syBrlqp0/ZUvDD54ffAqPMsDdwXXG2AQeGk/fRFEn58IhTmStuJUBEc8OnK23JDOuxmNFywIhIXRNR0cJWFFVM78iYpYCbmVxSTJtXwTrztmxY7LlgHt
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 11:40:46.7889
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6fe8d07-9bba-4d93-e714-08deb4d24d7e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000009B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8000

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

Assisted-by: Cursor:claude-4.6-opus
Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
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

