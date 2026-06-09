Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012051.outbound.protection.outlook.com [40.107.200.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD941330B3F;
	Tue,  9 Jun 2026 05:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780982352; cv=fail; b=BpOel/5JgXqFE9ZmmstYCKmzOPa25ZJ95Lym9cgyt6SibBA//ZsU3jtBAHaWx6PzNfK/hU4DwiCH1kiqmvEOQPGNp63mij59cKgEMXKWHskRyJSnPWX41OSRQlxbbU7ThMAEuX1r/EInjnGkm+dYe4lvlbuGV1roL5LWEeVfKJA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780982352; c=relaxed/simple;
	bh=+6LuZahZcVFpp9Vvuf5e6Ac0QE/M1kmMowzg3fMsJVQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nnMSE1v8KYJ5hzjUO0R5AY0fYJm0kMBKccaGWZSXiOrULPWJhLmbdqE6OuWtUrygw5lxH2PdxsKGSGL0/7A33lsHTxnORyJh3CWBa8xS41ZDNrmfM0k+nnd3FeaqXa6Yoq/6xZ2hjM4ZWSpFSgkSYqkDI2H6Aj/HscVX0vBEPs8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=D8fi5pj/; arc=fail smtp.client-ip=40.107.200.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="D8fi5pj/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XV1TnrPdtPdNCJK0Pm9EyCDG0hrjoAoylBU4UYjXuOQqHvJXytHovbuql+HarP19Ncz1fM4AFeq0CWMgr1L/TwuJCrmEmBfN+6dvcJD4GjvJxiJXI3qYyeCHmdcDQQ5fLGQZrvNwZwjGnajI5XYuLJRZMRPeGmCXLbwG+8a9LOKIxbyzdKT6FVq05+ur1mm0JC4tvFL5hgG1yn6u8jKrKGVQqTyJVFdmdzQD4kYYF1qWzwroVTIG4JZpwUty9LFvnB+Q4IBXJCOi1nUVCV5soC7zDGfSthNuzlGNdaWlkTE4ZRLzB31oC3Wvr1diJhJP0B6smB0GhilGWciNRYpLTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CvzAismpprrh/fi1pNGY+qT0A7KRPyy5UbuiDndXWXU=;
 b=jNPTLzYj/shWwmgIRtM2syeZwzIBqdmDaRSk74fSLLbyejPcC8u2Tueg3pPWlOJEwSH/LUV2HuD6PTTxlmmNrUZLSfdWNbNcWg/vN/jXLlDGDgxJRta+GX4RxI2aS9CUME5k5rAwM+rDBnNUWYkUPp6npCFV8nJF8OyLGcs9mUOSHjgYsFee7DkOg1gD1tvXwdw1AvJKUVh2m9rBsDwiyYv8tOa56fnvARmxDNP/tuuLPWJHeK3WJntXggZ+bkEDKPBatW/WEhxyHArRrrqHOvLoE4JaI3vyE/Q7MeTIvVjaMeKRpQ1WK3cFzmmyB/ZtT7eZsLzIFVNViSKozoJauQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CvzAismpprrh/fi1pNGY+qT0A7KRPyy5UbuiDndXWXU=;
 b=D8fi5pj/QWMvPWm/ja5lXl9mT2rbMwRhPEtu6DbIfj0acwkxiqaKwjEBe8SqXGm5bO1clc28cM1TtTZSoSJZ/ubnkfCxU0rMUzJpi5xqvD7Azx4+sEgFmZVz4i5HMJxQJULQk6jlNxS1uUWGwWUHgbY7VLqhNHoKcm5P7i4AzgEovNS13+a2ijcFimoCWepzqYsaNm6NOBs7QPgx2Gy4YOg7ThuafBT94CTk0AHDDNjqZ9xb95RvX4mQe9JkiCsUUfjXC4PNlesgDN/cGlExm91kmCd1Elc0CBxZ4ABiFvR4mqaUFkc0vLPHwBgQJR+tzm69Ao5mTj3Yto5H/W1crQ==
Received: from CH0PR04CA0102.namprd04.prod.outlook.com (2603:10b6:610:75::17)
 by PH8PR12MB6676.namprd12.prod.outlook.com (2603:10b6:510:1c3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.11; Tue, 9 Jun 2026
 05:19:06 +0000
Received: from DS2PEPF00003442.namprd04.prod.outlook.com
 (2603:10b6:610:75:cafe::13) by CH0PR04CA0102.outlook.office365.com
 (2603:10b6:610:75::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.13 via Frontend Transport; Tue, 9
 Jun 2026 05:19:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 DS2PEPF00003442.mail.protection.outlook.com (10.167.17.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Tue, 9 Jun 2026 05:19:05 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 8 Jun
 2026 22:18:54 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Mon, 8 Jun 2026 22:18:53 -0700
Received: from build-akhilrajeev-noble-20260602.internal (10.127.8.11) by
 mail.nvidia.com (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Mon, 8 Jun 2026 22:18:50 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <andi.shyti@kernel.org>
CC: <akhilrajeev@nvidia.com>, <digetx@gmail.com>, <jonathanh@nvidia.com>,
	<kkartik@nvidia.com>, <ldewangan@nvidia.com>, <linux-i2c@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<thierry.reding@kernel.org>, <wsa@kernel.org>
Subject: Re: [PATCH v2 0/4] i2c: tegra: Improve DMA mapping, latency, and power management
Date: Tue, 9 Jun 2026 05:18:49 +0000
Message-ID: <20260609051849.1734182-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aicYDVct2VElN4IN@zenone.zhora.eu>
References: <aicYDVct2VElN4IN@zenone.zhora.eu>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003442:EE_|PH8PR12MB6676:EE_
X-MS-Office365-Filtering-Correlation-Id: 25260745-2787-4fbf-ce9e-08dec5e6a049
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|18002099003|22082099003|3023799007|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	eVXqSGKjU1vXwDg9MU3soG48oSXupG90THbeQ/8N6OgkM2K01nw2DJSwoHM0YdOxjTguRb0AOOmzonTqqJ50S4BuU/m+g/YqD8J+amHxRu1Gh3XKHQxB0eRnhPScmimlW8DRNLJMOh8DPWvgLQsYBO0XXbSF974M9qWgCyALU3WBzsvdmLXZF5/yd6S8mGXvmE1aF/wSdh8JSppx9so6z+UVMniOvLWSsyjgwiITZppkdv5RhcIga8yz1BabqCtE0lgERLsmTabXh4wIIrpArhqJL1YiaUaC7TrJE3EzS23v1rV1Gd0wit7QZY8Z1LzJ9crL0wUYOWylEekdEbTWo/LDtYIGVRlCmEyAAjhvEu0wxLUGkHNvK6HO4UQsvwbTbaoTfliR80FvBNn7cK/Qo396ITCPG5fRv45Ui5ugwfDDSDjm8ePF5nro4FK3AVmYdgJRbk6LueagvHVQq0ciMz4OAyyClfjEFDXp1iLricAuG38gMkGGbB1rJSwZy+KLNcVg7ed2U0eKTFv4N1mkUIabFk8GpKoL7WDiMHNMi6aDWMQ+Brfb9/nZCswWUiVeEobWIYQ0v6tFm8RZdC9U2GRA9aQpZ7RGg00Tdj6wPSx7U1yDjO3ryGT6sJkQINHsYGr6BqF6aVYkwN6V3SDHELIYLFXxdHEhADAa/IXOa7itLKlkp9AoXFX+8aExjWWGUdfxKg7rFR8OcgddUCw9cz3yBxHza91YT+PCV7Nw7to=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(18002099003)(22082099003)(3023799007)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	J/lk3QUhG4W35Eo9NtXcy2UbvAoRcpQYvhQnaiMeRvBHXEyungx7AgeEIL+8+7NdN0OV9Ip7/O258tooZJPIPC++DFkDAp8oBogoki3QxQDU6t3zg2oSX2Zy1Z0VqeYhkBHZ4kYF0ZTb7I6Fn9cpQ0LVfIhqHdCzMf7xSLd9ebu2NfU1qUbGoX16zLf7vUdTMP8c7U042bOMUwg3ESvMau3VzQRaZOJ6Rsv+HbtQwboKyLDhLBwtAVqKuBs8FqsD+jdplkWQtzb5cgJ4x6Of+LAq9eDcXZ5lo/TLeHhCC9QwmC8yG1BrLRRZbNXaN8j8ntOrX9obKJHt7AdrYDPGcdqgzD80wnso8dCzit1yg5+2TjHjIl1pNpeQBsHc32/nJEKRgQaFWvJ8YjprZTOiXCzqcTgb8kWDuA1PBXRdBoYODAQ8DTV/T4dwnWyuIPzj
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 05:19:05.4062
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 25260745-2787-4fbf-ce9e-08dec5e6a049
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003442.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6676

Hi Andi,

On Mon, 8 Jun 2026 21:30:59 +0200, Andi Shyti wrote:
>> Akhil R (4):
>>   i2c: tegra: use dmaengine_get_dma_device() for DMA buffer allocation
>>   i2c: tegra: Disable fair arbitration for non-MCTP buses
> 
> I merged these two patches in i2c/i2c-host.
> 
>>   i2c: tegra: Update Tegra410 I2C timing parameters
>>   i2c: tegra: Fix NOIRQ suspend/resume
> 
> I merged these two patches in i2c/i2c-host-fixes and they will
> hit mainline first.
> 
> I haven't seen any link between the two groups. Let me know if I
> missed something.

You are right. They are independent patches and do not have any link.
I missed to put them first in the series.

Thanks for merging the changes.

Best Regards,
Akhil
