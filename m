Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2056.outbound.protection.outlook.com [40.107.237.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D385B20B38
	for <linux-tegra@vger.kernel.org>; Wed, 17 Jan 2024 14:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705503404; cv=fail; b=FZs0N1UZ10d5nJaDsXSKewLsctBTmeqllRiB4ChSlD9LzSiCat9MsDr1FXc/tzTjrPHr6j0Xqv3Z8udvT/tz2zeUVGDhsMxe6wgRqs7tK1uvFZ1AHU3r0Zs6eTLe58UzzmUdYtwJCDmQ+I5fCuFDxueh5DErLErC6ZgqdBBRKW0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705503404; c=relaxed/simple;
	bh=5QNNtHctlzhrB+Q911i0tDxRnYRpF5nAAOE74Xr0Vh8=;
	h=ARC-Message-Signature:ARC-Authentication-Results:DKIM-Signature:
	 Received:Received:Message-ID:Date:User-Agent:Subject:
	 Content-Language:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped; b=K5rB7OadckZP+jDN/GnrPrbQ7+gLE9u5//vVmdr7K9H3s94bn1OgxTpQIApoz7Lt/GieCRuIYqse54kbhDSq3A6tC+efJmT0m16tS50+7YsTU0Vr7hFczhDXPVc4IYX32uWVnlXogEtMclZ+a3e3hbA91JC6CmRlYLJR3gCZYqE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=oUVJz8MP; arc=fail smtp.client-ip=40.107.237.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="oUVJz8MP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nd+khfBnpRQKHZBhscLeQxe8iRGXMdkRhoSN+7ElymrgO2dCklK9nzNJoPXCdCBpX53rp9xyf1j+/F+0atQSWAYMuNIhonYld8vr9laTbWtL8hKHXD1rqhGBKrrLaY7B2otvQtlvagKcENtcHbsQfXEh8mzuPHf4HMsWmp2UXugyAhRlJoAatsxdm0QwyK4iinrkL72IfOhtY968QJjlY56l4aXg2OV1iuKHYZ2kRhjNUyLzz0Q5ET2Gcpx+A8PUY8FPfQJvimLbOUMWACOrgsiTyAAZ+FYcXSUv8igSbBLRPAS8pZoPFGZ2V+UZT5C+wXvIpfnGfUPCEvQdPJ+1MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=26zdtRhTykQqzYryiVSRr7+vwnf07ho48wv7NMheJow=;
 b=SQmY+NM3buZqV3e0trtP+3O7VFByYDSMjthALLOreL9GzF7vi2Qxpo6qgSOKJ8yFIf/1f819Z13x48KVLjSbyunRvYcpsVd9SUMDBFKoFjngXDUKQux0iB+INDUhRnfl3aXLTVaUrWMN5WdWpj0FWwhEJIB/rXvYfNqWjZ9WQ0l0NQPmLmClMxCfQW0GYT1/6Ax2pU9ls7Pvzy5oKdEUXeqURAviasm5GXBe3eFBJWvLT7OPUUVlLnsB3Pk5l1jTHeGDqnbu/oWwHeBqa55eipThG4Iu7QrIQbP+9Ud36z42Phm2brclpmmulSrMHcs5zx5BXa4mpcKjIlgIdqfaOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=26zdtRhTykQqzYryiVSRr7+vwnf07ho48wv7NMheJow=;
 b=oUVJz8MPRKKgVRyyUe+2OiJ172oSKGoz5f2BJgGut7kxfKynRRGGrFD9fhpa987yIxoAfLOFfqfdKcqjfS6pDndnfXaB00GmSoFMJvjhLYPzDwwqdeFbKasmQv+0ZgLjs7Yb+/Xj5gxWq/U1e7Toxu8WcrEeiaCLk1KfX156hQn9Xe3Q85rP07nsXKVRfSdSGZe6g7NTlxtG6tzAZB8oFeED6dgKGaRbXGVW5Glh4Lt9m2eg8/cgOFZUiPvEZzkF/T0bMmDv9/ryZnOJf+ZYZoFSn8H0UpYgYdnjYsBb7iVqVSgE4NQ9XJFQBaX0zlar5yTnx/vUFjjsKWw01ZOY0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 PH0PR12MB8127.namprd12.prod.outlook.com (2603:10b6:510:292::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7202.24; Wed, 17 Jan 2024 14:56:40 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::acb6:8bd8:e40b:2bfe]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::acb6:8bd8:e40b:2bfe%3]) with mapi id 15.20.7202.020; Wed, 17 Jan 2024
 14:56:40 +0000
