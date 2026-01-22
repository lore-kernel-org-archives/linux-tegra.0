Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010002.outbound.protection.outlook.com [40.93.198.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F663859FE;
	Thu, 22 Jan 2026 18:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769108327; cv=fail; b=I/srtibeImaCEXvtK4NZNURBDB+w6TDJuMkR+42Zhpu2QfmxWEFg0QBGY6q3e+GlEGdHKbIsmmzv3OO1UYqxTpUklqiw3iXEULek3NPY/8Kyx5gF5uoP6IyCtdcOKTaqrXX16ykxBD2SiTQbYlx2Cd8oqy1eM1G9LA6AaEeGkr4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769108327; c=relaxed/simple;
	bh=4UowwDR5RtZiJj13jyTNGgJg7H3YmQilfj1Fa+F5w+g=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HDWYeCHu0UKsGQ+Ia9KSx+aIKPPHzS/2hGPI5R2dVs1poGPvmY/O+n+Qy5MnLT3e8yBFaO0zCWeS9e0YAcT1H8tHKGqBWc7E0C/nWhOtQKNheA+BaujIrA2lq397JkH/2ds1TByH6qATvcZsSlZ+NPRdYeq0HbDryo5vO4rwaCo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=j9st7sFz; arc=fail smtp.client-ip=40.93.198.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="j9st7sFz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HXZpe15Xrk7EnsqZdvjjxriP1aA0GoGTb73Aye2PZ3K9q/FDe4Pkyzg32fU8diEPdGx4FhfgM9L/u8teDRiIdaUbAhnWxrKDhIbTd6c0QEJSWNi/9XfXQX7IqUStvq/hO/mIx0iq6seUKRLWGnd1mPPMPIttcZeAr3hE0D0uc4cKxdceEaRsbnWCcNcygh07wJrf9tUnCxvLm/h1WjYff5PyZGpYdrS9LCtd0TxDJdgfYvUkiMk0ve9b0CIiO2PU3coDcC+Sfu/tMrcP7rr0/gNUCt4PCHao48DqxLMZXsNB+BdqlNEvNEPidFpyWqPQue1S6i4KO5HWOrCxLHKuLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8lzGf37HlvKrO/jwYRVDmTIOT7xjEAhQm5BhU65Q8wo=;
 b=GBu3kURZZ8ZrNl83RpqZYv3snYmNST9fkxOKOnH+DnWGd2uqSEjUtJ92oijPDIq9gZiUUqwhFw8ZKPkOu2qI+zYiN083tBF8nJmm22kGQZW9C0wahWI/j2aeOIPl5QSLFqwt46BBOQ7tJlxMAEtmY0rV8wJvsmGBpcji5qABhAqZRkTrNv+fP8IE35MeSpwPHfxTVilmvJKZ7FKs20sn/JB0qNR3ADV7BEQValZoZsAgn+pIr31fHlbs80hUujvIKAjJHHCTdiMz58icgT640R6RTafCNaUrFN9AmxNe3Kzcn+lXXgf7JNUbCVkvuZDH1jfJOZdP7FaNkEaeQi4DSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8lzGf37HlvKrO/jwYRVDmTIOT7xjEAhQm5BhU65Q8wo=;
 b=j9st7sFzl/44bdi6iJXE/kGdsy5ciMMSIBhur7ZvG90XGUG1/W7OlaFqsLPLJJ/F1+i68Mt0MebGcWO9728UoE6nTKeW9QBbn6Q+1NUr1J1uJkG9+zgRyed2STJjRSZAFV3McfgtkO95Hh4xreTv/GeVr37J+f6pcrWhTJBQL5lnATc3o5enJ7Hw8WbO+XlbZbL+5uxAdrSc52gsG0SX4tklrfw0ivcCWT71eC0KXbCtAaPvKpoO2DvMgBzXX2gGb5mH8Tm9k4vFgYJ+bBzoWo6VF9cJ62jmMJmPGEREd/zbIqGItIziG40eR0krFFo4aqGIaQRppXleKSayq/ru4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by SA3PR12MB8048.namprd12.prod.outlook.com (2603:10b6:806:31e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Thu, 22 Jan
 2026 18:58:34 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%5]) with mapi id 15.20.9542.008; Thu, 22 Jan 2026
 18:58:34 +0000
