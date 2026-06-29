Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013060.outbound.protection.outlook.com [40.93.196.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569AC3F1662;
	Mon, 29 Jun 2026 15:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782748505; cv=fail; b=BFaDrlXqPeltkDLH0GV8oMLHlOxuE8KNFNE1Z0zg04DBHHCjBCSm2F/HomrjjhAL4SUyz+PBYnBVB7AtLwwVctT8pxsNeLJONWNWxpTNlw60VX2cC36S6HI1R3+6fZpxvf3s5g+qQONsMm4btRP817T0EvOLjbSGhFY/pBYCF+E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782748505; c=relaxed/simple;
	bh=e7Q37j5l3i81ZMsNsjXeC5QNsRBI3omfFpm9NFkKs0o=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Vw3jHTcv3/LWNu/XOfZzn0/YxnrD2EzAKi8QNxnJZ90rNdaYRIYArvZqHdYLOhG4AOsQYYV2wMMc3iGfBowtNEG0lM1c7swf789IJhA2z0XmsedA8ZCQbjmdU7Cxf8WsRFbLyz6z7UupUx1aX0q8nErkLthOwLVN78F6JtIfbs8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hvHnznAp; arc=fail smtp.client-ip=40.93.196.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hvHnznAp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VHyavWuNnzoQ/Zj70FYjIGhbRvWKnFhsiS56EgdM6mlo2BXn3RLLCYSNHS4+8cOG6wV09le/Wdc01DExMJo9PeqJU4jru5MONngFmPgTVTMeARUa1SfR4BQ363vT8yKjQWbozu446QvwmRmVO16cPP+I6nc8IdIu+Wp8Igix/FNNLPNxv+NPDz2jeTmN2nStFFcMy8GyC3HwHABd5K3HG7D/7HtesOL8E66B5zfL7cz72gLiuAmTlcrs/JDLnfysewzI4N84AFMwjMDTB7NOGBfjabJhrL4BtbUQTy1OjR5vpommOyi6XX7nCIdRL7gFqZ9Zd5Bch8jiS/wVKRk7ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/NhZ5wJy1LRqxbpyNv5WxkQxP9cGKNEzDf6JbFacEV8=;
 b=P5J/KCJRBmjSozqxPbgpbxDv1UgV0fN5CQKwhjvHVTpdzKiCAbEG530g+J+H33TwsF9rrdKCVpXEwZ5rkohRFS+y15Dxr1T5sQiZNGOkaN1yig+nKwYrAA+2CkrzrNgypuXBzefWtcRi7RX7s97sUstbr1cGV9Rqv5QfTp5t+KK3g3JCmK4c4j3fMsp8Z2qYpR+76CZkkghgclOl2F5Ydh+gn11o3hP4OeNgTgsU9dU24MVi14cLV++EUz1c+k7EZKwNggy6gCswHXJQfypeLZzk28e417xOQIqMhaOLfutU1J6U7SL8j9dWm8yWE9wOdbLOofA9VOAKHcy6O5jRiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/NhZ5wJy1LRqxbpyNv5WxkQxP9cGKNEzDf6JbFacEV8=;
 b=hvHnznApLEL7DzeUZrnmOBRrTtAF8kzVTNjN4z9PN4n6GaNqVweaR5ZqPVyvhBuekKRmNJ6zy3fszICNLcmAWCjpl5L1mTxb2Vz6fjwNLNbiAzMzrYhClNpawlHhO/ntEKCNWnGnhWGFwXEzZiS5bS+daPjGQwFLSfMyo5WoGNWgRdyAx2zVa31KO3Hi9zT1EJqxF78o5DQqpugRVOgrbvE4Urai1C93U9qjOYAWc/CnrsyFhQ9ri5LjY9ew/JG6mORe/sUx7LFR2708MytFhtpglYWegsCYvid3Ao+3fAQLFOr9Jh+cqMqK+0kWnSqXXG8LlfNARpczfVL8sUko0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BN9PR12MB5179.namprd12.prod.outlook.com (2603:10b6:408:11c::18)
 by DS2PR12MB9749.namprd12.prod.outlook.com (2603:10b6:8:2b9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 15:54:58 +0000
Received: from BN9PR12MB5179.namprd12.prod.outlook.com
 ([fe80::cf08:f59b:d016:c95f]) by BN9PR12MB5179.namprd12.prod.outlook.com
 ([fe80::cf08:f59b:d016:c95f%4]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 15:54:58 +0000
Message-ID: <16c7c5d4-d596-4a75-ac97-fb9d2c02c80c@nvidia.com>
Date: Mon, 29 Jun 2026 21:24:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] CPPC: reduce FFH feedback-counter sampling skew on
 arm64
To: Pengjie Zhang <zhangpengjie2@huawei.com>, catalin.marinas@arm.com,
 will@kernel.org, rafael@kernel.org, lenb@kernel.org, robert.moore@intel.com,
 beata.michalska@arm.com, zhenglifeng1@huawei.com, zhanjie9@hisilicon.com,
 cuiyunhui@bytedance.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev,
 linuxarm@huawei.com, jonathan.cameron@huawei.com, prime.zeng@hisilicon.com,
 wanghuiqiang@huawei.com, xuwei5@huawei.com, lihuisong@huawei.com,
 yubowen8@huawei.com, wangzhi12@huawei.com,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20260410094145.4132082-1-zhangpengjie2@huawei.com>
Content-Language: en-US
From: Sumit Gupta <sumitg@nvidia.com>
In-Reply-To: <20260410094145.4132082-1-zhangpengjie2@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4P287CA0101.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:278::8) To BN9PR12MB5179.namprd12.prod.outlook.com
 (2603:10b6:408:11c::18)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5179:EE_|DS2PR12MB9749:EE_
X-MS-Office365-Filtering-Correlation-Id: ec31e494-4d55-4e47-2509-08ded5f6c525
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|921020|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	qw//+YAnyDskIA8HOKHIq9pYZUlPkh/x6ha/oKP2gxWX24ATMFaWXKIRcgcviRZYp6kZJh1DHdXW0ubCXHmS7QqlurhwHiuekeZxyoXW6eLSHDIyYm/yC2RRXdp4NddxwTsrOUfyiCRjvTlGNu6hsUiHE3C04srYdvW0YSVSXdOEOQuIzcCHlaaKTunkhoL14Cxh6D9NHM0zYml10uhFNnFmbTIlOhbN/FDgL5I1Z2D1xdqGSbT2rahrpH48DCrakVulSsw0vWlX+GQ4IeLcuiTOatproxliv4W8lbisy7L3QRSCBFg7efOS+WH/b+ZN1w4larjPnKfOiqP5x+qQYpSunAWycww8a8VLzbN8Y78lh2MSp7UolwyuZw8tazcuaniOhDZFABUw1ImStY1W6patbCSjubw3UHkElcMc79nHw83HUP8zmtF9eyf2WSgjM9IjrQUPfW+8YLGTCQq04JrBsziCkcKg9x0gZ4ByTjoHxSseGiBIKruOSX0QQITESWxp/Xe2VWG18vMPZr+BRR8p3Y26XwJ+XPVtS9jfUVOGZHV+8WjuV1QW8qRC//AebW04OyL5m2jCFAl9/QnV79rXfUtQKpbEAfEmLhk9zmroo42E11XkM6j0B4cGyiKCwXD/hvsHvnZRlgu3BA4DvrXEvpOHAo0L5VY2F0QLq8HEo4+UVeNPaHTIExEDGYiCEcJokhOze57rDlxYAL5ubg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5179.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(921020)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dW9PTyswb3BIdkhISjRxbzFjNWZmS1VkNGxJZEdDK3pCNmJINi9DNklGQXZB?=
 =?utf-8?B?RnJUKzlGSTlCQitGZll1bVYwWTBJdDFrQy9ibkJTeThrQnY5bER5UVZGaGxB?=
 =?utf-8?B?bnpJajhIOXBrTnhDOURLUmd2VUdCbzg2V0ovejJaTWdUT0Z2c0pnV1RMSzlS?=
 =?utf-8?B?bW02NmluMVlTTzJWZ2xLblpleEJpYXZudzZzbTNxRlEyNVUvVmR6Z1NOK3NR?=
 =?utf-8?B?RHVhU2RIMnhqYm5ZazZhWVMvT2FNMC9LNTdDRGZDWHluczg1WGY3aVpSU2Ju?=
 =?utf-8?B?eUdtY2VVZ2hCLy85cnd0eExuVjczNUpwOGZpbGN1RnU3THJhV2Z4UU1BV3Nq?=
 =?utf-8?B?ZjBlYWQwNDlyYit6SHQyS0hwYmVabHMzN2NZRUR1TXFIdmp3T1VFYjdPL0pH?=
 =?utf-8?B?ME1Mc1VIRTNNRWk1QUVmTHZzQlNWUlU4cmNML1l3a0JINkNlQ0tFWFl3aFlR?=
 =?utf-8?B?RDNuSWxvSk04Ymtlak1tWEcrUEJIWmZxNi8rVDR5dXlRb0lhd3EwUDZQeEJM?=
 =?utf-8?B?b0x5Vlc2R3Q3Vm1XSm45WnNRNHdSOUo3NVFGR2tqNDgyT0hrajNrdXhUSkV5?=
 =?utf-8?B?Q2kxSzNvSDV4K1U0b0NOWmNLc3U2MkswblNpUzZrcU9zRHRCMHV2RXZMSnRD?=
 =?utf-8?B?amlmU25xWHE4aFlIbDBGOENDZlUwQ3VoZ2JVVzFTV3BEYlJsUDlFay9naCtO?=
 =?utf-8?B?N29XTEhrMjRvRUY2YVZTTjl1MU5rcHJnZGpnYi95bm5QSmwrT0ZnVjduTzdj?=
 =?utf-8?B?RHBlMFgwWElDMFpoaWxUTldoV1VpZXV6MS8zMGRCT0JhMUVpbzFxNVdwbzhI?=
 =?utf-8?B?WkZnejdNcjdmT09LRlNlU2RIa0UyUENHMUQyNmZEemFUcy9LR0FWQkVyS3Av?=
 =?utf-8?B?NUZ4QWo4WWtGbFBYRWFmRzcrVmJKWUFzbVFZZTNLTWUydkluNndxbUY5by9v?=
 =?utf-8?B?eDZZdDgzY2RacHo2RE9rZzdrMDkxa1dTc3dhZE5SZmpSK0x2R2FRVVR1cWo1?=
 =?utf-8?B?M3FaRUc3NXpTRVlEc2J2YlpIMC9XdnFyaXl1K0xwVzhMYzNYc3BDK1RaN3l4?=
 =?utf-8?B?a2tpdUpXSnFmeHU1cWN2UDJOUGhkQjJnMjRCdzVvdFRaSG43NWZ5YnAzQnBu?=
 =?utf-8?B?djl6REZyZ2JtLzM0WDkvR2ptQUVQdUF0ZW9uRDJFeVVsSTBBR2dyU3k3Q3d1?=
 =?utf-8?B?amNvODc0YUVibVVONTZYdFdaZDg1K1RqM3RjTUFreDZNdUFvaGFOQ3JjVElM?=
 =?utf-8?B?UUY0TDNLTXNydFZsVE1DblBSRS9jNDNKdmR5WXFxUkxBaG5LaVJ0WmtnNlgx?=
 =?utf-8?B?T2dlSEh6RWU0ZFBUMXFQRjJuNjhzb3RNRG5zNEdsYldONEZCMlFCd0pFbXNJ?=
 =?utf-8?B?cXBTT1pneWRwVzludXFZTzhCQWo3TVFyc2dTelFhNlR3MU9IYUVLdkgwK0lU?=
 =?utf-8?B?OGVBWVUyYm9taGRMa0JvVmZ6UWhBL3hFYlo4N0FFUzNIL1VaZDdDTzNmT2Fv?=
 =?utf-8?B?Y2lSNCtTYjdGQnV1NzFBQmphK285U3J6NGJVcnJwdUJmdWVZRkZVVHVTZ0F5?=
 =?utf-8?B?TmxYazFHS3p6Q25Wc0JlblVCcWtpbmJQUGxhOVNlQzNjZ2lTUnN3aVAvMlBX?=
 =?utf-8?B?SGxUbzNZbWlhTUZTcjF1UGJITzFiWGhVdk0xQWdjakJvTmJHSnVuR2JReUtk?=
 =?utf-8?B?WnZrS3BvSjhVQ3BhTjVEWjdIZmtCN050L0tQZUxJdi9OTTNLdGhHV0VhK0g2?=
 =?utf-8?B?c3YxaXk2dlNKeUEwVmhYakxROFZNZnNnaTRRbzhsajJaTkFaVHJXTUVjeWR5?=
 =?utf-8?B?TjE4TjBpbWpOVjBKK2d1WCtUZURPQ3NsWXMzWUhMdE0zbm1wL2VsVHdWMFh3?=
 =?utf-8?B?WjFHR1RaWHU5OUs0dzFIUyt0MFNHRUtHUXN6RjNMdmpjN2lsZExOSk9EYVla?=
 =?utf-8?B?blJzRzBOenlzTE9OL212MmdteWJpYTYyTVlzZTExL0hqL2ZwZVFHWHpRT0VS?=
 =?utf-8?B?bWlWZVA2UEpUd21Gb1dpQVdMb0VzT2NlN01ITGl2VzY1cTZZRVF3YzZmZWhC?=
 =?utf-8?B?d2JsOWlnZzN4RUlOa0h0UzkwZ3A4M05idEpLWndiREhKY0Q4Z3dMZmp1ZmZC?=
 =?utf-8?B?ZzlqTzdlaDF1ZWpENldzSFVLdFpzakRWRGJvZEVDZFhZYjNQV3diL0pjSlQ2?=
 =?utf-8?B?MG5CaXBMK3ZSdHZ6aE9SM3JYVU1DUzhjcTIveUJ5RHZSTzhrUUx4OVdtL1lE?=
 =?utf-8?B?UmhNdkxscE1nUEVvYndBb2FWb1RpUEpmQm5EVXgwZUtHa25oVWJKMkVkT3Vl?=
 =?utf-8?Q?op0nYw2XlxcjL7VKP1?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec31e494-4d55-4e47-2509-08ded5f6c525
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5179.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 15:54:58.2422
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K3wz0GisUb2VqLRRR3Qx2S+G/ASzf9bzGWcTdUry0P0QDlQpP8Mmd1/Qwxeq0X806s429Y2SzXWkXQWoiPnGuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9749


On 10/04/26 15:11, Pengjie Zhang wrote:
> External email: Use caution opening links or attachments
>
>
> The legacy CPPC feedback-counter path reads the delivered and reference
> performance counters separately.
>
> On arm64 systems using AMU-backed CPPC FFH counters, each FFH read is
> served through a cross-CPU counter read helper. Reading the counters
> separately therefore widens the sampling window between them and can
> skew the delivered/reference ratio used by cpuinfo_cur_freq. Under heavy
> load, the skew is observable as transient values that may exceed the
> platform maximum, as discussed in [1] and [2].
>
> This series adds a small generic hook for architectures that can obtain
> both FFH feedback counters in one operation, while preserving the
> existing per-register read path as the fallback.
>
> Patch 1 adds the generic CPPC hook and uses it from cppc_get_perf_ctrs().
> Patch 2 implements the hook on arm64 by sampling both AMU counters in a
> single operation on the target CPU.
>
> [1] https://lore.kernel.org/all/20231025093847.3740104-4-zengheng4@huawei.com/
> [2] https://lore.kernel.org/all/20231212072617.14756-1-lihuisong@huawei.com/
>
> Signed-off-by: Pengjie Zhang <zhangpengjie2@huawei.com>
>
> Pengjie Zhang (2):
>    ACPI: CPPC: add paired FFH feedback-counter read hook
>    arm64: topology: read CPPC FFH feedback counters in one operation
>
>   arch/arm64/kernel/topology.c | 75 ++++++++++++++++++++++++++++++++----
>   drivers/acpi/cppc_acpi.c     | 58 +++++++++++++++++++++++++---
>   include/acpi/cppc_acpi.h     |  7 ++++
>   3 files changed, 127 insertions(+), 13 deletions(-)
>
> --


Hi Pengjie,

Thanks for the patches.
The series looks good to me, and it fixes the cpuinfo_cur_freq
spikes on an NVIDIA Vera (FFH) platform.

Just one nit on patch 2 (counter read order), noted there.

Tested-by: Sumit Gupta <sumitg@nvidia.com>
Reviewed-by: Sumit Gupta <sumitg@nvidia.com>

Thanks,
Sumit




