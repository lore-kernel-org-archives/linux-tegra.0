Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010063.outbound.protection.outlook.com [52.101.201.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E9E2E172D;
	Wed, 29 Oct 2025 09:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761731735; cv=fail; b=GvSlSDkGBBpBspNhHM/Dk+EqM+bw0mCwweSjgSMVF8YxN9t74ECf62p+/G6B/z0aexCHWjfTvqWun9GoS3FEfH4oRlhonwffYJan8ERO8ydJtR7DYFW+1Z/BGCO4U6Md3fooLi4LfksrqGoYPeuAb1jluUoga9wrCBM+MdhxILs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761731735; c=relaxed/simple;
	bh=f7BxDBCSSHZEZ7ujHfrwdvYjDyUVdpyL8ZOSMWBwwFw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Ck538r0bSWZZ6PUMICPmHTvrrkUHoc7ZoRWwtRx5YcILanZYzzwaHlyTGHncu6x2htSVhAxM7le2RiJc5xh336MRff35Ux0uBnry1vT/qHSOu4FpjKFy+gfAAHW5MsYPL28c2NlqhYWyByKxUYE0xQSkO2LsR8+5BricwTQMVZ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=EkGbrx9w; arc=fail smtp.client-ip=52.101.201.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="EkGbrx9w"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sV/2SWcUu+/IooGGvluK8E9kr3Bc3yh6/wFkdKZwuLMRSK6m8gBQxCfvOVZogGwmui5Wclief5i8Lk0eSrOrT1COXZYA+X64vaEveEymcZA91Ys9hES+CoiD/XifAVd40THt5D4Nkz/c/oHWGDBopoYy6jeE6CUp3jAWa2OuimrCsN/mAy8/UjnPl1m6k5w6yT/odfxHgGQQ+5pCoiJwgVDV7luMYYh+7KqD7+chuxlLmRHyIHGjGjY2QIP9JkmmD5iPj2gEs9pluIK4mlNOBbFhE1bAKP5cWws5AwYhVJDAp0FU6fgz/gmrWRA6vyWB7Cheiou9kz6rfT8b4+rLKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iFjFI1PR51dQyzesPkqVp++1GfbRbbdMSjXTCL3KNjM=;
 b=q+md3vM8r4uuNNWxhZJlpfY4GGur4TRu4o++QMx2jhzZtNoMjsqgHkFBms4Oox04/4g1UGD7QcrkVSJLoGCIB4TdwaDMQr+nc5LxAMeermt/OVHWDDC+SatLxO6mOio9k42vpjkrdkn5vQt55utBpKxbR5+JGL6R7Oo2GMDpPZZZk+pJnGOSoL2++ZzOihnalqEnOjToSLLXoaJyGd31R/By5A72pEUtGAwhMECcRbDqYGnLSxMkz3o26CWGIGAJqloIrcj63EfaJmJb1AWJ6AHBBWPhUUwXprREpLPtr2dEp0rbr4cnS+jP7fdwgRViOlwE1JyGHBK+38ZMyDdiYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iFjFI1PR51dQyzesPkqVp++1GfbRbbdMSjXTCL3KNjM=;
 b=EkGbrx9wyPr2cMGMZhEfyLVAtjvZJqkzdc0V07wXhNaC30ETNCR33mjnTPWb1+Z5BOoBbkofg7Nl8qHRfeV9yWP43DBL/2wGADYABn+hL8INY/Vrx3P5AL00CBtGj8hpnpXc78zdnOpssftQHCiGmkgMuFBEIMpZgiGUaQeVJmUP58iR92WJUodsJe3ZWpmXAzgvXTyyQyrzr30lxBJhtAcodzS5IGoF14fL0jbtlREYYwoIXoIVR867qlLAj9sPULor0KGu0VV5uFLQosIU0YgkLSvZGVO9o4gTGKjvA4yTZ4qzxGT+Ipgxd6nOq9lrTUwCBqvHflRmdNZMeMfXLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by CY8PR12MB7587.namprd12.prod.outlook.com (2603:10b6:930:9a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Wed, 29 Oct
 2025 09:55:30 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%4]) with mapi id 15.20.9275.013; Wed, 29 Oct 2025
 09:55:30 +0000
