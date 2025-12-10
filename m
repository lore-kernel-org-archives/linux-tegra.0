Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013003.outbound.protection.outlook.com [40.93.201.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0AC3B8D67;
	Wed, 10 Dec 2025 21:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765401861; cv=fail; b=tWAqakcEfVUDLxmYkowkrS2+VlqJmTkxz9nvsxRvmJuM95KpiKP3LB73MupKooHX7XdeXlEWexHAJqRQw2mC+uS5CMwjIOfkrk+tHj2cSRajbANRig7+KvTaCOt8TtEMOx2IWuZnj8U1zj52d/pR2LZuz5eq4aBkoLXfltZeMxo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765401861; c=relaxed/simple;
	bh=1xKS7TAT+wF4g4tCVkstqbz77Ba8Mt4zSBLmRyYTYXs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DPy0Ont/p8VSD9FrER28HLIPndLkz4yPw6O9sT81k64p/bNZQY4ymeJOAckdQ49kW1kezej+M+96UNBkrFoNKlYMDh3TCX0g9RfsaRhGnc/yBaZ40/BFqtTX/+TGOVg6yyJ937xw+Z7oYOxCVygas2VYP/pi8mrWr9saoMlaUxU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=DUFczC9a; arc=fail smtp.client-ip=40.93.201.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="DUFczC9a"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oqp2nIsRSyOEmLa8a8AP7cw7vyCpD1tWGhCpnTZKO4/zbW20QU6G0Zrqbj1V9hR/Xb05tveWL95gIS4uPWq4N0qQTV0L6uyo2cUkOwyP3/pmo8KEeTY7FSuFG4wmOWJpjP67gKCIlA9A1xVjosHknxcLZN4NFzOYLx9Ay5fGGSNczKgcvAbCbhg01TIuFy9PFziPO6V5ZKl+uE6KqtE0XYO+vT4r/0e9qLZlb4iPJ/SgAcD4HxgN9ubw5HWefUWKKCDtlwpxgLiVYTYeNvIko2WtWRU8CmHVuzaBRsPOhs4mh/mlVzfdLcPYqM+/hRKVFVECsczCDvqh+ElU5Soxnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K/XadU+BpInll/ggEyAOy/HTNBNlGGaHIs1bVF+a8GU=;
 b=tx5NiaMV7Grikz/UXYIORwnkbKpsGnhDcV6h7jmbAxNVnWDSW1wmbs3g+gyoCclYsLjheWGWoTnUKwrBO8Eh9kQHyooNQQeLAy2EQyFQSFl7opugNmxCGT1M9L7JcJE3RIYWUi+VfIpshENhmCcNeCZaMHgib/i3tjVax3aCLvIAtPoMxzdvq79RMzoapzOJ+y4ZLGkeHVnsLvih707Kl+Y2GBXx3d7uDLTK7ssZJtZ6ntj2u06p0NHxedwckExgeB7wEl4SlkprF/wxzPElIDMniWBH8N7UE2fu5JCCdsWVhsJhhgEhfUJj95JdWEJlgf9MzQ5AXNET0xVIkM3Trg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K/XadU+BpInll/ggEyAOy/HTNBNlGGaHIs1bVF+a8GU=;
 b=DUFczC9aL/HBoi13JZKqMThoydTRWLVkQLyWmweGtUfGBnqdS5dKljnuLr5AzX2d6mrB+NO/k4YKthj+yh6EBvSQBsfDBo6rk+lZUCbX/unXPlWuEHR+kTXA/WtI6JLO1T3nXxXkEE9SlXUKCHAAGz/RSN+X/pSqkw2fibRhltXm6/TOsWwxsaUlVOU6nJ0CoEtvRzkQkgyrOxNysfq4BdC+4/LVetIPwhVqHweSIeOycgPt6ba1MhG55K7OPlxWLCjrN8Yc6D3GFl6k0992wVGRkzqpdBHQ7VAwNDit2ZPx9xPy8O1Pwxju9ZoAGgRrVWEYVaB1xCfVJM+JlnEyZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH0PR12MB8773.namprd12.prod.outlook.com (2603:10b6:510:28d::18)
 by DS0PR12MB8318.namprd12.prod.outlook.com (2603:10b6:8:f6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Wed, 10 Dec
 2025 21:24:14 +0000
Received: from PH0PR12MB8773.namprd12.prod.outlook.com
 ([fe80::47a4:8efb:3dca:c296]) by PH0PR12MB8773.namprd12.prod.outlook.com
 ([fe80::47a4:8efb:3dca:c296%4]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 21:24:14 +0000
Message-ID: <1b9f0b14-876c-4c6e-90eb-b04d016f88e8@nvidia.com>
Date: Wed, 10 Dec 2025 21:24:02 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] memory: tegra186-emc: Support non-bpmp icc scaling
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20251027-tegra186-icc-p2-v4-0-e4e4f57e2103@gmail.com>
 <e6ce190e-6df7-4c36-abca-f09df3cc80e7@nvidia.com>
 <99ca4992-5736-417d-854e-379542549bee@kernel.org>
 <7f3dad08-cff5-40c2-8e7f-f6441a3d6b91@nvidia.com>
 <d5d23eb5-f43c-4e4b-9926-3fba6ffd3acf@nvidia.com>
 <CALHNRZ8vFJyfFXbxFehWA9TGkdrEUy9Wsm-DxEOT=tVbYTcU5Q@mail.gmail.com>
 <249bbe7e-e2da-4493-bdd5-8f4b17aff8fe@nvidia.com>
 <CALHNRZ8uPaKqSpFWkmYZn==Xw=rxh95Xm0_6LPN1HDj20zofqw@mail.gmail.com>
 <d16803e5-7b6d-4472-b50c-aa324cf52736@nvidia.com>
 <CALHNRZ83Q2Ha8VYoWAnqoCZQ=Fd9rtVRVLwRFxAY68ePQ29GHw@mail.gmail.com>
 <29cf2c16-3a0e-42c5-a083-16f77ae5d09a@nvidia.com>
 <CALHNRZ9KAv-hL6+6Uiaz2O2odm1rqMnjNxNVPsbCOdqX15KTuw@mail.gmail.com>
 <856447ae-4338-471d-a71f-a34aed749ac7@nvidia.com>
 <CALHNRZ9y0n6JNfeDUQgZoECkxo+We0_G8TP0H4advcSqrX86kg@mail.gmail.com>
 <f906f85f-b110-4328-b177-02fcdf7ffe53@nvidia.com>
 <CALHNRZ8go4ATHgJ4SE=7pkAMgRP_0tj5z4pDXjxicV9o7F13Ng@mail.gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <CALHNRZ8go4ATHgJ4SE=7pkAMgRP_0tj5z4pDXjxicV9o7F13Ng@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: KU2P306CA0085.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:3a::15) To PH0PR12MB8773.namprd12.prod.outlook.com
 (2603:10b6:510:28d::18)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR12MB8773:EE_|DS0PR12MB8318:EE_
X-MS-Office365-Filtering-Correlation-Id: 078ac821-88fb-4066-fad6-08de38327806
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c1dZSEI4clZlVmp1YW80SWx3S29LOHRuOGVEemtKNjVaTGMwMDlwaE5ReUhO?=
 =?utf-8?B?eHFZVDRXNHdTaW0wQmpSOWlBSUFWOUJWc0YweXNvaGVqOGluZGU5WG9OU0E2?=
 =?utf-8?B?SURHWjl1cjRQQWZnVVNKUmJ2N2FrdTZlUFEvWHZHVEtTWFRTbGlLY3hhalJW?=
 =?utf-8?B?UDNlbHpBTGxiNnpna25RUnA4QWRjQjl5d3VHdWU2SjRqNkR0TUhDTnNIa2c2?=
 =?utf-8?B?Q24zS2I4RDhKYWtDQ0VrQkxLRWcvREg1WWI0UVhzYTAyR3RvUmQ1anhoSjcx?=
 =?utf-8?B?U1gxY2o1eGF6ZXRiUm1lLzEzSnV0L3dOVDlVK09RYkFsQ2p0WjRXK0p3MmtP?=
 =?utf-8?B?cGdOazFWWERSR0pmTHMrZmRxVGJkZVVjSVVabUNZNVlKL2RycGVJTWRNWEFP?=
 =?utf-8?B?RUZPYUUzaHdPYm82a1ZMTmE5eEZWcGF6K2MzYkNuMmNMTXFMUlhmMzhmSEs2?=
 =?utf-8?B?MVdqdnZQWEZZWG5EajBNNHJ0Zk80WE5GYzZvUGc0Y0RYcnpDd1M1QnVEOFB6?=
 =?utf-8?B?YkV1UC9vRUNDYURxckJPa2ZMKzJ2NkJ1RkRNNkM2TTdhaGczN0RVTElocGFy?=
 =?utf-8?B?cW5GbE9ZUlZURjdiNlZ3SnArY3VxR3dNTStSN1pKTlNKM0dqQ2hFL2ZxZVJQ?=
 =?utf-8?B?c2twSkI3YThwQzNMb0ZMVTV2YXVFTTNOMlFicVNoSlNoRkRPbDViL04yTExT?=
 =?utf-8?B?Wmc0L3ozcnpxVWRYbFhMdzFFNmJNaUM2VEpscHBPS2lXZS9LVUU1L0JqTXQz?=
 =?utf-8?B?VlRYTVJSNU9PSGZxMUwvWGxreGlIQ3BqdWRFZ0hlMkhRK2JsbEY0Vk9lVXU1?=
 =?utf-8?B?cksrOWJWeDJpTFFORmRnckxIZjY0bkZRUDNidWtzcjdNdUZmMUN4MmZGV3FE?=
 =?utf-8?B?em9PY3Ywa3hEZTk0NzJNQ3NMdldxSEZKQUc2Um9CUi8rTTlBMC80UXFWU3Fp?=
 =?utf-8?B?cUFvZnRBbDFvR3pXdWJHa0NlU1JOZ3l5eloxY2Q5SkFCSUVnaVp2SXM0M0Mr?=
 =?utf-8?B?OWNSSUYza2FiZHpVMUNEZ2kwWGxRU0hBeFp4bjNTSDZjNnVkVERoNm1PNjc1?=
 =?utf-8?B?WUpKeXVXZkJ0TmhoZUdSSUNNVFRkL2loaXF2a3M5MDgwdzM5VGhSSjVMTnNX?=
 =?utf-8?B?dkJKNXpVVndLVDF5YUhBZFZwOW5EQmpPWVUyV2txYjkrdDRoQVBHeTRnZEs2?=
 =?utf-8?B?T29RVmRDY0JZQzg0TkZCays4UzFzeDcvM3N1Vm14QjJOZGFKTm81SUw0Y2pi?=
 =?utf-8?B?Q05hL2VJdVM2ZEVWUUhYaG1jbnpqSVR2akJPdGhiZ2dkaFhNZlNBeWZQZTlL?=
 =?utf-8?B?d2tsNTVpbWcxYU1ONWtNOTB6M3FDQTdMMzJ4aFpxUTRwbS9Hay9vQWgzZVRC?=
 =?utf-8?B?bGNpem1lUURrN3VwZzR3a3FiNjRqUHl0OE9TR0JjUVoweHNoNERjNm9sbUVM?=
 =?utf-8?B?bVl4eGQ0ZGdLUm1oUlZHcFJzNHRKTW10VTJMNDlwS0V4WGRlVDJQbXcyYTNG?=
 =?utf-8?B?bTU2TDFzaE5rZU4veFNzMGpxSitWak1hcjdkbld2S3FNT3ZTajdhcHFBVVc0?=
 =?utf-8?B?RWdtTnV4cFgxRW14dC9BNTNMNlgvR0x2Z3lWUUZJdzNuemdReTJ0aEEva3ls?=
 =?utf-8?B?R2dVcHlZYy9taC9XV3RQaWM4Z05KYlZZWlpIaVgwS1A2Y2xPemxIZFg1dGt2?=
 =?utf-8?B?eC80L2NVV3p0bG9tbzd1R1pqVUVET1ZQVWI2bll5VXBHQ3dUZ1J2YnlrVGxr?=
 =?utf-8?B?QjFLRzQ4N1hRdnQxVDVoZ2g3R1N6SG9kQnZBc2pQQVdQN2tMTko4LzY5WkpD?=
 =?utf-8?B?VjZMN2pRd25PWDFyenhYOVluQytIWndMZXFCaVRYTi9vMTBkNE51SDY1czEy?=
 =?utf-8?B?enljVGFQTHRWR2xReTlYSXdZNW9DMjJ3MmN5MWMwQk9xSjhML1dIMENoTzky?=
 =?utf-8?Q?Jztd1VzP2Xq1/l2vVeDfHCEg98h6KCXR?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB8773.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MlhqMVZ5alhJNzRwMzhjSCtNaExtdFlHRHpPZUp2cWl3WTFqSmhmS2p3OFVV?=
 =?utf-8?B?YzdleWlWMjFUemRROXhFQkE0SzJhSnM0WStPeEpQd2tRYnFQWVZuWk5EMk91?=
 =?utf-8?B?Q2hPUlFXSEdxMDc0OVFQOFN2RTJVTTl4ODNXc0pXaUFuSUpSUE9wTkFtOXBo?=
 =?utf-8?B?RnR6N0hQU0d5bHo1MzJ0b1ZTVHdiUnZ5NXJOYUV2Q21OaG5vN3pENVZBcWhQ?=
 =?utf-8?B?WGExYWtHeGxTMC9EaWVjeWdIVFBWTm0wK0htY2NoOWhpZkJEYUhhR090ODNo?=
 =?utf-8?B?UDZMM0xvQXlJMVJFQi90ZWx0VHNFZHdYSzg2aVl6MkJYZm5kSDVnUnFQZHpw?=
 =?utf-8?B?MlhPbkU1cXJ3Zm02aW40TGczdzNTdGJ0Q1RTOEYzRlRmQzFOYmFKejN4SUlD?=
 =?utf-8?B?cmtGN3Zxc3ZWQjZ2eTh4Zmt0NlpKZHppYWhPSHhqY2phK1Vvbzhudk1mMStD?=
 =?utf-8?B?ZUNyMTRYNkU3S0o5Vk9UMDhoK3dGdUVXV2tCVW5VZWdrVEsvY09WcldrMTRR?=
 =?utf-8?B?V2xxMGtFeG4xS052MTVodE80L2ZKTVg1aVU3bi85MjJFdm5qWU51TXU3a0lq?=
 =?utf-8?B?VVNjNFB2aFRsLzBuaGpsbFJNSFRUQ1R0aEoySk54a0trbDc2Vm1FbUFwRVEx?=
 =?utf-8?B?MjAwMGc1MXU3MHpVRmtUaTZ3aW0waHpoSmllbmtycnJDd2FwK3hpdDV6Vlg0?=
 =?utf-8?B?bGRvb1hVemlha08zRkdPTThnMVhLYUxKNmljTlJKT2lsZ1FKWWpHeEkydW95?=
 =?utf-8?B?bEEwem1zVGx1QWhjOHgxeFhHRFNiOWhHU3JldVNZQ3BrSmFkUzlaaHdnK1RT?=
 =?utf-8?B?VjZ4dHVGeDNFRUQ3TG5JNzJ1ZVgyblpScUpROFo1RHhGbWJyaFlPRFlJRHVv?=
 =?utf-8?B?ME1EbzFienFJWU1BUnpwZWZaV3hIaXorVHc5K01iNUlFN2hsK3kvRjZsRk1s?=
 =?utf-8?B?dTBERkQ1Ryt5OUQxUHhFZjVnTHBPMDcxc0ZmWGV3Smw1KzZYTWhZeDlQekNz?=
 =?utf-8?B?QTBoTWdPSXlQVklPekFoeERIVGw3dnhzbmZ4L09BZmxrVGpFZ2JpTGt5My94?=
 =?utf-8?B?Vzh6am45T2pEbGpyNSt6SG83ZHJEUnc2RldwSVBmRE05YmhYekM5SmpNMWhl?=
 =?utf-8?B?Q2oyVGhuMmJZbklsWG81Q3ZNWGE1WWFFV1l4TjFFcGFZQnBteU8vWXJwLzZ4?=
 =?utf-8?B?enZHSUgxeWJaMUwveXNDUnZROWIzRFRiZTFmenhMMXlGYVUvaGJtTzlZa2w2?=
 =?utf-8?B?bWZzRmlKWCtiTTZ0WFMyWnZ6UHgrY2t0WEthQjQ0OTJObmhQakVTMkQ5Qkc2?=
 =?utf-8?B?amd1RDRoaUI1dFNIQWJLZ3VuMlZocEIzVjMwd1Robi9JT3M4OXJmRnlVWkNP?=
 =?utf-8?B?K3A1UG9ndWxXWHlsbElKSDRIZ2tuWGszL3hNNXZyT0hUSUI0dVJuSVNlUDJY?=
 =?utf-8?B?QTZycXkyc0wzNTFWUDlmNWdpZGpSZGN3TzZ5TGdXRDRaWDFqaUJuaFUwTmdy?=
 =?utf-8?B?MyszdEtQS01uK0VmMy8vWGthc0RYWlB4UFNNU0J1NFVjU0tmV3NtVnFHcUxh?=
 =?utf-8?B?R1l3dnpMOTIzS1A1d29iOGdBQzhQSHUrUGRvZjZ5dk4rUVpVb3E5SXFLQXFa?=
 =?utf-8?B?L0pUN2VDUlFTT2ViU2VqOXZ1eVZjZlJwdjBHa1UvZE5ScklwbGtQbExGWjZC?=
 =?utf-8?B?cU1tU2trS1pub3lLcU9zWSttbmRvbkRMRmhIMzZRL0J1MXJEU0ZSRVJZeUtz?=
 =?utf-8?B?R1lFN3BvZWpScTIvMElpU09UTkpPc0lMbnlpek52ODRmdG5JMk85Z3U5dlpl?=
 =?utf-8?B?S3czN2R6MmlSNTFkbXdiaitqdkRmdXdQbXEzTGVwWktHbHhKT0hTRGFZUnJX?=
 =?utf-8?B?K0pCUURQVytJeW1mbnhlcXNmeG9PMy9KTUlXMTFDS3FLNnRzUWpGSkFHeWhH?=
 =?utf-8?B?ZEdIZEpKTWxVVUtkZ0NZRnl3RzdwY2RDL3BPSTJsR3Zyc0x3N0xMSWtSWVRr?=
 =?utf-8?B?N0wweDAvbHRCWnVWem9lSVlrUjl6RlZ6bVhEM1dGeGlEcFpHVmtYS1Z2NXBu?=
 =?utf-8?B?b0hNMndaSFcxS0lrRHpqT0xhazRRZzdEVGFuNEtVV05MUk1ySDAxbEx2QkM2?=
 =?utf-8?Q?AAIoWLUSXm/OdJ0qQQRjkNyjI?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 078ac821-88fb-4066-fad6-08de38327806
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB8773.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 21:24:14.7788
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6kazZYguUeRc62sbDkk2dvCubL0W4dpVZu+/nwmshoHFd+pdirPuiNOMWmorkFMn0837SisapX8E9q9gY5b9sQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8318


On 10/12/2025 18:32, Aaron Kling wrote:
> On Wed, Dec 10, 2025 at 9:04 AM Jon Hunter <jonathanh@nvidia.com> wrote:
>>
>>
>> On 10/12/2025 05:06, Aaron Kling wrote:
>>
>> ...
>>
>>> Let me try to iterate the potential issues I've seen stated here. If
>>> I'm missing anything, please fill in the blanks.
>>>
>>> 1) If this change is applied without the related dt change and the
>>> pcie drvier is loaded, the emc clock can become stuck at the lowest
>>> rate. This is caused by the pcie driver providing icc data, but
>>> nothing else is. So the very low requested bandwidth results in the
>>> emc clock being set very low. I'm not sure there is a 'fix' for this,
>>> beyond making sure the dt change is merged to ensure that the cpufreq
>>> driver provides bandwidth info, causing the emc driver to select a
>>> more reasonable emc clock rate. This is a similar situation to what's
>>> currently blocking the tegra210 actmon series. I don't think there is
>>> a way for the drivers to know if icc data is missing/wrong. The
>>> scaling is doing exactly what it's told based on the icc routing given
>>> in the dt.
>>
>> So this is the fundamental issue with this that must be fixed. We can't
>> allow the PCIe driver to slow the system down. I think that Krzysztof
>> suggested we need some way to determine if the necessary ICC clients are
>> present/registered for ICC to work. Admittedly, I have no idea if there
>> is a simple way to do this, but we need something like that.
> 
> I'm not sure I understand how checking clients would work. Is there a
> mechanism for the emc driver to know if cpufreq is registered to icc
> in a way that works with probe deferrals, but also allows for it to be
> optional?

