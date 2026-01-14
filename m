Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011002.outbound.protection.outlook.com [52.101.62.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D382B387576;
	Wed, 14 Jan 2026 11:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768390043; cv=fail; b=vGFrvuNReqbdw6EnB+Im5krNsEcrF88u7wg8WXtlkF8uQlVvn9Pj2k/GOmn9aDXam2J+IesNNDzUjLJSg/kZ5h66YbA3/LUtoUUslaiF8UXEDRTitEMgqUaY8Un7Mi6e+wyGmBGaXTjz8QFpfUJAixslQpB66QUqpC5uQz/MYSk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768390043; c=relaxed/simple;
	bh=ccSLp7gD+SKLpeVzXs4zurfP8rPlX9jV6pfvogWzCwc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=X6mkAXcePgOXsCCh4CxlLr5CxjtJd2VGFpSrSq2vOF3d5bt1RlZYbIH/zuXBMMeWGQaPzPKvjc28nNG4/hpsGFZI1hStrBlXIU0nB6xY7q6cbi3tv2pry5IhKRnE82kgwqg1nbkciR/acyPvMBUKhTIRI7uLBarwQBwc78/UUxE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LWFXO974; arc=fail smtp.client-ip=52.101.62.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LWFXO974"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AesMD7aR2CcnQQfcxQWkcIBldbABAboqKWVCw1DGTiFOb2bK3YLvXD/dXeNDj5fLMHLKURs6zf29amZJUbZ2/I5HueRnghx6QwGFxueFWzNBRoOM3ziU6bGQ02KL+rjTLjC0no16KwmoTftNpw8SEt5eX3mhMfRECHtsRPTOOPxKCvQ9Jzsyr81mzhiFJYvZX69dgA2oTrl7F0++yKXjZ6O6L1A0/g6XtiMCvgS0O6h4Ml6lurxyIwZbq8QeUXysK8NG3BskrfXRk0cacDO7sVWteWby0ZqvgEvHjVjkGBqlmI15k+ilRiwM7d6fUs9tJtlg7E4ZM3PpkdhmFAzDXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uUbt/a+Yr56+wiIcqVfz7ZxReRcUtq/Ju4ljJ4GXXcU=;
 b=THTh0VG/ur3Dv2/PHAaO73iM8JHRDytCyLABXseAvILq0GWhPGyoG8nBaQN4l4MvUmv97pISLLxs+X8lmalTLSYmz20yAw20+M+eGw+8RnnSngf/rg5NRBUtzlEXzsC9ZPHB8QGNo+LXrL0dBknVUa14wMXvRBLx5wD5moSaD/Ti4EII9jArdrrPB2S9m32w9bdnhdyvKfxbfwCRVGGMNM5aMH6u4xdO8hNAiFmtHRd+Ym5mfOXaGj6P/EJ/UJobIOJP0W2BI3DS9A4XaJ7meLQKRHbkEIxh/jKnrApsTDSPzHerWVsvIykkqE/mgH0gSLfX3IYY0s+qG6ISXzoJ6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uUbt/a+Yr56+wiIcqVfz7ZxReRcUtq/Ju4ljJ4GXXcU=;
 b=LWFXO9748PTqz4TajY28T49PUmhRYMT02F//CCY7MuDPWLdhiL4nd60I5gcK50nKrrPtUNdwcAEzOCKwZf/VzeOp7V7Burj8rrHBqonGiGm0QbtIKDL65MyjfBYD6swOPmXkuFjnukDa0a3Jays/aaAoPMRKOSgnH04hSNVHZ57xxGVbyfAsDpTERu8zKN8FWFS2xl9XCjBjYYLhs5x3+bIFvFK5wh8jgPRwU8M/VwiGWOX4ordrseM2e7kSZ49cB09RAfvJNTqHRxaHnKgD7JtgyYnGXxUhzlNAHx7d6wMqT+09ypwPmgF50c9zb+FlbDPUoklGn94Rhb+PyUt2VQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by PH0PR12MB7009.namprd12.prod.outlook.com (2603:10b6:510:21c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Wed, 14 Jan
 2026 11:27:18 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%5]) with mapi id 15.20.9520.005; Wed, 14 Jan 2026
 11:27:18 +0000
