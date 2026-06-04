Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013005.outbound.protection.outlook.com [40.93.201.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC2739B964;
	Thu,  4 Jun 2026 08:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780563127; cv=fail; b=rfIdEI1RBcHs9gw0hyC48ePFCMm1DiRF0xbGaKpoP/T4CT/9hJVNbmzmwa2T8ar/X5HzzANGjA7ypPgf1Q+R6yKfSXfyDfazWRIS2A7ZclVetO9RWKJoagDVaY0gFyPnPxjk1QBl+gjWkVv3O9zyDuF6/x+idNjrVfxcbucpjNw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780563127; c=relaxed/simple;
	bh=sKpzzQcy52PcrBnPSWLxaJvYXHURLZR7d4xcKZZkpQo=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Sh8jh9QMjyNW+K5IfFtuHlrTW9NxMFhag7XxGOrM0anUnTQl7j7H82pq7o9L07CIx/NRfIjKDeoJWLVO2cn0MKl+3IYBz/AScxPEdSBi099EW2Tr8G4EUuxEmPYa5feB3wflv5iJh0d+VF9bukrs2zrX6UEBAVLaWDDo/6fIagU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hdLovEcr; arc=fail smtp.client-ip=40.93.201.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hdLovEcr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hb6BYjBjtmkUXlIJWa/FWMf7MQsJHaJe+oSIVGjkVikGYh5aG6pYCuVoCXSpAo98uUbngRDcmYMPwA40/6aylHYlexxBtHyBuZMaRAVHxYmKLyPvv6jDGYiYRi24VNAaUfv/84xQG8fsBwe8v3tmnGxp/axECoPQEJQlsBSSFyFv1YdK4gZ+h4boHLHJhbt0PJkm5uCZCK/f2D29yfCMUzwxnYymMdBMwDnaf84tCK1UUSIU+Ww3E5CqCxJaenN0s42nKPxMtzC5DatR4ipdJWEJNjH56O8qy3S6hHWdCOEmiR0Kgfobryn883mqdMbpMvY/M9D/GM2pakL6uBOaBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WEwLjU/mz6Dm3j5HKHzmaJe02yWst1sNREaYkejJ/wE=;
 b=MtBPbVCDAL4ahqz9aiVjvK4wZ4iU2kNLqysOV+KpU0h2EtW6Nresj6AODK7C7JsZIx+7AucjLg8YZljZWb72aoeZ5vywifkMpiCW1T8SdNXhgRo3JcDlhME1Gm9WNKo9MRSQjSuzJuVLf7ps8XI/VGIUyd+xzFCRPJszmXny6c8mr6ce2KGG8+cAI0QcRYAxHGhBlSbNjkJtwKqjLfsqTjbm1RK5qeF7zFZtNvLzhrQHuxDbvweEfnInCsU48cDLb9uMl/0zOTe1otiBGr0Epbhtz9HsdWpTOsv1S2IztYOHQdkARL1SrFi5ZhVCHYt3ZeZU4nb0pWl8OCS7X/Tbxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WEwLjU/mz6Dm3j5HKHzmaJe02yWst1sNREaYkejJ/wE=;
 b=hdLovEcru9Vyk0w43YpifAcea2wAp/cqhfy2kzpWoBK/weBw8+82tFSUKA/rvLiB/hh1wwM7NDCeLYncSPikJqeYSJqyd3PPYU2+n/nJLw/6NbbudRlEjiLCgJbe8dI3HKUnsS7r1rpdg++e3gjstX4FjKE6avkQXZbcbmMfZz5+5c6y07SFfJzmt9hqChmDBNqHvICskc/IoSRlURrtQGvFw30jWmCmF8dMcenolI0hA9/3n38v6uTxu43JANKnN1RaQOZCoNJUSCN9cDgJ62m0qnc3O/OEYMlNbraDaz7HcCxBl474iqGtY3H/jckYWPyYkghhsaFoVC4P7JoL6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by SJ0PR12MB6991.namprd12.prod.outlook.com (2603:10b6:a03:47c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 08:52:01 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%6]) with mapi id 15.21.0092.007; Thu, 4 Jun 2026
 08:52:01 +0000
Message-ID: <f2e926e1-9cfb-4d59-b525-2d9590745fc5@nvidia.com>
Date: Thu, 4 Jun 2026 09:51:56 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] i2c: tegra: Improve DMA mapping, latency, and
 power management
To: Akhil R <akhilrajeev@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>,
 Dmitry Osipenko <digetx@gmail.com>, Andi Shyti <andi.shyti@kernel.org>,
 Thierry Reding <thierry.reding@kernel.org>,
 Kartik Rajput <kkartik@nvidia.com>, Wolfram Sang <wsa@kernel.org>,
 linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260518114013.62065-1-akhilrajeev@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20260518114013.62065-1-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0391.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cf::15) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|SJ0PR12MB6991:EE_
