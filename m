Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010043.outbound.protection.outlook.com [52.101.61.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1AA13AF2;
	Sat, 25 Apr 2026 08:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777105912; cv=fail; b=SFBJQoxnGIuwF2mqOIjUmZRseX6rwLMdm07fn0jIXpQh/iCxI5uHNSadlj5R/+a66ovb9IPEw22mhVNTGbpjqrbhXzVsVc4C+rSXP68f0g5RvZBZpjouVhe/WR28UA8avhmtLPxX9DP9v0HJaVkzDYx7dDklFCga7+GYxl3JlaU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777105912; c=relaxed/simple;
	bh=vkRgg4GxiEYTbX9+eHrat/iToFwBQ4HPKDbL19/BPEk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WiVYM7ALxRCqcu8LNeGw3JBwcWPTYKXhFoQpj6ts5X1DsgHO0xHX/a9sOujRdW4T+HbaAuF854GBNPzFkuJBjpTeoVqgwoBZCRoHa4acY6if51P/Vpmwa4Pvb8CJ5sq+5KgQ2zA8hD0n6aZjFIQaEHpJdAgoseIO4/sPSnEeaYw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=U8oVnKAk; arc=fail smtp.client-ip=52.101.61.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="U8oVnKAk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IrjEqcifxmosepcBdCRdsCLn+qIHO+W8Bp+wvI5VyEaY9pF3ZWVDYKbUcfkRjAtsJJI2YK1vF8eByWfMpd/eQv3hk4UrTSBNz47QmGd4RpbaIfzore29CSkgyHmRKn3Pqx/k8GW5tXKa0AxD2oDuCF+SH94IWXvoS8QcVWcX73ZzIRqoGzwZXLl8NiWMCqJRNLnNH76luFY1DK2gywwaeI7rqUSiOX4DnqpNOldPweFNVwJWIhs3P875K9sRUS5tntZjAfi35gPmnchNTbnduAPYjtw/qsygutJ+WjHxZ7jPHqabQ1d+QQGMks+KPW3bnSPVgN7UrAEqxtU1Vdw29g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YBdMTZTci65vxo8CxD4DguxnUm8WzA6BDoUumquBCsE=;
 b=IxhnOK4C8ysAUvYHwCoT6kUIPZvfBpK6SuX1t+K4zwjbnukitNDEcWvpE05ZG+DkPaXDOMfQDZZIYRSNpx7SGcHQVbLsIA7MH+ONIgq3NBSleftm28ICg/0O/xSd5vcbVtjxnMp8zmhd/DPQBFDlszdKPVWq+i2xclHVelwJ46wdUzZ7nhdzHzGp68rHk/IwYquHwuXOVPTf2KwPNwmJPG8UAsnwyScMHslrbbkfFo6WANblHqwXpfKIUGs+zgLvZn0fwcEdOIbtero6Q+Vgkbz5/kIM/TuHz8iSdh7BVhTs3DE5SjOLYG0ljcoQ+R2akP/b8VHE/izRhig/cOY3bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YBdMTZTci65vxo8CxD4DguxnUm8WzA6BDoUumquBCsE=;
 b=U8oVnKAkCvR614+JRNqy6WOBqlwfYzcLS0aUDWDW3GzWkvA0H78OqspFA3iX2KkRbn1mYqa4J71IN7OSangGzC0dobtAOFbsL7W9XDb+2BnJa9kH6BxCQmqIh2FSDh2mol8pLMiHqaaPOMiYibyOoLgsJj9WFZvrxuM1eFXPjYtX9ZgrCdTBkPs059WOCKMcwDUpUStu8iMfu7eqS9Qw7Vep06an8h/AkQ+Pizu33dahiITg6IbMnPoP9S6FbkCe1Fhz4yay6XmoN23VpHlKQdyY8Adq5PQjxvrNZTdATh1YISx3f6iGs2VtGp/wUzigni0IHX425HssCmI1sJT3pw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by SA1PR12MB6948.namprd12.prod.outlook.com (2603:10b6:806:24f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.12; Sat, 25 Apr
 2026 08:31:46 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%6]) with mapi id 15.20.9870.012; Sat, 25 Apr 2026
 08:31:46 +0000
