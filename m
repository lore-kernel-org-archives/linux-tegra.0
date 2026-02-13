Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011002.outbound.protection.outlook.com [40.107.208.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402705C613;
	Fri, 13 Feb 2026 03:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770954263; cv=fail; b=Vqdieek+511ONtuQ+8q00i/7zMLElaDZKlZYla349dM9HAyGoJDPXSruid/CjnJdrWG3U6JaQALMDrSuIZXfxl92KjOcL9eZPF31ZXyQj0kZCjM3iBXLx7l71O6aPphIMxW0lQlcejr2Jc4PBpvUA/d25rBUDTqvmkp7y8k4dis=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770954263; c=relaxed/simple;
	bh=3ThyQ8kwcl7J2hPCZZ4qkQHwjT/XTQNM/82MZ5Hm2U4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZWkbBoYg8gjWJwJWl0EExxnHSv3bLo6QPyA441ylGlPv5Ddg+7QyDIuIDst9dVGoLIFOPObFywmyhsiz2/gpy3Z3QPACTgbZ3jG+CovJ/78hqLK7Sd20N6qq18h0CGhKXHFq2H1xWh6jT4NHVdNNieoxVLb4Bg4b1a71ep7FYSY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Y6JSrzp+; arc=fail smtp.client-ip=40.107.208.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Y6JSrzp+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=imtEuPiUrpUzSLo3m/vtJz4Ws0b5t4N5SnkGvdNNF0CJDekjpFOPRxYmlxO0BELRiHP5UKBWOc2QHcLKnhRw/otQfZUergNK/+7afTQqVwQ9CLWUcozqBqLKYq2j9hjvmWm2ttTNA1QRu+7I0Ux2vd4o6FOKoEADaHeMbOW6EvCKkMAwSUKwgxeVW5QcLT84gwhXg3+Yx7DeX2VWG+7oazXN+org2h6RCqmNy9C6YOyqFLokKA9fZXx8wTMPUEM3CKDC7g0M0kxG0dCeeOZbcyjY4/1JCBJPklfcz907KsJiGbsyRVleoiBPHCf3J4NZlFu2IA0w16qE0sRsZ0ouzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AKyPNIKP5IMW8fKxVrqTW+ThmdhQnqCJuVRBRA9WFz8=;
 b=AwUrGAMEzXooJvIU7d2uwk2tuD6C/ACV4claKvE+4gpzGC8Sb22CAwes3mBYTW0+FqdX52gTZBLBY99xV3+81CMXkj5joHNAzN9gt+zzrEanpflm5f4lRCpR0EaIYKIIWVg0vU/vASWFmNb2ajhsChlQLFvGCfArx+7ASonKWtw0xPZ4IYByfegHh263bi891Z3jOhpB95CmvKVUbYxpySwGbTKVCHN/hSPMLgQvzZzbXH3WKNMk8bD/AF/ebetxS8nFx9B+KNryox82+fGen53a09kDdrQzMJAjHPptWrK0agAJjOyKH0LyQCw0il4GUIk06mrVauQ5tt44iOaGXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AKyPNIKP5IMW8fKxVrqTW+ThmdhQnqCJuVRBRA9WFz8=;
 b=Y6JSrzp+CE/3L75kxMpAJ/RVBdmbkBpQGbSXULun2T0UB1EQRGofVT8li+2LAH7/I8fvsR/6e/uTO45gtgzNhfdMBWAo60FVmQblv/NQGZD1To0GAqOj0BmynOYn6abHvrv5DvCZIZBjsptFdIJJuUhnYjefRL1yQvwDzz4zyYc7FMedFWGhddq2oqjkCa7JOMxq5h7BoNrgNQ/LXBl179+bBe5EAkZc4lHfCh5KfcqWL0l7aIB+gPwg1orfW6ThK1LuGuMx6nX+Q9UP+2U8tsCxjmvLfeAiK/VUhCxiurP1fFF1doHRgNKYXs4i23SjE0YLbxdXGYjam7R6b4kMRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by BY5PR12MB4305.namprd12.prod.outlook.com (2603:10b6:a03:213::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 13 Feb
 2026 03:44:08 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%4]) with mapi id 15.20.9611.008; Fri, 13 Feb 2026
 03:44:07 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 5/5] ARM: tegra: configure Tegra114 power domains
Date: Fri, 13 Feb 2026 12:44:03 +0900
Message-ID: <3152548.Lt9SDvczpP@senjougahara>
In-Reply-To: <20260126191536.78829-6-clamor95@gmail.com>
References:
 <20260126191536.78829-1-clamor95@gmail.com>
 <20260126191536.78829-6-clamor95@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCPR01CA0191.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::16) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|BY5PR12MB4305:EE_
X-MS-Office365-Filtering-Correlation-Id: 3620a59e-7b5b-4b5f-bb91-08de6ab2239f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d2VPVzljUXFlbVlnNW1zeTQrSG5wdEFLM01XZndqdW05RzlrS1lmay9Rd3Vl?=
 =?utf-8?B?M0NGUktzbE0wakNLak9pYzczb1RsKzMyTTlScmFCVTZzNEYyd2ZIQ3ByRGdn?=
 =?utf-8?B?bGRiR2lmWU9Kem1WL2cvcDhMQWJmR2Z0K2VzdFlEQVljQ2lXRnBBM1Q4RDhT?=
 =?utf-8?B?d2tUb05tS0hQVE9MNTVSTmJSSDZjeks5cGhJa24rOTQxNVc3dEl2aWlmWm5Y?=
 =?utf-8?B?NUpCMGRNQ3pFRDFhYTBvYVlwSE56bithV3pXdkpFUDJUb09SQVhGbkpSSlVI?=
 =?utf-8?B?MGZKZFUyRkk3Q2wzbUwrKys2Mkp4R1UwVWF2TjRXT0hZZC9UckwySVBWbW1w?=
 =?utf-8?B?bk1jKzYyVXdob1haZ3JqMTVGUmNZU2F1R2ttdWNHNEdyQ01lT1RRb0RQUFkx?=
 =?utf-8?B?U0huT0xsVlBEb24zeG9sNUwwWmtwQWhRNlZDaDNnM2hsUG1DVGlwcXZYNzdy?=
 =?utf-8?B?dW50NkFKN2JEOTRPWGxDWGFtTnRFMXZFay82TnE2aFpYMWlnNXl2ZTRNNFBz?=
 =?utf-8?B?dStjN3pNY1BINm9WYWtsWmVDYnJiUi9NdEhMYmQ5RDQ1ang3eExybDlvbkJU?=
 =?utf-8?B?YklNcTNHNWo0aFo1bFQ4RFM1Q3dJL01BOXIvcmhnRXZ2U0grYUxOdXU4aTVQ?=
 =?utf-8?B?TGpDUmQzSmFKR1RLNzJTNEN2ekMrODdRT29MQ05Ya3hpQVhUUWlLQ1RWaEd1?=
 =?utf-8?B?T0JPZlpNVDZ0Q29mTWQzRWVxQUlYZnlFc0IxRWRabGM4UjIyOVFVT3FDcUVa?=
 =?utf-8?B?S2lKbEdDR0Z6Tzh5ZGhZL2h2bEQva1Q5WGZabE9SeHI1SWZPaVJ3am4vbENS?=
 =?utf-8?B?b2FJQkhCcEdOV0xGSEtJRGFEZnRKOEJaVXJsK1ZwTExrV3pzZU1SeGI2UXNM?=
 =?utf-8?B?b1BnbDZUR3JpZnV2UEpUSzJEUEFOcUgxdUdTWjFab0dKZmhrRUJQOXFHTVpU?=
 =?utf-8?B?dzkrclA2SDROL1hDdVpKcjhWaXNySjg5RHpqYWlSOS9wT205L015b2UyQnlk?=
 =?utf-8?B?azBwMlR2M3JSdnA0QVB5cmpFZStOWU1NdlpxYTlrZFZtQkpsUUpUc0gxSWk0?=
 =?utf-8?B?QWJSS3hCTlFpVFB2VE1GQ1gvWlA0SElGL1Vqa3lzcE1lZmMvdTdSK1RPT1Qz?=
 =?utf-8?B?K1VPZlZzYWRKcys1dmR6NDh5NldLVFpQYnhpSzdBc2UwelQyUUMvRHc2a0dV?=
 =?utf-8?B?OXJvUEtlTzNsd3NFdHc5QnlzRlM1WmtaWkhUK1VhUjVqditlM0FwQmVCZnBK?=
 =?utf-8?B?VjBZU2pNYSs5Z3pYQjBZMFRlUGN3SzN1UCt3M2VEOTdYR3VyQS9IZUlVU0tx?=
 =?utf-8?B?QWdxVFd3S1hpazZiQW80bC9Vc2JXclZWM1NyZ3hNRHpHQTZhdnpRSVloU3d3?=
 =?utf-8?B?TFl6MTdyMEc0dU83TnFHcnlHbDJNQ0VPdmZ5YWtMU1RmVXRwczZZMzBnaTMy?=
 =?utf-8?B?d1cxM2NsZVVCS2lIQUFnNjZiM1JxL2oyR1V1WnowemFVeGsrS1V0SE1PeW9n?=
 =?utf-8?B?N1VuZktZUEVPeWxaTkhYMkNycGJxbVJRZlhUVXFxczVNL09JK1NnUm85NzZj?=
 =?utf-8?B?dXljL2ZhcEdkUUxuWXplRkNwZ2srNCtUUlo3Yk1xckxXbWVJRGlUQ3lUWUxS?=
 =?utf-8?B?b2YwM1VaVlJuMHBQY3JKQndhMVpoYXI5RG85UElZdnc5VTl2QVVZNFd5TUtp?=
 =?utf-8?B?Mm1xd1BvaVYvMUROQTFSYm5UazlXZzBVeEdXWXZ1K0drUERlNnNZMnpVSVh4?=
 =?utf-8?B?RjZOb3RxODI2ajdlR1E2RSs2VitFRWJCMHk0NVdsUWVJS2RkclozZjUwN2pX?=
 =?utf-8?B?YjhNMk05UHU5Vy9uekFKSU04V2VsdUEzalllb3NPRFJEazFqa2VWc2lWaVdm?=
 =?utf-8?B?SFUvV1VUUmMzT0g5UVlxWEJncGFSVU5OWlBaUVdGUC9leTBseWh1dUlTbm5s?=
 =?utf-8?B?Uy95VFZUZ1FScXAwMG9pWmdJZ0haNkIrY0dPMnIwMUJGWW0rODkrZkhSU0xI?=
 =?utf-8?B?V2s0a3cvSHJmTVcwSHNVMTNQbVZja1M3MGlyV2hodEEvN3FHZG5YY1MvSTcr?=
 =?utf-8?B?QVlJNDRLVGs4ZlpENU5GUGdHRGpmWXpFNzlkL3gzMzdnM0w5dWxadnNKNHdQ?=
 =?utf-8?Q?U+bQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dnlMMUp3bldiK09zaXlOREl6ajBDR3dNVm9tNjNJQnhHdXY0QVdUV1V3WUlD?=
 =?utf-8?B?Rk9QamRwY00xdTcza1J6TENZRW1pbVBBS1NDZjV1TWlUVU1YRHk4U3dOSCtl?=
 =?utf-8?B?bGNPWW42ZWpZWjV6LzBCL0hoc0wzM2RZM0lKMUFVd2FHRzNwaDBtUXNTUEZT?=
 =?utf-8?B?Z20zOW8wQ3V2TWljV2ltYWZwdTVSOWIrUGFPalJZcXhmUld6OEx3U0lVUW9Y?=
 =?utf-8?B?SFNCNFhEeVNFbHlSeTZlWkVUTHFDS2ZNRUlYQlh6Q3VweUNaditiVFJ0Mzd5?=
 =?utf-8?B?YVh0aCs4Q21heEsvOGdyM2JETi92bW1jZHJyTDdlZ1gvNnJHbG5hL1NyRTVX?=
 =?utf-8?B?RHk5N2EvSStoOXo0eEtUUkUwemxpZWxkdnFqWnppOVQrNjcrMEUzRy9DQzQz?=
 =?utf-8?B?Vm1LbDVZaTdoeTI0L0J2dmpYc0dLWUlhK1crU0RWTkMra0NaSkI3SWJVREJy?=
 =?utf-8?B?clhhR0Z6N2hlb2RJS2VYcHpPRW1zSXp5V0NWQjZnZUNJTzZXTzhBRmxzcTNu?=
 =?utf-8?B?dTJkcWFYcFdxQVlndm1VVXRGTDl4Q0VRQ1djRWNUR2ZYSVNpTFNJb3VtR3VU?=
 =?utf-8?B?NHVFNUE0MEVhQnI0ME9CNnJOcEs3RVdiam84ZjNFTE15b3l0SzcwL2Y3QVpz?=
 =?utf-8?B?b096QUZ2NWVtbGxTR3NIV2hGd0dJZllMRkpRdGM0MkYvSzkzVG4xZDlnaDk3?=
 =?utf-8?B?TFRIR1UyeTk4WFJ4VEpaTzBLZkxWRE8rb2QwakhUUUhnMkxrL0pxRXlOVmpa?=
 =?utf-8?B?WjhCZXVjTmtEdmluS0hOZUhESEpmNzZ4SnpOUWlFbS9ZUWpUemQ3SEQ1eWZz?=
 =?utf-8?B?VWdVOTFFOGpYQVB6aGpnTWJ2UG5ET244VDdaREFTeUlnN24rZG8yRGxuN2N3?=
 =?utf-8?B?ZmhHOUJZVzdOeHBRczRuQnJwYUcxamJNWVN1TVJPTkhUdTlmUTNSZGFGOHpF?=
 =?utf-8?B?djBGYVJkK2hMRmpQdUtQeWxrQ3ZtN3JpaytPSGt5YXB2L3RWTmVYalIybGw0?=
 =?utf-8?B?VXhCeDhTY0RoeWdOSzBkT3J4WVR2b3NxNC9DTFh2YmlKVnp2RE9TZWkwT2xw?=
 =?utf-8?B?T0hLckVTSDEwQWVIakRpaUIwMXYrMUx4M01uYUhrTzAvU21zL0dhN2oyZm5N?=
 =?utf-8?B?TkdGZmZrWmkvc1NneXBwZGxPQjlMR3VrNnlTcTRqVXVGWUJkd1ErYTdpczVt?=
 =?utf-8?B?L09KMU9nSzdYSEpTMTVyUlJtaHJLd1JkNHVwbzZuaDVVb0h4VGVjVnZ5Q2Rl?=
 =?utf-8?B?RS93b0NQRG9OYzhaYmNOVWZZYVkyL0F3aVMwK3VCNndFaTVteHpockt2VHla?=
 =?utf-8?B?SFZLbnhLMWswOWdycXpnTWx2OG9XM0poTVE5MFR0YmUrUXR6ZXltTzNVVVVQ?=
 =?utf-8?B?SzBaSXFWbmhyd3hrN2xoRFNiSlFnZ2xSQ2lqdVAwS1pLVnduOEVKajFXZUd4?=
 =?utf-8?B?cmZ6djdFbERCVktzblNpNVNLNGVjZmVNOFVyRFNUenNaNThqRTBrVGZMK2hy?=
 =?utf-8?B?ekdNUTMvTDlLZ0NEaHlZbkVZNFhwdG9FUTBUWmJ3d0llK1NUeE0xckFubWtI?=
 =?utf-8?B?SndLcWxuSVltNUJNemZCZ1ljNHkxRlkzOSs4Tjg2WFI5bEJNamdyQ0ZwWFgv?=
 =?utf-8?B?SmM2M1RhS3ZZWFU5VHR3enFnTFZhaitsRlJHb2RmVzlSMm1PQWFvbGxqNHo4?=
 =?utf-8?B?QlNvZU1OTjRLbjJkTDlFOEtUK29OZzNhNUhNQVJHTlZhQ0FjcDhlSlhzOUta?=
 =?utf-8?B?VlBYS2JjOEpWNGg4Q0p6NU9HS2ZZOVFjaGVSVTlNVW04UjJTY0h3Q1FPcHBQ?=
 =?utf-8?B?czVhYnFkMFRoUnlhVThhNmZRemxmVjQyL1BKdFdrUFFvY2xzcks0SjR5Q1pr?=
 =?utf-8?B?RUNoVkREZnY3cStwWWQ5Szd2MC8zWWxyTmNZRlI0QXNJM0F4NzJWUnFqQXZW?=
 =?utf-8?B?STdtN2NOUXlWeWtHVTRaZXJFUnlSNy9LUng5dmZ5RzBoRS9HTHNjUUlPVkVJ?=
 =?utf-8?B?dTloS1M1N0RGNTNXL2xkVzdCN0VUTGFwNUZOODloekNRbGtxNmRza1d3ZWJx?=
 =?utf-8?B?Sm5TK0RVQlJjYURIWk4rVzhQaFVGYWc0dVlWNCtZckRFZXE0U2tXZ3lmUjg1?=
 =?utf-8?B?WFhsM0I4UGlSaURudUFnRTN2QnArcVF3OVJucnQ0YkpYQ2NmM2x2RndtRFJh?=
 =?utf-8?B?ZjBzVU55TDAweUd0cnlrcWxuMHlVUkZVajBqUDRTYzZGOGlUekRndWYwZGcy?=
 =?utf-8?B?Rzc5dUw5alF0WWh6Mkd6ei9KaEJvN2tqWlZhcVVRS1BRdUtER3oxYlhjeDZW?=
 =?utf-8?B?Uzc5SXZhSnFBaGJpcG9nZnljdDFBbUR2T3pqZTl4eEJuY1dBMlNHOGVZL0ZR?=
 =?utf-8?Q?DI5oYZbOUQlJ+vh4KI2qDG+OQz3RiFCRVwvIUJGkn1BT/?=
