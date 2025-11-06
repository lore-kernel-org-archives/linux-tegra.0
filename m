Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010022.outbound.protection.outlook.com [52.101.85.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778AF31D757;
	Thu,  6 Nov 2025 12:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762430683; cv=fail; b=eu/DT5SDUTO6FCR1yXT/P980Vd5iMRdIWJomX0x/LoBp4xwfqCiELuqzxD7PbryNWGvTxw9m4LxbDiXE/gIlpJ9T7YEzWrehkXkcc7MOrruXdxumllJ8LsZOOIQfL+NaStrFtUDVSSoE7pGqxrHlI1HLN9vb3nlS1DInadvMmtA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762430683; c=relaxed/simple;
	bh=X52d/BJGfIFQJE/Ii2yRnc+GRnKWAbcdZ0y2CAgt/LI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jvN7AY/wI3Eb7/SuyojEWl3N1uTWIKRRTA7uLmbywmh5lnp2PI+1DRAIGYdM0if3TOK+NtTX1qXmodIGpzLypO6eFXQmz+AlC4yKaCspo7KWToxUkVU7isEUrzIzEiDDCRngb6iO90vkeJR85FUN8jUiJ4TbrlbMPEOqzP8EA0U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=El1gJV3D; arc=fail smtp.client-ip=52.101.85.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="El1gJV3D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SX1JBKAAYVtpL6gAL79UMpJWmH7qonhC1eMCRE8E+C1dBSJkzjPJD6uaD5HgL4jOkq2eSoAASa349s+SSJWMakVVldUDg9IbSfyeKDuciB0t+d/b+nkKqvKo7gt9dACY23l+N3JVhkcOhfpnKg3RkQHZ/XPMuKS9mmb0jkaKwFhcl4Q4s6fcQWW4BiU17zLDEIG2G6C9/r5+IW5dSZFuWJNqdIq0rfC6vVV+MBENS9Sh1/p1RWufbPPyPoK6522xIUUw2Y2lbk88RdraVD8AI+1r2lNy1SCye17N4NiaAcj9uESbzSVINc6TGPwavp4FbesGn/ur8R/H7FzH/YSIZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V20/LaMIEwLHo6LEXJ2ACvuz8VY7tyeg2aAcCt6FQYo=;
 b=fryDleq0qcaxSKBTiT0LcB2cftCvhEWjFdrFyYVXXM0b/KarrPVAPgeEUflOfrNKN1PirTe16ImMmPx1hNkSO0RbsxzUrmJFiQ5Q9wvsbpvMh4k9TejSG9eMKOOGekeR1IyOUYIVOgGUGdti1LMBBc6w/wUXxOgeL7yxDjohnbznLWRL1P6abWZwIMtvdTsiUCu8mMZEnnwomH9H6NR9XVkINFwpkX/9xgyJOGb8sF/u7dnBJzHw6zVsqw3mCW7ldSWZLPDHbEBbxIxnOEwyQQdnaTHAnPpatyuZF4ZGLc0j3sTeFVLPYN+1XNRvJXNHowlLoquWR7CprHccw85zYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V20/LaMIEwLHo6LEXJ2ACvuz8VY7tyeg2aAcCt6FQYo=;
 b=El1gJV3DBE31pF3gmb8YIBWG2NthEZm2FacdEifxvANK7ki106V0E1jSCArxyI0mBaHalErk2GTM4WTm60zgfgUmxIbF+hm6RK9tyf14By2jT4FNvYHssNfuYCCPIRkv4X3n3HOaMfFyqalDYBAb3/sXrreqvNI9lCSAFEWPvH6+SU4BDOYha02/uzNZHUeUzs3wmrUNvgw4U4vyMPKSUxSBu1782XsKaBs0oXBI2cuMREgokTI1UXTR6twpVtegUY4ltzUi0ySNsObwdSJFiKCS5KfEF73rFJebzktqm9K2pdrmRidxagQq5YYyrqohJLwTHg0oAmOOScjQkWMiuA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by MW3PR12MB4490.namprd12.prod.outlook.com (2603:10b6:303:2f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
 2025 12:04:37 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%4]) with mapi id 15.20.9298.007; Thu, 6 Nov 2025
 12:04:37 +0000