Message-ID: <34d86deb-1087-4112-ba7d-bbc0cc542635@nvidia.com>
Date: Wed, 29 Oct 2025 09:55:25 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: tegra: Enable NVDEC and NVENC on Tegra210
To: webgeek1234@gmail.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250816-tegra210-media-enable-v1-1-bdb1c2554f0d@gmail.com>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20250816-tegra210-media-enable-v1-1-bdb1c2554f0d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0428.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::19) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|CY8PR12MB7587:EE_
X-MS-Office365-Filtering-Correlation-Id: fc7064ac-c309-4692-a474-08de16d14b8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z0pIRGxqTmVJdTNDUmc1NEpwbStCWHBDTTlCa28yd0UxelFOU1NMVC8yR2lP?=
 =?utf-8?B?dVVMVjRxeFozeWhtTk9qZzQzZ09LUy9oQm40OVZDaFVVMEdsNFhaZGZ3NUpy?=
 =?utf-8?B?OG1xZlRBS1E5U1Evdk5nY0FIbjQ5a3JVNWhsdS9zaUszNG1va0hBMTNzY2xL?=
 =?utf-8?B?L2FnbTN3eUk0azBqWS9aR0dEcTdKY3FDQU4wSzBIOWY4UHpCVS94dmdtc3Vy?=
 =?utf-8?B?N3kzTXRya3pBaDRhV3JoencxMmppanlqblY1dldiQ3dtVjZRRkN1ck5lSVlC?=
 =?utf-8?B?L2pVbmR2UnpIdSs3bFYrMGdiQ2lzT0NPV0g4OGhwMWlQQ2FLSVY4TWJEVnhn?=
 =?utf-8?B?U3RhU1dwWkltcDRXOW1uOTl6UGRST1U3eHBWbVcvcXFEQmRRUTYwUlJIeVZN?=
 =?utf-8?B?aWFkOStyVWsrMTlGbnBsSDUyVFBzamdZUVh6L2g0ZGRsczdPMDBjYmxORUNZ?=
 =?utf-8?B?ei9yYjMvNk91U0VITUdzYXdTeU9MSEc0SjYwYUNYU1BRc2pWbDlYTStTYUdM?=
 =?utf-8?B?TVBqWDZxSW1wTTFnUGRNT3JiSHJib3Z5V2xwUVNVcUxzOEZ1bjcrVm5ENVJl?=
 =?utf-8?B?TTd0aEkrYXA0RWNMKzVUZHVWWGQxb3hoL2Z3VkEwRXBEb2pHNGZCR1FzR2ND?=
 =?utf-8?B?bE5pRllhclRYTExTSk4yWjRpOVZpeXpDOVJGblBMcEs3S0FqTmovMmxLRW5u?=
 =?utf-8?B?Q3ZjZlgrNCtHWUFKR2dVeFJ0K21hektETjhKWkNpRTU4YnpzQnBjUnZDNk1t?=
 =?utf-8?B?OVBRQWtGcjcySmNjQUFvd3RidnhqL2ZyOHRlTlVXZFN4aGgrenBQdW44VzNm?=
 =?utf-8?B?eHJGU09qQ0RKL2o1S1hmV3ZOc1o1OVJUSGIxejhsVUdyMzcvQVlyVnZVRTVq?=
 =?utf-8?B?S1lIZi9IOVkyam1xbjYvOE1yZVZxUi9PczdzQjNuRytTNnZYRm1hdFlKellw?=
 =?utf-8?B?SHNuRUdnSHIwK2g0TFZtMnhCejJ4TTF3aUF3YktjREhDVE1DMWRDMzllR3BL?=
 =?utf-8?B?V2JJclBpeXI1ME1XekZSOUV5V1dGVzZ4SlViZ2xWUEtyWnFLTDdlOXVqVXJn?=
 =?utf-8?B?Rnc4czZXNXQ2OEZhQnord1QyWkkwNm44T3NtUmxlUUNwZUhjSDdDOUR4dTVF?=
 =?utf-8?B?M3RmRTFuTjcza040TTFHYmVpTi9MRnpqZVpSMGk3WG9iK0RUSUFWS0lZeGtL?=
 =?utf-8?B?REFwRXA0S0lIUDRNeUUweGM5YkNpMC9mS3hNK2RXZ0RJb09DOXJRczVFNlNP?=
 =?utf-8?B?NVQ0TXlKRlVCc0pvc3pKRUtXZzVNSlVRT2xoWkVPSDZJZVoyK0ZtVHBEODhS?=
 =?utf-8?B?c2EzV09BVElrRnlNUEVzSHZEbktzTFlzY2FNeUJIdkdmb002emk1czM0V2Fh?=
 =?utf-8?B?d25tcEoyU0cvYWI4eis0bnBNTnd4RHpsQ1lQem53TEMwc1IybzVQYzlteDVV?=
 =?utf-8?B?WXdWbFkxTTF3N0JNOERkdUR4Skd5QWUxMEd6WDEvMDgyQ1kxQ0l1ZHhZSTlG?=
 =?utf-8?B?dzBuMWNOUTBNZzh0bnVXMElyRG5LTU1WdU9rTGtCNmZxMmFHaDZUcjNJaUc4?=
 =?utf-8?B?Y0hUYUY5eUpZMlBJK2pFTEFnQmFuSGFTS0d3aVI3RWZnOEcxTGp4MVJ3amxq?=
 =?utf-8?B?R0dDaTZmWlEvYWx0OVlQTUhDNG5HN0d6aUt1Vk9KeVl4VEcxNGw4c3Q0bWg5?=
 =?utf-8?B?c01YZ0FSeEdrMHRuSjI4QVRsR2xUQjZ2bDc0Sy8wdW9ueUJiRWJub0FmSlBN?=
 =?utf-8?B?U3V2ejY4Zi8rd3RwdXRzbTFjdGlZZGlleDNna0ZLSTV6VCtPcU4xeHdvRllm?=
 =?utf-8?B?L2ErNXlwYW40MzNxTWtwNEhHTXVMRitkRTdaZnNESmNtRmpIbUZOL0x3c2Jh?=
 =?utf-8?B?aHpMWXNuem03MlhneC9TMGZZVC8vZjQzZit0RGRST2RUelptM2ptQmtKZys5?=
 =?utf-8?Q?7BEE3veiUi4FPS22L3liGFECv64msK9r?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZDVnejJJYWt2czEzcXhwaTFRYUlaTVQrTHhkZ1lFTTVjSVlnWk45SWE3R1dp?=
 =?utf-8?B?VDhCb3pUU2F1RkFTUVlyMUdWa0NMU0JGYzdlOW01Mk5jQXZNYS8vdTJYS2VB?=
 =?utf-8?B?MEI4SDdZNUZVdTBCc2xpUm9TSjJSck1kVkE1UTFLMmdSOVppVlhSc0tMajlE?=
 =?utf-8?B?R05McFZkNzU3Z3JucDlJMmVYU01meTJkY0hKcHU4V3lmQ2hMLys2Y1dvRHZk?=
 =?utf-8?B?N0xhQVFINjJ4VlNxN3E0MVU4Y0NMMENQODBpYnphQTdJTkFkdGJoS2Zhbmtu?=
 =?utf-8?B?N1RvNWhJVE1oOER2MjFmYUZPN2VIa0lIa1JUc3FtSWNua1JHWnlqcHg4Q29V?=
 =?utf-8?B?cmVBb3ptRk9NdHJmTTR0b3ZZY3BrczNHK09odHNIWkZaU2Z3ZTZDV095dEk5?=
 =?utf-8?B?YWJkWEhvOGZaVHN2bzFydUdxUTFkcG5yOTU5QXFBOHpSSWxXcFBIYVRSQ3RG?=
 =?utf-8?B?UlI4SkRGRjM3cUw0Y09HQTQvenA0NUFXT3N2L2FaUkJkN0pzUXlCanNON005?=
 =?utf-8?B?bU0rSExoeDUxcUtpaWpod0JjUEhKcmtqc2d3TU80M3hyTmxNOGhIT0JrZXRO?=
 =?utf-8?B?RFl3RU9JdDNIbGxXbmlIY3Z4a0IrNWFZcGEyb2x2YlNjT3NmQlNVVnFXclZa?=
 =?utf-8?B?YVhJQytYNDhsWUdPL2NFRFFnbUlNNUswdTI5YkxMTXJ0eHh1d2xwaTExbWlG?=
 =?utf-8?B?eUpab3U3K0pJcE9RODVjd1FteDhyL3NrdkVySUtNQXZTd1RVV2ZZRmdBV0RZ?=
 =?utf-8?B?TVZRdS9UbWlGOHR3VjBFdVY1TG9mMHE2endtUHIvODk4M1VYWGZHQWVPWjho?=
 =?utf-8?B?MDJTVjlkY1dyRDYwU2lqRkxLNE5qcDQvR1BUQlJMMzAzZTd3eHZBNy9VOWV3?=
 =?utf-8?B?YlhDVkJyLzZXQWhidW5TK1B0N0pvKy9PRWRVSy9CQmFCcE9ZWXQ3ZFNRMDM4?=
 =?utf-8?B?YXVFeWlDSUpMNExlWUt6eVZJSDNuclVHYmlvMElScXk0QXpFemQ2d2h3UEU3?=
 =?utf-8?B?UENVaGlNMFpMdUNTNnZzR0grdnpiV1I5RjllNTZFU1lnT3RNRk9UT2xvUGxG?=
 =?utf-8?B?ZExzcXZ1b2N3RHlXTUlaUnRHMURVdHdMMWxYamZOZVljUEg1aGtVTlVsUldH?=
 =?utf-8?B?ajNXRlVEelkwcmpTOUtvVllwZ0x3UHIxZldqY0VXamlpeW9NaHVleUp3RFBa?=
 =?utf-8?B?ek9BbFJIMTM1b0JvaVJFMnprZEZqSGtuVnRYTjFjd2wvWmExMDlDMUtuUFRR?=
 =?utf-8?B?cjdpSnJXMzVVSURmZGFoc1ZsNTlCMFNoOWtlNEpCVC9RZ3krbEpmUDZwb0NN?=
 =?utf-8?B?MlRWZnZQMWZQbTVId2c3MVdjbU9aV1ZDRHNtWEt1ZDZoOW1xNE4wc3dGVlBD?=
 =?utf-8?B?WXRITmlVSU1XS3J4QlZ5MmJrTUd3U29oM2tCVEgxRURiYkFmN2IxT2RyVjJ3?=
 =?utf-8?B?RkoybEozc09OTUVqRWdab2FLanU0dmYxbDZHNzNJc1Rybzl5ZnZtcTA5SVBE?=
 =?utf-8?B?T2pFcjBRaGtSSnhSazc0RmN4T2lGa0kwZU5VMFdEaVZXbDlwTzBlU1VyRzA4?=
 =?utf-8?B?RGl5YjNNVUN3M0VMaEYrQk5wZ2FibGp2aTJ0Nk1kQmNnNncxTFRzMUowbEY1?=
 =?utf-8?B?ZU9EdGNsV0wrWVNmeFpVSFIyK2VrVlhjcUdySzRuQzdQMlh2dzBkaXJ4VlJC?=
 =?utf-8?B?cEJqSnJlWWJnTHpsTElkSDBlME9EZHpPVGlxM2tMMTNNOVcyU2xyWDBGbmhx?=
 =?utf-8?B?L3FZYy93Wm1tcldYZTlKaGhsL25lNVlMbndPTE15YzBSRng3MFZ5dlpNaWJx?=
 =?utf-8?B?dG1YVXZlMk5mUnB5Nm5rYzBPRzMwL1dHcDdhR0pFZ0dEczFUQ1huOGpUR2d6?=
 =?utf-8?B?VmRXM0ZrUVJ6NVQ3aFJPdWpnMXk3YzI4WGJuVVJ3MHRhd1lnSkFoVnJkQWpv?=
 =?utf-8?B?WlhrRThIWDhkeWNJTzRPNEpTdUFMb1IxUFhRa0Z2bkRwY2pJQ2xIWUhMTWlx?=
 =?utf-8?B?dHllNXJ4Mk1xZEc2R3pOYlZKRW1ZV0hGZDNYNVNYYjRQZXZRK0FGMThUalo4?=
 =?utf-8?B?U3FGbHdoQVJwRVF0Q0g4cjFkWHdocWVaV3JXZFJoNmYySUYwN09renUrbUh5?=
 =?utf-8?B?QzJ6R3Y4U21IQ3BXTEwvdWZPSHYrWTh5YW81TDE4TDVtU0xsK1VxR2dDbzRh?=
 =?utf-8?B?MFBZZEJmY0RsRFpsbnhDcDN6RU9tckpWOTVCY05vSE9jbTVpOVFnTTZRclNE?=
 =?utf-8?B?dHViSDRXeDRkeGxFN2F1bWRXbnVBPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc7064ac-c309-4692-a474-08de16d14b8f
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 09:55:30.7562
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KcPMuOROAaT0O2BEzSCXH4LSa9n4oeDoGKDFe8OpCwz9CDgEVQL9CmwELBcl9waYfUM7rYuBoKz2J/yRZZVH6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7587


