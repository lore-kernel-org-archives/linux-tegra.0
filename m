Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.37
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792743394;
	b=cNP0S4rPcXW+szjKuwxHt/SqTHXefNvnqldQos6F0G4LDxJ2TfgIdWBeQhEw8fFUNGJO
	 rwf6HdqzcgZzaQ8Eq+oupyUl9dxT2qlQPiEG5Imo+F+QLVpS6ILv5l1gYzINPfavlaCt3
	 UCFiJintvRlFKPbyDtJ8UXe2mUDVLeeoTHBeIZgzz4wiDu/QZpyxgqH4e7gB1yT2pf/Ej
	 Ox9b0miABcr+kTTSX84pJ5cC31WOW3ypZ5zW9X4qfXUpXFHE9f5dtdXIqotu5DKk3HEmY
	 F0cbbaO4gdVWfuxUmK/rkzON4YWPsJQiMPwEKK6DPg40eAZuY4ZFY043wukmp5XKAUQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792743394;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:Content-Transfer-Encoding:
	 Content-Type:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-AntiSpam-MessageData-1:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=t8vrT/2ViYqcLLQGDswO3ORC3FlgaKzRpz/DEUkyisg=;
	b=sdQUtAUXasib8/nPaOXdTIAtw6MXPHZ16HkOPym+vSlLyoT5JtkWK+7IWI0+OpUn3TEW
	 R+WuDsbchp4jBW7JtSPqBCGhlUCYUXixUQJCxy61HHicVsUnqnPtx5wEONcoOXNMUvCWT
	 A/2T3O2NWgUBDN0C99loJd34F6yBDFYpa9cCsMcedyfd4kZ3416B8NTPz76GNQEyxcE07
	 BFdezJ4KzUXHbrGxvX9gv408TbTonBtkQzIXTvaWv/GiRqauiwhbrqEG1kcGf2w+0N77H
	 sQrOrpxAf8ZiK349XZnrzyHJGXqq9tvLi+a2hBuSOZL4Q5EfwcJc0wy2lGwt5ChlHWA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=TH8QPFpo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.37
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013037.outbound.protection.outlook.com [40.93.201.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1052606A31B;
	Fri, 23 Oct 2026 08:16:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1052606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=TH8QPFpo
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hwX8MHKOfpdoyN/F9HVhGY9H14eM2qLggqzMRWxHMlmJigKJuddiDcQgkF8IUxydTsOSLEBoy07w5wAQ0GnAtgJbNBcQvQpL1lNXqlBM7DhPKerQ9k6Tf1UoC5nleqiu9VoarGuQ0KcD66xQHX4kcxbHoh6zWkW+iA9CWbpu91/CHAfJchvbrwe69xySAGEvpcb99mv6L3RUp+rAJOuuT0mN/pAo44BOjobMjvkwKuNwrMZauT0Ri7SK1a829WfuP2WhhA365jHJsXfaxiYZbNhwBjkm+T7QPaJDR4ILxP5KGiIXBk1+TgwId/Mtd4lMX/SSpTWFgsvPwplUZUyhnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t8vrT/2ViYqcLLQGDswO3ORC3FlgaKzRpz/DEUkyisg=;
 b=TzzMAQNmv0poGa8MJslHFPwRL7JzZswLIVI5342BB9UO2q7GCGk0six2EqPw/MzgfT34WiQv7AAjys/HVYIiIzitzPXwMQhfX8offuekgvthXJ52nkYEBIiuYhUE/zpsjPtIJ/gD4OTh6D5lwckdsZfJN38Lb9Bq4VoetO9B4ujDNZ5t25J2jHWHIcVCimQMN/N9jD3yNKOIkEzCqlhIRHL2BIcFb9L7GoZZtXjzoHXtdoPKRNL29UhpKPQHhLJhfZDQy/R+iEvhPkMyjW/ccgFMW4kjfYnxzBL0Kj0OeKSueKszxYIoKN/PXu5n8RttvnMRWPHTAhr+vznRC6n0pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t8vrT/2ViYqcLLQGDswO3ORC3FlgaKzRpz/DEUkyisg=;
 b=TH8QPFpobMC3491vg2lB8mDMl6uPxrGfDAvhA/fRnjEl4ccjGze4U09PLQdjSO626mZdn87BTLG4Vsqv9PbfOEKTzJtngMoTYyLHCPLA4UCmpIkZPK/spLMfg+kvdNydrOXICEy5s2cvy2YLb1rWzWpuEGvuZAUQ6ZympM2ItjFTiBU3A1CfhKgtZcyMOsb+mHwZrt6pg3VknujxISMBSntFBDctZBFASJKVBmiGHbxJIgRt1WDotT40r+AX8srG+XgR6ND+mH5Y5zUqlLpbBGqKIl8vruxBGD/FOZydihnvG6yFEtUlXE5FOrHbPvKU1hTGYd1Op2ulXfk5RWTx5g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by LV2PR12MB5725.namprd12.prod.outlook.com (2603:10b6:408:14c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.16; Fri, 23 Oct
 2026 08:16:29 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%5]) with mapi id 15.21.0546.012; Fri, 23 Oct 2026
 08:16:29 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: thierry.reding@kernel.org, jonathanh@nvidia.com,
 Austin Schuh <austin.linux@gmail.com>
