Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013052.outbound.protection.outlook.com [40.107.201.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF27E33F369;
	Thu,  7 May 2026 07:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778138633; cv=fail; b=aiU+b39AfDtMNsfaCPrmiVNrkGThecWqyE4rI0wMtasGgC7ByioqYR6wxi+gFrIcQPOVnXFJ5k/flCK1pz6ECKyBKh+XRYBz1wDqDbVCrLbvoRKm9lcmtj++i7rOz4aV+MkvzQZ+twkz5lyp9tOuivzv+9PJuhI7NPavVnjy7ck=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778138633; c=relaxed/simple;
	bh=4YA9vNiFfTKF6l3rd9GU+tEZMtKuYjTC0VjeOBQdfWc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WlWbjFoclXUqQRDnTsqo1nPnVtOcTXDS0RVVUTm6kbIkccgRTpeG2Mi9bYIUvnjGy+OWs799yStLQgblWclGcoUrtXdEnH4HNYbozT2IqSa2Jt1655RubQiV+5yp38zWOXtBscLleZxgLDMh/HsrjVDwm4xw++6RH5ppcDJtFcE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fap59XZJ; arc=fail smtp.client-ip=40.107.201.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fap59XZJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GuIpDOUJDJEeBXSuyGGpC3LDbR/6t55wj4cswBJjYnSCJLyZgx44lHnWnXNwIgr4aCr2fVco3r+Gveg5REEsOexK3xdysWbrxDvzYtFy3QzUm59kMvofuMq9CADNHW3TA0/Gi3eyJOGMhg/lOR++UiRUJ0YP4WX/lHnXdFE94idu/q8v2Ycs+ytjR4FaxDqjIgtBz2A4F1ZsOv4Xx11KzbAoMOJwMcuL5hmwHTWxJH/Oe0Vuj67imdEu8z1xUXFk+KICDIn5H+XpZ9N/OtEd46LoeWyVzM4XTga+s+LAXh0DAFFb0EnUbP1SJYho5iYlyX7Ka3Csq5esgqEyR5Bk9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eoZPyr2Ygb8H8HaClS/tzcWiPmkXaXL8/ivhAuZj4J0=;
 b=Y9FdWNNaFknaT4YvfkFvdEQMs928rppFpMa49h1Kw0tqXly10+DICBGvBB3T2NDCCfbQPGotO/Cl2VR78tM9z6ey6Qp3F3oNUtxSmn3XdIHpE71dQ/DVy2vGSG/q9X1KnU/95OyqXHFhyF/LugI0L+xIN3GUYTcusOdAoCAgAbm/GatEFeX2Zafxru/Wbv1VzGD9QJxGM7n7t4BktC+jhXXgsiKPEHErQSbH/PS+WMU0sKn4TALTBBVbBsX2k5kORr+9yJ6pQA0F0o3VObi8YRFC4xgWqJK37gIjv7XWmo9/jagRb+BpM2Ff6M+6SS9+q83uQLqDn6i5/Vl+/1IfZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eoZPyr2Ygb8H8HaClS/tzcWiPmkXaXL8/ivhAuZj4J0=;
 b=fap59XZJXUP58qIm5eHnNkpBQUl9XkZ58lV6ATi3haosFwQfY+CjdNgB6jXvZbVkwQwzhnlxVfuJ4KEyok7P0HDAGR5pRpiLOi72fbmg6XxrqFZi8Kmhj7iTptjbjMxs7LnHLt/oU20kTc5KTIk4CrmRbKLJb3QCxiZxVkn5mIUKbWBh0OQPpRpRgFJTtHJpHPBm8gobbQ6WcmvZAoIhR58CTcaMerZ4tMZrV3vmNClqRtcnsyFlnH8gDHOQE0QmO8XpKly3LxMw3hkc1EUBNrvRd4X6W/dIm7tUZGDDtGjVxifQ4zktpLpTZ1hZVUcqRF1wGoGE71KNnNJwDeHSyA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by CY8PR12MB7122.namprd12.prod.outlook.com (2603:10b6:930:61::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 07:23:44 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%6]) with mapi id 15.20.9891.008; Thu, 7 May 2026
 07:23:44 +0000
