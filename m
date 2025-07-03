Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2070.outbound.protection.outlook.com [40.107.96.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5592E7F03;
	Thu,  3 Jul 2025 14:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751551926; cv=fail; b=YbzWSahsEvZnaDVOHqgsWHHkNUw+0GSSTjMgGyExYYDlsi7B0PBQWT8BUXNq1F65o1ITQIx3Rx2Vgtl8huwLtwCIttg2MQxPpjw1jQAIcRkSqMQgS7Eh514AsUre+hm+gsBlAz/ANZFoNyH+QaFwuVQLPXHsnBTHFjrITf6nOVk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751551926; c=relaxed/simple;
	bh=Ea//TqqknLRoswCa/JAQGx3zMXe/mYESkfhHrMS1Uus=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=SMUDw3uGzG3iX/+THc8QH4A1oKFOrfI4xTf5n3+1Dg07win/huEkg1Nd8UwkOJgUgzRp6P0JmQVjhduz7B+a1W+cXIG7kMpvQ8PXljX7ZAimMJxMM3L9gzkmV6Pi3HsRyKIgzO2fD+QMRr4DtUUKyuOf9jmk7bUCd8alwLCu3kY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JIOKswhe; arc=fail smtp.client-ip=40.107.96.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JIOKswhe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iPbnG/ERAOuwEdcuZyi13t6+Z+xHUsI8WdxbDemlDBi6KrPcEFCNx4cdVKKnLQ4epWqD6i8Kw+m7F1JBT+ILWrgAfVQiLqAVCO03uAYGxEl5tb+8yFKDt8glGCamIttceYTQ6dGPSQW0C5wci18jtQ+hKRrowMVOr548XzHDqMN+09uf5DEFdDXzAuqO+MOQPoqVkvIobWFzyeeoYb/NWqTouLZ1UHCGznDWQKk4KomSTYRn1P9/jdqpedDHXyYgwGrfwzdClAV1/NJcYZ+4paVXGGvxvAieMp/YBd9kDh1suEfE/AkHcRSY33oq/vb7Vx5ARzSj2B8h1RoHOZacaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6M+6aeBhQ+4rEF0+hOwx03Zjh9EKD8mIpPCq6w8b87g=;
 b=oc8RxPJjVPpigqyGYCZLHbZk9J7iszrU0eF12svDX7EJRqCk8E2aGQ+Y/A30lc2e7Qsp+YfxUy9v+BWW3PRvWElY2+SWLZA+zApErElN0miHhYrnmsYRlYy3n0C+D+ucXfqkysBzHdjVgu+OmIoLP8NiaYudizT/kbTfqLeOylRLcR+l77JRyv1rVAvSy5MS27omPqMFL+ytNbxPVvkDY2RQRNX7mI6mRpnU0CvypNqw8epNE7jHbZFvoaSPrg6VIb8+6UaPZ6AK8YQ8TcT0aT3fKLR9nUyE276fG7Q28iwBiT1X0yzsz4uhmLr2Q+1dTiA39TXTe2VeE0BNz2Itxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6M+6aeBhQ+4rEF0+hOwx03Zjh9EKD8mIpPCq6w8b87g=;
 b=JIOKswhebwBxcq2dhE80GJUVnFNkEWu/muNX9Oy6U6//ODmKx+HfmEnsB1u18YuAqNrnN3HhU2tY4mywZpjc5rSbLuPBq39Sm8PRnioni5W1aDa9YBIIa9//bA1o4tlGWkVa/UcHMrAYDJtl6CENYFojYBDHjAJ+5NmwIe/ABLo4kGxwONK+ovhIi6oLLkAfu6rui/S2C5sRn1HugzG5ltZDE07nBC13rf1ObPOa+urXzIU5bbTGiJNUzerG76rrMkXBkTjg5e9teUEtO4L3xQqD/uP34o1PdHG3xspozdBf6uEy1ris+Lxe1OJIU7ERJ2mHRsPaYTwFxlW7JqfLZw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by PH0PR12MB7907.namprd12.prod.outlook.com (2603:10b6:510:28d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.22; Thu, 3 Jul
 2025 14:12:02 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%5]) with mapi id 15.20.8901.021; Thu, 3 Jul 2025
 14:12:02 +0000
