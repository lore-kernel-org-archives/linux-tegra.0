Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010024.outbound.protection.outlook.com [52.101.56.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C943D7D97;
	Thu, 30 Apr 2026 11:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777549335; cv=fail; b=DhRS/jQGZs4OBT+AeEazz4p9CSihPqTHdXfoEHE7ZuKzOMprcBfYuqzsgyxA1DTxjqDG9heMcNb+EV7hTai2f44iLGMXSFZn7/h1oCFO/1VViARLSoHP412+ckJ98HkwaZdogjxt8dhnm/2MJEABfeM63ET9CQgu8U3sCZPSjvU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777549335; c=relaxed/simple;
	bh=LzL7Yq+8Nx27jMB2tJ1w+vcZUU3ynkETLj4ecLbuFIs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=G9MqqtQfMm8yWfxHt86gpcyPP8qV9DK52kM25cBSii1gnIpLFCZ5FntdFJS/FHGUWAqxizHjskZkQAFqbxMiTTb8Fukf6tGej9i45l32v0kmx2bSyTy8twhIRQ726Dgj3N/ke/luqt2zrffLVZQUurMHs87vtI8HIVPTd40pB9Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Z7KhV9wh; arc=fail smtp.client-ip=52.101.56.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Z7KhV9wh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qPmXiG8dEEEqvTrd1iYKi94KBkk8ncH1JiyTV8J7So4vcZflBW1I/2/ovVbFF+gtpdaH9OB4uS3J8ff/SkhWjXFkW9QhpS5br28+5xL6O9ZepgHeEkdfskKP4bYeC7mXuo3jvRqyHddNUMs3Rgo3aXpVNYXv5Wnpc235Rj+UR09PSTwxcj4MEZ2kogoVW+g+a03Ri9YNWnnRhVcoMhKnIungPvuN/NRbhvXrZSW+bw7elxvJJ3Rj3TIZvg04AJ8sNIqy5cq915Rw7JybluR6zDroKcXUJkzGaTDuLyTfBtmOcFDiaqdXauZ3iftijhzYR0zoGqt1LGJqBzXIyfnO+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X9x3XjXOnhK+FrCtkLiT2YEu1Wr3fuk4HEllLs3boR0=;
 b=Yc9f9xum1yiQk+5g0gAtqdbz18xeDKYxiq4jrWBDc3DUJxj2tJy410murNZT0FwoqyJklkf4E4c2PrFSb/4PDH1RU0hDjXyWd9nXsz/xJiEL3jjAo4p2mG8uO3qI3WV4VCijVF6MG1W1K1L/yRAN/qwud3KvzH852m/e6MzwTNd5ghNXeydDDCIQWsVXgGyfRxloioSWD26F5ZE4gInAQROnL3oiqpUdfXj0xz9CTcBvZonBV6RjtdwgodLlxSipmja4qFi4sdzoYbGbT3k8CG8X7fdm3C8QRZKV8Kyofm9r0Lx8m+snuHeGab2x7t39dQLzgAiowJJrzUYH55kEOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X9x3XjXOnhK+FrCtkLiT2YEu1Wr3fuk4HEllLs3boR0=;
 b=Z7KhV9whGGnmNcQ8/pj8MGxJb4S1shzIXIJughdteiRKy5O86fSZLlhOj0FbyLYDNQtp90WV/z2y43UXsZCzMv6VkJTvzV6XX4jRkxtAIUAI03w3rpDVHSCob2FXSeJvEzM6+L7BLqYpn1MNGHBMAsJztoSPqEkPVNbzxAg/YzRlxc1ytjj7QEuK3F1ovNmiNHxxI9LcQ7rXUIz/waWfFjkQ9NngFDNNB5z0WZBkimBSlNE2D6dDXLzFpuCgNNMi3ABmTUAjKP5k95TX9YVvIx0L5f7hprfoMfmtoeLieNuhTBrblFlOiWadzf5H+HHM16vsT5Iouj4olkpGZdcQEQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by DS5PPFB8FBD73EA.namprd12.prod.outlook.com (2603:10b6:f:fc00::65e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.21; Thu, 30 Apr
 2026 11:42:08 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%6]) with mapi id 15.20.9870.020; Thu, 30 Apr 2026
 11:42:08 +0000
