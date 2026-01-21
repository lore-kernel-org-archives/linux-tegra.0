Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011013.outbound.protection.outlook.com [52.101.62.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9561E33ADBA;
	Wed, 21 Jan 2026 14:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769005820; cv=fail; b=p17CVIbLKU8FW+pt6WLOU5ryiDuF9BymAC8wvZpB73TosHT9ocYGHkUZsrNW7CnaJER1sdPiAoKHccXYBNkc/yxPqXAsqUQK6MpMmMcutSnHG806F9ushudy0R7ocLuGSIrJ1hlIoCbZDQVu9uQ4AIVir+oruPobSOGpcjqPrHU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769005820; c=relaxed/simple;
	bh=kMZSF1RLL/exWUSc4TQdMDZmZTWrT+bnK1JW/7fvqbc=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WzhyOyFuQ68qh4/Ek+n5ahAw/ORnek2yVD+VFDqroRlvoSDNgiIJA9qQCPg8MqJgj6FOT/EFOJo3o8FkI73eUbPoVLC618+v0gTYAbgf3OWMPCorSnl0NKheY6zL1J/xzJ/V5lT2Pko5xwWXkqGTbgM8gFEn9dQwnokqoxQL4Y4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=EJN4QS0E; arc=fail smtp.client-ip=52.101.62.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="EJN4QS0E"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ipAW6SnP0RKIp/jQlaEu4ZC/ssbTXWAaOCMQ+yLMIVA2aqYPgRWTlRhQQP6sXf3/AdgjAEPwOZouZxV/kKy3TnMahw0c/hWkSq1kCkOzYjwCfD80C1IPe8DqT2lum2PYwCb/yFtU1FGQDaye1s+hQZMUddBi2JGGiG08Tgh1ZoVOqSmGlYTXPerEhE9TrSk94M7QHDkO6KOEikryITR/TzhBlsiEb69eFHnGpbOLao0RPfDthP63UaXy+a0dBZqKhWmYUUmpw+F+kqLfu8ED2iWb9uZeNjpySVmcMNUUnN7eUcjkdqX48tNDZ0HjpnHG0nRnR+jdzkNe71AL5J2S7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U2NdVGuGeEZyNPk4aAQWeCRspd5ThDsXDHxNDbrt32c=;
 b=YZGqRUwkdlJNmp8fH5F8oisJBgl9uxNyAu45Gl27eXih3vHh4OpT8kti49gF3T96OdJxIpi3f/9GY+zI6CZhUE75tLkkIbsNR9632ZXh7I7X0fdsb1EJQq6qe3S8PV5zE8E5jYrtaZiI7xGSelgUNOR4n/wuv6HYQN3H3OlQhMNIrwFOcZ1WTFoGOZ9cW7zseYmZaybDemVAwjkWDwHA7QTRZKUAc1argNJnhbrMLVafcBeSWqun6m3Db1Uk+gWj6BpLTVszLvW3zraKFQZ4XcZ5rhmD8OY5kkDQvRKkhsJ75oagOCkhwjc+UECffS5hvlr9bGu9Y0JyMDI9So5pMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U2NdVGuGeEZyNPk4aAQWeCRspd5ThDsXDHxNDbrt32c=;
 b=EJN4QS0EsSHnFT1p64gvG5e/V8wxgmDYGzN3v6uYDKKE+w/fraEG69FJQ3xT3iMoIB9/Cz6wMxt+oQokE+hCy86x9YkZuw8vACkH7iKftiTQDJZwNpF0mARXY017LkT2tIzWo9IWoBdNVMPUlrjNaVSkyafCDPiya1BMo3c+nQQNVUYp+h0Eis3V1CvoiW5J7wYwgAAuJ9/MTnw4HvPFwl8bBu60R6+J+qZT22yGCimddy27fZ0/Gn5vwziCpq5C9rOYDVVAOC8NvteYAwGnyuvpoacN93eFsQwRIydPhGt11vGpwBSt+k5VMd/LoMbJlaS4tRSwFkSUTlt7mtI1Ug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by DM4PR12MB5724.namprd12.prod.outlook.com (2603:10b6:8:5f::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.10; Wed, 21 Jan 2026 14:30:14 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%5]) with mapi id 15.20.9520.011; Wed, 21 Jan 2026
 14:30:13 +0000