Message-ID: <4ba8a1ec-fa17-4564-a174-0b8e8eada061@nvidia.com>
Date: Thu, 6 Nov 2025 12:04:32 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/13] memory: tegra186-emc: Simplify and handle
 deferred probe with dev_err_probe()
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 Aaron Kling <webgeek1234@gmail.com>
References: <20250911-memory-tegra-cleanup-v2-0-d08022ff2f85@linaro.org>
 <20250911-memory-tegra-cleanup-v2-8-d08022ff2f85@linaro.org>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20250911-memory-tegra-cleanup-v2-8-d08022ff2f85@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0481.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::6) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|MW3PR12MB4490:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fc9bb03-3493-4136-8310-08de1d2ca839
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|10070799003|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MmhWWTQzVFkyQ0VKeWVlQjIySElpdTlkZWJuNmtaYkVpc1VtdHMySmVvcjJI?=
 =?utf-8?B?WXEzKzF5SFdaUDA0QW5NQ2xvWTZ5ZDVVZG1kSTZhZXhqemxTZzdsWkVIWThP?=
 =?utf-8?B?WTQ3TDNkeG43YnVxV2E3REEwZU9JWjhNWXlTOTg3SDFvWnJoUjlFZzNZK1Fp?=
 =?utf-8?B?RFVtekJKSloyM3JHbi9uOFhESG1DT0JaTmVCTWlFM2Vqb0pSazFvdmUwdDhY?=
 =?utf-8?B?RkJaeE95N2VkVk9UMC81Zm1JVllINzJwNFd4NnliOEdqdnVid3pWR3ZCMERX?=
 =?utf-8?B?M3YwODBTKzdxY2tUOGc3UUc1SmdTMnJIRlF0bGQvNVc5TlhmQ2NWSHVHanhT?=
 =?utf-8?B?Z3krT1A3bG5mU3UwVlgvRVIwL0swTHVJUjcxcDgvKzNWMmlwTk5UYWNEbkFy?=
 =?utf-8?B?SktQTmwxNktoQ1pOS2lBYWVISnQvb3Zta2F3VWZNRWdXbmo0WjRHTUh3VHRO?=
 =?utf-8?B?UE81NS80U3BnTmRZVzlTZ25yb2hnVzUvSUlJSUpBM1I1VE9tdmo1WjcxL0Vl?=
 =?utf-8?B?TVRsc2xqTUxnd2ZaOUZRa2NUMTFXOGpkejRleFczOXdtWFRIZHhvSEZIOG5L?=
 =?utf-8?B?Q2xJLzQ4cG5FNCtLUlluNElKZlNYSll1aGdINHgrOWVxeEMzUGQ2aG96Nmo3?=
 =?utf-8?B?L2tyRnZFbGQvWmVyRkpWUml2c1UvZ3NldU95NWRCNEhpNVVsNVRad2hhSHo5?=
 =?utf-8?B?Wkp6UU5kR2xqWjArUmc3ZGZpTjRQUDFUYU1jbHBreVhlVlJCc1NmdklkZ0Nk?=
 =?utf-8?B?Z3RiOHQveXo5NUNycldaR3FjWDd1T2V3ZzNvSnBYU2xVMkwwT21DNVhkdzZl?=
 =?utf-8?B?c3ZISGt4N2Y4SUc3TWFXMWZSV1dRY0hTd1htYXpsLzR0YllUL0RHUGVtWk9B?=
 =?utf-8?B?SWI2YUtIQzBNNG53MVRlZUFwcGEvZWhDMXE0d0tyWG1NS0ZGanNOVXhYTEdN?=
 =?utf-8?B?dHBwQ0YxeTZXRnpEanA3QmZHTmRjK2FRTit5dWlodjJIMWJZd2YwYVhOVFMr?=
 =?utf-8?B?dG5yb1M4V2QrTVlPMXVQd0JneGJWdnMyWEEwYlBrdklhSTAyemJMQitNNk1M?=
 =?utf-8?B?ZUhYUThUTGlnanRuTlZIZW5kTlJDYjlSS2NNTVZMVWgvbXZYMVJaY3cwUDJM?=
 =?utf-8?B?RXlXTnJqSGlUUURTQnJyc3VRdGducEZOem1yVStRcHc0bm1MbG0rbmROM24z?=
 =?utf-8?B?UVAxcVN2cysvMkFDc1JzSlc1K0tIOWFIb2VFeFJwQVNqLzRiVHRWd09KTW8w?=
 =?utf-8?B?dEsvbG5kRXltMHh5MGZWOHJEWXV2amI3YXRTTWxiTEpIZ3lZWWRvdHVZNllq?=
 =?utf-8?B?Q3hmRjM5SU1HSEZ0SWhVYVJpeE1ER0s1Mk1nOW5xU0RZS3Ixb0RmMEtEazAr?=
 =?utf-8?B?aklra1EyWnBmVXpsOHRnMzVHM1RER1BLb2tyRUhFSGVrMHJqQjNOMUJoZEVI?=
 =?utf-8?B?ODVoaGdTZ2drdTA1SFREUDd0N1pHb3QyVlpaaGhuVWd3a1FyNVZ1enhmL0E3?=
 =?utf-8?B?VVRLMDRCYVVPdy9hYnZNL3Mxd2NzUFlBb3l1S285akZjUWZwWHpiUi9KMTFB?=
 =?utf-8?B?U1JicHFoMnpPMGpKeGJIbTFBeHZDK2NDLzExSHN1V29pTk84UW5WeXF5U0Mr?=
 =?utf-8?B?eEhyb1ZjSUhJSUtnMDlmS3hyalJtRStDcjN6RnEwRzJwSzhqQWYwWFlqL1d0?=
 =?utf-8?B?VThGTWxBRmpuL1J2WFJPK2c4UkI1aktIemx0czV3WTZ4TE40dXJFQjRtNEdt?=
 =?utf-8?B?L0IvSlR3TWlwRUs0Y090RnFsa0tXSzd0SWdPR3ZtMG9leFVkTjJ3YWhmU0tz?=
 =?utf-8?B?V2VVaUVmeExLaGVIR29hM1NHd3JaeE91elZkMmoxcW43TWUvMVllN1VIVGpL?=
 =?utf-8?B?cWdIRVNrVXJBbGlYcDFYemV2MDB6VU91ZnNmc0JkMVJ2a0x3QmlRUFBBeEg3?=
 =?utf-8?Q?3GIX57wdbrXo8uV3IASZt8eLJlTs6ass?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aGZEZHdRSGtEQVRab2JDZnB1T0NMbnpaZEN3RnQybjJDRXM4a1h2dHRNbEhp?=
 =?utf-8?B?YjFtbitvcnRSTkFNWWZXLzlOaXk5QVdXbFhRVEhKTC80ZzFtYWpBeXpxR1Nk?=
 =?utf-8?B?U2JQc0JDZk1Rc0ZvUE1wb1B6elVhZVg2M05pSGREa1VvSkJqZ2FWRFByMUhj?=
 =?utf-8?B?NjhFTUltTmVzd1lpOEh0SThDdzduQTB5NHlxbE45YmRJU1FMY3YyLzlCbzJl?=
 =?utf-8?B?TVd4TFN5bWU4UlhMYmhUcFZ0L3N1RDBYUUx3M2xvSU8zblJwemEwWXkxNWlF?=
 =?utf-8?B?Vi9JYTBlQk9WaXBYYjRtVDlkMnZZVGoxek1vMjY0T2VkS1AvL1ZVRW9VdFU2?=
 =?utf-8?B?YVdPcWxzZHBHcEZoM1VjTElCL0M4cjdNMjFDdmFyWWFHQ0hLYVowbE1telBk?=
 =?utf-8?B?VE5iU0czdENsTDB5SmhvMHNONFZEanZ4WVhGdGNvSW42ZUdubHJiTHNZRUVn?=
 =?utf-8?B?aXpTcUkvbmFJVWtnbGYxNlJrMmNVaTRSS3ZRZlFYT3FFRTl6YzZsVEpkTFBz?=
 =?utf-8?B?RTk4MmRxOCt6SlAzRkdVRm9JNkhPWkp2dmJ3YjFiZXJQUDAxN0g0ajcyMm12?=
 =?utf-8?B?N1BMWG4xQ2xmV2MrT2FLb29uRjREdXlDTkF2L3dSYWRDaFVJOGVLSTVjNmRD?=
 =?utf-8?B?MUFzVi9XcWRGV3laTFU5emJlQnZVbHpJTWZLdGlCVWU5MytnTmlEczRyRlNC?=
 =?utf-8?B?cDh3bS8weFdIcmZhSTR0bUhienc4c0Vad2FnZUY2WC9OWlhZUzZiMWVtcHFJ?=
 =?utf-8?B?R255dW5KRCsyVlZEU01kbytNSHpoUm9TSlVqd0dyaTJKeTczSlljaTVIQTJh?=
 =?utf-8?B?WlgwVWJ4VjlLZ0Rvbk5WdWpCSXo1VUVDcERYK1huYnVQQVNuN2FLVEdmb2d4?=
 =?utf-8?B?YWVwWW5qZkpOcng0QjBZeHpxRlFxbW9vMmpMdCt1ZGVWUDdabFhzdXBPTDg4?=
 =?utf-8?B?U1k0OGZDakJFWEplQ3pObGtTUEJienFQSCtCbnJVN2FsL2N3a2JaOUtza2dX?=
 =?utf-8?B?OGNCRm9QNWk3TGppQzliNThJYVNqeXJWVU55Vko2d2U1SFpMSTVMMUptSENK?=
 =?utf-8?B?ZlNUTUMrY1ZqMmRKUjhuWnh4U203SjJmL1I1Z3lCUG96czVid3k2Mk9QR0lw?=
 =?utf-8?B?dXlLNWlkK1JMZU5Ga094bjVvNVZhaytPeXFEL0RLTFBiMlo3UEZKNUQzYXVv?=
 =?utf-8?B?VnNoZk9sWTNLcHZod1lZeEpqelBzWXRvbGd5MTcraXZTdkE1YWNlZlJ0M1F2?=
 =?utf-8?B?WmJueXkzZXN4SkJyYTdpaGRydjFVRkxDTTNmZ0N3dldUSG9za1k2emVmZTVN?=
 =?utf-8?B?ejM2akpRYTQ2YThwTHhiNzBPcXZFLzY0Zys2LzdKazdYV3VndkJ1WXFiTWpt?=
 =?utf-8?B?SFhuQnNIZ25kS21YMUhXT25FVHlTR1pheXVTcG1wN2pjaVpyVys4NTVWVC9Z?=
 =?utf-8?B?RGk3WTJWdmUxNmI0QnhaTVZ3UGdOdmhVMy9iU05UeWVzOWhaRTBsanJmNTJK?=
 =?utf-8?B?VVhMWUM1RVU2RjlrM0pNbURlL0dHcmRWNlBuQjRJbUpHUTVaM2U4TkU0V2Rn?=
 =?utf-8?B?eGRCbFVjdTlZK0tGRCtEOGl4ZlNOWi8rZ1VtdWYzMS9RQ0dnVlRVN0tFL25J?=
 =?utf-8?B?NXpNTm5zTUE3RktnSlNIYnRlczFJOGRIenAraHJoSmJWWW82OUl6YksyVW5x?=
 =?utf-8?B?QVl4TXlOTXA2NlBnOUJwek1KN04xcEJObGhDbkZuVW9tdlkvc0FpKzhSZmdW?=
 =?utf-8?B?SThqWHBybTVKK1lNcVdTbTErV0NHRktVN1BZK3NkUklxRHlEUDBiQXlJVGN3?=
 =?utf-8?B?azhaa0lJREFNR2piaWFxcWVHOVNLVk04bzJVQTVnako4djQ0elZnVzZQREt4?=
 =?utf-8?B?V1RicWs1TFBEL2xyM2prbjBMcUcrMkJrcHEzc1VvaE5PeW9jb1F6MDRncVhh?=
 =?utf-8?B?bjl3ZDJXNUF4YzhPeXY0bUhUOWFsblpsdVdjTWF6T2pwSytkVTgydTlndEdG?=
 =?utf-8?B?MUt6RDA5TE53TS9wbk05dmRVVXlFbWxFYzJjcHhTVEVqeDNacXVsTmtEZUNT?=
 =?utf-8?B?aklSRFRGZUdiOXBjeHg0MUIxMWRtV0JVTTg1d0V6WEZOYkxBWVBaR255a3NU?=
 =?utf-8?B?Qzhna0p6K2N5M2IrVXVaWDVoWXloVjdiV1YvRmpWWXVsendTY1V2VmJDUllz?=
 =?utf-8?B?R0hVWHV5TFJlVzdQa2xJRm9aRTBzU0dOVDRHcGszNmxhTExMUEQ1QTI2enVZ?=
 =?utf-8?B?Q3JaeGJIQlhuQmR1SnFCS1FCdlFnPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fc9bb03-3493-4136-8310-08de1d2ca839
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 12:04:37.3955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AbFUG7zGi6w+wz8U4K400ig+dbn6GAUlAOz9WqDlvDgbM5vzAoOkQSAtGWzboL9HcA/Ok/raTb3jPjM+op+BkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4490