On 16/08/2025 07:03, Aaron Kling via B4 Relay wrote:
> From: Aaron Kling <webgeek1234@gmail.com>
> 
> The other engines are already enabled, finish filling out the media
> engine nodes and power domains.
> 
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>   arch/arm64/boot/dts/nvidia/tegra210.dtsi | 28 ++++++++++++++++++++++++++--
>   1 file changed, 26 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
> index 402b0ede1472af625d9d9e811f5af306d436cc98..80d7571d0350205b080bcf48b8b8e2c1b93227f2 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
> @@ -277,13 +277,25 @@ dsib: dsi@54400000 {
>   		nvdec@54480000 {
>   			compatible = "nvidia,tegra210-nvdec";
>   			reg = <0x0 0x54480000 0x0 0x00040000>;
> -			status = "disabled";
> +			clocks = <&tegra_car TEGRA210_CLK_NVDEC>;
> +			clock-names = "nvdec";
> +			resets = <&tegra_car 194>;
> +			reset-names = "nvdec";
> +
> +			iommus = <&mc TEGRA_SWGROUP_NVDEC>;
> +			power-domains = <&pd_nvdec>;
>   		};
>   
>   		nvenc@544c0000 {
>   			compatible = "nvidia,tegra210-nvenc";
>   			reg = <0x0 0x544c0000 0x0 0x00040000>;
> -			status = "disabled";
> +			clocks = <&tegra_car TEGRA210_CLK_NVENC>;
> +			clock-names = "nvenc";
> +			resets = <&tegra_car 219>;
> +			reset-names = "nvenc";
> +
> +			iommus = <&mc TEGRA_SWGROUP_NVENC>;
> +			power-domains = <&pd_nvenc>;
>   		};
>   
>   		tsec@54500000 {
> @@ -894,6 +906,18 @@ pd_audio: aud {
>   				#power-domain-cells = <0>;
>   			};
>   
> +			pd_nvenc: mpe {
> +				clocks = <&tegra_car TEGRA210_CLK_NVENC>;
> +				resets = <&tegra_car 219>;
> +				#power-domain-cells = <0>;
> +			};
> +
> +			pd_nvdec: nvdec {
> +				clocks = <&tegra_car TEGRA210_CLK_NVDEC>;
> +				resets = <&tegra_car 194>;
> +				#power-domain-cells = <0>;
> +			};
> +
>   			pd_sor: sor {
>   				clocks = <&tegra_car TEGRA210_CLK_SOR0>,
>   					 <&tegra_car TEGRA210_CLK_SOR1>,
> 

Looks good to me!

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Jon

-- 
nvpublic