X-MS-Office365-Filtering-Correlation-Id: 47a964ee-cc49-4094-51ca-08dec2168b36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|921020|56012099006|11063799006|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	MlkyytWuljq7gdGxUTYTkDzqugfflP0TWsqX1pDMsyGy6XeEJnQol8Q0f2H1jQJUBA+3DqFm1HMbMSQbipHHJ8tLNrY7yaP1FCGPnICUZ909Ig72Xo68yUJjlaQVhGDk77C2iEN5PuSOHprVIctvKQy4UwO978+wSf/PqpSy7PInk7SiSdCJwL3HxBw3dI/1jIYSQl2gzQNCXO2UHaV32ZY0rXTIefKspGYyycKRX9RNLapSIJcNDhu2eEiyVjXi+o26aQcFvj4ofakphnFWwV496wzMATs+ixYN1BXveCgMXT6gcENYe3cJK9LlAY0q3p2zyIL1U9KtWlMOZmLW3A1CEuy08AP51serNjHMScVrTlmXdMxlVjzIzLKkl+X8GHQDIQu8XkG396upkSSb6phNMTkeD124J3omCRyOUJ+i4WovF8iGX8bl6nE9x53asQcMcUFN6QIVLxxauKGwGlOw1tmURpdWmk8Tv1vmd/Mdwayd5cfm+km1XGjlPKdlNOyDgZlrcYiyhcJGS/t1G5/uKDYI3IyT6zGMoPeEO4ArOtRpDrvNsDbIWSUGBZgxWmVjEcd0E+S2MEeNxpsjDne67w5jTLwlsj4j9DlT8gKO/4Z5uJwkMD0dX3OxuTxvLFIU34D1sUa7HsTdSGYrxob3Ewlc3rR27pw01/3/XyPyu06N1+kkdN/Hld962hgk1DsNIPCksJuS5RQOVoU9BeFyMKS36bZmDCohemL/DDk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(921020)(56012099006)(11063799006)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a3p5V2czYWZvdTlyQXdPREh6bCtMSGxxTXRLWkYyUEV5aHVQYndDeVU0ZlBi?=
 =?utf-8?B?M0MwczFhNGxVVFlQZ2xSU3ptUnA0QXJmdWU0bzJCczdaU2lzRk1xV3pJbjhZ?=
 =?utf-8?B?NU9WOTFzYnpHYXRkVGxWV1lmUSsxOEJId0RKcGpBOUg1NW91U01wSVc4WkdW?=
 =?utf-8?B?Q0w3enRxbkxicVU1MC9jSEJhRVdDbUViemVqRXNJL3RKMVpXRHU4eWNjRWFs?=
 =?utf-8?B?RDRMMFFkMlFHay9RQjhOSmtmUis5UWxDZ0F5MGlEUW9xUXJoZjYzUEFYcGxE?=
 =?utf-8?B?ekRlQUdSOUtjV2dBNmVOUS9CK1AxQU1HOXEzeVZEK1U5U3JFN05paTBNRGJp?=
 =?utf-8?B?d1FObW9XZi9pbE9hNW1YVHZ2NWt5YzRaRzZSZ0FVYktQYnltMy9NMm9qNmJ1?=
 =?utf-8?B?ZTJtNUVKeUhEYlc1ZEJjZDF2bWxGZEpXK0pBRjNkSTBjdW9lR0VqVnBta3dx?=
 =?utf-8?B?UnM2dEhNZUhXQ3p5TDREbUV4aGNHQnRydGNTZUVXeDU3QjIvM3JISDFSK3dq?=
 =?utf-8?B?MndXYm1tbWwvNmI5TkExMjA0Z1VTOGl3MmVDUDhGYjRCd1hqWTZObksyR1pn?=
 =?utf-8?B?UFN0SEMrOFJDczhtNXcwVkdNRmpFUUhvZDNZY2Z1b1orVkRhQWwwNndzU2p6?=
 =?utf-8?B?N0hvSVdBZXZKL0Y0b2hKUTg3T2p6YW85TXhFTjJkQjM0OU01Q3NubXBGcWdN?=
 =?utf-8?B?R0lzZTFGSWg4NmsxWVcwa0d4MDB1Um54SStvNjU4UzJhK1lHa0RacmM3cXNJ?=
 =?utf-8?B?OVhyTGUvQndET09EY3RzaWtUUnl5VTBQR0dTLytIUVF4aDRmcHM0YkhqQXJo?=
 =?utf-8?B?ckpIcE52NHRiU3VuNjVIU2J2L3FOa1BsR1hLTExmQ2JaeVpCNlRJWjBvVVhq?=
 =?utf-8?B?Rzk5VHBxY2lySitWcHhmYkpEajVNTXJEL0QvY09WV2U5ekdFY3J0MGp4NlVm?=
 =?utf-8?B?WUtEL3JqazFoamxmR1FDNllLOXRqaHpIVHlkS0Q5UWxvR0tnTURqZE51YWxs?=
 =?utf-8?B?WFV4SnI0L0xPbTVvNnlxTDFLdHJPQjdoNVJHbVl4QW5ITVYzRVUyL2VuUnNC?=
 =?utf-8?B?OWIzM1BlYUluUXA1WkdpOWtaSUF2OE1NVjZWaGVBSnZRajBFNW5DY2I1UUNH?=
 =?utf-8?B?UHFFTmtrOGJGM2l4b2lwVWFsQ29Ya3ordVNoK0pvdjkwd29JNWtKQXpMSUpN?=
 =?utf-8?B?ejJBZ2JQWDJzVmpEVmdiZ2QvZE1VQkJ6NTJtMDFRamJSNmJJS251dlUydGJj?=
 =?utf-8?B?Wk9RRGx6UUFhdWZPRUM5alNTN0dZZG5tMXBZdEUzUUozdHV3RFpMb29sOWt2?=
 =?utf-8?B?VnlVR1hMV1BxL1dvV3NhajZ4RVJMQkY0K2duRXVZNnZoeWlBNVQzaUh3enJB?=
 =?utf-8?B?bWtyTFZxRnZIZ2hITzhqRm5wQkhlcEtXb3lKQUhKNTczck5wWUlja3pxL05F?=
 =?utf-8?B?WXZiT2RGUGFYYWVRdmFZS3NONVN4L1Mya2ZRZU4xK3kwVGh3TEtsZ1ZuSm1m?=
 =?utf-8?B?eDNnWnF2MUpVdmdoMnFMdlUzN0dhbWR6Q0NWUlR5Zm9WT2tkWHNlV1pFZmhv?=
 =?utf-8?B?bTlZbWFHVWoyUGplNGNrWlozQUtXVWNvOHBITDhGbVRFUExTaFVoa21SajEy?=
 =?utf-8?B?WnlaRkZKV2puOHpnV0pVeW1vS251SVdGMmVFSmsrMzg3NDFldkF4R0ZSckdC?=
 =?utf-8?B?WHBva0gxUmFjeUtOUC9RMFVrWkEvVktOUnpzV1hJZGp6bFRpRmhXWWQ4ZHZV?=
 =?utf-8?B?ZnNwNysrY3lXbGRIeDl5Qi9uVVVXVjhiNnNwQWNRQnVOMUdqMDF5MVFzQnVu?=
 =?utf-8?B?NENhZU1IdGlhYlI5dkhlVGNrRko0d3ZKSXhnRHNwK1hVSElTRHAwZEdPRlQx?=
 =?utf-8?B?dDRtVkFXaGRyT0tqWUpUL0QrTi9qQ0pyS2Z5N2Z3T2gzMHd1OW1qcE1zUmFk?=
 =?utf-8?B?U2V3N1RIVHArT2xEUURHeVF0LzIzRW1EMnVpdnpaWUkyUzdqbWJEOVpLVWNH?=
 =?utf-8?B?N3RnRk1acnc2VndRUnJQOXRWamVaa1NENUJFVC9IOUxpRlpBVW94RksxMC9p?=
 =?utf-8?B?T2psL3hUdFk5MHlIcUJBaHRhK3FzUEJKZ3k1TGJUMk1vQVpuYXBSZXVTVWJE?=
 =?utf-8?B?UGhQZ0dWZWFtQTZPL25LMWpPR3lrMDRFTGhJTWliT0pGa1drcUFjS1d5VlRy?=
 =?utf-8?B?UHJxZjVwbE94OU9yM3VydFRsUTQrc0VCYmM2dGV0ajhmTXMxbFpnYWlGdUtR?=
 =?utf-8?B?RUJKU20vZzdDSEhObWRzK0twdHJ3L1FxNVVtY2VYbTI4eXJVOWJuT0paRjBm?=
 =?utf-8?B?Mk52OVg2bUIzQjBYTmtKcnhEWEw4eDVqdjJOaU9QWFh0QzBNQzJvQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47a964ee-cc49-4094-51ca-08dec2168b36
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 08:52:01.4637
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yuFm54oYvtHIEfQVRvTHvFaq29o1RhRgQp8UYhbRG6pk1mQhOyBQpKQfXjrvE0bzB4GNSfTAbxdmADA/wkwjZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6991

Hi Wolfram, Andi,

On 18/05/2026 12:40, Akhil R wrote:
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
> v1->v2:
>    * Add description for is_mctp in the struct
> 
> Akhil R (4):
>    i2c: tegra: use dmaengine_get_dma_device() for DMA buffer allocation
>    i2c: tegra: Disable fair arbitration for non-MCTP buses
>    i2c: tegra: Update Tegra410 I2C timing parameters
>    i2c: tegra: Fix NOIRQ suspend/resume
> 
>   drivers/i2c/busses/i2c-tegra.c | 87 +++++++++++++++++++++++-----------
>   1 file changed, 59 insertions(+), 28 deletions(-)
> 

Are you OK with these changes? If so we would like to get these into -next.

Thanks!

Jon

-- 
nvpublic