I am not sure if such a mechanism exists either, but it seems that we 
need something like this.

> Alternatively if there is not, can we just accept the abi break and
> have this and the dt change depend on each other? I know it's not
> desirable or the first choice, but if the other option is to rewrite
> part of the icc system, then perhaps it should be an option.

I am not sure it is an ABI break, but the default performance might be 
worse. I am not sure if you are proposing a way to enforce the 
dependency or just saying that there is a dependency. We can't do the 
latter, but if there is a way for the kernel to check the dependency and 
make the right choice, then that should work.

>>> 2) Jon, you report that even with both this change and the related dt
>>> change, that the issue is still not fixed. But then posted a log
>>> showing that the emc rate is set to max. If the issue is that emc rate
>>> is too low, then how can debugfs report that the rate is max? For
>>> reference, everything scales as expected for me given this change plus
>>> the dt change on both p2771 and p3636+p3509.
>>
>> To clarify, this broke the boot test on Tegra194 because the boot was
>> too slow. However, this also broke the EMC test on Tegra186 because
>> setting the frequency from the debugfs failed. So two different failures
>> on two different devices. I am guessing the EMC test would also fail on
>> Tegra194, but given that it does not boot, we did not get that far.
> 
> So you're saying that even with the dt changes, this change on
> tegra194 still does not boot before the regression test framework
> times out? If so, I need some more details about this. I have not seen
> issues on p2972 or p3518. For example, if I boot to android recovery
> where I set the cpufreq governor to performance, I see emc clock rate
> set to 2133 MHz and 1600 MHz respectively. And boot time from kernel
> start to pixels on display is 15 seconds, give or take a couple
> seconds. This is using the boot stack from l4t r32.7.6.

Yes. The boot failure here is not a hard boot failure, but the device 
takes too long to boot and the boot test times out. And no we will not 
increase the timeout as it is there for a reason. It could well be 
because the default governor is not set to performance. If you boot with 
just using the stock 'defconfig' for ARM64 without setting the governor 
does it take longer?

Jon

-- 
nvpublic

