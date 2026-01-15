Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010006.outbound.protection.outlook.com [52.101.46.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E40334695;
	Thu, 15 Jan 2026 09:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768470645; cv=fail; b=EW1V/QNpt0MuhQ2cDVewAHHzHV6A3FBxorILtSgQtQAwXt3QK5eVdV/BHrgAfYepioRbQLT33cMPEny5p9+p+DWeGJ0lklGLrNco/p4p4hfX/Rvuaie76BcoOwgvtl3dt3M0nysumT+857cwloKgy6u3uqnTr+Ursu6doYVPH5E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768470645; c=relaxed/simple;
	bh=5x/6SFbbnSiPDDcDDHn1muvZjveX4nr5J0/m7KdqS78=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VbFZ/voQcgSvCEWKroKxB2v5P0OqVQ3PpAMSxXdYOR3ZYdGz+BAJFAVAmiGDiEc5KcCz74rNLy1tl81CpOwGdlMta6gxDnekJ0k21pDiZMfGdDYwtaZ4C7GCSMHULHw4n59e7eKSF74qumBRc5AucuaCQ6b2R4dRxehIXmKHD1s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RjbW0F2f; arc=fail smtp.client-ip=52.101.46.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RjbW0F2f"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z8NEIxS+DrKnGpjl7scS337rNOxTariPehOHMojMWpn1EX5kVOrJayTC/3+1As0d9h0FEcDrLIU1END+76SQG5nuNirRODvnmxH45jz0lM7hQqD0qn/EGQiSavm8uOcRkGSnqE1PEF7Ud7Q3XcsyoMSrdgMIITCpXpo5W27zvfx+I5OCFjJF2DGLymtvmMk2SAeo8+b6uEWQ99ZZUIpE8BKkTo6HUO/LlvD4m0yyFgK0qpeVj0WpwN9vUDNzQEal/8mMRDKv0+QaZ4uBRyb1P0exFa35HLp7mCt1QTnV6eeQM2EQOS3XRn5inJYzUZb4OEcawvKgY8zbG6DtqJCpIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F71zULf5QQJCYyyxKNvZ8P0JOVJg6tv+dwXGFo93mA0=;
 b=ZhCvs9UEyGZG4jsfa7sQ5f4kFQAUPGvtPBAwCP/Z8D8e17FT44+m6vtMvU3MChzwCnP+YIDZwZHRufVYPGDuvcivYXpWY74SQbju+ZOO7icss6HT9Hujuc6AHhjJKMLcrzoAWXBnyLqB5uX3Kyqr9OcTTve9PSHdnsdg1gm+5p0uW8S+idPLPpqVm6P85wTsXEFB+oukb+3dxRr7oF2Cu48dl0ZAv8sVf8DRIQF9GinNMmCATMTxNnNlePcbUjJKLJUCarNFxIEzmb7h31FS3HCihll7sLtsvjJI0J0gvAeozClTLPtdwzGowp972rAg7Ht1/F3oWndxU3RSgME3SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F71zULf5QQJCYyyxKNvZ8P0JOVJg6tv+dwXGFo93mA0=;
 b=RjbW0F2ftqawMzQGaaTdzmHo169VNXSnXXpDmgu8OJPWzfpThQdlVBtGbs2wew6ZByivvGgfToGXhiAornaQ0+8ijCW20Pz6b9qz9Z0n3GamCDmc8CFtew5m8V21KZcnXBeybLQB5sHEW5c8uEzWmiR4q8T+SQdyQ8J8vm8sOVl7VWpehOwN2Ouuwcxo0ToHTfd3DPVH9c0NHU7vwc9dm09W/ZuFd2aJfSjvjAN6nRhRZQj3OAl6XiDcQkOpGEoBIrb9zEtsIjjsLMdFAd4+wjBD78bvPQSaI8mLmO9RnH/Tk+K/yiLCFEswku7fszwoWSLyvlWzhJv5hUjC0KkG1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by MN2PR12MB4207.namprd12.prod.outlook.com (2603:10b6:208:1d9::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Thu, 15 Jan
 2026 09:50:40 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%5]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 09:50:40 +0000
Message-ID: <fced85f4-07b0-453b-9969-19abbef3f840@nvidia.com>
Date: Thu, 15 Jan 2026 09:50:37 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "arm64: tegra: Add interconnect properties for
 Tegra210"
To: Thierry Reding <thierry.reding@gmail.com>, arm@kernel.org,
 soc@kernel.org, Arnd Bergmann <arnd@arndb.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Aaron Kling <webgeek1234@gmail.com>,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20251217104744.184153-1-jonathanh@nvidia.com>
 <aUPrVFWKfFYmuwhB@orome>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <aUPrVFWKfFYmuwhB@orome>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0120.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c6::7) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|MN2PR12MB4207:EE_
