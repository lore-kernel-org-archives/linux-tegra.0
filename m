Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2066.outbound.protection.outlook.com [40.107.244.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42744205AB9;
	Wed,  7 May 2025 10:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746614931; cv=fail; b=RQ9Z5nrNTHzFY3Ko77mx7NyXdHIZRVEdkUhMzIT1V5A6jE1xO/Lj1ck5xP0W2EkSKm2ukBbKwe1PT3jBTUMb33KBimXSjcedDjjEh5DEYEMMOv08AYjJ6lFnyMMUitAhKehuyUvPwDAWZVDWIbYw/ZsW1EifVRMBixx4edAngrA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746614931; c=relaxed/simple;
	bh=6dbqcI82LgFsrd4sxPGXzeWSgPPGiPQ3pCUrtdhaQUY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jjN/5nBNF5+QkEKzyyIX+FLuhMu8HA5PlkFpDUheEHYwS2movAT45K/d/uZW8r+RDLBAbCDpEfuDrSYsdfPsg/M7GouU3nZ4DGUoxqfZ3cpK63CXT+eyHCpBGemPpIHRT98fHqyMGBo/hAus5BOkqqf7mELln9kN31c7ihMQQVw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KlkoVjew; arc=fail smtp.client-ip=40.107.244.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="KlkoVjew"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Epv7m0ZzDZMXLGX7Y78g45i5DG4r8vF+rXs80YkOITdsY7iHL4+SAwZQwlAVltYblgF4L+jj/oiE0dGiTGuBGoDmwMiKNXujQxEjVKCmDNzOvn3eNd49uk/lQoUEIHfk6aoUEhMykuTJFeesqkH27CYZeLUxwvjjkNP9cneh2p3npdOYDw3VU8IiZJKbgnZus1SqxYBOVFw+tw9+OEUMG+E05HcLaXetmzxTiKvk8ttjc53Ra6vBDzEVOB4lVsMKkqBMXfXzxgVWKlDOisac16zxTRfLFApp+LDLbV6uBkHo4mX7zIEa0Cd55EikxauRsnq5Kpt7VFcVF4LomIC1uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wq/bFXggcN17xmzvH7mH7TInF8q4TDAEw6/QNnsxZCE=;
 b=CRuIRlWDmwBbd4UfblhkAaBbJdAHkO2/wSBIBxnQVhvBQPIK78LikTJSfyMHK3YqHbF4oQa9pUJjvaZqDSGi0CJedk1qJ7JyU3lMIF32quqIB4Uut3lCh6xJD4+Vs3HOP3bXq32v5DyyfPBWpd/j/E/+dVmE+CVNgG5hsmZsKyvIdQAjJnVBZfQHJGAmm1a57Etq1hssvUPXJuVJOajddB8hOU31IzyLDXiGHRf2r+wKp5eVSXghKkBKRp5Q53FkeQe+/k+sl3TgkcToU9yLjL6Logd4Fd3jmHiBC3vmGtGuUE/MlgRNfhiVXi75CgjYX9oP1k4EjU/nlg3d1AFHDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wq/bFXggcN17xmzvH7mH7TInF8q4TDAEw6/QNnsxZCE=;
 b=KlkoVjew2rIr96380Bjfr5yoj/VWSMAbnz82Y2m8WSHIl2FJ7sQ1uCT7miJlcOfjAaRp3KJx0YLTeErrW31knqzheWmNyF+8VQys0Pj73ysleNB6qVG6mp/GOp2YDdm09L92gsXL1APYcHLMCLNeYTZdh3mUKlmzK7Tn951aGYgmtUA5XnOoIscwaD5GJs/ijm1ucV0Ge0Mx5NHkTbJ/ZKsIHTWNcMUqJqyC9Q6A07onLxxzeKKfressIPU5u4eU7rlYbcaKZgCiwf/hbgjn650QE0SGWpKhCPT6z4jSB2gq3aqKrJPVWciTamdaizoRgxWphHk/780uG8T/SUaykA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by CY5PR12MB6227.namprd12.prod.outlook.com (2603:10b6:930:21::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Wed, 7 May
 2025 10:48:42 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%3]) with mapi id 15.20.8699.022; Wed, 7 May 2025
 10:48:41 +0000
