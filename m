Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2065.outbound.protection.outlook.com [40.107.237.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784CB20DC9
	for <linux-tegra@vger.kernel.org>; Wed, 17 Jan 2024 14:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705503332; cv=fail; b=WHD3Zoq0wXHHUBG/s2tmlWqmuR7HQrxUu9+cprCRCk8tA/3DLFzEicZA2dmp6q5ONYrBh6oW8EK+Q8xJdPzVLlM3PV9nv0cOHAXDyToAqhmLApz+icv/u2Yia/UwKPogh0hZNnjJl9ZAbfeBS8vIwiEYDHx7dbLcoQZFsNlrYa8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705503332; c=relaxed/simple;
	bh=3oIeOGGvy/LDPs+jlpcMNIO4lRvnylPJJxyblwBAXso=;
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
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped; b=DR1HO12lM5tiSjFsz534LGY7AcflmzG6rvIgBjwJj0UtLHi/xNfzcqnfXerj2DdKHCsS2ia2ImgsKD827CvIr0bT0GeML7RVZ9isVO5PEPpXXlUEFjlMbvaFuRH8yi8tHWOJKX1gDKqQijC02Q9qTnb6vxZW2kt5ZnxJ90WXAwg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WnxOBO8/; arc=fail smtp.client-ip=40.107.237.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WnxOBO8/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JF+4DHQ3g99B6NJerG6OFoJQvPJBBMiVfmDszNqHHDnEYWD9+xI/H0Gpdsow4rxEKMeX0RCxrVXeJhhr45uRLmXTy7AvyfVoDE/gZtmeVCbwpu3QdThEzBXPh2FSd0VZY5+iKYL4P2XFVgwkthq1kPM3PwA9FuxCrxH+HqCjDxEY5RI1HSrBH+3ZO+cgABhZsdyg2ouqU3HfVoDeiDLqQjLPVOGV5RdbYa3Izyx2VRVdYMRNVNhErhQz5EytaseczCCnVdtTFmw+GNR/ffVuDcrsRPSvo4aspcjfMm1digwtbWhattI8FVEIWTh8G7CrenQkRXcOOchFv4efIE8GjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PRpPp8ELNvFNJMffxvf/rAHX+TXg+qJQwRNRiDihTn0=;
 b=jTPs8SDLvJRUeYQsXbELPJrDLwEHBTjz/7y7LjAg/alod98un9Fb9PzQ4qm7ieUa4v7i8JLoCsqq/fwRkDejmlaOsEnBn+4WDAHN+i1IhXV4qVxG0fIn4bM87UBnH56Y9Ljb5KyMuh9mIUyBw6mavGwnX/+qeTuct8ctJupRrmUk/DFunIyXJQkV0YFvWkyYKMJ5LOwlLJ6dV1rU4PYACxfGGmj6g70poNB4U33ZDBNnhwqT1NS0PJnrqCePxAkdTBwBzOF7O/YcvaNyj6HHG/o1Jxgb+vbNLdjfS8ss7M/tr25nqubgYA4/p3LrVUNVmLrAifJKNNcaNy4i5t+DjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PRpPp8ELNvFNJMffxvf/rAHX+TXg+qJQwRNRiDihTn0=;
 b=WnxOBO8/UUv3ZEyyS+U6HwoDlUhzpCEQWL7XBDi2JmS/QhSdfJkayFiCIRxH4RqWT/DTxxMpTUG2DcEhOnYMPQf5VtnvMfTTLwJ9BF4pRgkbCelBYlJYGa6Zeq+nthOQEtNREIiCEMBYJqjv9vbAf9nZuJMD55/ubXMFzwm/d+LTjua0ORX8t3xNFTTGbYzFuzqNFeDFnl9H8geT+vDoC0ZeQ7St5FwhZRpRNaW1P+2YDRmEnfFtQmn1Pv9LLGY9JoGNSuqW5M0PYkukY1W1I4GUhFqdkXH4XLD9EDODHUn7g5FqwqAzYQeD+7psUKOa2sYlgRdjp9Bvg0qyOAx+sQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 PH0PR12MB8127.namprd12.prod.outlook.com (2603:10b6:510:292::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7202.24; Wed, 17 Jan 2024 14:55:26 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::acb6:8bd8:e40b:2bfe]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::acb6:8bd8:e40b:2bfe%3]) with mapi id 15.20.7202.020; Wed, 17 Jan 2024
 14:55:26 +0000