X-MS-Office365-Filtering-Correlation-Id: 91ef11ae-ae87-4eb4-d268-08de541b8b0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RjRhYXQrajhBUlJCNFdvRDNPY1oyb3lWZmpOWEh3cHZsdzBlNGlYdWYyalJm?=
 =?utf-8?B?YktkdlVJN3BoTnUzRmpVMm5ldFJqMzRFL2VsT3FKeGhMQ1RYVzRva25rTUpM?=
 =?utf-8?B?SUhXL3dDM0JTTmpramtHRHFaYnMxQk96L1VXQzY0dVRJWEpqamVidjZDVmIr?=
 =?utf-8?B?RFNaNkVZTjNXRDZSbTN4S1lQTXg5am5BaG9aakE1ZjZXSklxUnRNRGZJQVda?=
 =?utf-8?B?R2s4VTZnTnlzRHkwRXNBbmo1TkJzMTZyK0I2QlczUTE0UHRNa3p6c0psWEhL?=
 =?utf-8?B?UG0yVm41dkNTOC9DZWphVUk5R1d0Zk0zTlpNZXVsVXdPeVdIbUl6MlVsV0Jj?=
 =?utf-8?B?aHh1TTAzZFVaVUlzY0ZGaDZ1VTRkeTJDbE85WkIxbWhaTkdqTHRwSDJoeTV3?=
 =?utf-8?B?SjZxbUhnSjFSMWNxdWNaMk1MOG9JNDdNMU9oNGNVQ0ZkUHFxdUE5RjE2enBa?=
 =?utf-8?B?ZE04S2VXOTBhWVowdFFSSlFnNkU0UDFlZllvQzNjZ3AxVEFsdy8yQ2hQcm8v?=
 =?utf-8?B?WTJyV0RBd2xIS0Y3dEIrWGpQNWhGWHFtb3U2Qktxa3QxcEdrZkM5cUVzZCtx?=
 =?utf-8?B?R3JhNml6SVhwVy9lRmxNL1RQY2haaU4xTGZpSzVjeCs1eWxaZFNoOFZjcUtG?=
 =?utf-8?B?NGMyWWh4V0pUS3VHd3daVWNXWHlPeFZZNitBNVdzeUtaVVVOMGdmZDJiSUYx?=
 =?utf-8?B?SVJYaXRocy91a1BJZWFvcG9ST3JXSjhjQ3lXSm9zajRETDJNRkVQem5QaC9H?=
 =?utf-8?B?RVI5bUNqQlNFbWNFaG5Tb1UyeG5XY25KWllnUno1d0wwNm02UTZhOU9FNjNj?=
 =?utf-8?B?RGsrdjZhNlpXb2MrVXJEalVjZkpGVWRxUlBHNUR0b3lWdyt4OUwvVDhabjVs?=
 =?utf-8?B?K1EvV0R1d05WUWcrZkVqRlFMaWJEdnhuR1lpbXlzTSt0YnFNVGx5a2F6MWpC?=
 =?utf-8?B?OFpodUc2T3ZTdEdtQktCdGlKeE4vcm4zQm52Z0dSeCtkem5RYVpIUURuZVV6?=
 =?utf-8?B?TFQ1NlFPUFhJWklKTTBmMDJtQU9NdWlWVSsxTVFGUzdhWldtQVZEOXlOdjBT?=
 =?utf-8?B?NzZtRWJ5OGJSUGxEWjMvMWd6Mkp4TWtucFZ6emFZeHVWeVdSd1Jsa01PZ2FM?=
 =?utf-8?B?VHo1bmxJLzZpamZiOVZXSHFPSm5FQlRFM0w5TG9tTlN2MnJQSVMzdHk1bVMy?=
 =?utf-8?B?TDNFM20yVXV2QWZaVktSbE1keEVJS0k1UHZNRThwRHJkTlNsSnlnVENKa0xa?=
 =?utf-8?B?d2N5T3ZWSEhQQk1PWTIweXFQQjNoMWtIQnlRYnhNMXZKZXhhUUhxamQ0aUxu?=
 =?utf-8?B?Y0NRUnp3d0FYZGoyUlNoZ1lWQnVqSXlRcVpTSUZkSlVYSDMxWDFKSllVUnBl?=
 =?utf-8?B?WTJSOC9ycEl5NUlIUlk1TEJuNVAwUmFLaEZoWFJtTlZEUHR3V2xNSElnT2NT?=
 =?utf-8?B?UDIzYkN2T210UGNYWnNDOVZnU0FybEtZVGlJcDRvSTRmNGE4cE9oKyt2Kzhz?=
 =?utf-8?B?VXRnY2U4WEFjdHdHalNWRk1qOC92MzlScHlzMDZjUytoZjE3d1MvbWtxRmFO?=
 =?utf-8?B?RG9GaS85cUVUWmsxR1h1N01XSXBhZ01GTzFRaVhjRC9sUnNaQTJwZlh4RmdM?=
 =?utf-8?B?QmlUYSs5eUF5NVU5NjJmZDBsMlF6N3M2MGNXN3dsVUMzZnc1NUxRTjdBRDNs?=
 =?utf-8?B?dFBydlRWSlBzZjlPR1BvY2hDL3A3OWExeWM0M3p6aFNpUzFPOFc1amtvVXdt?=
 =?utf-8?B?Y0lGMXRFNWc0SXhXV1Q1RnBGTEVydGNCUWUrZFZBTUhoYzAwT0JJTjZFeGlO?=
 =?utf-8?B?cjlVSlJWdDFVdDJ2bUJFNnVVYXNrdWpHRWptY0RmZGcyeC8yb1hab2J1MkNU?=
 =?utf-8?B?T2NISERMYktUajdBemZSMDkwUXhJcWpmV2kvS3FLVWQ5VnVEdEdJSXFCeVhI?=
 =?utf-8?B?RWZxeUJ3V1N0NExsbjRiTVlLTy9UOUFFMm9XSmNaZW1kMm8rMzEwNjJPQ2Y5?=
 =?utf-8?B?OFI4aGNRVVZValcyMTQ1ck1BZjNmRHdYV0Yvek5DTHJVeTlEbThiOHpsbStD?=
 =?utf-8?B?dmk5b1o0K1Z2L3crWGZtQndPQWNha3Y1eFE3cUlYdjh3ZEZBYld5ZSthWDg5?=
 =?utf-8?Q?b3M4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VDN4UE9RSHRROURYVFEvNXdxZ1Q5b3pjYTNGUTFURWVVRkVYL0JDa3Aydkt6?=
 =?utf-8?B?YUxVV1ozQjAvdnMzSExtZWEydXd1ZStPNEx4K1lJalVUT2V0bjBlQUloNnk0?=
 =?utf-8?B?eVRzZDdSK3Nla0MvUDkxWWwxVXhSVEZBOWFMTFFJSytvSWJjRFB6LytjTklI?=
 =?utf-8?B?ME81L3NtY0tUcG5tNmxRZGx5TFdtTCtCOXZUZFBXTWZRaGNsZnhtREU2UjNu?=
 =?utf-8?B?VVJBbm0vMjZqK2MyL0JSMTU3LzVsb2tiOXI2bHVlMXRXa0p4TDBUeWdMSkJB?=
 =?utf-8?B?NnpiVWFNbWtyQjFnQVdKYTlkZXR2Nmk1YWN2TGhYOE1HVm96NjB2T0QyTFo5?=
 =?utf-8?B?Vk5UcFM5bjZLUUU3T2hCVGo5WHlCWFdERzlGOEQrSFVkZXhnOGtETFprSldz?=
 =?utf-8?B?ZWlWSUVrcGhjUGlyQUdZeHMzWkM4UmVOSWpvSmdLcnpMd3YyMVZIRkVCRi82?=
 =?utf-8?B?YUlzOUdFTmIwSldtRTM0QWxqcVVrRTkvOTlvUHpNUEVYV2tMUjc2TkFDN3Rw?=
 =?utf-8?B?Zk1HTTBJN0twNU1BUVo3d2dtSFV2LzZjWmJSRUFMOFlYM2IzNExXWTZma244?=
 =?utf-8?B?aGw3aTdtbk9TWjU3alVqMkxTdExEMG0ySEgwa01CMkdRYmNYZGVJYnhYMjhs?=
 =?utf-8?B?VXlhOHU5V2FGWUFhemV5a04yUi8yVjZDMTd2UkxQVVpZdkpibDNqbzlXby9V?=
 =?utf-8?B?OEVkVmhKd1FLb0tNa1N3a3pPdzU0TTFUQS9WQlFtd1o1b0hxeDlMN1RsdVVZ?=
 =?utf-8?B?U1pneGQrUGttVGxoSTdja2dHWFVIRXhTTnRoc3J6R290S093U0Z5WXlXL2ZK?=
 =?utf-8?B?cHRoVjlnck1mUXVRSnl0ckNuRDk0MjgzU01tU1JxeU9MalFUWlNzUkZOUTNG?=
 =?utf-8?B?OHhxUXczMWdNVDhUZmJKbDFXZTFrYkgxS2NSd1BWc1lWMnFFUmxQandRc1ZU?=
 =?utf-8?B?bllXSVNscGpsL3JhWlJqbStMQzFNMmlqYldMQW9iVUNUMjVRUlJkTW1VaFIz?=
 =?utf-8?B?eGxjendodGtlNFpZcG9vUG5EbXBZam5tZUN0TTR6ZHd6a2NVQXFDOTBsMy9a?=
 =?utf-8?B?aHpQSStIUDk1bmVPOXlUTGFVQWtjNEdKdVN0cXgyRFdqeElaenNpMkpBcXI0?=
 =?utf-8?B?NGRhZXk3dlRRUE1VVlFLU2JtZURPSzNGVUNnUzJIbDUybGhLZnJHaFc2WmEr?=
 =?utf-8?B?OEM1d3hYV25kVW5aT3RpTzU0aU1QVkVtYXpETUVjS2JCRFBpVUtYb0I1UTZh?=
 =?utf-8?B?azFKZlBBVGk4TERycEcxbmVjQkw1OTdReGE1WWpxVW8zN3dSMm1YYi96cEdi?=
 =?utf-8?B?QlJZUVc1NGpzWVhPQ0kwWDZvajlmQ3BxaitlQldIZERzWldYNDA2UElhNkJW?=
 =?utf-8?B?YTFSOFg5eHJ6b085WFp4UUdKOUdVa2d5aGdzZHQ3RWE0Rk1SaDlQRUFFQW1J?=
 =?utf-8?B?NXVTNjBhbGpLbTV2Z0wxa1VKME1YUEtNZTRZYThQZlB6aFVEQjZwckx5SnM5?=
 =?utf-8?B?WmVxNm9aSE11SGdDYWhFVkNRL3ZBN3lrNnpFVkdPYlhQM0hnUnczVk0xQmVV?=
 =?utf-8?B?ZDVKYUcwa1BOVWgwVDlDSXM1YjU3aFJYOHBZRFFITUFBTjlVNEx0UzYvdnZO?=
 =?utf-8?B?WGdoaU9MSWJVb3lITTZFL3c2UHdPVi9Xd3pqbjhES1l2K09NR0RjN2JCZnI5?=
 =?utf-8?B?R2dZc1FhV0duOFk3TEM3WEVVZSt6VEUwN3NPd1NGT3JPdUtBYk1pUGlqQmNE?=
 =?utf-8?B?Tm9jV1N0UFRjRE1mYVNDeDVWakMxWWpiU0lyZkMzOS9hQ0VIcHU3Q0tEV1BI?=
 =?utf-8?B?OGhPcFY4R2ZiTFdjYUhCcDczVmhIL25YeCtMdFJmaGNVeTlEaWVFUmZOaFRU?=
 =?utf-8?B?UWQ3S0toczRvem0zOXpqK2x3bnFVSnVaU0lsWURZaXJPamZwV0lEczNBWm43?=
 =?utf-8?B?dmZBUmZlaWFkT09JdDJ2bFp2Q0M3Q1hESmpUNy9rQUN3R2tNckYxRGtiZnlP?=
 =?utf-8?B?RGs0TVpJTTI3dUlqanVVK2VHSGswS3ZFNzhJV09zV3M5eVRBVEZBT1g4bWpl?=
 =?utf-8?B?cEovWHNzT3VyN0V1b2pTdzRxK1BCYS9GaitBNXl1VnJxSnlTbFAyRXZmQVcz?=
 =?utf-8?B?YVdHRGZ6clJ1SW1lZG9nZTJpR21ybGl0bVBLU01yYmZ4clBaUGZ3THp5dEFL?=
 =?utf-8?B?aHVpYnpUWXJXSE5LUm9JdGJudVNWdEt2TTc1NGdzVmx5M3NEVjFPMklaMzlu?=
 =?utf-8?B?d0trVGk5QVY1QlgrTnNremF1YXpmVGdNOUdpSGtXa3pady9PU3JJNU94NGpH?=
 =?utf-8?B?ZXFuQml4MVhjMlhHWUNjZnBJYW11RkhYdlovc2JOSE80TlJJYkpSdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91ef11ae-ae87-4eb4-d268-08de541b8b0a
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 09:50:40.7807
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: leuFexsK0qQxD63URW0JhKQLgueBIeNsiI8K6Mmw+zNTjW8Z5k0TGnmP+OPe10X16tQtFzbrrInA/PpLbx7zcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4207