Message-ID: <2b6f9898-9c46-4397-a440-102e21309488@nvidia.com>
Date: Thu, 3 Jul 2025 15:11:57 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clocksource: timer-tegra186: Enable WDT at probe
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Kartik Rajput <kkartik@nvidia.com>, daniel.lezcano@linaro.org,
 tglx@linutronix.de, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20250630110135.201930-1-kkartik@nvidia.com>
 <3wesm6syeqmjdzyyj2mjp4sjfwl7ebeahqxwcvub6gwvoifuh4@43tunmtjsq4h>
 <a0d7a8c6-af60-4f70-9d60-a87e0701bc91@nvidia.com>
 <k2t3dkh3acoenhxtsd3ekvpnwl5yir6qaun52h5prdfwcx5lsb@h3ieoj7jfu6t>
 <79974980-7218-4fa6-b5c2-f3936ecd1fce@nvidia.com>
 <q7fi2hpswm2tsowrtbanlnidxnyq3fyb2xxr6gcowxv6sglhop@nsvwlol4dac3>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <q7fi2hpswm2tsowrtbanlnidxnyq3fyb2xxr6gcowxv6sglhop@nsvwlol4dac3>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P265CA0009.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:339::14) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|PH0PR12MB7907:EE_
X-MS-Office365-Filtering-Correlation-Id: 66d97963-e88b-4d6b-b0f0-08ddba3b94c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d0Zrd0xKVGs5UWJlcDZyWHNROUZ1U2taRk9FWEc0djFRNXBKS3AySVRKd1NO?=
 =?utf-8?B?YzBaL3l2OXRlUm4yd0U2dFR1aHozVzF6S3JPWkFBS1V5SnJxUWRaM2pGU3pV?=
 =?utf-8?B?WEpZNXBxZUx1aDJ0eExvcEZGdC9sWFpRWXBvNTZUSk95UkRnTG9IT0RlamhW?=
 =?utf-8?B?eWFWTzkzNG5aS1Q1Rkx4OHVmY081d0RteldoUExMMDdkNEtKMVRGMUM0NzMy?=
 =?utf-8?B?MlQ1WDMrN3JUWWk5VWhsZVhrMU13SXh4OURVdjczVzMzSHU4aVg2MVBVdUVY?=
 =?utf-8?B?SDY0OTJzTU1KVHRiYWxSMEpFZXJuWXdRYmFRbSt3U1ZXU3Q4KzdNQWpnblMw?=
 =?utf-8?B?N1Zqd3IvUHY1SXRxdWk2cUVaRk5qc0RVVWorYWNVdFIyQnZ3SVJ1WmpQYTN4?=
 =?utf-8?B?dDJ0dTRtY2VOcStRTUM2ZzNmWjIrK0NINHpLa2Z4Y2E3MWI2Q0ZMMVpidC9M?=
 =?utf-8?B?bmk2WG9IVVVNSFZLeWJtUlk2cEtJM0x5T0FUQnBPTHBMZ0g2Z3hXSjJXRFh6?=
 =?utf-8?B?TEJEYjIrS2Z6Z3pRQkxobEVuRnk5SmdZNkdxQmkwU3VldWdxMDRaMkhBQS9s?=
 =?utf-8?B?ZGp0cTlNUWRwVHJPQ1ZlZUIxQzZoYzJIMkVnV3ZFcUVFa1graTVDcG9vNWVu?=
 =?utf-8?B?dE41UVhmb0FRRWZ4ODk4RjBEd3lCMkNWT1I0ZjBhRmljRkZ5MGc1Ukg3dUQz?=
 =?utf-8?B?elcyY2Zqcmt0aGtKelg3MUV1UUgxbTJuR3JFRGwwdVhYRVhnNGpMQy9UMWw0?=
 =?utf-8?B?TG14SjR6SmVtL2hEQmdZOWtJS1k2SEpxaUlMQUNPYXp1QzVzdW1uWXZmUXBD?=
 =?utf-8?B?QzB5Yi8va3E4N0piam1pdlFmenNPeUFSWmxqSjJINzBIUk42ZjJLdkVFUXBq?=
 =?utf-8?B?d2dSRnZKVzJJWEZVWXFvL1hMOGtRU1JaVkdmZENWNU0zZVVoWFFuL2dOS1dy?=
 =?utf-8?B?THhhbWJxOThlblBNaCtWbWhIeVlucUozaTA5UW9mUHVvMkZZemJGTWtBd0Fx?=
 =?utf-8?B?QURxUkxBM0src1BZdUNkenVYZVBOTmd1NDN6R2x1akpQSjRwTForWFpLcGpR?=
 =?utf-8?B?d3pYMnhDVXRsb1VlSVAzanBWMTdpL3RweERtaE03dktJVWtDMEpSVVhRcmo4?=
 =?utf-8?B?dDRybU1Vc2hnUmlkcWJ5a0piYnp0UmFPcWhkQ1NKR3RPNXYrSmJpTTJXdnI4?=
 =?utf-8?B?R1B5QkQ0bndZc0ZBMDUzeldTNGx5SzV6dm93UnRRRTlNcjNpTm5ONWRRbjBC?=
 =?utf-8?B?MFNwZjdMVmxiYVh1NVV5aWhEZGR5SHNZcVd3c29DdExrdm5kcXR6L1RVenQ1?=
 =?utf-8?B?KzNiZHJkdzhVMDZOWG4zREJiVDhKWjBQYWc2Wm9TNXI0cGpFcWk0eGxkeDVU?=
 =?utf-8?B?M3Q0enE1TzQ5YjdsUGQwYS9VR2QvREpybVp3OHVUcEhBTXBJejVBNExydDBk?=
 =?utf-8?B?WGVmUlc1N05qSkNseVh4Uk04YkhoU3Y3YS9heDNkYVFiQWhPOVl3NjB2Wm9z?=
 =?utf-8?B?aU5vWk93OEdRejFuTllRQlhvbGhiNDlJVUJ0c1V2SkU5YmV6dy9GMjd3SkNs?=
 =?utf-8?B?d01TcTM3NTlZY1JUS2NFdVhBTFRxdXQxN1J4QzZIRytGeExlS3dkYTdiSm1i?=
 =?utf-8?B?Rms3c09GZDVaZ1k2bEp3SGVaV3owR2llVWhmNlhiSHVvZFk4QTVqK2c2a1VK?=
 =?utf-8?B?d21HVVVYa1o5UnM1VEdCdXFvbzNwSnlMSUNyRXNOTm5FVVVnWVNKT3ZWKzBz?=
 =?utf-8?B?Y2x6OFhGUlNyQkV2dXdHQU9nUkE4N1FleElGN0NaUkhIY2oxcjM3MG5sQTJi?=
 =?utf-8?B?cGIwMExjZllLdS8zbm5ZSFE5cFVhRWg0bDBvamdVQ2g4b2dRUGU5UERuNkZR?=
 =?utf-8?B?OWlxZWJOSXI0WkhFUlhCeFFpdW9pWUUvTGlsdVBxZU5KQ1A4UDJ0YUJJUTVE?=
 =?utf-8?Q?6j/p302CWQw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZXVHRGVYMmtqbHJFNCtGOE91VERIZnFKRFU5NG1hR0Ywd0tKMHhjN0lHTkpV?=
 =?utf-8?B?a0dsMit1bGl3Tmk2ZDdPSVRMcUozK0ZMeS9qVTJ0NkdNeDRjQW9xeWtvbS83?=
 =?utf-8?B?bExoeUlySkVkd3JEY2RwdzJ4M0hzQW5BNjlzZ1dTOHYyRlRaYnV2RVhtemx6?=
 =?utf-8?B?NU1aaGlhaGFZOHJqVm5mLzVIR3owVmdLaVQ0OHYwU3JkVUFkVGFKZVpsK0pL?=
 =?utf-8?B?b0xjL2RFOGRuUUM5dVliM3REVk1hQTlWK0VreGl5YmZ1SmNTSWRyeHU1MzR6?=
 =?utf-8?B?K1Rnbm5zUURzODRaRnU4M3MwSGt6U0NybnlsZXRNeDZheGRkSkNMQktUSW53?=
 =?utf-8?B?bTdIeUdNMnJNS2loZnRGSThZdzF2U2g2Q1ZmanNZSXhHRDhTZVgrQnpTeXM0?=
 =?utf-8?B?aFhmemovOWpmVDREOUEzVUcvNjR1YjZBK0M1OUV2QmVHQ0tmc0UwUkxCbFdD?=
 =?utf-8?B?WS9UWjR6UDBMNmluWkhGZTdLV3A2SGgwbnM4NWc5OWNFUUFHU0dKRERQbXd3?=
 =?utf-8?B?bDV3NjJSNWVXbWF3czFrb1JmdWZoK3pDNVplbzdJNXFVb1FhOU0vMWtCbnBh?=
 =?utf-8?B?Y3lvdHlyelRpLzdEUU1DMXRuTVNXNUZQUGF1VFVnbFcxNUlmWmJWa0h2K1Ns?=
 =?utf-8?B?UmNmS3ZOcmdWVE1XT3dhaDBGbUp6dGxSNFNqaFpIS1Npcm8xVGQ0RGpsM2F5?=
 =?utf-8?B?RGl1TUphR0IycWViTGNtV1RDT2tUTkxsVjVtWW9HSzhUSUJkY3E5bXVoV1JM?=
 =?utf-8?B?T1BLSnh2SjI1U2t4dlk0RjJiQ25uQ05wOVFEVmhhakYyak44bXVTeUdjZHpE?=
 =?utf-8?B?Tis3a1F1N3ZvMGpXZmxPM3EzelBTWTF5Smw1MFczYzluR1U0Z01xS0lIdjMv?=
 =?utf-8?B?S21BazlKNzhvNDBNK3RKOWNDeEpteGk2cWhmcHdrTzFZd202VllSUGZxT1N0?=
 =?utf-8?B?Z3pwVWpwenpJc084UDQxa09oUy8rNWxyVEVvK0F3Y2RkQk02bEJGNEdzVzVL?=
 =?utf-8?B?SGlHZSszSVh3bFVJK0V2UDM5V3hMQms0UkpYL1pvVHpoYnUrUlMxZ3FUdlpw?=
 =?utf-8?B?OGxDWVRQZEpPdmZ1U0huYkR0QkdqcU00V3d2VHkyc2tuYXU1SktZa2RpZG1w?=
 =?utf-8?B?VE9qMVBFS1JhMTRMdmswQlFFdG4wVzlsa2hNTFdYOHd3MHZxYms5QktsSitJ?=
 =?utf-8?B?UzdqRmpaVDlrTURZT25XTjNEMG8zaGgzd2NsTUQ2NXNkSWI3MjFVL1RrT1U5?=
 =?utf-8?B?aFBwSkJLek95aTZIeSthVU9YZWFQeUhkVjk1MzRodFQwcVlCRkRpRFNORHEw?=
 =?utf-8?B?K0tTejZTVFdUekVLNDFQaTh5WjAyd3FYcHFSa2creW1xbDlncmpJeFVFdlRU?=
 =?utf-8?B?RGQxc09TNXAxZ29YK2FUb1FZY3Bzc1BkRENqb1VQdUlsSDZnaVVwS2JKZ2dM?=
 =?utf-8?B?ZTVPT0dhWGtEdjhKdVRmdDBkMVkzRFc1b1B3ZGhDQzl3cHRuM0ZrRWtNTzZx?=
 =?utf-8?B?MC8wdTBzS053WVlTdmU2bjdiajdzSlNiTWZkQjUyVFQrMHhRSGtKa3JWOGpQ?=
 =?utf-8?B?dFA5LzhpUmlXL1lDaU5NYlVrVkpiM3FNVmF4Nk9TVk5pd3ZYd2JZc1Jrb1Fn?=
 =?utf-8?B?L1RjUEE3RGdVNThWMTYycWkyYVovdjdoTW5iQlgvZU5KZ2JMeXludkQvVmFN?=
 =?utf-8?B?TXlWT0ZEVTFIRC9ubVhRNE4xU3RuM3o1R29IMkhMcjdYN25MaE51SXZQY3B1?=
 =?utf-8?B?ZGloSTFCY3VSZUx0RWdTUkdNd2ZlcG96N0FNN2lSQ3ZuT2I5c3RJdE5HWjhW?=
 =?utf-8?B?U0l5U1BCbGpGT2hDcGVnNFhocFJaRWtrVzlqR3dYS0hNR2dIYzZxMXJVZndQ?=
 =?utf-8?B?RnVHTGxSeU5NaXVId3VEeS9SUHhhZDdSV0ZCaGwxTnVKQS9jSG8vOUJPdHA0?=
 =?utf-8?B?MmxVWFY5bE5BdXV4NjVUMm9vREpOdm5aREt2WTlUcEdiTDNhb0xMYTJFQ0RB?=
 =?utf-8?B?NFF2N20yRTU1THpHNGtyV1NtQ3dMdXhnSXNHMDZ4Sk1VMWp2bXJLdWJjamli?=
 =?utf-8?B?Tk5yYkltbmYxSzNkTXFFZmpxc0NoRVVGTXNtc1JIbDRuZEpyK2VkeXViKzNo?=
 =?utf-8?Q?NEQsLkxFcBePJH44/kGLb+HFD?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66d97963-e88b-4d6b-b0f0-08ddba3b94c7
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 14:12:02.1148
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 60FVzP8WrjIsQBwmOU1ftqiIe/xpH2dOlpkR0yWHUkxK6TCiWIRz1QArmx1ufs9BubYZevXWq8V6a9wtSeYNdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7907


On 03/07/2025 14:36, Thierry Reding wrote:

...

> I clearly can't read code today. Seems generally fine, then, but I'm
> actually really enthused now about using a second watchdog for kernel
> petting. Since we don't use any of the other two watchdogs, is there
> any reason why we can't cleanly separate both use-cases? It would let
> us avoid some of these special cases that are not intuitive to
> understand.

The only reason would be if for some reason the other are all allocated 
for other uses outside of the kernel. We are currently only using the 
one for the kernel so that it would mean updating all the device trees 
for all platforms to support this too.

I was also thinking about how do we identify/select if a watchdog is pet 
by the kernel or userspace? I was thinking that the presence of the 
'interrupt' property in device-tree could be used; if present the kernel 
pets and if not assume userspace pets. However, the 'interrupt' property 
is currently marked as required and not optional.

-- 
nvpublic

