Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010024.outbound.protection.outlook.com [40.93.198.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18EEF38237E;
	Tue,  5 May 2026 10:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777978800; cv=fail; b=hahyACZHhvg3V5jNlJ+pPUoS3toKvIBoSzptch+o4/yr0UsuB3LAx7YB7DNASkL8zuJMx1EldnTW2CypK3msdeYpMsGJEBgzSWb/ZSmHEdpgyMxJEFlL+XIAERnPBAepEQ68Lf9rRpZ9ze69qlWNoCaFOSKdetINdIuoHAVQmRo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777978800; c=relaxed/simple;
	bh=pkn0IyN8aT5BsHFF0qhlgqI0677qIGWkPAI18Njt4VI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lOe8KKLzO6FDbMq3GrSXp5uDmaTDJxUCrutqwjSvoyg3qcUnNdEpyoxbRYF2Csp1TRKk2He7Ua6r3SnXr9RJMeJRzeo+crgsaf22xGwHs4mEOiIAD1fIAzjS0mjtfkUbw+xdHj3sN6ij80UTEmjR9o/MfBtGYKXT6iA41fAox28=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=bFZ5bXaQ; arc=fail smtp.client-ip=40.93.198.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="bFZ5bXaQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q5e7IXrBzg8JjoUe4ruu8iF9zDe2qASbENQD5+o3xW+1dwgY7edGYN07dbhf05yZfi/gkc3GKLdRBHPOftZXjHf5na9ekN7rqG7H40YGCzwgZquHQbIojZIcs3eG0D99GyHKS0H3nDSjaxfVbDKEjSu1LVceLQgNhkEL/TEpEcMY1jj0TQ9wCA2RjZmK5fwng3DqCpnyFibLiOSGER1RSj4dRuY0mtDElHBv2DH4IxtB34XllaF9fKGQVkcRxKt9ufJSmfAkHXznpRCwDX70FnfnvsnQEF5TiGZ9I6PF3OFk69JO2nZ7agbBOm1cAbHBKeHUuw1LXquePNQ4uKCdKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ql0xWRkDUR2oYHQ9vLBnjEjDfm76NQO8iEU7icYgLww=;
 b=TkW6+YNoeLu51CGZH2usTyeMUzbp58piQTbTaFuTTkhwqMjTmacrRl7jmNKt92a9JM2Y41RWv/ieJHCSYX0JgMvmksYsGuk2vbLh5qtKjJ7iViN8T668HSoKuUzXdAWKkUPHHvk5b+KmtC8vKyqt01/kHatkbi8FQQZ7q3kparJPTVGXYuaH57/ZVUP6S88ZmCSE2Z6ZXaW9weZ7to3biW1G9dCd5MdV0fOW0TN3fgjdWRigUB/VJT4hj/IPLgCeUI6kHA72HLtemZ68wikqf3lzIUS6n2xPKMkz+/Fia3BVWMsvh8cikk5+9IsDiVnaknXhv8UkDL504g0b7iHUGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ql0xWRkDUR2oYHQ9vLBnjEjDfm76NQO8iEU7icYgLww=;
 b=bFZ5bXaQBVnIE1TFG0r5fA+vRMnNIj93KL6P8fSUb9efl6J5sFnuSthvJrZFpTLOObpArvSlR//UOVORe9ocF+u09mXJa4a5srW0M6LajQra8su+eol0MwsMwV8ohWexTpEUddqPlVQfDOYePXYOK5rUcGKlifRVFERnW2mf9DIsxRtVFLhu4QAEKINTDC8XW0u8Wr0U5bI8LBBcHgwG/XpeycNJzzEyIcQUxKYUxVs2Am+HbldUGciV/81gzdmFZsR0/xLA/9fThMNhTEjrvcJNro/oIFCQWyTEXZKPJHHE5wf1+75SIsX5Z9aJshQ1serLir9pffgr78z72sYaTA==
Received: from MN2PR07CA0012.namprd07.prod.outlook.com (2603:10b6:208:1a0::22)
 by DM6PR12MB4250.namprd12.prod.outlook.com (2603:10b6:5:21a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 10:59:53 +0000
Received: from BL02EPF00021F6F.namprd02.prod.outlook.com
 (2603:10b6:208:1a0:cafe::6b) by MN2PR07CA0012.outlook.office365.com
 (2603:10b6:208:1a0::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.25 via Frontend Transport; Tue,
 5 May 2026 10:59:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF00021F6F.mail.protection.outlook.com (10.167.249.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Tue, 5 May 2026 10:59:53 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 03:59:41 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 03:59:40 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 5 May 2026 03:59:37 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: Laxman Dewangan <ldewangan@nvidia.com>, Dmitry Osipenko
	<digetx@gmail.com>, Andi Shyti <andi.shyti@kernel.org>, Thierry Reding
	<thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, "Kartik
 Rajput" <kkartik@nvidia.com>, Wolfram Sang <wsa@kernel.org>,
	<linux-i2c@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <mochs@nvidia.com>, Akhil R <akhilrajeev@nvidia.com>
Subject: [PATCH 0/4] i2c: tegra: Improve DMA mapping, latency, and power management
Date: Tue, 5 May 2026 16:29:24 +0530
Message-ID: <20260505105928.38457-1-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6F:EE_|DM6PR12MB4250:EE_
X-MS-Office365-Filtering-Correlation-Id: 978381c7-ea1c-41b3-14ad-08deaa956f93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|18002099003|921020|56012099003;
X-Microsoft-Antispam-Message-Info:
	j//gSIj2GJ7TQNEEqMvl3Rz5Ou7XxhjW9aLrvwacXzzhMiKWiPT4WnWjyGt8XyZDABbtR13y+LZNfuaeHOM77UMPDYOIcSNtEvS+Zq35ldcDqMXWYjvrVIZlGaDZ0j5ecuh61yOTO3uDa71co1+GGKWV1B/6EPHGaHni6CN5RhBMaE+3BdZ2AWFYe3AoZi0Hx6BQEoAbXJxedSsc1ybEfR1XeJ4A4hRahn5PpTD86QazOl0nbvzU/LGgeWOBnxrlBswxNGs7yRM9zvs1e7rc3ftju61iuFaUz9Qn+5Z+WJlS7Svk73WldFAzT7/21TsvSFcokBgLmEM9abA3KIs2bvVZwGSEgnd3ugicLVnotiOssctG1OC1l7stb5EpD8b60ogHqFAgRLm5Xs1L/kx9X0DD3SL7Y9Hh8nmgr/9BlD+3hUXdxwRvpHlZkBmiZ9VbRHj37MII7s9Jf8c/wx8eI1l/R4uzsMPEbcblRFoHGki//d6JKjXOuGKVgD9R4ZDVqQUUEIELvpEAITsCBnlFXnoBE9zOuaarwruYjWCaf7w+Vg89v6EsUcvgYOxbrqR1yJULezjVrdwyhF8xhPFXp4WRZiSe4F3HxG6Nt03u33tze21m9/I3WOHxZQCksV42udHDkenhkz0pGvSCB++uq8N4vYCT4Osjtaj+AmQATgYdH+q8cI39b/JqhL6Iw1gYSm+jZI7GyRt172PPVU2VFPj6SCSMAt7Fx+97C5wZZgy/pq4oyuPRGHipv8sd9kQOzM5VnD7DwfJP/lpeoQjkTQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(18002099003)(921020)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	S/cHRqpZAS3j2x8YHAsDveelaUsDpVF40JME2fWn6Lyo3nIusLGgVF0noTZX7vgIDX3LNSsX8S0zUgMf3KiejmWY5CmA/hDf2VOLw3/kOgWysN8HvJjEmvUxUiBNZEwr7CIgVC8DSykC151m7Kl5wqKw1YKmpbPCrDCmiMKNpPgq1RLxxAKgX477sQVwz8y9dOB5OpRCJv81eyxq+mVI7ApGj5Hov40w5WLMQCVq4gxWhlzwcH197o7AuMOXVIuopYUxesmOtUXiTEUfylwbZnp++3MaikTnuprk4jt/KhogoQDyqwZ7gUl9rkuYlwkZOuhewpMt+IQ7luG5cd1ZgghYUDYp4PGNUVar3b2qumbqf5Ubexq8A4JeA4LrNMB85T669P+3LLtEhVQc07JUXaZKX7TN0H9eVd8PUjjXaDbaMIzeFXDewmFghtCbG1jV
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 10:59:53.0120
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 978381c7-ea1c-41b3-14ad-08deaa956f93
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F6F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4250

This series addresses several aspects of the Tegra I2C driver:

- DMA mapping: Use the proper DMA device for buffer allocation to
  ensure correct DMA address translation.
- Transfer latency: Disable fair arbitration on non-MCTP buses to
  reduce transfer latency.
- Timing parameters: Update I2C timing values for Tegra410.
- Power management: Keep the controller available during noirq
  suspend/resume phases for system dependencies.

Akhil R (4):
  i2c: tegra: use dmaengine_get_dma_device() for DMA buffer allocation
  i2c: tegra: Disable fair arbitration for non-MCTP buses
  i2c: tegra: Update Tegra410 I2C timing parameters
  i2c: tegra: Fix NOIRQ suspend/resume

 drivers/i2c/busses/i2c-tegra.c | 86 +++++++++++++++++++++++-----------
 1 file changed, 58 insertions(+), 28 deletions(-)

-- 
2.50.1

