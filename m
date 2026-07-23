Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011005.outbound.protection.outlook.com [52.101.62.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AFF834107F;
	Thu, 23 Jul 2026 09:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784798651; cv=fail; b=F462ww4o6QN75IGdR3Q3YSFdlOzk3u2D1g3tXclIAC1onZsFv7ubaCvSxbRc6OozdWEX8fF7Z/gkk7SRgiGHsaiYtmj5HMF2H5tawJ+SCJTgtgzdHChL7b1tAsj6t5gJtYHmVGhcKiLH/eEEFK7izPevT2YUze1Qp80o9rKql5U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784798651; c=relaxed/simple;
	bh=o/2CoYAS3pIHDD4UuBGdKqoJwtrwq7Ef2Ct0ItMJi8Q=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rkiY4WQX93snxo2GPVsuZyDhOzNrfHpk1/Pxuvfy9fbyQzK2/m/Y/JJuUw5EWQ5kIuSu3MRTzX4qrh+oq6cxuGLlp2WSO5Dghhm2ZKJcYs8OMGjk+/PmwgIP3pRpqH2WONavmj2uzzLa0MywMeIgxIbb8CcshIRoRNlQod2Uues=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=TYxK0ewA; arc=fail smtp.client-ip=52.101.62.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="TYxK0ewA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WfjqFiibcIYIft0bVF1J4AvbKqudIjlF6eqYV37rt61Cw0Wnz4W3skVcRhSHyPjziHEMbRC60tvdm9bVvnp1PYRdERH2+M/mYdAVd21n6/ZZ1MTVA/JUq9Y5uQxY0rH9eCJ67IZOiQSTNfm5PfVhoMJnsVgH5LtGH+tE5XhwtYeEJSKngu3fd6fTuhSzCd8sJ1EQbYfG/0Hfitk8muP526ay17doLgamtgjy6DCxvuSm/rg1h6f2k8iO5b7RkrbC49+DJQhAITNu30vCEvARgPH4Ez7yIm1lpK61D1X2nIenfNYbr2ehU+zpuZaxkviDyFeFu8oejBPPe+KSJoIMwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VON2fRioEr+TslOcAVnLaO0rV/n3EKwnwZPm48p6l/E=;
 b=ZnsHJsg+blPOzvThL58QZrX25j9UXFShqFQdYFiKnFOP60tDbkO/Mz4Grs0/FeLAjUTIZRINLCZ5uKidY6daf8FunWnBkWE9CcWfKsJ2xQ+z4M1CwVRMzRQXVAortfSjbA+WzZzefKQu/hCd/QNahRDXl+IMca/TZHktXPdyey0zjSrIhIJEs+QILcNvxvIuTgLaiv/TbcL4NDS5BN8DsBjX6paLJjCJz4j7Z9Ls2wsRML+OVMBAClHz/Dg4TMcTqJcPbaHnJYTtaQJoT2CXwS4qze3EF9CuyogBDC/laIIjKsib9AZd8FhOfITPFUJTvBaGVGK8MxkiwAnV2MDBCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VON2fRioEr+TslOcAVnLaO0rV/n3EKwnwZPm48p6l/E=;
 b=TYxK0ewAK0ylx7ye4otP7YifyCRIgA17skOvA8mVfTo2QHjH4NXIaxBs/8V1yJCKdDiKtlgCTitbmIIdqac/KjTjOMRBgn4WHk/AvndRTyKXCO0dbZQdX8Mv/Bqu3qG6+nuYqDjlpvkOJGpr6FEJ9mJaXFFAA7ofAFljpAX797Ku6b2Eo282YwATpWTeqx3dI9qLhcJvnpxMNTciHirEh4io+Zr4+Z8QYoM4oYuV84euyQJI6PWtDEb7Y2JqDF4t+PmKEPsLnfhrU0X1krjb4uP+KHJ7YwDZSWtVdoJGST8ojmB/8TS2jNALh9Sy5GQmJF8Fa9cyUHzRTzsFrptNFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ1PR12MB6051.namprd12.prod.outlook.com (2603:10b6:a03:48a::18)
 by DS5PPFC9877909A.namprd12.prod.outlook.com (2603:10b6:f:fc00::661) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 09:24:06 +0000
Received: from SJ1PR12MB6051.namprd12.prod.outlook.com
 ([fe80::96e1:b300:7b78:d3a9]) by SJ1PR12MB6051.namprd12.prod.outlook.com
 ([fe80::96e1:b300:7b78:d3a9%4]) with mapi id 15.21.0245.010; Thu, 23 Jul 2026
 09:24:06 +0000
Message-ID: <325be874-bab9-464f-84ee-99e160259923@nvidia.com>
Date: Thu, 23 Jul 2026 10:24:00 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clocksource/drivers/arm_arch_timer: Workaround bcm2712
 broken EL2 virtual timer
To: Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 John <therealgraysky@proton.me>, Daniel Drake <dan@reactivated.net>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Mark Rutland <mark.rutland@arm.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20260710080958.491620-1-maz@kernel.org>
 <325e86ea-d4d3-4c84-ae9b-f4a08c9b071b@nvidia.com>
 <878q72rcz6.wl-maz@kernel.org>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <878q72rcz6.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0101.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::19) To SJ1PR12MB6051.namprd12.prod.outlook.com
 (2603:10b6:a03:48a::18)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR12MB6051:EE_|DS5PPFC9877909A:EE_
