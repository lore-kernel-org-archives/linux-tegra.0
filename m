Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.19
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793619187;
	b=O93hT7buFn9cC3+cH8XcPACwrjdtAkRtN+ZxllK8M+uwgF9FDZvIxN/hYUKQuB7RdqwT
	 tJwer1zCR3Et/QZK3dzZXZRyMK+LiHPPv+t6LkLAle+7AeHkTZfdCTSCevczxvzVk6/Fc
	 EadyEVREmTl8NwdctsixFGOl+e3ClH/Wsx+/FtLqUEvVqy0xoOlT3YcCPmjYqhs6KetY3
	 wmG8pRwp9AtNSLDvVvZWRfsfyRqFf4rB2xTneMxn4kmIuI/spHeTGlT4wVerUgjuqudnm
	 wONIF0x244bOmZv/+WDB/Kd67SGcDwuy4p8IqwIhZ4tXQWSyk2iQioFFhZKFYAdcUrw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793619187;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Originating-IP:X-ClientProxiedBy:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=3IeRbfQM1ag7ogsMYYuYfavYun8p+ZM7wP90Ei+O8ho=;
	b=UQnLT+YqKji7riwngCeIGKuPNA/i6D4CBxFG+AQZYodieTca9YWd/Zf59GxYfHicmePK
	 1ia1cwEb7E/eeyI4O+a7Rkayjc/6wW9T3nJPvf3dxUHavUt739GobKRkLSiPiviQd3COl
	 V6hSN0A7Bpl8FjkhEqBxn+A1IJbLQsRtHQsgOAqrRbp/NdwxzWB7TP3A05SiKktl9PzDY
	 iV2Uqii87ndZi96Ijek0jOfdMl/CJUpeW9JDb1x5EP9QX2XpeXAuP3h3+ZQKGBs94AQ7E
	 2IF9w8rqSKwCtEj1RrNNKFQNx3yyetMstV9NfF+q0BQPJ6FqoMKZrHLE8pw9AxAACZg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=GcUu6iO3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.19
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012019.outbound.protection.outlook.com [52.101.48.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F5B606A32C;
	Mon,  2 Nov 2026 11:33:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5F5B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=GcUu6iO3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GPSQGOKCrJbSZ5kyzVRwYyG29wuix55lur8PcnVdVNxf+4ZqIYX0rehMnw8eIB1ujW9yC7xjUT70/nJcWvGJivthXHeTUl6k1sFcowLiPZ2lXH+RaXtApVDYPy4jNeLRU7MVrtb9wzShZpuOV3Q3kqFmU81CV3NqQ4UzDYj1rwENUTRuuFlEG1MQusk9DEhmDs2LX8xZSpPPFcR5AnQWTrwg8uUdPXfdD0DLYpphfMRX6EMYVYFIeuV4wwzYuVX0F/Iw4ldodLgxoFdSrilMqAv9cxGB+gY0M2eY1fdHw/bXc3LoHRt67tBO2P/3sd2DWIKNloGhmzi8vUkDkgDF/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3IeRbfQM1ag7ogsMYYuYfavYun8p+ZM7wP90Ei+O8ho=;
 b=IjiVojKeDsSKTYzjLZP1XC2InDvGnPAIRNIDnrLQ7fHQATBIqiyt/dFb+lSAeCNBbbhmutC2YC5aYFzDqZpyFEfKzDP+SLMiSt3IW2JHipEjVeK5Kbup72MUh+GwDTC708RnjjhPY+Jx8jF29EM/9NqjH8jgBxr3RnXxDQ5zDdSc5d393YiD8NWs0AGfRc/scWLdnDIXCsJwZtgcQAlZDMtFsO0WQYolZ+sJaabMdMmm4dySeZeof/VMzpEHsWFySNCf/Ww8UWnisi3NEZsciyRtBOSmcRqQS9teDxYba9yE8iomsmW1WG0n1KncaiiPId4PAjUCpvj9f9A/GPfnYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3IeRbfQM1ag7ogsMYYuYfavYun8p+ZM7wP90Ei+O8ho=;
 b=GcUu6iO3l3U0p7vO45PgIiAjHSNDU5TovXwZKbBxXn63+BwXfF5cXwtJCruBxazuQGsszxkU1x+GkqoEhPQmik1R2MmBEq6FKnDZIZ4oSTwmyXahQST3MA2MZNfDdKdUWsB9hO0z/fPAPKYt3OtYJAhH95d6A5v3DfwsBzUe8ZduZ99UkX0Zb2rpRRbbkj6ah/fsUUxRDiMKQwprmLQQYeMSE9PHidhVKwFa7VC1r7OOCUtL+8VvT6G8Iplz2ZUZz0YudibShMT+f6EaY9k6OIaaQJGzJzeyx2sF/S8MvaXEGr730G8L/Iy4aLy3JtkcyuHIBPX/tkDKWQ0u9NYxMA==
Received: from BN0PR02CA0002.namprd02.prod.outlook.com (2603:10b6:408:e4::7)
 by SA0PR12MB4480.namprd12.prod.outlook.com (2603:10b6:806:99::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 11:33:00 +0000
Received: from LV8PEPF0000006C.namprd03.prod.outlook.com
 (2603:10b6:408:e4:cafe::55) by BN0PR02CA0002.outlook.office365.com
 (2603:10b6:408:e4::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.12 via Frontend Transport; Mon, 2
 Nov 2026 11:32:59 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 LV8PEPF0000006C.mail.protection.outlook.com (10.167.248.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Mon, 2 Nov 2026 11:32:59 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 2 Nov
 2026 03:32:44 -0800
Received: from build-johnliu-noble-20261009.internal (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 03:32:43 -0800
From: Johnny Liu <johnliu@nvidia.com>
To: Mikko Perttunen <mperttunen@nvidia.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding
	<thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
	"Prashant Gaikwad" <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet
	<jbrunet+clk@baylibre.com>, "Douglas Anderson" <dianders@chromium.org>,
	Aniruddha Rao <anrao@nvidia.com>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, Johnny Liu <johnliu@nvidia.com>
Subject: Re: [PATCH v2 2/4] firmware: tegra: bpmp: Add Tegra238 support
Date: Mon, 2 Nov 2026 11:32:08 +0000
Message-ID: <20261102113224.2404743-1-johnliu@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2Hw2_7rkSLKRLbLEfioCFA@nvidia.com>
References:
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PEPF0000006C:EE_|SA0PR12MB4480:EE_
X-MS-Office365-Filtering-Correlation-Id: 71fc960d-4238-47b5-f0fc-08df38d50c6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|36860700016|82310400026|11063799006|56012099006|261009223027099003|261021123027099003|261021121427099003|261022075727099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	nldwTojiW3yW23NYa7jHcdT5EVYHxQQV+ZaiVYfE1isAtFoeWoyTgyOtt1w5SMv1VmVwA3xh79rolnMqhRgDWf+MlPDJezsn/8htnOdcVcrOZEGg0tW7VfNC32+qNNuS4nwVtCtZl9W1zjJTxa+PO0IM4ZhdWGO633jmNmd+L2JDulpjOXNlVMV/Y1DFkipZ+xbHGl9ce9QQ4f9bs2waTQl0KbRbVnFi/rM9rSp/ujAVNw99ZVh0X/nnmwaBwUGTaus4k+hObcAS176Wgk8fcpX7JH6oEhvY4CzKBt8nMDCFX9NfCqOMqt0V337JNit9j9SlG5uItECq315SWPyBh17dV4gKCcrZRYDtx837aOqF1MlWm69ZmwvgFCvNthtQPlkDUddcM8HWbfKMoTEFZdQ73+gJN8r91KkM4dVJq01WPVa9QCdVjcn4DgZPD5GTXUf4y929qvX/8Xg147s6oeNRg+ssos8OlKsFCVJdnATW0u9uKirnYilPMNOGzY7g58OEdUBrbKl2FOUqxKnTH/af5JrZzIsST69r5k1EFp9Kp0cNzt4EA2BQfv6wPpuX0F9Mvyi9ImSJoVsvD2+ppXEJlV5skUbxUtLCidSWDt9I3Q8G9iugIVGnSDD2y7eXJrVepDgXA72Bo9jLcrzYXzLPx0VEv2tPzN5kHn+GcUm9bCXvQTrCCua8jOk2QphZCQdSUYemoKBRdapLUEcxXg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(36860700016)(82310400026)(11063799006)(56012099006)(261009223027099003)(261021123027099003)(261021121427099003)(261022075727099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Ksfe3GfFNALqKsqYP1wEIkQAoOKbw9aow2rEa+xOP5bP+fsR+qpE4ZWfIXYaT1CSTW+dt+lXBQrkGqsEC4Y6DSCHSYDukkXTMlslsJ3HXloQ3yukDYxQZcHsFaxxZcBUPfnVT8e1IS5VLhqYms3cWQF7rbBu3wY1vDaSYcy62rWUTh6HZofv0ASLI3hi9Z9nFrUIrikHAxfcP4KZsZh0aMoszg6TZ5g9tBG2llvpDhIjx137+eDWSe0dc/BjppNCmyIs+I8sMvPiMqj5JjGBjxZmsCLHm4D+42ySYhgqelWSYDFxb66nv0jwfMy6RdA7uhHL3EtioWahIu9FymBqb0CLz6TJE7+mA6+nSDOPCDjspY80gzYNfsfl3VbQJR2zvbhC5Sqh9j6lxWR0uVkg0U96qcEx7z3Ei78NvRbRTKbqwaPVe7LtJTn7LKjLA8Xu
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 11:32:59.5804
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71fc960d-4238-47b5-f0fc-08df38d50c6b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	LV8PEPF0000006C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4480

On 2026/11/02 08:48, Mikko Perttunen wrote:

> On Thursday, October 29, 2026 12:49 AM Johnny Liu wrote:
> > The "nvidia,tegra186-bpmp" compatible and tegra186_soc data are shared by
> > Tegra186, Tegra194, Tegra234 and Tegra264. Tegra238 has its own BPMP
> > compatible, so give Tegra234, Tegra238 and Tegra264 dedicated SoC data
> > selected through their specific compatibles, built on top of a common
> > TEGRA186_BPMP_SOC_COMMON initializer. This allows chip specific
> > properties to be described in the SoC data. Tegra186 and Tegra194 keep
> > using tegra186_soc.
> > 
> > Also build bpmp-tegra186.o and the shared match table for
> > CONFIG_ARCH_TEGRA_238_SOC, so that a Tegra238-only configuration binds
> > the driver.
> > 
> > Signed-off-by: Johnny Liu <johnliu@nvidia.com>
> > ---
> >  drivers/firmware/tegra/Makefile |  1 +
> >  drivers/firmware/tegra/bpmp.c   | 54 ++++++++++++++++++++++-----------
> >  2 files changed, 38 insertions(+), 17 deletions(-)
>
> This refactoring in this patch makes no sense unless you first read the 
> next patch, plus it has the unrelated factor of adding Tegra238 support, 
> which makes it quite confusing.

Yes, I agree with you. This patch makes sense only after reading the next
patch in the patch series.

> Can you move the TEGRA186_BPMP_SOC_COMMON refactoring into the 'per-SoC 
> EMC clock ID' patch, and have the Tegra238 addition as a separate patch 
> before or after it?

Ack, I will move this refactor in the 'per-SoC EMC clock ID' patch.

[...]

Best Regards,
Johnny Liu

> > diff --git a/drivers/firmware/tegra/Makefile b/drivers/firmware/tegra/Makefile
> > index 97f7a5db9d0a..21e87f3afffe 100644
> > --- a/drivers/firmware/tegra/Makefile
> > +++ b/drivers/firmware/tegra/Makefile
> > @@ -4,6 +4,7 @@ tegra-bpmp-$(CONFIG_ARCH_TEGRA_210_SOC)	+= bpmp-tegra210.o
> >  tegra-bpmp-$(CONFIG_ARCH_TEGRA_186_SOC)	+= bpmp-tegra186.o
> >  tegra-bpmp-$(CONFIG_ARCH_TEGRA_194_SOC)	+= bpmp-tegra186.o
> >  tegra-bpmp-$(CONFIG_ARCH_TEGRA_234_SOC)	+= bpmp-tegra186.o
> > +tegra-bpmp-$(CONFIG_ARCH_TEGRA_238_SOC)	+= bpmp-tegra186.o
> >  tegra-bpmp-$(CONFIG_ARCH_TEGRA_264_SOC)	+= bpmp-tegra186.o
> >  tegra-bpmp-$(CONFIG_DEBUG_FS)	+= bpmp-debugfs.o
> >  tegra-bpmp-$(CONFIG_SYSFS)	+= bpmp-sysfs.o
> > diff --git a/drivers/firmware/tegra/bpmp.c b/drivers/firmware/tegra/bpmp.c
> > index d3508e98e338..beeb385870f5 100644
> > --- a/drivers/firmware/tegra/bpmp.c
> > +++ b/drivers/firmware/tegra/bpmp.c
> > @@ -1131,25 +1131,41 @@ static const struct dev_pm_ops tegra_bpmp_pm_ops = {
> >  #if IS_ENABLED(CONFIG_ARCH_TEGRA_186_SOC) || \
> >      IS_ENABLED(CONFIG_ARCH_TEGRA_194_SOC) || \
> >      IS_ENABLED(CONFIG_ARCH_TEGRA_234_SOC) || \
> > +    IS_ENABLED(CONFIG_ARCH_TEGRA_238_SOC) || \
> >      IS_ENABLED(CONFIG_ARCH_TEGRA_264_SOC)
> > +#define TEGRA186_BPMP_SOC_COMMON					\
> > +	.channels = {							\
> > +		.cpu_tx = {						\
> > +			.offset = 3,					\
> > +			.timeout = 60 * USEC_PER_SEC,			\
> > +		},							\
> > +		.thread = {						\
> > +			.offset = 0,					\
> > +			.count = 3,					\
> > +			.timeout = 600 * USEC_PER_SEC,			\
> > +		},							\
> > +		.cpu_rx = {						\
> > +			.offset = 13,					\
> > +			.timeout = 0,					\
> > +		},							\
> > +	},								\
> > +	.ops = &tegra186_bpmp_ops,					\
> > +	.num_resets = 193
> > +
> >  static const struct tegra_bpmp_soc tegra186_soc = {
> > -	.channels = {
> > -		.cpu_tx = {
> > -			.offset = 3,
> > -			.timeout = 60 * USEC_PER_SEC,
> > -		},
> > -		.thread = {
> > -			.offset = 0,
> > -			.count = 3,
> > -			.timeout = 600 * USEC_PER_SEC,
> > -		},
> > -		.cpu_rx = {
> > -			.offset = 13,
> > -			.timeout = 0,
> > -		},
> > -	},
> > -	.ops = &tegra186_bpmp_ops,
> > -	.num_resets = 193,
> > +	TEGRA186_BPMP_SOC_COMMON,
> > +};
> > +
> > +static const struct tegra_bpmp_soc tegra234_soc = {
> > +	TEGRA186_BPMP_SOC_COMMON,
> > +};
> > +
> > +static const struct tegra_bpmp_soc tegra238_soc = {
> > +	TEGRA186_BPMP_SOC_COMMON,
> > +};
> > +
> > +static const struct tegra_bpmp_soc tegra264_soc = {
> > +	TEGRA186_BPMP_SOC_COMMON,
> >  };
> >  #endif
> >  
> > @@ -1180,8 +1196,12 @@ static const struct of_device_id tegra_bpmp_match[] = {
> >  #if IS_ENABLED(CONFIG_ARCH_TEGRA_186_SOC) || \
> >      IS_ENABLED(CONFIG_ARCH_TEGRA_194_SOC) || \
> >      IS_ENABLED(CONFIG_ARCH_TEGRA_234_SOC) || \
> > +    IS_ENABLED(CONFIG_ARCH_TEGRA_238_SOC) || \
> >      IS_ENABLED(CONFIG_ARCH_TEGRA_264_SOC)
> >  	{ .compatible = "nvidia,tegra186-bpmp", .data = &tegra186_soc },
> > +	{ .compatible = "nvidia,tegra234-bpmp", .data = &tegra234_soc },
> > +	{ .compatible = "nvidia,tegra238-bpmp", .data = &tegra238_soc },
> > +	{ .compatible = "nvidia,tegra264-bpmp", .data = &tegra264_soc },
> >  #endif
> >  #if IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC)
> >  	{ .compatible = "nvidia,tegra210-bpmp", .data = &tegra210_soc },
> > -- 
> > 2.43.0
> > 
> > 
>
>
>
>