Message-ID: <df25dd7a-1f59-4fd5-bdae-ba3a99e700f1@nvidia.com>
Date: Thu, 30 Apr 2026 12:42:03 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 3/3] memory: tegra: Restore MC interrupt masks on
 resume
To: Ashish Mhetre <amhetre@nvidia.com>, krzk@kernel.org,
 thierry.reding@kernel.org
Cc: ketanp@nvidia.com, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org
References: <20260430095202.1167651-1-amhetre@nvidia.com>
 <20260430095202.1167651-4-amhetre@nvidia.com>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20260430095202.1167651-4-amhetre@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0300.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::24) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|DS5PPFB8FBD73EA:EE_
X-MS-Office365-Filtering-Correlation-Id: a19fc6a4-5c86-4d61-534b-08dea6ad824f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	utVXruafwCNkI4sSzu25kA2zeU5uf01ieCzOmKgjAq0TV1ovCYiNtT6BDulvngMqNvvN4SPvy3K9Ajk64lLYdoDzVn0cKyEE23evIT7S3BBhGnjptGaUgj9Bwkv+X5P5ZnBv1KcgqikN5T8esgBQkZTOHL/9nYkX7/pDPykEGEdz4rcWOSApGU7s6k3Bs12Qb4TG6BPVJvsNfuezRUVLgdeT+5kGIIEJAgav71yCxJYQKWRMoNu4mHs1ToJSuVnHbJEg3Chm5nLfZoa+kFRNeXKW7y4JNXxDGbyAtjppTKONbKmpG5RHHe2VvU7e61oJEdOde1o+wWhxi2ZAzNKSlpbTL512eIfwoVz3j5Hyow69dGwvPnbydaiplDpBFxKji5YY8ZruPZhcbJZz4Mw7EyLGb7BjD1rDR4GCXW0HWGysWC/wD7Ox5sfDbkiMTS1+/PJP/c1lTBDRbLDKoJGFddUX1j+ASSYemh1u4WgxOkEFnFDycI900DxozRDv4RqQyiPkcOOLr+09/oj6+wSLqt2RftlQKtd/U8vduyt1zXr2eDRZ6Ojy/ANxFcBriaue9U7I+oLnVgVKauiSBPMOhTWO0S1fAxhW+zbi56CXnivOQaoZr+DqAOgpXfxzTWTg+XNNI/t0f+v2BHngmvY0A4lXs2epUUKuc7IWOBwaTsxs7lvEFiYqINoKT/XUKyhuDvImKExxJTHFgCrvuRZ+5RflkqM8bq8EgcudBBWwhOM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dWl0RXV3Q1FqQ0RmcmxQOENGY2pDYUJMT0V0SElZc1p5TVBYWXRZc3h2bENK?=
 =?utf-8?B?YlhyaHVTUWkyOHkwY2xzTmlzbUNYa2l6ZUVmR0ZySWJGMWZyT3FuNURsbEw1?=
 =?utf-8?B?VHVSSGtFVzhJWERlUUV2OFkxMmlPVW8wRTNma0c5c1ZielBlMVhkR0hiSmp6?=
 =?utf-8?B?bTJVREQyZFh1bE5uaDV2THlJWWI3STZRT0xCakZBVnYwNUJnTzZEZ04wTGpn?=
 =?utf-8?B?Z05vUkdheDlKVWJjbEZmNE4rRkRWbGdTR2lmRUNKUVNiUDhYTkdGTFFldG1i?=
 =?utf-8?B?RFJjcy95anpHZUpMcGU2dGxOaVJXbSs0OGpHbVV2SkpqcGZTOWdGSXloSkhP?=
 =?utf-8?B?c0V6Q1JRS2IwdkxQTlljT1RjMkhoSkk0Mi93YmRLTjVuUkdWY0pDMDB2OHIx?=
 =?utf-8?B?Z2xpaDh4amZCSlovbVR2L0N0Qy9IS2M4Y1c1aC9nMDJiTk5wSXUwbnB1N0FU?=
 =?utf-8?B?QzM4SW96TWU0dkp5ZmNRdm1ndGxsU1kyZkRSNDAxZWdSWkwwTk9ZUlpOUXls?=
 =?utf-8?B?aDBOZzN4V2V1WTNhYjh1Sm5uSzdjMFNXYlhKWTVKSW0ybEpxQ0M5cERwVkIw?=
 =?utf-8?B?dUFVR0U0eThqMzBBRjlQT1NxN1lwQ3NlaVdpMWwvb0RxTmdkQ2w4NTRqanY4?=
 =?utf-8?B?S0E3bmlNWndFYzhYUC8zQVRMQWQxZmtuOVpTTXFEbDlUZkpDZUJyclZpVUlK?=
 =?utf-8?B?dlZNbnlOcHpDVU9Cbk43N1JmV1N4MTBmMklpUWtaY1I4eFA1dURDWE9rUmVk?=
 =?utf-8?B?czZJQmhHVnpYY0lUTDc2bmpqWjArbzdBV3RJalRnc0YyYVh6L0RtcmJNRnVI?=
 =?utf-8?B?S0ZadTJuNlIxTldtZk1FOVdJNGZFRVUwdFVFcit2VFA0eGZrZ1JCUnFRRURp?=
 =?utf-8?B?NmpXOEhPUDJZRUNiS3ZzUnhsMXN0bi85bFFUTW5BTnp2Vm5XZnBiV2I3V2U3?=
 =?utf-8?B?Vk9iczZ3SEhYbFBUTHhKWjJLVmk4bkVVWGVpVUkxUXhpZDI3N3JEYXBVT0dj?=
 =?utf-8?B?M0tjbDNsbUpMT1pnNnprTzV3NjBYRkxEZ3RSVjlzQW5uZHFjdEpiTy8xNmVo?=
 =?utf-8?B?Wk9CTmtrdFF3czN0TnNpSEtxRnlKMEZGMjc5azVwQUovcTQxQXhEWU1xWVBR?=
 =?utf-8?B?NGp3Y1o5TS9vQTVLMHM5MGtrdDBlVVZsRzY4ZXZNUm1ZR1l0YkdyV0s1QUR0?=
 =?utf-8?B?S1VabFFJSUFLdVljMDRGSzJNVEd4djR4eW43a1o3eHBXNDgyWUVRaGRjdWUx?=
 =?utf-8?B?VTVNZTMxakc3WkswM1FWVEJkbWNzalFURCswcU9wV3BuTUFJeGRVeU1OQzh5?=
 =?utf-8?B?Tm5tY1VsOFpHY2dtU1BhSDd5c3V0ankzREViaXJqMk8raXdrRjZ6Y3FkenNH?=
 =?utf-8?B?c1psa0dJaHM1ODRLa0pMTUxEVlJMMzUwYkdMTWNtUnFwR0FWRGdtei9La3Rw?=
 =?utf-8?B?T1hveDdhVFd6Sm9rZG9Ua3NRNlNRdEFZUGhOYWMwUGVKaVNqZHFkajBNVkJu?=
 =?utf-8?B?am05Yk03bmVybHZ1RURVdWQzNFpGWVZSTjREK0lwNy8xd0x2UGl3OEpMMEha?=
 =?utf-8?B?QnB5L2dZbGx6ZjNzWGdqVVFvS3NteUdmVTRJaEpUdUN3SEJGNXNPUkU4ZFh1?=
 =?utf-8?B?TmIrcExpanR0cXZoZVJCRlVoU1VQcFIwbUdIRTR3NjJHeHd6TWhwSTdlUFQ0?=
 =?utf-8?B?ZTZZRU9RRlJsNGZEWG5xUGxMMEwxZHFHTVVCRTZIcG1IOUhPaUJocHpBNmtM?=
 =?utf-8?B?TExEOXlCNkducnpuYWwrWUpOK2VCYkZOb2crYUVGMFFicU9DSTJ2U0U1MGQv?=
 =?utf-8?B?LzUyVlBwNkZRMjNNRFgrTkpzUVVoV24rSHVVeDdsd3o3bE5MM2hVbjlvcFR4?=
 =?utf-8?B?aUYzK0pXMDlVVjJrbXljQ21UQmIrU3pNMFdYc21hN1B5Q29Pb1l1QVd0SDNH?=
 =?utf-8?B?VTdUV0NCMlBqaGVNOUUxWVZsc3VNZTlvNjBRR3RaQkRIbC90NXZUS1NFZUtT?=
 =?utf-8?B?ZlIrdzI1djR0SXhCVmJ1TWxUYm5YRFZjdVBGWjZkc3FRbm9kZEVFVk5DT3lC?=
 =?utf-8?B?RVZ5SHl5NVRhWUNHdksrMEdGekNnSWRxZWVKVHluOS83Z3BCWHJFYmdUTjRv?=
 =?utf-8?B?djU2elZJQ093RHhNWmNmUStJc0RyVzl1c2dsemoyT0thYjAvOWN5eW1Ya2N4?=
 =?utf-8?B?WkI3OER2N1ptcUJ3eXZhb2huZ3dwWWszNFBmSU9ON3c0SEFYUU5VN1ZqZDlC?=
 =?utf-8?B?V25HYnhWdXdCWXZBa3dWWHVmR0hJbXJDVitmc3FzMzBYb1dJVERaWXBYQzFs?=
 =?utf-8?B?ekZZQmloQlJaaXlCSGczN2VtSmQ2dUdyNVRIWWw2RHk4NEd1UUMxQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a19fc6a4-5c86-4d61-534b-08dea6ad824f
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 11:42:08.0923
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZZXEshiDbNj5WQ7/FQ0lRMMzE0wnkHbQisrVRiU9WFSJmNyFjQPAkH2aQlJJ1UPxQMNy7hZDmaSP4tcVWhjN1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPFB8FBD73EA


