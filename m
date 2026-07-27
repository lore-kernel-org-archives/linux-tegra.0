Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010019.outbound.protection.outlook.com [52.101.61.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27CD408606;
	Mon, 27 Jul 2026 13:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785157681; cv=fail; b=uIvzMxmPs7Kp4u82iLcMMAHfCA721uwqdugCaWdC/uSLeSj5efwHpdxakUz3MUFZzeuREV3F9xUtIEWBphQ7W+ONogUMmpphvV5Hk3bFWyNWDU8TBeW3ypGxkfi5I+zcQPZhqi9f7s9w84kmb6D1LO+uqdVj6KsxhG7Atvkqk1w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785157681; c=relaxed/simple;
	bh=Q6KCoY13zMsvnDLsbr+5rs+Y8bZi/H+5xSw0IqOmKtQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LoKfN3USWVli/M9A6rExTpzcV2mXSs565hv3XDDdj7pcYCQj5v+bNwoJAyuQjKrR5AJkOYgHVrGVYX1lClKj2XnzBH9a6RTcM32YMtygJ4ybdSzMBGGteO9sWCeDUEiTmKWJGi3HBAjewWbRnip3qgzUhVXuXmdGTSI8pKoeads=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HPg404Bv; arc=fail smtp.client-ip=52.101.61.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HPg404Bv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oUccgUC70LLFbOzGg1y5SLv1yuvKJ6XMXhFDLJWL3eqTTYK7eSfbEDanTHuQJwPnzOikG/PEKAl58tth2kjTfWyQvdz4mSyBVuAddXqlzt3c1++/JJV6NgdFOTn+VtHfEgup/6tiXitds6hYebHkCL1IyflCCfOkzJSXqkTdWt12m9nIHF6pjxv4VZjbxEJVUSnYnkX5UR4aXzV9rLPZABp1z+BPRLI2mzJjZUwDxUkKNojHElyTJ0KKJWHEc3b8+dzjkrOfJzcbVyM3x1cnCUR7U1UwK+9R9ppzg6v+aNDhxEsMRkW/Qzk9bGQHOiM+Z6Qh6YQEnm/ZpbUt8RTRXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=omay/LPBnikBbPb67xKmcVStnfjantvN/Yp4olnCjIo=;
 b=iGPG78GQkN9TFv63fReFX8INsbk78nLBOqF9/Cm+5YWu8jKv+UWPmp4wZZRErKYxPX1mcMZVvmzMKqnTTsiIga5vnNJ6SqL86xzDYWAon5C1LnGLN3qoHosL2VclUcC5XIZ0uSIY8WS7w7IHdKr248RxUCW5+i+VUnVNHHupLeJYHE1aveNZCQqHRLuN2g78Sm+wKJaJlE9j0Vro5nOajKc8Qur/Eq+bAVbHLkDYmSvE+bK+gabxZlntPZ+X7UwVlqZRHMTyCCnCCrGihEeOV56qMpFbAX7K5L+cQy1/78yPxlis5PSwgIeFllqn+zCv8FErclzSeryGVNkhDGik/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=omay/LPBnikBbPb67xKmcVStnfjantvN/Yp4olnCjIo=;
 b=HPg404Bv3RWmFpX14iHBeDs/aRC8pxYYbJSAMB725Kauj5hLRf42i8vPN82kZDMrHO+siH8/HvheLSi94R09vguhn7N/fVX22NoH9Y6qeW2Yls4wr83H6toRlC80QlHs5hr1Prqb6CfCaM7MzwR66u60TePp3BBpi6hpevIfBz1S5VRx9Zs8Euwn+6RRTBNL/V9drkn1eo6gWGFI+ZT9hxT9IU4gQ8yPYM1EQUKLk5ewhyZo26M9RQo74sW98ph57Bis/Ot3eCMTpK1fwrBLegnzytgUZKzmrRD+QwPCe2mlhggoftdjjtduc/m3jcCeMF2rn0X565FPi9I3W43/5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB6063.namprd12.prod.outlook.com (2603:10b6:8:b1::19) by
 PH7PR12MB9223.namprd12.prod.outlook.com (2603:10b6:510:2f2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 13:07:53 +0000
Received: from DM4PR12MB6063.namprd12.prod.outlook.com
 ([fe80::c06b:5df:6a68:1b06]) by DM4PR12MB6063.namprd12.prod.outlook.com
 ([fe80::c06b:5df:6a68:1b06%3]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 13:07:53 +0000
Message-ID: <35979792-3191-4432-ac96-2d9d64cb1a72@nvidia.com>
Date: Mon, 27 Jul 2026 14:07:47 +0100
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
 <325be874-bab9-464f-84ee-99e160259923@nvidia.com>
 <865x26do37.wl-maz@kernel.org>
 <e5a32fcc-ca3c-4b54-a790-d2eef2c636e5@nvidia.com>
 <8633xadlv3.wl-maz@kernel.org>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <8633xadlv3.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GVX0EPF0005F729.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::2ca) To DM4PR12MB6063.namprd12.prod.outlook.com
 (2603:10b6:8:b1::19)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6063:EE_|PH7PR12MB9223:EE_
X-MS-Office365-Filtering-Correlation-Id: 511d6ca4-6f05-4544-be26-08deebe0115a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|366016|10070799003|11063799006|10067099003|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	US2+7QwPn6baLnDcnNuSg+SIfU0RsgElwVsah6c12OlVbD2btGl1skM6LKZHvDn3PMNV8uV9+i7cOk/34BXR9NM5IQYyLCddFiee2To0GsLOTrk+anoEudAORNs9DHBTG/XVMYf340GoOvN29MhIYidWHvkAhxR4dwiSgkGG5t4DTx8S8+P9DFqcBD/mZVw4FxanfqXHhPGRdDwS2ceP+c74dveG6thu2a+CceRejYTNUOEsuB2d49tQcJv6WHOXOiYgKE8f7su1Prh+YcQdurjTjRJ5+LMg3v9942RD553RRqtURXBxnZFJyLgo4pXWqCUP/5AXD/O2zTvvKdldgpEYH4H6EhdI8RkB6e7S4W1HGK0jXE1CpkPxOzo9RTz/ZN1975JiRyLLmCCnO6JEVvhChhSmXYt8uuuv+UfdB0yo4jLqU1dECqHxV2nqhu/9QxqTo5GKcrQvKHAHGQLK6EEboVPQrYC1svAiBzvPjim+GglZMsGjuBtvYGgvMhJxtiWO6o4hR8fDucs+XKZJ9qg/Vf52Ef9xdECDVPGmkf0f1V5CWxHaIW8vzKhDDfw9KOh39lG2kbaMs3FSDbHRwiCFeqrnb/A18VO2JNV1bvyjqUwbexMdNmoOnjiRb+aacN0oOae2LX4sOHeg8SHrxzqqayoYsaiHlgjwymlFPI4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6063.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(366016)(10070799003)(11063799006)(10067099003)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d0pvZDB1dVZlZndwWnRlMUNialNNOFNudU5VRGJZL0djN2ZPWFVOa0daN0Fi?=
 =?utf-8?B?US9aRHF4WEx0RXkwUW0xREdpbENSR2cyZUpNeUNOb1huWjh2STFOTHpNa2dB?=
 =?utf-8?B?N3FXVW4wRTN0TWNsYmdrNFJPellueXVmL05PMXhEaHJNN0xHWkdVemJlditF?=
 =?utf-8?B?MnQwL0k1M3k2S1ZaZVJ0NHdaTWxOOXJMUWJHSHB1S1RqSWlSd0V1WnFNQVpE?=
 =?utf-8?B?TElqd3owWEtXTldBSEpFU1J1UDFkbzRHVnQ4MXh0VGxHUWllMXhtNzhBZDNp?=
 =?utf-8?B?eXNLWVhRN001RkY5T0FsSXF6QVhCRVZtQTd4NGcwWUNSaDFTZUptOW1PbUNN?=
 =?utf-8?B?L09lMjRXWDQ0Q0c0cndQTC9kOElCQUlsSWREMGo0L0pka0dZNENGNUJMM2pj?=
 =?utf-8?B?L2xSbWhVUzNmRjJWeEhXaEQwQ29jTVd0cmJxZURuNyt2eS9FM1BzYjVCT05i?=
 =?utf-8?B?NnRmNUZoN28xRXBHWXA3WlQ3ZlVZMDdud3VvNDNQaU5YMFduT0JRZnhXbXJD?=
 =?utf-8?B?Z0FTckg0VGRDd1l3OGhneTNESEIwWTJVcjJwNUNQcnl5dDN3SlhzVE11WVYx?=
 =?utf-8?B?VUtoZ241UFl3QnlRK1lCeldWb1dCNHlIQkVOTVJ6QUlpRzNWcDhoVG5lc3FD?=
 =?utf-8?B?cGdhYkxzRldFWVpyMTNjYzZ2SUwvOGFUMUVJeVlyTEIwYnRYdUZvd1FuVHQ5?=
 =?utf-8?B?ZEhDRjFUUFpEaTBlVGVjT1dub0NxQW81MXgxMjlBUVdGMEt6bEIxRks5N29i?=
 =?utf-8?B?THlPbm8zUjFnc0tFZk1NZG1TQWxDNEJVL2l1UmwwT0pCYkNrUjZlWFZscWRG?=
 =?utf-8?B?VGs1amw2ZVdDZTg5bHFYeERUZEJ3a3BjTVQzb2ZRNVRUbWtZNlVYQS9XeldM?=
 =?utf-8?B?cDQ5QlBBMGxibWRUVzluRG5NaTUybFpMaGMzdmpGY0lOOWM5UlRacGJCUmt0?=
 =?utf-8?B?a1BvSVZKaThiZU16M3lXWC9idi9iSUZLM0FnWDlUbjRkT3pxUU1kTkZxbWZv?=
 =?utf-8?B?ZHJjUi9lU3BUdlA5NUJqdFRoaWR2ZGdndFk0TFB6eFRvRnVCcHBXSVJ5R1c5?=
 =?utf-8?B?WXVnaDJJUHpGSTIvSkl2VVNZV3FNbWxMUjFZRTJuZU9QczJWb2JRN3hvWGl5?=
 =?utf-8?B?aVB4UCtnTE9iQzFHa0NmZTBENHNMMnpHQkhEbksxcnVMbHYyN2MvTTJwMVZ5?=
 =?utf-8?B?bjR4V1cwSkEvTWVYb29PVGlXZytmTktJaFBTVldSbE1xT0JlVzNmakNVbGlK?=
 =?utf-8?B?L21McVl2OGhQb3l1THRMaWk0V1kwOGpydFpmNGZiRjFyT2I2TXM2RzMweEVl?=
 =?utf-8?B?cithYzJtNTJ0U1hmVWZVa1d0Z0lkdDlsWWJKWFB2VmQ1RVdFZlg1UnpuVEg3?=
 =?utf-8?B?dnJ3S2ZZalhpWE52dlRXMEsyVDFMS0FnemhuSFJWSFcxUUhvdjIyT1Q1alQ4?=
 =?utf-8?B?bGZFem12VWdtc3lSWXFmR1lQOWVhdnJsOE9mTmNHaTVDU1BweThDWWpNM3NV?=
 =?utf-8?B?eURhRzU3SWxmV20zbWZORDFPNE5waTk0N2VpZWFuSlZSRUxyTXdvbWU1VU02?=
 =?utf-8?B?Zjk2Ry9GN0F1enBXZmNxV01vZU1abGxtRjVLRFhDN1F5UmYydFgzWkNYb0xN?=
 =?utf-8?B?SklXc0RvVGxLSUExYndLbXRuOVExUldlcUZXd0IzN1RpQVdWTGNyY2twSHo1?=
 =?utf-8?B?clppVnFhcEMyMzJCc05OcnhwckJDRHZvUTFpYUtCMU1udnJJRGp5RTdzK0hX?=
 =?utf-8?B?WmVadjl5MFhOdE1DTlkzeHRya3p1K01ubVAvK0ZmaUZuVHFsTDlXWmp5QWdn?=
 =?utf-8?B?WXJ4OUFHbEhBNXExRGwwZFdCc1FPZytGV1VMaTRFZitwSWpuQTBQRnFUYWMz?=
 =?utf-8?B?ZE9QZHo4NVd4NVl2SDlmcHRvVDNJWkIxc2FGZGVYbUFVdkVkS0ZGUzJicnlZ?=
 =?utf-8?B?Y2oyN2FURjFqZnozaXBQb1FmbmRUOG01b25iaHNEMjBjeDlHZ2U2L21FbW03?=
 =?utf-8?B?cUNpNWNYOUo0YXplTEt1aVpoMXd2ekFHZ3FtYVc0SGVhQllhcDkwSkpRNnpl?=
 =?utf-8?B?SWpKanNreTErbTFISmg0NjdNd3liS1Z5NnVqcWVHRnVFd01vaFhsU09OL1Za?=
 =?utf-8?B?TkNpT2FDaG1NcEVGcGFMUGVyL0JlWHBRdVIzTzNIdStaanBsYzJid0FRSEcr?=
 =?utf-8?B?YWVVZldHbFNYTTFMejBNYUhzcElBZ1RJTlU4aDAxdlhNYnh6a3BaYzFpZGZO?=
 =?utf-8?B?a3BFK1prb1JFbFI2WUVWU3JTeEgraGttNE9ZZ24zMUZlbEZhZXhSclhtdC82?=
 =?utf-8?B?TS9zN0xEQnNPVmluOVVLR1pBY09uV0w3QXExSUduMEFoUUtuQktCUmhFdEFi?=
 =?utf-8?Q?/g3i1N/4wLa70CHOn+zkDkoCOYb4eh0Qrc1oxcOyQ5GCR?=
X-MS-Exchange-AntiSpam-MessageData-1: k1OiTFO37hxaxg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 511d6ca4-6f05-4544-be26-08deebe0115a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6063.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 13:07:53.0893
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HVTkTZVjS7mbwNKAd0xTjC4fEbsu/R9HwUL7GiZjV3ru8ytVu9ZJoboW4saX2QZyqcwRHr2jIWFdzLjMEcO5mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9223


On 23/07/2026 11:46, Marc Zyngier wrote:

...

>> Hmmm, I am looking at this spec [0] and it says ...
>>
>> "The GIC-400 implements the interrupt types:
>>    16 Software Generated Interrupts (SGIs).
>>    6 external Private Peripheral Interrupts (PPIs) for each processor.
>>    1 internal PPI for each processor."
>>
>> The table in [1] shows interrupts for non-sec, sec, virt and
>> hypervisor timers, but I don't see a hyp-virt.
> 
> This documentation was never updated past 2012, which predates ARMv8.1
> (go complain to ARM). But the IP does support it:
> 
> [    0.000000] Machine model: Khadas VIM3L
> [...]
> [    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
> [    0.000000] Root IRQ handler: gic_handle_irq
> [    0.000000] GIC: Using split EOI/Deactivate mode
> [    0.000000] rcu: srcu_init: Setting srcu_struct sizes based on contention.
> [    0.000000] arch_timer: cp15 timer running at 24.00MHz (hyp-virt).
> [    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff max_cycles: 0x588fe9dc0, max_idle_ns: 440795202592 ns
> [    0.000000] sched_clock: 56 bits at 24MHz, resolution 41ns, wraps every 4398046511097ns
> 
> GIC400, A55 cores. Produced by one of the worse SoC vendor on this
> side of the galaxy.
> 
> And the signal you are looking for is the one labelled as "Legacy FIQ
> signal" (PPI12, aka INTID 28). The labels are purely indicative of
> what you *could* connect to it, not a requirement.
> 
> Anyway, this is beside the point. Even if the IP didn't support it,
> you shouldn't end-up with a design that explicitly contradict the
> architecture, because that's the contract SW relies on.

Got it. Armed with this information I went back to the h/w folks and was 
able to track down the right person. I have now learnt that this timer 
interrupt is hooked up to PPI15 for Tegra194 and using that I now see ...

[    0.000000] Machine model: NVIDIA Jetson AGX Xavier Developer Kit
...
[    0.000000] arch_timer: cp15 timer running at 31.25MHz (hyp-virt).

I will post a patch to fix this for Tegra194.

Jon

-- 
nvpublic