Message-ID: <366aaf18-7424-4cb5-9df2-142c9988303c@nvidia.com>
Date: Sat, 25 Apr 2026 09:31:42 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: tegra: ADX: simplify probe allocation
To: Rosen Penev <rosenp@gmail.com>, linux-sound@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Thierry Reding <thierry.reding@kernel.org>,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260425014244.439788-1-rosenp@gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20260425014244.439788-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0547.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:319::16) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|SA1PR12MB6948:EE_
X-MS-Office365-Filtering-Correlation-Id: 479d86e5-cf94-4a75-1d85-08dea2a51641
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|1800799024|376014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	4S9307fWvq3JEyy8wcruq04rQuiRC2+Yh1D6k4IbVGy9jb8pgAt09Gjr1mi3wwclzLqaYu7tKdE76TtFtFZAtsuBND30nXP9TnbyoAdxI//o8Ii28hI8JT7IgrdcXGfSKHryP99pgojJMiyp68k9dCRbxaJdzhdtAyMyYT1zcAKWLEpOOcKDWtSssH8Osv/pM+H6POKYaP1aQB4SOCy58KN5T0dUNUl0RK6F0eUgGQzzIt390nYUtbjqR4t1M5w/XnKIocZpjsOsmqwd7wcoycdjrLCdbXsQWxTq7DZ1AKr3/Jhhw9aoCOayPMT1/3Got9NZUcXd4rltGYYLBey+LnbjoLmNHsffhaYbyvXm7awjJ7CAX23HhJg0UrEc7kRiLfx7FJaRbXpjMoBPjrauSkgo6vRI5KdLigLZfJ2PJCTRdyGV/R7FwHJIUB1lkqvqfUWSQVfjdPEiGh2H6l8Q/CAY0kMokm2/wNKbGbwVIZBRflDazXyI/8mwMyZr8PEfNTjaJkwUQir1xNC1T9yiW+6BZ/cN6FOiSGrMPCD7u+b2LME+gosf6zTeLFgt7E9Qs8qe3ZfEXrM4fHbjyOD2ht4CqZA28YNGQrFIiddQVcyXntpNupKwCdSjZhO7jHja98J8IhNbicKhD7cHTd5R1T89yEDPDF9YL0J9jo+UsyDntErA4teK+U/kjN3qHbia3lvu8L9soLb9HDi0lYG25NwXzqwocOHndrGvMJPJk88=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TXk4VXZMTVNoTVF1NlcvdkZGVEsrTVVvemxMalZGeGxuL0RMeUhtNk5xT3Qz?=
 =?utf-8?B?MGNSZ3hnL3doSVJIYmNrVHRNR1NxVkhHeHo0c3g2Nkp4RUlMM0hvZmsrWUdy?=
 =?utf-8?B?dmMwb3dDWDIwZ3l0SEhES0k2bkJKNENHeEFZNTNnV3ZDN2VOZjRBZ2VtNlVS?=
 =?utf-8?B?M09Zb1hmcUVQRThvcGZxbktGSFFDRmpuNVZ5bytYK1VXRlJRUkZLS3dhYXZB?=
 =?utf-8?B?K243WDk4VHlHcFcxaGd2b2d4Q1lDbmhvcDJWNzNoRklydW53amZ4SDNkSHNC?=
 =?utf-8?B?d1RUazZvNU1mbll4RndnUktOMnFadFVVS3FIUHhOWlRnRUt1eWZpaHpvTXdK?=
 =?utf-8?B?ZUZtV3RmMjNvV1JsTk96TGpOcHEvNVZnMjI0WnMwZENhbVhZU0x3OU4xKzhF?=
 =?utf-8?B?TWpSZm9OVVFkWloyU0lOOWJCTHVCbDYxYVZ4RnBoWVBxNFRXUnZqY1c5REw2?=
 =?utf-8?B?RU5CZHlGYVZha2dJWFA4NnI4RVFlSHdFT05ZOHczd1ZqMmhPeEp5U1RuSk9O?=
 =?utf-8?B?alc5bTN1emxHWlgxSWNDMkJBT0dTdzVlL0dxRVBHNDFEeVJFaHZJd29NS1VB?=
 =?utf-8?B?a1E2YndDVzVtMTdyQ295OUhFZEVFdVRIeVhvaHVCajh5QXRRVFpvYjdlNTYx?=
 =?utf-8?B?NGx6bm9WY0ZHQ05nUVMrdzN6ZFNuQ0d5d1dheUhhc3FUbVVkSzdzZWM0emJh?=
 =?utf-8?B?U0pkc3BIOTFjR01YMUJRMmhYempvYXdSaDgyZWZNV0JCR25JeHRSaE5zVjRk?=
 =?utf-8?B?N2ZvaDgvN2dRYUNaN2dPN2MrRm15UlFLaSttS1N1MFJmblh2UzlmMXhyb2tC?=
 =?utf-8?B?MHJNSStET0hYZ0pOQU12WVNwRHJBZE5YK08rZGtKWGxKRlFwelQ2Y3Vxa2Jx?=
 =?utf-8?B?eXVUWlBKNE12Skw5T1JyKytzQUFBTUJ0dXRDb09qWkdqZEg0eWlYd1hQcG8x?=
 =?utf-8?B?NjVZbXcwcWl6OExHQVdBVXdURXVTcXpWYm1oRXdZb2h4K3BvQndQQzIxMjVX?=
 =?utf-8?B?V1YvcDlKb3MyM0xOWnVmRHRZMlRZQ1JpVG5udnphZXBkNWVSSmptQ05SK0o2?=
 =?utf-8?B?bnlvQk5zZVhBTnhuTUI2MGF1L2tLMXl4YXdybmttUmpnOFlYRXV3V2dHZEsy?=
 =?utf-8?B?LzRkZDNhTEdvbVk1R01sWENrdDYrQXBwWldYa0I4dk9TVXExMGNSYTJ3RzZp?=
 =?utf-8?B?TG1zbit1Rm1RMjZSdmQrdmw4ZUFwOWpDZUtrQzVWNXRndVZrQ3pCSEtPdVdC?=
 =?utf-8?B?YnREVXNhRTlsYXRVU0J6S1hmUzhGQjJqYXdkZ2lFd3ZyaTczTHhWbXNMc1VR?=
 =?utf-8?B?aGVHTFdkalQrLzNwQzUyaHIyR1VXM3FoVFMrdjVGYmlKUXg3V01BaVZ5ODU4?=
 =?utf-8?B?ZU0wK1huN0NkY1dWczZhZkRiS3lUNDBWQTNUZm1SS3E5c0RKMUFtT2YzU0s2?=
 =?utf-8?B?RmxyM0dQSm5HdjNDZTJCcVlxNTdsdklsM0E0RGNXQ3daN3JMRHRSelhWVTNn?=
 =?utf-8?B?MHZQTUZ5YnZaeE9oQWd5dHNKNkNaSTNiWnpOMDUyeHZvYUZ3eHZaWVQvTzVW?=
 =?utf-8?B?SWs0T3F3WURmOVA4cW9XSEZvL1oyMW9aQS9TNEZ4VW05ZURmKzdCVVZTN1pW?=
 =?utf-8?B?L2xwREN6cytwT0hvZXgyVU1DMDZnS2EyUFdnZERwVUJsNEhYa0NVdGN4VzEv?=
 =?utf-8?B?cDBpTVBDQ0lMRlVlU29qUFlDMnk5cmM3UjFoN2RTSkZVdU11SDVGbGpmaUY1?=
 =?utf-8?B?Y3BkMWRmTVlWcUM4endNMGxIYXNvWDZBWEhqTkt6MGV3NGxueG5OaDFRNThX?=
 =?utf-8?B?TWgwRFhUcjNrZnV5Wmk0UmxDZ2JLWXdBSWRBeExDUWZidDM1eE02VE1KbE8y?=
 =?utf-8?B?UE05Wi9WdGxJbEU3UmJDT29TV216TDlCaVFQSE85VFRESEp6QUsxaWFEUkNF?=
 =?utf-8?B?eGJJUlduZEVRZStjSFdVRURiZmVpMGw1dld6SmtHQTZmTW52WGtPWldHYy9V?=
 =?utf-8?B?YTRDK1FqQ0RGRldscDBIWU1MNStJbHNHcXJHK21ucHlJckJoZHgwNkQwRXZE?=
 =?utf-8?B?dUhqZ2xmSHdiMTV0c2xhRi9KRmcwOEJCQW9IcTNUek5Xamw5N1cyT3NoUnB3?=
 =?utf-8?B?TkdmQkNPTDIwd2NnRWMyN09YNG1QVngrd1pEMm4reUNtQXQvWFQvaFlWMTRB?=
 =?utf-8?B?ZnEyK0ozYkN6ejJiVmVGV1o4OHA0YmlaK09CNFN6M0pvRUxXcW9kWGt5dGgw?=
 =?utf-8?B?MGswVDFvRlJmRVp1OXpsbzhmUDl2ZmJWOE1NVi94ZWZZVlVGelFEUVN4NnBZ?=
 =?utf-8?B?SE03L1BvbkNZWDE0RHk2YUxsQXk2cUp6WXBPaC9hcC9Dd1pQeFdza2doeXdu?=
 =?utf-8?Q?q7CJm2vNOrITptcMHbPNPJIoYgT9o9vHT189SvqiogWGd?=
X-MS-Exchange-AntiSpam-MessageData-1: lL9Ob7z2k+D3qA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 479d86e5-cf94-4a75-1d85-08dea2a51641
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2026 08:31:46.2764
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +k6qVoGejqBBkJPOjcSuRUwGag+Ank/I7WDGU2qud/XZ+35NrSSFZYOSYkiOugFtK5fuIneypikhDvkEojDeDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6948


On 25/04/2026 02:42, Rosen Penev wrote:
> Reduce 3 allocations to one using a flexible array member.
> 
> Also use of_device_get_match_data. No error checking since it cannot be
> NULL.

Sounds like that should be a separate patch. A patch should do one thing.

Jon

-- 
nvpublic