Cc: anrao@nvidia.com, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, Austin Schuh <austin.linux@gmail.com>
Subject: Re: [PATCH] firmware: tegra: bpmp: populate debugfs in the background
Date: Fri, 23 Oct 2026 17:16:26 +0900
Message-ID: <n59f1S6wQICe5ZxgcNxb3w@nvidia.com>
In-Reply-To: <20261017065012.3063980-1-austin.linux@gmail.com>
References: <20261017065012.3063980-1-austin.linux@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: PS2PR03CA0020.apcprd03.prod.outlook.com
 (2603:1096:300:5b::32) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|LV2PR12MB5725:EE_
X-MS-Office365-Filtering-Correlation-Id: 48124f93-31f8-47cc-925b-08df30ddf0ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|23010399003|376014|261022105027099003|261022075727099003|56012099006|261009223027099003|5023799004|11063799006|261021123027099003|261021121427099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	jnF4jKESAGXZ5oKGuPZu74MIopPYa+RI/W/od1WseKych7vl/Uax5w2Jz9SgovCD2jSa+UvR98H+zLpJdhUakaQTKndX4iUtmv+ypuixAb+XHjuVaFFniMAeJaWfPfF8JbRUgGC9hijDK0IcVcFxo+IwHzXeWWT+zc9Ci+tIpNzxNK/JlBLgzs53Sjbl98OM5LsIH/Ly+3sOdkT5UZNBwibbQBdngPeJ750Ae9+xfEczeZa+UusrwREjJ0Y2lLFCTwkib1cSoI7zREWBvY8HvT0PovDKUMj88RSOt5BH47m0531vppoKSMJ4AFki7INutQ5crR7LaLD17jzNMdgwMM4mgLIGvaYxZoP5Gxt39+AmtSjODgz7rPmSZCI/mZPJ/w4unWTVYPzWVbE7qa6EO/04BlIhIGTuf0k8zt53nkAr8YrLCY+gBfEVk9ShW4r4H9tFV9QF0IWd5aHQMxjU+018inmLk2jflR3nvpDSOhFyHDPD6Y3mfdNoAfGFRqZi8ReSIfXwmjpMfVC2dzIvbT5/PnnHZYxmVuHaKpPMu92uBzYVl/kshRHXjF7FKXJYen08xxj+T3KbfwIgzPhn5ZMDRTHyh8IwsQjH7SN7ahhy3cLqvWmwOj47069o5QleJWo6dZIBAkwfom4+J2viHiZZs6+TDmimG91qmeaJXfU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(23010399003)(376014)(261022105027099003)(261022075727099003)(56012099006)(261009223027099003)(5023799004)(11063799006)(261021123027099003)(261021121427099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aG5uOGQ4bmNrbmpCZnBwQmJaT0xYVFIxaE5IY24ydzlnVmJiRnhYR1I5aHFw?=
 =?utf-8?B?N1ZjckV3aGxiVTdYS3pnelovMlVseGxWbjVleXpBbkJOV0NUL1FPb2JtLzlX?=
 =?utf-8?B?azIzMHNGQ3J4VDNXRUlEVE9JZDZJbFU0bTZSRGhQTnlaWmFpUEhFQm5IZElL?=
 =?utf-8?B?MytGRjZ6dFlRK1pCS3B6d3pzUFBVNmNmRVNQRXJMQlJKZHprNmozd09HWmJw?=
 =?utf-8?B?VkJCcFR6bHhRQ2YvdzMwdmd3bUNSQXplOE94UUIzcVRJWW8zS1gxaWdGODhE?=
 =?utf-8?B?bzNqVWhYdVlNdUxJUDhFNkFyQzh3TUZMeXVteHBJMTZDU2tJVExlMGNHOTk4?=
 =?utf-8?B?eTdvUjNpUFNrWHRXdkRKQndpODZIcHdHUGlWQjZXRHJMbVNBTDMzQ1VUQVJo?=
 =?utf-8?B?d0tjZzUycFVxcmNYWXJJbVB1SmNuN2VKNTJnVkVaZlNCTTBMeGY2LzgrQmVv?=
 =?utf-8?B?bXN6UUlvZjlOcHFNbzVVMVpZNVBRUmQzOHJ4QzZHQnZwS3ZFZE95KzNTT3Ur?=
 =?utf-8?B?dnczdHdDdnhBdExwaEh4Zi9sUXU1Mm1WWThLUHFuS1hRdXlKdEFKN0hqYnBZ?=
 =?utf-8?B?NVA4d05TKzYrTVlFM0cxQjJrWmNIeXhYT3kwN1ZQbzRteUZCRG4yVmNMSkFu?=
 =?utf-8?B?K09HT0p4ZjRKYWh2TjFkOTBzUmdJdXF2R2JGeC85anlsU0V1VzZwdk9aVFcr?=
 =?utf-8?B?RTY5bTczaG5pNCs2SEdBSjdCd1pyY0FvS3hjSkNCTVJjV0JBRXp2bldHckVm?=
 =?utf-8?B?WVRBV2FHYzRwMXRpREF3TWx2NGxtN3FTMjFwMTBub1dhRXZlQnF3Y3BBUHIx?=
 =?utf-8?B?UDRSdEVFRlJQWnNWeVlRSGdibW1va3VFMHgxWm1udXpDNjQ5UWFSTzZ3RkpQ?=
 =?utf-8?B?ZkxuUjFhYXdWZXhlUjY5YTdCVTdtQlg0VFdtQVhPZll5dkpBUkVVK05kQkRG?=
 =?utf-8?B?enljL0RhdjRwQW1uOWJPc0pzNTQ3c2pjNlIxQ1Nvd2lGZE1yVEJEVkJTZDdw?=
 =?utf-8?B?QTdlUXVHa3BRbWNUd2dOOVpJd0o3RnBuSXJzY25TTFNYUk9TODJPZW1KeVBZ?=
 =?utf-8?B?ZThGVXZYZEV6czNYdWpWaWpTK2ZyR1lHVnVVKzJDS3FQbUVRQ1JGdVYxaE5h?=
 =?utf-8?B?YTI4N1hBUkliS3FFRXNicmlRdVlGVWRFdEJjU1lhS1RVempub1FBbGRxSWVl?=
 =?utf-8?B?ZG9SMkcrSkdHWUNueE4yWE83YndqMEVEZXpncStBa0NZY2xodzVKM0FOUzFO?=
 =?utf-8?B?Y0VFZEowdmFHMy9Hekc2OGhxRXk2STRmS205SnB2OVVIa0w5Q3JyNlpQaEts?=
 =?utf-8?B?QlhTanlKZGtVNVU1Z0tuS3hPQ3hhNC8wNWFXSjByM2N6QVBWZnBlOTgwTHk3?=
 =?utf-8?B?dVNZbFZ6TmNpRVlvSS9oZVRta0NlUDMxdzNPYlArVzU0Y1BSbEVLWEdoZ0cx?=
 =?utf-8?B?UUxyb2EyQkovVmE0WVBsYUFQYit5cTdiQnlWU3R3RmdDeXBMU25BTW0xeXh1?=
 =?utf-8?B?K0JwbVR5dkVuNGg3TkZmVFF6OXZvd1I4N3BSd2oyZm9nWWovNUt2MTJNTC9X?=
 =?utf-8?B?M2lVQjVXM0VpZ3NoaEdueFZPd2VKaVc4MEpBL3hsOG94Vm9jVXhnMHJmT2Fn?=
 =?utf-8?B?TFZlNml4QVR4Z3RDRFQ5MGdOOWFRSXk5U3VVRFEwQU1iS01kVWh0STh2S2xI?=
 =?utf-8?B?Y0R5K1dna3RzRFE5MTR1MlZDNm9NOUp3VDMvZWNXY2g4WUZjWEJyMzlNdTJk?=
 =?utf-8?B?Tlg1aGlZTU5aeXhzUWcvbWtEc0FnVGNvdFUrUitnaWlPU2s5Wlg1SUhOaTJ6?=
 =?utf-8?B?ZVJIeWFjSVl0djczNmY2Z255Z0VSWW9CU3hFRExjOHpFclhnamdIdnBjaHpW?=
 =?utf-8?B?ZXpJWHIrYzRFMVhGajdrelFqRDFHZFJ0cENLVk5PNEtNVmZqZ0lLdUYyVThu?=
 =?utf-8?B?Vmw1K1huNkVnb0IyNlZ2TC9kT1N1ZDdoV1lsMXZiclgvNXFnZkVQTzNaZXVn?=
 =?utf-8?B?M1F5RWlRQUpZTG5HMUtGSjMxUS9xYkNlbkt6cE13MjFQK0twbGFicjRhQ2c4?=
 =?utf-8?B?Yi9wMlpTM3pPZGY2anNJc3dSN1haQ3AreUtvSG5rMjRac1oxM0FJNEhjaDYv?=
 =?utf-8?B?cm5MeU1vdEdvTlZUSzZMRWZxK3Vzbm5JU2s3a2lFL0JWTzlqbTQzczIwVUNZ?=
 =?utf-8?B?c1RpVUtsdFV0SlMxaFgxYVhGemJ5ZjQvVm1VaTRQL3l1VUdVV0ZYTkRSVVk1?=
 =?utf-8?B?N2N4T1ppNXBkS2twaGpqNEZJSjdtMW9JUHR1dzdHRHNud3RFT1k4TVMrTk52?=
 =?utf-8?B?V3lSL2xpZlkySUNtM3NybDNkNUswTUkxNklkMWNOLzZXUlZobmt6UTZvcEpX?=
 =?utf-8?Q?IzArL39lnpD6daYi2VbkDXEXYgC8POSHrZMm0wKASufY9?=
X-MS-Exchange-AntiSpam-MessageData-1: 2xVWBTax9R4IRQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48124f93-31f8-47cc-925b-08df30ddf0ce
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 08:16:29.8027
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LMQpcFPIobugIuxvXNjEue4t5eBzufLiWKAUfD5jShQcC4iBgja4p7xfa7ivYu/Y49eI+4+e32mu8tT/579N8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5725

On Saturday, October 17, 2026 3:50=E2=80=AFPM Austin Schuh wrote:
> Populating the BPMP debugfs mirror takes a series of synchronous BPMP
> requests, several per directory.  On an Orin Nano (Tegra234) the tree has
> about 10,800 entries, and the BPMP probe doesn't return for over five
> seconds.  Every device that gets its clocks, resets or power domains from
> the BPMP waits for it, which on Tegra234 is nearly all of them, so PCIe,
> NVMe and the root filesystem all come up five seconds late.
>=20
> Commit c7fc690da6f1 ("firmware: tegra: bpmp: Allow BPMP debugfs populatio=
n
> to be skipped") lets a system that doesn't need the mirror turn it off wi=
th
> tegra_bpmp.debugfs=3D0.  A system that does use it, for instance to set
> clocks from userspace at boot, still pays the full cost.
>=20
> Nothing in the kernel uses the mirror, and the probe already only logs an
> error from it, so populate it from a workqueue instead.  It isn't an
> async_schedule() job, since kernel_init() waits for all of those before i=
t
> starts init.  Userspace that reads the mirror right after boot may find i=
t
> still being filled in.
>=20
> Measured with initcall_debug on an Orin Nano running 6.18.39 with
> NVIDIA's patches: the BPMP probe returns after 1.2 seconds instead of
> 6.36 seconds.
>=20
> Assisted-by: LLM
> Signed-off-by: Austin Schuh <austin.linux@gmail.com>
> ---

Sashiko reports some hard to trigger but worth checking concurrency=20
issues.

This does seem a good idea, but I am a bit concerned about the change to=20
what userspace sees. Ideally we'd be able to have userspace stall if the=20
debugfs population was still in progress. If that's not possible, at the=20
very least userspace should have a way to voluntarily wait for the full=20
debugfs to be available.

>=20
> Notes:
>     Based on tegra/for-7.4/firmware (1bbcf4a19f14).  Built for arm64, W=
=3D1,
>     no new warnings.  The timing is from the same change on 6.18.39 with
>     NVIDIA's patches (where the probe also has the VDK check), which is w=
hat
>     our board runs; I haven't booted this branch on it.
>=20
>  drivers/firmware/tegra/bpmp.c | 35 ++++++++++++++++++++++++++++++++---
>  1 file changed, 32 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/firmware/tegra/bpmp.c b/drivers/firmware/tegra/bpmp.=
c
> index d3508e98e338..535ebbd55a6f 100644
> --- a/drivers/firmware/tegra/bpmp.c
> +++ b/drivers/firmware/tegra/bpmp.c
> @@ -16,6 +16,7 @@
>  #include <linux/semaphore.h>
>  #include <linux/sched/clock.h>
>  #include <linux/slab.h>
> +#include <linux/workqueue.h>
> =20
>  #include <soc/tegra/bpmp.h>
>  #include <soc/tegra/bpmp-abi.h>
> @@ -1052,8 +1053,26 @@ int tegra_bpmp_init_dt_providers(struct tegra_bpmp=
 *bpmp)
>  	return 0;
>  }
> =20
> +struct tegra_bpmp_debugfs_work {
> +	struct work_struct work;
> +	struct tegra_bpmp *bpmp;
> +};

Just inline the work_struct inside tegra_bpmp. In any case the work=20
should be synchronously cancelled if the bpmp driver instance is going=20
to go away (not that that will happen, but good practice).

Thanks
Mikko

> +
> +static void tegra_bpmp_debugfs_work_fn(struct work_struct *work)
> +{
> +	struct tegra_bpmp_debugfs_work *dw =3D
> +		container_of(work, struct tegra_bpmp_debugfs_work, work);
> +	int err;
> +
> +	err =3D tegra_bpmp_init_debugfs(dw->bpmp);
> +	if (err < 0)
> +		dev_err(dw->bpmp->dev, "debugfs initialization failed: %d\n",
> +			err);
> +}
> +
>  static int tegra_bpmp_probe(struct platform_device *pdev)
>  {
> +	struct tegra_bpmp_debugfs_work *debugfs_work;
>  	struct tegra_bpmp *bpmp;
>  	char tag[TAG_SZ];
>  	int err;
> @@ -1089,9 +1108,19 @@ static int tegra_bpmp_probe(struct platform_device=
 *pdev)
>  	if (err < 0)
>  		dev_err(&pdev->dev, "failed to initialize sysfs: %d\n", err);
> =20
> -	err =3D tegra_bpmp_init_debugfs(bpmp);
> -	if (err < 0)
> -		dev_err(&pdev->dev, "debugfs initialization failed: %d\n", err);
> +	/*
> +	 * Mirroring the BPMP's debugfs tree takes several requests per
> +	 * directory, which on Tegra234 adds up to seconds.  Nothing else
> +	 * waits for it, so do it in the background rather than hold up every
> +	 * device that depends on the BPMP.
> +	 */
> +	debugfs_work =3D devm_kzalloc(&pdev->dev, sizeof(*debugfs_work),
> +				    GFP_KERNEL);
> +	if (debugfs_work) {
> +		debugfs_work->bpmp =3D bpmp;
> +		INIT_WORK(&debugfs_work->work, tegra_bpmp_debugfs_work_fn);
> +		queue_work(system_dfl_long_wq, &debugfs_work->work);
> +	}
> =20
>  	return 0;
> =20
>=20
> base-commit: 1bbcf4a19f1495f769b69e9569d8c1e81df074f5
> --=20
> 2.47.3
>=20
>=20