Message-ID: <956d5d23-6a62-4dba-9c98-83457526f9b6@nvidia.com>
Date: Thu, 22 Jan 2026 18:58:30 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] driver core: enforce device_lock for
 driver_match_device()
To: Danilo Krummrich <dakr@kernel.org>, Gui-Dong Han <hanguidong02@gmail.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
 Mark Brown <broonie@kernel.org>, gregkh@linuxfoundation.org,
 rafael@kernel.org, linux-kernel@vger.kernel.org, baijiaju1990@gmail.com,
 Qiu-ji Chen <chenqiuji666@gmail.com>, Aishwarya.TCV@arm.com,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20260113162843.12712-1-hanguidong02@gmail.com>
 <7ae38e31-ef31-43ad-9106-7c76ea0e8596@sirena.org.uk>
 <CGME20260120152328eucas1p1024a7488ae10b8b7f2fcb74baee24c75@eucas1p1.samsung.com>
 <ef37ed64-24ad-4b82-bc6c-d3bc72aaf232@samsung.com>
 <e32b0819-2c29-4c83-83d5-e28dc4b2b01f@nvidia.com>
 <DFULF717AOGG.GY8B9ET26KND@kernel.org>
 <f10007af-3629-4769-b89c-bbf4aa013bf3@nvidia.com>
 <CALbr=LaE=nS30uMmm_spywEHPYgC_w9qb9L1wFvwBe=PDae1Mw@mail.gmail.com>
 <DFVBKRQ35CC0.95P329BK5KZA@kernel.org>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <DFVBKRQ35CC0.95P329BK5KZA@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0507.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::14) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|SA3PR12MB8048:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d63ce5a-1937-4599-25c3-08de59e83e4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OWg0eEROOG1adGtHcWJSK0ZyYjlDVTdnaDdOOUxYSzNCblp2MHRSd2trelRm?=
 =?utf-8?B?RmJScVpxV0hKMS95YTJIY1NRYzR5L2ZhS3ZuTTRlRW1FazRjOXltY3JDUFVr?=
 =?utf-8?B?blY5amJxV2VKTFVvNFA1eEdIam9Fejg5NkxzNnIrblJUZXVINmdwNVNybnJ0?=
 =?utf-8?B?dWZmckVEWER0djBYSmwxRHppZHdBcktsK0pYSE0vRGNFdkxENmsxbmdjOERZ?=
 =?utf-8?B?UmcvZExTSXBDTkZ6d2lXUTRVYWxEV3JRcnV2NmE2VEFrSWRVNFEyQUJHaFBu?=
 =?utf-8?B?VGppTDJNWXNZRFBYRitXKzRPeTVhOGFLUXFGUkNDK25iZHMrd0tjVXdRMzE5?=
 =?utf-8?B?TFhyclRhNitlWUxieHEyRG0zSDY4OHY3ZDdPbjJlRmxlSXJPMU1mQnFJQWxM?=
 =?utf-8?B?YWR6cEVMVW5CZFJyeS9kalY2UFJ1MnFOSlozaG1lOHJocEJNbUNRK0UrZ3JD?=
 =?utf-8?B?TjJ3KzRKWHJ6VzYvSDFFU29hM2krZVphSzFFNkRRRG5NZnRRamZOdmY5bFdu?=
 =?utf-8?B?S3J3M3V0T2tlZzJqaHFJbmtBN0MzWWxKWXEyNGZ6RDRkMzlpN1B0b09CR1FG?=
 =?utf-8?B?ZEJNanZvQmFWaFg0SG10TzVOTkRoQk1BK2xUUTBWemdNNEdLZFo0eG0wSld4?=
 =?utf-8?B?TU9XbWpscVV0U0ZpTEdVSCtXMlFOb3liVGxKYU53Z1pFYlFpbnN1VUhpRHVY?=
 =?utf-8?B?aEhaTGtoKzFFcnJKc2RBQnp5eENtckJwbUcyeG90UDNwTExvM3QwekczemM2?=
 =?utf-8?B?VTF4R3hDVnBTSzhEQzV0dm1ZWFFxVGZCOUJSWUJ2Y0tZOUNFREFIaUFOektq?=
 =?utf-8?B?czZhc1JRUHdjcDJrR2hyUmpCRXoxQkQwdjNYNEMvK3NsL2dYVllqdzRNamRh?=
 =?utf-8?B?VzVkNXNMc3FNV3I5cDBadVpLWDc2RVpSZ3F3L3FsQXpYcDNnR01YNXB4Zk40?=
 =?utf-8?B?RTM0RUkyMVd0VGlQNCtOelB5enVxanc2VXprTXNuL1ZvcGJzTzBidVBGMngx?=
 =?utf-8?B?b1c0ZHp6MTBsZDZOQVBlNDV4YmJqNjZsbXZiTXVaRGswMURBWWxtMEpGNGNP?=
 =?utf-8?B?QUwvaUthZnNqMzR6MXBhZS9DUUVQakNJZndhOHJyTUdDdkliL0hSdEhEYTha?=
 =?utf-8?B?eUx4RC84d0IvRWI5bHZMbCs3NzNBRG9HUnRQb2NLUm5od2FjdGozRlN4S2Ns?=
 =?utf-8?B?U09rSVF1U0RhSXVlWk42UmZZOXlLZWY1YzlNWGlpbTV0QzlBalMyNll6MkZF?=
 =?utf-8?B?OU9FMjJHTUhySTlCUHpkUGxhK3kzL1ByTDRsSWhvclhaeWZmM25XTVFsWTBh?=
 =?utf-8?B?OFFkd0VSYlhOZFVFNFdSSVRqVW1pOGhhWXZiaDU1N2VLNVo5RnhCSWVsV1Mw?=
 =?utf-8?B?ZFJOSDAyRWJrTGl2QWZkb3dHaXN6YUl0ejBBWGw4VytIU0NYTC9UcFd0R3ht?=
 =?utf-8?B?aEVxcEp3Z3RFd3NvNDIrTFFiQWQ4cWRwM09tTSt2YkZ0K0JQdTFxS1dxTk11?=
 =?utf-8?B?bVBGbXhSdmJlRVdpeG1iMXN0MkVJU1VWbUVJeUc3bDErVTZ6OERLaGRhMnZI?=
 =?utf-8?B?UDJ3VHplSlJnL3F2b2RURkFLMlljSk0wd1EzK2E4RmROQ2l6M2I2MFNnVmdh?=
 =?utf-8?B?VUs1SXNjcXM4aTJwckk3TDN0SzhqeVNIRDFnTVV3VU01Njh6TC91UEpROTZq?=
 =?utf-8?B?WDNvVWVRa0NhL1RjamJwcjdMdWVFWldpNFprSFBNVFdFaSs1UmJLTUJDU3k0?=
 =?utf-8?B?QzZQdmdVVXFoL3FQN0FteHFwT3VMYkxicG9BVnNXVnhxb2JXZEMvU1BPREhW?=
 =?utf-8?B?S1dTL0E1NTZxK3o2bzVBMVlBVHJ1N2tNRVc3ZCtoQkJrcHd4N3lXN2NGRisw?=
 =?utf-8?B?VnlyZG84dTNIemFVWGdkVkVEeUpZYTNqZFZlU3cyS3dwVzJoZ0pWVGlHdHQw?=
 =?utf-8?B?TnRXVXNNclFlcjJWQ3VJZExxNGQrU2ZBUHBNNFlBV0ErV3lTbjIweDEwL0oz?=
 =?utf-8?B?MDdOVnFtM2lNLzUrWnh4NEtScmNkdmgyMUF5cEdCb0xkZ1lnUHN1ZDFVcGJh?=
 =?utf-8?B?b09zYVJnNE1CVy8wSkpsSFRGdVA0Zm01bEtIZ2ZadC9kQ1RMRHZUelVlaHlh?=
 =?utf-8?Q?oiLo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OEc2R0twa2srMjg0V25rOUVXWDNtcDBUd09CSCtpR0lOV2U0OFNLRE41YXFv?=
 =?utf-8?B?RjJ1clZNYitLV1FyMHFVSFV4amIxU0JWZmtoK2RYaXp4bjRjNHFXeTdBc2NC?=
 =?utf-8?B?UWNMQ3JKQ21iQzMveStJM3c0TWtGeGpublJIeFByK0U4RkwxYkNpdUp3RVIr?=
 =?utf-8?B?UEI3THFCNVplNGlOc2RpVloybUViOWZXOEhYZ0pMYjdvQ2daQ0s2bUtadzRW?=
 =?utf-8?B?QUc3K0lvQlFDeDVCQ0hTbGIvT01YU1F6K2xYMndOM2V4ODJQYlZIVHFlQ2oy?=
 =?utf-8?B?ays4cG9WaUE1dGZ2SjZ0c1hTRWppWTd5UnZZbEloeGdYT0JXaDFFUmJ3TnBD?=
 =?utf-8?B?My9EN0s0dXpINlY0azVtV05ZREUxeS9rTkZ6TmxRL1ZDUnY4UEtPMkxHeEpV?=
 =?utf-8?B?bzVSMzZSZVZCMUtVMGszU1ZqaVQ1VnFYY2tPTjVsUXVEN1hzR1F6SGVBMjI2?=
 =?utf-8?B?NU5qVm8vRmp3U0JDcnNBekwxVGxGbGFVWUIrVS9sRDFkWEc3TE11R1hrQU9G?=
 =?utf-8?B?Y0JWL1FrNnlldWs5Mjk4YStpT1JWcEFqSDJxUlkxN2VyNTRSd3cwVnRCZUxD?=
 =?utf-8?B?c1pCZVNUVDZ1b0VNMTV5ZG4xMVFJS1I3VFJoeUduMHYxMUhCYmNwbGlXVHVm?=
 =?utf-8?B?SXF5NEJuU0hCWHQ2a2ViVFlQa293Z080OHdiMmhvUTdmQm9SaWZ6WlJFWTR4?=
 =?utf-8?B?Zk1HVDJJMHNtRERiUFYvVmI1eFIrd2pBMWExa1hLN3huSEJjN0NhTUYwRE83?=
 =?utf-8?B?V05KZ01pQm9URThZaG9IQ2ZvMkhLRUR5TGtCUy9GNmJTUHUxMURScmIxcncv?=
 =?utf-8?B?WHVVcDhBNzJHTlF3RWk3RFRIQjMyNFdjRU13Q1RnZUZHM3VHdDI4OExRNnR0?=
 =?utf-8?B?dzdWbzZ0MW0zdFhaRzZwSURXNlhpTHlHaEtITVJwT3dJQlFEc1JPaVhmYVh3?=
 =?utf-8?B?eXM5cG1pY1J1cjErcWQ0UlR0Q2Fpb1VMaWhzZ1BYRzFSSmVXNzU3WmNhSjdS?=
 =?utf-8?B?cUVJa2ZUMFNIQWozS3hLbE4weGlWclk0d3d1d2lPYVk4QU1hT094cmlwdkRz?=
 =?utf-8?B?UDUwd0xBWkpHaVBoZFlVNnE2U0FpMUY3dVJzQ0hENWxveW5rVDNEVzFFbGlJ?=
 =?utf-8?B?bHVtaVIzUkU4OHNJdmJiZWZScXU2UTFkRE00UVNBLzZHYXF0K044TmFLSDJG?=
 =?utf-8?B?RzU1UmZqb2MvdnZmdk15ZVJ5QUhycXNSTHNZTUpETXlxbXJteXJmeWx0cDJL?=
 =?utf-8?B?S2hYdGVsZkhNdEFwOTdZN2FpNmNlczUrWUdjRVMzT0Zhdy8yUDIzWFk4ZDBn?=
 =?utf-8?B?aytFYnlkRnNoVlF1dkQ5OEJ4V3J3VGVScEUrVjhTNDdSYmJGaDhMNEJEbHlH?=
 =?utf-8?B?R1BmZGk5NXhKT2R1S2YrYlAvdm90dWJPUmU0OW5COFBCVS9kam5aQjBzV3Vy?=
 =?utf-8?B?eXdzSy9PZW1KVlpMckkzV29CVFphRFJJS3VQRENPN255S09YVjJ0WllmUE9R?=
 =?utf-8?B?UURzOUpoWGhRZnVoTUtwR2FLTFdmdVNiUEM1aDY3MWRkdFhkaTA4VENWN1VE?=
 =?utf-8?B?NWhNK0U3MkFNVUNuaWZkNmNFRmdFV0FZbXhRaVRORzlpQTZRZXYwQzhsNDJL?=
 =?utf-8?B?Vm1VaXVQRjBQKzI0RFIwUjBNbEkyeC92L3dsTE1WamhaeDNGZFE5NEVFTDZu?=
 =?utf-8?B?Z2t1NEJYQXF2cVRxRFNBbU1MUjR3UG9wbFI1YmpNMUJYSkNJN05peHE5Ukgv?=
 =?utf-8?B?d2lBZ2xuditaRjhWdndrY0duTHNIN0pQMXBWVFhOdzFiK3gwbzFkMFRCN2Rr?=
 =?utf-8?B?MVR1NWhuRnM4RW5HNW5Ra294SVR3MElVR1M2N3JtcCtFNG5ZVk11MGJ6aVhS?=
 =?utf-8?B?bnE0VVJRZ3Y4VjNHQzBrR1c0YjdyOTNFWWRkblp4L1NmRzRuV1Q0NzNTSFRa?=
 =?utf-8?B?ckFRTWFCQ2o1R3p1NVEzNkZ2RGtwZEgvMmN5MDE0T2haTGRFTHI5MTFyR1dS?=
 =?utf-8?B?ejJWSlg1VDFxbngwZEtjMkxnY3VMdktPYXF1aCtPMzZxcG56ZHdLWDN5ZnI3?=
 =?utf-8?B?MStGeTJEQXZIZDRkSS9BTEVYZW5mZmhuRS9vaGk3dDQ5R2hpYkowZjBrL0tI?=
 =?utf-8?B?bU0vaytFNUxGZHgvUVpKRktDYXErWXEvM3pQVTlsMU9taU1PVUVPV1BzMDYw?=
 =?utf-8?B?c3dOdGh0Q3BpZUcxTTJ5bERrRldWMXUwaEpGOTBoTStVOUhlMS9HR3dKbXNy?=
 =?utf-8?B?dElSa2ZvVDlkbW1mek9lK3BTeHRVb1pjTXl2bkhIbC9BS29xYnZFd0Z1ZWNE?=
 =?utf-8?B?cXlmSzU2aTNuc3RVY2pkTWpFNld2MFMwbDhabGFIazhYZzJhaVV6Zz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d63ce5a-1937-4599-25c3-08de59e83e4c
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 18:58:34.7961
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OJ59JlmqU0RLnYRuTjfoQ67JjQ+XE+b3dkgkOiODjyLPYx4M1kzWjVAg7EMOSt6FxP6M/U8LSHwR1b0VWwP3xQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8048



