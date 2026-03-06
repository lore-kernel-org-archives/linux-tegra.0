Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010056.outbound.protection.outlook.com [52.101.56.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACDF83603DD;
	Fri,  6 Mar 2026 10:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772792538; cv=fail; b=ERVMixGl9/rJTIa8Fc0qRTxujAhSr5OKGfmno16z7nUiRhVbHcRZN0jB+l6CwskPUohGOP8p8rR6xxo4qUNu/PJiwZKy+ki5vReulsPIHzg06JVO/aStAcAFpzyMnQfatkf1hc1L+02gR9PoqkVeXuAYpiCMV5DnYtM4F/v/rNc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772792538; c=relaxed/simple;
	bh=BLQRsM3axmaTy8wsgCQxHQEo5tnjvfaKnwIjBuO06Cc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=E788ZS7BiY6TfnYunwzc49G+2wCfk+bnHNrptMKu61RT1aDuXssOylobJOhB6Qp1aaWXZrFrvEQ2OzWpS8Vx36XwNUtQQbEqj65uU6raJWo/Eqz1i+pjeuQjnY+ZwvGX8jJIpEAicOnpkQwJm058S2NCO7B1dvKhNzmuW6GGYok=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=EUSWTtNZ; arc=fail smtp.client-ip=52.101.56.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="EUSWTtNZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OCvf4LkAxbY8lh3wXjTip62RH/ljw5npgL6jGp6Gi4S1EbGdPOS6OkzEf2Ktl/RpUtGbn/X3ly2QPakMOls7fbc6g8JSXVAGO5t4npiwcMUM22BhVmPqFeksv8Ha7uijOgbfuIxKw2YLoBh78noxhtaNTaEZaLeC3qRWS0bZuSg1jhUfvE4jSSdxR62oCqUA6EDmSdwUtG6007Xh4i05ta1CqdO5IePmU1rQzk6ThpQ1oavEjlbHMRa6Tnvtbf34n5d6M6J7fSXnfpcuxUV5ea5D8aGKjeK0YgMkR+qH7m5PznkCf8OB2ZRTjmdzNWaZwsfk/Dlbs43J1DtXMVbGRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wGvyf2AzPRJPwYJl2DE4GZHTmo+kyeyrKjx2U+51IAk=;
 b=H4V6xf1qfTgcqmZ35ogVglU/m50iUGaTRjlaC1cqu8LiXUQ4KJPQytsZZ9J9p28KbC32NdEUUGQJK+GoZTZAm6kJ/d8HAymWsBGJh6+OVDaWqyKzDKIBMx1VmAogS0szV6iiAUrX/prUZk6fi5obt/ucDj+W/VsSzGXyDYfUMGxGnDHyUWXJUCh9y30SzHcutiMcN0DjPZhjO/wNtBTNUyEK1jw0WhldntKMxIHrCg7VnKqnuMjUX1pfRauBiSUtpfpv90Z/WYMWCYxlGRSnVjOkW/yLTT2aMWy9LCYVYLz33MUSP3aRuBDXTnW+kIRP3m8fBIkusetYuGdYHac3iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wGvyf2AzPRJPwYJl2DE4GZHTmo+kyeyrKjx2U+51IAk=;
 b=EUSWTtNZXH7deWUpjE4somgOIC9STSuTmMfVXfMMZExhyNNc1Uv31QUJ/HBtZI1PPqVxfB5xHAH5DjTDwoRUlnKE7wn4KlYVvrRu0NkFcDUidX/IG2IceE1GG7r7pdrZ//5wZ044nqwbLKhcJ4NwIfzSvI+s+ICFyLY5paEw4M5EJW6u3BeP4ZE4bbx+89an7EVN857ksbLb7ixzb39oyEE2NHdOJAIZhezY7G2BmNm3WeTc3QvlrBZuMtJReY1VT6LxgtARFHA49eBgIzLFoEu6YZfyfg66uubPtgpgvYQEpy0BglDRj31GAQC0fv/Px1ge/jQWTqZPo1QnqgZBnA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by CY8PR12MB7585.namprd12.prod.outlook.com (2603:10b6:930:98::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.5; Fri, 6 Mar
 2026 10:22:14 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%5]) with mapi id 15.20.9700.003; Fri, 6 Mar 2026
 10:22:14 +0000
Message-ID: <18c339ea-d535-43a6-96d1-e583dc05ba87@nvidia.com>
Date: Fri, 6 Mar 2026 10:22:11 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/6] memory: tegra: Add MC error logging support for
 Tegra264 SoC
