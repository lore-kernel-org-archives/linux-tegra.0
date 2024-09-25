Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2064.outbound.protection.outlook.com [40.107.243.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D2028E8;
	Wed, 25 Sep 2024 20:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727295326; cv=fail; b=h94XcsmVAH49gi9DvQDUSJf7Ze8OYm79VLxSSaJyidPTfjLpICimJT3khJDd35ZjSOFRPzxjhas9DexINRIMYuHyF4IOJbXe6z3JxlJcvJmT40Stg2Gtgjb8Rz+jp52072dFyoDRVwRU4i0tOIa94vORadAEoY0fK/BKdBXWlkc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727295326; c=relaxed/simple;
	bh=zYn0v5ozOeXy53Tg6GXpk36/rHL91UGJNUF/xIiZMkc=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qRWM21x+HjvckTEJp/Va5km1heVdE7elUmc0JZQePjEfV5TQloKkHpcdehsUrZNwkmwbMWma70JEIomNqo2oESKT+4EbPNepNtnJPGgMLEJ6V4wlhDTVi0gw4g706lnYXEF+KRCpYwX6fswaexsdhUlpc4iAc6JLD0Yq8jD6SzI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KL0er8xu; arc=fail smtp.client-ip=40.107.243.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="KL0er8xu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qQT09ZR7FfUuvb0yTsLuwAcA3QDVD/I9ErT9+xIgGVEefTa4jEBceHQXG5QSEOLpo47Ff5YdxHg5pgItPeneS1KVP9ahdPOwruUcAnRQXlgw/aW6yjmR/i7FN5bSDbfUNcFpkFsypemvGSP7klRudi0pVOb/Ugd+1CLtvFOPkO0GmsesVChDKyscvKnmLwo5LA4vgigVElpOiuyKAhqAHc9IHo2saQ7PI5OLWa00JNqEcBaBhl/IXUat1AV//4UUB9NTeNMvdoFCHO5fcjnM6PevJi1zqkRwezdo3YJLnasGHPp9bFQk5jn6b2mybWtRAiFQ8uazDcl6YlNijNjanA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rilT4VyLOLg74VChgD+tpds/5+7sN6WimuOfZBbe+bE=;
 b=YaXiqrRiJq02fV3GRQW44/rbzNYS+OJ3ypfrKOBZo5uPLCZ9YPL3koxJeVfbo+29Cj0OepXxJXbg79nb4oEyviHKIGL1AmD7IVOKrtepaQlLLQq0EGhihQT/jvh3SIFD3TqcGUJNbHFDJDPl6vRVh+6AQHX8BG83xNlc0CFrGDoDbb/AgJ3FOGBdDN+C8wACpaQrr2zfyRhDj2iP0USoeDjF7D1rzVldudIWhLp8uMeavcQidOzDQummSK/sDhrnb5+UTewLBksevMQSvd9bl5a7vwHK2E8qAvxgzuzsSnUlH1Rmx8a9Waxv0doZ7ePkE46sWiTCB6QYXDCAs9oEBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rilT4VyLOLg74VChgD+tpds/5+7sN6WimuOfZBbe+bE=;
 b=KL0er8xuQSKV1codDjGnYl/g5JxOMd33t/R0/DLHDFdH0JW86Az41yGwkgtn8GP1krGHxwRU28+dJRjw3RIIDOaMchJ8QFP9dvwcdozD0fTQg10MB/klDhud8ZUBeawPhnPPLoj6cDG9aC9nWVZTtT1b8++7bQVV38rWDc3CDvHNnNo8ZRH9vN+vLFXOqC2VNGQqJuvedfr7sUSQsEQWFP+DejI/s87peJUo4erO9CqDG96QApIbRBwwbKOdO6xGCayQmpTqkPJSomCxMpiUs/NVJ9IOdfMb4Qd8LSbYwg260gFUex0ggve7UKC4LVZO8qZ/dr6xGseSprPC+XmC+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB6237.namprd12.prod.outlook.com (2603:10b6:8:97::18) by
 SN7PR12MB7418.namprd12.prod.outlook.com (2603:10b6:806:2a5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.26; Wed, 25 Sep
 2024 20:15:19 +0000
Received: from DS7PR12MB6237.namprd12.prod.outlook.com
 ([fe80::64de:5b39:d2ef:8db6]) by DS7PR12MB6237.namprd12.prod.outlook.com
 ([fe80::64de:5b39:d2ef:8db6%3]) with mapi id 15.20.7982.022; Wed, 25 Sep 2024
 20:15:19 +0000
Message-ID: <0817a29e-b5ad-4463-8522-8e93a0edeab2@nvidia.com>
Date: Wed, 25 Sep 2024 13:15:17 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Tegra234: Add AGX Orin SKU8 support
To: Dara Stotland <dstotland@nvidia.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20240910190457.2154367-1-dstotland@nvidia.com>
Content-Language: en-US
From: Brad Griffis <bgriffis@nvidia.com>
In-Reply-To: <20240910190457.2154367-1-dstotland@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH5P223CA0024.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:610:1f3::14) To DS7PR12MB6237.namprd12.prod.outlook.com
 (2603:10b6:8:97::18)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB6237:EE_|SN7PR12MB7418:EE_
X-MS-Office365-Filtering-Correlation-Id: 642e5da7-fb53-46c7-63bd-08dcdd9ec69e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K21uUVB2UEdNVTVtZG5EWmFnTUZENDRWNFFlSU9oZWcyTGIwL3AyajU2SW9W?=
 =?utf-8?B?VnhOZ3NxUHZlNUhZNWZCM09PK2o1SVkvK3ptb0w0bzFzbW16ZXozTVFjbU8x?=
 =?utf-8?B?a3ltSmlJSWUrdHMydjNOTmc4bC9PUWVoR1ZVc0lsOElYTmhHYndTZ2QvUUcv?=
 =?utf-8?B?WmJ6a2VKWXhQQkwyR1JYNHoyTjNoeUZnU1RoaUhmMFJHMnRIUkJXM3ZLbzRK?=
 =?utf-8?B?VE9TcXVZdXVXYXBxNTZEcFZYcFlYS0UwYVJKTXRLUGNGNG9BV0FxeVEvZzhM?=
 =?utf-8?B?a05PUHhnVXVWa3Y0UnFGWXlzT0kxWlhMMGhNYk5zeEFqeHlFakc2bG9SZkRl?=
 =?utf-8?B?bTB1UHFhdmZMQTgwenhwcjJxRS9QYk9mSVhVQ2ZENllZZi9kNTJoWG9nTEtk?=
 =?utf-8?B?eHM5RmFRUDdldm9mcC9EU1ZyU2VSYjRsbW53VGtMV29wMWFJclNxeE9IVi9r?=
 =?utf-8?B?UWFTU1U5b09CbEUxMkxWZXI0RUg3eVlqQ1lWWm5zUHhoV0IvaEZZS3k0ZGlW?=
 =?utf-8?B?MFFyUXVEOWJQd1lYeGNtSUJTcGtwN1BlSjdkdldtdkdSNm92RzdqVHlXWjdH?=
 =?utf-8?B?MkNpVWFBOWhYV3AwQXhrRGJad0RvbzJzNS9lNU1za1RNUVllM3Z6VjdiVFph?=
 =?utf-8?B?YVYxcGFiUktmbmpKUmxnM2c2SGhBdlJSSmg2dUpmS1RhUlJ4Yzl5eGtoQzd5?=
 =?utf-8?B?Zm1ZRXdsNWYzQ28waE9rU2JKU1FzdDlnbEFZTjNBbFhIUG9vMHA2LytwVXZK?=
 =?utf-8?B?YmRQWUw2WVRUN2F1MFRmUHlZekpYdm9SQkgrZlBNZDNzMXNzbWFPblhvUVdq?=
 =?utf-8?B?ZE1vYmlVSGJzVkg3Z21Wdm14TTJ6RkcrSGZSZ2Mrd2lyU3NpczZCbWJJNHJ5?=
 =?utf-8?B?WUFsNE1wWjlHVjhIcklydjJGNzJ3WTUzcVBXa2FoZ0E3dVZzbWxIdmloajFV?=
 =?utf-8?B?UjdMS0JMeHhFVG51NFNFb0tpTnMrTkYrSWFidGNiS1JHcFl1ZWpCVFVrQnU4?=
 =?utf-8?B?VDJuZFZLTmhwZHFYSEVwVzdNTEpZdTVsaEFhZmpCdUF5bWE2d1BHVVRRQkN6?=
 =?utf-8?B?UithTW9QSlVuOHdyeFdIQUttQVFURFFZL2Mwamp1djVHS1M4L2JsNEhqWHov?=
 =?utf-8?B?MWpPSTdzNS8xU0xkMW10RHdGWHNHbVdXSkhUUXJUSVBidmRoSFEyRE1PZUc1?=
 =?utf-8?B?dk9IR1EvczkvQXNldXFicjRTUStKczEzV2hrZnJTVTY1Q1dVRUZrZjk5Q2ZG?=
 =?utf-8?B?alRGVzNicXNxWDJ3bVdSUXlWQjFSUDdvZHJySjQvT0ZrUFJHMTIyL0cvMkVZ?=
 =?utf-8?B?VDlJcWVMNmMvVkZiaDJrc2tNSk93bUI2ZUZEb2JNU2NlTlNweXp4SHJMaWdS?=
 =?utf-8?B?dFE0UTFCY2pNQWxiSWhVaFllejhtajZwTXgveEF2Uis5OXlLL2hCM0h2SE5L?=
 =?utf-8?B?MTBwN01KREVyTTUyRFZvekpvQXo5NlkzVFhOODhWdUI2M2trc3ZzUzljTDNP?=
 =?utf-8?B?Y1M2WmNhSzRYK1BHUElJYlhLTVZqRUlMMlhGMTV0OFQ0Mm53TzVXYkEyRVY4?=
 =?utf-8?B?NWZrTGh1clc5N0xBUHQzZGpOWUNYOVl5b0pkeWhFTUMzVlRLNksreHA0cVJi?=
 =?utf-8?B?bnllR0Z5T1lPN3ZLUlRmRUg3ZTJhNG9lNWZtUjl2SVJSb2JoVWVLMGdPQXFW?=
 =?utf-8?B?b1JqNWpUekZJUkdwS0J1SXUySFdlNkF3ZVlyU1pRUTJzbzZONzZmaXFFbnRk?=
 =?utf-8?B?VmlxRXFJaVNPckZoZHF5VkVONFpNZGlLZThSaHdKVTNQOXJ4eng1UHpzWlZW?=
 =?utf-8?B?QW9Tajllc2JWdDlyeHRkZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB6237.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UDBnYzFId00xY3ZPZjNWQVpOb0tVWlF2bzFLNUhqQkdCSCtQTURRUGlTdzdk?=
 =?utf-8?B?OTRaM241cDFMSFpOMCtPV20wakdyZkpJRWk4NjRTVFV6OUZDOGxQRmJlRlB3?=
 =?utf-8?B?ektxMGpYVytaRWZYMzU2UEVDdzRHQWZ6Q1NiT0hyd2laU0owOXh1anhTK3JH?=
 =?utf-8?B?V0tnaVljMHpnMWhqS3dEQnRncHhnc0dFZGIzbk1OL1dMcTV5YllQamtjY0lB?=
 =?utf-8?B?K0x3UStISVJSVTRRT0NXK3FZVHFReVlZenNGN2F3cUZOY0diU21XalYyQVA3?=
 =?utf-8?B?bWxWZDg4NkJ1T2RMRmVSVlV1TW5SUHhwSW5ESWtCMTFsZWE5eGxVVnBXb1Rn?=
 =?utf-8?B?LzQ4Zkd6UmlHZ2RrcmcyS0g3YkxMR3N4d2toU0ZLeHh4d1ZHcmQzS2dJS29N?=
 =?utf-8?B?ajVYZmxHMlllTmM2MUhCMEI4SWxlcGdSVFFENXFtYk9EZUoyQXBKWXJTUElY?=
 =?utf-8?B?dDllVnhzQVQ5dXByM3dQdnRabUsyUlVyT3dKVzlldkhIRWFYUlIvN3gyaDFu?=
 =?utf-8?B?dDlBcDAvZmhSTmViQ2dWR1dybzBMK1ltMXdtQ1l4cFUrR1NUVkFJWU02azhq?=
 =?utf-8?B?Mmo4dC9BUDMwMmxSZk1NK1owRlB2UUZQdTRmQ09YaW9EdjVFdCtaYm83MnpO?=
 =?utf-8?B?TzQrcUxMc3E0OXoxWFBublF4ZmhiczEyaDRSS2c3VkJnMmJ0UStia2RBR0Vk?=
 =?utf-8?B?RU5kVDdBVjZad3FiaDZHVG9MbjRQYmxmREhQVnloUkNtYVdBMmRsaW1OWVJt?=
 =?utf-8?B?V00yR0pKanZSZkVGZjRpU0hxVU9wWE03WW5sS2lobVc2c1VkdnlXSTNUZUFp?=
 =?utf-8?B?b2lPWUdrR3I5bjNVZFZtSnVKM0lwREdpd3JxWUJUZDBseHFhUkpJZW9qMUJM?=
 =?utf-8?B?aUE5TzJLSXhheXpMc20rdWYxT25UbkI2bUZINlNNV29TbE1EMTc2SnF5Smsw?=
 =?utf-8?B?OXVvVzVQaVVLWGRkbzJsVldsLysrdnhWWFVWbnFRcHlOL2dTbVJUSmNCMHB1?=
 =?utf-8?B?T0RYaGkxV2tIQ0JZWkZocTMyRS9FWElkYktCRDVaVy9lNGcrd3ArWmdxdWNX?=
 =?utf-8?B?WjJxTktsNkhwNXlqb2JJeE1SS2YvZ2VFRmlKNS96a1oveXJTV3Brd3FtcXJ6?=
 =?utf-8?B?amIxKzBRTFFKR1BnajNXeEowRnUyMEV3QWFOVnBrOENORGR4eGNkc1RIdS9v?=
 =?utf-8?B?WTRhMzZDR043RE9sWjN0UHQ5L0MyNStHNmdQMUp5UmxFakFUblY4VkJXVlUz?=
 =?utf-8?B?UTRNK2JDMFhKbGNQK3ZTT0hPWmVJaXFJdXhML0o0NFB2S1RZQXpLN3NGZHBZ?=
 =?utf-8?B?aHNwM0Z3azk5enpOQitKeEdoVjN5M2pKcFNPVXE2TTNuVms3K3ZXUUJCSXpP?=
 =?utf-8?B?Qm5qejk2R2NYWEUvVlNreWIyMCtXd1FkOEx6OE14d1JxUTZFcjVCa2tkTXdi?=
 =?utf-8?B?cVVVL2IvTURLR2JMOXlYTWxWRkRlZCtVV0N6UE54dUo4ek8xSW1vMHZ0V3RU?=
 =?utf-8?B?c3NxVlkvMnp4OWQyOW1zWVBvNEFsNjJpMDh2VVNxNGtLempnTzdWdkNWdVl5?=
 =?utf-8?B?dFZ2RFdVck1pY2tBVVRGRVB1Tkgxam92ZlFpVlpjRFo4Y3lUSjRrc0FvMFQ4?=
 =?utf-8?B?WmYxSlBlS3Y4SmcyOFNnK1hTK3BWUTA4NzhUU1dvanY4bEo3YTZ5Z1R2Zzg2?=
 =?utf-8?B?Vzd0aUdyZTdIQkdVZlg2Qitkc08wT2x3cjRCK1lXYm4wUDQ4MzdEaEJOazg4?=
 =?utf-8?B?dmlQTFRSbDFrRDF6TEFBUld5V21nenZEK1NUcVBpSEdCOE40YTlsVGpkOXZG?=
 =?utf-8?B?cGQvSmxNamcybEJZL3hwWDFmM3FsMUhIc3JiWHBjb1NCM0l4ays3MFZvblE1?=
 =?utf-8?B?cEhMbzAxa00vTDdKRjE1TW9EcUU1ekJFT2FrdHg3aWRud09JZTAzR25ET1BP?=
 =?utf-8?B?TW0xOFM5b3hXeFVqcVB1YlJtYld4L3dJd0tBSnZjaGk4N0UyZjgrakh4czkx?=
 =?utf-8?B?SGJ3V0lVUlA2cnRiaXpwV1cyRUdKTjlaRVdrVFNkYlVjNDhlUjdyR2dGeEVv?=
 =?utf-8?B?OEdwOVJLNGp2QkY3czRuQmRaR3dDbUY3TEllTE1yR2QxWlhVaFB4WGQvR0Jz?=
 =?utf-8?Q?yCqUTchrIMTeDc7DclgT0ibQw?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 642e5da7-fb53-46c7-63bd-08dcdd9ec69e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB6237.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2024 20:15:18.7736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L+eieZETpMIimyCId8uAP+BlObF5MzE6s6eq5RknG3o17kgN6IIR9Ofhd6p74Go6WZ9ZGZXuRS3h0sJhHTS4RQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7418

On 9/10/24 12:04, Dara Stotland wrote:
> This patchset adds support for the AGX Orin Industrial Module (SKU8)
> in the AGX Orin Developer Kit.
> 
> Dara Stotland (2):
>    dt-bindings: arm: Tegra234 Industrial Module
>    arm64: tegra: Create SKU8 AGX Orin board file
> 
>   .../devicetree/bindings/arm/tegra.yaml        |   5 +
>   arch/arm64/boot/dts/nvidia/Makefile           |   1 +
>   .../nvidia/tegra234-p3737-0000+p3701-0000.dts | 544 +----------------
>   .../nvidia/tegra234-p3737-0000+p3701-0008.dts |  11 +
>   .../dts/nvidia/tegra234-p3737-0000+p3701.dtsi | 547 ++++++++++++++++++
>   5 files changed, 566 insertions(+), 542 deletions(-)
>   create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0008.dts
>   create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701.dtsi
> 

The warnings that Rob Herring's bot detected are pre-existing. These 
patches look good to me.

Reviewed-by: Brad Griffis <bgriffis@nvidia.com>
