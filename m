Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793804959;
	b=f1h5Fzpmg0oWcmVU+dPOf8nU/pTrum2bB4qce6R23PTbXKoEyGhggs7Zzhf7t8Z7m1so
	 wc+RLibj8haNOnEa2tjhHh7gC7T4YwGBtcKaHOV8/Ab7pEs/dwzlVnRnchepV3AWZoBJ/
	 qLLkNMLojuXOk0kU5W9rKYH74Q8zbEYaNfIBTQQWCH+ywvRWpHDfJN4DnAcNMb+UneyvX
	 JPJ4oFX2HgHhNs+XgXKauHx5ZKA9wKUF/A3yvUW/iAM0jv+JHHm5aU8JIEc4yhhjcR7oS
	 Lig8/npeDfCkZC3Sy4jcX5tf+7lCyfZ/SLi9KVoqGeS4CPz5UnUeK7ScWwr6cjnXehQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793804959;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
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
	bh=WOQNTpxZrzq5kJ3JlG17fHMELaH4+veU1ow7zAuNzSI=;
	b=4Bogr1kwLrRjOLN+7blzf830npOVLOS1KHKdkrJu80fTVIA7RlbkY1uCYL+mWtPIYIqZ
	 2gRTtRw3HnsQFZy6qqhb+VhGDlufQsGJgrkKKAnYLDVlo0oEa3pweZMhBUB+3lMMhbZTT
	 78DbfUquIDtj3VArP1Hgfei+moUV804ecGE4cbszKFafZpwVg7yfYHxQSk/TmI/IJd4Fk
	 AvhCnFG5dn5yGbcRIaC6jAVzA2N5C7h7OBP+NL/nsc7qbDJLNJXiDJfXKTqklDDUFx61K
	 QQ4Nj3/RiGqnjm30+ayjWRG3cSui1M7pPGc26UYFQAL9B5W80Q2I1apd4GeH1ZZcpgQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=OFABWbWf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.44
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011044.outbound.protection.outlook.com [40.107.208.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B6B606A31B;
	Wed,  4 Nov 2026 15:09:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84B6B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=OFABWbWf
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R3mtKNkvsJpM/v5uUlREyFwAVUisd/3nHtqtaIHsmRiw06/f2zxRZAMNYCkbGAqMu/R0FHHSAzN1DZ1IGnnAKZSI7qQOpd/d4biYMt0XocZuW97W1orRVQaD1ztKRlsj2Bdpg3hH9P6rUhskfbV1XqQL6M0swUo0vd7YqqYXXDAs+JE53bfIIAhgYYtihRWAdYiSDVXGJv6E3e3FtMOUMFYEj4a/YuxSmbo4qkac8aDT46Zs1x02Uk12yxKWLYHR0FU4/qSxxtn6++iLCJVYoN1lCSCBktQ6ZAOfPpfSamJVphF884PEKDKWwFQu8GLUIWxZcftePKMqouu2DJkhww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WOQNTpxZrzq5kJ3JlG17fHMELaH4+veU1ow7zAuNzSI=;
 b=bWwq5MjZAUA+liTEpo5VcSuLmv1595wDqUnnhT9v++Vd053sBq/cz5esMBE64OFv9AVIMoYdZcdgvlfhHY4LOe47nCHzlsdHIY8mgegqOTUfR5b83MDcq+7gBt6Ty2T8GRVV3l+CnSpqQM4Nemo0nJNbfvPoERfZCtFtf1Tv8nmVoBGH5V1qnNa/UA3KJcVNGiFMmsa5VGqfgVklKHug7mtbiRNsYF9GKNlin7NbrfCO4zPoA+JaeE6btX1uL9WjV3TkhQ8/tq7xv0UOqkt1Y8oGGytLJoDqib0mQHg6I9CAx2VeyxnXEFjSrReCmjmgY76nEvHHIfLtHQe0Ib62rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WOQNTpxZrzq5kJ3JlG17fHMELaH4+veU1ow7zAuNzSI=;
 b=OFABWbWf1Z8czjBbTfRN5RMPgzBtEiF9oC3JlxPzlrFJ5GSZrvaL7R65kaK6TaSc+kVd9ozx6vTZQgDjgdLHlsUTlYaqcXOtpfJY6NoFsqT4q1icqyNSLb5LoHK0CforPUoewVxlt8LhrfpYJBxfoEAz4S/kacm6n05Nv07225TRPSJxLPf6yuHZQxm9EJI43ESmTimFBWDabRpXuamizep2AEL8ubnWYmcpXGQrOIR1AwR2YbW6NThqzXx8oOPApwTexL133BlYfQQQROoZUs4Qb6CiK5KVhIz1K6HszOQ07jyiI6JO66IwJBF19pQhnt76WZT5pviRSw4//V7iFw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7110.namprd12.prod.outlook.com (2603:10b6:510:22e::11)
 by SA5PPF9176ED2F1.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8d7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 15:09:12 +0000
Received: from PH8PR12MB7110.namprd12.prod.outlook.com
 ([fe80::736a:e1be:ec64:5740]) by PH8PR12MB7110.namprd12.prod.outlook.com
 ([fe80::736a:e1be:ec64:5740%6]) with mapi id 15.21.0569.011; Wed, 4 Nov 2026
 15:09:12 +0000
Message-ID: <1f7a7e79-1539-4303-9d73-e6195b9e470f@nvidia.com>
Date: Wed, 4 Nov 2026 15:09:06 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 0/2] ASoC: tegra: ASRC ratio control updates
To: Sheetal <sheetal@nvidia.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Thierry Reding <thierry.reding@kernel.org>, Sameer Pujar
 <spujar@nvidia.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mohan Kumar <mkumard@nvidia.com>, linux-sound@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261005085227.2133834-1-sheetal@nvidia.com>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20261005085227.2133834-1-sheetal@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0227.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e9::8) To PH8PR12MB7110.namprd12.prod.outlook.com
 (2603:10b6:510:22e::11)
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
X-MS-TrafficTypeDiagnostic: PH8PR12MB7110:EE_|SA5PPF9176ED2F1:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c1dbd3c-aa64-4eaf-bcaa-08df3a859588
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|10070799003|1800799024|366016|3023799007|6133799003|10067099003|22082099003|18002099003|56012099006|261022105027099003|11063799006|261026140227099003|261028144727099003|261102123227099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	VCRt3bQTruB1FxKM2TaegvLbTIgxdEsgKhxlGo6LS2vfeYfwQ6DusQc+MFAi9Z9OPeijnTvTBeFVD23tIAN8VBZNE/agDJ/WwlFXDaqkh7u+gkfXnEb73NifMLZGN4xUGJpZ4+wugbgGDsfg6wvutAgr7YrGxlXHtXwuUeo7fxFqO8eIEJpbHtMlTsbaEtPtc4Mlrt7SLvOYgPjZfDzZ6iM3hdf5e0IRrnbtXXLiDb2MTiezDctBGkio4l1+d4InRjsnpq6gDR+6sPUsEbjwC6KCOZBIrox2GCBaR/krnQqLfPQwejkV7nEYdqNNG2smfgKXlz67tttfBlK/d6ei1vdIGVZXCLHDe+P8VQ/y20hrQeOu+p6s+wvK9wIDbmSzHy/hwPxonflkBppp3uEcyymIKt24jOASu28FMyKc448PA/eLGeYDNH8vz/W/knjmDsvjnJwG0PBBIJIy4feQLZ5pQqBxQ+i6T+TG+SSoGvC69ICJdO+AWGKtAW7q4fUegtU5IkLvLfyRy16WS2ZlxlCwhs7JBbZ6teJOrDiHMBVmeLSwbIAMB2dwUttGRqIVR9kfqFcJDaD8QSXtmVoE7Qo+E+CPzAM+AnGeWQzzBRggw+x0xS3l9MMbizlZ3pzhqSAA3fNfIQVgEtzGtnEOzmN0X74djnjMNwcwR5P3dIc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7110.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(10070799003)(1800799024)(366016)(3023799007)(6133799003)(10067099003)(22082099003)(18002099003)(56012099006)(261022105027099003)(11063799006)(261026140227099003)(261028144727099003)(261102123227099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?elc0TEJWNVBTQ01rbDVBcERwVThVZUphRmhYa2w2Z1pGNGF6c0FUOWtLaWFB?=
 =?utf-8?B?WWVra2JFbWxLM3B1eWZBNXVPM0tHSWZnOXhmRW1URnJjcTVWY1RoUnBtWUdp?=
 =?utf-8?B?cHdRVE5VVW9kSlhaeHVvMmdqUUVkMFpxZE40Sm1BWWRTd2xST3VkUm1lSGNO?=
 =?utf-8?B?eU9VZzNuYzU5NDA4cVJzWGlkbUhEb1BrNmxrOS9PeStNOEdzZ01LOVIvSzdw?=
 =?utf-8?B?UXgyZHJhNmszNDdCandzMnYvM0JzL2hRQ0QyWFFETDJZOXZkaWtubVArWTJt?=
 =?utf-8?B?UERqUGt4V0MrTnFQMjIxV3RLZ1JDTm9pZ2VhSGZzRXAyVWJKaVlhVkErVlJZ?=
 =?utf-8?B?YlRSV2R4a3hsRkNLZ3c2YWw2dnBZTE1PLzRlc2ljUldGakZSOFZiSVRlOXdD?=
 =?utf-8?B?UXg3c3QwcndUZFo3UlRobWFoeUNZL2RaT2VyWmdJcGRjR0lEWWFQNXJhdWh2?=
 =?utf-8?B?NHIrMG9DUHlQb201YXdIZUs4NlR1clVUS3hDVWplRkVSOUtWUjRLWk1XSEQx?=
 =?utf-8?B?TndnbklmdksxMTFGVGRHYkZIT1NxcXMzZUVYNkwzN3l0c3I3MkZzMjZXazZW?=
 =?utf-8?B?b0docDlFZVJMR1g4anQ3THR5YWZNWmRlSlNnODdjQ0lMYngvRitSZUI3UEFa?=
 =?utf-8?B?RnRPZGp1MGJ2OGxVN2N2OUN5MUpXT25sZDhEOHRQbVpyWkt4YU5zS1ZRSW5D?=
 =?utf-8?B?Zk5CSlhwdnJSMithdFAzTHNYUjEvMnJ1SHdKd1BKZnRremJ6OTJGeUxOWFdm?=
 =?utf-8?B?M3B3VXpJMHBqM0VsVlppbkV3ZlV4aG92WWNZZ3lJNlIxMHB0OFd5RHlZOUJm?=
 =?utf-8?B?QlFiR1BObWVEL0FWZ1ZxRXJpU21nN2lMQWJkUi94ck5nWk11c2R4RURSbnpC?=
 =?utf-8?B?ZXkvaWJXK1N5WXhVdlMzS3FPamp1T0QzUjFVdXdDUWhXMHRhOE81UHRCdkZ2?=
 =?utf-8?B?RFkvQ1FodXJzTkVWSjZkT3ZXOWFRRkhBTFJqYTJNVTNFdTR6blR4WFVNRVlw?=
 =?utf-8?B?eHNlTURYY054N0I1ZTdSZkpOQXVQUnFEaGdNVEtWYWNHN2R6UXRJVVFza0to?=
 =?utf-8?B?Z2l1ck1WaUNsQi9QRnVhWE41NlZvMk9wdE9MUG1sR2pWWG8zYm1iOUIyUW5l?=
 =?utf-8?B?TUN0a2Q2MHB1MTFnOUFNZnozTVBGMVg0YmZlUzVtV05oNENJbXVVTDlEdzhj?=
 =?utf-8?B?aUFVWWkyLys4MlYyUW5QUWdUdlBMU2pKa2RKck9tVFJZUzhSVk9XQ2dWSmls?=
 =?utf-8?B?WDg5SUJZeEZnT1pwLzc4VlRsZ1lGYjFIYjZzK095SkU5WjZOYi9idXlDVGZn?=
 =?utf-8?B?ajV2RGtkc3dXazdHUHFvM2ZXaVR1QmFqaWtIRDJEcFgvVFRQNzBNbVFlTG1X?=
 =?utf-8?B?REV3WWFtTEM2MSt3YXcrQ3pFenM2bE9BSVZ5dzlmTU9NRG1tR2k5dk5uR2RV?=
 =?utf-8?B?OFF3ZHBRVlh5aUd3dy91RGo4OGt4NHJ3SEhUNVowOG1JL1oyNUpNQkh1ZjVj?=
 =?utf-8?B?S2xNTURyQUdHcktYWnRmbFN5RkdnWGZMOVlkYVJvMnJKZDQ0WU4wdDRtYndo?=
 =?utf-8?B?eWI5SGduQVZMZEtSQWRLN0NVU1ZqcEQ4K0E5STRuelMyQVNVYmMwUU9mem9v?=
 =?utf-8?B?ZUk0M1dSV05xbXhKazUrdWZzQ3ZYUUhqekNwdHVXUEVnZmtSRnBYVlRIVFhy?=
 =?utf-8?B?OVd3N28zZzJGUmViL1pHWFEzeGlpV1NQK0FZbkxCZFZUTStrKzYvc1F1cjcr?=
 =?utf-8?B?TVZQTUQ1OGxyVlloNDVvRnQwQUpjeXVTZklCeHJhdklxSzRuZldsQkdRS1Bq?=
 =?utf-8?B?OUJ3T3VOZ3NKekt5Um1ORTV3WmJ5NG43TTV3MjFCTXlnWEVLaGtwV0NLOW5E?=
 =?utf-8?B?YW1Jeklqc09KNnJsdkE2ZXdiVmpuZXZiR1VBQ3FIOSswUEVBL3BhSDF5NnNq?=
 =?utf-8?B?a0EzOTR1VWdheUkxbU54U2FuTjJKa2pSU3dCMThzU2k1U2FFeEQrTy80QnBy?=
 =?utf-8?B?VDFDTEkvbnJCSm5GRTBkUlNNQWNhcGZmd2FxS2VZWGkzM0lSRE12bkk3b214?=
 =?utf-8?B?NzVkQXZPM0Z2UTA1eXpEWlBFdGtWUy9MRDRUY3hWUUlzNzJQSmdkMm9xVkdV?=
 =?utf-8?B?RTZ6VERpTS9JWVZqWmg5WmRzYUp0aVhRTXFEUFJnZjBGME1tdjQyZE5pZmlq?=
 =?utf-8?B?cncwbWhFUzZaOGEwQ1hpNm5FeDVvNDdZZlk4SnQzNHlRdlNuY2wxTCthalEy?=
 =?utf-8?B?ZXg5UlNFaHV6aFVkTWFXR2l2eXlxTDZvSmpYUnFBOFZIZUZxTHZNV0pqYjNC?=
 =?utf-8?B?ZSt2NkZhNjJZSXhxQmZOa3JJRDNtVmluUHpJT2dCbXRHZzRzanV4eHUyMWpm?=
 =?utf-8?Q?yIbERfrc012Ue4O/m5U8gQpCkTF+F3hKkKpe2fEGowHaM?=
X-MS-Exchange-AntiSpam-MessageData-1: kcms+izg/4PfyA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c1dbd3c-aa64-4eaf-bcaa-08df3a859588
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7110.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 15:09:12.5096
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rEpT4g9YSv13wfJ+0uDYC5QdhJCUNgyPWCIi53QjKcPRhNalH/fmwo5mNlcI9DcQqvaCsI0uIdkBQIJxuLubmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF9176ED2F1


On 05/10/2026 09:52, Sheetal wrote:
> This RFC updates the Tegra ASRC software ratio controls so userspace
> programs the integer and fractional ratio parts through one paired ALSA
> mixer control.
> 
> This is a userspace-visible ALSA mixer control ABI change. Existing
> userspace that programs the ratio with separate controls must switch from
> the legacy commands:
> 
>   amixer -c APE cset name="ASRC1 Ratio<N> Integer Part" \
>     <integer part>
>   amixer -c APE cset name="ASRC1 Ratio<N> Fractional Part" \
>     <fractional part>
> 
> to the paired control:
> 
>   amixer -c APE cset name="ASRC1 Ratio<N>" \
>     "<integer part>,<fractional part>"
> 
> For example:
> 
>   amixer -c APE cset name="ASRC1 Ratio1" "0,715827882"
> 
> The ABI change is needed because the previous separate controls can expose
> hardware to a transient mixed ratio when one part has been updated but the
> other still contains the old value. The paired control lets the driver
> validate and program the full ratio together.
> 
> For active streams, the driver only unlocks and re-locks the stream when
> the new software ratio differs from the cached ratio by more than 20%.
> Hardware allows direct updates for smaller ratio changes, while larger
> jumps require the stream lock to be refreshed.

This still applies fine on -next and I am fine with the above ABI
change. With that, for the series ...

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Thanks!
Jon

-- 
nvpublic

