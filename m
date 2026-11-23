Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.62.59
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795467621;
	b=Xwv1DG+WvWg29nx6ReobnHA8YD6tsjLadTzgnWJO8UdBxsRuMFyHzh+GsO1xDCriJ3BC
	 99xQtrrxo0dNrkd8qhGn3egDpVFLT+EIgCqeY/WhqdCiwZlRwMuVsRvSXrAiNRx1XUBbl
	 CojbAwzIErocm069Eycix3BWpiivRzTMFKMEIyP7GpFahcLh1W2Qc1u9Sa6rR371Uc+4X
	 Arf4yj/qF4akhD/eHMcTfoM4gMmzsbiAOzJwfXwutSzTge9I0vh5farcyvdCYqO37b1Iv
	 neYHfkQ0ditK8EKDu4LLuMuO/KKY/52mX5OP9CTYxlb/FRMQP5S+3TIR6kfer4biOkg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467621;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
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
	bh=js43qY5A9HaCWQC3htlypT4GJ6KUhGFxVkr6tnfy2dY=;
	b=syqJO1a5G+df8pgFcDx4PVyQGEgjUgnmqYS7YY1LIcdSxu708NwCLzi2/mLutcCUotxq
	 vXKDP0MXpRjxVYGR3JNBbQjWdJmseTc9WnOpjNi9pcBY4M7IVO0BGZoXiKSNYj5zuPDES
	 ZP69iE6rAtzjugAt8aFVKEm4oBIOJcHkCM8PmUqVDzCG7USgl7/peyDtST8aw/jPNVwqX
	 Z+8Ug9dgS/nZ/99Y9BJMVTiBhgTLW4hiPRTqYVg2GL2J4TcIIfQswEd1sRJQ26t8IBRB4
	 yCMoSPH8wVM4A3ymcvvbZzN3RPLcc2WHob+/SGTSB8nhdpb48yfp09FX+khQgPfEUsg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=QgU+mBWR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.62.59
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011059.outbound.protection.outlook.com [52.101.62.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AFF0606A32E;
	Mon, 23 Nov 2026 21:00:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AFF0606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=QgU+mBWR
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p+MeuTfhQjriTPtY3nnz+bosVh/+jYOIPItyCT1R16aXqWSe9UMoycpM7KleNQcGqQuHq+Vy3swYIEg6/9ly00DDiZPz0seyHVO7h3zMQs1vm0Z8zz8psrcfJLSDznevTXBTLwK7X5wDKEv47tpjdys+YMAlwzBGsEmoYWrKZxhYvf8sDWaVBMlOH/diGFWLillOIRATYQred7zaxhs1lwioXoJ0UWn9TwYBIS7Jpf+9dKxmFkUc4U+CLuk175hN5N6x2+X38/h4595iYb8Esgx6OcW9uqI6HTgatBo9QTYxwaozvr1fjsTzP+L1xMUumbX9oJ7ELy65mf95iqDjNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=js43qY5A9HaCWQC3htlypT4GJ6KUhGFxVkr6tnfy2dY=;
 b=rROTNjZapXBGqF9px6o5oGxM23rRU3rfYI5ydkw20T/3VajVpCV8/hhnpvD5WudhKyNx2e2D5RzholG4WhTeWa9QeK3gN3LeHcKiYainMr+hw6hV/CvkYbgTcm4MSmxSPGHzOUgKBiGDEnQy8OhF2ZAXKNK7jqc5VHYtnYr9xN3mUQxVoUXY7JciOgM8lAZZwm8xGKo0f7499kCc8zIvo0QNWigqoW8FoHds0NeKXH7jDvjNqQmAI8Pr27GabriYzAFrRs3Vh9PHYhs8MtmuJV1JQsWbIe5VmXAFIlDD4fitxXBNYrjVxyg89BF2BSnXMnIfFvU5b4tYXsYlJC7x1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=js43qY5A9HaCWQC3htlypT4GJ6KUhGFxVkr6tnfy2dY=;
 b=QgU+mBWRC0e15TnXxmely/69aSrrWZSA2KiTqePF1FBBstbU1/umZQaFnI9STy1t2raKgfDnNLwrOyc5rB9AHqAOFTATdRDM6k7tMSmjM3BxCzu+X0esd05+dadsTKtjR7Yl1TP7cSIH9uh82ms+2OihuOKQZufPp0x/JS2IHr7vf1YEXcM6EPfgmTUyTYeDXqaJsQ4975Cq5WEsnd89IAWmwdYHDEDul1JFovvXg0akd8ucN2WdanXPuIwF3Q9sea+FjUs7CdtNw5EhJ4Ake9m++SCYHllMTOHQNXQeFa/bcUjIIon5XlIWYyemorjejVvMRZmqH1RHqI1kokebUQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7110.namprd12.prod.outlook.com (2603:10b6:510:22e::11)
 by CY8PR12MB7681.namprd12.prod.outlook.com (2603:10b6:930:84::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Mon, 23 Nov
 2026 20:58:13 +0000
Received: from PH8PR12MB7110.namprd12.prod.outlook.com
 ([fe80::736a:e1be:ec64:5740]) by PH8PR12MB7110.namprd12.prod.outlook.com
 ([fe80::736a:e1be:ec64:5740%6]) with mapi id 15.21.0639.011; Mon, 23 Nov 2026
 20:58:11 +0000
Message-ID: <b484ae38-67e1-4ea3-9564-c028cccef232@nvidia.com>
Date: Mon, 23 Nov 2026 20:58:05 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/12] dt-bindings: usb: Add Tegra238 XUSB host
 controller support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@kernel.org>,
 Nagarjuna Kristam <nkristam@nvidia.com>, JC Kuo <jckuo@nvidia.com>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 Thierry Reding <treding@nvidia.com>, Wayne Chang <waynec@nvidia.com>
References: <20261116-tegra-usb-v2-0-42efc03a9700@nvidia.com>
 <20261116-tegra-usb-v2-2-42efc03a9700@nvidia.com>
 <20261123-sassy-fragrant-markhor-c6fbb3@quoll>
 <20261123-versatile-alpaca-of-greatness-dd6694@quoll>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20261123-versatile-alpaca-of-greatness-dd6694@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P195CA0017.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d6::8) To PH8PR12MB7110.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PH8PR12MB7110:EE_|CY8PR12MB7681:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ee874a8-bc73-40be-6cf6-08df49a47c2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|10070799003|23010399003|22082099003|18002099003|11063799006|56012099006|4143699003|261028144727099003|261022105027099003|261026140227099003|261026121527099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	PhVpCAuGFddF1YsXrmE4Vn4IN1eb4WjmsWltTGMauUk7yQWYjcEcLsXaWWVRWsE7qd9FdSHk67Nx752yFEqf0XzE228P+Pevbk1QLojIWL/SAC2yOjFTkmtMhHgYBczNgwvAj3B/CEhS/Ej9ik+coCfyhfNXLjU/6Dea7Rlw3+7fzmqpt9CEL/eQhbTsyFQxKts6FGg7Oh2jzw1g0NKiQ24fbWLo/7dRXxpQukoNmDXqCUh1yFOubMFMwU2n6RbmFjZt7UK0uPFLXkPoLdVf7EE9rhlOW3Ga5zLMJ+tG5gLpQKExfKVIGjTnWwf9chgZPTOw2z7zLN0dgrXn/SuqNPKaUHBqs3J8tZCm/2YNUnrDY9rPpA05c7BxA2eSaUV6QHy8UnZ2CzXS4M3tEKrdhT0mIOJ+XLEgNuNkBWj0VAAY0niyL3pEItB6k6dHcG1x2ElMoBaQf+UCkzASlcaZsNcZpXvaRh3vkV/N1etkL5Xmz9X6PIXE4Oyi/4gb11EJ0MQ3+wNCkODOn0qMhv34xv0pmnKVikkYnKVnBjCrA+onnQbpJ8KlI1Zd/5ZDAzFeWUA7iQJW3lircC7aW+bIw8n609ZAYXAe8TyHdx7dUfu5O7BiPDPClHUDxK5KLNUWfAdzXv5WOGTPHEomFRU+uq0wlEFUFMGyZsmbCYAgE9A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7110.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(10070799003)(23010399003)(22082099003)(18002099003)(11063799006)(56012099006)(4143699003)(261028144727099003)(261022105027099003)(261026140227099003)(261026121527099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a21IbG44TGRmaUdvWHVwSitETTY2WHFPdVhOK2xIYlhxM0RySkpBalA5UkNM?=
 =?utf-8?B?RFZsU3BkcWhpeUt2bDU1c0pmSUZVbHpsaW56eHJTeEIwMDVaOGJmNUlFM2dP?=
 =?utf-8?B?NkpwbHpnQ29kTWRTcCtxY0VkQlBXKyt6VWhFNU1IeHNzcVVQMXpWbHBuK3dK?=
 =?utf-8?B?MFV5R3hnVW4wOUFrdC9ydUt5ZHVObWEyVm9BRWxGbkZDKzdTRnUrUldvVVMw?=
 =?utf-8?B?S01Zd2g2N09qVXMwSmorREhZeTZrbGo4S0VWVmVXNXNNNWdrTGZQQlM0bEQy?=
 =?utf-8?B?ak51YzJZenFXSW04aWlWQ1hqWDJmaytDWjVLTlQ0aUJNYnYraXRkNjJKS0tO?=
 =?utf-8?B?Q1FENHQyTkd0RDFuVC9Fd0NmNTVpUTJsTFdtUlNaM0pEOTB3UXczb285K2NB?=
 =?utf-8?B?SkljTU1WZG03azNpcDF4Ui8wZU44RHkyc3A2WGcxeXJIcmVPZStuWjlRQWtl?=
 =?utf-8?B?eEY2dEhLY1hQVU8zd1kxTVZ6WVZIT1hTd0lqTWVNSmptdy9INVFCa2RNSnor?=
 =?utf-8?B?TzFhQTlVSnlNZUpWaFl2NHNPc0NYKzk3am1Ub0xYV21OZkJxS3RpNENMWVdZ?=
 =?utf-8?B?dHJqQ1FFWVFqQzZFTk1ibkpUM3h1eWZLU1ZuMjZtRjFLeGdCTEgyYlJKaWZv?=
 =?utf-8?B?U2htcGJONE5BdWwyd0lxMjN0ZlZkOEloYkhIQWQ0RzA4anJRaE9LYkNOaTFh?=
 =?utf-8?B?WFlycGhweUh3b20wem9sb3lXZzJVL2w0SGcxeENXcy90QWFQMlZlc1NndXNQ?=
 =?utf-8?B?RjAyZ21KcUh4ckJQL2ZwRm1RWkV2anlrNExiK1lUekpoclcrOVV2VUJRc1o3?=
 =?utf-8?B?dnkvc1U4UG1jdmp3c2F5VW0rT29ia2JmVU5lVHk0bzg5eGRNaDRic2kwc0pF?=
 =?utf-8?B?RzlOYlBCa1pWM1IvdDhPL3JYR1M1ODF4VjVwdk1HazBlQ1owSTlXbEZXN2tL?=
 =?utf-8?B?S3dmbmxrMmNaZFBMYVpDMWZ1NUNhNDhwdjJ4ZXVidmlPQ3M4UW1DbDlvT0pV?=
 =?utf-8?B?bFdrSW5RTklaZG5QZ0k0ZWZOYURBMEJBTkR6M1VQYnR3TEZsU1Vlc3JITTdu?=
 =?utf-8?B?R3hMKzhaN1VjeTlyanE2bmdwczlNOTBaRWErYzd0WXJySXBFckIzdGw5eUxV?=
 =?utf-8?B?Vzk4Y3VWUGlCNmpTc0F6aVpPSUJwc1J0QUU0ZkNxU2k4QU9YQk1jWkE5SWdU?=
 =?utf-8?B?ZHM5WFY4ZFk4VXFHTmlFdGhsbzBua2RIODlRMlFuWTVqemRqbEgxTDdldHhE?=
 =?utf-8?B?c1ZWK2pwb1BSRWl0ZnlDMlhWaWowanZmUE1QWEM3U1g2U2JxZERXd3c3MmVi?=
 =?utf-8?B?aUhFWEk1RjB5T1M5VVBvSE8zVGxFWFZTbGd1eU9NQ3Q5YmlWRWgzbzdPRnR3?=
 =?utf-8?B?UmZaRDZWRWhyWkk1Y3JNYmJIaDVLcW5EUngvbmg1Y3o0TFZ3ME84M2d5aVhR?=
 =?utf-8?B?eUR1eEt5M0x6d2dQUm5IVGN0eXUyV0pPR2Y0bU9CdTAwaVUrWXdlditLL05S?=
 =?utf-8?B?Ylo0aGZVQjA5Y3ZHYzVjb0NCbzM1MTNPQ0FUUW14amx4MEtLMjFma3lFMXRU?=
 =?utf-8?B?RHpFaS9XVmlXdURUWEdZTER2V0txZHUra1o3blYyRHdEd2hreTNZTzJocjZl?=
 =?utf-8?B?ZjZrNkpvNDh6NGc3blBIcG5aem40WmsvOGlOZDBMQ1ZKWkZqUkpMQmxLN1c5?=
 =?utf-8?B?WDRwZGViMWZIcXNhL3JVei9GMitINE9JR21wYndkSmpvODRNOGpRNU93bDMz?=
 =?utf-8?B?V0xUMDRYQ2wxSXZFb3l1M0hYTTk1WEM2SzE5bklWNU1rVTBQVkg1Q3dSSFpJ?=
 =?utf-8?B?czBnaUxic2I1VEg0KzZHeHluSUN0bFpidXBwcWVzcmRkUEUrZkFxTkZNeXhR?=
 =?utf-8?B?TEdmbFF1MHgwQktwalEybG9reEZGZE52Y2RQNnZYeENTNGxOcVFXeE5YOHFx?=
 =?utf-8?B?ajI5WUYrR243YUVtNndJWkE2ZDlWQ0UyenJWcjVXbGhoZTFodS9wdUkzTUVq?=
 =?utf-8?B?a3daQ29uOVdVSFAvQ21qdEVUT1drNkMrdDRzODhBTWRXa1lpVXNsMVJhK0hJ?=
 =?utf-8?B?anFsMTd6b3VTbVExdHN5MnlaRk50ZWN1TmVsbFBTMGp5eC9mYmEzUnNpKzhV?=
 =?utf-8?B?d3c3YnZUeCt3ZENLK09uWEU3bnNFWEFNZjZON0d3QXIrMFB6S0NWMWM5ZXIv?=
 =?utf-8?B?N2lWMEJzNE5Hb3FUQS94cjdvUnkrWXhBM2hyVUJxeWVsV0dWZE5ZK00xekNT?=
 =?utf-8?B?TlRkVHJjMkIzYTB5M2E1UDdvd0kvM1BnekUrUXA1U0VGWFN3VlprbEhOSjlN?=
 =?utf-8?B?dVlDRTA1aFB6SGc4MWtwZ3l4Z3h4VjRZanZ4SEJZVEt3NERmV0NoR1U0VzFT?=
 =?utf-8?Q?ALVHzIuUDAF+lD1xxuxB/FdIDndDodmykmTvhSU8Rd1di?=
X-MS-Exchange-AntiSpam-MessageData-1: z3kVZqXJQZJIJw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ee874a8-bc73-40be-6cf6-08df49a47c2a
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7110.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 20:58:11.8312
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZzJKLsK6hMoA2+aEVt6vb/Gm5EoPc1IsbmY0EwrP3Z7ZczC3LLOzSDezBUppc5QawL8NuloK5erHIi91gUT1Jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7681


On 23/11/2026 11:47, Krzysztof Kozlowski wrote:
> On Mon, Nov 23, 2026 at 12:44:00PM +0100, Krzysztof Kozlowski wrote:
>>> +      properties:
>>> +        interrupts:
>>> +          maxItems: 8
>>> +        iommus:
>>> +          maxItems: 1
>>> +        power-domains: false
>>> +        power-domain-names: false
>>> +        phys:
>>> +          maxItems: 6
>>> +        phy-names:
>>> +          maxItems: 6
>>> +          items:
>>> +            enum:
>>> +              - usb2-0
>>> +              - usb2-1
>>> +              - usb2-2
>>> +              - usb3-0
>>> +              - usb3-1
>>> +              - usb3-2
>>
>> This should be rather fixed for this device, so without enum, just:
>> items:
>>   - const: ...
>>   - const: ...
>>   ....
>>
> 
> Although I see now we talked about this - this supports *up to 6* phys,
> so the list is not fixed per given IP block instance?
Yes that's correct.

Jon

-- 
nvpublic