X-MS-Office365-Filtering-Correlation-Id: b96dd018-5c9d-4ad7-7292-08dee89c2484
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|7416014|10067099003|5023799004|56012099006|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	/8JZsrD8lSHWXfeaI5kcIMqqwuYwo53UUaR/eFkG5NZnsLkR6GXs9MPP2CgbtYyo0XiuwAX+qLhfYhi9FF2AuDK4jJrdsituiyabhByvtjok8ZNSIKWjRZPnxrE61HH13pQ7a7TYAMHOHM+3dp+crzqCAw3rfaA3w3Y+exSrC0xIxQ5LIYIroc2/RpEyUqHJ/ddySfEJ1EiccCfF5Tt4DF4+5KjEWgrD/D2D9FYhaLvvWNiYpSLJKra1O/3xLtgzpRP3fUY0rWX8XDngHF/IlwLaoLWsOljidD8oeb1t8tWT/EVfHNBgxpMnpeg5SJqhCNUHsIuCRAOCe4FdHHv5u57sXQz/18movK7PGW6CsZ57+YxeDbotgoncVgwYAVSDyLd+Yc9j3ClctIW50K1o4ZY+TkxNoGCREv+syyf0Dk5fF5Idg9SLTKRLRfdo93pwdRVHYdY25ANqUyOXYE1lwxJvjeAtuCI5p1+cXCkGF+4UgcKyb5n2qi6FO9ZRf4/t6Ifino4jQHKI0LjZoW5EUEGzMV4V2/96tlOI0SbmLOyURZ6XNcAfvpG9S2EpFAEOek6bBQQYPikXHBfSxDq2bzOc2ZYwyRabNLo5NOOm5Xp1sBE23CjnjzNPXewnqfjjZgzmU6S4181QtcsSUO0lb3mdH7Y+aIRNojzLpHUBPLQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR12MB6051.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(7416014)(10067099003)(5023799004)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?citZaW5PWFAxVm9SbjZkeS9EWnlFTTNxTHg5Yk8rTml0QmdRVjc2bDZEU3BL?=
 =?utf-8?B?amxudk1yeWQ3SDZrK3FTajJBbGhLMWVwL05UQ1JIWmpRZDg5S1VKemVMSUl6?=
 =?utf-8?B?NkJtSGd4V2RQRkZxc25RVFdmQmNyaFYyQjdFa1ROdVVTTG9QQVpqamdLNUZH?=
 =?utf-8?B?aHlzQjR1TWVmMWdrbzhRV1Urdlh3bWF4OXlHRDVyZGdKcHJvQk40T3ZDOXVw?=
 =?utf-8?B?Rmg5ZVcwVHdOZkhiM0J4eHdYbmRielc4OXRGUTltM2JYc3dST0NTS3EvTFNQ?=
 =?utf-8?B?QVpBcGJYT3R3WmErS0dwSEZwRWJPVkFhTDZDYTl0OHJVaTJVR0k3QmpxSkpp?=
 =?utf-8?B?bVBLNCs4VCs4enJxNFMvaDVzKzRwbjl1eUxTcmNyVFprMVR6NEFwaWVtalg3?=
 =?utf-8?B?R0tLSG9RUXQyaDkyRnVoQi9LckVDTUZjeUNUaWNtUWd6VzdQSmdLVm9xYWdZ?=
 =?utf-8?B?Q1B2U1NkMGMvUjV6RFdvZVRybnlkUXZUeUZhYVYraWRXcTRta2Iwc0FjUHQz?=
 =?utf-8?B?SkNoc1BBTVNWWUhwZ1pnUjBvZkZHRkdBOW9qZ3RKVnVWcGR3K21TU3ZFM0tB?=
 =?utf-8?B?bWxVRGVnODhjMGNnKzJWN0tmRmtMUDUxTzFib24xaEhLVjRSVXljUkVFdWlr?=
 =?utf-8?B?d0svVm5tS1lJa28wS0s0bEp3SVFDaUNrZVZra3NxMnlxS08yN2lPL2tmQTVq?=
 =?utf-8?B?R1EwMlZXcGl3RXE5aGFGV3NTL01kTThpL2NhT1V2cEZLV3NRd2ZPeURiOG9V?=
 =?utf-8?B?VzY2RXVoTEF1T1piRjlmcXNQVFVvdUNMcVNYblVvcEo5ZHcySlpUODJFRjdu?=
 =?utf-8?B?S2xLUjYzM0cwd1FkemxIVmNsMFNvcy9adnJ6aTNPZTBIVmVEbzRCcW9hMUtQ?=
 =?utf-8?B?UHNCN2g4Nmh5K3JrVFg3Q1JUUitWUndyTjloampXbE9VWENuR3hUckdGdlVp?=
 =?utf-8?B?dUpYT09GbURKMGtVbmlOaU9sSmZLMDc2L0dneGs0Y3QrT3FPSC9JL1JGdWpC?=
 =?utf-8?B?MGNNTEM0MkRyOGtRNElYdFR2Y2NDanJia0pDa1dOUC9wOTJnNjhuakFWeGdv?=
 =?utf-8?B?VGZEaW5oWCtuWGdkaFA3S0dRV3c0Qk11QktYcmp0cHlSZllFZThqVEQ4QitT?=
 =?utf-8?B?TVl6V2M1YzEzZHk3SkNOV2l5M1NsY2VJUjBnQ1Y0TFkvT3dINEdRaEk3QjNF?=
 =?utf-8?B?SzNwcU9Wa0VTMHh4a2k3MHM0RWhkWm9waWNsS3J6NVB4cEEreEl2OFNPY0ds?=
 =?utf-8?B?dHlIU09meW1IMjYvVE5QR0RDVDVqVzU2NHBDa2RSaEcvazRQQ2svOVNSRS9U?=
 =?utf-8?B?WjE0amN3RVd4eDYwM2xyemVDN1pCaTV1alFDLzlPSkpENTYxSEl5MW9JWS9D?=
 =?utf-8?B?QzF5dXRrTUxGeC9NV3R4OFNqWWVYZWV2c1R0ZWFoMFFZUFhWV1BIZlp1SmRX?=
 =?utf-8?B?L0pKMDFBZlcyTVpiMkwxZEFYRWd3VkF4Vzk3Um44Wld4cWpVdEJRK3lYUjFX?=
 =?utf-8?B?Yy9md3F0RzNtWHJneW5SRUNsZHJHdUd4ZWRmY3Z5YXEydDlYQzFSTklqZlVU?=
 =?utf-8?B?MEFYR3dDL1VUMUk1Vm5GOFZRVVFuMmxoVmJyZ1BuUG1CcEpqMzA4U2ZNWGlm?=
 =?utf-8?B?SEVRUSs1TzRvWjFLcjhmN0xZdHoxeFMxRDlPRDdubG1iWUYvRlQyNHdtWXNH?=
 =?utf-8?B?b2pwL05OV2U4Q0ZGWU1aRTRhSUExTVJKU1RtNHNiREVNd3IxZWhkVGpqNXJP?=
 =?utf-8?B?dFdMalVqVWNmR0hjLyt2Q3Z6QVdvQ25PNlFzd2RUODIzMUNPZldVcEJWRUhq?=
 =?utf-8?B?Q2ZKTFZPeHQ2TlVhejhMek5RU2lWd0kzSVpJZXI5SHd4K3I1TGdCbGhMaU9N?=
 =?utf-8?B?MDNka1B6MndBelhXejExaUNKSlRIQ3lEZTJUWlJlYk9LSXRDNHNzN3FtOGRB?=
 =?utf-8?B?VFFBaER6QjQ5QWdwUGFwNjNFdnFVZm91em1GVnBHOStyTHZnQVB6cGNKc0lY?=
 =?utf-8?B?OVF2djBvbmgxNEYwL3VXSEJNZVV0aXh4elVOcEt6V2hoQ2FjK0thY25aTzAy?=
 =?utf-8?B?d3dtTlhKYmRkREJJQVc3ejZVZW4wa2p2R2wySGdMM2FSMG0zVWFLYjNqQThG?=
 =?utf-8?B?dEhiMlUwa1VSSTZvQmUwYkZlV2YxOHN1c0l6eWFVV0ZNNE5JVDJCYXUvSkc4?=
 =?utf-8?B?c1EyRGJoOHdMcGY3TlYrTjdUUmttakdrRUExdlY2QVBOS2JZWkJqM05SUTln?=
 =?utf-8?B?N0k2TDB1a1FUUERjalhGc0tjREhSaEp4K1NHOXZnQkxJMzFzbTRpUzdZVXEw?=
 =?utf-8?B?OHdzZzdabjRYN2tXM29zM3kvYzlRVzk2SDNyaHpxdHpxa1Q2T3NIdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b96dd018-5c9d-4ad7-7292-08dee89c2484
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR12MB6051.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 09:24:06.0288
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0KXWjP41J/fc8BcNm2rCw2HrmCqfVVzE2zp2Nqxjk/SNfBSKRQO3cJwpHNRmTFu7Ln1gf8ki6jRkHj5xCRFKkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPFC9877909A


