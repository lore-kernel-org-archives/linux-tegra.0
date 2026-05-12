Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010020.outbound.protection.outlook.com [52.101.46.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22463394EA0;
	Tue, 12 May 2026 13:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778593952; cv=fail; b=N01yEjzXF4xyN52HGbrtQCIj7Q4ZOnnKmVmjcbAys5D80twbiit0Ex7CmjjQTmGk9rbECbtt2DkjeqM7FD2bI0+KmtegkdYBTwySEt5BLRvDfuVh0vjHGAISA9IJ81HNN/++8MzX3eugFswWcxl+SZuyfhM8L8AmKyVOu76Ul14=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778593952; c=relaxed/simple;
	bh=5s+ZrN521/BUeYxZT1dQ0REnCk2ze+EYhn8BuPSDg+I=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WAZP4H3IKVvlGkwsWD/7NfpAnmTBuDHj4VYjOV+R8lyj50Vf3nRys8UEUqjd/XVkPf1zT1GdgEM9T+G6+TZ4oiwwBaKx6edoBGKX6W6b9I3yi6n5HMiEwiva/8yqhrv3lAmIgbLf3i4mlgrwJ6Ick+HJ/prRd1MuP5kR7FGkgg8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=eKmIrJVZ; arc=fail smtp.client-ip=52.101.46.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="eKmIrJVZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AXMY9x60oqeO6YTS2mUUtNvjyWxkEW7ZQFdb1RvbbvfvmJO4S/RFK/jfYWychREZCEpzFU1C3b6tayEVSvqMct5tppnq1Snlaoy8Xz40or/SR8c4hwhC/RdTgdEFqj3zeIx+R4RzRKiSAjOWY9meiEwFsBi0SjO3Trv6oni+tiIWB0wrd68TqAa+V8qMEa74snWXakySZw8N7dhEK/1QeDlKqt/Q+KRlolUGzIM9HgE2GG6ADH/yOSSOXsRZ8xq7nWo2/M62pfjMuF84E5dVv2pPKEtstDOu9CATprTWvViFvPX9MwZyVAr/+UBLiqz2kG6fH+jiJ79QjpJnjuknJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ffPuKSs764WvuYOKN9VnLHjHXoDcx2/2G9SjxMnuers=;
 b=GXtGgzbgjk581Ljp8FufVOgm0zzwG8RUh6A4/Z4GULBRjoB4TJlk8SpdudUgnKOPf0RzB8UPKesw+h4t5nYwjtauA+x6zvGkw2JMCZyWkPGio5OXB2k8kgdUnnqwMTBhDFodDPyIiU7OcwTXcb6bRnXxO8CCtwGX2XIaXRQr2vY6f912Jm1nzoqDTwkHpbrGgPECMIG5HF2MAI0/qMighQIua+7qvb/5I9KMKvEpp01THkePYqHnAhxRk+LUD2oHgfWDbgsihmIxa6atFTrtpgaUNXwPz7JnOrrnzwy651MKSNUMsmOTTEkb7L7I54kOOE7El/hMLB/WxOCD5NfWjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ffPuKSs764WvuYOKN9VnLHjHXoDcx2/2G9SjxMnuers=;
 b=eKmIrJVZuu0oRVOY4iARCpmPp42c4ZA19EcZvRnj27jDe5g1sjFxlM1fgYTdfSzRMcvRQUrE/lI78/4pFEWYhVoAzDnhH9xb/5GlCrdBm6c+JnvAi9kMMWrii3uxyXdATSCgW4ZqbnXB0Xcj+kPYOhyWo3uVBvfZ3dTaX4OGBCmgVcVbXhGKj0gv/SXUr0+qF8DFkF+MSe8+q36vDhKk6SdVet9WpuxQ1UxBK87ol9CB8XtelUg2Zaes8RK72SRVaUqb1AOpM5gVVbl0eypg41yv3aexsiLxaK7CZl3QQ3xRPUX0MLQAdhhd/p9OGVO6rkFtjlKc/rGatgPhI1zNyg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by SJ2PR12MB8829.namprd12.prod.outlook.com (2603:10b6:a03:4d0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.21; Tue, 12 May
 2026 13:52:24 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%6]) with mapi id 15.20.9913.009; Tue, 12 May 2026
 13:52:24 +0000
Message-ID: <4b80c7c5-c499-4a64-bba2-c5a1ffe48780@nvidia.com>
Date: Tue, 12 May 2026 14:52:19 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] i2c: tegra: Improve DMA mapping, latency, and power
 management
To: Akhil R <akhilrajeev@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>,
 Dmitry Osipenko <digetx@gmail.com>, Andi Shyti <andi.shyti@kernel.org>,
 Thierry Reding <thierry.reding@kernel.org>,
 Kartik Rajput <kkartik@nvidia.com>, Wolfram Sang <wsa@kernel.org>,
 linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: mochs@nvidia.com