To: Ketan Patil <ketanp@nvidia.com>, krzk@kernel.org, thierry.reding@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20260226163115.1152181-1-ketanp@nvidia.com>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20260226163115.1152181-1-ketanp@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0445.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::18) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|CY8PR12MB7585:EE_
X-MS-Office365-Filtering-Correlation-Id: 64b03c93-71f6-4dd9-8510-08de7b6a3caa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|10070799003|366016;
X-Microsoft-Antispam-Message-Info:
	AERFc6BtzVKEUDnPmLL/7IoOB1cBO8O7m0cl4Kt6S3bJTj7MSNlVuuajYZ3Y1XPiRe2cSRvEuwfPrqdlGMVxxLVr+q+xBLnvNu/XxmhEZ+M4nx0opbhPWHm+4PUkp654NZmwIplKdg46SFMo4fP9Vv7RmvTMCeeAoEYEkyMbmeStY/kFrtXGGK8NdnE/FrJnVvyZtEnnKWJZ0O+UIe4Ju48qE3Vp4GetyIplQt3eXUnzx+Y77BA5+5YZuuBqyZnTFqFFvIbtNO7NDfUmZiKyZPAnB9j6qcxhEMC8A0tdT91eZG9RnuCXEznvzoVtUvL3he/1x4J006C2Xe8IP+L52FXmeK6IRjXnXiVjLJbtrpNIEvSdrZlLJkgcpBnVpR4Kyj9iLPdH60qTLv+6WwcTrPmbu4aM7V4kIMoEK1l0GQj2vL+4mTPKQmLfirnl2h5/bZBAMJA1tW02jIYqCnrII40VIVT8CfF/wTPk/5ML6FmEdnevRwsLgpu7KcQINLH7j7D03XiW1aJ/vYi8GoDO8USYwKkELamkr3r2PqZcqdLcWLtxprQmihZVwVjM+WpOS0YQojux2PhwFkMkE3odELWS+KhyF4QhTKXaGr3VBWS3qanfGkes1Ot0c8L7VFdmf8EbhQTiZ2BZgsxiZATC9pSFScgtVYvWji5pP4s8sKS6zfFiiatzp9ad4rMIZDwRswx78wA2NaNya7lFu2K2ercGRXp+cFKpenqXX3cSVBk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(10070799003)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d2FHRlRMZUZXRmNyeVBKL3I5T080QnYxdlFIUXhHVTNFQkhoZ1dvZjRFYjM1?=
 =?utf-8?B?ZTVsK1JlVUpKcHpKcXQwbmFEelo1ckRsNWV3UERPa0lGK1ZHbmdFaC8zaWxG?=
 =?utf-8?B?c2hkUmtpRy9uZ3M5OG9wN3QrOVhMWUFFZmwvQ0kwTnp2bGRXb29jaURSemJa?=
 =?utf-8?B?RWhwREpQT0N3N0xpOHh0cGNFSGU5SkZkUUt2MGpHLzF0bWpMZlUvaGZSdGUy?=
 =?utf-8?B?SEhtMFRNSVdDblhZN2FNeVBCK0VKSGhqSzZ5S2R3Q2QzR1ZPTXc2b0NyQVIy?=
 =?utf-8?B?bHhpaVQ4UzdrRWR0VU55NkgzUnJTV2RRZE83UlZMR0l2TEVFZ2JOekRVSXRT?=
 =?utf-8?B?MmxMVW5rZDJzNzJSN1dTLzNaejJYclY0dVE5ZVhDWDZ0R3g0TUozcjRuOWtq?=
 =?utf-8?B?bHZKYk9SLzVaOXFTaW1zQUg4RUdldnhCZlRGT2huVGQ5a2NMdFFwWk5WZm1i?=
 =?utf-8?B?TGh3TmNRMEIwL1gzK0RUT3J2eHkvcDdyYXBXT09RN09lRHBiNnZoV3QyMlAy?=
 =?utf-8?B?ZnI3aC9KMkcxYmZDZyt2c0FpY2VWTUlSREJHRVU2Ymp5ZFV3Y0VRbytsSkZY?=
 =?utf-8?B?RWVHbWk3c1Q5TEpueU9aZDJKZWRBbnllR1N3MnFYNEVHZGtveVRwN0hpTmZW?=
 =?utf-8?B?dEEraTlUNGlFUDVFQkE3UFltUUpUdCs5QjBEalJLVk1kcnFaeXd5SHQ3bG5s?=
 =?utf-8?B?T1VxaGJOQXc1R1NORW1SSXl0MjI5T1c2YVdzREZsU1YvTHU2b3VqTW9JYzZX?=
 =?utf-8?B?cXRZcEtvRklmV051OHVCZVlLQUZpU0IzNDh3TGU2Qk9USW56b3pKK2tVOWFs?=
 =?utf-8?B?SGkwUjNlT2E0ZEJvSGxwODdyZW5wSnJ3aXlzS0xRcERzbDZCaThpdktOMWtU?=
 =?utf-8?B?UVJKZjI3cmc1V1d5dEpxT0IwV3ZMQ1dyTUVmWmJsVm0xTnNaTS9NWHlOZEV6?=
 =?utf-8?B?MG9Kd3dydzRjb2VZeDU2Z2dVWnNQNmx0d21iSlB4azlBN0FldE1uZWM2d0Qx?=
 =?utf-8?B?bXNrT1QvTk9XYXp0N0d4MEJMazE3dHY3VllJZDkyVklLdFpEQ29mamVycUZy?=
 =?utf-8?B?OUp0ei9XUzJvSVpPTUN4K2NCTkgvWXFTVWZrWk82WDRuMGpqM3NUbHVXSmxM?=
 =?utf-8?B?SWZ0KzF6QkRGaEFsc09taVNrUlVBVHlNVzQyWk1XSXh5NjUzd29zS1dCMHZl?=
 =?utf-8?B?VDJ2d0VGd2VvRkxsSUZqQTFZbmhkL2tvUFE0TCtOWEFDcTI1bTFVdzExenk3?=
 =?utf-8?B?NGN5L3B4ME9taklvN0xTUnN2Y2VmWHJWV2lrSWJtdjVSRWlDMzhiWkZncDd2?=
 =?utf-8?B?a2w4dXBuUVNxM21PSGRkd2Zyc1IycUMzYzlrczBDRGdYT0Q1bnZlQ3dqSHJ5?=
 =?utf-8?B?eXNDRkxXa2FoWVZVMFhRK0JqeitwM1JjeXI5KzZYL3ZqTGpKVXNCUEVaUU05?=
 =?utf-8?B?RjRyNzlIek12ZEgwb21vVE9MWU5iNFZ0R1V1MmZJb3RULy9MbWw5UzRMdXMz?=
 =?utf-8?B?elVwTEFENGk1QkIrV3h3T2J3em5rM3d3RDRBZXJuOFZKVElyeXFJUTByMGM1?=
 =?utf-8?B?QUNLa1NTQ3lzQk5kTGZlNTMzcEluQzh2L09kVWFTSGRYSDIrMWRYR2hxZ0Zx?=
 =?utf-8?B?UjRoSWpuMjNXU2N4cmN3aFY1aWtQRTZIYVBYMFlkZkVLV2tleWs0b25uVnI4?=
 =?utf-8?B?ZEkrMTN3S3JrR3lHck9OK1N0cWxER3VraERzOEdtNEpaaXRUOXZEYWczd3Ew?=
 =?utf-8?B?V092b01udjJFa1JnSnZGbmtVT081Vlo5bjZ3WUtvVVNyaU03YXpFOXFoQnFB?=
 =?utf-8?B?K0hHa056RXFQazltcTdvaEtSL3ZORGYxSElITDB4Y2ErUUs4NXlhSkdGVWxx?=
 =?utf-8?B?RWpxTGp4R0FRM01VK2N4SUtpOVZxN0VGVzVSWUNEeElFekFrdGM3M2xBN0c0?=
 =?utf-8?B?MzZDeUNFMm05Wm4xNUo3TTNlZ21FczRuNUdsYXBKcFlDUUJrSjRQYU1YZ3dm?=
 =?utf-8?B?bmpOZUlZMzN4T0Uybm9PTlJEY0xyam9JdzFzSjc3eHh1L1NCOXNIOFJxNlJx?=
 =?utf-8?B?ZFUyTVd4Z3czeE9xUFlOczZNSFNQM2x5SzB4c1cxMXB6TFdVaTJDYXdJTlA2?=
 =?utf-8?B?LzNjNWVua3E5L1BYTUhybmtWcWNob0ROSGFaQjBIUktnWWRub1RKYTJUM1NE?=
 =?utf-8?B?aUVYTVhqQTZNbnRadnhBeW93TVdMMk53d0ZVbWFnaXVwOTRrVWhNaWlmYldn?=
 =?utf-8?B?TUNKSE9JUFRva2IyVFRkb241MmdtYk9sVkhpMnNwWGtBMHlGb0RHTkFWOEd4?=
 =?utf-8?B?T2c3eGV3NTE4bjdYKyszcHpsaHI2dER5cCs2MjJYRGsyeVdzWnArK1pZdUpD?=
 =?utf-8?Q?MlZVBvd4FzCiXRIuuIA3/nygXO1SX/1569lmQH927zfzH?=