Message-ID: <0e68c5f4-f68d-4544-bc7a-40694829db75@nvidia.com>
Date: Wed, 14 Jan 2026 11:27:12 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] ASoC: dt-bindings: realtek,rt5640: Various fixes
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org
References: <20260108143158.351223-1-jonathanh@nvidia.com>
 <176832669841.1106728.13139168898095349975.b4-ty@kernel.org>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <176832669841.1106728.13139168898095349975.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0350.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::13) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|PH0PR12MB7009:EE_
X-MS-Office365-Filtering-Correlation-Id: bdc73316-d916-476c-703f-08de535fe040
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|10070799003|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aDRDd0JyMjNUa1hDcmt3UEVtUy9FN3Z6bDlNY2dhN1ZkTXhVeXpETVZHMTJI?=
 =?utf-8?B?NGF2QXpNeDZUckVFUUdFQ0ZJVGFJZGV1Vmw4WmNOeTk5Mm5LRmdkdGN2ZjBK?=
 =?utf-8?B?eHpySCsrRXZUNEJXNE15c09sTzVUdnUxK2dhZGVoeHBOdXFxSGRVTndZdS9Z?=
 =?utf-8?B?YWJWT0h3ZmtIa2tFbE9ZZVdTaENUQjYzeFllRllCUHlHWE55UHJkQm5lTGlK?=
 =?utf-8?B?SFVrRXBoR0NzV3lGaHJxUXhCTFRrYktCR2U3RW9WNVBnN3VYbjZEZTJXNGMy?=
 =?utf-8?B?WlVVd0NFUzZaUEc0WG9RbHIvR2t3TnRlcGMyY1JzNmdSVjdBK0NFcXFwc1VT?=
 =?utf-8?B?cjJ6U2x6QlRTbDZTb2k0TnY2WkdRaUpJaWJhNkppTFVybXBBaE9uc0ViQWlD?=
 =?utf-8?B?MmF1L0xOMVVQZnBMYTczMjB6dGRLUzdOUnB2aWgvVjM5SklydmwybW9TZlFy?=
 =?utf-8?B?ajdBcnJsTTZDTVo2cTFoaXczN1dYYlR5M1lyaTVnbzFnYWRLQVgxUFdySTYw?=
 =?utf-8?B?QnFOVnlmUmdsT3JVVXFMUUlDWkFYZmZ5cm9EQk1UbVh5dk1KOERuUjNUczVM?=
 =?utf-8?B?L1hGUEJUSmZlYlR4czdqYmRkQWtIaGxFS2FiVFJIdDFBcy9DemNHS29rcFFU?=
 =?utf-8?B?amE0T3ZaY0ZBYWdRaTJHN1lXSjM5c1A1cDNPd2FMaTBSaldqTmtsazVTRHA4?=
 =?utf-8?B?aE5RSHhxZm1wQ0MxdTZQZllFc0tCUUdORmtSWGZKMnVONW16UW5rNmRVYmZs?=
 =?utf-8?B?eDRwL3kwR0xYc2VJU3VtUSsvUWVOSytoWUZMcGtaTlNrV1hsdzB0SU90TC9Z?=
 =?utf-8?B?Mis1MDcydGJ5bWNPYzd2Y3psV1VhWUxRL2FoZlUra09kb0IzZHdCSnJnTHFl?=
 =?utf-8?B?dXRLYjdUUUlGNy9QL215KzdiMjRhRnhxRGRVa29mWHBubE9IOEordjNhR0hY?=
 =?utf-8?B?TXhSOWNGYUVFR0MxS0llZzVBTC8yU25WZUVQOTFaYmJXOVMrT0o3VTV1ZjNo?=
 =?utf-8?B?OHpBbCs4V0lZUDdmRi9nUmhOcnloK2dPb1VHSHhHbnlRVDhrUWY0elgwYUVK?=
 =?utf-8?B?TU9jcTJzajdUdStscVNlY09ranVXWUc4NHBLTTdlcWxZb3hXc05QMXVBRzRy?=
 =?utf-8?B?emFBS2hhYmw5SWswUW02MVA2QTYyWkVsVGVOYUdsclNpYjJZLzNZVjBwR2Zh?=
 =?utf-8?B?NkpUZ056cFhhYlRYSngwcXFRamo1WEFWa3VaYjNnMUhUMnpENzZIVCt4U1JY?=
 =?utf-8?B?L2RWTDB5UnRrVWJlZ2lnOW1TYTJGL3phMFhsZzJOOWpyVkZLcHo4VEh5M2Va?=
 =?utf-8?B?K24rOGhEcERoL2NMMXZxanRWK0tMbnlxNU5sUzNXOWNhWGxuQWg3WlZzZnEw?=
 =?utf-8?B?Y3lPZ0RaSXFvZS9nQVNscDRpTXJjMGJpYVk5Vk5ManFoazFKbFV6dXNhbEdB?=
 =?utf-8?B?NXFCeGM1UVB6UDhOUEViRzNGcStGTG1BL25zdVBOYVFOTTJ0NnQ5QUxvWFF0?=
 =?utf-8?B?SUF5dFMzczdHYzRHMUhZVy9GMlZjbzJsSmhSWU1RY2hBWitEZDdLbHF3cTVv?=
 =?utf-8?B?OW9iUEw4OFNObGQ1T2JoWlNGUzlZNk9yMlNRc2MxRllvVmNUb0hoVTEvdnFy?=
 =?utf-8?B?WjU1MExXOC9yLy9QRk5CZTdVeC94TitZUVdVcGcyLytaM0F3MWpwS1NyRHo5?=
 =?utf-8?B?YW80dG43T0g0TStGbVBYT3Z6dXczME1pQ2VuSmdXRTd4RS9WNXJFTDE5TVBY?=
 =?utf-8?B?UjBySWtZdlR4bkpROHVyWGhnMFNVNmFPSGpwWWVPWDV6TUlUa0hxN0hBM2h3?=
 =?utf-8?B?WlpvSnVYaExrbXFrZnpKZFJiMlZzR1djbm16d1hWc0EwTnV4Qmoyd0hnQnVl?=
 =?utf-8?B?WjlXaGptNktPdUFvWFNxR1BFN2hJTlFXc2JJTUptenArOCszanRneGpPa3py?=
 =?utf-8?B?UnRXNHdlWVNLbCtiYWhZK3htbExZUW9RUlplME1GYWp3NzFnRW02ZVQ2Q0Zu?=
 =?utf-8?B?cHhKeGQrMllmZ3FMdkNXZlU4NHlwemsxREpObGlCaE8raGYxekFCYXhxZ01H?=
 =?utf-8?B?M1FKREY0aWxmYm5wNGl1UWxhbjBJaCtaOGg3SmFld2RKOTlSQXNKNHFVQk9Z?=
 =?utf-8?Q?wT18=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SER3OFNtU0xET2puYm5ZQjR6SWcrR3lXUE0vZ3Q2ZFA2SEJCRlI1WlduU050?=
 =?utf-8?B?MnFxbXY3eloydEI5MEFBUS93UWxGazJ5L2t0OTFTZnVCSFcycjFSeXRrUW0r?=
 =?utf-8?B?eEIwQTRCK3BIL2RqZTU3ZXlMLzFuQUM3TzNTYURkYklsVnZuOVIwaTJ1b3FE?=
 =?utf-8?B?a2JjdFhnS1ViOUI0dURaUEpnaDVpZlByNURtclpDVCt4UUd0Vko3RWl4NTA0?=
 =?utf-8?B?Q2k5cWxpS2pVc3ZwVndHTklhMENnSlZFWm5hREtBQjZLWFZUd1c3RmJGT2g4?=
 =?utf-8?B?cm5UbGxTbmg1OVppMEpLL3VaMEdpWWtNQXdIV1pNQk5iSjhwSGJnV2pvRUVp?=
 =?utf-8?B?VWUzQ0JIRHNydFRSWEwwRTJ5UGg1VmxJZjBtcGZ5Z3YxODRlakpuOVB0Z1gy?=
 =?utf-8?B?aG45Z0h3MnpFWlllcUpQNEQxTUYxMFpZb3JvUW9uaDhhUUVxL0VoclFvZnQz?=
 =?utf-8?B?VjhNRVd5T21XM3dpLzFGWllPaGFwQ1B1b3h6Mmw3cERqZEw3dTIyWmMxTHpl?=
 =?utf-8?B?UldTY2h6MVdkeTRRZTZramljZ243QlR0YzJkRjFWT0U5YkFpakpPUEpIbmUx?=
 =?utf-8?B?eCtjTlpPOXZSWFRZRWs4VC9SWUN4ei8xeEFObi9yRU1mZXN1MDdERlhWNnZx?=
 =?utf-8?B?MW04RHNGNWo1QU1ORDRrcEVVNmNqc0cxeE00SUN2WXAvWjl3OUVSQU9Ibm9N?=
 =?utf-8?B?NGR6RjVWOTQxWlRFb1dhcVhMNnpLYm9rNmlLbmhoVHB5eTZJRDMxeUx1SVJN?=
 =?utf-8?B?NGhYcGhkSzMra1BhVTFnRCtxS2lSS3dJc28wWnhQUFhKbXBlUVc3K0w3SDFq?=
 =?utf-8?B?bjRhU1llUXpiYmVvMXVHTFp0YVQzOEJYdEVVTEVnbm9sQWlMNE5CanIxc1cy?=
 =?utf-8?B?cjJnTCtKcS9PcFA0ZmpCVXVqTnRRazJSajFKTm5pS0VZQ1AyNmNKQzRUWGRH?=
 =?utf-8?B?MzVHaUR6eDIrL2c5bFNXckdtRTl6SFZMS0dMak9MM25wa1NsWnZIZ0FjTVNE?=
 =?utf-8?B?Y0tIMVVDRTlEQ2x3N2I4MkE5QUJwbExmUFREQS9nVWVoYTlxVDY0TE9TRzRj?=
 =?utf-8?B?dDFSZ1pjZVVFcm1qM0ROVm5SZmlMNlFyK3FHRndkMVlFd1l5Smo1ckJkZkl6?=
 =?utf-8?B?WWIwZVMzb0hSOXB2T01zajFXWktKdUtMYlVBTnZGS1RhWmk1NHJaV2YwQlJ2?=
 =?utf-8?B?QzJIbTUxdU4wdmVpTjZ3RnJJOTNIbzB5TmdNTENFNnpwMTM3eTJFaVJvSDA2?=
 =?utf-8?B?M2RmOXQ0aFBzYzQvckV3dTJZdkdpbWgxVXU0UWtJS2RoOEpEdGQ0RWlYNzlV?=
 =?utf-8?B?U2MyaStKbnc2SVVpZ2pWN2hFd2pRYU11ZDBtT2FmOGs1aG9sVGJRVHJZUE1P?=
 =?utf-8?B?Rlp1N3A4a1BXZXFyRVI3cHpQTjFtUmZXZDF0amlsckJhOXZNbHZrVFkxVnNZ?=
 =?utf-8?B?ZGFMcW1RWHlBVEc4QVhTc29aUjE5MGdKaGdyaXF0SnJqbFRmbXBXWHZac2la?=
 =?utf-8?B?anBMUlh4eUU2dXd6eUJFZEVORUUwUEZya0d5TGg4OWxOdUhYV3lWNFZDaU9R?=
 =?utf-8?B?Skl0Nks0Zy9JeFkra0RhWjdwZHBMbTFJekdKTnc5aWdMS1dlbWNpRVpOMUc1?=
 =?utf-8?B?d3dBQzl2bWZIZHZXSkJUbExqKzNmVkwzVHNWQVpQMVpxalM4NkFlN3NaM0g3?=
 =?utf-8?B?VC8yZ1FDVUVCUVdBVWZGclhveU5sbU15WnpqNTZ6UW5zdXgwQ1Z0MEUvRmtn?=
 =?utf-8?B?Zk5HMnBCNjk1Y1ROYzBVdHhmN3h0ZnM3TGl3UlN4MHVYUm05RDlLc2I1VldC?=
 =?utf-8?B?QzR5b3F6dTNic1lualk1Qnd2emVQT3Q5MnUvQ3NCbWpzd3ZRcys0ZGtScFY1?=
 =?utf-8?B?SkJkRDdudWpoZzlMdkx2WnYzVkduNDgvcmcxU09WdDloUktBeWx4dWkvSkNy?=
 =?utf-8?B?WXU4eGR6Vk1HelM4dHl4dGUvVUJ2VHkva05QZENzenVrdmVHbVBEQ2pNd21V?=
 =?utf-8?B?V01RaHdvSE5KczZYMGVMMmJqSXU4aS9kU3FLc004eXhRckVrN050RE9vL3RH?=
 =?utf-8?B?RHRCbEw0ZFlWUVNybjFKMVUyQUtPQ1hXSGcyckxDSFk4R1ZLTndlV09OQnJw?=
 =?utf-8?B?RjFmcU5mcTlvL1p6VnBOckNlZE5PVCtaV3NvUkRxcjVpempGUVBFTWxJVXp4?=
 =?utf-8?B?SHdHcytMTnZ4aER6cnlXQ2xiNUJBVm5vSVUrSzZVbnlDN3ZFWko3cmIvTlFw?=
 =?utf-8?B?aGt1ZVZianpaZzJ3ejFqY1g0MDRwcXVpNVVpTGxWWW1hUEdSNDkzUm5Dci9L?=
 =?utf-8?B?dk94RzhBVFBCdThrYTdlNlVuTVFkSEZ2UUptMThJNmZJYU93MUlkTGUxZmR3?=
 =?utf-8?Q?3SgbTzQ/QR1SxWNCK4pZbIDKuSR7k5YGaZSK3xlQhRpIb?=