Message-ID: <660c781a-6923-4cc9-876a-f33ba782c923@nvidia.com>
Date: Wed, 7 May 2025 11:48:35 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] phy: tegra: xusb: Default otg mode to peripheral
To: webgeek1234@gmail.com, JC Kuo <jckuo@nvidia.com>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250506-xusb-peripheral-v2-0-bfbe00671389@gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20250506-xusb-peripheral-v2-0-bfbe00671389@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0137.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::15) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|CY5PR12MB6227:EE_
X-MS-Office365-Filtering-Correlation-Id: 3aea2abd-344f-4ae9-ef4c-08dd8d54bb39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|7416014|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ck81UVZvd244K0VtcmxlbDVkL0hSNmpXajMwMWU4VEZtTHk5TGszeEYxM0NV?=
 =?utf-8?B?NXdjck1tL09vcFovN044Zi9JMkpuQlVIcUplZmtiQkU0MHhVbWtpbUd5TVd5?=
 =?utf-8?B?VVl0bHR1Y0NWL2pTdVkvVWk4N1V1OEJ1M2NFZEdob0RvTUdmcXBUYXRMMWFs?=
 =?utf-8?B?QlF4SUlaTzhTU3JLSGp3UjFMN2E1L2pBMW1WWHp3aWQ4c3llaCtvQzQwb0pi?=
 =?utf-8?B?dFVIYTVqeUJrcFdNajNobXE0MXdXc2Q2cDVNZHIvQTZ4WWpsOUFIT1NhUVhY?=
 =?utf-8?B?MXNwcVhCYVQvRHA5MmJPMUhxYzB5bjBtQSsvc1p4OTJvSEFnRFFHaVVpTzF0?=
 =?utf-8?B?RmVtQnZrcGQwdGFWUEZYTWVhcEl4cXZPdC9TU3FPSDJGODZIRE9XZ3lCU3FT?=
 =?utf-8?B?ZE83ek1KcERYbmJPNG80L2ZNVlNrTUZjajllNWZNdnV6YXZ5QmdIVFRTSVFn?=
 =?utf-8?B?ZGlLNDlibSt5ODdXeGVKL3Z3MFIzYWxndks5OGJkVjk5VEtJYXgzYlgrMTNp?=
 =?utf-8?B?Y3BUdVpTMDMwTjRWUHh4S01OZ2ptRjNsOGEwcmN3eW9VdmRHbktjUXZjMnRE?=
 =?utf-8?B?dkZUZExtNUtBcyswRzgvUGU5bXNuZC93TDNGbElLNkpMQ1doOHRYdVg3dXdI?=
 =?utf-8?B?TmRsL282Vk9Ib2Z6ODJUb0pJenBHVlNQNFFVcitxYnlHclVKVExvNUV2ejl3?=
 =?utf-8?B?bjBYZ21SdGVoUE44MFVNZ3NRTHl1MjBvczlLZXNjVHd3cEVWTWxpUVEybTdR?=
 =?utf-8?B?Y3hINHAySW5YdHA5bDZmRzI2SVo2c3p6eEY4cDBkSU0vbG4rckFnY2V4akVh?=
 =?utf-8?B?UUlkajNZaG95WVhZVVlUcndsWUhTdWZpRStnVlRkRk1GYnpuNVVxNERTaXVx?=
 =?utf-8?B?SlZNYVF2TkhuMnBTM1VtVDlGTExVNUZOSjg1UHFvMlRRVE5oazNUWnloQk9M?=
 =?utf-8?B?VEhEekMwc0t0bFU5MWhFekxXZlNpaWhhZktMaGtyUWErOUJDUzhkNk1LWFQr?=
 =?utf-8?B?OHVsTE9DeGg1TnQwb2IzcnE3bEgzUGd4dkVmUnc5ajRQcmpZQXAvTFlNWWFt?=
 =?utf-8?B?VkZzd0RqUE0zQWF6dkdLSnduZTRHWGdYa29iakZVbERqNnB3b2JPM3RWVjI1?=
 =?utf-8?B?aUdFOXMzQnVQUTdLM2tRZWlvbU56SDRveWVDREdzOStMQnU1dUdHeDlxVUdM?=
 =?utf-8?B?NFJNanZqV2lCWU5IWk5mY2dmSDg2N2RhcmRSTUJWWkJhS2pCODdXK2JPeElP?=
 =?utf-8?B?dEZ3QVpmWmlJeFJ2Nnd5b2RQdkZFY255SlR0VXJMM3F1TjlVWXU5dnpXanN6?=
 =?utf-8?B?eFJiRlEwZ3ZJb2RXYzUrTFpFSS94QTVTNzVFa1IxQjg3dmRjbkFOUk5yMXB5?=
 =?utf-8?B?aFQ2OGR0bXNhbGxNdTVmclY3VERHYS9zRzM5ckFlMmdBa0luaHZSeTBHcVEw?=
 =?utf-8?B?MUNSRi9ZOWNsV2ZLTVh1NmJNSHN6dXFlOWsrcndoYmlVNk9QYXlJWm5vblJD?=
 =?utf-8?B?eVJiMlRBYVZ4NnZyN0doMlQ1VXVBTDM5cDBuYTRPbVhLRko4K2RDZWZjT1Z0?=
 =?utf-8?B?dURHaWtIRUxvakVHcVdLZXZSOTF0TnFlbE5hTlpCeXNzeHIySHJFQ0l6M3Vt?=
 =?utf-8?B?KzVFaTRsOWl0aHJsVFZ1eFY0WnR3VUU4dk4zNUoxTXJGUnVTd2lXSlk5RFh3?=
 =?utf-8?B?Q0J4cjhSYytOeFJGYSt2Rm9JQUtDR0N4Wko5eDJUWTkrQjM2WjhHVHFteXo5?=
 =?utf-8?B?dUl4bWxJdWM0eUlHU0dPR0pBWjRuZGlDYjRkZXQydU1hdjNia2NwNlA4WTZq?=
 =?utf-8?B?L2Y2R3c4ZExTMHVrOHlSclBJaG4vRkNNN0tGZGlNbXVpY1NRckRySytWczJO?=
 =?utf-8?B?SC80OUJmdGltTUdEZlJYRWhGR1VBdWR6MFlNcFRnRFArenl3ZGI4eW91VHZj?=
 =?utf-8?Q?BjCtuvoxYPs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(7416014)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZXd3b2dvK0N5bjdUcXozcGtVeXZ5OUhoMnIyNytqWlg0MXVyZ0R3azRzWVJx?=
 =?utf-8?B?VnVieUZhT21zZzU2NDFaNHdWbDF1eWdFeStsYkIzQnpqVkJOWkVteDRzZEJ1?=
 =?utf-8?B?SlJoZm1mLzFpUkNjZ1E0RUpaRzdXVkxLMlN3ejV3Vy9Hcm5NZ0dTcFp6LzJU?=
 =?utf-8?B?c2xDYWNCUXJOeWgrWGkwNTFlbFArd3JROE94U2owcDFsc01za2tFT3kzUkJK?=
 =?utf-8?B?U1NlRTVIMTFKNkEvQ3V4Yk9VdDA3VkFidk1wSjJOdHVpajRuNGs3OEVwM21T?=
 =?utf-8?B?ZDN3alJwUWxObUVQRFNSRmdFR3BtSkVZN0M2WGw1UWVxY01nSFR2MHVRTlR2?=
 =?utf-8?B?c3NvUFhPYjhNRWw2M1pmczFpUFNIYWF5VGFhS0h2WjgreXdNNkVvNHFLeE41?=
 =?utf-8?B?SkttQ3pNU2h6YWkzQWZaZXZ4aDliampuWWpxTisvZG5MMGE2dW5PMWYxSlpv?=
 =?utf-8?B?blpMM0g5aDdUaFA3L0VUTGZUa3JQVkxMT2dOMWREVkpBYnhMckZOQjdKTlpr?=
 =?utf-8?B?RHdXdDVmVG5qcW5LWVNURXVIZTlpQ2pFZTVJZU8zUERvTFhnWmFXS01WTHFt?=
 =?utf-8?B?eDhEWG16SzR5TDVCNkNzQTVzaWZzUUVpdjdhbnFqRGFLd29IcFdPYzhRSHVn?=
 =?utf-8?B?Y2w4UUdXc0NpSHIzTWo5ZHZZQ3d6UUtLT0hkckpvblphQ2NGRVl2VVdmanpu?=
 =?utf-8?B?NWVQU0ErV1dlTllYZ1dOUEJjY2VPWElKbi8zV1lRZWl4YjFMS283QXRCaU40?=
 =?utf-8?B?RjI4OWt5bEtYVEhTWWRPTUMvRUtMcXlvUVBZUmNKTEZMNXZvSXlVWlFIRzZk?=
 =?utf-8?B?cDg5NDlzTXpaSGRXNUdRR2lYcSt6S1VaM1A4ZzVsdVVyRXNrR3BuTVBxdDdl?=
 =?utf-8?B?M3RsYTV2YmY2RDNSQnhueDVZelcxbUpLTDd4SHpWeHdtY05Zc2w0Sk9NVWNJ?=
 =?utf-8?B?U0NOOHl5RVhqbjRVRWFpRnl6Y0Qxc0tCUFdEQ3RvbC92Y3FMWFdUcUNGTVBR?=
 =?utf-8?B?NzBhNkJOUzhYakpjeVpRSHFEUlgrYmNNQk9zamt0UHFlUzMwYTlVWXpoQ0VR?=
 =?utf-8?B?dTBibXdRb0V5Y05qSWM0ZWhwdURBSFJKR0tqbS9qMWNUM0NweC9EZmJYelB1?=
 =?utf-8?B?cHdTb0dzNk5jTzFlYmJ4dUd0MytpSG1aUnFyZWRqb1I4MUhEOGJMU2ljSlp1?=
 =?utf-8?B?M2I0NjZ2dGd6Uk9ZcXJvN2hXZHVFOWQzRDJIWnJDSTYxaDJwUGxoMko4TFhT?=
 =?utf-8?B?dVhNT2NNNkR6b2pObTREWEZ6R3JzOWVMS1A3bjhWOUNzSER3NDN3WjRQOEtu?=
 =?utf-8?B?WFFGeDhpOUpBUEtrTXgrS2hTU3dUaVlXYTU4WmkyY0NBbC9nakhYRlg4cHQ2?=
 =?utf-8?B?VytQYVpOcWRVeFpSQjZ5ekduNXVIOENzelFId0xYQXdPOWxycFhTZmdoR2Zl?=
 =?utf-8?B?aGhBVzl3Qkg0Z0tteGpvMkgxL0JXMDE0UW1QdC9nOTEvNjEydGpkRW5tR0R5?=
 =?utf-8?B?RUs5eThManEwdWlhYlVnY253WGlDRHpvKzNnWElaUWdBbXlrRG5wVi9JdFdi?=
 =?utf-8?B?aW1qaWI1ZC9mK2NRd2RrbHpvYlBkd1IwVjh6dEhtVkNCc0VpN01td3VTOVEr?=
 =?utf-8?B?MEpkd3E1K3k4K3hxb0JLK25QRXhuNGtRVXRoZG1YbHQwOFYwOWpqWFRSTE9F?=
 =?utf-8?B?eFAycjhOemtXT2xHclRldUt1T0pNRVhRY3BzeU9HbVc1aGtieXJLQjZxTHdo?=
 =?utf-8?B?V3JDOEFBQVVBcCtYcDJyOHZPRU9XWEpWdEdaYUdOMnBuSHM4MWRIVExHMmNN?=
 =?utf-8?B?UklrMnhUbE5ORkdVSFRTYmhCM2R5MFNmb0UwdW9YQkhYSWtjRzlLUll5YWpF?=
 =?utf-8?B?Y01DMThKcnJGK2tlcXlzTXg3Wk1IdjErVHlVVHN0eXFSMWJWM2pqbWwxZy94?=
 =?utf-8?B?K3JwUU9pdUVGTGhma3FEWW5JUGV0Z0xnRXRFenkvR09mTG0vYzk5dXJjbk9j?=
 =?utf-8?B?WFJTSEZzWjdoNlBIQ2dEa1V4b0JzRXU0U0dpUW92eEVabHJOQUc5ME5iblUx?=
 =?utf-8?B?RFVXejNCWGV0TWozaStLVXBoZ3hvM0VDd0YrQWJwOGxMLzI5MmRsejhrNmMz?=
 =?utf-8?B?UTBwLzBLRU1hdWpuejdIbXpxbnowQmMydVVMSTFaWVluNFZCV0ZtOGJIYmIr?=
 =?utf-8?Q?Dw2uxWa2yOzIX+QSS86kBNbYxIw+RzfE9JcA8ghf+vwi?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aea2abd-344f-4ae9-ef4c-08dd8d54bb39
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 10:48:41.7352
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rwccys89FYf5lSAydSb3GrcYR16HJbia7UE2FCLtADqx1vGQEWwVShEQ7mL3mQHEiNDxQ/rtJYTatpOPsnO9fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6227