Message-ID: <b91fa3a8-3fcd-4c74-826a-9679421f5fb6@nvidia.com>
Date: Wed, 21 Jan 2026 14:30:08 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/4] i2c: tegra: Add logic to support different
 register offsets
To: Kartik Rajput <kkartik@nvidia.com>, ldewangan@nvidia.com,
 digetx@gmail.com, andi.shyti@kernel.org, thierry.reding@gmail.com,
 akhilrajeev@nvidia.com, smangipudi@nvidia.com, linux-i2c@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260120092032.83100-1-kkartik@nvidia.com>
 <20260120092032.83100-4-kkartik@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20260120092032.83100-4-kkartik@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0275.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::23) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|DM4PR12MB5724:EE_
X-MS-Office365-Filtering-Correlation-Id: 41ddd6c5-2f66-4705-68ae-08de58f996eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|10070799003|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OGZvSkd3eE9kb1U0T09HOEN4Y0MweUFmaTJxcThzU0w1SkR3MW5hMTFIZ2lE?=
 =?utf-8?B?K1NCQUdPdmk4TEdyRWVOdzloVitPOEVQQ3pXUHJickhPY3NETlQ2NCtmSkV0?=
 =?utf-8?B?WTBkU2pFL1owdnU5UkVlUXVpYVBHSXJZZVJHWUR3VEg4NVVwbHluRTJpaGRa?=
 =?utf-8?B?RnZROHFNeXAwQkg5VHBmbFVPRittbEFTbzlTK2ZHQmpRT0NDVW95NmV6OFNM?=
 =?utf-8?B?M09BZjRlcXcwdDdHQUdwUmNhbTIvcTM5YmE0OEErVnJrRHhUeFlhSTNhRTZ3?=
 =?utf-8?B?R3VwUUlsSzdkRzJ0c2FjL3lJK01SYlA4d3YyVitBVDAxeDU3MEhRQ2F6YVQz?=
 =?utf-8?B?QUxoZ1hhZUJQSGc0Z1VESGtNdmV0ZXkzQ0NIczRGZld5bWVNTlNDaVg1S3Fp?=
 =?utf-8?B?QjFFZlVhRy9XZTZKTnpOUERjVk51aG5RWEpnS0k2SWtmVG5xbHpTNWhjTGxQ?=
 =?utf-8?B?NDhoQXBEa296R2orcE9LZUJnbk5nOW5DeTNKSkdoNEovM2JvL0txMUNTUVNH?=
 =?utf-8?B?d2FZNTdaVTBDbWVRdTNQTVVMcUN0UElkYThYam9IWFA0S1VyL2VjZWdPdm5z?=
 =?utf-8?B?NldoMFJoNGlZSlVLR25ueFpWNFkyVUVISmg2LytuZzB5ZnhrTWg0dGVxSDE5?=
 =?utf-8?B?c2NjelpnRXNlTzlDZ0RqT3pMVGhoNjN5eFY3ZkVSVzQwTWZzUXBHaVBvNit3?=
 =?utf-8?B?TlF2a3BCcjN0ZVgvbUxDUkhxQnpoNks5NnpDN3RnbC9zVVhBY0VocWovTXdm?=
 =?utf-8?B?Q3ZZSDFpc3poR3JjRUF2cE8zRUZSYnpuaTJraHk5RXdtaCtMSTdwZTRJZ2tu?=
 =?utf-8?B?WUpsSkI3VE9rUmdidFhHeE93NHg1L25IZWNramVXNXFjeFQrdVlmVlJUeUNa?=
 =?utf-8?B?V1pZdi8rek5hQWFJdWZKdmZ4ZHRQSWJ5ak9ybklMbmIrT1ZBUm4vdTMwMVM3?=
 =?utf-8?B?OHZFL0JEaDMrOW1lSWNnWkRndS9KUGU4YVppWVVCUWpwS1o4bkZmYlVsUHN5?=
 =?utf-8?B?T0R6cnBPTFYzaHdqdU4wVCs2TVJobjFGUmV3Z0RkZUJLN0RzS2pZNlFZVTNs?=
 =?utf-8?B?SDhOVEYvcy83UzVvdVhRT2g1dWpBdktyZDlMenEvZEdoaUZIUVllZm1WTllL?=
 =?utf-8?B?eXNESnVBVDlFMWJ2UWFLMXZFZlNzZ1o1d1o2NHRVajA2WklJV1k3cTdXbWRI?=
 =?utf-8?B?aDhMbnR5ZEpsUDJDSnpjc2haUWo1RUlsQlpvTGRzS1Z1ZnUyWkVhK3NzWlpo?=
 =?utf-8?B?cGtqWHUrOTF0ZXJEeENpRVpTN0N0ZEhaM2NIUk5nNVM0TXAza25peDV0QXI4?=
 =?utf-8?B?YVlyVFdHZk5kOFhTVUVOWnphQVlqdFpsNzUzbldKZzlESVFHWnAzYnZlaXl3?=
 =?utf-8?B?bG9jM1h1UitIa0JKVkNNYkVIWFcwMlB3bm9pNWhlbFczSkRMcmt3SEFvbytz?=
 =?utf-8?B?NzZLK0p6MktKa3NCR29xR2lVVDdrbDdMK2hOdWVDSDMvZDVLV2Q1QUdiNnpw?=
 =?utf-8?B?THFpTVprcHk1SzdNOE9RVEZjbm4yeVM0OTBITUpDZnpZSlhyVUxGQ0NTbEt4?=
 =?utf-8?B?c29WUmo2bkpFeHdHaEZJMnZSbUR2b2pjY0tkVFBJRkdhWE5jVTFRcEtrWDUy?=
 =?utf-8?B?MU1ncVRRYy9SaXdKTm9SSDZvUEE2VHVrQ1BxZ2V3L29rRkJwamNBYkpGY2Y2?=
 =?utf-8?B?TXpKdDN5MTBEY3F4eDUwcytLYS9VSzlCTGFlS1FxQ3d0WEpVVlUxNWI5c3ZS?=
 =?utf-8?B?M3FwWThhblAxaFpnZjFaeUE1bEttbGN5Q1dHdmRGNk02UDFaOTdRTU9CQmNL?=
 =?utf-8?B?bFQ5NTI0bEZkbTIvTThDci9nMU8xS1FkTmVWZVYvaXlScjRkNGRvbmJlV3lm?=
 =?utf-8?B?NFp6Y0gvL2NhbERQT3dxTVVOb0RqdUxDUjMyV0FHWjNiRDkrVGk5Q0dYc0Vu?=
 =?utf-8?B?L2txUXJwVEt6c3c5czNjOVBOSVhQUGZ0dTRvWDcwcUozKzlDVWJveUtJb0pJ?=
 =?utf-8?B?UjZhSFRoVlZUb2tnY3pINk1yaU9DQkJaQnRHbWtyZGJvRmgwQkNtdWRkQ1Jr?=
 =?utf-8?B?WXk0Mzl4aHY1T0M1SWdyQmtOSjZpVmJId3VCSm04YzdnWVhkeWxaZTFmdzRW?=
 =?utf-8?B?RXVMakdmelkyeEd0WEFTSytJZ2VyVENsUGs0dmtJeHRrbG1GOW1yNHU4cUtN?=
 =?utf-8?B?YkE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(1800799024)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SHk1NTNMWmxjMk1PS3lOSXU5WnVYUjlrdi9rNXE2VXZBZ1ZSU0lnL2tWN1ZQ?=
 =?utf-8?B?b0g2M0Y4OVRkQk5wT1RLVExyK1ZIY3JhQ0MyazJZZG5YN3JLelovKzJneVNI?=
 =?utf-8?B?TEFPWGM5U3J6NVAyaHI2VnRGVmNIdWd4MFI0cEFJdS9xRTdzZXEwczV3NFhO?=
 =?utf-8?B?UVBzT2EzcThhRi9EczN5VmxHUFdSTXlNZ2Y4L1BINzU0eDAvZmplYlBEa2dh?=
 =?utf-8?B?WmdSZ1NoY0N6VEo1UVlsa3Q5RmViWlVyS1FtQVNIYTBLMTlSZWE2eHlGUUUr?=
 =?utf-8?B?RmhTT2t5RHNwV0lMbFZad09OUnlsZk9OQTFvYzEvWVYwdmtmWk0wWGdJeHlB?=
 =?utf-8?B?SkZPNHh5dXVCeGlDdFdmWlJCVlVXamFyby9qQmgwcjdyNjR3WVRvTlpyRk5n?=
 =?utf-8?B?TWxjL3N1bzBSMUpuV1liNWtUN3BlUXNPcXBJdnpCNG91eDB4dkcyNkEzZWJn?=
 =?utf-8?B?ckJXZWtFdmlWYmVWb3kyblY1QURSYXJWZzFnNWtJdTd0V3V5OGs2YXFRaEFu?=
 =?utf-8?B?b281Y3M0NmZ0d2p4bm9KWG82R1JBdVJSMks1MGlyTk82dWJkdDNqZlB3UjRz?=
 =?utf-8?B?MUlOamRaLy81d1hqbllpVXBIenZ3L0hEV0N5cFdJNkVkczVINmxBVUE4MzZo?=
 =?utf-8?B?ZWc4cmhRRkRWUnQrZ3lKMHlWZ2wvTG1pZjJKaEQ3dStHTE83VjRhUmwvbFI2?=
 =?utf-8?B?TFlmb2VRc2FDV1ZlYzhjbUZhWnZhL21KZGZCdjJJWnlXZGtvd1p4QTlXQ2FK?=
 =?utf-8?B?MlBGNTJrRDFiWWVVbStnc3FyRzBnbTFCaTVWZmIzeVpqVFBTbWxHM09oWjBN?=
 =?utf-8?B?ZDFQQTFLRGFuTlhxSnB5UnIvSnE1VEo1cFZZOVp5SjZYeCtKU21yVVRRQlZT?=
 =?utf-8?B?Qysxd2FpNDRESFk2SjhrdVp3am9Jc0w5VXpiZjV0K1JlVmtTRFJ2MXBNT0lm?=
 =?utf-8?B?N0kwVm5ROWR1SXhoeFpaOWpnZSt5amNpWFdOWms3WWZ6aWVTdTdNYVhXUnc3?=
 =?utf-8?B?d0xKUGs2SCtMWWQxTnN3d002RFYrcnMzRktVVUIwS3RveDF4eDdaa29sZ1JZ?=
 =?utf-8?B?RmQ2bTZwZFJUZWtGY01NcVFNTXB3Z1BSSzBkUSs1K1dVVTdMd3N1MkdPT3I0?=
 =?utf-8?B?aXljWnhNL0Fvb2NWN3VsK3p0c2paWjVHaHdPU3A4WGpvZUxhMFhoUkJzWFZm?=
 =?utf-8?B?SjVvbVhUUllFczVGRzNuN1F5NXh0RzNoUDdzdHByNkNYd3VIenVGN01jaHRu?=
 =?utf-8?B?Qm1sVlRrYThWM2taSitlbHVFTlpVR29ueWlNM0x6ZytTVHR6b2QzZW1DSCtQ?=
 =?utf-8?B?RUV5RzN6YkJEZ2RjK252SXJTZjkyK0NDc2dnbTZValBhL3U0cTNkMVRGVFc5?=
 =?utf-8?B?S3ErUjU1ZXk5N2lmbXdiYUtMajBMTmZWc2l2VkI1YXdkQjZDMlYyVElWVjVR?=
 =?utf-8?B?VlJ6UG1vRVJkajhyV1ZUUHdDaGtUSUhDeVEyYnBKZFhQTWVMM0R3VzZ2clRS?=
 =?utf-8?B?TGR4WWVpc1d0d2IvcXpralhzcmJhWENzV000a1cwSnpwVkxReXVCa1o0V21o?=
 =?utf-8?B?TmJ3MnFtaW9FUDNnYTQ4VjRwdjJLWGFaOFRIaHRkTmhZQ3h3WXRYcXQ1S3lE?=
 =?utf-8?B?WUpFSVNZNUIvdXd5aVdnanFDNjFWSkp1WnVUdTRhdG02cmxkanNrMDkvRkJT?=
 =?utf-8?B?aTZuZWcxUUhMVVJkdGNFblYyYXpidXloc2k4UDJnM3JjWW9oUGxpYmh4Rk9y?=
 =?utf-8?B?SzZnZXV1SmFzd3JJNnZnQzVHMEE2SnFuTGZ5LzU2VmtrdmFiWitVeTJlaVJq?=
 =?utf-8?B?VmR5a3ZiWWpxZkJsVFoxZ1djRHMrMXNpcTQzcHU0RXdkRFFNeEZ5VEdUSUU0?=
 =?utf-8?B?QlpkQlF4Y2lNVlFpMFFJN01QMjF2ZHgvS0grOUlGdDVJQnVWZFpaSlZHTzk3?=
 =?utf-8?B?UGk0SHJJOFBzMGlxTklMZWVIN1E2azJiNGFLd0hPd0U0R3pBMnRGUy9nQ3o4?=
 =?utf-8?B?bG5pM2xIa3RvdFh0OElCVlk4MkZDdVE2T0hpNzNDT2twZnFadktPZTZvV0RI?=
 =?utf-8?B?Q1FCNFE1Ymg5OUFORUhjdURHQm0xMFY4UTYvd2xrb1ZraGVObkREWnpUeU5D?=
 =?utf-8?B?ZDRzOVdBOThsNk91ZTI2RWNFb2dta1ZEdTYwaWFWdjZrNUlNQUQ2RWpFeHkz?=
 =?utf-8?B?Uk1JUTFDZ3RMWGRxbVNkdHJveFlQcC9pdmxndHUyNjBPZ0FXNjhWQ0NHaE5W?=
 =?utf-8?B?My92QkRDc1plTnVwZWRzSkhIR1hQV1lsTkpwSjFhWEcxNDFPdWhJaFlSTG1l?=
 =?utf-8?B?TUFEU1hyUWpMQVBEbHdlaG5rM3RiSlYvMDE5emdubXh1NjZ6eVNnYk9mZmFx?=
 =?utf-8?Q?bv+jJR9zDsRqME+Pf4QJ0+kGB43JsbFUH4a2epscvIChe?=