X-MS-Exchange-AntiSpam-MessageData-1: GcguKgxreFpdQg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdc73316-d916-476c-703f-08de535fe040
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 11:27:18.4504
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: inH2HVmpZQ33iSKK0wxnm5XSjXxYp8NLOe6rSpwOeO1MTKBZYqFiNMrwSBnz1TpJq5SyPT/C9QWntPQCoGsJDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7009

Hi Mark, Rob,

On 13/01/2026 17:51, Mark Brown wrote:
> On Thu, 08 Jan 2026 14:31:55 +0000, Jon Hunter wrote:
>> This series includes fixes for the realtek,rt5640 dt-binding to address
>> a few warnings that are observed when running the CHECK_DTBS=y for some
>> DTBs that use this codec.
>>
>> Jon Hunter (3):
>>    ASoC: dt-bindings: realtek,rt5640: Document mclk
>>    ASoC: dt-bindings: realtek,rt5640: Update jack-detect
>>    ASoC: dt-bindings: realtek,rt5640: Document port node
>>
>> [...]
> 
> Applied to
> 
>     https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
> 
> Thanks!
> 
> [1/3] ASoC: dt-bindings: realtek,rt5640: Document mclk
>        commit: 66b47b9c069fa548db64bde6a32d3b33aa05f740
> [2/3] ASoC: dt-bindings: realtek,rt5640: Update jack-detect
>        commit: 25b858474497b5f7e2198f6fc9381488d9bdb55d
> [3/3] ASoC: dt-bindings: realtek,rt5640: Document port node
>        commit: b540b4e157c4b24d0501e5e50ffba598d066de42

I noticed on today's -next I am getting the following error when running
the dtbs_check ...

  Documentation/devicetree/bindings/sound/realtek,rt5640.yaml: ignoring, error parsing file

It appears that Rob also has merged similar fixes to the above and now
we have two lots of fixes merged and duplicated properties ...

  bc5a847a80d4 ASoC: dt-bindings: realtek,rt5640: Various fixes
  f66e7da2a6b1 ASoC: dt-bindings: realtek,rt5640: Allow 7 for realtek,jack-detect-source
  101b982654ac ASoC: dt-bindings: realtek,rt5640: Add missing properties/node
  b540b4e157c4 ASoC: dt-bindings: realtek,rt5640: Document port node
  25b858474497 ASoC: dt-bindings: realtek,rt5640: Update jack-detect
  66b47b9c069f ASoC: dt-bindings: realtek,rt5640: Document mclk

So we need to drop one set of fixes from one of the trees.

Thanks
Jon

-- 
nvpublic