Message-ID: <550181b1-7612-4b01-92d9-3257bb488d8d@nvidia.com>
Date: Thu, 7 May 2026 08:23:39 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] i2c: tegra: fix error handling in tegra_i2c_xfer()
To: Saurav Sachidanand <sauravsc@amazon.com>, wsa+renesas@sang-engineering.com
Cc: Laxman Dewangan <ldewangan@nvidia.com>, Dmitry Osipenko
 <digetx@gmail.com>, Andi Shyti <andi.shyti@kernel.org>,
 Thierry Reding <thierry.reding@kernel.org>,
 Kartik Rajput <kkartik@nvidia.com>, Akhil R <akhilrajeev@nvidia.com>,
 linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260506195319.44810-1-sauravsc@amazon.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20260506195319.44810-1-sauravsc@amazon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0098.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::13) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|CY8PR12MB7122:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e481c5f-8d0f-4042-9df7-08deac099240
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|376014|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	khRf3uccR9Jr2lyo3G9m1zRRbt3ffgAAwKv037tQDANLKWqcoJaGkb/Jg/CQ0oFD4N8+uERBKpWYgM52oXXe1XIvTvxkMBEuC8AgblGTTISvJXWsBzCIeX1AY5UYSXQTJlngNRIe/XwTVEoj5ng0NEKUF1tVs/OR5nTyvANzgkQKJO39Yr59ul2u1fZWDvs7T2Lc3ce4/eYo/PIwkBn7JY7NrAF1GgRBjZRwpM5JvZV6O+Syx7uitpYiRbCZmzLjOKLgtfiXWvQY1hvEetZ8+zWJ77Dqt4K2XzhknIRJDGue04EhE7ItM4HBVP6Pa2wrT1Bt4KQwsA2wVxDzMmbKAKW8VYtRwA7e9nx1ssCXMsqiHmM5DSFkpvyYUkRqYN0NdLyShjdyvvBX3ii/AKw4XykyRQFY/0C4prPtQzxmvd80tfUVA2z/gev2D6i9Sl2Gv4s1DKqweUWiEb0NvSeugA9XDtmIoWk2CBUSsir6w9lKulnSJ0loBDt8SFgRoERBQdC9Gc1f4vIyZ8qFA/mj2IunpS/AQerUwLW0zKRR8WrSDdDQ+3efiCh+SzV8IkgbJ9aJB5EPISX+Ze0ZboxDtZC3O8D10Vi2yjt9mn/rkQk4lFAGWebICiCbaAaU7EsVSkWRodpQMW0KeTWTRYpefIP6cEFD2URPDV70YDr3v7BI3W+8E8bIWL084zBlozFp
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U0hieFRMMHNSRlJzMkp1eFhkRWw4c0NFSy9VWjVjWHprZXcwTXdpSUI3bVF4?=
 =?utf-8?B?YzZqcjBscWlKYWI2K3YvK2ljZnhydXY4bDNsZVF2djliU2FBQjVaemNSYjN4?=
 =?utf-8?B?U3FUK1p3ejNrWVlqQUhSdlR3SW82K1VNN0l1Y1BDMzI0d0lnV2lodzBqazRo?=
 =?utf-8?B?bVRDUVMvcGdudnNXRHNkQlViYXVrcFRpWW04K1BtaExrUTJGQTB2MGhVYkxS?=
 =?utf-8?B?L0FTSVVNS0xsb3FXSXJBcGk4ZUswUjYzS1hCZ3ZkdGRPSVpaUXBka2dnNHpS?=
 =?utf-8?B?ZDhucjcvVlZZYVhUMlV0ZzRnTXFiblFPQWdySTNTM2hRSFh1VUU4VkFnYThp?=
 =?utf-8?B?UExKNFhlQkhCa2dpZ3k4cUI2a1krSlNGVUZ0ZWNzSXNJMTUzdW4rM1E1SVdJ?=
 =?utf-8?B?allJV2Y1WDFqU0tKMi9uV1RXcEp6UEpHaVY1THM5Y2JXMVgxaGVtY3pCTU5o?=
 =?utf-8?B?MjV3M1NQNW5lTjJzNWt4YlN5SHRNYlAxdnJnWGJYYlNLeTduM2RWUnZrMXBp?=
 =?utf-8?B?R0ZqT2JkMjVYbzU3WjR1WW41bVBndzQxbk9SWC9haFdqRkhzdHVrazA4U2pp?=
 =?utf-8?B?aktzcWEyM3VBYzVVN3hQT1h2cnp2cVg1aEVSVEFTOGJlZ1NmZWdYYVo2Qms1?=
 =?utf-8?B?OGFiQ1F2Z3R6ODZRMWZtQlJVeWhIWWY2RTJjNkg1M2p3a1AwM0VMUzZvcTcy?=
 =?utf-8?B?Zm5iQ2NRMUhNY25vdWRyT01HM2hCN2dPYWdVNUhXUTg2M0xxN2twanEzSDNv?=
 =?utf-8?B?V0wrWDFKaGh4bEh6SGt2TVdVNjhJS1NldFYreTlWS01HVTc3R2FHeXU0dk5D?=
 =?utf-8?B?c1M5M01IMHFPblNLWFpGUG1vNndmaFEyRXI3NVZXZm84djhFVDFuY1dEbWFV?=
 =?utf-8?B?WXJSYWVxN2IvR0NYNFZPdkV3SzZ0MGpUQmZ0MlZTSXFZUTVOeGhFcVFsaGlY?=
 =?utf-8?B?dG5maDE3SS9LN25UbWJSenVDUGhOb2hTQTQrZ1A1Q1dZRzMzdktOTElDc0tQ?=
 =?utf-8?B?Y240SWNubkJtU2VwdnJibFFsYXdTdXdFaGtjL2hwOTNaSUVLTGlqdzhRWFIr?=
 =?utf-8?B?dTVRbkxlZlVWaUcyTlhmdm1oYThSTUhhUTY0bE1yckovSHRTN1ArZ2NyNVBR?=
 =?utf-8?B?KzN3dHYvckZnWDZnWUxEcWRYZjB0WnBNVDR0dkNqYkJsd1NUdmFxSTd3SFUv?=
 =?utf-8?B?NzY5dnpxUnFXYldYeVc3SW9CU0lmVWsvY0MxK0ZCWnJpRmd0NnI2RDFkQUNQ?=
 =?utf-8?B?MkFzUGE4azd2bEoyMy93ZlR5MndvQTFKVHBPUlE2ZGxySEsvRGVZSmlwU214?=
 =?utf-8?B?THgvcWVPejdQZTAwcDZSL3l5RU9HZWJLNEdLZ2xaaHNMZ1NKM1B4MU1mcDVK?=
 =?utf-8?B?SlZ6OUN3S1VCRjgxWjRZNG5scnNkQkhhVGN4MnhoNm1PdXVSQVR5NWVmM2p3?=
 =?utf-8?B?YkljeTdDVDVmdEZEd3E3SzBqemoyZllGeDNjZVQxYUdyYWpUUFhPdUo3dS96?=
 =?utf-8?B?WFpaNU5EOTdlbzVwVkc1NzQ1MUJIQnprZ3lGMEF3cXBhZ2R4dlpGTUJ1QzVB?=
 =?utf-8?B?bDZsbThJUnAzWmkrdUlJNHViNjVnbnV6bVhNbC93QjhGU29qUjgxVE9hSnIx?=
 =?utf-8?B?dktWK2tYaW5SY2EvNWw2WHdhNVJPM3VJa1dMVEQ0Q0pBVVBMTW5ic2JXUnkw?=
 =?utf-8?B?bHIydXlvWlZxZXd1RjZtSVVlVm9JU2NKRWcrY0VGcDRuVTZPaGhNdnoyQkVv?=
 =?utf-8?B?SmcrVzVpV1R6UkJqSU9xQk5OdTZXYmYwVEIwY0I0MFowRSt3eWFrMWNXZTlv?=
 =?utf-8?B?cHM3a0NNRUtuOWF4SksxRlJ2L05iZHBNak5qV3VRTnAybmNmN0V2TDZmb2ZG?=
 =?utf-8?B?MUp4UWlmSnJ3bHVrejU0VkdNT1R0WDRLN1lvTytCNlR6MllQd244LzloMkd6?=
 =?utf-8?B?RWFRUnBTRG80aE9ZdGl4ZzdrK0VaTXBiRDl3UUkzUERjTVRyd1VMUHR4Zklr?=
 =?utf-8?B?czk1cDVLNlBlUWdiN2Zlb2ErTUUyUHo4RVNaT0RtK3F3S0pQdmFtUlp5VkVB?=
 =?utf-8?B?MUZ1b1B1dmlmQWkxWlVvdjl4ZFNJb3Era0RSUlV2a1J4NjJuUEsyTEZ4ZEdt?=
 =?utf-8?B?T2VKMkNQMENGZHROYStEVWJBUml4WFVoVmI5TEpjdEJRTVpNMnhVV20xcXBq?=
 =?utf-8?B?bVdiQjNseTBPWlF5OGgvZzZHUkx2MTZPTE53VkE1SXZodTlkNDBsT21aUmV4?=
 =?utf-8?B?cXBzdEpSaE82OGdvVWdLWFErVHppTHdNRzVWTTNpbHhmVytySkVqaTFRUWtQ?=
 =?utf-8?B?V0cwOFlCUWdzbHNWNHhlTTZ3b3pJb0Q0Y0VsMTFrTUZDNTU4dUsyTk1idkI5?=
 =?utf-8?Q?ruhd3oHGrM57siM8XqrNp0Ed3rq4GwHnZ+jzlTDRLoheM?=