X-MS-Exchange-AntiSpam-MessageData-1: WCTfaXVFLDGcyw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41ddd6c5-2f66-4705-68ae-08de58f996eb
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 14:30:13.8334
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AfGfcJKrRuasOPJIMrfO1zFZWm91/pO59KLL5g8YgTaEqMmfSja91QYDq8NU/BtgoG8pKozXoFB8KEGSBM51Gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5724



On 20/01/2026 09:20, Kartik Rajput wrote:
> Tegra410 use different offsets for existing I2C registers, update
> the logic to use appropriate offsets per SoC.
> 
> As the registers offsets are now also defined for dvc and vi, following

So this is still not accurate because the DVC offsets definition have 
not changed.

> -static void dvc_writel(struct tegra_i2c_dev *i2c_dev, u32 val,
> -		       unsigned int reg)
> -{
> -	writel_relaxed(val, i2c_dev->base + reg);
> -}
> -
> -static u32 dvc_readl(struct tegra_i2c_dev *i2c_dev, unsigned int reg)
> -{
> -	return readl_relaxed(i2c_dev->base + reg);
> -}

...

> @@ -619,14 +712,14 @@ static void tegra_dvc_init(struct tegra_i2c_dev *i2c_dev)
>   {
>   	u32 val;
>   
> -	val = dvc_readl(i2c_dev, DVC_CTRL_REG3);
> +	val = i2c_readl(i2c_dev, DVC_CTRL_REG3);
>   	val |= DVC_CTRL_REG3_SW_PROG;
>   	val |= DVC_CTRL_REG3_I2C_DONE_INTR_EN;
> -	dvc_writel(i2c_dev, val, DVC_CTRL_REG3);
> +	writel_relaxed(val, i2c_dev->base + DVC_CTRL_REG3);
>   
> -	val = dvc_readl(i2c_dev, DVC_CTRL_REG1);
> +	val = i2c_readl(i2c_dev, DVC_CTRL_REG1);
>   	val |= DVC_CTRL_REG1_INTR_EN;
> -	dvc_writel(i2c_dev, val, DVC_CTRL_REG1);
> +	writel_relaxed(val, i2c_dev->base + DVC_CTRL_REG1);
>   }

Looking at the above, I think I would be tempted to leave this as-is and 
not make any changes here to reduce the diff.

Jon

-- 
nvpublic

