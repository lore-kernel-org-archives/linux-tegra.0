Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010019.outbound.protection.outlook.com [52.101.56.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0AD30DEA7;
	Wed, 12 Nov 2025 12:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762950577; cv=fail; b=NrmICpd2dMM+MUSsm6WINuOWBn/+WVluB1Z7AmRbeG1yDycpJTMUBASYqoOhuoMGC30BmCoJXstqbpHD/z9UNA7slC60pAspvX/LHd+hkCP/IOiZoF5bEWXOtjZpoRqPp2GgY6bAqEfkbsswV4LJ5wnj7T+QTkoTR9YIWCAj+04=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762950577; c=relaxed/simple;
	bh=je9XCQwOF/60HhJcI/UAz9e17Zkp/OIGQTsk563dp0k=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QcXxWSmR2RymaL48jNCHhkNN3vIX+0eo0sR2dddqYMVPqWIMWELKMPQ4wj6yhdkdnrzzUlpaksPt4vMOGScnUCchqFdrNKpMviD4xuboAALCXsSgAD4fZu2YFhrfZfRGCHQqUasTC/7M5T2soRPFl35Wmoi9757K223zogGB0qM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mjq1d6Ip; arc=fail smtp.client-ip=52.101.56.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mjq1d6Ip"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j3lF3n54srv3P5Ht1my6dgXWSjkHSI46zIVgBkgXFRHH03Gq1+/VwSH0EaxZ2VygXqTISFZ6gew8TLWesJsZlOsUUie6r2rKmz3gjuPaBzxvMq0Zuyz5TbpzT6u6f1ppiukfPcpu6MMdS1/k35wmVdmF2oSzYSeazDB5vqCm7TWD8cTvKGVdbMaUA3vcV+WZ2AlFgb6FiUdaGNyXeWryos5144XIOgvFfNRlsD1Ur0wzSFtR8mVA3Vvyjy1kPNM2nd5RPq23mHZs4bUtxUBsVy8HavoTF6kWBMKCaJbyObcs6TrsXtop0GhBtw2dFTYPW8yBqlQYWiJ6939nkdiPXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i9Me+X3lmYeYY5zP2A6OAXTRPbUONharmPCYGsz3u4E=;
 b=NOAUNtS5CssHEwxz1MgP2i+tU//OFsM4IrJE7X2IAeH2smCdmxAEb9N0zWCQgyaDMvyvU2VcJGjfvtllh3Az0OkLIUMvDM2DUwC0NeprYLfu+1jerLuv0wD13likm/wh48AhaurmTvyl4Cjpxq7uVMcI8F2I++ZFayhclTis1NQkxNSoylJsNgIHFGSjoDuFSiFyZInI+i+iqfP+XIvQWtuQVmLaiKnkJVn7/6bjAkJ7b3+u1NnAEnhvijn3UevaFh/3iUly7o11yeuGCL19Xvmhor5c4Go4SBHxPAYLHVpzDcgojulLXhPZXq/lXHtIB/r3D28ZFo6HD4OhM5mqEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i9Me+X3lmYeYY5zP2A6OAXTRPbUONharmPCYGsz3u4E=;
 b=mjq1d6IpzsPDJjuD/v2loVpN7tG5W2j7rbP8dUmKy+R2iuBOJDW5u6jY1IPtfyoz8TtfsevPUgpJ/fO5yF1R4yGq33vZ35J3wM0ZFbAUXu6uR6Vp5cyZxPRVNJPOylsJ/IxUHxjBNHevS4iBBFohM5uTAM1Zc2f52a7Yb6w6F2mA/wAlS0Pwsw0atmky3xsndFxdiPSyzpBd6mNTbMgf3QZedgNTBZ06jfVsps5rk8SZnF1bQ2Skp1iMOywka1nv10S5zSQXIX2cXlL/LpgfKGRmCfqVzE4/TcnvelylGrpesLswJyNsbXIOJRkD70EmYDFPH6njcF/CRDcCvp6AOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by IA1PR12MB7639.namprd12.prod.outlook.com (2603:10b6:208:425::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Wed, 12 Nov
 2025 12:29:32 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%4]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 12:29:32 +0000
Message-ID: <cc9e22c1-dec7-47f6-9cf9-69b349777199@nvidia.com>
Date: Wed, 12 Nov 2025 12:29:27 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] memory: tegra186-emc: Support non-bpmp icc scaling
To: Krzysztof Kozlowski <krzk@kernel.org>, Aaron Kling <webgeek1234@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20251027-tegra186-icc-p2-v4-0-e4e4f57e2103@gmail.com>
 <20251027-tegra186-icc-p2-v4-3-e4e4f57e2103@gmail.com>
 <82c8dda8-6fcb-48f9-bdaa-f3d1431e41ae@nvidia.com>
 <CALHNRZ8nCojreFCMXfbBBhWAMtmWN-04XtuW8fEsVD9bw+-AzA@mail.gmail.com>
 <CALHNRZ-CO5i9jeLkEG2cmHxcW1bcLhxcBSxjmL2euHfQy8yr-w@mail.gmail.com>
 <e6ce190e-6df7-4c36-abca-f09df3cc80e7@nvidia.com>
 <99ca4992-5736-417d-854e-379542549bee@kernel.org>
 <7f3dad08-cff5-40c2-8e7f-f6441a3d6b91@nvidia.com>
 <d5d23eb5-f43c-4e4b-9926-3fba6ffd3acf@nvidia.com>
 <CALHNRZ8vFJyfFXbxFehWA9TGkdrEUy9Wsm-DxEOT=tVbYTcU5Q@mail.gmail.com>
 <249bbe7e-e2da-4493-bdd5-8f4b17aff8fe@nvidia.com>
 <CALHNRZ8uPaKqSpFWkmYZn==Xw=rxh95Xm0_6LPN1HDj20zofqw@mail.gmail.com>
 <d16803e5-7b6d-4472-b50c-aa324cf52736@nvidia.com>
 <6904a858-d7a3-457b-8141-692238d01582@kernel.org>
 <f0cf2f70-f2b4-47b2-b6d8-358e36c750e7@nvidia.com>
 <aaf2cc37-b8d1-4666-9a3c-753ed34af760@kernel.org>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <aaf2cc37-b8d1-4666-9a3c-753ed34af760@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0222.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:33a::10) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|IA1PR12MB7639:EE_
