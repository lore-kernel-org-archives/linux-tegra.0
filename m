Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010026.outbound.protection.outlook.com [52.101.193.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80531D6AA;
	Wed,  7 Jan 2026 07:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767771072; cv=fail; b=c/1baoEU43D0mWxIsLaU9Dit1N0SF0SQ4TPSQw9UQY99bIej8je1kUrA4vrRNaPySkmZXNATrR7So7a0UBo+Y2/EQjQJci/8oOVyewfYMN2eiAV2ADYGl8Y/cbRIfOIf+OCiQ5g8skzzB7303DhOr2qdUUo6TvJVy83ppmC1TJs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767771072; c=relaxed/simple;
	bh=FftS0w6hWdwovdmHHaN9MBhZ4k/I0BJCntWz0Ty7J48=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Q+HhDpyOMulESsGjf+DWayTn0Y9ToUnUhhGYXKjhhVOU0zcwu/adl/dATMxhbsnkxZUD5b4UObGM1T85S3GpMKm+2AjPo+R7Gf+dLE8sWLCWnSguHMLf8jsMsi7Cva3SEOQKBRQQNbkw1BK1AIjE2v8a/lews578gV/0XEE3ecs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nkNF/QrW; arc=fail smtp.client-ip=52.101.193.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nkNF/QrW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OEgNMbWfNKEYsbhJd+oAPk1t/8+jB44HA0JVOBjc666/CH6g1uEUebmKLCWfWK/zWK+NBmMoUXjE0vHssAlh+tWSE1U8MHnSjRbWhUu/gyjtWEeh3qYiG/lnFtHP4wLZthJoqfMfMQriYafcX92U103+1LMNd2BtVIpUduquCFWqTAtNbLK5lYTL9SOUIAtB7R3dGGF7JDVgUr3O81LfItoHHCCeDsUqgWlPS1Z1s3UWVg0j0XFykH030FqEhb02tLnF3EtmuDURiYd+MmF2j2h6MM/dY+a46Rc+yL5BAEoCKRlGXV3FdWDPqSsw4xvjgnMKuodxFrlBBcbwHsW6TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=POyGMdY3VYAfjjE+V4Mv8OB1EAyRb12CoeKAm7ISeNI=;
 b=sLiCYwlhkucbfKwWCwLREzWrnwLiB2MmhhmK3d051mMJ6CR534cvXU0PndO6wBat/wJljtz4TxrpoXfCWLK2a7f6XXQ9ytfA3FjEp/xjbBzE44329aqBNUcVS5aAjejvlLOhagY0NENGLzbWmgwVBN8hX8cCJuO4bHt4mo5dWeGjRgJtZu3zajDSB/5vlCmKK7SMtmwkVOCzcHtD1qAnLmbWbQyb+jE4Mbp0SwgBZxriiQB0Rm8kBhGRxr2m1KnEKeBBGj4G6oJLkqR+Ofw8ArMj4ztB3UNlEY3yiExrVFlvMmG9YvsW8njYvN3fWLMiOJQdAK6g3ZA2P6FAEeerAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=POyGMdY3VYAfjjE+V4Mv8OB1EAyRb12CoeKAm7ISeNI=;
 b=nkNF/QrWIOHmoMFgXLZkhNk/CD+OZQYAHt0bzU5DbUXT4/sLRvi5hzQBfAdFAkoGnjxHdlCURcTMtkXYRM2N6r2qD8USAxpzD9Zkd3yK8hxTSdtlYh7qcqrCyi/52PUfWq9QBwvC+7ehuL5ZS930/lGQc5LrbGBFx/m2B8ItItKMvf6MORkBGSBqGR0OUkOJOA7Igy+0/eSMd03bGJryoeEXgksSHBcUBzgeVCLFJ7qR4u6595Ds6Ofpzva8nQe8idt8KBab4cyMLOkqJInev6aVQy2PO1wrxfQYxOVtUX+0oyv5bFmORl0aAGBylsMLJc1YsE5ONHf1Sdjpye1khA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB7697.namprd12.prod.outlook.com (2603:10b6:208:433::19)
 by DM4PR12MB6664.namprd12.prod.outlook.com (2603:10b6:8:bb::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 7 Jan
 2026 07:31:05 +0000
Received: from IA0PR12MB7697.namprd12.prod.outlook.com
 ([fe80::ba90:84ea:b974:7932]) by IA0PR12MB7697.namprd12.prod.outlook.com
 ([fe80::ba90:84ea:b974:7932%4]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 07:31:05 +0000
Message-ID: <48d62d49-9fa5-4423-b08f-b138d9f7330a@nvidia.com>
Date: Wed, 7 Jan 2026 13:00:55 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/2] regmap: Add cache_default_is_zero flag for flat
 cache
To: Sander Vanheule <sander@svanheule.net>, Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Danilo Krummrich
 <dakr@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20260106140827.3771375-1-sheetal@nvidia.com>
 <20260106140827.3771375-2-sheetal@nvidia.com>
 <f5dfb4e77fc9b59aaf5c35ed14cede549894b7c5.camel@svanheule.net>
Content-Language: en-US
From: "Sheetal ." <sheetal@nvidia.com>
In-Reply-To: <f5dfb4e77fc9b59aaf5c35ed14cede549894b7c5.camel@svanheule.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0074.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::7) To IA0PR12MB7697.namprd12.prod.outlook.com
 (2603:10b6:208:433::19)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB7697:EE_|DM4PR12MB6664:EE_
X-MS-Office365-Filtering-Correlation-Id: 4413412b-7799-4077-1126-08de4dbeb76b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|366016|3122999012;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VitTMUVZOWorbzBBMGErZXpjcVJreklDWUZ4em4yYUdyeUxjUWhNZG5VUUJ0?=
 =?utf-8?B?cWhaM1AzeTFwa2t0djJFZExOck1tUktHd3QyWGFoZldROFRQNWZ4a2hKZGpY?=
 =?utf-8?B?MWY3Qmw4dDM2bGRZUld4ajM1WDg2Z0MzWGR5ZDEvS0lkWWlLRStXa0RWSUNa?=
 =?utf-8?B?USt2S0VROEVMUEdUZTh1RVlISThZazFSUDN2NGpNMnVkQXduNHQ1alpaelA3?=
 =?utf-8?B?b0U4V2VMNEIwNy80SXFYK1dTV1VBakF5Q1VSNnpSUWVtbFY3YW83UytSZzRm?=
 =?utf-8?B?THlGUlQ5VVR4bzlUWUFKcXBLMm9Ra29CdUpjWXQ1Y1dBYWRmckE1T3A3RmtT?=
 =?utf-8?B?TTA1bnhDdFNMYWJ6a1I3WEFnK05CcWV5MXF0ellxV05oRTBmdzBYRkw4Nyta?=
 =?utf-8?B?eHU4ajNDVzZlTFZWbERjR3JnbHlaSjY3NmJFS0drR29VT1dNZ1FCSk5ycTBM?=
 =?utf-8?B?cHVmMFJsajAzcjUxUXZpQVgyZktvOWZWYkdDeWtOVzlibS9QR2tEQ3lvTnZ2?=
 =?utf-8?B?U3FGWlFQWW9FaDhKZ3BSL0g1NnlJd3lzT0Z4RDUwUE1QaSs5SisyeEJ2cllT?=
 =?utf-8?B?SWdPNlZVVXIyWnBnOGh5Vk5BSUtRV1FKTEdzYUVjcHRHcUxYVGwzcjVsbDBz?=
 =?utf-8?B?ZS9Mb2NBVGw1UE5aM2c3T2svWjl2alpsd0FPMlprOEhsOEhMSVRDSzRyYlBn?=
 =?utf-8?B?Qk9FbURrZENINUVpeTJlUEZZUi9zTE4yeEU2bDhSVkwwSTFRWFhNRjlBd2Yw?=
 =?utf-8?B?ajczSi9iWTNFbXdvY1NpWlU0c3FkOSthTW9XSS9haGhSWmFwYnc3MlJFZUlh?=
 =?utf-8?B?Yy84bm5lQmFNVXAwWm5xbnZJdEN5cDJsSXYrUUNJNm5jZEJtaFBrSllHdW1p?=
 =?utf-8?B?TmFuV1A4dUpUdDdZSU5wOTRlZG9Dc3NsU3k2Wkxiam5RRFVlMmxGVmxPcVIz?=
 =?utf-8?B?b1QrQkVYRFllRnNsaXlGSGxIbk1LTzVDYTVYSTJ1WnNRM2FwSFQzTjA5eVZq?=
 =?utf-8?B?aW9mUldaVWpmNGxXZm1kWUNPUjVtdkIxekZneDdYTHA2QVJiaTZJU0F6M3hO?=
 =?utf-8?B?SlVod3pyRkdJWVR6S3pOUjFGZ1FJZmJ0RElMUENPMmhVbVhFRVZzODFmT3Mw?=
 =?utf-8?B?UzZjOG5ER1UvNXdhTElIc1Rtd0hiR2Uya2lHSys2QWlraXFNRHJNbkFrcWRp?=
 =?utf-8?B?MC9FS2w3MUhQcXJqZFJjN21zd3luRHNQMGVKZjc2OHRtWDBzVXloWmg3MGUx?=
 =?utf-8?B?Y1dDVkhjNFluKzFpWnZGQ21yaTBjYUhGbko0b1dGU1FvRmxjNXlIci9tREVj?=
 =?utf-8?B?SlllUnlDUndpUFVGb0FQc2w3S05EcTQ2bE9GbU9STHRiaEw1ZGVsWmNKc21B?=
 =?utf-8?B?YzNraUtNVHdQQ3FWN3QyTWVHeWwwZ3FwUUFSRHkyaHhRNXF1TVpSWXhUenlj?=
 =?utf-8?B?VVFGUEkrUnhxQkx3QlNWcUFmRXYyNGE4dlZsKzYzSGpFQitLeWl4SEd5WGY4?=
 =?utf-8?B?cVRrMEFtbDUzM0R5N1BxOUY2aktmckFEUnoxV1BZc3JDZGg0QkFqcmlIakY2?=
 =?utf-8?B?QVBtdzRjYjdTRkh2Ty9WVjdDOVFLbmNXc3dYdzRLelF2cEEvbkZDNFJCOUo5?=
 =?utf-8?B?K2ZUWCtYQ296MFR5VExQZjFiQkpsdElmVWY5amRpTTQzcXRCdmxtYlBKZ3Jh?=
 =?utf-8?B?QngxV3M0WjZGZ0FaNENrQXJuWlVlZDFoWkRKK0g5VFFzaUpiQU9ibVZJZnBU?=
 =?utf-8?B?aW55bVpaQzNERTRJWGhIUnlJS0NjUEVTdGViUDJ0UHdJTkxuYktkTDJqWXkw?=
 =?utf-8?B?SmI1MTVMQXorWEhRZy85QmhQSGZwZDNIQnFLaXJyRkVtY1pYb0hNVzE1SFN3?=
 =?utf-8?B?Y0hXR1V5Vlg1SjUrSkE0WG80RWxVaXB5UFJ2NE5QaVluN01taktaZkZObUFq?=
 =?utf-8?Q?1CsGrRBB6s5eHAgGqFaBMW6ivB94elDA?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB7697.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(3122999012);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UTg1bDRtNWZZQnpEcTlUTWlMTkI0anM0c1YycHJpekRzZTY5UjBNODJrUFpG?=
 =?utf-8?B?UExNcXJFNWNQeTNoa3pWSmtCZS9ibFdaMEcyNk5DN041ZG1ycy9hcTVYbUdW?=
 =?utf-8?B?Wnl5cmJYR3NUV1lITXJFV2svWHBOSmRGMHlQSlFrYmIvNnRhY25LKy8vVERl?=
 =?utf-8?B?NE90U0hjWjBvOUt5ZGxpQnI4NWpicndRWVRWS2dNN3dVMmQ5VkpobmVDQzYv?=
 =?utf-8?B?LzZsaEIwaHRVNWh6RTdEME9MNi90N2lXMXpyMGU2UTB1dWxVWmRncDNLc1Q0?=
 =?utf-8?B?RnNEQm8rZHFwSXk3dTJTMWtQRkI4ek9MVzl2SmV3Zi9pcFlvME1yMnU5L2NV?=
 =?utf-8?B?cTgreTk4dWZBaDRnbXkzb2FsUENjZSt3a041NWdqNGIzTzNBMVptMFBnb2xU?=
 =?utf-8?B?SSs0T3cwS1cxcDRsMVJjU290SE1FRTFuanl0VVB4VElnNS91TXE1aHIzajFL?=
 =?utf-8?B?NUNML2M0UnVCUVk2TXNmaVlGSlN2S3pDV2FsMk8zc1VvblFCVEZDNEpWbWpT?=
 =?utf-8?B?dVoyTERCMEJBQzNwbll4L3p6ajRGMy9VY2V2WkFFYXphYWRhMG5DUEdmMm5n?=
 =?utf-8?B?Z0o2TmNKUWRZamZXT0pyYzNEU0RHVGVpc0hZN3NNYitXWUdJdTkraENaWXgr?=
 =?utf-8?B?VE9iOVcxbXVQQjF2UE1JZTVVUWoyQlRycGdLa3lQdUtZWStwSXo2U2lxMXRN?=
 =?utf-8?B?N1RCalVrcTl3ZzVsZGkxWTROaUpOdTZwVThMTE5TWmhYSkFrZ0Z0cjlIbVRv?=
 =?utf-8?B?OG9PR1FEeDQ1MURlbUZUdXJFYTFXQ0x6RlNKR0hJWnF6UDVwZHZuTmpjdHhl?=
 =?utf-8?B?WUUwSDJnejVUM2dyeGNxZ0h6SDRFK3dqWjMvZzFjTkRCWFBDTVZQdnNsakFj?=
 =?utf-8?B?N0EzWHBFak1aRlRabTFCeWdTbVZtQ2o2cE9KY1NqUENjS1FtRkRVYm5GbnNX?=
 =?utf-8?B?NFpKVWRlMmZzNnVZdmk5OFdWN3kzb2JhS1V5QzZ2d2ZkT0pBWHZ0VjJjWFVN?=
 =?utf-8?B?TWZwMW9jUSswTTd1TC8xVDlrellGaDBpZUFXUmdLdit1K1Z2UTJoTjZkdVgr?=
 =?utf-8?B?Q2x1dkE0RzYrOXFzdzRNUlVvTmFNMXF4OGNUTW94SEtVcDNXaXlsT1lnV01s?=
 =?utf-8?B?YWkwR3BNUnY4V2xEVlVMUUY0bWd4ckhoU1hEM3I0c3Y1UVVGUXQ5ZEYvcDI3?=
 =?utf-8?B?aGw1NU00L2xaL1R0MDRXWTYrb2xhM1hsbkQxZ1FUNUNDVFM5UjBNa0JwcGZ4?=
 =?utf-8?B?WXNNU3RHS0Q4M21tWXc3NmpuNW56VnprTHRBMDMreVhCZzg5RVJScXRSbXl3?=
 =?utf-8?B?eTNPdWdZVHFPbWFmNVFKQmxoeFpNVVdpUTlERGkvdFJBRTd5MkRuY3lDNTl5?=
 =?utf-8?B?bGYwTHJHcFBWWk9MeTBWakNldW9uS3FkdVkwTGtuaWlRbDh6SitmT1VrMjR6?=
 =?utf-8?B?a0VLdk5MOUt2a2x3SnVrRnFVNTdmNWtOZ3RrVFJObSsxYTM4ZWt0UjBwOGd0?=
 =?utf-8?B?Zlh4dEhKYXBRUjBDcUtCRDcwYllpRE95V0VCYVNTU1YxTjh1UUFJcDVHM1lW?=
 =?utf-8?B?YXduVWlPZEkvSWNsSDBvaTFLdjFnMXZuanhTYjRVTXA1UkhaRElUSUFLVUxp?=
 =?utf-8?B?V1VHVmk2TmJhY29TSm00NWlhbk13UjVnbHlDOHc4NEpWa3k3N2NKZDFiWm1a?=
 =?utf-8?B?OXdBa0c0QWJBR1BwZVE0cUtLQUlMcUNuL1I3VlI0Vm5RRkhwVlBvbEZ0NFkx?=
 =?utf-8?B?REZtTGJDbmsrWlFaZTluTnNtOW83VGl5SHl1L2JFdjVkaFViSWt3cTgwKzBP?=
 =?utf-8?B?SlZrWTM1ZXIzK05mTE1aeXVSR1kzRWtMT28zSWJ3SHhWdjFJME5xZjdXLzJm?=
 =?utf-8?B?cU5LbjRmeU5SZ3BReHRaSmZnMWsxcDNkV2JLK2ZkdDR3Wi9nbU1vZExqbTM0?=
 =?utf-8?B?a21ZZThIYnR6Wndrd3hqNyt4RzJOeUlFaDA2bUs3eWFCZDlOYUQvdjlUdXpY?=
 =?utf-8?B?aGFxdUswdU9mL3M0bGRJYnd1WHZtOGNSNU53eHRzSjl2eG5LZm01eWhmeFln?=
 =?utf-8?B?MEFnNVhQeDY3WnlCaGFXeDRXT0VEZFRTR3lKOXUxYWhBOXJld1RvL1NvQXFl?=
 =?utf-8?B?K1BsU1dPeDNDQ3dmblR3MklKT1hGaE5mZkFYZmFORFd1OVRoZWlacm9WUnpE?=
 =?utf-8?B?VVdkRzZSa2xEc0E5aldOMEM4U1YvMmV0WGVPSEYzY2M3bzkrQ2Y5dWhDdE5s?=
 =?utf-8?B?WTRMN0pYMlVTaFdpSlVqUy9GSnQxS1V1MGo0azUySmhhYXBjSjQ2RGE1bkht?=
 =?utf-8?B?ZGhXUGJ0a0Q5ejlDeVZnZkl1MFRKeDJUampkemg2dGJLSVI1T25JZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4413412b-7799-4077-1126-08de4dbeb76b
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB7697.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 07:31:05.2385
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XOwAqAbJ3hvAvdqfMr2CXhPHK1EVOY3tQNeWNgYrLvnKCk6AWFwXnIq80LK7NeBbXp7OxCKPjoASh/2UDUR/1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6664



On 07-01-2026 02:49, Sander Vanheule wrote:
> External email: Use caution opening links or attachments
> 
> 
> Hi Sheetal,
> 
> On Tue, 2026-01-06 at 19:38 +0530, Sheetal . wrote:
>> From: Sheetal <sheetal@nvidia.com>
>>
>> Commit e062bdfdd6ad ("regmap: warn users about uninitialized flat
>> cache") added a warning for drivers using REGCACHE_FLAT when reading
>> registers not present in reg_defaults.
>>
>> For hardware where registers have a power-on-reset value of zero
>> or drivers that wish to treat zero as a valid cache default, adding
>> all such registers to reg_defaults has drawbacks:
>>
>> 1. Maintenance burden: Drivers must list every readable register
>>     regardless of its reset value.
>>
>> 2. No functional benefit: Entries like { REG, 0x0 } only set the
>>     validity bit; the cache value is already zero.
> 
> This is only true because REGCACHE_FLAT just so happens to zero-initialize its
> cache, which IMHO should be considered an implementation detail. If you were to
> switch to another cache type, you would also need these defaults to maintain the
> current behavior.


The warning itself only exists in REGCACHE_FLAT not in other cache 
types. So this fix addresses a REGCACHE_FLAT specific warning with a 
REGCACHE_FLAT-specific flag.

I feel that perhaps we could avoid warning the user when they have
explicitly indicated that zero is a valid default for their hardware.
Since the driver author understands their device requirements, this
flag would allow them to opt out of the warning for cases where it
may not be helpful.

> 
>> 3. Code bloat: Large reg_defaults arrays increase driver size.
> 
>> Add a cache_default_is_zero flag to struct regmap_config. When set,
>> the flat cache marks registers as valid on first read instead of
>> warning. This ensures only accessed registers are marked valid,
>> keeping sync scope minimal and avoiding writes to unused registers
>> or holes.
> 
> A special flag only used in the flat cache is exactly the type of config I think
> is non-intuitive and should be avoided. It needs an explanation, which implies
> documentation that may go out of sync.
> 
> If your device has a single contiguous register space that you want to
> initialize to zero, all you really need to provide is something like the ranges
> used for readable/writable/... registers:
> 
>          (struct regcache_defaults_range) {
>                  .range_min      = REG_MIN,
>                  .range_max      = REG_MAX,
>                  .value          = 0,
>          }
> 
> Instead of a bool, you could add a pointer to a defaults table in the config
> (which can be loaded together with the current flat list), just like how
> rd_table works.
> 
> This would allow others to use the same table for multiple contiguous block,
> with zero or non-zero default values. It would work the same for all cache
> types, thus avoiding potential confusion, and limit the size increase of your
> drivers. Then you could even safely switch to REGCACHE_FLAT_S.
> 

The range-based approach is a good idea for contiguous register
blocks. However, if registers with zero defaults are not contiguous
(scattered across the address space), it would need multiple range
entries or multiple reg default entries.


> Best,
> Sander

