Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.4
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795695453;
	b=S3DD3qsMeFhm9vrzVsxuCxwE/vOpFaywsUXo0u7URaXXymLRzvc4XQiHlVllodnw4XUo
	 nE6IcmSrKfrwRMDt3tzB7QP1D9pF4/CxffcVe+fcJe3I9C6FyAz4e8vgDyb1/Yot9WfpK
	 jEAcr47JXHgHtwA0Ihnm1yPqaKfJA2yH0ty1br/FCNVt60syf0RnqPKiP2F2YVjuOTmvp
	 pbpYGhwxYwQn7UTqRYbFtn1NuDvjdAq7TMEUI+Cl27kNZEIJOjIelApOd29uWjBnJeEFH
	 z+E9rTEamZHyGNHkXhaljGK3GrJtIkzloB7gHODhTojMnsTGOdkrYmhNluO6H2uYQ7w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795695453;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-NV-OnPremToCloud:X-EOPAttributedMessage:
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
	bh=w7eSzjpTKQFDCmuWeIBwU9zmiCbnB+dwFTX97Ek/2hU=;
	b=WwFDt3cKR2nn0EjP3jKhnOfVTlRORXtR6MR/G2HftbrCtzY9K38ll5L5agIQ8P635fT8
	 tfmEzsLhMYATxSJK1bKkX3H+KJrcSTvPGPk3bwuvAEv1B3OJtKUr0ZdOb8rEPfeRezreX
	 M68CUVo4QZuFnzqhgnoQGI31O0KyQj2X7f+Izvnd5iI6jACiDolwpB2UOfnHXksC3ONNl
	 iLnuulO2AqGY6+YOWbE5t4gQq3Fhcn4LOsAyEKxb4rrCDNqvquVAIllKjyF2Wg8WWp+re
	 OmTCST3ApvFFvJxzlUDb5dBjs1nlwjtKlys2nnk3SFXMzkcG9gfAzktpH/UgoDyCSwg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=imNfXQ4X;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.4
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012004.outbound.protection.outlook.com [52.101.43.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B7F606A685;
	Thu, 26 Nov 2026 12:17:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38B7F606A685
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=imNfXQ4X
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ay5aPQ8E+jlFCQSBagCknooz6bxLRT2EvLY2O5fiBgmnQzmpnhZ+E/5P8EH8fg1IKvYAQIgI9Rv2aSx67+u2S+Islm5nBOmGWh1WIXv7y9vMtnZXSqMN8H5KfV+NN1TP6+n6lY9npj942lmszXngwOtsl8vGxit/s++Z633PnmU7fjNXQ7C031CwkznXJJ3AAD5mxkjACN3J6J0xPiwxFhq5iYUSgcFFmKbhRxjahxc4UXYXD1AhYc9X6zrtI7oIDZThIycaShx1TD53u5Tg9LUpDBgUcPhA0LcwePpTysOcJp0mxbc9OhAzqL8FNCfNMuZNX+zSarCH7NPWd5hdmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w7eSzjpTKQFDCmuWeIBwU9zmiCbnB+dwFTX97Ek/2hU=;
 b=UrA8QQlzEF8ylwWgu6sy9l6r/pFHU3uVn6A/fJ4LCgkwbqI8v8l9Y65yB9rOuJn9Z1WbVZGAUFUCkTHfHj0H8fHz3ubIAoGPEzy0BmZnzkp9gG0vR+OgTTRJ09RLLr5VAR+mSBY9cLg3Zimb5dlnbGwV3FatXR7HylIbT8xHTPGVzUctTG1SnJNUJjR/HCtdvHyMhL/VF1n7oGJMBzYyb8ZMdLtSkv8T6wVYCbzxoZ5vVov/81+OiUlVvMQTRas1xP3PZJrv+asaoNfnavkqVT+crP3F7ns1+PN1nBZJSsHHHP+I8IT6v+JMLKqrkze9TnoeFbythQCqpcsD+7RUPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=linux.alibaba.com
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w7eSzjpTKQFDCmuWeIBwU9zmiCbnB+dwFTX97Ek/2hU=;
 b=imNfXQ4X5hP+g1wjQXTmlLHCKUN9P3bKFAxGjJz12WS0nmvuttnGPnTIHrdFVLwZDYllNkhgQ3PAXsGEEQn5InRW+xwXHsUpaCdM1zpyvDKHFs/IphgAh94tY+RWdAkvlDsalEdNe+WzQcX59HskeVZgGFWeNR34w5h/whWtwSYZM7wL9/+CkzQOSsPA244Qi6s8T1f/Imp2DyB+IPekIx/sML+rtYzHWVWzRAH9LzZKJfIHEXr3O+hjs4FEFpi7HAc4WpAUhJiYgWAMf0bK/dsHuF+cCiQZmiUw2Rlw2GDg5s9JnYb2xtmv1lOylToSLwEnK/vsFZpOEMZBlxRwHg==
Received: from CH0PR04CA0102.namprd04.prod.outlook.com (2603:10b6:610:75::17)
 by DM6PR12MB4315.namprd12.prod.outlook.com (2603:10b6:5:223::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 12:17:29 +0000
Received: from DM3PEPF000265C5.namprd03.prod.outlook.com
 (2603:10b6:610:75:cafe::3) by CH0PR04CA0102.outlook.office365.com
 (2603:10b6:610:75::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Thu, 26
 Nov 2026 12:17:29 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.118.232) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 DM3PEPF000265C5.mail.protection.outlook.com (10.167.23.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.688.5 via Frontend Transport; Thu, 26 Nov 2026 12:17:29 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 26 Nov
 2026 04:17:18 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 04:17:17 -0800
Received: from build-akhilrajeev-noble-20260927.internal (10.127.8.11) by
 mail.nvidia.com (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Thu, 26 Nov 2026 04:17:14 -0800
From: Akhil R <akhilrajeev@nvidia.com>
To: <jiangtianfeng@linux.alibaba.com>
CC: <akhilrajeev@nvidia.com>, <andi.shyti@kernel.org>, <digetx@gmail.com>,
	<jonathanh@nvidia.com>, <kkartik@nvidia.com>, <ldewangan@nvidia.com>,
	<linux-i2c@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<thierry.reding@gmail.com>, <thierry.reding@kernel.org>
Subject: Re: [PATCH] i2c: tegra: Fix HS mode clock calculations
Date: Thu, 26 Nov 2026 12:17:13 +0000
Message-ID: <20261126121713.57082-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261126112445.3761174-1-jiangtianfeng@linux.alibaba.com>
References: <20261126112445.3761174-1-jiangtianfeng@linux.alibaba.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PEPF000265C5:EE_|DM6PR12MB4315:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e9ae6a5-8e3d-4056-611d-08df4bb73d76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|23010399003|18002099003|22082099003|11063799006|56012099006|261026121527099003|261102123227099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	rgPRDWnEnGaea5e14NjoEvXOMRLESNMoQn9/6PuetgH4V2tYNRiowXNcYnftD3sOJ6zQFgQipxtYh4e8QmSMd/pZ6BG1rzcA3isTP+0OmXhHM4A86MWCZJAW9noo4rwuj/KXIzLA/e7lGwELGZBKg4iwsIcWMdaBGNcz3nFXR6YnwYAUGJcfM3GJSFalJbCrdg5vQ00mSTTidMNVMpi036GJTRCpT2N0n9DxEZM2Ogm+jEisBmecO/rkE5ihRo+vS8JXzJq1m210pEwlJrejAUXlOq3q/0hUSLXEZnJvg22Gy54Am/ABs1txS9CwPiEzXPdtxtB3dYR0Hy85SryBPKMxINQ6MhUP4otEwMFEa6LErqpzoOvgk/EHRUb+ikdxHGNpPrwukmQq3g1RsTBc8+QZ0M6YGLfd5eKB9oFiHQ+U63p+rQ6SHN2SPYEwBK4JcSCRRVzUFwT+00dQ6/Lg0yHRNCUlLcr3Svdt53novgysduw86qZfiwZhi0Aj4Lp5rp6zdvvSFEIYjGiFxF4dVsmFHDIF43aYRWMUMwXhpcz9G2A2zSBmJrSuw3sJjObTo9cnjse0YgOTJmdcqcE6GRV29F2HPeRsPtLripkaqkO4kZhzGjPVeZRhZ2O9ZLjET775AHwmrVKvzwNAwTLBCEhS+AZe4kPyelK3DPP6m2y+WPSSCWPSDt7QrP05ciEqo7KcaO3Vtp4Ps9KxwU6F7w==
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(23010399003)(18002099003)(22082099003)(11063799006)(56012099006)(261026121527099003)(261102123227099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2dZ8qorSLGhnhIlQz0Nr28nMor3nWQng3NUNxdTWp6ZlbTrxrpOoc4vi52RUi/SyjaqD7+RHYlgzSMFgW54YT/2527gw3Q6ofluUE/HBTwkhOQAgePUxTg/0eGbAwnWxVdivbnMWfQhNQWTUt1FQ9Y8gGG2o6c+sfpPvTMjLZyJ8LyeexKfp6arcDH+1jn1u8e5wKr+RzQqkCY6jeKspPN26WudAqkAOuvqheXk3mbFBPWRYshVkJ4NWJHgtE+9ZKytYMn9w6pWkDun5LxMWejlP5tzUHuaFkCneX4k7uYDYA+yviKVE2OSMxsURm/e3fCuaRBc00oGJ9DH8k4GC+ewMGGT0oLkPDjBWEbkC9qUGGdl5Si2q0ZqSl053tLLLkt85rKldnyJyXuPwpGk02pDHdAVXN2BNpgZpx13jCSZFLXzSIqb/BKRKHiPgQerr
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 12:17:29.0861
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e9ae6a5-8e3d-4056-611d-08df4bb73d76
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM3PEPF000265C5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4315

On Thu, 26 Nov 2026 19:24:41 +0800, Jiangtian Feng wrote:
> Hi Akhil,
> 
> Thanks, this version addresses both the non-HS timing overwrite and
> the HS timing/divisor selection.
> 
> You are right that my 457.7/412.1 kHz figures were calculated from the
> requested clk_rate, not from the post-rounding clk_get_rate(), so they
> do not by themselves prove that the calibrated divisors need changing.
> 
> Could you share the intended post-clk_set_rate div-clk rates, or the
> relevant firmware rounding/table entries, for Tegra256 and Tegra264 at
> a 3.4 MHz request? With the default Fast divisors, the master code
> stays at or below 400 kHz if the actual rates are at most 208 MHz and
> 52.8 MHz, respectively.

For Tegra264, with PLLP_OUT0 at 202.5 MHz and clock divisor 3, the actual
controller clock is 50.625 MHz, giving a master-code frequency of approx.
383.5 kHz. Tegra256 uses a fixed-clock of 208 MHz.

> 
> If that is the case, I agree that we should leave non_hs_mode unchanged
> and I will drop the cap in favor of your smaller change. If the actual
> rates are higher, we can treat the master-code issue separately using
> the actual clock rate.
> 

Best Regards,
Akhil R
