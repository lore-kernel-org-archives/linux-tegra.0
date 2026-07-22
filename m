Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012024.outbound.protection.outlook.com [52.101.48.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D03D3546C4;
	Wed, 22 Jul 2026 14:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784729692; cv=fail; b=sQGbRbmsETnTzYzAIr/H2F58hAoL6QbxMqkGPM0zAjCWXfsH8bdepy2wZfKtqY/nrfyfVauVxWr4p0Ed0n10QJmmQN76LJppVtMKzhHndP1oT13gzC0Vpce8WgdxXLBX079wvbF0RleH7x3ksYo3ZXCBU76LspaXfnRq/Yc+GfM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784729692; c=relaxed/simple;
	bh=VS2QIqNQrNvRLv+m2fJ9z63WemusnJGoH2s4XESBY4c=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=a1V8XP6cI0qI+s+yRj2mXKlLeS7m6wKFs/okMVuXZ0blHaORcOrDYwnAjrYYnH3H+iPEUpaTYY+oXj8P+vVtQ1n/+qpmU92BPm9ihx7ybtFP4OImJQ9bZLh3WBsiPSe9kVyJjIIST7mVLx4W7O9MafN167KDg7rxrCskNyoKoRs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=m6VNeZgW; arc=fail smtp.client-ip=52.101.48.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="m6VNeZgW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GSTA005qZg6xJZLx9zTpC+nonl0sI3bAUzlFLVT1RBdOt85rmRsA4FonAKEZChEasOAXxTx9T1kI3xtjJ+druH4KDUmbN8LiAyOsZUOONsRytYOHYSSrfyKjwNB48lt26IoV5GyEHn/AY3RviBXHOqA7ciDqJWAZNSiIcqbTsxS/e6YAUgkvV7w3McWyvLrEV1Io3nnG8JqqJfMXS6LYFPxxTulJXCaBCcSIsziE7fttHfVp7tMJPd7boHmdkASuxAkf758ENXNgAdfHWoEAqOuYbRVv7Mt+l3ckvmxJAvXkDFNoRswQY5FT3AbTgwYlVqo7ONq7pD9+UDY1H3buMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HuPFnyPfzr54QZzpLlViKbK8Bp2iYup0ZKqy+06Abf8=;
 b=JfwH9/38bdPJsYZKlc8rC2ooQ/GJZ0Ew3FCJa3iPSDxvX7aPR4y10bwuRrVsQsk+6svBAedeNlSnrZCALsH2IIJM9JQ0AcqzT8VavYsBuFAiaXFakaxfqgpULNpeStD8QBnBxh7pmF4rT8oR6GzsAZjNfuYJd3wrEkUpXBdlzGz3WaDiPqul2lAIa9gkTOtoTI9EtrNoDcfgZglkgrhMctiRyPt8R0M21p1rqa5TvdUnjfgIcyQPy59uJ9YwTQzpgtcCbMpMqD1ssy8YnrODHfwz3fLcDB/Xk8+ANFIWRw4o0S8ouxIF0IUuh7RKVZtfgX6jEPcasitMkhZAF1s6vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HuPFnyPfzr54QZzpLlViKbK8Bp2iYup0ZKqy+06Abf8=;
 b=m6VNeZgWxA7gwQr7OKRbVHEE+ajWWZIv+PdxPUIhR4I6dm8xm02+TUeEAXUYerhHHofC3Yz6gfKlpe4w1F9dVvqbvYLoU8pbEQhyaFK2Eq/XwNkHDOLSBxIpBUWAXLb4O3lObmECagMLrMXkyLgqc2kpFHPpEeOkfGinHPutyrbvuAQ4Ymztd67kPZkwhgczY2aH1n8masVWJqQ/uF35khItjIflheu+GhB79Lyv3O9K0otFgW8u8D4cczRgmfeLrB88+Mzhiwanv/rW0y26XJJfTEoBxA3jOux2DxmD/PycZ/9Txxdzo1ihQ0Vof+9MbMwNwgmadWtJXXwP5ZqoHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ1PR12MB6051.namprd12.prod.outlook.com (2603:10b6:a03:48a::18)
 by DM4PR12MB9735.namprd12.prod.outlook.com (2603:10b6:8:225::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Wed, 22 Jul
 2026 14:14:46 +0000
Received: from SJ1PR12MB6051.namprd12.prod.outlook.com
 ([fe80::96e1:b300:7b78:d3a9]) by SJ1PR12MB6051.namprd12.prod.outlook.com
 ([fe80::96e1:b300:7b78:d3a9%4]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 14:14:45 +0000
Message-ID: <325e86ea-d4d3-4c84-ae9b-f4a08c9b071b@nvidia.com>
Date: Wed, 22 Jul 2026 15:14:39 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clocksource/drivers/arm_arch_timer: Workaround bcm2712
 broken EL2 virtual timer
To: Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: John <therealgraysky@proton.me>, Daniel Drake <dan@reactivated.net>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Mark Rutland <mark.rutland@arm.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20260710080958.491620-1-maz@kernel.org>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20260710080958.491620-1-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0183.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ca::6) To SJ1PR12MB6051.namprd12.prod.outlook.com
 (2603:10b6:a03:48a::18)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR12MB6051:EE_|DM4PR12MB9735:EE_
X-MS-Office365-Filtering-Correlation-Id: 9404077c-62d2-4e2f-09e9-08dee7fb950d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|10070799003|7416014|10067099003|11063799006|5023799004|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	hRhm+d6W+e6FiG4xCOmn2ZjTRFdie72jihAc40vML0jj9PCrLHlCjhsU5IUUJjGuexkJ4RX3/MHRCWoXG0bVpx9B7CMQ5hrNb+b0kz7pDp7029IucUYup/XS92iMaYMfKmbTsbOvzD3ibiENlZK1L7ySB0t3mNmcEPBrVDBB/FEnmt1gJ5IejhJjK5VjgFwany3cD9FwyYZLYYvgV0VIRfyXG2HJWB6U8gmqt205iMq8LoEdcGg2s+h7EZDsDkdfVZh2wSFcpDmmcf74gx9TMiX5xAz/qivD+L4kbv+BFId+Od+ZBFA4/9kbTkIznOFPwvgMHq3PQRppZBfzZOP7npPUFgRd33+znBp0XwTkXFAl0DBABVd9AACGFHlf/D8EDaFhk537yoVsyhQUtemHqrr+U/KsoMqvAa8BTY3q2q80BA4NTd6/QezpAHL3G7xrwibdQ6PDGS4DKvH/R0rjNxOkUZj/jM5JXaPWYWeQPMs2g8eLK3moec6L22by8sl/PDPYL+0hQ7JZfKNApzoWIGBQ/VLyLk1v7oCqyKuBJctGc4mHk4dhdBTHN7kjxpe6OgZF/1XeiN8p1GwSfTeQ/p5sZ7VcLk/eX3PdvlQ5CSPezfFZnIkdgEerc5Yith46V3zIm/rcOhVKhV5A9u24Rouf/t7G97vJGwQOcG/q5YA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR12MB6051.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10070799003)(7416014)(10067099003)(11063799006)(5023799004)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ak9uNzBEb2p5OWpYejdQTFJqNGxvcFEwZHd6ZlY3eHEvMW1kSU1FSXpiMDFo?=
 =?utf-8?B?RVlPTGJJTDV3MTlNZXk2TEJPYkE5SnlJUFVnOWZvSVBHbW5qUXFrcUhIVkdK?=
 =?utf-8?B?czdtMEdETzNNbWJ4dUNCckcrdHRHR29VYzV1Z2FXVXVYOGxoQ1VycVNGYTVH?=
 =?utf-8?B?Ry9KZ1Z1U1FYYzVLdWJKMk01Yk1JSWx5ZjBDMXM4NzAvaXVCOUxadm0yUy9R?=
 =?utf-8?B?SjJrODYvUGo0c1FLdk1UYXphamVkeDEyenJ2ODRaa0I0d21DZ09iWE9tUzZY?=
 =?utf-8?B?RFZCbGdYRm1yVUhWSkd4OURUcC9ESVhnQ3drd1RVYzZwdno2MFZ2LytiRDZV?=
 =?utf-8?B?UFYwenQ5ck5mWkdmOEpwaGlUaDFCKytEVGY5WmpYcmZ0RDBhLzdnVklMaE9G?=
 =?utf-8?B?a29VdFF3cWRLUTh5UGFTUjFPZW5wM0svK1F5dzZuaFRvRTVncDE1aCtYRzVx?=
 =?utf-8?B?TDAzbDRzTTc3NHk1UFZxZ0VZTGpvVHRramFnQVV4d0lkUTBjSGdBd093TDUw?=
 =?utf-8?B?UWdocVBsYk9mVWw3RmtqWGxlK3Nvb1FUaFNkWWJ5cWlHUlFDbXNTOUFzR2RT?=
 =?utf-8?B?OFdLQ0U3Z2xVNDlaZzRIa1I1ZzZhcEZxcFZ3ZmFMRFZEQU8xcTJrK2lLbEl4?=
 =?utf-8?B?bDFOOEw2SHM0R1hna01mbGQ2a2xlVHhteDdvSk5iajcwazMyK3UyUGozaWpj?=
 =?utf-8?B?Nk1CU3o4c1E1eGxzSFhNQmxhK1FWNVpQbDJQcDRUL1RLaytPSUpwMDhWajRE?=
 =?utf-8?B?c3pERFFWK2NsU1Rqb2pJakc3cTV0TDJ0OW83ajBDMnREYlhWQzFuckNZLzRM?=
 =?utf-8?B?NWVyb0FQam9QZktyZHJZeDk2K3BBcENpMSs5TWJrZkttbFF6Mkovc1UzaExC?=
 =?utf-8?B?OFdYUERwNTA4anpBVUpnYmhaM2hpMzU4VDI2Z3kxd1g2OG9pUmZYT3l1ajY5?=
 =?utf-8?B?VDkyeVQ4MXBzUTJtZEV4elJRSnEvK281OEpMUk5jb016ZkhZdmFYOS9JTC80?=
 =?utf-8?B?Y2JLUEtGSWE2T0V6Zmw2MTdaYmY2SFdESnZQbktqU1ppaVVTZjhFbVJaWk9I?=
 =?utf-8?B?QUIvYWhNdGFaWkQ4VmFpZTN2U3o1cFRaWWttTktsQnhzR2ZsY0xzR2tFTm9U?=
 =?utf-8?B?OGhmVG9XMDY4RHF0RjZRMjVNYzg2UTA1Q0hoSFQ1d0FyQlFjK3lPcEFMYU04?=
 =?utf-8?B?N2xWNjFBc3ZqTjlDT3JnaDZHcnFRaWR2aFNEci9LcEtSOGErUjU1WU83QWxC?=
 =?utf-8?B?R093a2p3eWVRQXFYR08wR3RCU2F5VzVYNThjTDNXekRUSVR1Rmxnbmwyck1F?=
 =?utf-8?B?RTFsQnVvOUdxQ3JIWi9mNVNMRU1hcmFSMGxVd08xUWhGaGY5ZnlHeWRHb1VJ?=
 =?utf-8?B?YVg3TE92SFh6UURnTHg5VVViOTU1YkJrQjZJYlZDZWlDQ0FnTzhSZGJ4MEVh?=
 =?utf-8?B?anV0d3B2SWJWdkJPenZLRDR3bGRVWGZ4ZGhjTGwzOWp6MlFJZFNBREVVR1Zx?=
 =?utf-8?B?QWhTc09hVU1lNDBTa2tPaythbFlMcTF2WHBMOWZyL1FlY09xT1UrMllzTHNo?=
 =?utf-8?B?NGM4U09hcDJlNm5HL0loSjJDKzlQSVNkZzFxYzEzZFRzUklTeVNxZkNzZ1c2?=
 =?utf-8?B?S0ZqampTdFlWMUhsUWxab3pybzRoVU5aU2tDM0Q2VThkSzRYMC9Fc0lMb0NL?=
 =?utf-8?B?SHAyWDVCZWZJOFRDblMrR2hEK1NLTXh5SFhzTGhwTTIwLytwSExnSG5JSTN6?=
 =?utf-8?B?NlRiNHlTVmd5Nm1EM0VNVzlQWng1cHd3c3RBODFMcW1Kbkl2RHc3TXEzM2cz?=
 =?utf-8?B?T2JzcndLalI1V21qbitFYnl5Y0VOdEMveWgzNnJoUUpyRDZVcUxYWE5yZkdD?=
 =?utf-8?B?MGNVQmZYTFozdjlrS3BIcm9pMDZNTEEycXd0bVE5ZlI1WWVpV2swSk1OY1Q3?=
 =?utf-8?B?aHhobW1IUTNZNTRsRTlZYTRaSXNuVkpPb3RrYmNMWDEyZzJzRi9GczNiV3Uz?=
 =?utf-8?B?a1czWHBhRlVnd0ZmWUtUOVVpRG84cys5ek53eHVqakk1ejRrRGRhKzFwWTJY?=
 =?utf-8?B?aFFSUU1HcDl6ak1vYXNQdHNSY2EwRC8zN2EzaFdJdVhtaGF3anlaZXpVQUND?=
 =?utf-8?B?YmEwcXlKSmszNExvMldXWFc0dFFjRFZ5N2dGSlFxaUVxeXpsaHlXUjZmWGxh?=
 =?utf-8?B?Q2Uzb0JLSUZreDh6TkZ6U3BKeVZBaS8rUGZDdEd4cHBSeUREY0RZUG53R1p5?=
 =?utf-8?B?N3dpM0FTTkMyeXFLZU5McndkVmJXM2g4WTJMSFR5aFNvK3dSNER0dENwVldX?=
 =?utf-8?B?QXV3TCtKVUgxWW5SSGlsTHhlYmNIWDZ5anpBY0RZKzc5TWVIeTd6RlFPSVJB?=
 =?utf-8?Q?scOzAZ0oyuo3b7yhAJw2F/LCSwTyzcZ0/0IZvDxYy2yrL?=
X-MS-Exchange-AntiSpam-MessageData-1: pUeezlAhW5g8+g==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9404077c-62d2-4e2f-09e9-08dee7fb950d
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR12MB6051.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 14:14:45.8341
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TLcYHoTbc9cGWe87JnagnZRSeDLh/a1/0rxxuMMMsihfMlGn7tIqeN1G5eBq8n+G4zVE+yfCIvWB6ALOZpISWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB9735


On 10/07/2026 09:09, Marc Zyngier wrote:
> It appears that the bcm2712 SoC found in the relatively popular
> RPi5 has a broken EL2 virtual timer.
> 
> We do not know the reason why the timer isn't working (the timer
> is ticking, but the interrupt never fires), and the SoC vendor
> doesn't communicate on the reason why this isn't working, leaving
> users and maintainers in the dark.
> 
> Paper over the issue by detecting the broken HW, falling back to
> the physical timer instead, and let the user know about it.
> Also taint the kernel as the machine is definitely not compliant
> with the spec, and we don't know what else is wrong with it.
> 
> Reported-by: John <therealgraysky@proton.me>
> Reported-by: Daniel Drake <dan@reactivated.net>
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> Cc: Florian Fainelli <florian.fainelli@broadcom.com>
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Mark Rutland <mark.rutland@arm.com>
> ---
>   drivers/clocksource/arm_arch_timer.c | 24 +++++++++++++++++++++++-
>   1 file changed, 23 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clocksource/arm_arch_timer.c b/drivers/clocksource/arm_arch_timer.c
> index 4adf756423de9..7b4a98df6962b 100644
> --- a/drivers/clocksource/arm_arch_timer.c
> +++ b/drivers/clocksource/arm_arch_timer.c
> @@ -1090,6 +1090,27 @@ static int __init arch_timer_common_init(void)
>   	return arch_timer_arch_init();
>   }
>   
> +static bool __init has_broken_el2_vtimer(void)
> +{
> +	/*
> +	 * SoCs described here have been found to be broken, though no
> +	 * explanation has been volunteered by the vendor. Let the user know
> +	 * we're papering over the vendor's lack of communication.
> +	 */
> +	static const char * const broken_el2_vtimer[] __initconst = {
> +		"brcm,bcm2712",
> +		NULL
> +	};
> +
> +	if (of_machine_compatible_match(broken_el2_vtimer)) {
> +		add_taint(TAINT_CPU_OUT_OF_SPEC, LOCKDEP_STILL_OK);
> +		pr_warn_once(HW_ERR "Known broken EL2 virtual timer, ignoring it\n");

After this change you will now get two warnings; the above and the 
below. Is this what you want?

> +		return true;
> +	}
> +
> +	return false;
> +}
> +
>   /**
>    * arch_timer_select_ppi() - Select suitable PPI for the current system.
>    *
> @@ -1115,7 +1136,8 @@ static int __init arch_timer_common_init(void)
>   static enum arch_timer_ppi_nr __init arch_timer_select_ppi(void)
>   {
>   	if (is_kernel_in_hyp_mode()) {
> -		if (arch_timer_ppi[ARCH_TIMER_HYP_VIRT_PPI])
> +		if (arch_timer_ppi[ARCH_TIMER_HYP_VIRT_PPI] &&
> +		    !has_broken_el2_vtimer())
>   			return ARCH_TIMER_HYP_VIRT_PPI;
>   
>   		pr_warn_once(FW_BUG "VHE-capable CPU without EL2 virtual timer interrupt\n");


I have posted something similar for Tegra [0], but because this is not 
expected to work, I wanted to avoid the warnings here. We test for 
kernel warnings and ideally we would not warn if is known not to work. 
We could always display an info level print if it is needed.

Jon

[0] 
https://lore.kernel.org/linux-tegra/20260722-cordial-zippy-oxpecker-dcdabb@sudeepholla/T/#m0c203a9b743500f0d1e728e80d1385d829844e3f
-- 
nvpublic