References: <20260505105928.38457-1-akhilrajeev@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20260505105928.38457-1-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P191CA0048.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:55::23) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|SJ2PR12MB8829:EE_
X-MS-Office365-Filtering-Correlation-Id: eb785a3a-742a-482a-2bf9-08deb02db22c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|921020|11063799003|3023799003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ZjDCPnYBQEktQsfqLSerdMqCE4X+ZGDI9PfIVPKpPVjLpwfVfnTPTifdJkuGvLRXpcYvDwKwQRUxLCeg/ule5e50c4feMF0CBMni2lIgPqx1pmM4IZGyt2iOp0vCt+Kva2jEmiaXWQFfGPhxPK0+Rj8gnIO7pDXceHhS1Qhu/U+ApTcRuejWhMJlg+2HBNJW1QkyAK9ri9nRNwTSwwpNGB8NRADVeo8Gf8hRh/KqPLn8XHkF4mx5PgXhzFyRu+cPC0MYwL2RYrCTbNUUhrlF/5oMRA1PDG5dMYyDhz7PsWeiQ8AoSIFf4qXizGLHlMjTx2We4TdinDDT4x0Jjak6F8bOpsmpw3TEhlLbxls9QtDItDOMnc+N3/cmBruZW0eV3pkUFhU/5elNLsptt6yuygZlV0Fxx8F59358vgh3EE34z+O9A+idXkryeNo8jUTQmlcodxJR7FbegWOrPYE0vvY7ZGAMDblVDI39iIxt0HnL2C/w1b65k20k6p1AVP0Oylnm7YqOoCLi0kEngtIfsldR7k0cyU05dqxB6PjuymEpbePB1jFhYF7h3r3IpiE7AOuaDwdgRqutQ83BkPU8AF3weL8BoEeOQbwrv/fVAjuMCVcKOb/eg+VC2WiUiA5YbENxNWSjleovRM+VaI00dXqRai34BMLsWxY2J9TSA3KB3WQ70bepuZdWNS/nJbh6WxQjaOfvinZnFgqnQ/I7CwSu5bS/j3VMK1yg+o7fsXY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(921020)(11063799003)(3023799003)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aUhEQWR3SGovMHBMVnpNUTdxRCtGb2NtV21xSEFMaDNyOXFLaThYcmU3OXZa?=
 =?utf-8?B?SUl2cFA2OEhnSkJ5ZHY2anhnUXM2WVBMTjhnY09QZWZWWFAzbEZyU1VtRjhL?=
 =?utf-8?B?M1RxOE9oK2ltWlhMc2xiS3hLRGdrSEkrU05SNGRieEttZ0hIWnp3RTlxUklM?=
 =?utf-8?B?TGxCU0xmWGlJSVdveFdKNFJOT01ZRThSVjJZdVRhZFcrTVVOODZIbkJVVDZH?=
 =?utf-8?B?MEY2SStiUm4xOU5SK0o4V1BaM1R5RmZqUGZ4em1CejZ0VWtaZTdua1R0K0Vp?=
 =?utf-8?B?eEpiLytGY1VnS0grQkE2QkQ3ZzVPWEVTT1V3dnlXSTFjYWdhR0dWN0NWVGJG?=
 =?utf-8?B?MEIzalMxOVJwc2d2cVF2RnVWL0dNMzZML0FEeU1JcEY1OGpRL3A4VDAwNkZT?=
 =?utf-8?B?R3lKU2Z5bjNYM2x5M2tBalZQMlpQa3FicDB5Z0lrc0pyak5vUjhtS3d4cnZQ?=
 =?utf-8?B?YW54VW9SK29uZnowZ0prcXo2TkVFRGgwWmdzb0cyV0NIMzNwNXgrU0Foby9Q?=
 =?utf-8?B?SmVNRUtMcW5RbitVZkpCM1dRMmxpVUc0UE41Q0FickFidXFSdnFYNjJSR21X?=
 =?utf-8?B?NHl4WTZDRkpnbGg4eStMY2VEZFBGNFlxeWl0RGtDTWFpTmNlVHllUTE1bDJo?=
 =?utf-8?B?M2pSWWhUeVNFQ0JxSCtmeituemV2WTFXMGh5ajZVc3E3dDl4SkZQNjNiWEND?=
 =?utf-8?B?RjJoNHVzZVlPR1RZUzByOGgwTTJvTjVCb2c5UVI1TmkzQXB3Y0RPTzRKRGR3?=
 =?utf-8?B?cVV6TENuVkovdzJUbGd5UzN5b1hWbFAxaHAxc2RZUmdaL0pDN0VNV25lMTdS?=
 =?utf-8?B?RzVjdzNxYUVUVVRSTmh6aU5vcHJYRTVMdExWZERRS01SWDQ3T3ZVdWthM05s?=
 =?utf-8?B?ZHdOV2pyd0JvM2xxaWFRM0RvUEVPWjdRZ2g0ZjNXcWYrVUswZzJzZ3FTSVZL?=
 =?utf-8?B?aEs4ckVtaEpodldCd2I3b3c1aEF6K1g4YURoT1U5dC85UDhnNHB3cDBnZ01x?=
 =?utf-8?B?UTI0K3Z2YlFrMXliR21ncFhlR3Zvd25jam11MGJoQXNhbEt0QWFGZFV5UUNP?=
 =?utf-8?B?T1A4NkVCK205YXZldThDM2s0Z0Q4N2hYRC9nNUdsaWxjbXVMc3ZjZ1pqNVRj?=
 =?utf-8?B?VGs5NWtQbzBHRnlqalVNRTR4QWxlR04rN215Z2xnbE9LV2VCNkNyamt1bzdo?=
 =?utf-8?B?c1E0U3RqNVdyZ2xMQk1vTWxJbkNuM2VmL0k4WnRJVFRYOUxIbzhyZkh2alJp?=
 =?utf-8?B?OWFBWkNKcmpuVENwRUpTQTJ4anFsR3hKQnYwZjNCWFkwdFFZU2orUjlZbmsx?=
 =?utf-8?B?TktUQjhDL0l1ZG10VDRhUWZxTWx1Yzh2ajl4WHBYMHlteDlOSDJrcUFTTXVv?=
 =?utf-8?B?bmV0aHNZTExNZUxmUEhGb21XWXI4dE85ZjRYc0tJWVVDbkJDV2hjYStNWlBx?=
 =?utf-8?B?UXlrK3pzUUlLRS94YjN0QjROZVlpNmN4SlExSGlKMEhzUTdscWdKeWtYNUUv?=
 =?utf-8?B?d2NRTEVXRDlaZVBqWWxuemt6b3J1eksvc1pUVVBBcTh3UTVGZ3FxLzM4NWRJ?=
 =?utf-8?B?dFRTSVFNNHluY3ljY0NpUC9vOEtHSHZlSEdkVFNabStGMGYya1YrTTVuL2NG?=
 =?utf-8?B?a3M0bk05SE5DYW1ESmRYNjd1M3pPWmJOVmVEMkdkaHBpbzVyQUhjTFRIZUU1?=
 =?utf-8?B?Y3FvbE00b205Slo3UkxuUXV5aTBOMlNJcEJlRkF2TVNiOWxUd2JDenFWZXNQ?=
 =?utf-8?B?T1p4YmdwNlFVU2hEaFBhd1ROZHQvN2ZHdHVWQVJxbHZzMlQ0Smoxam1wZTZF?=
 =?utf-8?B?eTlrVTJrZzZBdy8rODdubVFlZkFSOWMyUEw3eHVHUVB6WlNSMFdob2dYU1JR?=
 =?utf-8?B?VWhtM2V5VUxhMENUd1JWa2N0d01oeTlMbWVQWXFuYldpNW5YcDBjWFJwRk4z?=
 =?utf-8?B?RWsyM0dBWm5CeEMxWXZ6NVptL1drV1liTko3dCtGWUZBL2dPZFRsSHJOOFg1?=
 =?utf-8?B?SUxRZ1p3QXNXd1dRc1JEdUp3NFZRZlN0dHlUeWMycUNXQWtuWFg3ZEpScStW?=
 =?utf-8?B?QzhydUNOUVYvSlNmYjBFclR1K1pkYVowOCsxMUhseFl3dks5engxQWpoaWhI?=
 =?utf-8?B?UnQ1UUQ3RktxcUFPUm9LSDB0ZFE3bDNyeE9nM1hBQjFRZVNUbTU0eEhjeGxR?=
 =?utf-8?B?K2drSWRjZVVLZm5TRFVJYlBia0Y4U3ovTXNoaG16YUZyK1VOcDZ4MGRBRUZ6?=
 =?utf-8?B?RVBFdXE0ODMwTUJVWEFRZ1VvalMvSlVldGFGdk9EcjBKRi9iVTFTWHBERWJw?=
 =?utf-8?B?ZjJSaE4ybUlvZ3laVDM2elIvU3U3RS9jZjRkU0JTOG1lMXRvRkh0UT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb785a3a-742a-482a-2bf9-08deb02db22c
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 13:52:24.3727
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XEkpjb2/2Fj0mnbBHPlbSwSi1z+L8/WKd42jkPNL+ERpG4+Xx+xgH0ztNCkpSBJre9jYe88wUJrmigCnKIV59A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8829


On 05/05/2026 11:59, Akhil R wrote:
> This series addresses several aspects of the Tegra I2C driver:
> 
> - DMA mapping: Use the proper DMA device for buffer allocation to
>    ensure correct DMA address translation.
> - Transfer latency: Disable fair arbitration on non-MCTP buses to
>    reduce transfer latency.
> - Timing parameters: Update I2C timing values for Tegra410.
> - Power management: Keep the controller available during noirq
>    suspend/resume phases for system dependencies.
> 
> Akhil R (4):
>    i2c: tegra: use dmaengine_get_dma_device() for DMA buffer allocation
>    i2c: tegra: Disable fair arbitration for non-MCTP buses
>    i2c: tegra: Update Tegra410 I2C timing parameters
>    i2c: tegra: Fix NOIRQ suspend/resume
> 
>   drivers/i2c/busses/i2c-tegra.c | 86 +++++++++++++++++++++++-----------
>   1 file changed, 58 insertions(+), 28 deletions(-)
> 

For the series ...

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Thanks!
Jon

-- 
nvpublic

