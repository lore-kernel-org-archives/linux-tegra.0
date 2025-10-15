Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010001.outbound.protection.outlook.com [52.101.85.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C4F26980B;
	Wed, 15 Oct 2025 16:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760546314; cv=fail; b=hUOgx/9lv5aZzuqa387lcw2LVN/PdegFmniCGxrph47H2hCrJgi0uNw3XBHA+UkFDv1Ys5O4ATdFBMxEpufo2VnEcxil1OVggb29MPTAB0jjy/9IYCGIHmhzSXoRxJnOPfvND7D0bQcJunyZi9Q7zx5tovZdIMYBVeM7GzA4obo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760546314; c=relaxed/simple;
	bh=NjGcfNy9Mc8tVo2tnVy6v1nAnuWlHn2MJDRR2hH9uVE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rPKxa4iHqjYwe7P4TIgG/0rFldykT2cRtPGkdY5stc3IUD3w9yR/I9PLtOONnCO7sJ28vl3vC2DKiAudIcfOv2pui4hnO9hvypxEvF5KCGu0hJqpZFjtJ1wNiZsdCchM5HL2ZdaMHxpQfz4P3n2IRMK1edkXOQ4x/9wmqprzff4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rXGgtxwg; arc=fail smtp.client-ip=52.101.85.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rXGgtxwg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KLwp6U5ehnzDI/VGoRkB6cw1JZq/F4yBPmvoTwqfOPoBmmAffwOfJ3iLz6fHYTB20D8rmG5RTfmPvO9ufhWKYMvkLxJKaQHzvkM9QA1jOEi8sG2l4B7dsCBwznN2nuwSn+AX3ElE8Geg8Tf7azOeKqBvXmsAtISpayj02bOSpFCR8L92ueByh4krFx3C3Y8wJ20L+Oa3tzQDWBuyex9/I1+hcprfPBjx27OZoq7uX8aCbAq9YwYdRC61hSk4CB//uWOPP5OoVxLCBfdcFuGD3bistUNxZIx6j3OcCGtFtEz2OTTVPrhzM6acq6EeCdGc9FGZzJiTpPOAxZdnp1fyFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oKSPL/s24euxW76Ve7ioepoMa2E6n5SC4+CgQc5el7Q=;
 b=BKLqL+wy4K6uSv1t7ZUZCkGA+hXS+PhI8DawDeKCXDzaA/rH3hJ5zH6B8vxKGofpzcypBwp2MxFxNRyyystYHBLPkdsaEsmAAa6AiAWdFwTpM9Tslgp+0nvEy3l4eHRz3HxXrgyC0gUrbr2sFdw+m8bP7b8x2XLGYeGuLfoSWj3jxAWm04ph6HWdKJQvNSvfxWeVo8y0MrVlKmqbJTtRb1Zc5IupCZukXf+kwRo5/PM44sZx9wrZiLP+DeYUKummnq8SdO1PMn1uPyIQIIF+lFI56w0scO5CEr/4MErwMeQjnYS6eETSi5Qtmj+ooL8gqAHugTzJiIGChtBzXHM1WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oKSPL/s24euxW76Ve7ioepoMa2E6n5SC4+CgQc5el7Q=;
 b=rXGgtxwg9cgIYwaXHKY5Cp9jpKjIycpbylJhp3MHbk7Za5Nztt0P/sCVHs1J62Fmg2afkMpZQxVwIK5ZfEtT7wh/4Yc84R6H+wapbJWNKCIDlzEKOCOuCG17XmnXBuJ1MDKV5ChssHZj1vQMoVOzW8t500nPn9qw58up5hesMvP+eK+QBvEki1Vl4ObB630jJkR3XU35REiWO6E5GHrYuDCH2CdDg1Rd3wfx6cUA75EyxtK2OzOp8sXAu5qCUetyaHuxj1eSungWXFsBpmXSLVujstdaNzgmjkmbGJC6Nz1eUALyzTP3yFz5S1nI28D8RPWdl9LiDKROs3cLXEclEQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN0PR12MB5809.namprd12.prod.outlook.com (2603:10b6:208:375::7)
 by CY1PR12MB9602.namprd12.prod.outlook.com (2603:10b6:930:107::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Wed, 15 Oct
 2025 16:38:28 +0000
Received: from MN0PR12MB5809.namprd12.prod.outlook.com
 ([fe80::72cd:d9ea:b42b:730f]) by MN0PR12MB5809.namprd12.prod.outlook.com
 ([fe80::72cd:d9ea:b42b:730f%7]) with mapi id 15.20.9228.009; Wed, 15 Oct 2025
 16:38:28 +0000
Message-ID: <b872a001-0d33-4bd5-8805-b92b46c30cc5@nvidia.com>
Date: Wed, 15 Oct 2025 22:08:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: tegra: Add pinctrl definitions for pcie-ep
 nodes
To: Niklas Cassel <cassel@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Vidya Sagar <vidyas@nvidia.com>,
 Vedant Deshpande <vedantd@nvidia.com>
Cc: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
 Thierry Reding <treding@nvidia.com>, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org
References: <20251009142253.2563075-2-cassel@kernel.org>
Content-Language: en-US
X-Nvconfidentiality: public
From: Manikanta Maddireddy <mmaddireddy@nvidia.com>
In-Reply-To: <20251009142253.2563075-2-cassel@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0039.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::16) To MN0PR12MB5809.namprd12.prod.outlook.com
 (2603:10b6:208:375::7)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB5809:EE_|CY1PR12MB9602:EE_
X-MS-Office365-Filtering-Correlation-Id: afe6b5fa-03d7-490b-6b96-08de0c094489
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N29FZFV4ZzNQZENkL1l4MjBMbS9XZUdsNWtyUk9RdnVrNys3MFZiOU11N0t5?=
 =?utf-8?B?cm1vUE1FZTJNOHNyb2NvNndBOTlqRlAwQWdMYUorR0ZtQVBjSnRXc3g2NmhZ?=
 =?utf-8?B?dmdhdVZnN2phSFNJYUs1TWNRN3lTa2hzV2JQQmUwbEl0eHpyWTc0eUQ0NW9B?=
 =?utf-8?B?UXE0WUhJekJZUGFlYjQvN2IrdDVEdjVqWHQwY090T29neU45SEY4TWE0VTA1?=
 =?utf-8?B?YVFWbXBScVkrR0I4UDIyN1JySW8vRWFlK0p1R0JKQ2ErYXVXQVRNMkVPUk13?=
 =?utf-8?B?VUtyOE9ONmdXS3IxZXhzRU9GU3Z4Qyt1NHl2bGdxaGpEMWZQQ0dCQWNmOWhs?=
 =?utf-8?B?SU4vNmtkbEhMUDUrUWRuZVRCK2VOd2RDMjlIVjNlVnNiaHdXOHNtSGhSM3Uw?=
 =?utf-8?B?ZHAvLzlUcVpOTVcxSFkvV1ZIMjNoaEZYUDMzTFBDSXc1aG5TcjIzUENKdVNk?=
 =?utf-8?B?RjdENWdJaDREMG5zNmptdU5wRUdDQUFLaDdhVldqZnp5MC9VeWhJOFE4Mml1?=
 =?utf-8?B?ZSs4S1oyRzRRWEZ3bjhPT2tCU1U1Ynp5Z0RLTjFTbXIrZXRaWndjTVZFell6?=
 =?utf-8?B?QU1jYzNMZGt6UUh3bjByYy9lRWthcnVoODVwV1A0Q2VlVXl3QTVjbS93TnBI?=
 =?utf-8?B?TDlhT09MWjY1SExXV2ZhQXBiL3Bqb2tEWkhLbkhiYks2ZG1DMkpUUStGR2J3?=
 =?utf-8?B?S05BTGxYWVMvdGdzMEU4Qmd5N3BxUzQxdVp5dC92WnB2anF6SkFjT2VOaTJN?=
 =?utf-8?B?endCYi9CVVVjWU91N2hJK2hYZmJySW9jWXlSTGdQMHF5VHR3YkZRNjNnWkZV?=
 =?utf-8?B?bTVQTGM1bk9uRnVIUDA1cUsreG90bzJMdVVLYXFobjIwRExuVFN0UmliWGxP?=
 =?utf-8?B?RndjbVFFMk4vb3MyQk05Rm9oMm1kaHcySTdqbGsrL0xpVnBpWForUGkvYVZ3?=
 =?utf-8?B?cXJpMXFQN2xKQVY4Q2dtZUViWW9MN3hzUkhxcmpzVG1ZSzByUktZV1ZQbGll?=
 =?utf-8?B?dVI4SGQ3WFV5VXNJMlJFWWl0enBIeHR6aWhZYmZaYVU3b0hKbDJDaGVTQmZH?=
 =?utf-8?B?MTlWVGdlYURLRlZQTVNVQU9UNiszNGJQeEN3dlNvSzUrL0FvbXcwL1hlTU00?=
 =?utf-8?B?VzZlRTdMZjBSZXk4UTJCV29UM01RdFkyaDVqVm4zWGdXWkV5Y2lxWVJ0NHRB?=
 =?utf-8?B?dU5GWVErVjlPQ3Y5anN0WnNucUtlcDdicnZ4QURxVmJJMWw5MWtKM1dxMHdn?=
 =?utf-8?B?Y1ZWV2sycDF0Z3A1WHl2TmxWVDFGbU5BV1lJODNuUDRXbytSMklOTkJtRGNG?=
 =?utf-8?B?Z3EraEFTdmh4cU1RNFpXRnNDWXdkdlJJVkFJZ1gzTjdjV1F1QlZyVkc3RUxj?=
 =?utf-8?B?dXhoMDVWSlR6UEkrSW9EdDdZZTZNejNGUzVpZFNWNFVubVV2UmxOZVI0V0ZO?=
 =?utf-8?B?cHl6SE8yQ1hkL3lIQTJrTkRCZWkzZXowYmkvQlhvR3RCU2htMjFJS05vSVg5?=
 =?utf-8?B?VWdiRHVuazZJTE40Ym94b2NjWmdOaFFLenpaNkt5ajlIZ2k0dVBhZk4wR0xT?=
 =?utf-8?B?REo5MllDQk90UytId2ZFZWVwM2hnNmpQSnFHYXJFYWR5WG5JbHJ4N3pQNytv?=
 =?utf-8?B?NVFUS043MTBwRWZQZHo0bDNjSFNZcThzbnlJV2lFRnlBWTFrd0xMMXVWWUVR?=
 =?utf-8?B?NmNGS2IxNnZkdDB3ZUxRM1cydE9vQ013d3dMVE5nWS82WWFLWXhlY2tYSm5r?=
 =?utf-8?B?MEY5VFVWdm9PN0VBREpDaTYyTWFtdk1tQnlZNHp6Vm1uQzZnMEswWkFFcjJE?=
 =?utf-8?B?S0ovU2Z4T2RGdXFPalVsdlZJN2NITzBIWktkSnNyMjNsa2p1VHN4MnM4ZkRK?=
 =?utf-8?B?SFVnSWpNSVppQmFMMmhweU42czJ2NC9lNjlFRGxqR1FYZ0txUHJmZHhjelhW?=
 =?utf-8?Q?CSjQEnWez1UvuCtwzItpY6zprj9tVUft?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5809.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?czZzUWNTMVZqeXNvb3prSVJidjhsd0Z3aFErRXdENUlCc1ZVSXo2VG16a1Jw?=
 =?utf-8?B?WUo0QXZnQWcvbzYxTitWS053Tm9GcE5JNEhGRHZVZGlaTklpMFE1NUcrQTZV?=
 =?utf-8?B?b1crS3pXM3VxTlcya3BibUNFNnlFVzJ5S2VFMVdBWGNLM0Fia01NVGMyTlFD?=
 =?utf-8?B?UlV5R2JxRGcyYytrK0RTaVNhSlU0bDBjTFIzZ0ZZc0Rkb3dwSW5NVGtJbWQr?=
 =?utf-8?B?QUUzMmxEc3BCRnI0elBwazM1ZGVGN1ZUaTJla0dIOTFzWVZSV09ENXEwdllZ?=
 =?utf-8?B?eHVGdUV5SmEzWDREQVU5NythcDdWaGpMS2FER0wyeitoMXl2Q2UvbDdLSmdk?=
 =?utf-8?B?c0xJVVhpcEt0MHV0WU1NbGpqT2RmWjZKVUI2MVZlbFk1VGtnOGpQbVVYakly?=
 =?utf-8?B?NGxjUFNqZFVMN2JFZEt4dEVKQXJ1bFFEZi8vS21jOG0vZjFGNnVHYndDejkz?=
 =?utf-8?B?VXRqT2ZIRlgzdVdPaEx1UTJTcHc4RDJzLy9Oa2p0WWtPN0hhTlpkZGZyR1ZT?=
 =?utf-8?B?aFRJYUpqczhDQmFGUVo0V1FtUUtWUFJyM3dwRTNiL3l1OTdnN2xmN3grWjBk?=
 =?utf-8?B?dmNIKzJjLzlCVVMzV1pTaG1DL0R3dDJzbVBLek9weHpEbGJOSWgzK3NBUUdK?=
 =?utf-8?B?SUh1WklzNWdrcnJOV0ZsY1l0Z2g5YStjcnNFVVpFNnhtUXAwL2p2bVE4LzlC?=
 =?utf-8?B?QU1aYUZycVBYSFkrUDd2UUluZFNZbEpwaHB2QldQU1BFL3VFY2tFRWovMjl2?=
 =?utf-8?B?aS9yUHNsN2lHUy9WeWE3K1VxZzRqNFBrYzFiMXcvRHlzQkEwdkQ5WDJEUUNR?=
 =?utf-8?B?TmRLekRIZ2s1c2NQMThvVGhTZExEOWVJWkh3RnhwUUY2QmJYcWFDYXlQcFJE?=
 =?utf-8?B?TTJZYUxoUzZLcjZsVkNuMDAwbTNZeXpnM2tQVVNpamlwUzIxZnN3ZUs5RU9K?=
 =?utf-8?B?MEMwd3V4akQ2VVpLdDQyQkZZNTNWbWZpSGh2R0NSZnY2bTdZQ04wUnY0L0Uz?=
 =?utf-8?B?cTRyUWFRSkkrSVNNdEh0L0NJSEtIVXBzWnhwNEkweURJTjBiQmRnM2ZmTmhS?=
 =?utf-8?B?Vk5nQ1lYN01HR1NEbEVFZDNOblY1LzFWK2NET29adWU1TlhKcXNybFBmNmF2?=
 =?utf-8?B?MWEyMHBhVElhQ3lPTVExbG1pUkVSMzlHbzMwa1lYTndoazRGQzg4eUtORFd5?=
 =?utf-8?B?RjRuSkRjamx0ditreHFBb3ZGR0FPdFVCa09uT0ZYVlYrWHdGM09lU28rS2sx?=
 =?utf-8?B?ZXIrVVdVVFRxOXVxemVPZWcyQkEwL09JOEgveFhveUxmRnZnbGpkemRybDAv?=
 =?utf-8?B?OVNkTXlsYU9BMmEwcTk2b3J5YVRxNE1nY2daQ2NwZURJSWZWRkw0Z2xMcGlV?=
 =?utf-8?B?Skg5aGNlUUM1SWdRUC9wV0puMmxLSUdCbmFqdFJQOU5kVmRhVlNzVTBqRW45?=
 =?utf-8?B?OE9oZEFXYURXb0d1cVg0VWdZK2FUQVRlNzU0ZmtoUnJoTXVHQ1JNbmFLQUpK?=
 =?utf-8?B?cW1KZjZDN01uaEVVSzBsSEs3VUNaRWo0aUhZQWVUd2JHcnVlcUlYbnR0VzNP?=
 =?utf-8?B?Ulc0Z3VYSEkzVkc4WFphZTU2YzEvb2pvby83NW5pOWEzTnErUG93RGZoUzhj?=
 =?utf-8?B?WFljK3Z3WWp4L1VBMi9nbmZOWWhkNCtDVzdKSkZUdVpla2hQWWZtYk42aFUy?=
 =?utf-8?B?WXEyblN1RFA4am4xSXFkOS9sbEZBNHNPOG5NWEVFYUk1YmlMQXEzOE9naFZy?=
 =?utf-8?B?a3Y5dzgwUG9vM2oxOTE3QU9ZVmV1Y2ZWclQvWFkxQkl0ZUZPMHpoSHd4bWNm?=
 =?utf-8?B?aXFlaHM0MmRhQzdGYzFKMDgxTE1JZStqbTU5NkdUZ0U4RFk0U0tLT1hhVTlO?=
 =?utf-8?B?d3hOR01RQVRaQ3dhSHVUeFpVOUJtTy8zayttNFhRTFRuTXVtbi8rNjhHWFFw?=
 =?utf-8?B?V1l0Q2ZHWUI4L2JNRm1BV2JRNURHZGF1MWtteG5rM1V2ZEh0QTkydVZHOTBT?=
 =?utf-8?B?QUpteTZJZGVDbEErK3hJVnJnTG1FcTJ2N0pVUjZoSUxxaWJzbkt2SXFPRlR1?=
 =?utf-8?B?SEdNbmdERXdpdTlpcFpzeXJvZEo4Smxwb0FKekJ1UENTcGdEMTUwVFJXa1Vq?=
 =?utf-8?Q?0AqY3a5OIq1FTrDW+5T7Vc61G?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afe6b5fa-03d7-490b-6b96-08de0c094489
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB5809.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 16:38:28.2075
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qPBbWZoBa29pRrV/zSxYinIF/6FaqtFOh/XWbimgXXg/mxm7UfqZB9K2OMeJT6atSLwmHO8klkrTAgZcQOybrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9602

Looks good to me

Reviewed-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>

On 09/10/25 7:52 pm, Niklas Cassel wrote:
> External email: Use caution opening links or attachments
>
>
> When the PCIe controller is running in endpoint mode, the controller
> initialization is triggered by a PERST# (PCIe reset) GPIO deassertion.
>
> The driver has configured an IRQ to trigger when the PERST# GPIO changes
> state. Without the pinctrl definition, we do not get an IRQ when PERST#
> is deasserted, so the PCIe controller never gets initialized.
>
> Add the missing definitions, so that the controller actually gets
> initialized.
>
> Fixes: ec142c44b026 ("arm64: tegra: Add P2U and PCIe controller nodes to Tegra234 DT")
> Fixes: 0580286d0d22 ("arm64: tegra: Add Tegra234 PCIe C4 EP definition")
> Signed-off-by: Niklas Cassel <cassel@kernel.org>
> ---
> Changes since v2:
> -Add pinctrl definitions to all pcie-ep nodes, not just C4 controller.
>
>   arch/arm64/boot/dts/nvidia/tegra234.dtsi | 57 ++++++++++++++++++++++++
>   1 file changed, 57 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> index df034dbb82853..cc929e1a00744 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> @@ -9,6 +9,7 @@
>   #include <dt-bindings/power/tegra234-powergate.h>
>   #include <dt-bindings/reset/tegra234-reset.h>
>   #include <dt-bindings/thermal/tegra234-bpmp-thermal.h>
> +#include <dt-bindings/pinctrl/pinctrl-tegra.h>
>
>   / {
>          compatible = "nvidia,tegra234";
> @@ -127,6 +128,52 @@ gpio: gpio@2200000 {
>                  pinmux: pinmux@2430000 {
>                          compatible = "nvidia,tegra234-pinmux";
>                          reg = <0x0 0x2430000 0x0 0x19100>;
> +
> +                       pex_rst_c4_in_state: pinmux-pex-rst-c4-in {
> +                               pex_rst {
> +                                       nvidia,pins = "pex_l4_rst_n_pl1";
> +                                       nvidia,function = "rsvd1";
> +                                       nvidia,pull = <TEGRA_PIN_PULL_NONE>;
> +                                       nvidia,tristate = <TEGRA_PIN_ENABLE>;
> +                                       nvidia,enable-input = <TEGRA_PIN_ENABLE>;
> +                               };
> +                       };
> +                       pex_rst_c5_in_state: pinmux-pex-rst-c5-in {
> +                               pex_rst {
> +                                       nvidia,pins = "pex_l5_rst_n_paf1";
> +                                       nvidia,function = "rsvd1";
> +                                       nvidia,pull = <TEGRA_PIN_PULL_NONE>;
> +                                       nvidia,tristate = <TEGRA_PIN_ENABLE>;
> +                                       nvidia,enable-input = <TEGRA_PIN_ENABLE>;
> +                               };
> +                       };
> +                       pex_rst_c6_in_state: pinmux-pex-rst-c6-in {
> +                               pex_rst {
> +                                       nvidia,pins = "pex_l6_rst_n_paf3";
> +                                       nvidia,function = "rsvd1";
> +                                       nvidia,pull = <TEGRA_PIN_PULL_NONE>;
> +                                       nvidia,tristate = <TEGRA_PIN_ENABLE>;
> +                                       nvidia,enable-input = <TEGRA_PIN_ENABLE>;
> +                               };
> +                       };
> +                       pex_rst_c7_in_state: pinmux-pex-rst-c7-in {
> +                               pex_rst {
> +                                       nvidia,pins = "pex_l7_rst_n_pag1";
> +                                       nvidia,function = "rsvd1";
> +                                       nvidia,pull = <TEGRA_PIN_PULL_NONE>;
> +                                       nvidia,tristate = <TEGRA_PIN_ENABLE>;
> +                                       nvidia,enable-input = <TEGRA_PIN_ENABLE>;
> +                               };
> +                       };
> +                       pex_rst_c10_in_state: pinmux-pex-rst-c10-in {
> +                               pex_rst {
> +                                       nvidia,pins = "pex_l10_rst_n_pag7";
> +                                       nvidia,function = "rsvd1";
> +                                       nvidia,pull = <TEGRA_PIN_PULL_NONE>;
> +                                       nvidia,tristate = <TEGRA_PIN_ENABLE>;
> +                                       nvidia,enable-input = <TEGRA_PIN_ENABLE>;
> +                               };
> +                       };
>                  };
>
>                  gpcdma: dma-controller@2600000 {
> @@ -4630,6 +4677,8 @@ pcie-ep@140e0000 {
>                                   <&bpmp TEGRA234_RESET_PEX2_CORE_10>;
>                          reset-names = "apb", "core";
>
> +                       pinctrl-names = "default";
> +                       pinctrl-0 = <&pex_rst_c10_in_state>;
>                          interrupts = <GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH>; /* controller interrupt */
>                          interrupt-names = "intr";
>
> @@ -4881,6 +4930,8 @@ pcie-ep@14160000 {
>                                 <&bpmp TEGRA234_RESET_PEX0_CORE_4>;
>                          reset-names = "apb", "core";
>
> +                       pinctrl-names = "default";
> +                       pinctrl-0 = <&pex_rst_c4_in_state>;
>                          interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;  /* controller interrupt */
>                          interrupt-names = "intr";
>                          nvidia,bpmp = <&bpmp 4>;
> @@ -5023,6 +5074,8 @@ pcie-ep@141a0000 {
>                                   <&bpmp TEGRA234_RESET_PEX1_CORE_5>;
>                          reset-names = "apb", "core";
>
> +                       pinctrl-names = "default";
> +                       pinctrl-0 = <&pex_rst_c5_in_state>;
>                          interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;  /* controller interrupt */
>                          interrupt-names = "intr";
>
> @@ -5115,6 +5168,8 @@ pcie-ep@141c0000 {
>                                   <&bpmp TEGRA234_RESET_PEX1_CORE_6>;
>                          reset-names = "apb", "core";
>
> +                       pinctrl-names = "default";
> +                       pinctrl-0 = <&pex_rst_c6_in_state>;
>                          interrupts = <GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH>; /* controller interrupt */
>                          interrupt-names = "intr";
>
> @@ -5207,6 +5262,8 @@ pcie-ep@141e0000 {
>                                   <&bpmp TEGRA234_RESET_PEX2_CORE_7>;
>                          reset-names = "apb", "core";
>
> +                       pinctrl-names = "default";
> +                       pinctrl-0 = <&pex_rst_c7_in_state>;
>                          interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>; /* controller interrupt */
>                          interrupt-names = "intr";
>
> --
> 2.51.0
>
>
