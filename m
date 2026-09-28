Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012067.outbound.protection.outlook.com [40.107.209.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD5D3DAAD0;
	Mon, 28 Sep 2026 12:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790598570; cv=fail; b=G3/bsTqtG9eX5wQ114eSFYsKT/YrpgZy9ZYzaZ0NHlQFE5H3nnq3OVLLYfJ8wGu2qhTAac6sfa19x9hL6kMCon+fHXopa52yTP2GU0ML5QfKyy7l7M55CXQ1+EWWmJrmFTvvWHHR6wxP2d5VGjdsvsUBxNDGxCRjHT7SuwjiaqA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790598570; c=relaxed/simple;
	bh=FtXRn9uPhXKF5DoVO+4RZjysGuvb9O08luB1qm7PnQU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BUoB8aNumWCCrILzAjIr/cTIal9fdDrVZc+UJjUrrA3+q/Eo9M5yMbsht8zuok2krEaP7bcQHL1n46NwUuTfuhwvNHNHk6+pbyTDUb+Am5VWnUuC/gb0wEQlLYZ0Qki8oM+EW4PM8iXNJ41gTMoFEhmmTfC47i+mAcWYXW6wps0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dD0hdjr9; arc=fail smtp.client-ip=40.107.209.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dD0hdjr9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uirTfUQzW2AR99kOv8w6Mn/PHOeRhbxUC2INRbkeR5pnkPC5mrdPmwIpom6lFbn4F+INJPHeY2nOmFhXeYOlDxgFQSYk/LM/LkMvzIQLX9BU/50BcfjaMd8XR4lPeB76q+Wt5gj99tAwUFdP6ZG2DJ+DflokSqL6slHgatQbHOM4m/sd+SxyNv78IG5fh2QunSIJYu9q1bD9eTreDCWK4ZBYqEiimgCn7G+fk5zTrTW2LNJE3ECMs3EBrq/Yzx+ZUbyAAN/+F+gqlDFh0KvE0hk+W/if35p9ZCv/nzARa7IJ3FSW5f5OoZPpk17D4PRu2o/S4E5J0q+X4NwmkNUWQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xec8gi8xqKy2ReOgc6M9ikOg5AAGycup+xD7E1tIPTw=;
 b=gg70MURwedRLQjKIWHGASFBirOyzC3cQooCq52iwp/uB1/08hNnN7XgBpwRVb9Ag2evrhfqyh7rmgFwONpXaKuZ8P5JEajQF1GwkSddwsfLuF/hd20pCxbgLyiuRHl5IYsPLZ392Ewvo4i2PU2e/hkAIt4lpvjbDGhRgeJ7yr0P+1LzCAp5IVmufvUekQNjj7gx7iAV7aM1UBW4gjuUVdMQgjYSJgYa0wqlE4AW/UkOcBWxghTXNvj0MqjVd+F4RUKDYRJRse4LjiMwDi08tyQI3gSnXQBBYCPcOZuGS/JDEEboKA0aDaPX1fTVkdvoGLmocs8mxcR7BxZfo1Jg1Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xec8gi8xqKy2ReOgc6M9ikOg5AAGycup+xD7E1tIPTw=;
 b=dD0hdjr9qGkyBmStdgDaBKw6V1Gty5A6K+TvBbYpHcfjVtuGlSnmc5ET4GnkKnRd/jbbcIv+ktabj92cqAbD6WQiICqfe2Y8jbEfFbpIWOmZEFmZFGt5rX00c0sd+SjAxigLRhI+4XxXTkvF9+nKT7/AYAqbW+3KvbMINrRW2/xutMksTLdw9vASiBMYxHUTFVbSOHy1W2qydlPHIh2e6EseeoZv4GAFQLCwjDgXaSxDrLCIvaZqHejjdm4x+RcA3lZMjBNLSSUCi1k8cjAmdCIQy7JEA4xHjyWOXydr4OokGPcWC/1tkq3lxJNMBBHKx9Mq7PCgaLWPsVrDViFbbQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DSSPR12MB999212.namprd12.prod.outlook.com (2603:10b6:8:376::11)
 by DS0PR12MB8813.namprd12.prod.outlook.com (2603:10b6:8:14e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Mon, 28 Sep
 2026 12:29:19 +0000
Received: from DSSPR12MB999212.namprd12.prod.outlook.com
 ([fe80::5e39:8f96:935a:87ba]) by DSSPR12MB999212.namprd12.prod.outlook.com
 ([fe80::5e39:8f96:935a:87ba%5]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 12:29:18 +0000
Message-ID: <0b9d5bb0-2fac-4106-90cf-ecab1e80109b@nvidia.com>
Date: Mon, 28 Sep 2026 17:59:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/3] ASoC: tegra: Update ASRC ratio controls
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Sameer Pujar <spujar@nvidia.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mohan Kumar <mkumard@nvidia.com>, linux-sound@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260921085704.1248920-1-sheetal@nvidia.com>
 <20260921085704.1248920-3-sheetal@nvidia.com> <arEYfjIHa4w--rTE@orome>
Content-Language: en-US
From: "Sheetal ." <sheetal@nvidia.com>
In-Reply-To: <arEYfjIHa4w--rTE@orome>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN0PR01CA0023.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4e::18) To DSSPR12MB999212.namprd12.prod.outlook.com
 (2603:10b6:8:376::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DSSPR12MB999212:EE_|DS0PR12MB8813:EE_
X-MS-Office365-Filtering-Correlation-Id: 116b55e8-594d-442a-622e-08df1d5c1df1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|56012099006|10067099003|6133799003|22082099003|4143699003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	4LBT61qQdZKDUO91Bn7tMWC6BkZNXF5pHQx2rkxhZuBaH3PYCkdyGue4CkD5Evcu3F8p/C7/xzrOXmH6t39ziyAZlf6FyesyCGChS9I9H+HJtmZ5ntWqmFfoaqNjkPA/JwHY+ImbUQykIHeGGYTBqLUhGkKGOdICkyqcr71ttqSfwaxYZi/I0VeTBgPlhQYkiJOA27zRCoWKfZowVAo+67k6tfYqI7RFo7jzP7Ui3YGpipuHYuVGVxNYcPrCGm06u3uCXFneBwBE2WfxkUiukUV3EUbXmxMElSfHxTg1XYAxTSFRIwtx02O3YYp92EeaQZYuuNxB6ESf2imHIZGYijdWpRR4McwZTqONoBk8JItzjkY+eY5q7O5nX0KOgjXFfKMbsOtdnMmuizv/5thYSkkO6qvXIHYYWWTFVF9LfU3xvFigJfXUk/QlagSJkuG/FUIsMCfSlqEFG7TeniZ6mfcdAE5hodQ1D5ApWsWowywus6xIojTPHwduouM5ep2NCNfcKVX7KdRaXJ1H86K9+TczKfJwRbdeoeFM/1BeWWqC169aEXiwLfiVARc27hqhc3Y3te9K73ItHwF47Vfk3gLwPESQsHSRAmmuy/XUweXn4KTgvWYajSq+WEFC6OpdeGT+4Df2EgLSoxtlQERiwVQkdh7BTspe2lvQTz+FSpI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DSSPR12MB999212.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(56012099006)(10067099003)(6133799003)(22082099003)(4143699003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?STF4UzJBQkp4d1ErcnVoWHoxTURrNEdaYytjQkptTEwwSUxVbzN2VFhxeGNV?=
 =?utf-8?B?dGJkbjAxSjRkN0F5T3k2U3lEa1Frc0hZMUVlRytwRGRRWGxWL0RJOFFsRVp6?=
 =?utf-8?B?eDJ0eGZOWDJsVkZBZktyc2Q0c2lRMlR2Zjd6ODZjRjBVRVNJQVVGWFRKSVBO?=
 =?utf-8?B?d3MvRjhSRHRkWVhoQXpxVHVvSlpubXc5VC9mcjg4RmIwMWJWR0w0cm1tOFdL?=
 =?utf-8?B?VkU2UlZxTzBzcTl2UTVGNmlIOFNGcUJ1TjdNZm5qdndLMHJpaERsOTMrK1I2?=
 =?utf-8?B?V3VtY0J3am1RdHJHUjJJbUVXRXRxaXpSRVFqRCswaWlFekd2OXh5dVRzV2V2?=
 =?utf-8?B?c3NXU0RObmlUMGxwV1RrNnZtdFFmNFNqNS9JWHRLNktBZkUrWDZ2RXF3RlpH?=
 =?utf-8?B?cVpNNjBkRTMrSGErczhPNUl5MHJGcmw5d3Y2U1RIQUprWjZNaVZ5ZXN6ZlJU?=
 =?utf-8?B?TzNtdzRXVnNLeTVJcmdaZ01keHNWRzFsOEs3Wngva0VmekxSOUJMOG1OamhL?=
 =?utf-8?B?UkludndDOWM2TVBrN1Rqb3RuOU5jOFpDVG9XYVFlNGNmaVUraVJ1SHR6K0x5?=
 =?utf-8?B?V0hTUTZRQk5ydkNHTG1mUkZwK2ttYlh4VHU2c2J2NUdNSURWanhWcytQK1BG?=
 =?utf-8?B?ZGxPVHlQNTd4d2E3TVc3N2dCOTc4WVhWSXByVllKbk95enpOR1BlY0NQWldh?=
 =?utf-8?B?T2xMZmlFMEhuelZVVnEwYWVhbXFWa1EraFpZcS94dkdhejNaM2tFTXVqV09H?=
 =?utf-8?B?TUlwRSsweGxlRGRMbFpQWEM1V1d5QTJqRElVUEphdVpGUFBiWlkwR1hPWDVO?=
 =?utf-8?B?SUVSTTk5TVUrRytIZld5M1RWYzJuU2lNdjBKVFNYZGpuWXFLRDFIcVJhQlA4?=
 =?utf-8?B?cVpmSlR0dVFhSGhQQXE4bkNJUkVSTjB3THZITFQxZTRyRnE4RllkUHQ2dlV0?=
 =?utf-8?B?aUZzMjBOcEVYWC9QUnM1bk1SZzJwcFZqT3ZuN3BqL0FMeWIwd0hIOWFaZEQ4?=
 =?utf-8?B?Tk9QcTNjSWRrYU9NbjN6ZkZBZGlIVmpFRHRoOU1MQ3VlWGN0aHVIMEZIQURk?=
 =?utf-8?B?U0FZbVR3NmJpWEZlc2JUOU1HazFZdS9wT3ZuZHg5ZDZ5TFk0MUNnaDlhcW1j?=
 =?utf-8?B?WE45V2FQL0NwSTd5SW1kUE5LK0N1QzB5ZGg4UnIrRUhFN0VBaS9QOFJjUDly?=
 =?utf-8?B?SE9FOFZDOUFvd1Vpd3NPeHFHdlpuNEF4VFQxekpHZW9QemgzU3Eyc3A1T01L?=
 =?utf-8?B?bFMrZDE0ZFJuZTZFNWNSZ005dHdGYmE4SmNCVXkrSmVhM0ppZHUyUDRsOGpi?=
 =?utf-8?B?cDNNbUxBUWY3SktSUDdDbWxNY0dVTXQ2RUFoRUZyK3BRZGJTK0pIOUZpZE1W?=
 =?utf-8?B?cUpKR1dvYTZnSjdkNXdmbmw3SzJSWDJwN2pacGlMNmFRYUhiVWRPbFdkdmZW?=
 =?utf-8?B?NUR5bU5JQUVManAyKzdmRTZKRzZCemtTcEVadWN2c2hsTnNTSGozZ0VMbUdm?=
 =?utf-8?B?YXJBZjBOSkZHQXVSQW5mbjc3L1cyMm5ETFFPUkJGK3loOGdxUGFmNnNDL0JC?=
 =?utf-8?B?dDI5cDFxMGlNSVZ0eVZkRXM2RW1HU09aRG9yZ0lnZDlKRVBIamVieDZzSG9p?=
 =?utf-8?B?YlpBcUlmUVlqVVZzeXRNZ29RWjZIWjdiOVlWNFEvWE5sZk5hZklPcHFkcUNO?=
 =?utf-8?B?NEtVaTBoT2w0RFMxNDhPaGE1eWtFTDBDMzVpbTdPSjNYU3dEUDNla0FSOCs4?=
 =?utf-8?B?emVJbGM2aWo1TTEzWkFGRXRsZ3ZheWhNTXpSSW51NEYxeFNSN2VsZVcySTMw?=
 =?utf-8?B?aytEY0Z2RGNPSXVVayszZjhhNGozUTEvc0Z4aWpXSGdEMzJVZjFOeWVJbEkr?=
 =?utf-8?B?aG1EOWFTeHNNeXF6L1JVNlMzN0NaNkI2Q0IwTkJBTGlPTE9iZ3ZCWWpualFW?=
 =?utf-8?B?SHc4WDZpZ1hhc1JUNWhDVy8vaUp1bnFWbTQrNVNHVTlGU29RK0pUeTZ0VDlM?=
 =?utf-8?B?ZGMwSHU3R0VNVDIvWXdRanh5eEFrR25oWHlCTXd3NDdnaC92a1FKVjltSFg0?=
 =?utf-8?B?RjZtNndIZjRjVWhxNFNVV21EcUVWeVBUbkZIK3RmRDZmR2xlZXhkRFhmQ0sy?=
 =?utf-8?B?SlhXb2RsZCs0bFVUN3NQZWZQQ2tTZHVpL3NEeEpqNjBaaHQrNVBlVGhYMmZQ?=
 =?utf-8?B?KzFDSnp5cm42Z1RoTW42b0NKQnpwNE5PZUppVW8reTJBUDdXQnhZcVpFUitV?=
 =?utf-8?B?M1Ric2dPcXdYZHNBR0o5QTh0Ym9ZZnBkY0ZCSzk5c2ZDd0wvWEZyb053amxM?=
 =?utf-8?B?cEM2RHNsMVd1dUo0b3ExSTUvbCtPVEowYmY5WUFCbkR2ckNnOHJNZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 116b55e8-594d-442a-622e-08df1d5c1df1
X-MS-Exchange-CrossTenant-AuthSource: DSSPR12MB999212.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 12:29:18.7655
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bi5OCxlgo0302x6U7jIBhXpx9UHaSQ+Itpeh55cR9rV4i8toBYgsQC3PJ6ZP65w+oz9aikuNHt4Zge9QiIg17A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8813



On 21-09-2026 17:20, Thierry Reding wrote:
> On Mon, Sep 21, 2026 at 08:57:03AM +0000, Sheetal wrote:
>> Replace the separate integer and fractional ASRC ratio controls with a
>> single two-value control for each stream. This is a userspace-visible
>> control ABI change, but:
>>
>> 1. Keeping writable compatibility controls would preserve the non-atomic
>>     update path that can expose a transient mixed ratio to hardware.
>> 2. This is limited to only the Tegra ASRC driver.
>>
>> Validate both values before programming hardware. The fractional field
>> keeps the existing 32-bit maximum, while the integer field is rejected
>> when it exceeds the hardware field width.
>>
>> ALSA exposes one min and max range for all values in an integer-array
>> control, so the paired ratio controls advertise the fractional field's
>> full 32-bit range. The put callback validates the integer part separately
>> against the hardware field width.
>>
>> Serialize ratio-source changes, stream setup, and ratio updates with a
>> driver mutex so cached ratio state and paired hardware programming remain
>> consistent.
>>
>> Unlock and re-lock the ASRC stream before programming a software ratio
>> when the new ratio differs from the cached ratio by more than 20%.
>> Large ratio jumps require the hardware lock to be refreshed around the
>> paired integer/fractional update.
>>
>> Roll back the previous hardware pair and lock state if a paired ratio
>> update fails after partially programming the hardware.
>>
>> Signed-off-by: Sheetal <sheetal@nvidia.com>
>> ---
>>   sound/soc/tegra/tegra186_asrc.c | 443 ++++++++++++++++++++------------
>>   sound/soc/tegra/tegra186_asrc.h |   4 +
>>   2 files changed, 276 insertions(+), 171 deletions(-)
>>
>> diff --git a/sound/soc/tegra/tegra186_asrc.c b/sound/soc/tegra/tegra186_asrc.c
>> index d8ae5d997615..2b67d23f5fa7 100644
>> --- a/sound/soc/tegra/tegra186_asrc.c
>> +++ b/sound/soc/tegra/tegra186_asrc.c
>> @@ -19,6 +19,9 @@
>>   #include "tegra186_asrc.h"
>>   #include "tegra_cif.h"
>>   
>> +#define TEGRA186_ASRC_RATIO_PERCENT_SCALE		100
>> +#define TEGRA186_ASRC_RATIO_UNLOCK_THRESHOLD_PERCENT	20
>> +
>>   #define ASRC_STREAM_SOURCE_SELECT(id)					       \
>>   	(TEGRA186_ASRC_CFG + ((id) * TEGRA186_ASRC_STREAM_STRIDE))
>>   
>> @@ -65,13 +68,125 @@ static const struct reg_default tegra186_asrc_reg_defaults[] = {
>>   	{ TEGRA186_ASRC_CYA, 0x0},
>>   };
>>   
>> -static void tegra186_asrc_lock_stream(struct tegra186_asrc *asrc,
>> -				      unsigned int id)
>> +static int tegra186_asrc_set_stream_lock(struct tegra186_asrc *asrc,
>> +					 unsigned int id, bool lock)
>>   {
>> -	regmap_write(asrc->regmap,
>> -		     ASRC_STREAM_REG(TEGRA186_ASRC_RATIO_LOCK_STATUS,
>> -				     id),
>> -		     1);
>> +	return regmap_write(asrc->regmap,
>> +			    ASRC_STREAM_REG(TEGRA186_ASRC_RATIO_LOCK_STATUS,
>> +					    id),
>> +			    lock);
>> +}
>> +
>> +static int tegra186_asrc_write_ratio_pair(struct tegra186_asrc *asrc,
>> +					  unsigned int id,
>> +					  unsigned int int_part,
>> +					  unsigned int frac_part)
>> +{
>> +	int ret;
>> +
>> +	ret = regmap_write(asrc->regmap,
>> +			   ASRC_STREAM_REG(TEGRA186_ASRC_RATIO_INT_PART, id),
>> +			   int_part);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return regmap_write(asrc->regmap,
>> +			    ASRC_STREAM_REG(TEGRA186_ASRC_RATIO_FRAC_PART, id),
>> +			    frac_part);
>> +}
>> +
>> +static int tegra186_asrc_read_ratio_pair(struct tegra186_asrc *asrc,
>> +					 unsigned int id, unsigned int *int_part,
>> +					 unsigned int *frac_part)
>> +{
>> +	int ret;
>> +
>> +	ret = regmap_read(asrc->regmap,
>> +			  ASRC_STREAM_REG(TEGRA186_ASRC_RATIO_INT_PART, id),
>> +			  int_part);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return regmap_read(asrc->regmap,
>> +			   ASRC_STREAM_REG(TEGRA186_ASRC_RATIO_FRAC_PART, id),
>> +			   frac_part);
>> +}
>> +
>> +static void tegra186_asrc_cache_ratio(struct tegra186_asrc *asrc,
>> +				      unsigned int id, unsigned int int_part,
>> +				      unsigned int frac_part)
>> +{
>> +	asrc->lane[id].int_part = int_part;
>> +	asrc->lane[id].frac_part = frac_part;
>> +}
>> +
>> +static int tegra186_asrc_apply_ratio(struct tegra186_asrc *asrc,
>> +				     unsigned int id, unsigned int int_part,
>> +				     unsigned int frac_part, bool unlock)
>> +{
>> +	unsigned int old_int_part, old_frac_part, old_lock;
>> +	int ret, restore_ret;
>> +
>> +	ret = tegra186_asrc_read_ratio_pair(asrc, id, &old_int_part,
>> +					    &old_frac_part);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = regmap_read(asrc->regmap,
>> +			  ASRC_STREAM_REG(TEGRA186_ASRC_RATIO_LOCK_STATUS, id),
>> +			  &old_lock);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (unlock) {
>> +		ret = tegra186_asrc_set_stream_lock(asrc, id, false);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>> +	ret = tegra186_asrc_write_ratio_pair(asrc, id, int_part, frac_part);
>> +	if (ret)
>> +		goto restore_ratio;
>> +
>> +	ret = tegra186_asrc_set_stream_lock(asrc, id, true);
>> +	if (!ret)
>> +		return 0;
>> +
>> +restore_ratio:
>> +	restore_ret = tegra186_asrc_write_ratio_pair(asrc, id,
>> +						     old_int_part,
>> +						     old_frac_part);
>> +	if (!restore_ret) {
>> +		if (old_lock)
>> +			restore_ret = tegra186_asrc_set_stream_lock(asrc, id,
>> +								    true);
>> +		else
>> +			restore_ret = tegra186_asrc_set_stream_lock(asrc, id,
>> +								    false);
>> +	}
>> +
>> +	return ret ?: restore_ret;
>> +}
>> +
>> +static int tegra186_asrc_apply_cached_ratio(struct tegra186_asrc *asrc,
>> +					    unsigned int id)
>> +{
>> +	return tegra186_asrc_apply_ratio(asrc, id, asrc->lane[id].int_part,
>> +					asrc->lane[id].frac_part, false);
>> +}
>> +
>> +static bool tegra186_asrc_need_unlock(u64 old_ratio, u64 new_ratio)
>> +{
>> +	u64 ratio_diff;
>> +
>> +	if (!old_ratio || !new_ratio)
>> +		return false;
>> +
>> +	ratio_diff = (old_ratio > new_ratio) ?
>> +		     (old_ratio - new_ratio) : (new_ratio - old_ratio);
>> +
>> +	return ((ratio_diff * TEGRA186_ASRC_RATIO_PERCENT_SCALE) >
>> +		(old_ratio * TEGRA186_ASRC_RATIO_UNLOCK_THRESHOLD_PERCENT));
>>   }
> 
> There's a fair bit of complication introduced by the concept of locking
> here, so I wonder what the impact of this is. The function name implies
> that sometimes unlocking is needed and sometimes it isn't.
> 
> What if we unlock unconditionally? That doesn't get rid of all the
> locking and unlocking, but at least it would avoid the need to track the
> current locking status.
> 
> The unlock operation doesn't seem overly expensive, so maybe it isn't
> worth trying to avoid it?
> 
> [...]


This follows the ASRC hardware programming sequence. SW can update 
ratios directly for changes below 20%, but must unlock/relock the stream 
for changes above 20%. I would prefer not to unlock/relock for every 
ratio change because stream locking takes some time and would delay 
configuration unnecessarily for small ratio updates.


>> diff --git a/sound/soc/tegra/tegra186_asrc.h b/sound/soc/tegra/tegra186_asrc.h
>> index 0c98e26d5e72..9cc8cec6c204 100644
>> --- a/sound/soc/tegra/tegra186_asrc.h
>> +++ b/sound/soc/tegra/tegra186_asrc.h
>> @@ -7,6 +7,8 @@
>>   #ifndef __TEGRA186_ASRC_H__
>>   #define __TEGRA186_ASRC_H__
>>   
>> +#include <linux/mutex.h>
>> +
>>   /* ASRC stream related offset */
>>   #define TEGRA186_ASRC_CFG				0x0
>>   #define TEGRA186_ASRC_RATIO_INT_PART			0x4
>> @@ -111,6 +113,8 @@ struct tegra186_asrc {
>>   	const struct tegra_asrc_soc_data *soc_data;
>>   	struct tegra186_asrc_lane lane[TEGRA186_ASRC_STREAM_MAX];
>>   	struct regmap *regmap;
>> +	/* Serializes ratio source, cache, and paired register updates. */
>> +	struct mutex ratio_lock;
> 
> All of the operations that are serialized by this lock seem to be non-
> sleeping register or cache updates. Could the lock be turned into a
> spinlock instead?


I think this should remain a mutex. The protected paths call regmap and 
runtime PM helpers, which can sleep.


> 
> Thierry