On 06/05/2025 18:09, Aaron Kling via B4 Relay wrote:
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
> Changes in v2:
> - Add new patch to document role-switch-default-mode in xusb padctl
> - Simplify code change, per review
> - Comment in code why device mode is default
> - Link to v1: https://lore.kernel.org/r/20250404-xusb-peripheral-v1-1-99c184b9bf5f@gmail.com


I have been asking our team about this and this is the feedback I 
received ...

"By design, a port’s data role starts out as USB_ROLE_NONE.
It remains in that state until a dedicated role‐switch driver, such as 
the GPIO-based driver, usb-conn-gpio, or a Type-C controller driver, 
CCG, probes VBUS/ID or CC lines and tells the USB core whether to switch 
to host or device.
The role-switch-default-mode DT property exists precisely for controlled 
use cases where a board truly only ever needs one role and doesn’t 
include any role-detection hardware.
In that scenario, you’re effectively opting out of dynamic role switching.
In the general OTG case, though, we shouldn’t assume the data role of an 
OTG port.

In his case, he should work out
1. If his platform has a role-switch component, then he should enable it 
rather than adding this change.
2. If his platform doesn’t have a role-switch controller, add 
role-switch-default-mode = "peripheral"; to the PHY node instead of 
changing the core driver."

So I guess the question is, does your platform have a role-switch 
controller?

The bottom line here is that we don't want to make this change by 
default for all Tegra platforms.

Thanks
Jon

-- 
nvpublic

