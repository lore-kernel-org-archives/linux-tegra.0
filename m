Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012004.outbound.protection.outlook.com [52.101.53.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52BFC3E121F;
	Fri,  8 May 2026 15:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778253209; cv=fail; b=lzfmlQofSNJZYuCUYStL8TH6okYIJInlG3xPYI1ZAOBBtBpSrzE9EYyLenXV3kDUhC++NV2C3/UQm6qg+38PMxUmn23jvYUdilbWZh6giY3ClKlQHhjZqMLtCKzXQNW5TMaSVuVxASeKrTvPYWiBfosXr37Q/liMA/o43RHF2rY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778253209; c=relaxed/simple;
	bh=Qh8AUNyL3TXJ2zcltB9fbRfM/Ifw0hESHH9Axt33Xs8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NqRHLqw/w6NtRrAIAy+SzTmKBBwy9+7WogL5sZiYtfupFAxzpVYpr+8VtM/yW++GHLgrRA9RIRAz6Qz3OizY5EXTY/7bpubwz7kJbuogdGaCtHvzSbFe1t8LYTiRBhYW/1LPVItgBaXpQ9cQXVbOY+AXaOQeJ11tOyjckPPqCH0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HJdOZDQi; arc=fail smtp.client-ip=52.101.53.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HJdOZDQi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fGouhMuLEkZ5gJxscHLo1jqojo42vB7M409BjyviBShNPh8X7Lo6AtBHt3Mvh7WixaXRrO+ddzvpFcBWh72C873f+WWaHIrFxtZhEOtHSZ8u2BfOvrgQiLd+98qckSBd7OVcMMCUSHNwyCEP55x8BqYDOaG41K6Cjuq3fpFV11Bjysi4jduvFx43nYCVSWQkZouxl7V6wPv2ogLZrkyFtUSlEnA8Imx1mxXR5IyTNmAIfDYGlylFqvZgoOTdNqb5y2+FwA08Cx086xoDkNE5U3XHtuwZws6fkAr7Hq6W8QLAxEgy0p2lbMGkSVAqyOz1DNsi+12x8Lxinu2uqelddw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JDFvy5uSMafWvlI45cP/OKHu2kJx+UFaIKDGuZDsxDo=;
 b=FMRX30+ZLE7P5ugv2QIPbPEuBcFQ+ATCuU4b60+whyY1qx5c1MVFmW5+RUKBmBt023iQhEjFfHLrBl4Z0YJmLkTJM2LgInXyh4GoU1lSDc2nrlXi/hDRbYRKHR4Op2pXjtoNatbOBHHI3WLLwk10mIifvXwzwm1mFnukG5m16qysK1hz5piJnaiFkO+fbzNZXaMkTVCZES2dyBnppg0RXtEkUCo+Zd5jDVB/EL96ZIhcLSRaAshSSBM9peF7Gm1PMDhJiyUAEzVjkOXxzOksUz5VhxemoUiBy3Immw6YwvJp1tpPh5v3pK4iOzOxITfkd7FqTKxHZ8NAY7+ZV0ga8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JDFvy5uSMafWvlI45cP/OKHu2kJx+UFaIKDGuZDsxDo=;
 b=HJdOZDQi46DTJYHPcORmmf5amrpotgLP4jgvxPcZmmzptCczUQBKQdxTZlXf87NyNoP/jioIpetUpcd25480ai29sLna8T1wfxIQrvCURVcd8AaKG1hngJ7b78vaiLbEgyIhYnfzTId9/7GgRSEE8JuLq65crflE7CndwGg4aO8YZhdprFm6fIZfaDi+/CcOn23+fGVOeQTfA3eE2KRMPH4TXWrKWqrS+/AREdUPJggfz6C6RpLTyL0pF8GdlP9t78zAUZLJdGFE1r3tJiC0WIUFlQipr+HiZXn4s/ajYfMO03EyWiRDMtXTjkfDa1CxvEwOJ55vJMN5hmBEUtOXCw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by SJ2PR12MB7989.namprd12.prod.outlook.com (2603:10b6:a03:4c3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.20; Fri, 8 May
 2026 15:13:22 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%6]) with mapi id 15.20.9891.008; Fri, 8 May 2026
 15:13:21 +0000
Message-ID: <6f982323-27f2-4e22-a24d-dbc6d8576629@nvidia.com>
Date: Fri, 8 May 2026 16:13:12 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] i2c: tegra: fix pm_runtime leak on mutex_lock
 failure
To: Thierry Reding <thierry.reding@kernel.org>,
 Saurav Sachidanand <sauravsc@amazon.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Akhil R <akhilrajeev@nvidia.com>, Kartik Rajput <kkartik@nvidia.com>,
 Thierry Reding <treding@nvidia.com>, linux-i2c@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260506195319.44810-1-sauravsc@amazon.com>
 <20260507221145.62183-1-sauravsc@amazon.com>
 <20260507221145.62183-2-sauravsc@amazon.com> <af25yiUXoxiWFcIU@orome>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <af25yiUXoxiWFcIU@orome>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0249.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:350::14) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|SJ2PR12MB7989:EE_
