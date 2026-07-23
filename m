Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010038.outbound.protection.outlook.com [52.101.56.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B95A3446C7;
	Thu, 23 Jul 2026 10:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784802190; cv=fail; b=mcwbwp9V+hPr0KDLIZM6KFt9yih60JutNdzfBdBkJujMlZLtWwZJ8suTj1W4kQgTbzd6RwgiYYDzvToEvuX7MEDkR8oNzemMvz+cOxdJ8xgQJvrTnLMCYXTmLQPgken9DOor/gBqjGrUj+J5BJKpxgEUzn4oKYUG+EIdR6N6J30=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784802190; c=relaxed/simple;
	bh=hYB+RROVWjwQdtsT4r1GyGe/dKAWT9CQveACxLhAkIQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=EzGqPO//UWacJFVtXsy0W02JpP813FjrkUwXT3x6LSqVd44UpQ0sCglhmwZ0qaMkbh9xXxqTi68HmA2Ms62NhPJ3oSHHma8hw4lsAjYHPcqvI0IRy2r8QJAlm0/FOX6IItg/rDOZZonaxIKoZwwfNr+mY0iuAfi2X86YgZ60MQo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=c+qwFSus; arc=fail smtp.client-ip=52.101.56.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="c+qwFSus"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J+1zrcjcuAPdwaCXv0eyrHFteqIscP+4IfTIPs+t1wfa9VhSsVhyJtsf83p+uXbiCbD9v1jozFIUysBHI9LrijaqE0hb5IJPL2JUI0ZpDPm7djPhBMmtOM3GBJ7MNz9ukX/nk9jDmlFAOXs0kgTeY4yt3xDVQ81y3K1sMlGP0psEfK/E1vXiRe3Lhck6tCFhBXdQ3ZQ+SX1nT5k5GXTfDENMsL2JPIGF5kr91T1fy/L5ZaF5qM50ZgoYjxFSFC5wzbtoTJF9V1f64SXfSfXeL6E+NswuzLNvj7QFO6PnP1KN51SqyjYL7U9XjAxMYRRP1q1AUO+9y/cg7GPH4yaH1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PxXnPizgi02Cqm+MLO1aE7Xxfp82Zw49XIdFWvJplA8=;
 b=KE7gqgBZB9CctNWa4IoF1tflF5jz5oGdy7dggXIKktsE+wV3AlA/G0PAf4zNnXwlK3vP60FFt0fIF5yvnMHi2THWeir20qZNqlMzipY/+FoXqqDE1O9AJA4VxpO5bT2A2X3xUO5rXQqJ7pB62cnCzsTa6aafsHEu8WVajlkU5bIXc58Fmz5Bh7ZCCLkHORk9umvEf6y/AiyModCZl/2e18mUVgWUHJy4+XQClTkhovPSe2pc/MGZkdulGuZ1GpHwdUXpwB6Dkji4oPFElYcxknrL4j4avsowfkNQnvfUd7Wg3Inn2FS82Lpcvau8lWXzLTkbC/qUmZ3AChzYo4A1jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PxXnPizgi02Cqm+MLO1aE7Xxfp82Zw49XIdFWvJplA8=;
 b=c+qwFSusErCFzfotJxC5r1xv4yflTPTHlhT2e8CmsudnhUd/Nux9tr5tD2QnnOhNznFrfTfHW+mQhWR/bGomfOBhtZQBdhM0od/H786f9Hf4Q6BR25Zr8FFc16NMqNzE/3FyXr0PpQvgGasXcyFiz1WrCjTN5eHPU7g5gw+axIeK8BwQ6SYuyW0AGTz7dQBVX7x4UB6jFmE4HnSnbkJ0gQMeU2PT90uOnoj2WAp+pN6kGrlziEpJU8tRZv1bzduZS4fiAg4RkhScfdCyTadn7GQlra0bvSmstUSyqNhuQLRV5fkvnkaD0JBCMsMQo0M8GoNxvt0TKIhZrCyxF85w5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ1PR12MB6051.namprd12.prod.outlook.com (2603:10b6:a03:48a::18)
 by DS5PPFA3734E4BA.namprd12.prod.outlook.com (2603:10b6:f:fc00::65c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 10:23:04 +0000
Received: from SJ1PR12MB6051.namprd12.prod.outlook.com
 ([fe80::96e1:b300:7b78:d3a9]) by SJ1PR12MB6051.namprd12.prod.outlook.com
 ([fe80::96e1:b300:7b78:d3a9%4]) with mapi id 15.21.0245.010; Thu, 23 Jul 2026
 10:23:01 +0000
Message-ID: <e5a32fcc-ca3c-4b54-a790-d2eef2c636e5@nvidia.com>
Date: Thu, 23 Jul 2026 11:22:54 +0100
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
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <865x26do37.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0278.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e6::15) To SJ1PR12MB6051.namprd12.prod.outlook.com
 (2603:10b6:a03:48a::18)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR12MB6051:EE_|DS5PPFA3734E4BA:EE_
X-MS-Office365-Filtering-Correlation-Id: 177bc8a2-0049-4df8-70b4-08dee8a45f4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|11063799006|5023799004|4143699003|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	YNusQZB9pQp0P4IR05xxnrVmMQVJONobliNBt4XLLnv1jlKS9pTdJCQiDmFkiAFAho3oHevmmT965/trTaZXWj3UGrknolMOeWCBpu/RDXWbCbUM7VblwGf6+E/hnXQJnbBvPCQY2dm6eUgk/S5w27Cl0B05Zbz1o8Ik3cQ9eNQ+N5eIdgkirRLOG/KMDBL+F6o/RVxXgH/HpXQiNaxpWBuJQcM31EXhYh6sg5KwTnaAUZMsssfwPW+NEzUrjmgz1B/ry7Y5n2hiq2ghB4s1Sd0Ri3jrbDMsI0ZnlhMaEqgbnEol4e65y9TrNxjfrhKkUMFFpnuzWrKg4Je+5QwrPTe2eSA/loK9Zb/aShVCdkieU9r3LzukAi/PN6OvhYeDkwD5i3txlLz+2I7DIgo/VjSvCj3qg7A/X6N33m6GTUb2RxRVM0W4gCOwb3e/uopKYdb1TB4i2W3DrdTFhvv58iTfl2dW22EVjECrtxyHoWEy5ffyWN0geMKlFRat8gU/uO3KOq6eIeD7Z7IBUKyywjEI60YbEXFvCr33H9zHgyrzLSfgA+7K+xhn7z5H77vf+V3GQsc6eVQhMM6z7X7fu4SwJ0QYPGXJAnrzKymHE7JtoH9aKxodJN0kr7f0ljT2VQ4GdNnLUtncQFK//ZfLKDVyYVq6RtGysmLqRwmWjXk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR12MB6051.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(11063799006)(5023799004)(4143699003)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T0d5Qk51VW9xeW1pd1FQZ0pieTZ6NkNwamtoNXluSUlBdWhrMDVzNkk5bjI3?=
 =?utf-8?B?c1k5blJqOFNhWEJMTkZPWjU1MlZ1VU11cDV3SzR3NEhJQW9hMjlHMG1kUjI2?=
 =?utf-8?B?cVZqdUR3MU9aZVRnbHNZckFwQmJjSnIxNUg2bzlRTlBlRnVuVDFrNVdqc1dj?=
 =?utf-8?B?cWJTT2RrM3BSTkdCV3B4ZXZoUEN5NElPZGZxWUY3OXYxQ0QxaEM0ZlpnMG9G?=
 =?utf-8?B?ZEpZUEJSdU9IS1FNdlRHUjdYSHBYNzVIaWkvaDBXUm5vUjZHZGtja2laVWlB?=
 =?utf-8?B?QUZ3VURmSVdlNW12ckxhWTIvTEpLUklJU0RkZHhwQTQ3VG11YVY4WnZkWE1j?=
 =?utf-8?B?aXJybHk4STZUNWVVVy84NjI2WFZvNXBNdDBUaVFpY29pNmFvZ1UxaVpZOGho?=
 =?utf-8?B?bjU4ZXFMZXkxSDlKM2ZpVEpBcXN6SmwwbGdZMlIyUGVVWW84YXNWcy9aSm1i?=
 =?utf-8?B?ekxqRUhsbXZabFoyUVlVMHdXYmZ0ZUVOelJhaG5TR1BoZi8zN1JLWVJLZTg2?=
 =?utf-8?B?cWpHSGsxOWk5NjQvZ3IraXJVcEhzclRuazNKNTNBUytlQTFZTmcwOEdkeE9U?=
 =?utf-8?B?TlBVOFRuMS9MUXJ4LzdVMlh2dVIva1lRS3FIWlQ1SW9DWEFuczYvSWZSYUFO?=
 =?utf-8?B?OHUrOE1JT1k4OWlNR0VkT0diM1ZVWVRabi9XdmxJc0lkZnlNNCtvc2xydnRL?=
 =?utf-8?B?N056SmlJOEs2eTdpNE1kSnU2cWZTcVJSMnpRSVZsbGxxMG43dGZMUUIzOUxJ?=
 =?utf-8?B?L2NrbWdlMldrcTFyb211Zjc0eXdoUUwxV3poK0Raa21NZ0pmNEpqNHJicW04?=
 =?utf-8?B?eEZHTTN0ZVFVbW9Ed3UwNGdINi9hTFdSUFMrS0hqZ29qMjRvZzYraS9VYk1z?=
 =?utf-8?B?T1hCakpzNEFjOWxETUg3NnBXbUJTaFVjeTdMMmpNL0FkR3BXamFubjJXcGRp?=
 =?utf-8?B?U1JVRFJucXNRK3loUmJGRDJ6ZmNiZmg2SDh1RlV0U2luSDh2WHhhVUFkZ0V3?=
 =?utf-8?B?OEFXekRaQm1MQUxBVi82bHZEWGxLRkVNWEwvMEhBMGZ0SDJlVzJadldZK1p3?=
 =?utf-8?B?MG5WRmkzeEdTdVY2RlhrNnl2VVJnaThuTzdNbGFBcHNuNVZ0dGdSK2I4TE9t?=
 =?utf-8?B?RmFYTUw1NmlyMkVUQ0JGd1pYbkZzaW9sZEJ2dTl5c2RDL0RTVk10SVFwUVI3?=
 =?utf-8?B?SXIwV0hIUHhsMGlLb2RqY0Z3WFFHdWowUm5wWEVGUUxkWDQ3Uk1GSXQxNWkr?=
 =?utf-8?B?T0d1WTBEbURXVVFkeGo0VENBbWhyTW1ZOG1XWTBIOXRaTlM2eUpIbDVzSy9B?=
 =?utf-8?B?RUFHN01XY0xyMlVKc1NXZE9hZWJwZ1R6L3pJNjBwMUw5SXo3VkgzclV4ZlBt?=
 =?utf-8?B?QVJsSnNSbGt1TFFsRXVpT1NPR2NseEFibVhWcFRqaTA2WXRLMXREdlFjamRW?=
 =?utf-8?B?elhVYnlaa3AvSnJaK295NnBZRnVwd1JhNmp4bE42aVNmMnFxTkFBdmlyRFN5?=
 =?utf-8?B?WldhK3RmcElQeklWZFZMK2oya0VHQk5mVWpkTG9TNDdCT3ZKRHhHMHRKZk9j?=
 =?utf-8?B?WHFDWmJ5M0NieGNpZWNyaDNnL1JMcG5tRStsWVdkeUdTQlpQZ1c2U2xMR3o3?=
 =?utf-8?B?c2tIalM1T003UkV0aEhjRlpLTjNjL3ZERW5DdTJkY2Q4Z1RCam9yblNaNUNT?=
 =?utf-8?B?NWlGZHI5R0VWMWxJWTBLT21BT1BOQ01jZ21yU2N1N1ZUdkxHeVhLeGJaUkR6?=
 =?utf-8?B?aU5hQ0Q5NnFobXB1bEVJYUpINGlrcWExaFpiNjJmU0tHM21pYlRTVE1QSlFK?=
 =?utf-8?B?RzAzNWE0ZGR5OC9HVjNiQ1FFT3lOUEFyM2Vsanpmd2lYYm5mWW9LcmRiU1JE?=
 =?utf-8?B?Ti9FWnV4aVg0eVNMQlJNRmdBQmQ0TmszdWxURU85b2I1cUdGK0tnZVdpV1Bw?=
 =?utf-8?B?L3Exb2JOTTFVaU1lLy92YWhIZ25JbFoxclVuR1VQMVhkUzBBTlF2OUlrcEI2?=
 =?utf-8?B?MjVlQjBXV0JSN0tRcWtMRlJtc3pkb28wTFJ4QWxEUW80M2V5T29JSWJTdFB1?=
 =?utf-8?B?aTFCRlpyQ2hzbW10OEJXR2RNRjY1SWRhWUI2VlJuNTRpblhVQ2l4UzUvSkI0?=
 =?utf-8?B?MzRFMStNYmxUL3lVZUNEcHJhN2hBRUJ5cUdkb2d4Ynh5U29pTzNmTHlVYk1w?=
 =?utf-8?B?UlZ3K2Q3SEs5NUpUVU9BOWd1YUQ3ZmZ5VDNmS3pRRGJFdUxhbkVid2wrWjVM?=
 =?utf-8?B?OEFGSm5CbVRPQ3ptVnNvZFFPTFdqN1o0QlJ3M1lSTlVJU1NTdklhQmFuQ09V?=
 =?utf-8?B?TklvMFEwNUp5TmpJRXQwcGFmTU1SdHBBMkUzS3RuTkhtbTRNeDh1Zz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 177bc8a2-0049-4df8-70b4-08dee8a45f4d
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR12MB6051.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 10:23:00.8974
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d2nlU9XaWhGDUeI5J9Qqka6vfNe++Q6ZzRzeIGU4JerZlUxbshxo49Lq2eI52pOgI+TQNpRhhRqm+O6LFeGXnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPFA3734E4BA


On 23/07/2026 10:58, Marc Zyngier wrote:

...

>>>> I have posted something similar for Tegra [0], but because this is not
>>>> expected to work, I wanted to avoid the warnings here. We test for
>>>
>>> "not expected to work"? In which parallel universe is that a thing?
>>
>> FWIU, at least for Tegra194, we have a CPU and GIC pairing where the
>> CPU supports this but the GIC does not.
> 
> Oh please, you know better than this.
 >
> It isn't the GIC that defines the number of supported PPIs, it is the
> *integrator*. I.e. you. The GIC (GIC400 in this example) has full
> support for 16 PPIs per CPU.

Hmmm, I am looking at this spec [0] and it says ...

"The GIC-400 implements the interrupt types:
   16 Software Generated Interrupts (SGIs).
   6 external Private Peripheral Interrupts (PPIs) for each processor.
   1 internal PPI for each processor."

The table in [1] shows interrupts for non-sec, sec, virt and hypervisor 
timers, but I don't see a hyp-virt.

> I have a collection of VHE-capable machines with GIC400 that correctly
> implement the EL2 virtual timer PPI (if even Amlogic and AllWinner can
> get this right, really *anybody* can). My conclusion is that someone
> couldn't be bothered to drag a wire from one end to the other.

OK, so most likely I am still missing something here.

[0] 
https://developer.arm.com/documentation/ddi0471/b/introduction/about-the-gic-400?lang=en
[1] 
https://developer.arm.com/documentation/ddi0471/b/functional-description/interrupt-inputs-to-the-gic-400/ppis?lang=en

-- 
nvpublic

