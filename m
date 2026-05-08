Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013043.outbound.protection.outlook.com [40.107.201.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAED63FB077;
	Fri,  8 May 2026 15:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778253268; cv=fail; b=m/a+qcjbUXsslfSATlzvJLF0QCFfAkeS+Rsxj/Ojt+w730/FvULRIB9s3DzHrBc33xYShXQRodDmBWNxPitJNwFy5Toh0w2JhiuUu+Y3oSwVe0rq2bos3PkJlUei89gzl+SXG39/XUzcQ3v9e/JOQrXJ7gLBrfkaDhD139kR5EE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778253268; c=relaxed/simple;
	bh=EaH9RS2Vw+TCzFOnAOM31alQcHeCLu8MVwgk6A3TyY4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=thgCvpCgLJO9hb9GiF6TW8NVDDORkiTiA/5ZD+knZgRcAJOvv+Sl5o5Q7Aj+Xs3SqUey7TS5iYwPKyzwqf89I6jmC1ae1yoGJCiQvFHiZ5cieMs3VzRgbOFYqy9yN5N7wgVQqVvvebhkBaMapnVt7zI8H2aoqOVWbKwYbGE9gXw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=GNBHlc9x; arc=fail smtp.client-ip=40.107.201.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="GNBHlc9x"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yaooG0IibC0ITLGHIUvYenqKdKLvOEyqZQHwbeEQF87REGMCxVYYawKS160LLaOGyUM0Oe8c1TASmHfPnnCYILX1hldqmOaTpA1y+ABTmH67hA2dYGP42oSeOJczm370vZlyRh2huMIBY4zLoQOwczUIlMNwpoMfCedZIs2aLRhRcjxBJuH93WG74OrN1vYI7qqn3MYrRSFL+glqoKrX+mSR0vcn0JfIX2NbN95mvj23Qz0I9qZcI5EyFdl40OhR437fDH4VH7sFWwCgZEoG/ZjzNXOP3m50h9fVNxqJEIB7j+ZK6ajhBlR90CldrW2fH2EJS6j01qORX5I4e45EIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4aPoMxPbgNt9SrdW81VWWDRqxD5gN3OmIXN4I7Oie0U=;
 b=Cl6jxV+x4PGgsF51geuzMPJy2ScT2kpN602mVVRzN6BRV1uGe0KuZ9S3RmwIq4BPMcrYCpiLjZ5650iL2I66pIcu7s2/Gi5yrm3q71yHI+AB+JcZTg1UM49nyRV1lCil3uhJImptli5TSoa7zTktuot8qW1dNYLZUK20P/hcP/ZHUGeJHLpSHmJie/h13WONkiyJjjvdSsgkawDOGAaP3W6nCFq4tqJL3m/FCJEWcGB5y+NSJ4ZPtS2q9G8xhxQiY0X/hLKUN4t4pJbeVNmRSDpRrEYjvgrRB0E1SGO+5W+g/oE7zYryTQMmafS9BvRYDjhYZgt8lSJDMheTn6L2aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4aPoMxPbgNt9SrdW81VWWDRqxD5gN3OmIXN4I7Oie0U=;
 b=GNBHlc9xU+38Lh7xmNA8o1+VWrc1pn/mkSnRDYLYuCnvSTXeArIDdYV0orIKm1FUp8/D18zrkeBxsQ57B6UQEMPBlIRe06w8MUtY2LZ+cGoKPi2AUwvqBPXS9mErmsLYG8V2J7H31WigS7A5hF2hdd/RWsQiqZcXuXbwz5KcLuJSN2Pndn9UzBREutWnSsAd/9B5bBc+DuB+K6ToR1WwRQtXXNweA7LBZ3r2YjT4LoGhkzrRxKle7qcqMxxozbAFmgAgtPmgf4p6uX2g9fApZLtoM2iIHK1Hu2xo6gWVvW7r5mDnSUVWCZWKornnNT1GuQOXkfuZql44of8Jo2ZJpg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by CYYPR12MB8730.namprd12.prod.outlook.com (2603:10b6:930:c1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.20; Fri, 8 May
 2026 15:14:21 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%6]) with mapi id 15.20.9891.008; Fri, 8 May 2026
 15:14:20 +0000