X-MS-Exchange-AntiSpam-MessageData-1: Z/TWvbySq7oHxA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e481c5f-8d0f-4042-9df7-08deac099240
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 07:23:44.2890
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kPl/OuWEEvnrzMUmAA0rw3WO6n2pjOGiBPop5P7iW1mm9/SxXgv7A41VcgPmJkaL1ugXn32nRDExoa5/rK7lRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7122


On 06/05/2026 20:53, Saurav Sachidanand wrote:
> Fix two bugs in the SW mutex path introduced by commit 6077cfd716fb
> ("i2c: tegra: Add support for SW mutex register"):
> 
> 1. If tegra_i2c_mutex_lock() fails, the function returns without calling
>     pm_runtime_put(), leaking the runtime PM reference acquired by the
>     preceding pm_runtime_get_sync(). Add the missing pm_runtime_put()
>     before returning.
> 
> 2. tegra_i2c_mutex_unlock() unconditionally overwrites ret, which may
>     already hold a transfer error from tegra_i2c_xfer_msg(). If the
>     transfer failed but the unlock succeeds, the error is silently lost
>     and the function incorrectly reports success. Use a separate variable
>     for the unlock return value and preserve error priority:
>     transfer error > unlock error > message count.
> 
> Fixes: 6077cfd716fb ("i2c: tegra: Add support for SW mutex register")

