Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795072107;
	b=QHossD+vybzXpn5pFA1JYGDwH8XI0O7lFRqQGSHayx6REKS/ikNtFly9WyHnICbpXy7X
	 ol4PUVvOXh4tRGFRvJdUEOuLm2Ko2KhJqIFmkqPpJLLMfq5jI98bpQnVWBqRrqGwQWvgH
	 LHM84aLg+OBdz+N74UG8QVAYlCDUUVFlPKzc6aBd5v7mMHt4ooq/Ss+5/J/xF6vuhd4IR
	 hpU0uDmg6wedUoZT1Tf1ySW2BiE0SXmSdF/SSU9vRg9i4rWkSKMmUOvUinsPQUhLnCBBc
	 rc7K19FO/2OChJ+gJary0DlVP3OeTGrZR/LMhkX1tDAGHqdGCz9pm0z5sz5Xef6mp9w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795072107;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:Content-Transfer-Encoding:
	 Content-Type:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
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
	bh=qsULy7tymE2E2CNNtswJa9MLHycXgH04v3L4y+5Zflk=;
	b=ozPK0XupynFhBdfLPOYnLM34IN+vpjWpxzTO5RZpEp1ldwNRJ+W1oaD4PB5RdW9Kx23G
	 TOoeZZIfiQ1yNHRSz1j/zAIQkj+r+yb6hfJQ58AERj9nHYzlRsfuwlMudhBZtp8joRIV+
	 tSLG4gLreFIbW9x7cii2api7fOiiNvJxK4W/MaZKJqYPFUI07YMS4rpXvveufojBZG71c
	 8UN7CDp365R2qH9h5qiLdhsEMZRtOjWdaomYSx0+Rj5+urVJ8qAWzTqI3/vEQEnOJDz7c
	 d12KhpzfF+z++0Gu/x/97Iruds6feSoaTPr2fQg3Vxr23PSJRI6/xfjLhN2XqI/BQAA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=MHeIkAE5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.52
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012052.outbound.protection.outlook.com [52.101.53.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A43C606A320;
	Thu, 19 Nov 2026 07:08:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A43C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=MHeIkAE5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BRyZjqJQrZ9Cj1eN84zDvz3HSwqTVPsMq8egO/3qZbS1pqiZ/GDzUsZIZx+F/RfDgaJiYHtiDejznbB6NCeCEl7Kgq1QAZ+k2pqxjve+/bNUA47+k/pAM/UwwP8WLEOMvO9G6mANcUJ0XA38cgXlxTiTEjEdJVOZP652LRO5m+TmZi6NMkT5s/540sXUFLa1v4raLj3ABv+YdKzdL+4DqQ3uVzAxcpNBNdEowBWYbmJhI+44NZbkFi3etElzB/hkUvlVwEIQvI6DykynjaDKt6UENQNgdClyy2LLP2KytJ8NO44c1t7xXpqjsn3xrjEsIbwqp+hOqbctScHnGcUgPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qsULy7tymE2E2CNNtswJa9MLHycXgH04v3L4y+5Zflk=;
 b=HEgHW3LKwVjkGxGtsLbpj+2JOz/wlsvk14wO+39eNc6+rr+CBeAHNH44z3zTlTlxPKQSFlgWC+nw/SRYF5eugk8vT6BwN6drnQ2g/geA5hc2qi5JO2EXV5T38rxX2TFMSMEjsAQl885tHkDDPgHGJ+LUFo/fqyAbbHZopZ84bDx8AjpQ6zl/+RJcrRs0Mhngpfame0BX0eV9ERcaJ8xMRkxaChtSc3Vn+POmRta7eACeP7nG2PxlhMrn9tvbUTxuzd82I3becQq17FnUTTsWn2HMBQPY8vuNSKb+LGUyEBYPLvvRKOcjQsKmln6ozYLvi7+6oPSwt5tQXQ6yFCF3kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qsULy7tymE2E2CNNtswJa9MLHycXgH04v3L4y+5Zflk=;
 b=MHeIkAE54L0eP808CrPqhtjdJZFZuvRGbXaHoH3xQKeMUAWxtcdjS3ezY8ENx4UFNoz0WBlM8Nv4KC62gh2/Kr8P5Ybf+QHsJONnLTgGH/yONCsfE43BUVnOXgomw6C6oI+JCCADy+1YpKYh4QAnFcuAnQDVVFC71wqlqD4BLzk4bhO6LG/C2rm3YEVZMtsCyYCX8MurZWCN5S2apBWYqsC1hao2QoHunsJhA5z8GGvYcIQAJw9QQHD5v0gTynD8jvoYVRbXDzf2a0vLes3kBdepye+lWyO1+TuOYl4fO5mdp+A4C9GPf+vaN0I8sdOxhuo5zO++8OqTl0T9RgWrfA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by SN7PR12MB7370.namprd12.prod.outlook.com (2603:10b6:806:299::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 07:08:22 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%5]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 07:08:19 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Thierry Reding <thierry.reding@kernel.org>, linux-tegra@vger.kernel.org
Cc: Thierry Reding <treding@nvidia.com>, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 Amit Patole <amit.patole@gmail.com>, Amit Patole <amit.patole@gmail.com>
Subject:
 Re: [PATCH] gpu: host1x: document the remaining host1x_bo_ops callbacks
Date: Thu, 19 Nov 2026 16:08:15 +0900
Message-ID: <OqAlWBYrRWy6u2pwKwlOkQ@nvidia.com>
In-Reply-To: <20261105-kdoc-host1x-bo-ops-v1-1-cc171c9e36a0@gmail.com>
References: <20261105-kdoc-host1x-bo-ops-v1-1-cc171c9e36a0@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCP286CA0312.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::19) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
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
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|SN7PR12MB7370:EE_
X-MS-Office365-Filtering-Correlation-Id: 20a61c73-7f8d-47fa-1379-08df460be426
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|10070799003|366016|1800799024|376014|18002099003|22082099003|261009223027099003|5023799004|56012099006|11063799006|261026121527099003|261026140227099003|261102123227099003|261028144727099003|261021121427099003|261022075727099003|261022105027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	rEVHZ4FGq5p9ghcnwUDNTyuL6HN7Hau2YEqOfrD8xmu4AYrP0J0PrEeZ5bSUSItouliflL6mZfajvbZz5wrY7zGX8QK1D77MTiCp2KOBmfQhuSi+W0dFik+smTU7JqNdv1K7J2JQfSwhje3UeXMuM4fP/UgjxHEOvavC8a5j3JiY2RJ7xhXE5gfl6qS5HqGILuMOgCNd81GtFYJfGL6njn/R5aHtKOeHa9G6vPEGOImbnF4n5v9zrSvfaauyGo8PG+oKBDDCy0Gg5Q5kE8uFQqR9blU1ACOYMu3jVpoIE8wbpIAQAhAZwlgcrBn6T9uVdEixrd83Ej8Blzt5/rKRHOMWv30hinCnvaN6z/1Mx6q3yc4A8uM0pjiIEOzOE6RFVfjA2yxCFp9WyYD896kJSHeRJfr9ity9dCA6gVPmfq3A0YZiPHKVa0hFRdctGmfArkBkvG0A9MNhLeRj/QSXZ502mZ8SlfoWlbozGha4IT/A+xzLzWAJXBYGTV+PIjDscKY2gmrB4sBb5WloSBTFflWiIhS8uwvHGz/LnI/+qHQFY4W6zNBnZEgXmOUCSWSYn9/+tMQrJ4Q/98rDnhRMGDIr/KNqCezT3FdjR7CrCxj750s6d8NuobcFJPWq7rqeJTDOtNfc/vEo9izOX54gsXotHdpaZOcBkTfItmNmWAQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(366016)(1800799024)(376014)(18002099003)(22082099003)(261009223027099003)(5023799004)(56012099006)(11063799006)(261026121527099003)(261026140227099003)(261102123227099003)(261028144727099003)(261021121427099003)(261022075727099003)(261022105027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bStMMUhEQi80dVplQTFSTzR1OElJTlN3WnVqNE5DRjhpMWpiUEQza1Z3WTdW?=
 =?utf-8?B?S2xMUHZwSEMrOTgvUkFmOWhoYzM0eFN6b0lISlppaUV3ZmhLbnhLSkllWUpN?=
 =?utf-8?B?L3pZa0lEZWcrbHJDNDg0OGZMNGlYelZ2Y1ZRV0x3bXB6SUw2dUJQUW5nSG1s?=
 =?utf-8?B?NDUwRUxtV1FzZ2dSUmF5S1lUSnYvQjl0MzY1OHFRbzBjNktOa0thVTRwSy9k?=
 =?utf-8?B?ODl1Qk5hcWx5Yjg1aUM3MTVlOG51S1pudDJJNTFtYXFwZ2RhclZ6ZTJIU0la?=
 =?utf-8?B?NDlTMEo5VDY4b3FlUGludTJvSFI5VkFBOXBoc2JCS2VMVTlxblQ1WUV2aEdy?=
 =?utf-8?B?TlpMTDFaUlNSSWZmWlhHMGIxcERTdXVTQjQ4bm5tNGhFQXNZcHlISnVzMEZr?=
 =?utf-8?B?WWoySGNMWE5FeC81VkFUbVJMdGJ3dElSY1RpSDc3dXloVWVhWnhRbG50cCtw?=
 =?utf-8?B?LytGSWVZWjFCYnJORVZ1dXMwSWJNNDZiMVVRdTBpekN6bnVyQ3VBTzFNaDJv?=
 =?utf-8?B?dWxESFFmbU1jNjQ2ZTdCd0ZCT0Irc0wzTkhGN1NrdCtIaHRtNjNuUE15SEFh?=
 =?utf-8?B?NGgxZEdNM2V6TVpMdldGcjRnSWkxSHlWLy9PdmZldnByYlA4VnhIRGdYSCti?=
 =?utf-8?B?N0VjbXJoTHAxc2ZZbUk4ODFaSmFycDJSODBDVXRad285czR3QTBoeFE0aW1Y?=
 =?utf-8?B?UythNWxBYTREYUZwM2NnVFVpekVuSnR1bTNDNXMrY2h5SUhuWUxEaTZHaGRz?=
 =?utf-8?B?WGdOYlUvUmVuM01qVS9Za3FKNk5ydXRWZTRpVUp5b2NuZ3JLS2NieVN0ZUwx?=
 =?utf-8?B?Y2pjM2gwdXllNCtzdUlCMzQrWjZ4NEhRTHptWlpTSGhMYmtOak5oaHYxWXV3?=
 =?utf-8?B?M1pDSkhWVHRMZTByazJzVGhIRnZIS2ZzeFpiZWxyd0RFVlNVNEgvVjVRMlJE?=
 =?utf-8?B?ZnF1Mk1oRzQveGZZNFRza3pDL2pOZVM3SWNOdlBzNnV3QkJSQi9aZHFsc1Nx?=
 =?utf-8?B?QS9wbk5nRWVQRHcrd0YvVjdqZFowN1JJUEdYMU9XNkVPTXFQbDZUcXRPL0pQ?=
 =?utf-8?B?d3BZeE5WTTM4a2JzN2lsWjNib3BqNDB0UHRJY3dxUXNwbUs0b2NldkR6b3FX?=
 =?utf-8?B?MEhVdmhpTXFzLytFY21ZU3FZTEhyTlJvbUl1WTR6MGt3WGNHeTgzWGVqcXMw?=
 =?utf-8?B?YWM1VnMxR0RmM1pPT2ZoUTdnNUtJODRySHZSRkdUaUIrVUFBR2U1VlFkT1A4?=
 =?utf-8?B?ck1vTS83NXBmSWdzVEpzeUt1SFh1Yk0xRVYvZmloWGJrTFNyL3d2UkJOSkZR?=
 =?utf-8?B?RDhCaW43bFFiTVk1T3kwRWtyTUNSOG5hcTFmY1RMV0RocDYrZVdLWGNBdldm?=
 =?utf-8?B?N1owSkVYWm5ZU2hkYVlPdDlnRVVIVFFya0RaL3g3TnN4a0NERXFEN3ZpL21J?=
 =?utf-8?B?R3pra2F5SHV2M1p0V1FlM3pPSGdsNmRINVZkeXViL3R2aC9HQk1Da28wZGc1?=
 =?utf-8?B?blpodXEyVS9DVHJnc0JBSWNwZXJjZ1JjTEc2UlR2eXR6WFYyZThuUGYwcXBB?=
 =?utf-8?B?L0ZkWmg1QTFXdkFIeGpkLzJqQXU0NjBZVktCTElqekpndWFrMm9za1FDUkJR?=
 =?utf-8?B?NnRabWZnWGZsampJK1RNcHpFZXc4SXlENGE3ekVGTU92RklUcFd0NEVmSGFW?=
 =?utf-8?B?ZGx1aStxZ1dkUjYwaHdlMC8wbjhVTlM5L0ZaVHcwVWhteFdGbWowVTFVNVVO?=
 =?utf-8?B?eFVtNzVKMGROUThHOTNFYnZJb3V1bGtoV0tLYjY3ZTl6SDJUVjNpOE1VMnVv?=
 =?utf-8?B?MlQrZmxJS0RGZE5Oams4WXY3ZGtGaDBoK2xSand5VzlVc2xlVXQ4N1YyNEhG?=
 =?utf-8?B?bkllWnBEMjBPVTMwRkxDLzY2VlBWVGg5Zyt1bTRNa0VPRTBrZHVVSTVLelNN?=
 =?utf-8?B?UDRwVkdOcHVsZHNIN1h1MzdmRmg2aCtrRk53ZkhYeGZhVHVwY21SajkxZFZ6?=
 =?utf-8?B?ckZreTYrOGpRV0ttQzBVQnpVdGs4eDRDVEU2bjFQc0pueHJRYkV3MmxzVHNX?=
 =?utf-8?B?Q3JUZzBKNSt6YW4vZlFCTnFiL0U2WjRHeGl0N0w3b0JWODlxb2RGTFVCbk5x?=
 =?utf-8?B?L0czQy9RSzEzajhZTVdVd3VzTlQxOVlUUmlQeXBkc0kwZkJQS2Zka1dxUWxL?=
 =?utf-8?B?SmZ6MFpSR0hyTFhoT05jWXdBRVZVdnBsV2pxNzVIWWNST1ZiL3dOWDNibWg1?=
 =?utf-8?B?VTBBeEpqeXhYMmd2bkFJY1gxUWp0U1VMM21rR0Y1RFBNWDYrc2M3eG8wcmhs?=
 =?utf-8?B?emdURXVZVDkxM2ltVnovU0pha3UvWWNPZlQyTmI2bTNDRkVzdWptRlFncmlI?=
 =?utf-8?Q?YfL+6QlrvoMjeMy3Cc7UuaBOWIKKSh3Di1n/LsTsSErfJ?=
X-MS-Exchange-AntiSpam-MessageData-1: sFtJVC3557XFZA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20a61c73-7f8d-47fa-1379-08df460be426
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 07:08:19.8801
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L+xbrRp+ggnUH9uJUQRRJhMv2UGZHIUidu7fHd9PQ1eH4BHHif63afuiyzvbyL/2O/G9XxorS/5DH4CA4VYLug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7370

On Thursday, November 5, 2026 11:01=E2=80=AFPM Amit Patole wrote:
> Commit 3cbf5e3c46e6 ("gpu: host1x: Allow entries in BO caches to be
> freed") added a kernel-doc comment for struct host1x_bo_ops that only
> describes the .pin and .unpin callbacks. Since include/linux/host1x.h
> is pulled into Documentation/gpu/tegra.rst, this produces four
> kernel-doc warnings during the htmldocs build:
>=20
>   include/linux/host1x.h:159 struct member 'get' not described in 'host1x=
_bo_ops'
>   include/linux/host1x.h:159 struct member 'put' not described in 'host1x=
_bo_ops'
>   include/linux/host1x.h:159 struct member 'mmap' not described in 'host1=
x_bo_ops'
>   include/linux/host1x.h:159 struct member 'munmap' not described in 'hos=
t1x_bo_ops'
>=20
> Describe .get, .put, .mmap and .munmap, based on how they are used by
> host1x_bo_get(), host1x_bo_put(), host1x_bo_mmap() and
> host1x_bo_munmap(), and on the Tegra DRM implementations in
> drivers/gpu/drm/tegra/gem.c.
>=20
> The warnings were found by running scripts/kernel-doc over the headers
> pulled into the htmldocs build. An AI coding assistant (Claude Opus
> 5.5) was used to locate the warnings and draft this change; it was
> verified with scripts/kernel-doc (no warnings left) and checkpatch.
>=20
> Fixes: 3cbf5e3c46e6 ("gpu: host1x: Allow entries in BO caches to be freed=
")
> Signed-off-by: Amit Patole <amit.patole@gmail.com>
> ---
> Comment-only change. Built with W=3D1 on x86_64 (drivers/gpu/host1x/,
> COMPILE_TEST) with no new warnings.
> ---
>  include/linux/host1x.h | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/include/linux/host1x.h b/include/linux/host1x.h
> index e7ba601b2afb..7027adb9bff5 100644
> --- a/include/linux/host1x.h
> +++ b/include/linux/host1x.h
> @@ -146,8 +146,12 @@ static inline struct host1x_bo_mapping *to_host1x_bo=
_mapping(struct kref *ref)
>  /**
>   * struct host1x_bo_ops - operations implemented by a host1x_bo provider
>   *
> + * @get: take a reference to the bo and return it.
> + * @put: drop a reference to the bo.
>   * @pin: create a DMA mapping. Implementation must not touch the bo's re=
fcount.
>   * @unpin: destroy a DMA mapping. Implementation must not touch the bo's=
 refcount.
> + * @mmap: map the bo into the kernel's address space and return the addr=
ess.
> + * @munmap: unmap a kernel mapping previously returned by @mmap.
>   */
>  struct host1x_bo_ops {
>  	struct host1x_bo *(*get)(struct host1x_bo *bo);
>=20
> ---
> base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
> change-id: 20261105-kdoc-host1x-bo-ops-7ae7a3554fb1
>=20
> Best regards,
> -- =20
> Amit Patole <amit.patole@gmail.com>
>=20
>=20

I don't know if I would say 3cbf5e3c46e6 was broken per se, but this=20
does look correct;

Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>



