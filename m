Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011027.outbound.protection.outlook.com [52.101.52.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466BF3F58C9;
	Mon, 18 May 2026 11:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779102915; cv=fail; b=oQiqkZPsKXibVciIAR4B0h6u0MMQZauBKp91SdiCxNkmG19ogFz0VM9ralZnkAI9wLO72pp1utfydTpPGbZ2kCwz8/fHHXlbu4Xi2YsKf5hwUO3VybejonZzMuSZiy8UvaPtUIBbK3uzxbVNFa6gjE6gPR4krTZX+j90amTaGtM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779102915; c=relaxed/simple;
	bh=ub5oTepo8hE+Kc+fnjsY8WX6mflAPJ/vlObgauCjAUQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rawYSVci0mzfDoneTIvN0j2FoSK7JGCarJ2ehcFWyOoQNyZukgMkxelecvT8xIAu+Mpd0PXoHAX0S7JUm/ymShz1/pGup8inCdPWHLdfsJByXS8KAbSSg9e6cmP9PJucWMfmvyCNC1ti1/qx8qZgPP+sqPMvuw6jzdWeuJC6Phw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RIYJXvEc; arc=fail smtp.client-ip=52.101.52.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RIYJXvEc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ittEfL/dcJ4fJtj2n/9/9xasSD6lqCunWFMfQk7ykVRfmC3l+pIoA8OFUm87Sx48hvbv24p7DZEANW/rWd2lLF7yxvhk0fTrVNm7FkpAyPwMCtB7Z4Oq5nzuSNe/+1ZdZh4C/yInXswyeaLkqKFvp6fLyJGSGKRNN8x98wdgGqJ9KLH6m7/wha42xLrNXtYM7k7zxeJ+XX8dRreQVXFG8wLwR6GXPxiVYWBnhLjDl7u1ItJ+e1l59me4T04Qt+5Y9JFgtTPFRbcLr10+21VPRmCOcGH38fiF4TopzAPTdpjQmcw4cRSsg/NU+nVSGjI9w3qqCmfOK0UkuOzW46Vxog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EhjLLQL11I4VvSnomvTx5ZbD6ltug1GezRG/i15ngs8=;
 b=GynZ5WZoJLdAX65gbqBBjs53O+rDNbgPE8XVcXIt6oOZfYT13NWSesmnNKC4Qaj0b05ypSLTQk5/hT5ZzvkXky2fhY8otI2F0TeczKSLiYdtNoacIFPgtLLHCPzbjIoK378OhhqDgqpGjyEvYDPblZIaCTa7Mmi6Y7FGUgjIzDvxlIT92JHQ0tpmcRF17jlbtbhdpZi4tKw5zEPhWGGcy8aeLMcScyBt+rJmn2xME5h2F11ULfaw5Idpz4YNDxRvRQLqOUVmrlvG3uFM4SNWEiaEzCGfmb68hY09gTavAeMJbRtMiJa8WGzd4fgZeabuiIg/IHQZKPXm3jtr+sPBIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EhjLLQL11I4VvSnomvTx5ZbD6ltug1GezRG/i15ngs8=;
 b=RIYJXvEcyz/q63IwKLR6ZaZ3oIg9E11GJJYIFevS5u84Dp9C7rjHEoxa2p89wz+o7cbSzipA6JNPT5ggUvKyfELZvsC3uNrSCQ8xOH6YCn62ZFA9FKZPvN+jLPihVzmqc//0vr2Cfg8ePqCQ/Ljz+mtnnfKDuYOYFIhZZoeUlL/N6z+s5ANBdnYnL8WDGEMFVtnJJYojXLrWkUhD3m9eiCsolUMYbD2Ra1s0pa6YxFd1+FblY2NDqrrdrBGc1Fmlx5LgpyMPWqBI2QbxihLCXEsuMu5zRJ+8u/3j00U1epgyIxdi0OUtwMeoOTePjeMs0eTB6Eh+OX3JeG8y5mooLg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BN9PR12MB5179.namprd12.prod.outlook.com (2603:10b6:408:11c::18)
 by CH3PR12MB8584.namprd12.prod.outlook.com (2603:10b6:610:164::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Mon, 18 May
 2026 11:15:00 +0000
Received: from BN9PR12MB5179.namprd12.prod.outlook.com
 ([fe80::cf08:f59b:d016:c95f]) by BN9PR12MB5179.namprd12.prod.outlook.com
 ([fe80::cf08:f59b:d016:c95f%4]) with mapi id 15.21.0025.022; Mon, 18 May 2026
 11:15:00 +0000
Message-ID: <c932ab10-a53d-4e95-81c8-dace918e6a01@nvidia.com>
Date: Mon, 18 May 2026 16:44:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] memory: tegra264: Add full set of MC clients
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: treding@nvidia.com, jonathanh@nvidia.com, robh@kernel.org,
 conor+dt@kernel.org, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, bbasu@nvidia.com
References: <20260515171911.1929868-1-sumitg@nvidia.com>
 <20260516-cautious-smart-ferret-230db8@quoll>
Content-Language: en-US
From: Sumit Gupta <sumitg@nvidia.com>
In-Reply-To: <20260516-cautious-smart-ferret-230db8@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0236.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f4::10) To BN9PR12MB5179.namprd12.prod.outlook.com
 (2603:10b6:408:11c::18)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5179:EE_|CH3PR12MB8584:EE_