X-MS-Exchange-AntiSpam-MessageData-1: ahwRdb9jvEQ2hA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3620a59e-7b5b-4b5f-bb91-08de6ab2239f
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 03:44:06.9926
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +e7R899gie2LS3rU1+pL7xHaDfJfjBEAXMJccV4+yHE36PaQO5RmWzewSw2AAoTajNqccnBdTB44G/9ylWGdYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4305

On Tuesday, January 27, 2026 4:15=E2=80=AFAM Svyatoslav Ryhel wrote:
> Add power domains found in Tegra114 and configure operating-points-v2 for
> supported devices accordingly.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../dts/nvidia/tegra114-peripherals-opp.dtsi  | 1275 +++++++++++++++++
>  arch/arm/boot/dts/nvidia/tegra114.dtsi        |  126 ++
>  2 files changed, 1401 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/nvidia/tegra114-peripherals-opp.dtsi b/arc=
h/arm/boot/dts/nvidia/tegra114-peripherals-opp.dtsi
> index b40a1c24abab..5e66c1dc8fb7 100644
> --- a/arch/arm/boot/dts/nvidia/tegra114-peripherals-opp.dtsi
> +++ b/arch/arm/boot/dts/nvidia/tegra114-peripherals-opp.dtsi
> @@ -1,6 +1,76 @@
>  // SPDX-License-Identifier: GPL-2.0
> =20
>  / {
> +	core_opp_table: opp-table-core {
> +		compatible =3D "operating-points-v2";
> +		opp-shared;
> +
> +		core_opp_900: opp-900000 {
> +			opp-microvolt =3D <900000 900000 1390000>;
> +			opp-level =3D <900000>;
> +		};
> +
> +		core_opp_950: opp-950000 {
> +			opp-microvolt =3D <950000 950000 1390000>;
> +			opp-level =3D <950000>;
> +		};
> +
> +		core_opp_1000: opp-1000000 {
> +			opp-microvolt =3D <1000000 1000000 1390000>;
> +			opp-level =3D <1000000>;
> +		};
> +
> +		core_opp_1050: opp-1050000 {
> +			opp-microvolt =3D <1050000 1050000 1390000>;
> +			opp-level =3D <1050000>;
> +		};
> +
> +		core_opp_1100: opp-1100000 {
> +			opp-microvolt =3D <1100000 1100000 1390000>;
> +			opp-level =3D <1100000>;
> +		};
> +
> +		core_opp_1120: opp-1120000 {
> +			opp-microvolt =3D <1120000 1120000 1390000>;
> +			opp-level =3D <1120000>;
> +		};
> +
> +		core_opp_1150: opp-1150000 {
> +			opp-microvolt =3D <1150000 1150000 1390000>;
> +			opp-level =3D <1150000>;
> +		};
> +
> +		core_opp_1170: opp-1170000 {
> +			opp-microvolt =3D <1170000 1170000 1390000>;
> +			opp-level =3D <1170000>;
> +		};
> +
> +		core_opp_1200: opp-1200000 {
> +			opp-microvolt =3D <1200000 1200000 1390000>;
> +			opp-level =3D <1200000>;
> +		};
> +
> +		core_opp_1250: opp-1250000 {
> +			opp-microvolt =3D <1250000 1250000 1390000>;
> +			opp-level =3D <1250000>;
> +		};
> +
> +		core_opp_1300: opp-1300000 {
> +			opp-microvolt =3D <1300000 1300000 1390000>;
> +			opp-level =3D <1300000>;
> +		};
> +
> +		core_opp_1350: opp-1350000 {
> +			opp-microvolt =3D <1350000 1350000 1390000>;
> +			opp-level =3D <1350000>;
> +		};
> +
> +		core_opp_1390: opp-1390000 {
> +			opp-microvolt =3D <1390000 1390000 1390000>;
> +			opp-level =3D <1390000>;
> +		};
> +	};
> +
>  	emc_icc_dvfs_opp_table: opp-table-emc {
>  		compatible =3D "operating-points-v2";
> =20
> @@ -8,36 +78,42 @@ opp-12750000-900 {
>  			opp-microvolt =3D <900000 900000 1390000>;
>  			opp-hz =3D /bits/ 64 <12750000>;
>  			opp-supported-hw =3D <0x000F>;
> +			required-opps =3D <&core_opp_900>;
>  		};
> =20
>  		opp-20400000-900 {
>  			opp-microvolt =3D <900000 900000 1390000>;
>  			opp-hz =3D /bits/ 64 <20400000>;
>  			opp-supported-hw =3D <0x000F>;
> +			required-opps =3D <&core_opp_900>;
>  		};
> =20
>  		opp-40800000-900 {
>  			opp-microvolt =3D <900000 900000 1390000>;
>  			opp-hz =3D /bits/ 64 <40800000>;
>  			opp-supported-hw =3D <0x000F>;
> +			required-opps =3D <&core_opp_900>;
>  		};
> =20
>  		opp-68000000-900 {
>  			opp-microvolt =3D <900000 900000 1390000>;
>  			opp-hz =3D /bits/ 64 <68000000>;
>  			opp-supported-hw =3D <0x000F>;
> +			required-opps =3D <&core_opp_900>;
>  		};
> =20
>  		opp-102000000-900 {
>  			opp-microvolt =3D <900000 900000 1390000>;
>  			opp-hz =3D /bits/ 64 <102000000>;
>  			opp-supported-hw =3D <0x000F>;
> +			required-opps =3D <&core_opp_900>;
>  		};
> =20
>  		opp-204000000-900 {
>  			opp-microvolt =3D <900000 900000 1390000>;
>  			opp-hz =3D /bits/ 64 <204000000>;
>  			opp-supported-hw =3D <0x000F>;
> +			required-opps =3D <&core_opp_900>;
>  			opp-suspend;
>  		};
> =20
> @@ -45,12 +121,14 @@ opp-312000000-1000 {
>  			opp-microvolt =3D <1000000 1000000 1390000>;
>  			opp-hz =3D /bits/ 64 <312000000>;
>  			opp-supported-hw =3D <0x000F>;
> +			required-opps =3D <&core_opp_1000>;
>  		};
> =20
>  		opp-408000000-1000 {
>  			opp-microvolt =3D <1000000 1000000 1390000>;
>  			opp-hz =3D /bits/ 64 <408000000>;
>  			opp-supported-hw =3D <0x000F>;
> +			required-opps =3D <&core_opp_1000>;
>  		};
> =20
>  		/*
> @@ -64,24 +142,28 @@ opp-528000000-1100 {
>  			opp-microvolt =3D <1100000 1100000 1390000>;
>  			opp-hz =3D /bits/ 64 <528000000>;
>  			opp-supported-hw =3D <0x000F>;
> +			required-opps =3D <&core_opp_1100>;
>  		};
> =20
>  		opp-624000000-1100 {
>  			opp-microvolt =3D <1100000 1100000 1390000>;
>  			opp-hz =3D /bits/ 64 <624000000>;
>  			opp-supported-hw =3D <0x000F>;
> +			required-opps =3D <&core_opp_1100>;
>  		};
> =20
>  		opp-792000000-1100 {
>  			opp-microvolt =3D <1100000 1100000 1390000>;
>  			opp-hz =3D /bits/ 64 <792000000>;
>  			opp-supported-hw =3D <0x000F>;
> +			required-opps =3D <&core_opp_1100>;
>  		};
> =20
>  		opp-900000000-1200 {
>  			opp-microvolt =3D <1200000 1200000 1390000>;
>  			opp-hz =3D /bits/ 64 <900000000>;
>  			opp-supported-hw =3D <0x000E>;
> +			required-opps =3D <&core_opp_1200>;
>  		};
>  	};
> =20
> @@ -161,4 +243,1197 @@ opp-900000000 {
>  			opp-peak-kBps =3D <14400000>;
>  		};
>  	};
> +
> +	vi_dvfs_opp_table: opp-table-vi {
> +		compatible =3D "operating-points-v2";
> +
> +		opp-114000000-900 {
> +			opp-microvolt =3D <900000 900000 1390000>;
> +			opp-hz =3D /bits/ 64 <114000000>;
> +			opp-supported-hw =3D <0x000F>;
> +			required-opps =3D <&core_opp_900>;
> +		};
> +
> +		opp-216000000-950 {
> +			opp-microvolt =3D <950000 950000 1390000>;
> +			opp-hz =3D /bits/ 64 <216000000>;
> +			opp-supported-hw =3D <0x000F>;
> +			required-opps =3D <&core_opp_950>;
> +		};
> +
> +		opp-240000000-1000 {
> +			opp-microvolt =3D <1000000 1000000 1390000>;
> +			opp-hz =3D /bits/ 64 <240000000>;
> +			opp-supported-hw =3D <0x000F>;
> +			required-opps =3D <&core_opp_1000>;
> +		};
> +
> +		opp-312000000-1050 {
> +			opp-microvolt =3D <1050000 1050000 1390000>;
> +			opp-hz =3D /bits/ 64 <312000000>;
> +			opp-supported-hw =3D <0x0001>;
> +			required-opps =3D <&core_opp_1050>;
> +		};
> +
> +		opp-372000000-1100 {
> +			opp-microvolt =3D <1100000 1100000 1390000>;
> +			opp-hz =3D /bits/ 64 <372000000>;
> +			opp-supported-hw =3D <0x0001>;
> +			required-opps =3D <&core_opp_1100>;
> +		};
> +
> +		opp-408000000-1050 {
> +			opp-microvolt =3D <1050000 1050000 1390000>;
> +			opp-hz =3D /bits/ 64 <408000000>;
> +			opp-supported-hw =3D <0x000E>;
> +			required-opps =3D <&core_opp_1050>;
> +		};
> +
> +		opp-408000000-1120 {
> +			opp-microvolt =3D <1120000 1120000 1390000>;
> +			opp-hz =3D /bits/ 64 <408000000>;
> +			opp-supported-hw =3D <0x000F>;
> +			required-opps =3D <&core_opp_1120>;
> +		};
> +	};
> +
> +	epp_dvfs_opp_table: opp-table-epp {
> +		compatible =3D "operating-points-v2";
> +
> +		opp-192000000-900 {
> +			opp-microvolt =3D <900000 900000 1390000>;
> +			opp-hz =3D /bits/ 64 <192000000>;
> +			opp-supported-hw =3D <0x0001>;
> +			required-opps =3D <&core_opp_900>;
> +		};
> +
> +		opp-240000000-900 {
> +			opp-microvolt =3D <900000 900000 1390000>;
> +			opp-hz =3D /bits/ 64 <240000000>;
> +			opp-supported-hw =3D <0x000E>;
> +			required-opps =3D <&core_opp_900>;
> +		};
> +
> +		opp-228000000-950 {
> +			opp-microvolt =3D <950000 950000 1390000>;
> +			opp-hz =3D /bits/ 64 <228000000>;
> +			opp-supported-hw =3D <0x0001>;
> +			required-opps =3D <&core_opp_950>;
> +		};
> +
> +		opp-300000000-950 {
> +			opp-microvolt =3D <950000 950000 1390000>;
> +			opp-hz =3D /bits/ 64 <300000000>;
> +			opp-supported-hw =3D <0x000E>;
> +			required-opps =3D <&core_opp_950>;
> +		};
> +
> +		opp-300000000-1000 {
> +			opp-microvolt =3D <1000000 1000000 1390000>;
> +			opp-hz =3D /bits/ 64 <300000000>;
> +			opp-supported-hw =3D <0x0001>;
> +			required-opps =3D <&core_opp_1000>;
> +		};
> +
> +		opp-384000000-1000 {
> +			opp-microvolt =3D <1000000 1000000 1390000>;
> +			opp-hz =3D /bits/ 64 <384000000>;
> +			opp-supported-hw =3D <0x000E>;
> +			required-opps =3D <&core_opp_1000>;
> +		};
> +
> +		opp-396000000-1050 {
> +			opp-microvolt =3D <1050000 1050000 1390000>;
> +			opp-hz =3D /bits/ 64 <396000000>;
> +			opp-supported-hw =3D <0x0001>;
> +			required-opps =3D <&core_opp_1050>;
> +		};
> +
> +		opp-468000000-1050 {
> +			opp-microvolt =3D <1050000 1050000 1390000>;
> +			opp-hz =3D /bits/ 64 <468000000>;
> +			opp-supported-hw =3D <0x000E>;
> +			required-opps =3D <&core_opp_1050>;
> +		};
> +
> +		opp-492000000-1100 {
> +			opp-microvolt =3D <1100000 1100000 1390000>;
> +			opp-hz =3D /bits/ 64 <492000000>;
> +			opp-supported-hw =3D <0x0001>;
> +			required-opps =3D <&core_opp_1100>;
> +		};
> +
> +		opp-528000000-1100 {
> +			opp-microvolt =3D <1100000 1100000 1390000>;
> +			opp-hz =3D /bits/ 64 <528000000>;
> +			opp-supported-hw =3D <0x000E>;
> +			required-opps =3D <&core_opp_1100>;
> +		};
> +
> +		opp-516000000-1120 {
> +			opp-microvolt =3D <1120000 1120000 1390000>;
> +			opp-hz =3D /bits/ 64 <516000000>;
> +			opp-supported-hw =3D <0x0001>;
> +			required-opps =3D <&core_opp_1120>;
> +		};
> +
> +		opp-564000000-1120 {
> +			opp-microvolt =3D <1120000 1120000 1390000>;
> +			opp-hz =3D /bits/ 64 <564000000>;
> +			opp-supported-hw =3D <0x000E>;
> +			required-opps =3D <&core_opp_1120>;
> +		};
> +
> +		opp-552000000-1170 {
> +			opp-microvolt =3D <1170000 1170000 1390000>;
> +			opp-hz =3D /bits/ 64 <552000000>;
> +			opp-supported-hw =3D <0x0001>;
> +			required-opps =3D <&core_opp_1170>;
> +		};
> +
> +		opp-600000000-1170 {
> +			opp-microvolt =3D <1170000 1170000 1390000>;
> +			opp-hz =3D /bits/ 64 <600000000>;
> +			opp-supported-hw =3D <0x000E>;
> +			required-opps =3D <&core_opp_1170>;
> +		};
> +
> +		opp-600000000-1250 {
> +			opp-microvolt =3D <1250000 1250000 1390000>;
> +			opp-hz =3D /bits/ 64 <600000000>;
> +			opp-supported-hw =3D <0x0001>;
> +			required-opps =3D <&core_opp_1250>;
> +		};
> +
> +		opp-636000000-1200 {
> +			opp-microvolt =3D <1200000 1200000 1390000>;
> +			opp-hz =3D /bits/ 64 <636000000>;
> +			opp-supported-hw =3D <0x000E>;
> +			required-opps =3D <&core_opp_1200>;
> +		};
> +
> +		opp-672000000-1250 {
> +			opp-microvolt =3D <1250000 1250000 1390000>;
> +			opp-hz =3D /bits/ 64 <672000000>;
> +			opp-supported-hw =3D <0x000E>;
> +			required-opps =3D <&core_opp_1250>;
> +		};
> +
> +		opp-828000000-1390 {
> +			opp-microvolt =3D <1390000 1390000 1390000>;
> +			opp-hz =3D /bits/ 64 <828000000>;
> +			opp-supported-hw =3D <0x000E>;
> +			required-opps =3D <&core_opp_1390>;
> +		};
> +	};
> +
> +	gr2d_dvfs_opp_table: opp-table-gr2d {
> +		compatible =3D "operating-points-v2";
> +
> +		opp-192000000-900 {
> +			opp-microvolt =3D <900000 900000 1390000>;
> +			opp-hz =3D /bits/ 64 <192000000>;
> +			opp-supported-hw =3D <0x0001>;
> +			required-opps =3D <&core_opp_900>;
> +		};
> +
> +		opp-240000000-900 {
> +			opp-microvolt =3D <900000 900000 1390000>;
> +			opp-hz =3D /bits/ 64 <240000000>;
> +			opp-supported-hw =3D <0x000E>;
> +			required-opps =3D <&core_opp_900>;
> +		};
> +
> +		opp-228000000-950 {
> +			opp-microvolt =3D <950000 950000 1390000>;
> +			opp-hz =3D /bits/ 64 <228000000>;
> +			opp-supported-hw =3D <0x0001>;
> +			required-opps =3D <&core_opp_950>;
> +		};
> +
> +		opp-300000000-950 {
> +			opp-microvolt =3D <950000 950000 1390000>;
> +			opp-hz =3D /bits/ 64 <300000000>;
> +			opp-supported-hw =3D <0x000E>;
> +			required-opps =3D <&core_opp_950>;
> +		};
> +
> +		opp-300000000-1000 {
> +			opp-microvolt =3D <1000000 1000000 1390000>;
> +			opp-hz =3D /bits/ 64 <300000000>;
> +			opp-supported-hw =3D <0x0001>;
> +			required-opps =3D <&core_opp_1000>;
> +		};
> +
> +		opp-384000000-1000 {
> +			opp-microvolt =3D <1000000 1000000 1390000>;
> +			opp-hz =3D /bits/ 64 <384000000>;
> +			opp-supported-hw =3D <0x000E>;
> +			required-opps =3D <&core_opp_1000>;
> +		};
> +
> +		opp-396000000-1050 {
> +			opp-microvolt =3D <1050000 1050000 1390000>;
> +			opp-hz =3D /bits/ 64 <396000000>;
> +			opp-supported-hw =3D <0x0001>;
> +			required-opps =3D <&core_opp_1050>;
> +		};
> +
> +		opp-468000000-1050 {
> +			opp-microvolt =3D <1050000 1050000 1390000>;
> +			opp-hz =3D /bits/ 64 <468000000>;
> +			opp-supported-hw =3D <0x000E>;
> +			required-opps =3D <&core_opp_1050>;
> +		};
> +
> +		opp-492000000-1100 {
> +			opp-microvolt =3D <1100000 1100000 1390000>;
> +			opp-hz =3D /bits/ 64 <492000000>;
> +			opp-supported-hw =3D <0x0001>;
> +			required-opps =3D <&core_opp_1100>;
> +		};
> +
> +		opp-528000000-1100 {
> +			opp-microvolt =3D <1100000 1100000 1390000>;
> +			opp-hz =3D /bits/ 64 <528000000>;
> +			opp-supported-hw =3D <0x000E>;
> +			required-opps =3D <&core_opp_1100>;
> +		};
> +
> +		opp-516000000-1120 {
> +			opp-microvolt =3D <1120000 1120000 1390000>;
> +			opp-hz =3D /bits/ 64 <516000000>;
> +			opp-supported-hw =3D <0x0001>;
> +			required-opps =3D <&core_opp_1120>;
> +		};
> +
> +		opp-564000000-1120 {
> +			opp-microvolt =3D <1120000 1120000 1390000>;
> +			opp-hz =3D /bits/ 64 <564000000>;
> +			opp-supported-hw =3D <0x000E>;
> +			required-opps =3D <&core_opp_1120>;
> +		};
> +
> +		opp-552000000-1170 {
> +			opp-microvolt =3D <1170000 1170000 1390000>;
> +			opp-hz =3D /bits/ 64 <552000000>;
> +			opp-supported-hw =3D <0x0001>;
> +			required-opps =3D <&core_opp_1170>;
> +		};
> +
> +		opp-600000000-1170 {
> +			opp-microvolt =3D <1170000 1170000 1390000>;
> +			opp-hz =3D /bits/ 64 <600000000>;
> +			opp-supported-hw =3D <0x000E>;
> +			required-opps =3D <&core_opp_1170>;
> +		};
> +
> +		opp-600000000-1250 {
> +			opp-microvolt =3D <1250000 1250000 1390000>;
> +			opp-hz =3D /bits/ 64 <600000000>;
> +			opp-supported-hw =3D <0x0001>;
> +			required-opps =3D <&core_opp_1250>;
> +		};
> +
> +		opp-636000000-1200 {
> +			opp-microvolt =3D <1200000 1200000 1390000>;
> +			opp-hz =3D /bits/ 64 <636000000>;
> +			opp-supported-hw =3D <0x000E>;
> +			required-opps =3D <&core_opp_1200>;
> +		};
> +
> +		opp-672000000-1250 {
> +			opp-microvolt =3D <1250000 1250000 1390000>;
> +			opp-hz =3D /bits/ 64 <672000000>;
> +			opp-supported-hw =3D <0x000E>;
> +			required-opps =3D <&core_opp_1250>;
> +		};
> +
> +		opp-828000000-1390 {
> +			opp-microvolt =3D <1390000 1390000 1390000>;
> +			opp-hz =3D /bits/ 64 <828000000>;
> +			opp-supported-hw =3D <0x000E>;
> +			required-opps =3D <&core_opp_1390>;
> +		};
> +	};
> +
> +	gr3d_dvfs_opp_table: opp-table-gr3d {
> +		compatible =3D "operating-points-v2";
> +
> +		opp-192000000-900 {
> +			opp-microvolt =3D <900000 900000 1390000>;
> +			opp-hz =3D /bits/ 64 <192000000>;
> +			opp-supported-hw =3D <0x0001>;
> +			required-opps =3D <&core_opp_900>;
> +		};
> +
> +		opp-240000000-900 {
> +			opp-microvolt =3D <900000 900000 1390000>;
> +			opp-hz =3D /bits/ 64 <240000000>;
> +			opp-supported-hw =3D <0x000E>;
> +			required-opps =3D <&core_opp_900>;
> +		};
> +
> +		opp-228000000-950 {
> +			opp-microvolt =3D <950000 950000 1390000>;
> +			opp-hz =3D /bits/ 64 <228000000>;
> +			opp-supported-hw =3D <0x0001>;
> +			required-opps =3D <&core_opp_950>;
> +		};
> +
> +		opp-300000000-950 {
> +			opp-microvolt =3D <950000 950000 1390000>;
> +			opp-hz =3D /bits/ 64 <300000000>;
> +			opp-supported-hw =3D <0x000E>;
> +			required-opps =3D <&core_opp_950>;
> +		};
> +
> +		opp-300000000-1000 {
> +			opp-microvolt =3D <1000000 1000000 1390000>;
> +			opp-hz =3D /bits/ 64 <300000000>;
> +			opp-supported-hw =3D <0x0001>;
> +			required-opps =3D <&core_opp_1000>;
> +		};
> +
> +		opp-384000000-1000 {
> +			opp-microvolt =3D <1000000 1000000 1390000>;
> +			opp-hz =3D /bits/ 64 <384000000>;
> +			opp-supported-hw =3D <0x000E>;
> +			required-opps =3D <&core_opp_1000>;
> +		};
> +
> +		opp-396000000-1050 {
> +			opp-microvolt =3D <1050000 1050000 1390000>;
> +			opp-hz =3D /bits/ 64 <396000000>;
> +			opp-supported-hw =3D <0x0001>;
> +			required-opps =3D <&core_opp_1050>;
> +		};
> +
> +		opp-468000000-1050 {
> +			opp-microvolt =3D <1050000 1050000 1390000>;
> +			opp-hz =3D /bits/ 64 <468000000>;
> +			opp-supported-hw =3D <0x000E>;
> +			required-opps =3D <&core_opp_1050>;
> +		};
> +
> +		opp-492000000-1100 {
> +			opp-microvolt =3D <1100000 1100000 1390000>;
> +			opp-hz =3D /bits/ 64 <492000000>;
> +			opp-supported-hw =3D <0x0001>;
> +			required-opps =3D <&core_opp_1100>;
> +		};
> +
> +		opp-528000000-1100 {
> +			opp-microvolt =3D <1100000 1100000 1390000>;
> +			opp-hz =3D /bits/ 64 <528000000>;
> +			opp-supported-hw =3D <0x000E>;
> +			required-opps =3D <&core_opp_1100>;
> +		};
> +
> +		opp-516000000-1120 {
> +			opp-microvolt =3D <1120000 1120000 1390000>;
> +			opp-hz =3D /bits/ 64 <516000000>;
> +			opp-supported-hw =3D <0x0001>;
> +			required-opps =3D <&core_opp_1120>;
> +		};
> +
> +		opp-564000000-1120 {
> +			opp-microvolt =3D <1120000 1120000 1390000>;
> +			opp-hz =3D /bits/ 64 <564000000>;
> +			opp-supported-hw =3D <0x000E>;
> +			required-opps =3D <&core_opp_1120>;
> +		};
> +
> +		opp-552000000-1170 {
> +			opp-microvolt =3D <1170000 1170000 1390000>;
> +			opp-hz =3D /bits/ 64 <552000000>;
> +			opp-supported-hw =3D <0x0001>;
> +			required-opps =3D <&core_opp_1170>;
> +		};
> +
> +		opp-600000000-1170 {
> +			opp-microvolt =3D <1170000 1170000 1390000>;
> +			opp-hz =3D /bits/ 64 <600000000>;
> +			opp-supported-hw =3D <0x000E>;
> +			required-opps =3D <&core_opp_1170>;
> +		};
> +
> +		opp-600000000-1250 {
> +			opp-microvolt =3D <1250000 1250000 1390000>;
> +			opp-hz =3D /bits/ 64 <600000000>;
> +			opp-supported-hw =3D <0x0001>;
> +			required-opps =3D <&core_opp_1250>;
> +		};
> +
> +		opp-636000000-1200 {
> +			opp-microvolt =3D <1200000 1200000 1390000>;
> +			opp-hz =3D /bits/ 64 <636000000>;
> +			opp-supported-hw =3D <0x000E>;
> +			required-opps =3D <&core_opp_1200>;
> +		};
> +
> +		opp-672000000-1250 {
> +			opp-microvolt =3D <1250000 1250000 1390000>;
> +			opp-hz =3D /bits/ 64 <672000000>;
> +			opp-supported-hw =3D <0x000E>;
> +			required-opps =3D <&core_opp_1250>;
> +		};
> +
> +		opp-828000000-1390 {
> +			opp-microvolt =3D <1390000 1390000 1390000>;
> +			opp-hz =3D /bits/ 64 <828000000>;
> +			opp-supported-hw =3D <0x000E>;
> +			required-opps =3D <&core_opp_1390>;
> +		};
> +	};
> +
> +	msenc_dvfs_opp_table: opp-table-msenc {
> +		compatible =3D "operating-points-v2";
> +
> +		opp-144000000-900 {
> +			opp-microvolt =3D <900000 900000 1390000>;
> +			opp-hz =3D /bits/ 64 <144000000>;
> +			opp-supported-hw =3D <0x0001>;
> +			required-opps =3D <&core_opp_900>;
> +		};
> +
> +		opp-182000000-950 {
> +			opp-microvolt =3D <950000 950000 1390000>;
> +			opp-hz =3D /bits/ 64 <182000000>;
> +			opp-supported-hw =3D <0x0001>;
> +			required-opps =3D <&core_opp_950>;
> +		};
> +
> +		opp-204000000-900 {
> +			opp-microvolt =3D <900000 900000 1390000>;
> +			opp-hz =3D /bits/ 64 <204000000>;
> +			opp-supported-hw =3D <0x000E>;
> +			required-opps =3D <&core_opp_900>;
> +		};
> +
> +		opp-240000000-1000 {
> +			opp-microvolt =3D <1000000 1000000 1390000>;
> +			opp-hz =3D /bits/ 64 <240000000>;
> +			opp-supported-hw =3D <0x0001>;
> +			required-opps =3D <&core_opp_1000>;
> +		};
> +
> +		opp-252000000-950 {
> +			opp-microvolt =3D <950000 950000 1390000>;
> +			opp-hz =3D /bits/ 64 <252000000>;
> +			opp-supported-hw =3D <0x000E>;
> +			required-opps =3D <&core_opp_950>;
> +		};
> +
> +		opp-312000000-1050 {
> +			opp-microvolt =3D <1050000 1050000 1390000>;
> +			opp-hz =3D /bits/ 64 <312000000>;
> +			opp-supported-hw =3D <0x0001>;
> +			required-opps =3D <&core_opp_1050>;
> +		};
> +
> +		opp-324000000-1000 {
> +			opp-microvolt =3D <1000000 1000000 1390000>;
> +			opp-hz =3D /bits/ 64 <324000000>;
> +			opp-supported-hw =3D <0x000E>;
> +			required-opps =3D <&core_opp_1000>;
> +		};
> +
> +		opp-384000000-1100 {
> +			opp-microvolt =3D <1100000 1100000 1390000>;
> +			opp-hz =3D /bits/ 64 <384000000>;
> +			opp-supported-hw =3D <0x0001>;
> +			required-opps =3D <&core_opp_1100>;
> +		};
> +
> +		opp-408000000-1050 {
> +			opp-microvolt =3D <1050000 1050000 1390000>;
> +			opp-hz =3D /bits/ 64 <408000000>;
> +			opp-supported-hw =3D <0x000E>;
> +			required-opps =3D <&core_opp_1050>;
> +		};
> +
> +		opp-432000000-1120 {
> +			opp-microvolt =3D <1120000 1120000 1390000>;
> +			opp-hz =3D /bits/ 64 <432000000>;
> +			opp-supported-hw =3D <0x0001>;
> +			required-opps =3D <&core_opp_1120>;
> +		};
> +
> +		opp-456000000-1100 {
> +			opp-microvolt =3D <1100000 1100000 1390000>;
> +			opp-hz =3D /bits/ 64 <456000000>;
> +			opp-supported-hw =3D <0x000E>;
> +			required-opps =3D <&core_opp_1100>;
> +		};
> +
> +		opp-480000000-1120 {
> +			opp-microvolt =3D <1120000 1120000 1390000>;
> +			opp-hz =3D /bits/ 64 <480000000>;
> +			opp-supported-hw =3D <0x000E>;
> +			required-opps =3D <&core_opp_1120>;
> +		};
> +
> +		opp-480000000-1170 {
> +			opp-microvolt =3D <1170000 1170000 1390000>;
> +			opp-hz =3D /bits/ 64 <480000000>;
> +			opp-supported-hw =3D <0x0001>;
> +			required-opps =3D <&core_opp_1170>;
> +		};
> +	};
> +
> +	tsec_dvfs_opp_table: opp-table-tsec {
> +		compatible =3D "operating-points-v2";
> +
> +		opp-144000000-900 {
> +			opp-microvolt =3D <900000 900000 1390000>;
> +			opp-hz =3D /bits/ 64 <144000000>;
> +			opp-supported-hw =3D <0x0001>;
> +			required-opps =3D <&core_opp_900>;
> +		};
> +
> +		opp-182000000-950 {
> +			opp-microvolt =3D <950000 950000 1390000>;
> +			opp-hz =3D /bits/ 64 <182000000>;
> +			opp-supported-hw =3D <0x0001>;
> +			required-opps =3D <&core_opp_950>;
> +		};
> +
> +		opp-204000000-900 {
> +			opp-microvolt =3D <900000 900000 1390000>;
> +			opp-hz =3D /bits/ 64 <204000000>;
> +			opp-supported-hw =3D <0x000E>;
> +			required-opps =3D <&core_opp_900>;
> +		};
> +
> +		opp-240000000-1000 {
> +			opp-microvolt =3D <1000000 1000000 1390000>;
> +			opp-hz =3D /bits/ 64 <240000000>;
> +			opp-supported-hw =3D <0x0001>;
> +			required-opps =3D <&core_opp_1000>;
> +		};
> +
> +		opp-252000000-950 {
> +			opp-microvolt =3D <950000 950000 1390000>;
> +			opp-hz =3D /bits/ 64 <252000000>;
> +			opp-supported-hw =3D <0x000E>;
> +			required-opps =3D <&core_opp_950>;
> +		};
> +
> +		opp-312000000-1050 {
> +			opp-microvolt =3D <1050000 1050000 1390000>;
> +			opp-hz =3D /bits/ 64 <312000000>;
> +			opp-supported-hw =3D <0x0001>;
> +			required-opps =3D <&core_opp_1050>;
> +		};
> +
> +		opp-324000000-1000 {
> +			opp-microvolt =3D <1000000 1000000 1390000>;
> +			opp-hz =3D /bits/ 64 <324000000>;
> +			opp-supported-hw =3D <0x000E>;
> +			required-opps =3D <&core_opp_1000>;
> +		};
> +
> +		opp-384000000-1100 {
> +			opp-microvolt =3D <1100000 1100000 1390000>;
> +			opp-hz =3D /bits/ 64 <384000000>;
> +			opp-supported-hw =3D <0x0001>;
> +			required-opps =3D <&core_opp_1100>;
> +		};
> +
> +		opp-408000000-1050 {
> +			opp-microvolt =3D <1050000 1050000 1390000>;
> +			opp-hz =3D /bits/ 64 <408000000>;
> +			opp-supported-hw =3D <0x000E>;
> +			required-opps =3D <&core_opp_1050>;
> +		};
> +
> +		opp-432000000-1120 {
> +			opp-microvolt =3D <1120000 1120000 1390000>;
> +			opp-hz =3D /bits/ 64 <432000000>;
> +			opp-supported-hw =3D <0x0001>;
> +			required-opps =3D <&core_opp_1120>;
> +		};
> +
> +		opp-456000000-1100 {
> +			opp-microvolt =3D <1100000 1100000 1390000>;
> +			opp-hz =3D /bits/ 64 <456000000>;
> +			opp-supported-hw =3D <0x000E>;
> +			required-opps =3D <&core_opp_1100>;
> +		};
> +
> +		opp-480000000-1120 {
> +			opp-microvolt =3D <1120000 1120000 1390000>;
> +			opp-hz =3D /bits/ 64 <480000000>;
> +			opp-supported-hw =3D <0x000E>;
> +			required-opps =3D <&core_opp_1120>;
> +		};
> +
> +		opp-480000000-1170 {
> +			opp-microvolt =3D <1170000 1170000 1390000>;
> +			opp-hz =3D /bits/ 64 <480000000>;
> +			opp-supported-hw =3D <0x0001>;
> +			required-opps =3D <&core_opp_1170>;
> +		};
> +	};
> +
> +	vde_dvfs_opp_table: opp-table-vde {
> +		compatible =3D "operating-points-v2";
> +
> +		opp-144000000-900 {
> +			opp-microvolt =3D <900000 900000 1390000>;
> +			opp-hz =3D /bits/ 64 <144000000>;
> +			opp-supported-hw =3D <0x0001>;
> +			required-opps =3D <&core_opp_900>;
> +		};
> +
> +		opp-182000000-950 {
> +			opp-microvolt =3D <950000 950000 1390000>;
> +			opp-hz =3D /bits/ 64 <182000000>;
> +			opp-supported-hw =3D <0x0001>;
> +			required-opps =3D <&core_opp_950>;
> +		};
> +
> +		opp-204000000-900 {
> +			opp-microvolt =3D <900000 900000 1390000>;
> +			opp-hz =3D /bits/ 64 <204000000>;
> +			opp-supported-hw =3D <0x000E>;
> +			required-opps =3D <&core_opp_900>;
> +		};
> +
> +		opp-240000000-1000 {
> +			opp-microvolt =3D <1000000 1000000 1390000>;
> +			opp-hz =3D /bits/ 64 <240000000>;
> +			opp-supported-hw =3D <0x0001>;
> +			required-opps =3D <&core_opp_1000>;
> +		};
> +
> +		opp-252000000-950 {
> +			opp-microvolt =3D <950000 950000 1390000>;
> +			opp-hz =3D /bits/ 64 <252000000>;
> +			opp-supported-hw =3D <0x000E>;
> +			required-opps =3D <&core_opp_950>;
> +		};
> +
> +		opp-312000000-1050 {
> +			opp-microvolt =3D <1050000 1050000 1390000>;
> +			opp-hz =3D /bits/ 64 <312000000>;
> +			opp-supported-hw =3D <0x0001>;
> +			required-opps =3D <&core_opp_1050>;
> +		};
> +
> +		opp-324000000-1000 {
> +			opp-microvolt =3D <1000000 1000000 1390000>;
> +			opp-hz =3D /bits/ 64 <324000000>;
> +			opp-supported-hw =3D <0x000E>;
> +			required-opps =3D <&core_opp_1000>;
> +		};
> +
> +		opp-384000000-1100 {
> +			opp-microvolt =3D <1100000 1100000 1390000>;
> +			opp-hz =3D /bits/ 64 <384000000>;
> +			opp-supported-hw =3D <0x0001>;
> +			required-opps =3D <&core_opp_1100>;
> +		};
> +
> +		opp-408000000-1050 {
> +			opp-microvolt =3D <1050000 1050000 1390000>;
> +			opp-hz =3D /bits/ 64 <408000000>;
> +			opp-supported-hw =3D <0x000E>;
> +			required-opps =3D <&core_opp_1050>;
> +		};
> +
> +		opp-432000000-1120 {
> +			opp-microvolt =3D <1120000 1120000 1390000>;
> +			opp-hz =3D /bits/ 64 <432000000>;
> +			opp-supported-hw =3D <0x0001>;
> +			required-opps =3D <&core_opp_1120>;
> +		};
> +
> +		opp-456000000-1100 {
> +			opp-microvolt =3D <1100000 1100000 1390000>;
> +			opp-hz =3D /bits/ 64 <456000000>;
> +			opp-supported-hw =3D <0x000E>;
> +			required-opps =3D <&core_opp_1100>;
> +		};
> +
> +		opp-480000000-1120 {
> +			opp-microvolt =3D <1120000 1120000 1390000>;
> +			opp-hz =3D /bits/ 64 <480000000>;
> +			opp-supported-hw =3D <0x000E>;
> +			required-opps =3D <&core_opp_1120>;
> +		};
> +
> +		opp-480000000-1170 {
> +			opp-microvolt =3D <1170000 1170000 1390000>;
> +			opp-hz =3D /bits/ 64 <480000000>;
> +			opp-supported-hw =3D <0x0001>;
> +			required-opps =3D <&core_opp_1170>;
> +		};
> +	};
> +
> +	host1x_dvfs_opp_table: opp-table-host1x {
> +		compatible =3D "operating-points-v2";
> +
> +		opp-144000000-900 {
> +			opp-microvolt =3D <900000 900000 1390000>;
> +			opp-hz =3D /bits/ 64 <144000000>;
> +			opp-supported-hw =3D <0x0001>;
> +			required-opps =3D <&core_opp_900>;
> +		};
> +
> +		opp-180000000-900 {
> +			opp-microvolt =3D <900000 900000 1390000>;
> +			opp-hz =3D /bits/ 64 <180000000>;
> +			opp-supported-hw =3D <0x000E>;
> +			required-opps =3D <&core_opp_900>;
> +		};
> +
> +		opp-188000000-950 {
> +			opp-microvolt =3D <950000 950000 1390000>;
> +			opp-hz =3D /bits/ 64 <188000000>;
> +			opp-supported-hw =3D <0x0001>;
> +			required-opps =3D <&core_opp_950>;
> +		};
> +
> +		opp-228000000-950 {
> +			opp-microvolt =3D <950000 950000 1390000>;
> +			opp-hz =3D /bits/ 64 <228000000>;
> +			opp-supported-hw =3D <0x000E>;
> +			required-opps =3D <&core_opp_950>;
> +		};
> +
> +		opp-240000000-1000 {
> +			opp-microvolt =3D <1000000 1000000 1390000>;
> +			opp-hz =3D /bits/ 64 <240000000>;
> +			opp-supported-hw =3D <0x0001>;
> +			required-opps =3D <&core_opp_1000>;
> +		};
> +
> +		opp-276000000-1000 {
> +			opp-microvolt =3D <1000000 1000000 1390000>;
> +			opp-hz =3D /bits/ 64 <276000000>;
> +			opp-supported-hw =3D <0x000E>;
> +			required-opps =3D <&core_opp_1000>;
> +		};
> +
> +		opp-276000000-1050 {
> +			opp-microvolt =3D <1050000 1050000 1390000>;
> +			opp-hz =3D /bits/ 64 <276000000>;
> +			opp-supported-hw =3D <0x0001>;
> +			required-opps =3D <&core_opp_1050>;
> +		};
> +
> +		opp-324000000-1100 {
> +			opp-microvolt =3D <1100000 1100000 1390000>;
> +			opp-hz =3D /bits/ 64 <324000000>;
> +			opp-supported-hw =3D <0x0001>;
> +			required-opps =3D <&core_opp_1100>;
> +		};
> +
> +		opp-336000000-1050 {
> +			opp-microvolt =3D <1050000 1050000 1390000>;
> +			opp-hz =3D /bits/ 64 <336000000>;
> +			opp-supported-hw =3D <0x000E>;
> +			required-opps =3D <&core_opp_1050>;
> +		};
> +
> +		opp-336000000-1120 {
> +			opp-microvolt =3D <1120000 1120000 1390000>;
> +			opp-hz =3D /bits/ 64 <336000000>;
> +			opp-supported-hw =3D <0x0001>;
> +			required-opps =3D <&core_opp_1120>;
> +		};
> +
> +		opp-372000000-1100 {
> +			opp-microvolt =3D <1100000 1100000 1390000>;
> +			opp-hz =3D /bits/ 64 <372000000>;
> +			opp-supported-hw =3D <0x000E>;
> +			required-opps =3D <&core_opp_1100>;
> +		};
> +
> +		opp-384000000-1120 {
> +			opp-microvolt =3D <1120000 1120000 1390000>;
> +			opp-hz =3D /bits/ 64 <384000000>;
> +			opp-supported-hw =3D <0x000E>;
> +			required-opps =3D <&core_opp_1120>;
> +		};
> +	};
> +
> +	pll_m_dvfs_opp_table: opp-table-pllm {
> +		compatible =3D "operating-points-v2";
> +
> +		opp-800000000-900 {
> +			opp-microvolt =3D <900000 900000 1390000>;
> +			opp-hz =3D /bits/ 64 <800000000>;
> +			opp-supported-hw =3D <0x000F>;
> +			required-opps =3D <&core_opp_900>;
> +		};
> +
> +		opp-1066000000-1000 {
> +			opp-microvolt =3D <1000000 1000000 1390000>;
> +			opp-hz =3D /bits/ 64 <1066000000>;
> +			opp-supported-hw =3D <0x000F>;
> +			required-opps =3D <&core_opp_1000>;
> +		};
> +	};
> +
> +	pll_c_dvfs_opp_table: opp-table-pllc {
> +		compatible =3D "operating-points-v2";
> +
> +		opp-800000000-900 {
> +			opp-microvolt =3D <900000 900000 1390000>;
> +			opp-hz =3D /bits/ 64 <800000000>;
> +			opp-supported-hw =3D <0x000F>;
> +			required-opps =3D <&core_opp_900>;
> +		};
> +
> +		opp-1066000000-1000 {
> +			opp-microvolt =3D <1000000 1000000 1390000>;
> +			opp-hz =3D /bits/ 64 <1066000000>;
> +			opp-supported-hw =3D <0x000F>;
> +			required-opps =3D <&core_opp_1000>;
> +		};
> +	};
> +
> +	pll_c2_dvfs_opp_table: opp-table-pllc2 {
> +		compatible =3D "operating-points-v2";
> +
> +		opp-800000000-900 {
> +			opp-microvolt =3D <900000 900000 1390000>;
> +			opp-hz =3D /bits/ 64 <800000000>;
> +			opp-supported-hw =3D <0x000F>;
> +			required-opps =3D <&core_opp_900>;
> +		};
> +
> +		opp-1066000000-1000 {
> +			opp-microvolt =3D <1000000 1000000 1390000>;
> +			opp-hz =3D /bits/ 64 <1066000000>;
> +			opp-supported-hw =3D <0x000F>;
> +			required-opps =3D <&core_opp_1000>;
> +		};
> +	};
> +
> +	pll_c3_dvfs_opp_table: opp-table-pllc3 {
> +		compatible =3D "operating-points-v2";
> +
> +		opp-800000000-900 {
> +			opp-microvolt =3D <900000 900000 1390000>;
> +			opp-hz =3D /bits/ 64 <800000000>;
> +			opp-supported-hw =3D <0x000F>;
> +			required-opps =3D <&core_opp_900>;
> +		};
> +
> +		opp-1066000000-1000 {
> +			opp-microvolt =3D <1000000 1000000 1390000>;
> +			opp-hz =3D /bits/ 64 <1066000000>;
> +			opp-supported-hw =3D <0x000F>;
> +			required-opps =3D <&core_opp_1000>;
> +		};
> +	};
> +
> +	sbc1_dvfs_opp_table: opp-table-sbc1 {
> +		compatible =3D "operating-points-v2";
> +
> +		opp-48000000-900 {
> +			opp-microvolt =3D <900000 900000 1390000>;
> +			opp-hz =3D /bits/ 64 <48000000>;
> +			opp-supported-hw =3D <0x000F>;
> +			required-opps =3D <&core_opp_900>;
> +		};
> +
> +		opp-52000000-1100 {
> +			opp-microvolt =3D <1100000 1100000 1390000>;
> +			opp-hz =3D /bits/ 64 <52000000>;
> +			opp-supported-hw =3D <0x000F>;
> +			required-opps =3D <&core_opp_1100>;
> +		};
> +	};
> +
> +	sbc2_dvfs_opp_table: opp-table-sbc2 {
> +		compatible =3D "operating-points-v2";
> +
> +		opp-48000000-900 {
> +			opp-microvolt =3D <900000 900000 1390000>;
> +			opp-hz =3D /bits/ 64 <48000000>;
> +			opp-supported-hw =3D <0x000F>;
> +			required-opps =3D <&core_opp_900>;
> +		};
> +
> +		opp-52000000-1100 {
> +			opp-microvolt =3D <1100000 1100000 1390000>;
> +			opp-hz =3D /bits/ 64 <52000000>;
> +			opp-supported-hw =3D <0x000F>;
> +			required-opps =3D <&core_opp_1100>;
> +		};
> +	};
> +
> +	sbc3_dvfs_opp_table: opp-table-sbc3 {
> +		compatible =3D "operating-points-v2";
> +
> +		opp-48000000-900 {
> +			opp-microvolt =3D <900000 900000 1390000>;
> +			opp-hz =3D /bits/ 64 <48000000>;
> +			opp-supported-hw =3D <0x000F>;
> +			required-opps =3D <&core_opp_900>;
> +		};
> +
> +		opp-52000000-1100 {
> +			opp-microvolt =3D <1100000 1100000 1390000>;
> +			opp-hz =3D /bits/ 64 <52000000>;
> +			opp-supported-hw =3D <0x000F>;
> +			required-opps =3D <&core_opp_1100>;
> +		};
> +	};
> +
> +	sbc4_dvfs_opp_table: opp-table-sbc4 {
> +		compatible =3D "operating-points-v2";
> +
> +		opp-48000000-900 {
> +			opp-microvolt =3D <900000 900000 1390000>;
> +			opp-hz =3D /bits/ 64 <48000000>;
> +			opp-supported-hw =3D <0x000F>;
> +			required-opps =3D <&core_opp_900>;
> +		};
> +
> +		opp-52000000-1100 {
> +			opp-microvolt =3D <1100000 1100000 1390000>;
> +			opp-hz =3D /bits/ 64 <52000000>;
> +			opp-supported-hw =3D <0x000F>;
> +			required-opps =3D <&core_opp_1100>;
> +		};
> +	};
> +
> +	sbc5_dvfs_opp_table: opp-table-sbc5 {
> +		compatible =3D "operating-points-v2";
> +
> +		opp-48000000-900 {
> +			opp-microvolt =3D <900000 900000 1390000>;
> +			opp-hz =3D /bits/ 64 <48000000>;
> +			opp-supported-hw =3D <0x000F>;
> +			required-opps =3D <&core_opp_900>;
> +		};
> +
> +		opp-52000000-1100 {
> +			opp-microvolt =3D <1100000 1100000 1390000>;
> +			opp-hz =3D /bits/ 64 <52000000>;
> +			opp-supported-hw =3D <0x000F>;
> +			required-opps =3D <&core_opp_1100>;
> +		};
> +	};
> +
> +	sbc6_dvfs_opp_table: opp-table-sbc6 {
> +		compatible =3D "operating-points-v2";
> +
> +		opp-48000000-900 {
> +			opp-microvolt =3D <900000 900000 1390000>;
> +			opp-hz =3D /bits/ 64 <48000000>;
> +			opp-supported-hw =3D <0x000F>;
> +			required-opps =3D <&core_opp_900>;
> +		};
> +
> +		opp-52000000-1100 {
> +			opp-microvolt =3D <1100000 1100000 1390000>;
> +			opp-hz =3D /bits/ 64 <52000000>;
> +			opp-supported-hw =3D <0x000F>;
> +			required-opps =3D <&core_opp_1100>;
> +		};
> +	};
> +
> +	sdmmc1_dvfs_opp_table: opp-table-sdmmc1 {
> +		compatible =3D "operating-points-v2";
> +
> +		opp-81600000-950 {
> +			opp-microvolt =3D <950000 950000 1390000>;
> +			opp-hz =3D /bits/ 64 <81600000>;
> +			opp-supported-hw =3D <0x000F>;
> +			required-opps =3D <&core_opp_950>;
> +		};
> +
> +		opp-156000000-1120 {
> +			opp-microvolt =3D <1120000 1120000 1390000>;
> +			opp-hz =3D /bits/ 64 <156000000>;
> +			opp-supported-hw =3D <0x000F>;
> +			required-opps =3D <&core_opp_1120>;
> +		};
> +
> +		opp-204000000-1250 {
> +			opp-microvolt =3D <1250000 1250000 1390000>;
> +			opp-hz =3D /bits/ 64 <204000000>;
> +			opp-supported-hw =3D <0x000F>;
> +			required-opps =3D <&core_opp_1250>;
> +		};
> +	};
> +
> +	sdmmc3_dvfs_opp_table: opp-table-sdmmc3 {
> +		compatible =3D "operating-points-v2";
> +
> +		opp-81600000-950 {
> +			opp-microvolt =3D <950000 950000 1390000>;
> +			opp-hz =3D /bits/ 64 <81600000>;
> +			opp-supported-hw =3D <0x000F>;
> +			required-opps =3D <&core_opp_950>;
> +		};
> +
> +		opp-156000000-1120 {
> +			opp-microvolt =3D <1120000 1120000 1390000>;
> +			opp-hz =3D /bits/ 64 <156000000>;
> +			opp-supported-hw =3D <0x000F>;
> +			required-opps =3D <&core_opp_1120>;
> +		};
> +
> +		opp-204000000-1250 {
> +			opp-microvolt =3D <1250000 1250000 1390000>;
> +			opp-hz =3D /bits/ 64 <204000000>;
> +			opp-supported-hw =3D <0x000F>;
> +			required-opps =3D <&core_opp_1250>;
> +		};
> +	};
> +
> +	sdmmc4_dvfs_opp_table: opp-table-sdmmc4 {
> +		compatible =3D "operating-points-v2";
> +
> +		opp-81600000-950 {
> +			opp-microvolt =3D <950000 950000 1390000>;
> +			opp-hz =3D /bits/ 64 <81600000>;
> +			opp-supported-hw =3D <0x000F>;
> +			required-opps =3D <&core_opp_950>;
> +		};
> +
> +		opp-156000000-1120 {
> +			opp-microvolt =3D <1120000 1120000 1390000>;
> +			opp-hz =3D /bits/ 64 <156000000>;
> +			opp-supported-hw =3D <0x000F>;
> +			required-opps =3D <&core_opp_1120>;
> +		};
> +
> +		opp-200000000-1250 {
> +			opp-microvolt =3D <1250000 1250000 1390000>;
> +			opp-hz =3D /bits/ 64 <200000000>;
> +			opp-supported-hw =3D <0x000F>;
> +			required-opps =3D <&core_opp_1250>;
> +		};
> +	};
> +
> +	hdmi_dvfs_opp_table: opp-table-hdmi {
> +		compatible =3D "operating-points-v2";
> +
> +		opp-148500000-900 {
> +			opp-microvolt =3D <900000 900000 1390000>;
> +			opp-hz =3D /bits/ 64 <148500000>;
> +			opp-supported-hw =3D <0x000F>;
> +			required-opps =3D <&core_opp_900>;
> +		};
> +
> +		opp-297000000-1050 {
> +			opp-microvolt =3D <1050000 1050000 1390000>;
> +			opp-hz =3D /bits/ 64 <297000000>;
> +			opp-supported-hw =3D <0x000F>;
> +			required-opps =3D <&core_opp_1050>;
> +		};
> +	};
> +
> +	disp1_dvfs_opp_table: opp-table-disp1 {
> +		compatible =3D "operating-points-v2";
> +
> +		opp-166000000-900 {
> +			opp-microvolt =3D <900000 900000 1390000>;
> +			opp-hz =3D /bits/ 64 <166000000>;
> +			opp-supported-hw =3D <0x000F>;
> +			required-opps =3D <&core_opp_900>;
> +		};
> +
> +		opp-297000000-1050 {
> +			opp-microvolt =3D <1050000 1050000 1390000>;
> +			opp-hz =3D /bits/ 64 <297000000>;
> +			opp-supported-hw =3D <0x000F>;
> +			required-opps =3D <&core_opp_1050>;
> +		};
> +	};
> +
> +	disp2_dvfs_opp_table: opp-table-disp2 {
> +		compatible =3D "operating-points-v2";
> +
> +		opp-166000000-900 {
> +			opp-microvolt =3D <900000 900000 1390000>;
> +			opp-hz =3D /bits/ 64 <166000000>;
> +			opp-supported-hw =3D <0x000F>;
> +			required-opps =3D <&core_opp_900>;
> +		};
> +
> +		opp-297000000-1050 {
> +			opp-microvolt =3D <1050000 1050000 1390000>;
> +			opp-hz =3D /bits/ 64 <297000000>;
> +			opp-supported-hw =3D <0x000F>;
> +			required-opps =3D <&core_opp_1050>;
> +		};
> +	};
> +
> +	xusb_falcon_dvfs_opp_table: opp-table-xusb-falcon {
> +		compatible =3D "operating-points-v2";
> +
> +		opp-336000000-950 {
> +			opp-microvolt =3D <950000 950000 1390000>;
> +			opp-hz =3D /bits/ 64 <336000000>;
> +			opp-supported-hw =3D <0x000F>;
> +			required-opps =3D <&core_opp_950>;
> +		};
> +	};
> +
> +	xusb_host_dvfs_opp_table: opp-table-xusb-host {
> +		compatible =3D "operating-points-v2";
> +
> +		opp-112000000-950 {
> +			opp-microvolt =3D <950000 950000 1390000>;
> +			opp-hz =3D /bits/ 64 <112000000>;
> +			opp-supported-hw =3D <0x000F>;
> +			required-opps =3D <&core_opp_950>;
> +		};
> +	};
> +
> +	xusb_dev_dvfs_opp_table: opp-table-xusb-dev {
> +		compatible =3D "operating-points-v2";
> +
> +		opp-58300000-950 {
> +			opp-microvolt =3D <950000 950000 1390000>;
> +			opp-hz =3D /bits/ 64 <58300000>;
> +			opp-supported-hw =3D <0x000F>;
> +			required-opps =3D <&core_opp_950>;
> +		};
> +	};
> +
> +	xusb_ss_dvfs_opp_table: opp-table-xusb-ss {
> +		compatible =3D "operating-points-v2";
> +
> +		opp-122400000-950 {
> +			opp-microvolt =3D <950000 950000 1390000>;
> +			opp-hz =3D /bits/ 64 <122400000>;
> +			opp-supported-hw =3D <0x000F>;
> +			required-opps =3D <&core_opp_950>;
> +		};
> +	};
> +
> +	xusb_fs_dvfs_opp_table: opp-table-xusb-fs {
> +		compatible =3D "operating-points-v2";
> +
> +		opp-48000000-950 {
> +			opp-microvolt =3D <950000 950000 1390000>;
> +			opp-hz =3D /bits/ 64 <48000000>;
> +			opp-supported-hw =3D <0x000F>;
> +			required-opps =3D <&core_opp_950>;
> +		};
> +	};
> +
> +	xusb_hs_dvfs_opp_table: opp-table-xusb-hs {
> +		compatible =3D "operating-points-v2";
> +
> +		opp-61200000-950 {
> +			opp-microvolt =3D <950000 950000 1390000>;
> +			opp-hz =3D /bits/ 64 <61200000>;
> +			opp-supported-hw =3D <0x000F>;
> +			required-opps =3D <&core_opp_950>;
> +		};
> +	};
> +
> +	/* Add usbd, usb2 and usb3 opps if needed */
>  };
> diff --git a/arch/arm/boot/dts/nvidia/tegra114.dtsi b/arch/arm/boot/dts/n=
vidia/tegra114.dtsi
> index f1af206f50ee..143aa45a9791 100644
> --- a/arch/arm/boot/dts/nvidia/tegra114.dtsi
> +++ b/arch/arm/boot/dts/nvidia/tegra114.dtsi
> @@ -58,6 +58,8 @@ vi@54080000 {
>  			clocks =3D <&tegra_car TEGRA114_CLK_VI>;
>  			resets =3D <&tegra_car 20>;
>  			reset-names =3D "vi";
> +			power-domains =3D <&pd_venc>;
> +			operating-points-v2 =3D <&vi_dvfs_opp_table>;
> =20
>  			iommus =3D <&mc TEGRA_SWGROUP_VI>;
> =20
> @@ -71,6 +73,8 @@ epp@540c0000 {
>  			clocks =3D <&tegra_car TEGRA114_CLK_EPP>;
>  			resets =3D <&tegra_car TEGRA114_CLK_EPP>;
>  			reset-names =3D "epp";
> +			power-domains =3D <&pd_heg>;
> +			operating-points-v2 =3D <&epp_dvfs_opp_table>;
> =20
>  			iommus =3D <&mc TEGRA_SWGROUP_EPP>;
> =20
> @@ -84,6 +88,7 @@ isp@54100000 {
>  			clocks =3D <&tegra_car TEGRA114_CLK_ISP>;
>  			resets =3D <&tegra_car TEGRA114_CLK_ISP>;
>  			reset-names =3D "isp";
> +			power-domains =3D <&pd_venc>;
> =20
>  			iommus =3D <&mc TEGRA_SWGROUP_ISP>;
> =20
> @@ -97,6 +102,8 @@ gr2d@54140000 {
>  			clocks =3D <&tegra_car TEGRA114_CLK_GR2D>;
>  			resets =3D <&tegra_car 21>, <&mc TEGRA114_MC_RESET_2D>;
>  			reset-names =3D "2d", "mc";
> +			power-domains =3D <&pd_heg>;
> +			operating-points-v2 =3D <&gr2d_dvfs_opp_table>;
> =20
>  			iommus =3D <&mc TEGRA_SWGROUP_G2>;
>  		};
> @@ -107,6 +114,8 @@ gr3d@54180000 {
>  			clocks =3D <&tegra_car TEGRA114_CLK_GR3D>;
>  			resets =3D <&tegra_car 24>, <&mc TEGRA114_MC_RESET_3D>;
>  			reset-names =3D "3d", "mc";
> +			power-domains =3D <&pd_3d>;
> +			operating-points-v2 =3D <&gr3d_dvfs_opp_table>;
> =20
>  			iommus =3D <&mc TEGRA_SWGROUP_NV>;
>  		};
> @@ -120,6 +129,8 @@ dc@54200000 {
>  			clock-names =3D "dc", "parent";
>  			resets =3D <&tegra_car 27>;
>  			reset-names =3D "dc";
> +			power-domains =3D <&pd_core>;
> +			operating-points-v2 =3D <&disp1_dvfs_opp_table>;
> =20
>  			iommus =3D <&mc TEGRA_SWGROUP_DC>;
> =20
> @@ -150,6 +161,8 @@ dc@54240000 {
>  			clock-names =3D "dc", "parent";
>  			resets =3D <&tegra_car 26>;
>  			reset-names =3D "dc";
> +			power-domains =3D <&pd_core>;
> +			operating-points-v2 =3D <&disp2_dvfs_opp_table>;
> =20
>  			iommus =3D <&mc TEGRA_SWGROUP_DCB>;
> =20
> @@ -180,6 +193,8 @@ hdmi@54280000 {
>  			clock-names =3D "hdmi", "parent";
>  			resets =3D <&tegra_car 51>;
>  			reset-names =3D "hdmi";
> +			power-domains =3D <&pd_core>;
> +			operating-points-v2 =3D <&hdmi_dvfs_opp_table>;
>  			status =3D "disabled";
>  		};
> =20
> @@ -193,6 +208,7 @@ dsia: dsi@54300000 {
>  			resets =3D <&tegra_car 48>;
>  			reset-names =3D "dsi";
>  			nvidia,mipi-calibrate =3D <&mipi 0x060>; /* DSIA & DSIB pads */
> +			power-domains =3D <&pd_core>;
>  			status =3D "disabled";
> =20
>  			#address-cells =3D <1>;
> @@ -209,6 +225,7 @@ dsib: dsi@54400000 {
>  			resets =3D <&tegra_car 82>;
>  			reset-names =3D "dsi";
>  			nvidia,mipi-calibrate =3D <&mipi 0x180>; /* DSIC & DSID pads */
> +			power-domains =3D <&pd_core>;
>  			status =3D "disabled";
> =20
>  			#address-cells =3D <1>;
> @@ -222,6 +239,8 @@ msenc@544c0000 {
>  			clocks =3D <&tegra_car TEGRA114_CLK_MSENC>;
>  			resets =3D <&tegra_car TEGRA114_CLK_MSENC>;
>  			reset-names =3D "mpe";
> +			power-domains =3D <&pd_mpe>;
> +			operating-points-v2 =3D <&msenc_dvfs_opp_table>;
> =20
>  			iommus =3D <&mc TEGRA_SWGROUP_MSENC>;
> =20
> @@ -234,6 +253,8 @@ tsec@54500000 {
>  			interrupts =3D <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks =3D <&tegra_car TEGRA114_CLK_TSEC>;
>  			resets =3D <&tegra_car TEGRA114_CLK_TSEC>;
> +			power-domains =3D <&pd_core>;
> +			operating-points-v2 =3D <&tsec_dvfs_opp_table>;
> =20
>  			iommus =3D <&mc TEGRA_SWGROUP_TSEC>;
> =20
> @@ -393,6 +414,8 @@ vde@6001a000 {
>  		reset-names =3D "vde", "mc";
>  		resets =3D <&tegra_car 61>, <&mc TEGRA114_MC_RESET_VDE>;
>  		iommus =3D <&mc TEGRA_SWGROUP_VDE>;
> +		power-domains =3D <&pd_vde>;
> +		operating-points-v2 =3D <&vde_dvfs_opp_table>;
>  	};
> =20
>  	apbmisc@70000800 {
> @@ -470,6 +493,7 @@ pwm: pwm@7000a000 {
>  		clocks =3D <&tegra_car TEGRA114_CLK_PWM>;
>  		resets =3D <&tegra_car 17>;
>  		reset-names =3D "pwm";
> +		power-domains =3D <&pd_core>;
>  		status =3D "disabled";
>  	};
> =20
> @@ -560,6 +584,8 @@ spi@7000d400 {
>  		reset-names =3D "spi";
>  		dmas =3D <&apbdma 15>, <&apbdma 15>;
>  		dma-names =3D "rx", "tx";
> +		power-domains =3D <&pd_core>;
> +		operating-points-v2 =3D <&sbc1_dvfs_opp_table>;
>  		status =3D "disabled";
>  	};
> =20
> @@ -575,6 +601,8 @@ spi@7000d600 {
>  		reset-names =3D "spi";
>  		dmas =3D <&apbdma 16>, <&apbdma 16>;
>  		dma-names =3D "rx", "tx";
> +		power-domains =3D <&pd_core>;
> +		operating-points-v2 =3D <&sbc2_dvfs_opp_table>;
>  		status =3D "disabled";
>  	};
> =20
> @@ -590,6 +618,8 @@ spi@7000d800 {
>  		reset-names =3D "spi";
>  		dmas =3D <&apbdma 17>, <&apbdma 17>;
>  		dma-names =3D "rx", "tx";
> +		power-domains =3D <&pd_core>;
> +		operating-points-v2 =3D <&sbc3_dvfs_opp_table>;
>  		status =3D "disabled";
>  	};
> =20
> @@ -605,6 +635,8 @@ spi@7000da00 {
>  		reset-names =3D "spi";
>  		dmas =3D <&apbdma 18>, <&apbdma 18>;
>  		dma-names =3D "rx", "tx";
> +		power-domains =3D <&pd_core>;
> +		operating-points-v2 =3D <&sbc4_dvfs_opp_table>;
>  		status =3D "disabled";
>  	};
> =20
> @@ -620,6 +652,8 @@ spi@7000dc00 {
>  		reset-names =3D "spi";
>  		dmas =3D <&apbdma 27>, <&apbdma 27>;
>  		dma-names =3D "rx", "tx";
> +		power-domains =3D <&pd_core>;
> +		operating-points-v2 =3D <&sbc5_dvfs_opp_table>;
>  		status =3D "disabled";
>  	};
> =20
> @@ -635,6 +669,8 @@ spi@7000de00 {
>  		reset-names =3D "spi";
>  		dmas =3D <&apbdma 28>, <&apbdma 28>;
>  		dma-names =3D "rx", "tx";
> +		power-domains =3D <&pd_core>;
> +		operating-points-v2 =3D <&sbc6_dvfs_opp_table>;
>  		status =3D "disabled";
>  	};
> =20
> @@ -661,6 +697,86 @@ tegra_pmc: pmc@7000e400 {
>  		clocks =3D <&tegra_car TEGRA114_CLK_PCLK>, <&clk32k_in>;
>  		clock-names =3D "pclk", "clk32k_in";
>  		#clock-cells =3D <1>;
> +
> +		pd_core: core-domain {
> +			#power-domain-cells =3D <0>;
> +			operating-points-v2 =3D <&core_opp_table>;
> +		};
> +
> +		powergates {
> +			/*
> +			 * TODO: Add DIS and DISB domains once DC is able
> +			 * to handle them properly. VENC and DISB should
> +			 * set DIS as their source power domain due to
> +			 * internal dependency.
> +			 */
> +
> +			pd_heg: heg {
> +				clocks =3D <&tegra_car TEGRA114_CLK_GR2D>,
> +					 <&tegra_car TEGRA114_CLK_EPP>;
> +				resets =3D <&mc TEGRA114_MC_RESET_2D>,
> +					 <&mc TEGRA114_MC_RESET_EPP>,
> +					 <&tegra_car TEGRA114_CLK_GR2D>,
> +					 <&tegra_car TEGRA114_CLK_EPP>;
> +				power-domains =3D <&pd_core>;
> +				#power-domain-cells =3D <0>;
> +			};
> +
> +			pd_mpe: mpe {
> +				clocks =3D <&tegra_car TEGRA114_CLK_MSENC>;
> +				resets =3D <&mc TEGRA114_MC_RESET_MPE>,
> +					 <&tegra_car TEGRA114_CLK_MSENC>;
> +				power-domains =3D <&pd_core>;
> +				#power-domain-cells =3D <0>;
> +			};
> +
> +			pd_3d: td {
> +				clocks =3D <&tegra_car TEGRA114_CLK_GR3D>;
> +				resets =3D <&mc TEGRA114_MC_RESET_3D>,
> +					 <&tegra_car TEGRA114_CLK_GR3D>;
> +				power-domains =3D <&pd_core>;
> +				#power-domain-cells =3D <0>;
> +			};
> +
> +			pd_vde: vdec {
> +				clocks =3D <&tegra_car TEGRA114_CLK_VDE>;
> +				resets =3D <&mc TEGRA114_MC_RESET_VDE>,
> +					 <&tegra_car TEGRA114_CLK_VDE>;
> +				power-domains =3D <&pd_core>;
> +				#power-domain-cells =3D <0>;
> +			};
> +
> +			pd_venc: venc {
> +				clocks =3D <&tegra_car TEGRA114_CLK_ISP>,
> +					 <&tegra_car TEGRA114_CLK_VI>,
> +					 <&tegra_car TEGRA114_CLK_CSI>;
> +				resets =3D <&mc TEGRA114_MC_RESET_ISP>,
> +					 <&mc TEGRA114_MC_RESET_VI>,
> +					 <&tegra_car TEGRA114_CLK_ISP>,
> +					 <&tegra_car 20 /* VI */>,
> +					 <&tegra_car TEGRA114_CLK_CSI>;
> +				power-domains =3D <&pd_core>;
> +				#power-domain-cells =3D <0>;
> +			};
> +
> +			pd_xusbss: xusba {
> +				clocks =3D <&tegra_car TEGRA114_CLK_XUSB_SS>;
> +				resets =3D <&tegra_car TEGRA114_CLK_XUSB_SS>;
> +				#power-domain-cells =3D <0>;
> +			};
> +
> +			pd_xusbdev: xusbb {
> +				clocks =3D <&tegra_car TEGRA114_CLK_XUSB_DEV>;
> +				resets =3D <&tegra_car 95>;
> +				#power-domain-cells =3D <0>;
> +			};
> +
> +			pd_xusbhost: xusbc {
> +				clocks =3D <&tegra_car TEGRA114_CLK_XUSB_HOST>;
> +				resets =3D <&tegra_car TEGRA114_CLK_XUSB_HOST>;
> +				#power-domain-cells =3D <0>;
> +			};
> +		};
>  	};
> =20
>  	fuse@7000f800 {
> @@ -670,6 +786,7 @@ fuse@7000f800 {
>  		clock-names =3D "fuse";
>  		resets =3D <&tegra_car 39>;
>  		reset-names =3D "fuse";
> +		power-domains =3D <&pd_core>;
>  	};
> =20
>  	mc: memory-controller@70019000 {
> @@ -691,6 +808,7 @@ emc: external-memory-controller@7001b000 {
>  		interrupts =3D <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
>  		clocks =3D <&tegra_car TEGRA114_CLK_EMC>;
>  		clock-names =3D "emc";
> +		power-domains =3D <&pd_core>;
> =20
>  		nvidia,memory-controller =3D <&mc>;
>  		operating-points-v2 =3D <&emc_icc_dvfs_opp_table>;
> @@ -885,6 +1003,8 @@ mmc@78000000 {
>  		clock-names =3D "sdhci";
>  		resets =3D <&tegra_car 14>;
>  		reset-names =3D "sdhci";
> +		power-domains =3D <&pd_core>;
> +		operating-points-v2 =3D <&sdmmc1_dvfs_opp_table>;
>  		status =3D "disabled";
>  	};
> =20
> @@ -907,6 +1027,8 @@ mmc@78000400 {
>  		clock-names =3D "sdhci";
>  		resets =3D <&tegra_car 69>;
>  		reset-names =3D "sdhci";
> +		power-domains =3D <&pd_core>;
> +		operating-points-v2 =3D <&sdmmc3_dvfs_opp_table>;
>  		status =3D "disabled";
>  	};
> =20
> @@ -918,6 +1040,8 @@ mmc@78000600 {
>  		clock-names =3D "sdhci";
>  		resets =3D <&tegra_car 15>;
>  		reset-names =3D "sdhci";
> +		power-domains =3D <&pd_core>;
> +		operating-points-v2 =3D <&sdmmc4_dvfs_opp_table>;
>  		status =3D "disabled";
>  	};
> =20
> @@ -930,6 +1054,7 @@ usb@7d000000 {
>  		resets =3D <&tegra_car 22>;
>  		reset-names =3D "usb";
>  		nvidia,phy =3D <&phy1>;
> +		power-domains =3D <&pd_core>;
>  		status =3D "disabled";
>  	};
> =20
> @@ -970,6 +1095,7 @@ usb@7d008000 {
>  		resets =3D <&tegra_car 59>;
>  		reset-names =3D "usb";
>  		nvidia,phy =3D <&phy3>;
> +		power-domains =3D <&pd_core>;
>  		status =3D "disabled";
>  	};
> =20
> --=20
> 2.51.0
>=20
>=20

I compared these core rail opps to what the roth (SHIELD Portable, T40T) ke=
rnel defines.

The HW 0x1 (speedo 0) opps match process_id=3D0/speedo_id=3D0 perfectly exc=
ept for msenc/vde/tsec where the curve ends at 408MHz at 1120mV. The roth k=
ernel also specifies a process_id=3D1/speedo_id=3D0 with almost the same ta=
bles as process_id=3D1/speedo_id=3D1. process_id=3D0/speedo_id=3D1 doesn't =
exist.

For HW 0x2 (speedo 1), when compared to process_id=3D1, the opps in the dev=
ice tree are in some cases slightly conservative compared to what the roth =
kernel sets.=20

So I think all of that should work (except maybe the msenc/vde/tsec curve e=
xtensions?), but it might be that there is some further potential on T40T. =
Hopefully these values are actually just a difference between T40X and T40T=
.

In any case,

Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>