X-MS-Office365-Filtering-Correlation-Id: c78d7479-9020-4fae-0a8b-08de21e7219c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?djQ5K2xFZ0MxSEw5bk55YjR1WURSRDN0cDB1UEx5WGYxUUNSRW01SGtiZnY1?=
 =?utf-8?B?d3NraTd4WjVDa1dUSzZGeHY2RS9KNlJBNkJEa0VLYlhRUjRUQzE3UThjcUE2?=
 =?utf-8?B?aHFXWTZES0pWNGNSRHM3UkZ5L3I4YlFFWXVxUG4zaVRMK1IxMU04cHdDWndr?=
 =?utf-8?B?SnJuMWxLZmU5VkRGcm41OVFaaXc2cmY0OUtwY3F5eCtMczlyWEZ4QWpSWWRt?=
 =?utf-8?B?bzFvNVFnUjViVm41V1o2Rjd6QUFEMDJRZ3NhYSsxYlNCWTIrZ0RYZlZ6YnpG?=
 =?utf-8?B?VnVsRm9xVUJsTXpMT3JsenFTL3dpK2F5VGtHTWdlZWE5MGVoRUxUZmxKa3Z3?=
 =?utf-8?B?d1JFRnp0cVhaVnZUM2dQT3pmRHRjREZ1ekQ2TEVSdHdnaTRFM1J3Y0x3TDlK?=
 =?utf-8?B?L0kzZldiS1JPVU9WWDRmMzh2WUJEMTFnSVk3YXpMSTJJNTgyc0dRY0ZHdFJM?=
 =?utf-8?B?QW1UVC90MjBldFVuZk1VRmV4Z0RNemQxbTg2TGZROURaaHVVZCs3N3pCZG5p?=
 =?utf-8?B?NDYwYjQ0T2MvVEJQZ1UrUkZabjhIVW9aaWR2cURCaWU3d0pvUkplSmpQVEpx?=
 =?utf-8?B?dlc3TlZjcUJZNU5CNzQzekFrbGdjQjNlemZuVG1yOWtzQjVaT0tsTGFsTGg0?=
 =?utf-8?B?UDFKWmppOGF4Z3dFNHRldVR0R2laOEovRU9iNSsvcGJrS1c1OThJSmpXSFNi?=
 =?utf-8?B?cVVhRktBY0RyTFJIdkZZRXd6US9wdElBM0JUditPOEkrYlZBYVdFd2pRakd6?=
 =?utf-8?B?S3V1L0MwZm8vMVFJY2hSRmlRWkFMWFNWNWtNNXZXbXhBclZlWW15ejFsTU5M?=
 =?utf-8?B?NlRJSWZSWFhDUzR0dUwybG1hU25QK0czR0VmRkZOTGJpK3lQcEw2Y290enBV?=
 =?utf-8?B?ckRZUWFjNHlaMUJ4K3ZKK2R1N2NYd1ZwY0NLMjZndlB1Tk1iZkFoZ1YvZ2gw?=
 =?utf-8?B?SkgwVXgzV0c5UU1zSFo4aWR0NDN5cWNpOHFrS29IZzhDU1VLUmNCQzQxRmNC?=
 =?utf-8?B?WTcvaWZZeXdLNnZFa0lFek1BcHA0YlJrMElOYnZ2UitPM0tTcTVmdGVWOHNN?=
 =?utf-8?B?SHhVbFFHTGNrWWlOb0dpWEFpK2xrejYwQlB4Z2Mwbm0ybWRrMEM0TnhPdElQ?=
 =?utf-8?B?RUlycW13RlFXaHdiVlFqUDIybXhsd1NFcXgzemUyTnlhQ2JGWmxFY01rVXBr?=
 =?utf-8?B?dThpSlliZTRJK3hBRzhYekZ3NHdIRTVuKzVxOGUvd09IdnprSklUL3JSblN6?=
 =?utf-8?B?eGxMM1VYTVFhbGVNU2xzZDdpWlpyNmRIblZrRnJ2blJLMmNocmpxU3V4OWlQ?=
 =?utf-8?B?bmdUcDV1WlE5Z0hJSTh1OHhlMTZtd2RPZkNRUWhsN0gyTWFBRGZMYTkvWFB2?=
 =?utf-8?B?ZG9mTUVpZ2FBWWlIOFZoZmtIUkFnTEM3ZzZFSnhpaUg0cmdtYWZvZlRTNS8w?=
 =?utf-8?B?VmQzT2hOVG1ucHhmaEtxenVHbXF2dFF6Q1BqdFlJVjQyeG83bTRodGJuTTdk?=
 =?utf-8?B?TTBENlI2N3gvQ2cxMU5aTzNxMjNpRVNGTFpDb0tyTHRJVkNDTERjeVF0Z2Zi?=
 =?utf-8?B?Y1VWUFFVdTZHZktoU3BqWkp6d1lpWktMay9CYW55QlptR09KZUdlaFlRZ3FE?=
 =?utf-8?B?eDZ5QUh0RzlKUUhnZlZFOWEvSE9kSUxIMm81UjMrZHk2NXlEeGFQdDJPa2hX?=
 =?utf-8?B?SGdCR2hQTHcvd2ZDTU1xRHNDNVl3R0pDTXdSZUtmZld6eGd5ejBPTGJBUDQy?=
 =?utf-8?B?bG5GVkVYcnNZS0tqUkc3ZVdUNDlONmRyUnZuaUNFS3VvRlJPSWpCQ0ZPSUh5?=
 =?utf-8?B?UzNzUVNRNUZNeHFMRG1taDdlT2QrSDFiM2xTalk4dE1FK2FDK294QXl2VHNV?=
 =?utf-8?B?VjBoc3ZCSW5OOTg3NmFjd2gzOFJhTlIwU25BazJwdGdFelJadkVmTEp2eTZC?=
 =?utf-8?Q?o/CEml12R/XUjUw/h8rJt8SgI0cUdDGK?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UXBqdStlNGQ4VW5MVmtxUzdKT2FxRFN4OVVmcnpnaXNlak44amZoWUlpNEJ4?=
 =?utf-8?B?dStRdzRvYlFrT01hMHAxbm1FN01HbEd4dHlyUWJOSHdRM0dMRjNMcHNWSmZI?=
 =?utf-8?B?K2xKTVFubmJsODZkUVdpNE93ZHAyZGxEaVhpTnkzTnV5NGJZcVdCUkZxOFFZ?=
 =?utf-8?B?dDF5V3ZrSTJvclNDTjJvNndhRmF0bW9Ba29uY0lqRkVHWU9ZY0xDWmNVOVhn?=
 =?utf-8?B?OGpaSkZRdFQ2bzhibEM5Ukd2ZGUzdmk4NnNpQ29sOUdOOEx6cUxMQ0loR21P?=
 =?utf-8?B?NlVSN243aGFYQzhRaFlZY3JjbU1kL0x0a29aeDduOHZsbm5kR3JxZkhiS3dX?=
 =?utf-8?B?ZW5lUll1cnVZbmUvM3NzRU9TaVN4UkkxU2Y4NjVzTWRSWDc2UVhyaWw0dnlV?=
 =?utf-8?B?OUh1SHZPLzhVK05UblJkS2VlTkVxckN3WTJ6ZlJCRnhQZjFSSWx2bGN1Smdu?=
 =?utf-8?B?R2xLaUh2OEVaUWVkSXZUeVY1VmFjWk4wWDR2NFBhaWpGYkVFSnlVMzNYcFI3?=
 =?utf-8?B?TUtCaUxtWjU5TUw2ZXplSFM2bVRxWFdJUkFRSXZ0aFlwQ0JOOUJFQW9YaFdS?=
 =?utf-8?B?NnBuRHlyNnFWTGlocFJmZTdsLzQ2TVpDcEpMOFRWMnVoOEhvNlYyb1VkQnA1?=
 =?utf-8?B?SHBoRkFsOW1HdDZHWVl2MUtvM25HUzJHNE1MREY3NVFRaHpJekg3Tms4NVNu?=
 =?utf-8?B?VEFyakozY0p2RzNMZytTTThRKy9WMGw2dSttdHozQllqR3ZCQzlneXBMVUNO?=
 =?utf-8?B?aFlCQjFzOGQwWDZQYnNoajM3dUczbnJ2OFZsMm8veXdiU1ZPT1drbEZVOVhq?=
 =?utf-8?B?dUZqNHc4WDNGVnRGa0xxZ2d2d014OVlIR2RqWGxxUW5KV1BDL2E5Zjl2STJ3?=
 =?utf-8?B?bnNQZmt6K2xORXR0RUNnYlVrMDlJaXhvNlpLbUVxMGV1dUVncTdNOHZPQkRt?=
 =?utf-8?B?TVM3R1poT3l1R0ZuSnkzdDFOQWV0V21GY1JwVXdzUWJqUkNTUTd2dlRxbml4?=
 =?utf-8?B?YVhXZlJCS0RETUh6YkQ2Z3ZFeEFUR2VYaFJZZjhHZGpLNlNBM1NvZ2xZWHNE?=
 =?utf-8?B?cWVMWVNaNDJkZDBHNy9mSTN5ZEx5Z05BMDdEVDc5b0ZGeEYrVDZTY2xmcDht?=
 =?utf-8?B?V1dBQXlhM0F6eXBaS1JBbkZOQ3EwZ1JJZWRpNGlZWWp6N29MTnlVdHJQbWJ2?=
 =?utf-8?B?S0xIdzg5R3F1cTkyVXlCYUZ2cFlZNzV6Y056cXBLVCtlMTJFeC9qUGd4MElY?=
 =?utf-8?B?VDc5dVc1TWRpTCtmMW11OHVKYU41cUVsaGIwYTh6STNxZng5aFJRQ1JHTUV0?=
 =?utf-8?B?eHYzc3laUTlGa2UxYmJaYmFaemQ3c2JQK2VES1Q0SWhFVGF6YUw2YjlpL3lK?=
 =?utf-8?B?ZDJMWkN4dGUyVHBMb2phd0JMbHk1OHY2ZTJFbHBPRS9wQytBSFp3b3BPMTIy?=
 =?utf-8?B?MnAxamNMQWlJTEQzSXlOd1I1YzVSbkczd1RjYlJtQnZBSlJFN2MzdGtCR0hn?=
 =?utf-8?B?OTlXSjAzcWlaOERmV0VZK3ZjN081YnFtQ2FVYitrSUt2elJQcVBjVkpXMDVZ?=
 =?utf-8?B?RnVybmhSZkNzbG10M2lETzlYcGFadGhVK21TN2ovb0NoWWpEbW1wTTczdHd0?=
 =?utf-8?B?K25wT2VycTZHdDVLZDRkTjhCdkNhaE9WSndEUngxcUdTTDJuK2NxU0xtWHRM?=
 =?utf-8?B?S2ZRUEJRTjJPVDlVdkRCaG1BWWJQRDJwbXpWa0xDcnF0MmZpcmNKL3M0bmhS?=
 =?utf-8?B?UjVSdmpNZ2diUWlwSzJ4azdlM2FHM21UUGw3VG43ckwrKzJldWtFWnlXMk42?=
 =?utf-8?B?SEt4SVo5Q3pUd1ozczdWYnJNOVRadURIKzJTTW9xMjVUSTEvclhubVpqOU1F?=
 =?utf-8?B?cGJIRUNPZVFQSjJIZzltNVJTaXZLcWZzTVdFeUdTcGxmRTJMc3hueXgrQ1ZZ?=
 =?utf-8?B?dDNpcUxUN2Fab1I4eSs3ZGM3ZEZSck5MaUowWU1ua1ZTWXlQSGdzRzliTXBq?=
 =?utf-8?B?Q0dwTytNZHNmQkUydzZudnZtYm1xNHp3K21zS1Q2cThlaklNNENueHZ3L3Fp?=
 =?utf-8?B?bWNSQUJUU3VJWGlPK1ZvOEtCaTVDOUhaM2d3WnNNU05QZHJjc24vNlhLK0FJ?=
 =?utf-8?B?QVNEeFhXd0hHUWZScnFHcHhwZ2tYK1JDcFdFRE9BWnVvTWxtTDBvblh1TGx4?=
 =?utf-8?B?QnNsbEM3ZTRTQjRjakxmcW05ZXF4d1hUcE9NRG9uWm5iRWxhVCtZcTgvTDJB?=
 =?utf-8?B?b004T2k2ZDQyWkhoWnMvYlFiMWZRPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c78d7479-9020-4fae-0a8b-08de21e7219c
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 12:29:32.2640
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rv6m25bX4ymX65zWi3hwtQl/SAjU/rcWJ52m9iwCEwl88sd7kSkIwr5REaJQR5K4gElImb/G97UpZlQ6p+zAtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7639