X-MS-Office365-Filtering-Correlation-Id: d6a48673-5bda-4cd8-86f8-08deb4ceb3ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|11063799003|4143699003|18002099003|56012099003|22082099003|3023799003;
X-Microsoft-Antispam-Message-Info:
	lanj8XQfJ+obCfDtTiCL0oKmhJ2cRMsEZ8I9+yd6Iz07JpDafj5ToCtJB7tM0vokKlcn5HbDbQiVWvZVKy4Lf72DxqSDDMp6oOhotjB+kg7/W37H14exa5c+cD5bL3FIClV5zD12C4872Jl88slV1VjGLTpwS+YMr2lWOWCF7p36fGBvBW9mn9XOwlyM39e47UyqF5rmeEw4g6ntXs3agOp2s4f4m8vweDR2FhKVTkr1DdM8Vg0OAgi/mEOhEtObLYV07hl8Z9Zsj+PDvAWEaKAT4SWQbs79OJ1HKZ/qxiArOhsQVpX34EjHeNW4MXhKwimwkGytwnCMm36KnOXTV1VE45+l/W1yk5+WdrLtl+W7TAyJh+J+57dkrFjmN5lhfGUPm4Lk1UmoKsLeD4Xy0B/6SNjJunrU56Fqciz9/ycr/wiy2L8gSRP6TNnFVCXh/Aar6wWufB0LqpkMk6czNVwMAEMTBuf3/QBrfN3V1fJzSKT+T1dE4Rletqie28/VrdXP006rk6yW7kvQVFCFfJXLF3TIXouMb6iSwyfxd5OKychZfaxF6SNzgrOkRdTzlH16TncY1U6OVomy1Nocld3/cXoKgiI0zSFREhuSKXge3Pu+0iqdTgbVHG6AJrDNxaZ3pJIO6pqJmWL84b3myGMuOu5Jc/+hH66FEbDJwqXxfpOyDiHgalJ3ccPzBQf/
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5179.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(11063799003)(4143699003)(18002099003)(56012099003)(22082099003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WTNvczVtM2llOG0rRkhUWXRPSEhGMFFSSGRBdk1LaVRsUER2RVJqSUZSKzRm?=
 =?utf-8?B?enN2OVRMWmRuOUhPVVU2M2pjTFdYYzZyVjhmNjhmcXNyZjFKaFBJUUhFNVhn?=
 =?utf-8?B?bnQ4cHYrSmhtL2VrWU5IdlUzaGo1Y0dkRWkzeXdmcVZMcERnbExhVkFGWWEv?=
 =?utf-8?B?OWtqQVlOOWRxUVViU0RHcFFmb2kvQjVNU2lVS2FsSmFFNGQ3TVpXL2F6d29i?=
 =?utf-8?B?a29WbjMxQjVNU3duK3RsTHArTG4xSWlIUVR0NmdZT1Q1WE1VL2hjNkNjei8z?=
 =?utf-8?B?UjRhTmFhMWoxN0lKNXQ5WGlzMWdFVlIxK2ZGVk1oeDRNMDJtdll6bFdTNDRE?=
 =?utf-8?B?L1AzVTZjNnpBb1duT240cnY4cTd6V2hWY0Z6TFY0WERMODVaWlZZcDIvMm4z?=
 =?utf-8?B?MVZZd1YvU3lTOWJLYlB5UmVWTG0xZ1NyOVh2cERIWHVDaHk2WGV0RjJUb001?=
 =?utf-8?B?WE1WWW9VY2UxNGExTEhJRTlXYXpTNTVXL3B3WDJsa3Q1ejV5MlRMSW5LUE93?=
 =?utf-8?B?U0FZVWtmUVM5QzlrSExIb3hwV2hlV3NaclJEZml1a3RMbjg3RUtiekFlVmcx?=
 =?utf-8?B?alNZV3RWSGRxUmF2WUo5bGNtUlozbmczak85WkRLYW5Bb3JaNU41NXMrc0Qr?=
 =?utf-8?B?Q2Q3LzFjcjZHakczNUZTU0hKMUczc3pZekZMSVVJWVhxaDU5TERtS0tvV2RY?=
 =?utf-8?B?QTd6VmxZMlpOaDJ2UlExNFMxdi85T3F0Y3lldjNRL2lBWnQ5U0hpdzhla0xy?=
 =?utf-8?B?dHFlWXFVVUE0S3M3bEpWQm12VVgxYVhGc0VyTXZXQkZ1SUY0NUhWRG9KNlo0?=
 =?utf-8?B?aTVCdnlqRGpuUXdMeGZFeHRFUU1WQVZ5clRFTnpXYU9IL1plM1Z1NytVUFVF?=
 =?utf-8?B?VTlCVFhQSXFPWFR6V2RBaUdVUGh6WWN1aUdYMTZYYTJuS2QwYW1idGxnSGFO?=
 =?utf-8?B?Y1k2MWhSUEd6RkpIeHhSNzB2R2ZUWnBYOG1sNUttSEZUUTlHUk5RdlJHQTZz?=
 =?utf-8?B?cElhTnljbDZoN0dCRnE1YWRnS3EzaVdaeEJOV0V4RUVqZGN6TlRLYUhkcEJK?=
 =?utf-8?B?OFRPZ0VhT3FacGpuQk4ySUh4cXB3VVljSG02dDdhdDZRVWtpZ0V6U21yWi9y?=
 =?utf-8?B?UEk3SUlTWGhBdmlYNjRXQnBHRnZkMWozSS9iZ3pQdWdDWEtMMm9LVEZ0bG9C?=
 =?utf-8?B?bmpUdmZPMDg0Z1BxUW91MEdEQ0hEcGx5WmFkNm45SWJSeDlrZHhQMjZST0V4?=
 =?utf-8?B?WjdZOStZb0tNZWJpYm1TdDZ0U2lJNTBQNHpWWnNOdXU5OUIxZVFQTitDYUZX?=
 =?utf-8?B?K1pRekdndmJHZXdDanI4aEpNbVYvQmE0OXRQZUpHZEQyTzVPYXNCZ1d1VS8v?=
 =?utf-8?B?Y0o3L08zYzZBUjZHL2h0ZkpmcVNuc2tHazVhUkE1dWI4aU5UNUR6OUNsR1hT?=
 =?utf-8?B?c0x3VHpnVkVxM2o1N2U2b3BmV1Yzc1VEcFduNi9IRDJjbEQ5OUVBU1BiQlk0?=
 =?utf-8?B?VDFLb2k5U0cyS1hySVRpRU5kNjYzc2QwOExPeVhuMUJqa3BCalA3VVBEUW1L?=
 =?utf-8?B?RnJZQzdaUnU3c3lXa0RhOW42QjQ3eDhKTncrM3JnaEhDeDFVRHp5SjlMTHJE?=
 =?utf-8?B?N1VjRForakx2RU9wdkpGU1p6MmIxbWdSS0dBc2NMK0NBN1RFZ0xlOTNMR3ky?=
 =?utf-8?B?bm5qdU9ONlRoZzk4OEFaM0l6OFJMdDY3WWlMMVBDSE1WbU9OZFJvR24zWWo2?=
 =?utf-8?B?QXNETUszUEp4elhzR2NFditlS1E3MXBwNXpLYzhoRzRITTdZSXorVTJyR1c0?=
 =?utf-8?B?Rm13VS9SYVVHbVJKWjlaT2U3RGF4bk1FMlJ5WXpFem81YjJvTFJYZDEyZFl3?=
 =?utf-8?B?RkNBZGF1QmRmNjhKRkVmQzZOcEFPZ2RQZ3NPU1VRL2t1WXlWd3JWL2hEUmV4?=
 =?utf-8?B?L0Vkcm8zR3lLa3duaUxPZkhRSHlpSU1KQ1RmTXBjQk1SaGNYNkE5UnFPNUhG?=
 =?utf-8?B?ZVhPV3RlT3A3bU50QXRVMnBkRWUxK3h6UzY2bEt0UkI5MWd5aXo1S0wzcUkx?=
 =?utf-8?B?NDRRTWJkajcrdkxPZEk2U05TdWtsTmlLT29JZHF5U051NGREK3UzeWxnVmdQ?=
 =?utf-8?B?aXMxRS9rTUhWM1BFRllNbWdvdUhZSGY0bGdPSHdFS2sveWowNXJTSFRSMUJ6?=
 =?utf-8?B?dldYejNRM1FVbnZ4WGxCNko1OEVaMG5DUEsrQmZxNFRvd1ZoVjg0aks1cU5X?=
 =?utf-8?B?NGtrZUczbGw2Rkw4Q1RFcWxOQ3Z5THkzejdCcGNQUzdPUTB0SWRtT1ZORy96?=
 =?utf-8?Q?ewP9W+acozMFxyZWw5?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6a48673-5bda-4cd8-86f8-08deb4ceb3ae
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5179.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 11:15:00.7816
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cksKv6sc2fo+EZ3EBX3eZ+v5viXARTsq9r+/G+2z7RR/plVltmJebjz6A07OG2fiSxa5bCXlCVND9mPUWA60UA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8584


On 16/05/26 15:39, Krzysztof Kozlowski wrote:
> External email: Use caution opening links or attachments
>
>
> On Fri, May 15, 2026 at 10:49:11PM +0530, Sumit Gupta wrote:
>> Extend the Tegra264 MC dt-bindings header and tegra264_mc_clients
>> table to cover the full set of memory clients exposed by the SoC.
>> Client name is used for MC fault reporting. Clients managed by the
>> bandwidth manager in BPMP additionally carry their bpmp_id and type.
>>
>> Entries in tegra264_mc_clients[] are sorted in increasing order of
>> their client IDs, which matches the order of the override and
>> security register offsets used in previous SoCs.
>>
>> Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
>> ---
>>   drivers/memory/tegra/tegra264.c              | 564 +++++++++++++++++--
>>   include/dt-bindings/memory/nvidia,tegra264.h | 287 ++++++++++
>>   2 files changed, 819 insertions(+), 32 deletions(-)
>>
> Please run scripts/checkpatch.pl on the patches and fix reported
> warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
> patches and (probably) fix more warnings. Some warnings can be ignored,
> especially from --strict run, but the code here looks like it needs a
> fix. Feel free to get in touch if the warning is not clear.
>
> Best regards,
> Krzysztof
>

checkpatch.pl --strict reports one warning:
   WARNING: DT binding docs and includes should be a separate patch.

Will split the nvidia,tegra264.h changes into a separate patch in v2.

Thank you,
Sumit Gupta