Although this is fixing issues associated with one patch, this is fixing 
two different issues and so I think that this should be split into 2 
patches.

> Signed-off-by: Saurav Sachidanand <sauravsc@amazon.com>
> ---
>   drivers/i2c/busses/i2c-tegra.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index 9fd5ade774a0b..704942d10d69d 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -1656,7 +1656,7 @@ static int tegra_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
>   			  int num)
>   {
>   	struct tegra_i2c_dev *i2c_dev = i2c_get_adapdata(adap);
> -	int i, ret;
> +	int i, ret, ret2;
>   
>   	ret = pm_runtime_get_sync(i2c_dev->dev);
>   	if (ret < 0) {
> @@ -1666,8 +1666,10 @@ static int tegra_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
>   	}
>   
>   	ret = tegra_i2c_mutex_lock(i2c_dev);
> -	if (ret)
> +	if (ret) {
> +		pm_runtime_put(i2c_dev->dev);
>   		return ret;
> +	}
>   
>   	for (i = 0; i < num; i++) {
>   		enum msg_end_type end_type = MSG_END_STOP;
> @@ -1698,10 +1700,10 @@ static int tegra_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
>   			break;
>   	}
>   
> -	ret = tegra_i2c_mutex_unlock(i2c_dev);
> +	ret2 = tegra_i2c_mutex_unlock(i2c_dev);
>   	pm_runtime_put(i2c_dev->dev);
>   
> -	return ret ?: i;
> +	return ret ?: ret2 ?: i;

I can't say I am a fan of this. I wonder if we would be better off 
removing the return value from tegra_i2c_mutex_unlock() and just WARN if 
this ever happens? If the unlock did fail, the actual I2C message may 
still have been sent and the next time we try to send a message I assume 
that the lock would fail anyway and we would not be able to send further 
messages.

Jon

-- 
nvpublic

