Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2060.outbound.protection.outlook.com [40.107.95.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A25C1B4236;
	Mon,  7 Jul 2025 21:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751923159; cv=fail; b=Ij1IZw52DQTU/6P6jNd3K6d+mIoTKGYb5Yf6glFPDVAQqb1tSIHylHjT2NC+a/+uLcHJwKPgecHcXBekW4S19mH2CXPGf7mkI3q3285r2vfePgho8AHyzRDRGvRCuewOtiZjAGtmLJSTA0n+gQisgmRhFIeRDY0uXzJrRo6E78w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751923159; c=relaxed/simple;
	bh=EEsMYzYb1GJEr8O0blSzRW8yaWammv5cBVx3h0VDwKg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hKU7B3ZKCp2Y7+f305LyMlx/rPkqtWXyv6Cfe/Nd8iWRxoCZavTurNaxla+XYllW0TtgFGMdjFEpXHIz5MJzm8LMGYsGB1dqpg7Ha1HnCYztjVlIdIVLeM6LqNR+qRrVkrxNzvPENRWhoWG/9Panju1TFoEtDwSJOvkkJGSRC14=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KNHNTqMo; arc=fail smtp.client-ip=40.107.95.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="KNHNTqMo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=llhW5cCyzI4nfz/071KoXT5gqvDj2qNzNk3WTlLR7TwNm+ke2HXKOgPsuhPP4S4XeGJvZR30eXc6q1XS9ivZYzv0UfMsThQNQv1eJI2NuPsScJqfWVC2/QMZPcau54WK0dqFhc+0rq6bm4PG3VkrDXXMNTA4BE9q9s9gf7VpcE8wMXoraNtE0uxsbAYTSKDej2VHxteRgUgBPmouQQgr4lrf+wAwTafM+Ce3D56mon7dC7gxBOpnvlugBYDvwG0ZK8kDjOI7O39qsYx7hqz9+7QCu7862HMQ6gnbsoD4wPebCCkxc5WQoi/UQhF8eBTyOnwXZlyAhEGBit7wlDR4sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y7qzaOJr3mGt27KVGATsh8+8dRkpfK0v3S81ZRIuOYQ=;
 b=q+HHReFa7APtb6Ocp6xfzpCwriqDpJ7mL65SL+HWRQjLtpnrYawT5+5Qc4Hqrn2PzPqLzVcMJQ4TDTmkmFkl74X+CDjbxsE3phdCrXJi/cEb14KrMM+XrrrKQYjTbyXfaZW9cjm+Vxd5Gl11hMEXQSHDhgxsGAlK/vGd0byAP4Uu2+3LX16MtqXh+tfT91MjFgYdQgEXKR+EL468PN0fWFpKL0iUq79/vDDQ0jINhipZ/yeCJJTq5CP/qRN7N55883Bps3CO29yVC9nFxfdu2Y7huqQHuQgeu3QU3LJFcmczJiMtcZ068GvFMH7w35bXpUIo4NPzdMpbg0hqvIh1GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y7qzaOJr3mGt27KVGATsh8+8dRkpfK0v3S81ZRIuOYQ=;
 b=KNHNTqMondetUK7Tb8K5tylvDejVx5JfrFqxeDVjlbkBWS0QUL1ajGSNP8JgFURYizM4V+BUR3yfK2N+8k2xHLvrDXyDgSXb6QvtyhqDua4vLk6QYNkkH6+ej7JzDHuCFKPMOKbcHSmdWlKFMnZYXj7tfff5I6SOrGppJktN6w5IESmxueteogEXNucRQRvHAyXE1Bgx4FGZvrdYiAuwUho1IrsNomSJxL55Y2a20jsUMDbXAmXEN7DanKCjTvwcxL61BkVBzRVwX/eXMkZMcqiSKnKzT+bekqzs4+LkTYeS7Ycw4o7OF93+pBk46aw/ZeBNPRGEWO7wGPwrXrlz4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by SJ0PR12MB7006.namprd12.prod.outlook.com (2603:10b6:a03:486::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Mon, 7 Jul
 2025 21:19:13 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%5]) with mapi id 15.20.8901.024; Mon, 7 Jul 2025
 21:19:13 +0000
Message-ID: <58d948d3-bbc9-4fca-9393-ce995a4e2567@nvidia.com>
Date: Mon, 7 Jul 2025 22:19:06 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clocksource: timer-tegra186: Enable WDT at probe
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Kartik Rajput <kkartik@nvidia.com>
Cc: tglx@linutronix.de, thierry.reding@gmail.com,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20250703110415.232741-1-kkartik@nvidia.com>
 <aGuYuHx5qlKCur8P@mai.linaro.org>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <aGuYuHx5qlKCur8P@mai.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0198.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::18) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|SJ0PR12MB7006:EE_