Message-ID: <f8441e42-e03f-48d1-aa6c-929afdeaf8f7@nvidia.com>
Date: Fri, 8 May 2026 16:14:14 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] i2c: tegra: make tegra_i2c_mutex_unlock() return
 void
To: Thierry Reding <thierry.reding@kernel.org>,
 Saurav Sachidanand <sauravsc@amazon.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Akhil R <akhilrajeev@nvidia.com>, Kartik Rajput <kkartik@nvidia.com>,
 Thierry Reding <treding@nvidia.com>, linux-i2c@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260506195319.44810-1-sauravsc@amazon.com>
 <20260507221145.62183-1-sauravsc@amazon.com>
 <20260507221145.62183-3-sauravsc@amazon.com> <af24ztuMvHkdyAx3@orome>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <af24ztuMvHkdyAx3@orome>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0239.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:350::13) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|CYYPR12MB8730:EE_
X-MS-Office365-Filtering-Correlation-Id: d9a7f594-5207-444e-e8cd-08dead147ae4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|10070799003|376014|56012099003|3023799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	/np3uviRCNYQ/hqlgTiUc6YKcybRzs+DvBZN21nP8bRfes6T/DZTHJwnQR4XzABR7F7fZzOQNq4AXEklvidhffatVONHD7A4zQ9t56gAj1UZt3Ph68ft+ziZsfXo78Q5LgLbt5KoFDr7u3NvT/QTVUigPHPiTeeIfPTJA6lKHY47lGKJ1ceVVPQ/AA9tY3W38Xibg4wRdllQ1fjlgKM+fRnUJq9aQBGM9efqa1RzzRsJESxmWEc4YwZ09K7WTIRjKEJZn1m3CZBIiJAMk94tD1Gz2J6cTa6DyH9/sxfxQkd5xhjugIRSQgU8VgKzhQXAbRMI9RwCwX+MyKYk6+6140PpxNyAOHngN7G6/Q0zDghbcLAcHxMQiYoAJ8eSXQGldFdbp68u5Kcqx76ga6Kl85b1/Q+0PEif8W4sdl0hKdWRxKQJJDIQsxlAbSbxdzLKkmGBrS6OKWbUKwW3zxCUzvny39x3wlu40jnPQf9oNgPgeTEWlCXFBHzCuvI7shTxKiVB01ZaVH36wa4rKjH5YxcGEG8mZBCQ63j1YEaIvuOZfew1llOslnmX4CTcFRkRdIlxNISrfMZFlTRDABwK2QnVl5KvU9d8XushLxIckPu2PiIzw/xahrYy9oP0PXIb4AA13uI/g2cXtOUTDzM1zLtlyKSJrIoU9hFanS1FCGkv/VDM9v4cVY0o9SHQUCcJ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(56012099003)(3023799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M3VLaS91OExjcFZZVFI1aGYzNUdPRG8rWmlSZHZjeEFzOUhGNkdMbmt3bndS?=
 =?utf-8?B?d0hSWFZad25hOHArOVJTTXhaU1VXem1iOFV3c3ZtWEczeERvYzJJSTlYWndv?=
 =?utf-8?B?eS82VVJsN1BEMjdGL0kzVDBpVlJLS1JBbm54SkxEWk00NEo2MURidjNNRWZD?=
 =?utf-8?B?WXZFcVQrMDZ0UnZWL2JDTXh5SU0rRXlCNEp6aUJmYlkvWGowekI3K3ppaGZn?=
 =?utf-8?B?NEZJZzNyVzlwS1FLczE5OHYzY09xUm00MjM0dlFUY1RaaEhBckZwSTlyOERO?=
 =?utf-8?B?RjliZnpxSzF0ekE5aVJsQXR6Zm54djIrVFF6ZUVCNXBpdHN0WHpuR0xaOUNN?=
 =?utf-8?B?YTRUZlpwOFNGM3hxamQzWlV1b1cyZ3lEZDNmbUJZVmdEY0plSEx3TnN6NnRy?=
 =?utf-8?B?UHdWeHBmTVJsZ3FtbVZsZ1NZQjhEeUg2ZVhocmhmS1FMSU1Wb3V5WUIzcFAx?=
 =?utf-8?B?MkM1NXlwUWZtZStHWEVoNTFZQld6UjFOODdvWGFnSlBDSndmYUNYVFVQTDRw?=
 =?utf-8?B?amNCR3pJdTBaZ0padmppTUJUMk1WNVVaYWRYRVR2dFVjeFh0bmE1RGhwZ3Bq?=
 =?utf-8?B?ek5SSU5ORHVTNzZIeXdCbjBxSXlybGFCV2ZnUkFUTUhHL3J0RmxnRGEzdVVz?=
 =?utf-8?B?WGhKUndFTkJOZ1NyYS90cmhxQmlMQ0F6VHY0RHFiK0JEb0J3ZEJRa2wyVm9o?=
 =?utf-8?B?bGN5Z0RQZUlMbTl2d1B3VUp3SzhCUGhNNjRmYUJWVFBmN1JXSWIrdzB2WkRP?=
 =?utf-8?B?UGJlcTNhcnE1WHgwMFNhYlY2aDA2T2VLNlNqTWxCdnhURkhOMFA2MmdUNURk?=
 =?utf-8?B?SzN1aXVqQTg0bk9hZ2tsS2NjYnl0RVZESjh4NWV2MW4xY3drd3NTbXUxSTd3?=
 =?utf-8?B?VVZTZTNhU2tpdnZUWUtTL3BnYlVCQWpRYmZFY0ppcGZUZkVKdWRGV2ZIbVNR?=
 =?utf-8?B?dmQxSFNjQ1JHcld3c2dWbGhzUy9SRDM2Q3ZhVlBTUVZ4VUpETlJicjlxUzdG?=
 =?utf-8?B?L1JRc1RIZS9GdEM5YmdOcGUyWlFuRzJ5Y2k0S3JCYVZoT2VZNU4ralZONCtn?=
 =?utf-8?B?cFFuZ2x2OVVuNEpWWXl3UENRakhTNXgvVVhMZkhVUjZ2S1FDdkJsNXJIdm1H?=
 =?utf-8?B?S3RtWlZFZFRjd1lmZzhOZGx1V2tFQTY2MXdWbFJFS2Z2dHlwcVkxb0JsbzNO?=
 =?utf-8?B?YTRaOHV1M0h6bGw4VHhSUThuZllmRml3eG5vNWFYYzdFd0RzRzU3R2UrN3Mr?=
 =?utf-8?B?RW9adkxoSDdmdG91c3Q2bEtFT3cza1FrMzUvN3ZZcXUxSms5UmMyb0g1aFpw?=
 =?utf-8?B?WExreXBjVkVBRnhhK1plM05KOTloV1VLZ3dtN29lNC9sNVBRVkI0ZnVrb1Rm?=
 =?utf-8?B?aXdla0ZBUFlTVkJDanNhRkFqYWVjSUpBejZuY1F0MUplbWpjYjRCbm03dExy?=
 =?utf-8?B?NGdsR0s5dVdQMGo3UGNiWWl4NlQ2NlpIdGFyZzNCMEk0RHdsc0NmY3pOTHdr?=
 =?utf-8?B?N2NqRVhLUEpySXBPZ1QvSFplQWE3K0p0YlVpZERCQlBaMC90WXVCTlVpSy9H?=
 =?utf-8?B?OHJiZFRRZW1nU3grSFBEWlprWCs4SFJRWmhteVBTRkp3YWx2QVJrK2JXMUp2?=
 =?utf-8?B?Q0R4QXNZaTdEckZDUmhnZlBtZU9GbWptNlJ5ekNVTkZWa1BlcUwzQ09sWnlZ?=
 =?utf-8?B?SXJpVkhBaDMxNG9JTlRHekJLZy9IbFVSSUJzTVo2TGN4OC9HYXY5L3RweDgw?=
 =?utf-8?B?UHgwVjVCdEJxY1kyTEpiMHRWaTBKdnZ0WCtmYTQyZElXZDlPM0RUc2FvNVZr?=
 =?utf-8?B?WCtHWWwxZHJZWFpxQzhyMXh6SjdaMmJHbVVPa1h5TG5NQTZiaHFmRUJPK2Vr?=
 =?utf-8?B?UFlmcEllQ1QrMnd1Q0lkKy9oRmV1aUN2aE1SdUk3dTNOc25OMWdEcUlMK0NV?=
 =?utf-8?B?cmxZemVjSjAxTE9lbHd4dXdJS0JxQUs4eWprdFhZemJKb2RoNjJIb29zUnV5?=
 =?utf-8?B?T3dDenA1SXI2cmxaT0NJS3dRd2ZSVGpDazIwMUROblpwU0dQaHNQTmY3ajla?=
 =?utf-8?B?YWJEQzRlb0MzcUwydks1OFhicDZOVW93dXozZjg1d0d3OVRuMlppY1JBR2la?=
 =?utf-8?B?MVYzR01BNitNb1ptM1g1NmRKUUc1RVkraE4xN0F1SlI3em1LK083Um95U2Mx?=
 =?utf-8?B?Ykx6S0oyYTRpSEdWL1p4NnRGMWc4ajY3Z2JCd2ozd3FkbjVoSThtWExxWVRr?=
 =?utf-8?B?eXhQOXF4WkdyZVJIdGVJRTNKbU5ZR21nZmFIZG5lbUlVaUlDbnErNnpSQm5L?=
 =?utf-8?B?WHA3dzBkTmwyZ1hac28yRVptVUptUXExZlZBOU53TWtMa2dsOXV6N01VVVNl?=
 =?utf-8?Q?msEkhOXgzWY0IUU6vifrS2wqLCCFwamiMiU1mSs2bMdfJ?=
X-MS-Exchange-AntiSpam-MessageData-1: y63CwFZonjxnZA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9a7f594-5207-444e-e8cd-08dead147ae4
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 15:14:20.8127
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k2wzL3ekZz80qBFIPk0Ay5WPNhcRtDncqnF38uNUCTUX3xXNwV3VysIH9MZmq2x3/x3WzS7Y5JmtlkO5cV3boA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8730



On 08/05/2026 11:24, Thierry Reding wrote:
> On Thu, May 07, 2026 at 10:11:45PM +0000, Saurav Sachidanand wrote:
>> tegra_i2c_mutex_unlock() returning an error that overwrites the transfer
>> result causes silent loss of I2C transfer errors. If the transfer failed
>> but the unlock succeeded, the error was lost and the function incorrectly
>> reported success.
>>
>> Rather than propagating the unlock error (which is not actionable by the
>> caller - the I2C message may have been sent regardless), convert the
>> function to return void and WARN on the unexpected condition. If the
>> unlock fails, subsequent lock attempts will fail anyway, making the error
>> visible on the next transfer.
> 
> Technically I don't think it's guaranteed that a subsequent lock attempt
> will fail. For example, if the SW mutex was somehow held by some other
> owner while trying to unlock, by the time we try to lock later on that
> owner might have released the SW mutex again.
> 
> Obviously if we've managed to lock the SW mutex but fail to unlock
> because somebody else was holding it, it means that the other party did
> not respect the SW mutex protocol, in which case anything goes.
> 
> Anyway, this looks good to me, so:
> 
> Acked-by: Thierry Reding <treding@nvidia.com>


Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Thanks
Jon

-- 
nvpublic

