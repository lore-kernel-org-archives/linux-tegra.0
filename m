Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013069.outbound.protection.outlook.com [40.93.196.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F51C8EB;
	Tue,  1 Sep 2026 04:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788238158; cv=fail; b=XBu6X9zrgyQx3eiaI4bvv/3iPAijR+O7V7m1XiXjhgjNVADzQ71/nzpg2gTrLLV85YDFg+HxhsyTYwKLRtCDW4KcE/vTKSOwYYalwA9QZC0KPAKlbD6vasu6kjiOM3xnz18SWnoGWmdR8rwfO4strBKZ/hAjyv1oE2rRf+ZWG3o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788238158; c=relaxed/simple;
	bh=YGpldCa+yHx1RAmWlVP18euXpiGShBbSl8GPrjOsTkU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=eaY3GayEvdW9JChgYLw5NbdUlCl3sLyYGu1ji2A2ZmwJDyBWp9OZESld0KG+xFOX6B5tzIN3QMMOjCoszgtTIWYBr03iODH38oS+gE6VTIYmXtXD+ooswNFj+7MKtMddBZVBMjkp7xFfcMSAnTrHDbBeqe1C5oOjMEvLgerdGqo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Y46yzzhp; arc=fail smtp.client-ip=40.93.196.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Y46yzzhp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ixao86lrrGpv5c589s5obZXVPQdtgmEbw4Lc1VaYs1YPxpKLap5tctiMKKjn/0xXsKObj8dzn93EozZEtOekNnOPkttd2AjySHZ372Tnu32aSuuyCkVoqK30YTBVWmV5E4KjG/Y0jwD43/ztiOEIjhVha34a5/PgPJhMHh7XhDKI0mEj97XC3ck88t0ICgl16Nkd9VG7wqgC1OFSMNMg80ki9mL250ePD7gv4nAGP0vVCfr3nebY+s1GoBnA2TqGftD3OyFcKp4XLDErT8Bcyp6rxl4LThq1LTQObNJ637XinEr2HNC4CAOBiAj1ftVrhprz/6x7HWYduwtFJFKorA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lqlCGYHN5ifmi5ML8plrtfU+1QmDGp1JXbennJ9R7Lw=;
 b=VGyQ1ljFaxnOycJhrZ/KEaDal07bpAyS2l6T2rSwc5wJiqe+LXlGR2QBiyKnlyvAHXsfHRC0TrbcMxS9mALsRr3mCKWQ0X2vnem4iYXZAjMdFOK+0R6LkuUWUoYfR31TVZ9Yfnip3+N4YzWL1tAqlhsoCuOvfOkNIOJdAkS6KdxevJvDfhLvmh7gHP0ysq9I/hrQyyZ0purPbmhbtbdjoYmn6f7poTy5Xs4eSGYCtUwdKKgFBtfUsFd03TkIqezlrLY68NvOlZvbMHGMTTlg+Wvr1aHUlMMm7gVtHKw1DBltPRdFerC+eMsFXLqpy0Yz9AkHTbybQ6g2G7J99VK5Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lqlCGYHN5ifmi5ML8plrtfU+1QmDGp1JXbennJ9R7Lw=;
 b=Y46yzzhpLukBysevuUK89lyALC0cwWNRxykEdZuZdfTW+E1pU13m6kqzwyZq5L9ZFnLTLlUMyejTbcArvD7LF79zprADp9q0RBQEYG/gb6is+byX7T4L3uoahHogyRHH1V6wYG7Kro350OoAGJ1UQ295IlvcmY7c0cZLPW1iZa+GUsmpwUYhFQkDe9PaWd4kzkI8EBLhpI9b97AQBM/HgQsdCJVSG9e4tGUBENTnSaJm3zS697GUtLFhKBlrituxlcJQaqSTZzD8+dlb8e1hoLoi1/Le7XmJtB93K1JvhtwWbjZZM6DjtOr5sk4zL9eK61JnM9sBo8h+ZE27UeDBvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA1PR12MB6329.namprd12.prod.outlook.com (2603:10b6:208:3e5::19)
 by CH2PR12MB4120.namprd12.prod.outlook.com (2603:10b6:610:7b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 04:49:14 +0000
Received: from IA1PR12MB6329.namprd12.prod.outlook.com
 ([fe80::eadc:c846:73e9:8ccc]) by IA1PR12MB6329.namprd12.prod.outlook.com
 ([fe80::eadc:c846:73e9:8ccc%4]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 04:49:14 +0000
Message-ID: <ad6a2528-c2ca-452e-8648-27325ca3adf0@nvidia.com>
Date: Mon, 31 Aug 2026 21:49:10 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hte: tegra194: Remove redundant dev_err()
To: Pan Chuang <panchuang@vivo.com>,
 Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 "open list:HTE SUBSYSTEM" <timestamp@lists.linux.dev>,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
Cc: Mikko Perttunen <mperttunen@nvidia.com>
References: <20260716073416.530829-1-panchuang@vivo.com>
Content-Language: en-US
X-Nvconfidentiality: public
From: Dipen Patel <dipenp@nvidia.com>
In-Reply-To: <20260716073416.530829-1-panchuang@vivo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0320.namprd03.prod.outlook.com
 (2603:10b6:303:dd::25) To IA1PR12MB6329.namprd12.prod.outlook.com
 (2603:10b6:208:3e5::19)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6329:EE_|CH2PR12MB4120:EE_
X-MS-Office365-Filtering-Correlation-Id: 75dca0ea-00a3-4060-bfbf-08df07e45f15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|6133799003|22082099003|18002099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	dHkNzC/UTj4BC2Ru6dETi/SESqT9K5DZnYR4wubSDsX9tNeE+TnCSLjeOzx6zQG+zAk5GmtZlscIc8S10yvwZ5zUKRTvT99wWi0ws2gGbvNZa8wGf+D4A2TJ3nkCW9uxjFQ+CUIcaQfAah7aSDqY4r05WmbousD0LxecKrHQ70gFT7/UNj6sbq3rS4jp304x8Br/RNpx5gJIOaiTwCJtKzqUtlpgRqMKRolFFV8n3buXETx5LpT7FW7xzQ8dm9dk3Le9JD27ZfNOipDHpx9BeuUuEB+ql1idE5jFJpdUkIY7AvzilYF4KqDxy4PcWUhP9C1vVNc/8TDTftvR53XkGTSt1kixHFmnEX/5Po3H4/nhoI2Tety7uqvPoOXjBGTceixDdWnCSWdiIcTplGQzdHXzBxoBj5CKmJaxi5G+c2iyu6W3rpptG0OuniqlLG8zFErNcXGnVpIpdOA6J8f9/zGxPgkxAwXHYkLr7fNI/gq/8kmuSYwT1sEpiX3vWbnQQGfp4dqa9H7BW6W8uoF4XcwZryqgo0WAF/jznUJqvblIoQpqkEWEP4I1Ba7GG9NikO62UHhTFY8HPEJukbuxEwzDqbvpM4FFRR8pZe8UcT9ZgMTdI5bnmgiDTbaBIlgpzPNJGIdluMXw+x/LiN3nciBTdwmkBGLzQ/Jh0WHVBxE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB6329.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(6133799003)(22082099003)(18002099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a1dLVWRSV20ydzlkQ0tHKzI1VVQrbDdJVE5pdGVNNytoQTY0UkV0ckZWTzNT?=
 =?utf-8?B?Skdmck8rcFJsTlhSWEk2QndDVC9yS1duK3pkUVRpZkxTMmpEMGxNTzFMa2oy?=
 =?utf-8?B?RTg3cEt4eDI4dmk3a216cjJCUjJYRllhMTdIRHdIVTlPTmdNWDZxOTkyWEtO?=
 =?utf-8?B?ZHE0cnVxbHIvWDNSd0xCQ2pIb1pPYXBkZ29kbUsrbll1cXhHVWhuMjR4bWlW?=
 =?utf-8?B?NEVqaktyNUIxTnR2MGZ5eWZaMm53elBFTDAzTS9nbmRSYm8rM2NJbkFzNVhT?=
 =?utf-8?B?RnJTZHFmdldqMk9RNWZ1NlZJOXM2UE0xMy9NRWtaZVUzTUIwUWFCQm1FcGZT?=
 =?utf-8?B?RVpSKzQ3YlFpSzB6cW4vQWV6WWZLNmQxSVZTUEgyQ2d3WFRwMWdSQXg2T1pq?=
 =?utf-8?B?R1BBL1h5L0N6TFpJa0kzK21saENVbmdLTU1UdkowUzVLcWZOMzR4UDJ6Y1hZ?=
 =?utf-8?B?V0U4UDBtbXdKTXVzTUJGcmRVNjMxWGY5QkxMSkxZVWVBdEJtK0lPR3BDWmZO?=
 =?utf-8?B?cUh6WGhOa2NLZzFhQXVkR1czSHdLUUVnbFBodytjWUdBM25vV3QyT2NTSEZS?=
 =?utf-8?B?MTg2Y3JDQ0Y3L25hLys4b0htRHNhYnU1MUZheEw3OHpNQ0tjRmljRGg1d2tq?=
 =?utf-8?B?TWlxUUJWU0o3MldLWndPdlVTbmlPSE5vTzkwTzExTVNuWEtWdytBYTVELzE5?=
 =?utf-8?B?K0JwUHpiQ0Y4VHprZHJpMU05WjkxSFRqWE1XUEhFanNWeU5iVWVGVVFyM2pz?=
 =?utf-8?B?MXc4SmRTMGVoUE0xVDB2Q3NoVDNRTFl6Y0JvRXNxWk1YR0hkY2xiR0dLSEtF?=
 =?utf-8?B?ajdVdHFVQTZDbCtpaWZQd2V2THQ0Q1ZxeURNREt0eGxRakI1SHZFRk95cmRt?=
 =?utf-8?B?UUZRTkdodlRzVk81MWNpdWhMaTVUTlRxdUQzaWdFbnhUbzU0Y3BhVkVzZk5s?=
 =?utf-8?B?MWI1ZG82c0V2UDhPTk5xNU9WSUtkM0FDYkdXUzhtdU53UXA1c1ZLTGFkTzBT?=
 =?utf-8?B?UnB0VkwraWxyTXI4UU5mTUZrMHpXTXlZWnZ1c1BVWHJIU2NyM0RweU55RThh?=
 =?utf-8?B?Wm5CMGFOL3dSVElsakNwWU5mWGgyWnM5SktzWU5VVHJTMHhNN2NPL0hOd2dN?=
 =?utf-8?B?TktiYVQwaURiYWpmeENuY0drQnJCK2JjNENUbWVsZ2c1R0Y2TC9jRXZkRTJh?=
 =?utf-8?B?ZllzYmpFdmU1a2FXOGY1RkEwZHhZT1lia25pcGRrZk9ZZ1FkaTJSRks2azFl?=
 =?utf-8?B?S3Y2QmJoTmp1UHNDOElFdUxTUWVQL2JPbE8wZ0IvUncwKzNQaENRcWlDRVha?=
 =?utf-8?B?cEdVdkRWNHo1WE5HT3B3cXRxd0k0TGdnd09JNFFqUVUxRUtCZVJ4ZHhlRkRJ?=
 =?utf-8?B?ZWhsZDRCTlNOWjdPeHAxZ1F6UjZrdCtMVE9Sc3J4dDRHT3FIaE9LVUh1UnFt?=
 =?utf-8?B?Z0hSNHIvTkxXSEF5a213aXhUQVl4b2kwb3R4dDNzaU5HemVlaUsrRi96MHBM?=
 =?utf-8?B?TEh0VWgrNks0eWxKbSs3OTdNelhTVCtucmFTamJQcm9QVHcweWFSSzZybjJm?=
 =?utf-8?B?NWVTUEREYXluZUVtSkI2Mm5ycVpqdDNlQjlRdDAwU1VwMUMxTVkvekQvcWY4?=
 =?utf-8?B?QXhTa1JxMU9CTXdWNW9BQWdrUTZxdkZBZHdYaHNSYTlMVDVsQXB5M1BCYTFU?=
 =?utf-8?B?dUpxTUV6RzJqL1lFVHEyTkpmc2puY0ZycGV5bmo5M1U1eXR6alZhc3NKL0NP?=
 =?utf-8?B?TjI4cEFaMkdjck0rd3BvcWZpc3plNkgyRjJjSDQzMU5aajQ1OCtkWSsvL0M1?=
 =?utf-8?B?SUhjdytNaHJUZnBOOUZ2cUhVUlZPV3FSK3hma0ZYRDFaK0JOY0JlN3c4NlRG?=
 =?utf-8?B?RDlBQkZRT2ZDVEx6bmZOeEtVQkhmaEJDMmhDYnFiK0doelUyUytrNXhDV3JW?=
 =?utf-8?B?Vm8xd1haYVk0b1FqL2tHeERvUlZoeEdwSU9NWC9mZkhiYzFFb1FLMGFWMGQ4?=
 =?utf-8?B?QWFNbFFoYndDYXRTTS9mbEFyYWhsUVpFQzhnYkpsNDYzdmdITXJVWHpBS2J2?=
 =?utf-8?B?NHpzRisyK3QrUUI5VnVXU1VJUmtNSm9sUmdmbFljc2lEd282dTIxRjZDcERm?=
 =?utf-8?B?T0hsOVFyYlFFWDdsSkJMZ1FESTRHV1N1RnBWeDNvV0tIenhvcXMzWkZqRCtw?=
 =?utf-8?B?eXNzN0dLaG8yOEJpOHFEbEpYNzUvVEtXQXZXbm1iLzdabW0rS0Z6TXloSkVH?=
 =?utf-8?B?V2NJR1VrZURBNVZxUUpsalFOVWZnbURUMW80ejlFVlVncnN4cWdEMFE0Ri9C?=
 =?utf-8?B?RUgzSC9oUnFkQkVIYXZEYjVyM1pPYXMvZ1JteVN0NHJHRVZnTm92Zz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75dca0ea-00a3-4060-bfbf-08df07e45f15
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6329.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 04:49:14.0289
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9ARNfrHFKir5TlayBKDSB8cVjUlQAXTaJ0ojSvuyjGL4w05gJWZMaIddtcFnhfH3XDpTOK4kU/Boqu0Mf2ePew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4120

On 7/16/26 12:34 AM, Pan Chuang wrote:
> Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
> devm_request_*_irq()"), devm_request_irq() automatically logs
> detailed error messages on failure. Remove the now-redundant
> driver-specific dev_err() calls.
> 
> Signed-off-by: Pan Chuang <panchuang@vivo.com>
> Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  drivers/hte/hte-tegra194.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/hte/hte-tegra194.c b/drivers/hte/hte-tegra194.c
> index 4a7702b32b24..e29fb105ca2d 100644
> --- a/drivers/hte/hte-tegra194.c
> +++ b/drivers/hte/hte-tegra194.c
> @@ -856,10 +856,8 @@ static int tegra_hte_probe(struct platform_device *pdev)
>  	hte_dev->hte_irq = ret;
>  	ret = devm_request_irq(dev, hte_dev->hte_irq, tegra_hte_isr, 0,
>  			       dev_name(dev), hte_dev);
> -	if (ret < 0) {
> -		dev_err(dev, "request irq failed.\n");
> +	if (ret < 0)
>  		return ret;
> -	}
>  
>  	gc->nlines = nlines;
>  	gc->ops = &g_ops;
Acked-by: Dipen Patel <dipenp@nvidia.com>