Hi Arnd,

On 18/12/2025 11:56, Thierry Reding wrote:
> On Wed, Dec 17, 2025 at 10:47:44AM +0000, Jon Hunter wrote:
>> Commit 59a42707a094 ("arm64: tegra: Add interconnect properties for
>> Tegra210") populated interconnect properties for Tegra210 and this is
>> preventing the Tegra DRM driver from probing successfully. The following
>> error is observed on boot ...
>>
>>   drm drm: failed to initialize 54240000.dc: -517
>>
>> For now revert this change, until a fix is available.
>>
>> Fixes: 59a42707a094 ("arm64: tegra: Add interconnect properties for Tegra210")
>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>> ---
>>   arch/arm64/boot/dts/nvidia/tegra210.dtsi | 24 ------------------------
>>   1 file changed, 24 deletions(-)
> 
> Hi Arnd,
> 
> this is the only patch that I think we need in v6.19 for now, so do you
> want me to send a PR or would you rather pick this up directly?
> 
> Here's a link to the patchwork for this, for convenience:
> 
> 	https://patchwork.ozlabs.org/project/linux-tegra/patch/20251217104744.184153-1-jonathanh@nvidia.com/
> 
> Acked-by: Thierry Reding <treding@nvidia.com>


Please can you let us know if you can pick this up as a fix for v6.19? 
This is still the only fix we have outstanding that needs to be merged.

Thanks!
Jon

-- 
nvpublic