Message-ID: <9404e4e2-e7ad-47e0-be24-56982febf353@nvidia.com>
Date: Wed, 17 Jan 2024 14:56:38 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] dmaengine: tegra210-adma: Update dependency to
 ARCH_TEGRA
Content-Language: en-US
To: Peter Robinson <pbrobinson@gmail.com>, linux-tegra@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>
Cc: Thierry Reding <treding@nvidia.com>, Sameer Pujar <spujar@nvidia.com>,
 Laxman Dewangan <ldewangan@nvidia.com>
References: <20240112093310.329642-1-pbrobinson@gmail.com>
 <20240112093310.329642-2-pbrobinson@gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20240112093310.329642-2-pbrobinson@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0184.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::28) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|PH0PR12MB8127:EE_
X-MS-Office365-Filtering-Correlation-Id: 642a1913-04c1-444b-c68b-08dc176c82eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GLd0pRgCqfe70cccEj0Z4WWQIPkQAE9P9mNXmmNA2vJzcLl8BxXg+r+qC1ZkVS3FbFcveWd1hC1qf4JRFE2M+RdYWQuewK9IF4tmISy4J2vcjTksGGRX7/h7xEc5FoAXF6Tb7jz0crmJTmrh2UhKR859waQfKccKviPLps8UpedGEILaSW/vxM5SLstjz4VpeFfaGuk+jeyNgbiWvvNrazDdiJdZMScnMLgry3JPlCyJp/ikzyFYAKEbKyeDOU0dv0J+n+/rS6U5FGnBm+tP0FUmWF/D+2BWNwqSt2hmTE0QvP/nq+WTwZBvsyJjTxrcQLdttVGWFe7dpu/QTomzYuAr+beegFvFDWehTMqaG4wgeKBfjKfG9CZHdSaJT3/4Be8L6FqtlooQ1iobxGlE2tupueFkaWuFPvwCNJJZh2aAxU5NEn+UMGY9GivTVoVTeHY6dHPWFP9TXnTzc2M1Ay9UrlCBohA4p+sF1p+VFmW2Y/TfglCkBL5y64BA7VoU1SShM2N//7fXhHUv3t5hCKQ7zJaykXTY81bUIkbfO1Fuy8HUFp0CuK7rd+b7vSIxzLhuVHTgAuNutrerm7UhU/3GEku5TTcpQFjGHH5T3eJRpVdu52Ec7XZJnNAOVhAuMHY8OapxG1/9d/nOryY45WvJM7TQI+Ddas9cerJfMlo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(39860400002)(396003)(136003)(366004)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(31686004)(6512007)(6506007)(107886003)(53546011)(2616005)(38100700002)(36756003)(86362001)(31696002)(2906002)(8936002)(41300700001)(4326008)(6486002)(83380400001)(5660300002)(15650500001)(8676002)(316002)(19627235002)(478600001)(66556008)(110136005)(66476007)(54906003)(66946007)(21314003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WjhJdkZrRnE5REZNbHJ0UUJGQS9jYWFJRXRxKzYrbS9WbW1SV01TdU8vZ2xR?=
 =?utf-8?B?WndCa3hsMVpLUUhraHpsZnk5ZngwQUpVd0I1UDhhUnlOaFZ3UldEY2VudUdS?=
 =?utf-8?B?cWhVQ1lMc05VNHA5Q1ZKbDViZ0UvZjNhL1Z2MkIrcTA3Y1RNY2tUc05XYUtE?=
 =?utf-8?B?NTJWY2x1T3NOT2d2SlV4ZHZ2N2czb2xGYzMwdExvR1pDWEdhK3lPdzVGQ2Rp?=
 =?utf-8?B?TmxaeFNnREs2aENuQ3RoMWZjV3FIY0lZUFNGWi9KQWpPZ1gvUUUzMUJGbzZZ?=
 =?utf-8?B?VFJPV1BlcDNtaGdFZm90WHR3L0gvVGVwMitFMUZVV3RzK2ZLc0dzV2RQeUx5?=
 =?utf-8?B?bTdmWWlZYklIcUpDVVBuNnNObXZnaU9WUXR2TnpJMlRveEJzVS9qR2l6QUFC?=
 =?utf-8?B?QkxTaEwzRzFYQmdFRERZOXVNNHdTZHV5UTdGWFlNd1BTK3R3NlU2SHhLNFRD?=
 =?utf-8?B?T0NGejZ1ZnNKdGpRL3l1Uis1cnltTHVHNXJESXltNUJPWklLUGFiL0lvRGFF?=
 =?utf-8?B?YTRrWnk2YXo0eXVJY2JYVlppcUl5ZVQyOFIrSXFVNktPa0dvemFJK3Z6U29n?=
 =?utf-8?B?YmhPaG1JTVh0dzlITnZpTWdtZGFZN2lzQjZkNmJWZnoxT1RIYkF0Smg3WXd5?=
 =?utf-8?B?SDh3ZFlWWHNpR25rU2FBMllXd2xrdjNoUUV5bHFEaUJ6eGFrSWdRalVRSVRK?=
 =?utf-8?B?bmN2NGp1N1pvdk1zcnI5Z1FVTlNiT1Brc0hzcjRDT0VTOC9XK1RjYTFwN3Vn?=
 =?utf-8?B?bUJJL21ycHhpTFJLUldmUnovTzV5Tm0vSHVBQUtxUVRycENOTWpFUkdKZEVB?=
 =?utf-8?B?ckozWHpieHJVSjhGL2R0T3hVQTU5clM0Rlc2eTJXUlV0cHBHYXBmQVladWpW?=
 =?utf-8?B?a3dXVjIvb2pBbUc5eEs1UkVxQ21sblQ0RCtDUVRPMWptRE40VVcrTDV3U21F?=
 =?utf-8?B?ZzBJNGpvbU5MdXFiNWxRTFJ6VHBMdGl3NytqMlFSdVd5aVZWaWg5WjhXaVpi?=
 =?utf-8?B?TE8yZzl5MndudUYwVy95UUVlelFobWc3MER2NWUxN0xscjk5bllyVGRva3Nz?=
 =?utf-8?B?Z3Znb1BmeGd0YWZKQ3V0aDU0OXgyOGw2eTVyMENvbW1FVFVOUWRNdVJsRDYx?=
 =?utf-8?B?TGp2ZjZ4aVpmM1dQUy8xL1dmcWtxWU9YaHZodVlxUWd2ZWJwT24yYVVyN1Zs?=
 =?utf-8?B?UGU5SFUrN0JGR3VrekdmeFFZb2I3ditDd2dheEVBUXRqdkNCK2hxWjVuR3ZC?=
 =?utf-8?B?VGt1eExrVEZhZkFQN255VUQ1d2lPUWRvaTZoKzl6NW5CTkdyWGJVNHcvR0pE?=
 =?utf-8?B?bUtTcnlFc05PMXR5VDdWUDhDd3FwSld0S3Q4aTVESTVHclFvcVdrbFdmWWJs?=
 =?utf-8?B?UG13UWpkTi9nNTdtaE9BNVlGbFg5c0YxbUhMNU03M01SUWd4OEdrY252VUpR?=
 =?utf-8?B?aWxBV3ZDRk9Mam0yNlQxMEZsQ3FKV0JVM1lQRDNkYWRxTGc5QVVQM1RSZ3Zr?=
 =?utf-8?B?aEtFcEwyMHpoMGNvWXo2LzVGdGRndDZPMlF5aG1EdmlEWTlJZGpyUU1SaW02?=
 =?utf-8?B?ZVYwdUdzaDJmUmNVVmNiOS8wZGR6eUJFVnlnbjBQSWo0MTlVelJOWXd4cVRS?=
 =?utf-8?B?U1N6TE54YWpuRStlOEJ4N1BCZURML2FTUVh1MVF3ZVBXT29kRXVQU3JhSFJk?=
 =?utf-8?B?bmJMRVFzSGlwSXRSalI5eHhyV2RMUit3WUZabGY2Z3ZWZi9UYkN4QnpZRFor?=
 =?utf-8?B?M3Fmc01wTjFydjlLRTh3cnp0SlFpWmZQUHhLaExIZlNxd1RjUkoyZEkxUlA3?=
 =?utf-8?B?Q1pMQU1RY1NNYzhTeHJCRmpCczMzcjN5N3JiSTM5MHZoOGVOT3JqTlpGZ1NW?=
 =?utf-8?B?QzRRbUJ1b0IwWXBobHV4R211bm9oa3JYU0pUUlhTNVI1M0VUbG9DVXBSQmdL?=
 =?utf-8?B?VHlyZU9qaUUveGt3UXJZN3FqYTFVVi9KNStzZFJCV2dJendVcCsrUlVKMWJE?=
 =?utf-8?B?ekgrUGxhZUZDQy83eDcrZ0RjQjQ5M0ljbmJydVVIenl4Y3lVNXErVVdzWndw?=
 =?utf-8?B?OUR6SG9aQU9nVDBSTmcyRUZDVlE3SEhCUXhCcGtON1ZEbjZDUkYxRzE2NGpH?=
 =?utf-8?B?SnZXWFFiNXVlU0FtWHFBUUlHWGlKS2ZHbUNUMWtleWJ1bjdSNi9waFpiK1Er?=
 =?utf-8?B?WmczQlp4L01GbVFUS0wrZytYQnlJRXJqdXZjcHdhOUd1dTFleElaQ3NYM1hQ?=
 =?utf-8?B?Rk9mV1loL2paaGxsRHJlMDJzRXhBPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 642a1913-04c1-444b-c68b-08dc176c82eb
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2024 14:56:40.1597
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YPxzYUqoDNrMHYZzSVAvWl64OdszkUlpNCTGvEI7kx5WmWMjTaX35GcFFVNeIUwz2G5DNx2mDMDQAeMdspr07Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8127