X-MS-Office365-Filtering-Correlation-Id: bca9d1f9-958d-4375-792d-08ddbd9bebb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|10070799003|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eHVPWVE1ZXV3YkFuZ1lWQmorc0ZBS1lDeGxJVGZCa3JjMkNyMDk0di82bkhM?=
 =?utf-8?B?cTZTZTJGeDY1endBUCtXaElFejdsbUlIY25BN1ZkL3RacEIxMFlpRXZUWWxq?=
 =?utf-8?B?K0I1UmhtcWhBOGNJM2NVT3Z0eGN2YVB3V0ZmZWdBckZyN0ZiazhBampOS1lx?=
 =?utf-8?B?MkVTVjZCKzlITWpsQWNyK25KN0N4cFdYaXMyUTR6bDM1R3M2ZUNrZHRpeWhX?=
 =?utf-8?B?ZVFLZzh2UzZFdEVaaGxPSXoxTUhNS3JPY2JCcUk4Yk5WK3dLTWZ5bDRXSGh0?=
 =?utf-8?B?eUFUMUdyRjhON3oxcVRUN1poMThINUM4cWpXYkhYSnFXK3J4c0FhODhUNW1Z?=
 =?utf-8?B?d0k2VkQwOWRuQUViYWJ2NG03QWtOYXRReGRsNlR4MGQ2TmN4dXJVaisrZGdK?=
 =?utf-8?B?NCt4RHg1ekw3UjVkMWtFRExQNTh0TGhlTTlacE4xU1pZMjRPem5mc0Q1K3lO?=
 =?utf-8?B?Um02bTA3QU9tVEpoQjFxNXRuVWVFQmFOKzJyYTgzUnJyTVBtZUNRYVFaNVd6?=
 =?utf-8?B?TzJEdW9NUkVvUGtoanR4WHBkQzJTbS9MQ3RGaUhDNmlBWGlsc0hKb2Nuall4?=
 =?utf-8?B?UVJabFo2dnRxZmRuSUppWHVaVFdVejZ5VUs5dTliNWQrK3RHUkVuVEN4Vnlo?=
 =?utf-8?B?K28rWitWQ2E3Q1hqdDNKTFN6bjVqeVNQM1Zmc3VFUXNyQ3F4QmJkcnZTK0Nm?=
 =?utf-8?B?VHNvS1RkcXM4OXZoYkNZSDRiZnp4Ykd4bytGdlNkVzJJR05KdTNnTmNwMzBi?=
 =?utf-8?B?S3FhOUJTZ3ZGMjFpQU9xM0pXZUpuRlhxVHdvQXNSckNwOU1YajBwS0lEUFB4?=
 =?utf-8?B?UlpEU2JpemJmS0pSVjZLaEpoSDF6eE1tTmdpV3NFU0hDeURPdjhVMEpiMERl?=
 =?utf-8?B?Yk1hb2ZrY0hsenJaa3d0UW5GdmMydldReWMwaXpiWW1FNTZGOTc4d0tXNW94?=
 =?utf-8?B?elUxdHdPWVpYakg3NGxaWkVMdHBmN1ViUUJZSmdCOFg1SEhIY1pqMnJvV3Zj?=
 =?utf-8?B?TFpMOUEwbGxRZUFlYVhjeVFLSGd2WHJwb296djBtL0FSRDJQRTRpbkc3MVlH?=
 =?utf-8?B?a3hzSUpTNzZDSkppd0ZPdDNjTzZDNk9xa3pYYmxFYkFoRTl3V29wSHU5UzFy?=
 =?utf-8?B?SW5rSjI1aUI1SVlhNlkzMXRNMnpCRHVrOWM0ZUNlSm5FZXdOT2hHbEZoSGRH?=
 =?utf-8?B?U0VlZnY3V0RSMGJ4SjAyZnMzVTUreitlRHhEYkdySDJCTG5SZVoveW93VWZs?=
 =?utf-8?B?ZW9vblNkd083ZTlYSWxpYVRpQmdTQ2RnTFYyV0lPTE90R05KTzRrcDlBWUcv?=
 =?utf-8?B?V3Zpd3FaUFArNkV3R1YxUSs5Z05qbXVSYkNzSkNzQ255MEQzSythRWJQVDFv?=
 =?utf-8?B?UWxsM0xxRGt1aTcyYmsxQ1NQc3ZISXVLemZSSmliN3RNZzFVYzlodzQzVVlX?=
 =?utf-8?B?L0hyM1UybWduWkNOZWZVMjJzUDgxZ2tVSDhBUWljUWNrTCtWcVp1MGFKY3Zm?=
 =?utf-8?B?dVJQejhaOG5rZFJrdmd1OExOL1Z4dHU3S2RVWjdBdnhTZm5CNHFFOXJ6NDlG?=
 =?utf-8?B?WnQvUWQ4Mk9mQ3l6Tkg0Z21Tc3RPVW54Q2U4eURLdUhOdmh1RVRma0xZSFlk?=
 =?utf-8?B?V0lTUUtqeC9JenpQcDRDNXZnaW9FMk1BSTBhdE9ZQloxMGhrR3FKNFo1MVN4?=
 =?utf-8?B?NEJrV3lic3FjSDV1azZZOGZZT1NocHZLNDFyRVE0S1ZRb1BPa2R5emVtbDll?=
 =?utf-8?B?NHBvblN5TXJvMnBwL0VSeDdObUp3Tm1ZOXFhVGQzR2NFN3hIQUM3Um5udDF0?=
 =?utf-8?B?QnNBcGdtSUxlOTZRY2pKR0VkYkV6REZkUHk2VzJidFl2QklWcktiMnRDdm5Z?=
 =?utf-8?B?RXpPTk1VMDQrU2JvT01wUksxS25jdDN0WEFTODBYUFRKQXp3MVZOaVA1MDc4?=
 =?utf-8?Q?1x6GWwitH1o=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?akVJMklLTnQycXpPRTVqOEdFQmZhWHdHdVEwblFFQWU4aXFkZlJXSjFZcFVD?=
 =?utf-8?B?N3kyaVZlQmwrZFlQRUI3WlhaQXc0ejNHZVR4M3JKQ1BmVGV0bEdDTmk3bm9U?=
 =?utf-8?B?VzNRMkNNblU1WklGbElwZFVjM25oUi9pLzZHc2oxd0RkVEMvTXd2YTY5R1Y4?=
 =?utf-8?B?R3h2dUdwbmUraUV1aTJhMzNvb08wNGFuN2xMcFJpSXhmRGpMS1ltUS9INUl4?=
 =?utf-8?B?VHVVd2Q4eVd2ZWsyT09lUGtsMk42N2dwVGNUYzBjbFpFMFVSdTNNMUEyS05Y?=
 =?utf-8?B?ZWlIejNhUk1hc2VGUUdUaWtvRXhmeXgxNHNqbThFNWw3SEZ4Q3ljcytHb3Nq?=
 =?utf-8?B?ZFJhK29CSWVGZXBESlVqamlJSW4wME8vcUViUlRpb01aUEZXcERsVG1ud0JX?=
 =?utf-8?B?S2Uza2tHZnNkdkkzWjErVHZkZkl5U24xYWRyUVoxb3I0MUE4OFBwcEdnb0gx?=
 =?utf-8?B?V1pHZ2h1dUpCb3VLM25IcXdaUzAvUUZzN2RpSzBleEw3RUhhd25vYXM2blY3?=
 =?utf-8?B?czZiK012eFRmWTNUYVJjd0w3aHd1dnRvS0VLTHMwZTY5K0ZoTnYzVUU0K3pB?=
 =?utf-8?B?dmdGWFJldmVzZlF2dk1zblNJMW1TOXp4SnAwbGJWVUwxaGNaT2x6NHdzNzc5?=
 =?utf-8?B?eVE0T3dwdjkwZi90T1VnSlJhcjhNeldZTUdHenZpeHpGNUp3QUpFVmRrd0Vp?=
 =?utf-8?B?b2gyaC9TSUYzbTN1N2VKOGkxZHorc3YrMDBJVFBMZ3UxVzJlSDhINU1YN05y?=
 =?utf-8?B?K0wvNkozRUpTNFNaZDVDQmRQZ3YzV1RRL1gxM0FnOGJGWFdpUGFub2VsLzU4?=
 =?utf-8?B?ZFNKYW1uOGpGdVdBYVVsaUlvZnB1cUtJaXhXTmNVNXdqTWFRdmdLSVpCakJi?=
 =?utf-8?B?L2NpNW45TkdsdGFwM2tZZXhPWlNORmJxU0tPWmtoKzZBNnFpZjJqalI1WDdh?=
 =?utf-8?B?TU9GR1E2Sm9OYXhiUEhWZ29NSzZWS2V2aHRGSXFUYURRVGkwd3Q5cjlLRFM0?=
 =?utf-8?B?U2xiTlRocDVRb2JGQmVuK0dtTmN6R0hUMzFvYmlodzZPNEtSVElkMDc3REIz?=
 =?utf-8?B?Ujc0Rm13NTRTN21WdnVNZGZDNExkWmttUUF2UitJdGZIdFZpMGdZQXFxZWR4?=
 =?utf-8?B?QUEzallPTytaSmVkN0l3Ly9iU0FUUXA4SW1TZ2VkZmVzRXBKc0VHMFF4RDV3?=
 =?utf-8?B?ZGVRU3hMMmhGWU1BWFNHRFV4cmZNa000MWJuckNSVXNpZXhEbHZzL2crOVdn?=
 =?utf-8?B?L1BmUkYwK0VPQmVqcGd5bjIxTmtqTUFmejZJWlNJeHpkdmNwNndLZ3d3TVBa?=
 =?utf-8?B?L3hlNmNxbGxpU2tRWENLdjVUeW5JWVJQckd4UjZ1VXc4YkxSMmRoMmptaWFa?=
 =?utf-8?B?ditEK2RXWCs3bXVHYTFnZGRQQkluaFZ5MERPMHo2UXp3bEY1NDVpRXBOcHRs?=
 =?utf-8?B?dW1BK2k3YzNyS1g0SUpEZWVZUEdEdXRjRjUxcnFiQkJXKzRFTjRxays4V2xa?=
 =?utf-8?B?NWI2bEJ5RTR1ckxIOVpCK0tHMXVtNXI5bnN4cjVkOHQ2SWg1dkNnNk10QlB5?=
 =?utf-8?B?Mnc0QnRLK29pL1VTd3NTY2JJeTVqVDNGUjNWQlZwV3RpL1dFME82OS9kTDNx?=
 =?utf-8?B?ODMrL1lGRURZN0s0WE4yanVPeGF4RVRUSG53Y2RWemY1bld5M0swQmwySHUw?=
 =?utf-8?B?U053dVl0NTN4RTdXS3p4YmdJOWtJeWw2QmdoR2d1bGF0clZBOUR4U3lRRUtn?=
 =?utf-8?B?RkRGak1Rc2pUbncxM3BaWFJnOUpaWUpOR2pRcnloK00zMmxTSzdLWC9VZThD?=
 =?utf-8?B?Vzg0dVhRU21FcElKMWdoL1k0SVJvOUlhOTNBUkIzdVdBTy92N2NwLzhwY3Uz?=
 =?utf-8?B?c2c0UWxyTjlEbmMwMFdoQW44ZU9yWlFtK0ZJOHZ0a0FkQVM0NVU1SmFSZ3BK?=
 =?utf-8?B?VzQxejREL0g2M05XcHlpVUlBdzBDUEY5cnRlZWVaNVZUUVQzdm1Xb2IyQU1H?=
 =?utf-8?B?R1pVS1czWFBiWjVCQnNaTGVwazNnT2U4RFJBTzVKVTV3aGZOak5MbXNBbWlD?=
 =?utf-8?B?SXorUTBSMmxaYW0wQlR2RjJ4WVhnbWl2a3JvakFPVndqanhKSGN1MVVmQm9W?=
 =?utf-8?B?dHNsUUtKZGJxbEtod0c1K1dsVG90ejFEeWZ4dFBlV2krT2VEVzNRQlJZbVov?=
 =?utf-8?Q?c9qv2wNjje7AhujIHxWocRu9FVRDFJJwvRFqeFbxKVxg?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bca9d1f9-958d-4375-792d-08ddbd9bebb1
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 21:19:13.0850
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rGeT0acMxQn/ezKsmx1anx8Nkvhiikg5XLddo35beYdXduXmF7K7FGdmc2/ns3NOWYRzM6OFiwQcu8DJvFr4ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7006