On 22/01/2026 18:12, Danilo Krummrich wrote:

...

>>> Any other thoughts?
> 
> With this diff, if I intentionally create a deadlock condition on my machine, I
> do see a lockdep splat as expected.
> 
> Anyways, another option would be to attach a hardware debugger (I assume you
> have TRACE32 or something available?) and then get a backtrace from the CPU
> affected of the deadlock.

Unfortunately, these days I don't have such tools available so that's 
not an option.

>> Can you please try applying the following commit?
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git/commit/?h=driver-core-linus&id=ed1ac3c977dd6b119405fa36dd41f7151bd5b4de
>>
>> Robin Murphy confirmed that the qcom specific issue might actually
>> impact other hardware platforms (provided ARM_SMMU_QCOM/ARCH_QCOM is
>> enabled), as the implementation init code is still executed:
>>
>> https://lore.kernel.org/driver-core/d2ddbb72-30a8-44da-b761-876b2d37567e@arm.com/
>>
>> So, this patch might fix the issue on Tegra as well.
> 
> I thought of that as well, but looking at the code in arm_smmu_impl_init(), it
> seems that can't happen?
> 
> 	if (of_device_is_compatible(np, "nvidia,tegra234-smmu") ||
> 	    of_device_is_compatible(np, "nvidia,tegra194-smmu") ||
> 	    of_device_is_compatible(np, "nvidia,tegra186-smmu"))
> 		return nvidia_smmu_impl_init(smmu);
> 	
> 	if (IS_ENABLED(CONFIG_ARM_SMMU_QCOM))
> 		smmu = qcom_smmu_impl_init(smmu);
> 
> But maybe there is some odd case where the first if condition does not evaluate
> to true on tegra194, so maybe worth a try.

I gave this a shot but that did not help either.

Thanks
Jon

-- 
nvpublic