Adding Vinod ...

On 12/01/2024 09:32, Peter Robinson wrote:
> Update the architecture dependency to be the generic Tegra
> because the driver works on the four latest Tegra generations
> not just T210, if you build a kernel with a specific
> ARCH_TEGRA_xxx_SOC option that excludes 210 you don't get
> this driver.
> 
> Fixes: 433de642a76c9 ("dmaengine: tegra210-adma: add support for Tegra186/Tegra194")
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> Cc: Jon Hunter <jonathanh@nvidia.com>
> Cc: Thierry Reding <treding@nvidia.com>
> Cc: Sameer Pujar <spujar@nvidia.com>
> Cc: Laxman Dewangan <ldewangan@nvidia.com>
> ---
> 
> v2: fix spelling of option
> 
>   drivers/dma/Kconfig | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
> index 70ba506dabab5..de6eb370d485d 100644
> --- a/drivers/dma/Kconfig
> +++ b/drivers/dma/Kconfig
> @@ -629,16 +629,16 @@ config TEGRA20_APB_DMA
>   
>   config TEGRA210_ADMA
>   	tristate "NVIDIA Tegra210 ADMA support"
> -	depends on (ARCH_TEGRA_210_SOC || COMPILE_TEST)
> +	depends on (ARCH_TEGRA || COMPILE_TEST)
>   	select DMA_ENGINE
>   	select DMA_VIRTUAL_CHANNELS
>   	help
> -	  Support for the NVIDIA Tegra210 ADMA controller driver. The
> -	  DMA controller has multiple DMA channels and is used to service
> -	  various audio clients in the Tegra210 audio processing engine
> -	  (APE). This DMA controller transfers data from memory to
> -	  peripheral and vice versa. It does not support memory to
> -	  memory data transfer.
> +	  Support for the NVIDIA Tegra210/Tegra186/Tegra194/Tegra234 ADMA
> +	  controller driver. The DMA controller has multiple DMA channels
> +	  and is used to service various audio clients in the Tegra210
> +	  audio processing engine (APE). This DMA controller transfers
> +	  data from memory to peripheral and vice versa. It does not
> +	  support memory to memory data transfer.
>   
>   config TIMB_DMA
>   	tristate "Timberdale FPGA DMA support"

Thanks!

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Jon

-- 
nvpublic