On 22/07/2026 21:22, Marc Zyngier wrote:
> On Wed, 22 Jul 2026 15:14:39 +0100,
> Jon Hunter <jonathanh@nvidia.com> wrote:
>>
>>
>> On 10/07/2026 09:09, Marc Zyngier wrote:
>>> It appears that the bcm2712 SoC found in the relatively popular
>>> RPi5 has a broken EL2 virtual timer.
>>>
>>> We do not know the reason why the timer isn't working (the timer
>>> is ticking, but the interrupt never fires), and the SoC vendor
>>> doesn't communicate on the reason why this isn't working, leaving
>>> users and maintainers in the dark.
>>>
>>> Paper over the issue by detecting the broken HW, falling back to
>>> the physical timer instead, and let the user know about it.
>>> Also taint the kernel as the machine is definitely not compliant
>>> with the spec, and we don't know what else is wrong with it.
>>>
>>> Reported-by: John <therealgraysky@proton.me>
>>> Reported-by: Daniel Drake <dan@reactivated.net>
>>> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>> Signed-off-by: Marc Zyngier <maz@kernel.org>
>>> Cc: Florian Fainelli <florian.fainelli@broadcom.com>
>>> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
>>> Cc: Thomas Gleixner <tglx@linutronix.de>
>>> Cc: Mark Rutland <mark.rutland@arm.com>
>>> ---
>>>    drivers/clocksource/arm_arch_timer.c | 24 +++++++++++++++++++++++-
>>>    1 file changed, 23 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/clocksource/arm_arch_timer.c b/drivers/clocksource/arm_arch_timer.c
>>> index 4adf756423de9..7b4a98df6962b 100644
>>> --- a/drivers/clocksource/arm_arch_timer.c
>>> +++ b/drivers/clocksource/arm_arch_timer.c
>>> @@ -1090,6 +1090,27 @@ static int __init arch_timer_common_init(void)
>>>    	return arch_timer_arch_init();
>>>    }
>>>    +static bool __init has_broken_el2_vtimer(void)
>>> +{
>>> +	/*
>>> +	 * SoCs described here have been found to be broken, though no
>>> +	 * explanation has been volunteered by the vendor. Let the user know
>>> +	 * we're papering over the vendor's lack of communication.
>>> +	 */
>>> +	static const char * const broken_el2_vtimer[] __initconst = {
>>> +		"brcm,bcm2712",
>>> +		NULL
>>> +	};
>>> +
>>> +	if (of_machine_compatible_match(broken_el2_vtimer)) {
>>> +		add_taint(TAINT_CPU_OUT_OF_SPEC, LOCKDEP_STILL_OK);
>>> +		pr_warn_once(HW_ERR "Known broken EL2 virtual timer, ignoring it\n");
>>
>> After this change you will now get two warnings; the above and the
>> below. Is this what you want?
> 
> Absolutely.
> 
>>
>>> +		return true;
>>> +	}
>>> +
>>> +	return false;
>>> +}
>>> +
>>>    /**
>>>     * arch_timer_select_ppi() - Select suitable PPI for the current system.
>>>     *
>>> @@ -1115,7 +1136,8 @@ static int __init arch_timer_common_init(void)
>>>    static enum arch_timer_ppi_nr __init arch_timer_select_ppi(void)
>>>    {
>>>    	if (is_kernel_in_hyp_mode()) {
>>> -		if (arch_timer_ppi[ARCH_TIMER_HYP_VIRT_PPI])
>>> +		if (arch_timer_ppi[ARCH_TIMER_HYP_VIRT_PPI] &&
>>> +		    !has_broken_el2_vtimer())
>>>    			return ARCH_TIMER_HYP_VIRT_PPI;
>>>      		pr_warn_once(FW_BUG "VHE-capable CPU without EL2
>>> virtual timer interrupt\n");
>>
>>
>> I have posted something similar for Tegra [0], but because this is not
>> expected to work, I wanted to avoid the warnings here. We test for
> 
> "not expected to work"? In which parallel universe is that a thing?

FWIU, at least for Tegra194, we have a CPU and GIC pairing where the CPU 
supports this but the GIC does not.

>> kernel warnings and ideally we would not warn if is known not to
>> work. We could always display an info level print if it is needed.
> 
> No. These warnings are required because the HW is broken, and violates
> the basics of the architecture, which the kernel relies on. That's
> important information that needs to be captured, and that's why the
> kernel also gets tainted.
> 
> This applies to any implementation that hasn't been bothered to follow
> the spec. Don't worry, you're in good company.

Well Tegra194 does not appear to have, but Tegra234 does (but we have a 
firmware issue which should be easy to fix but the current released 
firmware as this issue). I have also checked Tegra264 and that should be 
following the spec too.

Jon

-- 
nvpublic