On 07/07/2025 10:51, Daniel Lezcano wrote:
> On Thu, Jul 03, 2025 at 04:34:15PM +0530, Kartik Rajput wrote:
>> Currently, if the system crashes or hangs during kernel boot before
>> userspace initializes and configures the watchdog timer, then the
>> watchdog won’t be able to recover the system as it’s not running. This
>> becomes crucial during an over-the-air update, where if the newly
>> updated kernel crashes on boot, the watchdog is needed to reset the
>> device and boot into an alternative system partition. If the watchdog
>> is disabled in such scenarios, it can lead to the system getting
>> bricked.
>>
>> Enable the WDT during driver probe to allow recovery from any crash/hang
>> seen during early kernel boot. Also, disable interrupts once userspace
>> starts pinging the watchdog.
> 
> Please resend with proper recipients (linux-watchdog@, Wim Van
> Sebroeck, Guenter Roeck) and the changelog.

ACK.

> Can someone take the opportunity to split this watchdog code and move
> it in the proper watchdog drivers directory ?

I understand that this was mentioned before, but Thierry previously 
objected to this for this particular driver [0].

Cheers,
Jon

[0] 
https://lore.kernel.org/linux-tegra/4ks74upuufmt2ibh5ur5zpazvfj66ak4gyq7v4rtz2zi2u5wsi@rls64ws3rukp/

-- 
nvpublic