On 12/11/2025 11:42, Krzysztof Kozlowski wrote:
> On 12/11/2025 11:59, Jon Hunter wrote:
>>
>> On 12/11/2025 07:26, Krzysztof Kozlowski wrote:
>>> On 12/11/2025 07:18, Jon Hunter wrote:
>>>>
>>>> On 11/11/2025 23:17, Aaron Kling wrote:
>>>>
>>>> ...
>>>>
>>>>> Alright, I think I've got the picture of what's going on now. The
>>>>> standard arm64 defconfig enables the t194 pcie driver as a module. And
>>>>> my simple busybox ramdisk that I use for mainline regression testing
>>>>> isn't loading any modules. If I set the pcie driver to built-in, I
>>>>> replicate the issue. And I don't see the issue on my normal use case,
>>>>> because I have the dt changes as well.
>>>>>
>>>>> So it appears that the pcie driver submits icc bandwidth. And without
>>>>> cpufreq submitting bandwidth as well, the emc driver gets a very low
>>>>> number and thus sets a very low emc freq. The question becomes... what
>>>>> to do about it? If the related dt changes were submitted to
>>>>> linux-next, everything should fall into place. And I'm not sure where
>>>>> this falls on the severity scale since it doesn't full out break boot
>>>>> or prevent operation.
>>>>
>>>> Where are the related DT changes? If we can get these into -next and
>>>> lined up to be merged for v6.19, then that is fine. However, we should
>>>
>>> It's still breaking all the users then.
>>
>> Yes indeed.
> 
> 
> Please test if dropping sync_state from memory controller drivers helps
> you. This might be the easiest fix and it is also known solution when
> there are no users.

I had a quick look, but I believe that sync_state was first added for 
Tegra234 devices. The current issue is with Tegra194, so I am not sure 
we can simply drop it.

Jon

-- 
nvpublic