X-MS-Exchange-AntiSpam-MessageData-1: qcb4CHlfIL18dQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64b03c93-71f6-4dd9-8510-08de7b6a3caa
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 10:22:14.8729
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yx44byKZzqvMBOPzHYLcv7+Cz5J1RT/NPghec1x9dJMjG9notvOPACJQnZ037X8UAVCMy0KvK435HA8gVX8Fog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7585


On 26/02/2026 16:31, Ketan Patil wrote:
> In Tegra264, different components from memory subsystems like Memory
> Controller Fabric (MCF), HUB, HUB Common (HUBC), Side Band Shim (SBS)
> and MC Channels have different interrupt lines for receiving memory
> controller error interrupts. This patch set includes changes to add
> support and enable Memory Controller error logging for Tegra264.
> 
> Ketan Patil (6):
>    memory: tegra: Group error handling related registers
>    memory: tegra: Group register and fields
>    memory: tegra: Add support for multiple IRQs
>    memory: tegra: Group SoC specific fields
>    memory: tegra: Prepare for supporting multiple intmask registers
>    memory: tegra: Add MC error logging support for Tegra264
> 

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
Tested-by: Jon Hunter <jonathanh@nvidia.com>

Krzysztof, let us know if you are OK with this version? If so, would be 
great to get this into -next.

Thanks!
Jon

-- 
nvpublic