On 30/04/2026 10:52, Ashish Mhetre wrote:
> The MC interrupt mask registers lose their state across SC7. Without

SC7 may not mean anything to anyone that is not familiar with Tegra. I 
often refer to this as 'Tegra low power suspend state (aka. SC7)'. Or we 
can just simply say 'suspend' instead of 'SC7'.

Krzysztof, do you want use to clarify this and update the commit message?

> re-applying them on resume, MC interrupts that were enabled at probe
> remain masked after wake, so any post-resume MC error goes unreported.
> 
> Factor the existing intmask programming out of tegra_mc_probe() into
> tegra_mc_setup_intmask() and reuse it from the system resume callback
> so the mask state is restored on wake.
> 
> Signed-off-by: Ashish Mhetre <amhetre@nvidia.com>
> ---
>   drivers/memory/tegra/mc.c | 23 ++++++++++++++++-------
>   1 file changed, 16 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
> index 64e41338cdf2..cfcfc7291106 100644
> --- a/drivers/memory/tegra/mc.c
> +++ b/drivers/memory/tegra/mc.c
> @@ -911,6 +911,19 @@ static void tegra_mc_num_channel_enabled(struct tegra_mc *mc)
>   	}
>   }
>   
> +static void tegra_mc_setup_intmask(struct tegra_mc *mc)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < mc->soc->num_intmasks; i++) {
> +		if (mc->soc->num_channels)
> +			mc_ch_writel(mc, MC_BROADCAST_CHANNEL, mc->soc->intmasks[i].mask,
> +				     mc->soc->intmasks[i].reg);
> +		else
> +			mc_writel(mc, mc->soc->intmasks[i].mask, mc->soc->intmasks[i].reg);
> +	}
> +}
> +
>   static int tegra_mc_probe(struct platform_device *pdev)
>   {
>   	struct tegra_mc *mc;
> @@ -971,13 +984,7 @@ static int tegra_mc_probe(struct platform_device *pdev)
>   			}
>   		}
>   
> -		for (i = 0; i < mc->soc->num_intmasks; i++) {
> -			if (mc->soc->num_channels)
> -				mc_ch_writel(mc, MC_BROADCAST_CHANNEL, mc->soc->intmasks[i].mask,
> -					     mc->soc->intmasks[i].reg);
> -			else
> -				mc_writel(mc, mc->soc->intmasks[i].mask, mc->soc->intmasks[i].reg);
> -		}
> +		tegra_mc_setup_intmask(mc);
>   	}
>   
>   	if (mc->soc->reset_ops) {
> @@ -1018,6 +1025,8 @@ static int tegra_mc_resume(struct device *dev)
>   	if (mc->soc->ops && mc->soc->ops->resume)
>   		mc->soc->ops->resume(mc);
>   
> +	tegra_mc_setup_intmask(mc);
> +
>   	return 0;
>   }
>   

Otherwise this looks good to me.

Jon

-- 
nvpublic