On 11/09/2025 10:43, Krzysztof Kozlowski wrote:
> Certain calls, like clk_get, can cause probe deferral and driver should
> handle it.  Use dev_err_probe() to fix that and also change other
> non-deferred errors cases to make the code simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   drivers/memory/tegra/tegra186-emc.c | 14 ++++++--------
>   1 file changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/memory/tegra/tegra186-emc.c b/drivers/memory/tegra/tegra186-emc.c
> index 00baa7ab89214b1a151ab0c0a9ab76f90f922478..a0de80afe3e90531fcfb29d20773aed0d04478c5 100644
> --- a/drivers/memory/tegra/tegra186-emc.c
> +++ b/drivers/memory/tegra/tegra186-emc.c
> @@ -302,9 +302,8 @@ static int tegra_emc_interconnect_init(struct tegra186_emc *emc)
>   
>   remove_nodes:
>   	icc_nodes_remove(&emc->provider);
> -	dev_err(emc->dev, "failed to initialize ICC: %d\n", err);
>   
> -	return err;
> +	return dev_err_probe(emc->dev, err, "failed to initialize ICC\n");
>   }
>   
>   static int tegra186_emc_probe(struct platform_device *pdev)
> @@ -319,14 +318,13 @@ static int tegra186_emc_probe(struct platform_device *pdev)
>   
>   	emc->bpmp = tegra_bpmp_get(&pdev->dev);
>   	if (IS_ERR(emc->bpmp))
> -		return dev_err_probe(&pdev->dev, PTR_ERR(emc->bpmp), "failed to get BPMP\n");
> +		return dev_err_probe(&pdev->dev, PTR_ERR(emc->bpmp),
> +				     "failed to get BPMP\n");
>   
>   	emc->clk = devm_clk_get(&pdev->dev, "emc");
> -	if (IS_ERR(emc->clk)) {
> -		err = PTR_ERR(emc->clk);
> -		dev_err(&pdev->dev, "failed to get EMC clock: %d\n", err);
> -		goto put_bpmp;
> -	}
> +	if (IS_ERR(emc->clk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(emc->clk),
> +				     "failed to get EMC clock\n");

I see now that we dropped a 'put_bpmp' here and we should not have. I 
see this is in -next, do you want fix up or I can send a patch?

Thanks
Jon

-- 
nvpublic