Message-ID: <4b53de23-da1a-4430-b08e-0b34686988fd@nvidia.com>
Date: Wed, 17 Jan 2024 14:55:22 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] bus: tegra-aconnect: Update dependency to
 ARCH_TEGRA
Content-Language: en-US
To: Peter Robinson <pbrobinson@gmail.com>, linux-tegra@vger.kernel.org
Cc: Thierry Reding <treding@nvidia.com>
References: <20240112093310.329642-1-pbrobinson@gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20240112093310.329642-1-pbrobinson@gmail.com>
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
X-MS-Office365-Filtering-Correlation-Id: 950ac1c3-9214-4ba2-e226-08dc176c572b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yFeRfef73i+8D00oJlvDpvyqMNSmqKtJ4XHYOepR+N4kJVkJtjVguroyiCGKcdb9UUlXvjoBaoWEt6G8jgsniFrMHsWGMCh3WtXUGoSQSQVyvNiOfOTBy4DowEIojEAhzo0gXLRPTvokQXgQVaOmhVhkhrO1e7U70oDyvr88cWSgw+jFqON0psGVkn/6240dmX4v00+YDtmtxWG5GaFVNUAVyR8wmRMka6uR1KqaiWvtT3Xy0Vuk3K3VUsRXZ+yaSMAdIaM+uxLN+WWe4S0AuB7NGvMhJRPKtqA580bBxyJMsd0+4c51GBuqDdHKrAgXQ7CoI/1iLVTk1nncH4jVd+p6DF6siCmJnbSuHbN7BGK6lBzkNptZVhBowfsziEkidXkcUpHw77l8j4PZ+1nLbnn6cJ9s0+kXJv2vtuLvM+J58nhgKCC92QeEo0fyYae56CcD51JTlDHu4m/y28/U7dkx6bCsMuzAwk8hEH2E2BMmDJ5nfwrL2Y1V8BOjt14LxtXFTFfgFElO7m5L4CAKn71X5H4cUVNk1YCU2QzsQE8YZvNmPCL9cicas6DN9NJQjr+y7X5MDgZe7GHEtEP/QuivuDdZstIdQNCmZqJy7JOgRXi5LXjvFO4EOF5NTUjUn+O9dVPGsb7ECISq0f7Ekshkd7OyLY5rrpUKib7pSUo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(39860400002)(396003)(136003)(366004)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(31686004)(6666004)(6512007)(6506007)(107886003)(53546011)(2616005)(38100700002)(36756003)(86362001)(31696002)(2906002)(8936002)(41300700001)(4326008)(6486002)(83380400001)(5660300002)(15650500001)(8676002)(316002)(19627235002)(478600001)(66556008)(66476007)(66946007)(21314003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dzdZemd4RTAycVA2RzZjenVYbklFeUtvdm83NXA5SkZ4R1pHUDVLbjVhZVd1?=
 =?utf-8?B?aGRjRFpML0hrTDNBZ1pXNXFuK212T255T0FXRkZzTTVacE4vQ0ZWK0oyZ0Ju?=
 =?utf-8?B?MDNiK3Y5RmxnYTJLaGpyK05Ua3V6WGxiZitDSTBPTzBkUkNJTlZlMmhnMXhL?=
 =?utf-8?B?cVRCRzV2RGJNRHhLSzlqRCt4UWEvV3o5bm1tVjg1MndTZ1J2YnRPYnhJQ3Jj?=
 =?utf-8?B?MnRpR2l6bDVKaExVUzJ4dC9kbUlNMXRlSDBYREJEVjFiZjd1ald2OXFmdi9V?=
 =?utf-8?B?cUsreFdIRGNxVFd4QkJ5UGNJUE4vczliQVhEakUzbEhQc0F3MUNTMjd5ZmRJ?=
 =?utf-8?B?UUhMTUY5aVgzZVYrQUJ1RTA3SFZvNjcvYUhic0E4U0VEejI4WXFCME0xalBk?=
 =?utf-8?B?dHJBUWdpaW5zV2g2M3FvYmo3UTdnVklMSC9PNVZLcmdMM1BlYnZ2UytUMzVN?=
 =?utf-8?B?WXBXMkdyTTc0MU5RZDRJdFMvQjNMRU5TSnlqdkEydVZTNjIzVjd1LzBUaXlR?=
 =?utf-8?B?WW1mZjA1Q0J6d3VqNzQwWFBieGVMMkN3eUZKMlk5cVBkVTVjK0k2UEROeWpw?=
 =?utf-8?B?L2FqL05uaStwcmo3RG9qUDVtRHJuWm9OaGszQmhZOHdkbG5wT1RjVjd2K1Rm?=
 =?utf-8?B?YnFBZDB4TjlrbWRxdVZQck8ycnpHNzIwVmVHNDQ4eHZqbUJFZU5PUlJzNzlQ?=
 =?utf-8?B?MjR6SG83TVBrbEFZRUZLRnF0a3pWYno3SnpkVjBBV3dJcFhjM1NxcEl2cVlt?=
 =?utf-8?B?T0lFY1hnNmFMdUZ0U2ZteHJQSisydlVyTlJva3VXQzZ4blNSb1pTbnRucmxz?=
 =?utf-8?B?bEUzaEtFb2QwTlNPT3hUY0JLMG5CeTNmNjdFcFlZcWVUSjk0SzJPbjNTTEl1?=
 =?utf-8?B?TDRTZTZoSU9oVUdsSjE2Y3ZXTWpMVkQ0S0NzR2VybGp4aG9ZaGpLK2phZklQ?=
 =?utf-8?B?MDcxUldzWlRzakZlOGtjWHJxZ0IvQ1ViaDM5Zk9WazBYUjRBVnVtaGZUMnRF?=
 =?utf-8?B?YmJTa1A2a1QzNytMbERmb09TK0xyanNCeDUxZVFWZGc4a3VKOEtvMXpmcjEy?=
 =?utf-8?B?ck9PT3VFalBrMDJRcmJXTFVyUXBNaHlBRGlGK2hScDdIdlBaN1A2eGdxRXZ6?=
 =?utf-8?B?TFU4SlV2VUtiM1VSOFhndExxNXhSWWs3enhQby9GTmt1VVRpVUdwRkx5TnpK?=
 =?utf-8?B?NHQ5NDE3WWFrVDRmdzdaMHh5L2ZpSFdnb3ZnS0EzNTZtV21tMkVtZ1dNZXFj?=
 =?utf-8?B?eHZQVTE5QU1jcXMyN2N1SlNlOTFvRzVpRkRHc1M4ay9PeVA3ejRQNHpDMmxC?=
 =?utf-8?B?d3VoOWZ2a0g4MUcvMUpFVmxwRjkzWWFiajZYbW5qRXR4bmgxVk4zLy9MdjBp?=
 =?utf-8?B?Ujhndm1aTXJyZzFFUjdVTzE3NmtyNENqL3Zqd0VnUEs2bHZkK0djNEdxQkdZ?=
 =?utf-8?B?UmRTNEdJN2FobzZKRHZLRU91aU8xWEczdnZZbkRZV0RVUGNSaWdkRWgxbytP?=
 =?utf-8?B?S1BTSDRReWFVNzIrNU1XZWFXSzJ2cElBUWRZL3NCRkFhZTVwZE5rV0xLWVlQ?=
 =?utf-8?B?WTlzN3llUElVWFdRZkx2QXZKUjZ5Vit2N256dnZVV1hhSDhwMEhFMW9YNFIy?=
 =?utf-8?B?Ti9GVlNlTHRzbnd5TGkzTkJ4SFRsQ0dNUllSc3NmRDEzWFQzSXBjV1loQVpL?=
 =?utf-8?B?V1NQd2FLT3R2QVJzK2Q1bWtlQkVMc0ZPQzRwT002ZHAyQWpSNzgyZm9lTE9p?=
 =?utf-8?B?bE5YYjVNMklyUEdWazRZWG0rNEhTRmV1VVY3RlB2cnJFVEVmKzJGN3JOZ0FH?=
 =?utf-8?B?K0JjZGYzUjgyVHpGVzVibThMSXhBeDRmYytuUDJsdHcvRWJYZGw1TUtzT3pL?=
 =?utf-8?B?bXJQdkZ5QlRscFd3TnJUbVFtVytYWlNmanEwajJ1KzBzSVdJUUVpajZSRHla?=
 =?utf-8?B?N1FuV2kzZnM0TmJIUkFiN0hUYVFHaXR6ajFpNFgwdE9DZDFCeXlJZkdCUHU3?=
 =?utf-8?B?MUV1QTFNc0R5ajE4TW9JWXhOeURuRUp3SWh0bHZGN2szRy9WQmYwVHhNamY0?=
 =?utf-8?B?S3VtVkZlTUMyY3BQamdXRW9scFJ6aUwwNFR3MVY3eGc5bTJiZU5Yb2lRbk5x?=
 =?utf-8?B?TXFmS2o4elY4SW1LdGhXeWduVHpHV09WanY1cGpWWWFiZy91a2U4ZSs3VVUx?=
 =?utf-8?B?WVpucDBLVlNiYWhCbGFOUmRLQ0tuUGlUa0VVNU5iKzZJVktKZkNaQ2RwT3Fa?=
 =?utf-8?B?enArK3BxVzFNeFdnbmVmN1BWMjJ3PT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 950ac1c3-9214-4ba2-e226-08dc176c572b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2024 14:55:26.8455
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JBey3iran+bl0T2wvJpXo7Q5ROfZEZp+PAbieNkcfH0O1DVXmfyNuA3YKYL60zjA0yXebPwvoqcqVBMvahIs6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8127


On 12/01/2024 09:32, Peter Robinson wrote:
> Update the architecture dependency to be the generic Tegra
> because the driver works on the four latest Tegra generations
> not just T210, if you build a kernel with a specific
> ARCH_TEGRA_xxx_SOC option that excludes 210 you don't get
> this driver.
> 
> Fixes: 46a88534afb59 ("bus: Add support for Tegra ACONNECT")
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> Cc: Jon Hunter <jonathanh@nvidia.com>
> Cc: Thierry Reding <treding@nvidia.com>
> ---
> 
> v2: fix spelling of option
> 
>   drivers/bus/Kconfig | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
> index e6742998f372c..b003dad62d596 100644
> --- a/drivers/bus/Kconfig
> +++ b/drivers/bus/Kconfig
> @@ -186,11 +186,12 @@ config SUNXI_RSB
>   
>   config TEGRA_ACONNECT
>   	tristate "Tegra ACONNECT Bus Driver"
> -	depends on ARCH_TEGRA_210_SOC
> +	depends on ARCH_TEGRA
>   	depends on OF && PM
>   	help
>   	  Driver for the Tegra ACONNECT bus which is used to interface with
> -	  the devices inside the Audio Processing Engine (APE) for Tegra210.
> +	  the devices inside the Audio Processing Engine (APE) for
> +	  Tegra210/Tegra186/Tegra194/Tegra234.
>   
>   config TEGRA_GMI
>   	tristate "Tegra Generic Memory Interface bus driver"

Thanks!

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Jon

-- 
nvpublic