X-MS-Office365-Filtering-Correlation-Id: f1e68d95-9820-43bd-83ad-08dead1457ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|1800799024|366016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	wgGYUYny2XfYKp7uNlezOlpOXAOysAVKE0/XYqRlWWeu5B8CUGWsP++GbIGlj/maEug8QkC7k93Bgu4B3/zswjKQWUxElCJVymc7UglPbdTrjmsJi54QxAJkte9Q5xhl8cFoLy6V8fr67D3BNmWVUp7X9ksJCWCXioAhHN8I8r3dPYkehc5vjy+PoGWEEqu/jcimvkPztmGnzuNZ+ipVHMFsDR/AiSuNlI4WBEwmr3hrVjq5OrV7trNKpxQC33MDVwaxA6DoDycRU4pp4QD+oe7tCi2xIPsZ5PJL09yb1D6od7CrAaVov2ZdiLje2oQ7iGUxBuuuncFCIulvA0kxU21vle8ws8iBMzxIaaTIUMv10pc08UDKbLMfjZZvlC1fyJi5gzUpOsk0t/YosUNYnBV0+a2AaHBYOzGJirdpQCv3GWp73unw/qA82oEkNI3KsdRN7WnuF7jImImracq/kzUoF4kMkYA0wmY67X7bhmHlrJpa+0f7/Y8oYrdxCG1obOWNcsLRsMM9ujIn1DiAihgE5I8PTo2J9Tq2sozPq6f1ScpUIoEiD4zBU5gE1pmFwd43ix2Ev14oaujZ5BAiRLyD/4oR69GPjg0loV2vR9gEvt6EzqF5Lj8HSCJrJBcQg/N06Gw6WDiNDBtAxVrub5EvkVLFBNFPI0aGrAAnRnhGDinvfgQA0t92s+wBHc+Y
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(1800799024)(366016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VXJGODFOKzV0UVprVnN1U2QwU1MwNUE4YmlENDIyS3FDcjhZdGlDaFF1YWNP?=
 =?utf-8?B?eXhPeHUyUm5YTHpob21jL1pJL3hEOFB1VGxuM0xpeG5oYzArOFRlTmhYT0xt?=
 =?utf-8?B?TXh5aVBQZEpmU0djYW1Ncm5CZmNBcWw3ZkJoZFpsdEdSTmtGZlkvTlRSb0U1?=
 =?utf-8?B?RjlZVTRWN29PeWEySG9jMUNQMGR0S0lISWxubWJqc0ZMWGpSNGt5bHV6bVpm?=
 =?utf-8?B?QWRZSWs2OEQ4dm9kYW9Ga3NRZHJ4ckh2anpNdkl3L0VQZ29PbDU4eVpCUVVv?=
 =?utf-8?B?eWVlSTNUZkcrQWloeFJDT1ppR081OTFFa29mUEV5dE0xMEhoMzA2R0t1Rzlu?=
 =?utf-8?B?dDdMQjZNNWJWSWRkR2cvSmt0SksycHgvN1lmaGQ2UlZ0dVpVN3lWdkhoSlUv?=
 =?utf-8?B?VTZCaDR4TmZjMjVicEZZMENaK0ZRQWtPUzVaSXg0L2NFYmZ3THg3ZE84Z3hi?=
 =?utf-8?B?eFBSN3BpdG9SczJwVVg3dnJRckVGdm5yek5DSWNFQVRuMFArUkJaY1p3bDg3?=
 =?utf-8?B?dmR3eFRmS3VjQ2ZEZkJvNFVtbWJ1U0ZCMW9PRWNVVlJRSDhmUHljbUpSYldr?=
 =?utf-8?B?S0R2UzVPODAwRURqOVpxWXZTVENLUDZxYUJSemVjNXdlcW9rcG10b0VtUUdi?=
 =?utf-8?B?WHQ3bFlnWko1VWs3QlpKRmJQTmtRVHByajVFRnVQbDBRQVZZbWNnVG5HUnFL?=
 =?utf-8?B?T1A3SWN2Uk5WQ1UydkIvNnZnTUREK2VpSkJHZ0RJUllpM1M3Q3VKMitxNk1O?=
 =?utf-8?B?c1o2OFZZMGdqNGFjcC82VEZ4aGFzUXFLbC95dCt5S0EyNjV2MS9jRkNiTnZB?=
 =?utf-8?B?eFFiT2tndEJsWGMvZWRpRjM1enpySjZaSUdKSGtseUxPTlRoY2lxdFRSUHFl?=
 =?utf-8?B?bFZWTFJsUUo5OTg0VVJqTVdmczRMT0dlYXk4MUxwMmlMTzlsNnpUUVR5cEEv?=
 =?utf-8?B?THBUZ0hiTjZYdXFXRXdRdXpWano4SWRWQWh2K3NTVllRcXY1elI5YW1CM0R6?=
 =?utf-8?B?Z2sybmpPYWF4UHBjeHZjWEZ3YnlEVzhWL1lYS1JwS3k1dy85SVJGYlROSVRS?=
 =?utf-8?B?RDVVL3lMUExFNG5qbFdHcnhDTFZWSWRpd1M3ZzdnRTdCT0hnZnNtOWRmcjJz?=
 =?utf-8?B?dnFreTd2bDdiRHJjU2pWNndhaHAvUjg1aE5QaDhVeWtSN2pTaXBNVk1WZlc3?=
 =?utf-8?B?NEh5VDZDVktPbncrb0duS01PNXJYSmNIZTlTNTF3V0VSUzRpdzQrZ3VUTmlO?=
 =?utf-8?B?Szl5SVdIV3VCSFF5N3cyQktxdTd4ajJ6eTkreHptZ2FPN2c1amV0UjdncjdS?=
 =?utf-8?B?bnFoN3VrVkxZL0FlQTlmNHRNdXhnN2xYQ1hnSXUzdkI5aitVbTA4RFVnazZm?=
 =?utf-8?B?dWpRN0lEbjBWOE1aL3BuYktsazJzaFdmUE41c3JLTkF5U283Q2N5dFZWUnBy?=
 =?utf-8?B?Z0R6WGppaVEyb1A3aXgrc09Cb1Z3cHlxYldPeGFkdnpYWUpWcXFvRFAyUjhR?=
 =?utf-8?B?Zld0SHM3UFlEWnMwOTlHZ2JwaTFPUXkveGI0czAzWnExYnNITDBDQzZUMVBo?=
 =?utf-8?B?T0hBU0I3YnUxWEw5VS8zSXhkYnZJNFQ2RGNJYU8zWldsN1ZWNG9iSjJkNVdD?=
 =?utf-8?B?dFZPVGFTbWxrQXZtc2E4WlQ5LzBJdFRUclJWOTNDZ0hNbll3NmoweTRldUx3?=
 =?utf-8?B?cTEycE1uK3FhZXVYN0RmdzBwTEh5dHRvT3plSWZxcG9UbDlOdXJIYnA5U05D?=
 =?utf-8?B?L2V1cCsvMGY2NzI1eis5bjQ5RUFBLzhHSkpEZXBINnRPVDdqMzRvdXMvSWI3?=
 =?utf-8?B?TjIvcHVFNlZLUEQ2YWRmekRvZmM0R2VjSDd6Qk9yOEpRZ3lqSUYwb25SQkNv?=
 =?utf-8?B?cmwra3g2R1J4d0lTcDEwcDFaSldZQlhUZWVlYWo0UFVWa2pRQms0N215RDZr?=
 =?utf-8?B?MEpVbDYvZFNWaUg3K1FuOVMvbzI3K3NiNFRYbE9KUDM2dUp1dGtSOTBqTW43?=
 =?utf-8?B?Ni83amo2bWlKSUs4QXNVaGUybEpSYkdmbytia05vRFBzR3YwbVk5QVJ4RE9B?=
 =?utf-8?B?a3QzczgyUWp4QXFWcWwxVk5ic3dsUGgrVm5INXNxMERrZnJkYXpnNnY0OFZD?=
 =?utf-8?B?T2dsT3gzYVZDcDlVVGtZVnRIMUVMUXp2NU01NFlCNE9vV1hnays3R1lIV2h1?=
 =?utf-8?B?b1lQVno5RlFqdzYySE9RS1daZ09EeXFpanBNWEhXZ3pwY1d6WGl1OXdxcnB4?=
 =?utf-8?B?Q0U3K1pYemFyd0hxSVAxWDZRUEhLaW9VWFM2U1FWcWpDalZxWlBaUG5qd3Aw?=
 =?utf-8?B?aGJhRDdjTkhLeWFZamZYZEIwMWE0S055aklwUytrYktYM2JxWlJRRngrQjRN?=
 =?utf-8?Q?XCzWR4RC3dLukr7JET4EqoQ93CSiqXl5YjtO5SYlENQ+5?=
X-MS-Exchange-AntiSpam-MessageData-1: nNhJCbZuoOOKRQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1e68d95-9820-43bd-83ad-08dead1457ae
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 15:13:21.7750
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 92sQbDPbPXge0vjZH2zQL3Iwmvpx9GDScAXVpJ5lvZSRfP4h35VysCuZU58VyfwUMKV0j8emHQsQa5gEnV1rcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7989


On 08/05/2026 11:24, Thierry Reding wrote:
> On Thu, May 07, 2026 at 10:11:44PM +0000, Saurav Sachidanand wrote:
>> If tegra_i2c_mutex_lock() fails, the function returns without calling
>> pm_runtime_put(), leaking the runtime PM reference acquired by the
>> preceding pm_runtime_get_sync(). This prevents the device from ever
>> entering runtime suspend.
>>
>> Add the missing pm_runtime_put() before returning on lock failure.
>>
>> Fixes: 6077cfd716fb ("i2c: tegra: Add support for SW mutex register")
>> Signed-off-by: Saurav Sachidanand <sauravsc@amazon.com>
>> ---
>>   drivers/i2c/busses/i2c-tegra.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> Acked-by: Thierry Reding <treding@nvidia.com>


Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Thanks
Jon

-- 
nvpublic

