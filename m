Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010020.outbound.protection.outlook.com [52.101.61.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7E335B63F;
	Thu, 22 Jan 2026 17:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769104368; cv=fail; b=A3oNVPyQcCw+G+QHFfmVaPW4Bjp0iMChss/jifgjnoVwyOqg+szZZe26kN9sYF1k/GEGhQzKD3KKokpZXPuNhakIRUdkpgTRKKB5DhwjJI2nqaAahv+VeKc18a3Xz2xYPW69GuwR5ra//OeRpLIQxC1SaKaA+ahWb4Ji84zqx+g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769104368; c=relaxed/simple;
	bh=BgNxR4V92vn0+qB84vF8NM84j//JlcsjOEVUOGUrxmQ=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MOfaXRI2/LO22TlbZ6+6JnU1hMYOsjkjxS8FU4GPtjtcdVk7n55OJkvmLhDDveupjt/HEsEKWrinpCwFxYxnMR4tTjbXSdDkBkDisr7GqHieELzjEFjQHWv8HUqgL7KOqv3Dz8uDJU0E5T22PtU+b4k7MUdS7uYLK9p9fBhx8cw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=EolQsJwD; arc=fail smtp.client-ip=52.101.61.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="EolQsJwD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EDQ/O+qGsX3gG+Xac87pI69oFcbN/TdAtMoZqWxyQZ/1qthvSzQyCnQKjazw8W5ppIMhYwkQGtWiLN5i9+1PHbS12Vc0N/WDg9asv/FcSDGSOYYN7tMh0umlkJMAXpoAQzqNIoiM8qkTaRwaJ3Vn98cev9GcGIQb5rVe+AJxtlvGJRF1rYKPHgN17F+7ew03YYMwaWqeAwoEPx/ZMkpz/eYCR4YqXIHc0Vmc5Z/42DKFGjmvYIjHKYKBjfLTOaDgHrCEe0FCBhhWwJfodQxwsR5yNQwtLvrf0HySLai4Kwdsw7uRpsrdLx3/ImNoJZ2/j7mbyzVyzloHF+W0Yum1yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K33g0O3X+WAGiq7OzH5JdzBjc2uQJhWyDligljxZPmY=;
 b=pc9u33nMwgbECoNc8bISOt5is3qU9V1jMTDuinqX3RgoizTrezUIUxDYs6KL0D50fRtE31wywUNuc06SHBehCC1B9b8IMGzlPOZ694sAlKe2k6rurZ86VXyhwzXpTX49JmzwLybkiORgGR+YQ8/sJzRGl/MWfHubXAmSDnBSEfWz8IdncRyG+c9fvZp1RSm6qmxMQTfIO3ZOHF8fEYZAR7jyanTHVr7GvvoGX0a0ziqf4CIhFaNIY6Ydo3jN41pVQwbm9r40v7WUUYuG8dEUjGljDFSMzrWjM9UOGqqV4/tLCPcdLEuccmjp9wqKlKmUyoTvICLhFw1tR6ds5NN6EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K33g0O3X+WAGiq7OzH5JdzBjc2uQJhWyDligljxZPmY=;
 b=EolQsJwDPvZAWWwpqntcUq8TLWgtYuFxaDhP+nHC7fZ3A5mvXZBE2msEDHCQzXL1Id653DRItKoHz/453446nHEJLXBQfi3qFtwmdB4UwF3+g+aiHVt2Ej6GLnm+L6dzoavSmRibYbjBEnsdPGU2Idvs19TG07J+8uDxbytjFyqTaHDLvtOKMdT+hn1yx9XAH6MspWKCxrPuHoWO9b+Cc/VBXVOO2qMmtff3UU1vNhpdqfxkLiE14CbCzuXzMnC997qJ3eAyab+L3Ynkcw2pQ7DDViklBCryi9d4+gPsmBHvbLgm/16S4Uk4j2JJ7dKmU9VBFirfTG/AcTgo2iFw4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN0PR12MB5716.namprd12.prod.outlook.com (2603:10b6:208:373::14)
 by DM4PR12MB7646.namprd12.prod.outlook.com (2603:10b6:8:106::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Thu, 22 Jan
 2026 17:52:28 +0000
Received: from MN0PR12MB5716.namprd12.prod.outlook.com
 ([fe80::bac8:2b43:2a64:4c76]) by MN0PR12MB5716.namprd12.prod.outlook.com
 ([fe80::bac8:2b43:2a64:4c76%6]) with mapi id 15.20.9542.008; Thu, 22 Jan 2026
 17:52:28 +0000
Message-ID: <e0d498a4-ddfe-40b3-af45-f07d2c5c2e62@nvidia.com>
Date: Thu, 22 Jan 2026 23:22:17 +0530
User-Agent: Mozilla Thunderbird
From: Kartik Rajput <kkartik@nvidia.com>
Subject: Re: [PATCH v9 2/4] i2c: tegra: Move variant to tegra_i2c_hw_feature
To: Andi Shyti <andi.shyti@kernel.org>
Cc: ldewangan@nvidia.com, digetx@gmail.com, thierry.reding@gmail.com,
 jonathanh@nvidia.com, akhilrajeev@nvidia.com, smangipudi@nvidia.com,
 linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260121153012.92243-1-kkartik@nvidia.com>
 <20260121153012.92243-3-kkartik@nvidia.com>
 <aXJe_2JC7KgfBgLa@zenone.zhora.eu>
Content-Language: en-US
In-Reply-To: <aXJe_2JC7KgfBgLa@zenone.zhora.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0227.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f3::14) To MN0PR12MB5716.namprd12.prod.outlook.com
 (2603:10b6:208:373::14)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB5716:EE_|DM4PR12MB7646:EE_
X-MS-Office365-Filtering-Correlation-Id: 18728806-46b6-48cb-c60e-08de59df0249
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TlJySGZUalVtZEdGNGg2anRHUld4SzZkdXJNMkJYano3NUQraU43bFI3cGo4?=
 =?utf-8?B?cExWQ0Q3YURyNGpSQ0xlVFJ6Q3VDWW52UDdVL0lycWhESnBrUjVnM2Exd1ZP?=
 =?utf-8?B?Y2JrLzBxbmNhTVZjcXBhNG9CQXVmT3FtZkRBZlZ6Z0ZhVXgxbXVYUnBwOHhB?=
 =?utf-8?B?ZUpwUzduV0dCMitmazBSWFpMSklMMnB4T1dCTkduWDcyUkIwNzUxVkxIdS8v?=
 =?utf-8?B?blpPZElkNzVpL3JyVGFoOUo5NjdsOFRyZUdSK0I5bXFuaklrTzRCOFNzdWsv?=
 =?utf-8?B?TXNuYnhneWZOam1hem5YSlR0RGw0ZlhuVnpkVHJVdWhCT2NWYmFRQU13TFc0?=
 =?utf-8?B?MDRIZFVNZ21ha01rMkNjVHRnUUJxVFRoUXRJTi9uVWNwWlVLaE1PWWQwUWpm?=
 =?utf-8?B?TW53cXk5VThWMVRpRDVWMUg4NmZvWWNUZWQ3djBvUjgxQUllVUREQ01uaUM4?=
 =?utf-8?B?Q3hWTlRjN1FjTXNTaVB6aTBCQVUwNngzayt0SUJqNnN5WWgrK2xPWG82M1ho?=
 =?utf-8?B?TjlsVW53ZVFEeG5BdVlNV1N4YjM0NHNEZVRvOVN6eHZJQjY0YlpXcTNWeTNZ?=
 =?utf-8?B?ZVYrQUp3cDViZ0tLQzNTTUFUemRNOWl2MVROajZVRVYwT3dXQ2s4Q09qL0pL?=
 =?utf-8?B?QkwwWVJPSk53MWRrNm9YWk0yUFQ2dCtiT3dNQ3pyeTd4S1pYTjhlSkVrZWFG?=
 =?utf-8?B?cVl5UEIzVEVVRGpQd3pMejFOQUNjbWtRckVnK1d0aWdBakRobGEwalVHVGYx?=
 =?utf-8?B?YVZKYVl5UUx0eDFMV1RQNU9kVFlxZ0IydjZEc2RTaDZEd0hBM3N6Mk16NDE2?=
 =?utf-8?B?Zk4rTmRTOEpxRDQzOGRmRTRNTlFJeEVsK1FRYk9hZkE4SERvQy90RTFLTEJI?=
 =?utf-8?B?Z2lyMFpDNGF0QTZEQS81Z2k0dmk3STBmNDU4T1dkbjY3NGtWZ2Z6bEdvczR4?=
 =?utf-8?B?YXMvK2FyQmp1dGV0b2dSUlh6QkFDV09xeEVxbEw5MDhPWE8wVnUycTRsb3dR?=
 =?utf-8?B?YlNOblhJZmxyTGQxNzM3b0NKU1lndTF6WXczcGhHYzdaWVZNN2JwZVZrYnJV?=
 =?utf-8?B?TnB2QmJ4YXJMSmhLcnlkdEkvWllBYjd0V2txODNtTTRFTjBkVE1PcG1kTXJm?=
 =?utf-8?B?c3loRzI0VFF6Q1RZTTNNRE5Yenc5R1ZtYlEzMHphaUEvbElMMjhLeVprdFRY?=
 =?utf-8?B?WC9LeW5qUmNFZmNmU1kxcGpBanpRUlVxZGZVNFJZYURJRVhZMUt2MjFNTXVQ?=
 =?utf-8?B?Q1hsTVpPOE9Ua3MzenF0bGJzbjVuZmZEdEtnK2pkQytQYi93RFcxZWFGWXdX?=
 =?utf-8?B?anNsUVp5ckZORU9OUnNEenRzSTg5RVJRUnhYdmVoT1NFZlF3amJoM1pxUmNM?=
 =?utf-8?B?T3dUOHBLRUtuOXRSdWVvOHdSbk1zcHhzeE1rZFdiVVV3My83ZjBPL3BHVksw?=
 =?utf-8?B?QWZQc3phaFkrVlJxSENqU2VqZ0tPek9QRG5WYndFRkUwYjM4SFNhUmtkMVpT?=
 =?utf-8?B?ZEpUcXBXUHVyc1RPSG9iVm82TlIwRDlRc0xUT3dyZklrNHdSTHZMWEdJdUpV?=
 =?utf-8?B?OTRNSXE3Um9SY1lRZVRENFR6c1BVT2c0aEkyZDNFUzMvRVBVajM1T1FTcHh6?=
 =?utf-8?B?eGVGZ09YTnp4ZGpQV2NOUlM3cDYwcktpTHh1ZFp0VDAwYU84N2tYSWdHbU91?=
 =?utf-8?B?NXJ3eEZRM0txV2lpaEJGL3N3amlQNVAyZlo5NkFWZHFkR2g4T2pKcjJwMXJ1?=
 =?utf-8?B?Qndkdm55blV3Z1BLU1lBSjhqS2ViRFhjaitvTTNZcWVFcHRyeU1VOVpvZSsw?=
 =?utf-8?B?QUpZWDVYNzlaZXoyaXQzam15WWRRamJRTldLL3g2ak52Tzl2V0NJYWk1eUYy?=
 =?utf-8?B?Wmc2MFp2U3NRMzVvMTUwYi81QkZmRTFRSm9CcUJ6MTcvd250ZGNnVnpsL3BZ?=
 =?utf-8?B?QjRnWFo5R3JnNitpeVlMZ0xaVGkvUWowTHBRVStMLzlDNmNIQnhxWTVGMU5k?=
 =?utf-8?B?a3dVZkduU1B5QjdtL2FDc0N6b1pZaXI3UjA3NllvU2gyd21HLzdxYk1SY2Vr?=
 =?utf-8?B?UnRNZS9jVDRhVEhMVUJZMk5HZGNBeTNYK1d5NUNHY0ZpT3dwT3FOczhweTF6?=
 =?utf-8?Q?S51FjHBbLT4Dl6DNyntng9rYo?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5716.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aTdHTTBZa0I0QjRRN0h1QW1VK0NzYytxN0ZFMVFHRnpBb1dhY0l0bmw4OG5X?=
 =?utf-8?B?aHlWMGxsYTQzSG1ta0VuSTkxWHVKZitNR0UvRTJVWHE1S2I1RVZDNnMrVWgx?=
 =?utf-8?B?UThuOW1Kd3FtdEkzbmJoelJlcm14K3NCL1BjQWh3NjFGSGk2UjVsdy9rK2tZ?=
 =?utf-8?B?VTR1cVNVZFhLWGYvT2hSeDVDNGdKS3FWOThSWVMrSXlGemM1K24ydEY4Q25l?=
 =?utf-8?B?YnBqUWtFMXhpYVovMDdYdW0yL2VwREJXc3RabVIyODVLU3VVMWFtaElTRys0?=
 =?utf-8?B?UzQrT3FNQ1JVTmY3NGVWbHZaazMrQXg0SU9yOVU2b3FtdmVjS0pqZGtMdXdn?=
 =?utf-8?B?THV0WlJvUW92K0cvdmtCNE1tUERUY1hmK1dPeEFZaTJ4MnRZckM1aHJkN0JJ?=
 =?utf-8?B?TjJIS2NlTE5ubWNwd29wVXpmcjlBVzdDenJiR09KRU5ub2lGRjRiKy8yVHJa?=
 =?utf-8?B?VFNNR2owRDloSXBaaG8zcXhZeU14cFZSVjgxTHNuYTVWREFDM0tRUEYvcisv?=
 =?utf-8?B?Z240MzdmRTlXWTJpbTA2UmRvZjhpM2ZNTTdWR0gvZXhiREZnNkNjblVJd0Mv?=
 =?utf-8?B?bDhiMTdYd0RxOXlyQjA4Q3RnQzI5MEc5clh3VUFpTUpId2ovU2JVQjhxZjZJ?=
 =?utf-8?B?UHk5WXhaZW1VZENEeDN3TDN3T0pMUkxINGJiRUsxTW9kUERiS2NhRVBkTzhk?=
 =?utf-8?B?Z3hLS1c0VGN2ZUtZbzZYRklqeTBEYnpjUnFKaFkxSVFRTG1lOFpkc3JyaGlk?=
 =?utf-8?B?d2RXVTBFQXRZYVhZQVlDdXBMaG9waFBDak0vRktVWUorYzI0dUtaTy9abWFF?=
 =?utf-8?B?YmR6NHBrRHUzUlhkZmZsMnExVk82R1NWUGQ3eEYyZXMyeVNSUFJDdW5kTVIr?=
 =?utf-8?B?YjhHbVd1Q0xsME00THFLVWtDUVlnZ2k3SURlQ1VQdTg2Qm5vaFF6OXl2ZGEw?=
 =?utf-8?B?SlJZZ3FJdnoxZTVPem4xWFdWdFJyUzlZamp4Q0UzYThYOURwQm9lT0wzMnJn?=
 =?utf-8?B?alNKYnJCU25TYVlxL0w3TmlVM2E4cE44aHpPR1RYTzZGZTNsMXpLR0FyNngy?=
 =?utf-8?B?NnJoSmFCT1ZsQ0IreG50MlM0RjhUUHNsQXFRc3dXcVNJYWVUaW5UZjhHOTE2?=
 =?utf-8?B?NTB0am9WbEdvNyszQVlyMlV6WHNFMktncE8wclpudFkxeXZBanc0UUI4NWFX?=
 =?utf-8?B?MXUycmp6UU9XTkNDTHNGZTRJMUdOdTZzV3JDckNmeEhVT25yVlQ0Y0orTFFh?=
 =?utf-8?B?dDVRNXUxWGd4bkI3cmp6TFcrTFQ4bGVuQWY5bHpjWWI0dk9wVytaNzBrckFZ?=
 =?utf-8?B?MjhzOWtCZmN6R040Ujk5aW0xeHI1cXVwQldnNFFEZEJCN3lNY2VKUDZFeDl0?=
 =?utf-8?B?cHc3OW1JcEwvQ0ZLZnJRQzVhd016NGZNdy9BbTNIVCtGaTB0cTVVRW5tSE1I?=
 =?utf-8?B?YWRwVkcxZlVlSlFtNVdYa0QycXNUTzcxTk0xNUFuUFNETllNYTJXcVhEbTZB?=
 =?utf-8?B?em5GYytVQUovVnlJRE00N3RrVTFrdnF2VS9lQTA4RVN0QkttZHNiTmhycTRz?=
 =?utf-8?B?UWErTHJheis5K0NWVVlzN214djNCOW81YUJVL0wyNlB1T1VLbjduL0ZOVXNR?=
 =?utf-8?B?cS9YYnRVUFpoRGJwUXhhL0dKZ21pcDgxQngwUjkrMy9VZFBxREtjL0FIQzcy?=
 =?utf-8?B?ZDFVRmROYzB0MjdwOHI2RG5ibytBYXpScTBpYXZ4cXFBUzRVZkJRaElWWmVI?=
 =?utf-8?B?TnIvTVBpMXlmSnZUL1Z2NGdsc2ZaT0xwYlVOK3B1NnZwdVdSVmlUZTJZNnNY?=
 =?utf-8?B?b2FUa2RrYkRjZi96OUxmNnBhOGppTlZnSkJpZWFlUk9CemFVK0ZFd3JSN0pZ?=
 =?utf-8?B?dVNqUUVkdkhqQ3Z0NThBdGtKYmhKSGExa2l4cTZuL0FPSVV2R1hDRWZrekk5?=
 =?utf-8?B?NDh3ek1aZGZKMGV2czJqL3E4N1ZWNkpTbVhoRS9YM3Bab0VxaWh2dHd2RW5l?=
 =?utf-8?B?SzA1VEJTQ1FLSjVNV0t1MThJL3JlRTdKVFAwZDNQZGdQMkNCK3FrbndOaTBO?=
 =?utf-8?B?ZGNRenFIbjlCMWs1TjY3RGtsZTEvcXl6UTR2ZXBSaTBsT1BPZUNWWXlOaWRX?=
 =?utf-8?B?S0FPSGxYb2dlZFVyVVRxZnRWMDhEMUFseDNmd21UOHVHd0o3NlJ2MFJJT3V3?=
 =?utf-8?B?OHhpZlRrQlA5bVRyTncxRGxPVE9salRjbk1IUlNnRjJFTk1yM2tvUWdwMytG?=
 =?utf-8?B?TkFkQlRIdzFQaXU3UzZjdy9sZDlYNzgzd1Exd0pGTjlyeEloWG03S3RkaE15?=
 =?utf-8?B?VTBBSTlsQURwYWhRRGpFMUJKMzZNbDNSNE1NZE1MMDdXcjBPaXAzQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18728806-46b6-48cb-c60e-08de59df0249
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB5716.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 17:52:28.7704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tc6kzcMhAOf0xsQHdHR843I3WJDkvvJC6UU2Q79gVmENLl/2eG0AKi/Em23TZcCHv39k2lyqa8M3efrWnzj5dQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7646

Hi Andi,

On 22/01/26 23:02, Andi Shyti wrote:
> External email: Use caution opening links or attachments
> 
> 
> Hi Kartik,
> 
>> @@ -280,7 +282,6 @@ struct tegra_i2c_hw_feature {
>>    * @base_phys: physical base address of the I2C controller
>>    * @cont_id: I2C controller ID, used for packet header
>>    * @irq: IRQ number of transfer complete interrupt
>> - * @variant: This represents the I2C controller variant.
>>    * @msg_complete: transfer completion notifier
>>    * @msg_buf_remaining: size of unsent data in the message buffer
>>    * @msg_len: length of message in current transfer
>> @@ -332,13 +333,12 @@ struct tegra_i2c_dev {
>>        bool atomic_mode;
>>        bool dma_mode;
>>        bool msg_read;
>> -     enum tegra_i2c_variant variant;
>>   };
>>
>>   #define IS_DVC(dev) (IS_ENABLED(CONFIG_ARCH_TEGRA_2x_SOC) && \
>> -                  (dev)->variant == TEGRA_I2C_VARIANT_DVC)
>> +                  (dev)->hw->variant == TEGRA_I2C_VARIANT_DVC)
>>   #define IS_VI(dev)  (IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC) && \
>> -                  (dev)->variant == TEGRA_I2C_VARIANT_VI)
>> +                  (dev)->hw->variant == TEGRA_I2C_VARIANT_VI)
>>
>>   static void dvc_writel(struct tegra_i2c_dev *i2c_dev, u32 val,
>>                       unsigned int reg)
>> @@ -1647,8 +1647,42 @@ static const struct tegra_i2c_hw_feature tegra20_i2c_hw = {
>>        .has_interface_timing_reg = false,
>>        .enable_hs_mode_support = false,
>>        .has_mutex = false,
>> +     .variant = TEGRA_I2C_VARIANT_DEFAULT,
>>   };
> 
> in v8 I made a question at this point, could you please answer?
> 
> Thanks,
> Andi

Are you referring to the following question on v7 of this series, which I've already addressed?
https://lore.kernel.org/linux-tegra/c3cdece5-1bf6-46eb-a668-2ee2a4358a88@nvidia.com/#t


>> why do we need this extra step in this patch and we don't add
>> "variant" directly in tegra_i2c_dev->hw?
>>
> Since we are also introducing match data for DVC and VI variant, I
> decided to split this into two patches.
> 
> If you prefer, I can squash following into a single patch:
>   * "i2c: tegra: Introduce tegra_i2c_variant to identify DVC and VI"
>   * "i2c: tegra: Move variant to tegra_i2c_hw_feature"


Thanks,
Kartik

