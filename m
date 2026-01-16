Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011049.outbound.protection.outlook.com [40.93.194.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD86523BD06;
	Fri, 16 Jan 2026 13:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768569331; cv=fail; b=k8ZavjBSc4cGDWJ57kf76OWpDJzccgTme80fv7+7xUvKtBXCioa1Z7HuFqrAvVx6WaEoYDu1J0l7zzpLSXIv1hphelM1OSvvffu0MFLEuJY0RdeFNPbycTCfs6ZY72+T4hun0FSmrR1qlRdW2Sp/8VHdMas2CEsDe67VnL3jVvQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768569331; c=relaxed/simple;
	bh=hB7Z1ewBfUTtfk0SZkAtDxAv2CS+tGzk4V05XSlID88=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ozSUbuup+g4ay+0yddU479PWzuBpDivWXHjmi+a4Ur32VuxhPVVCd3Q8DZtBIJ1qYAxenCWI7xp/QtHySKM6XSmVu9pOorE3ObGgDNRPSAli/WVnqVlMcOKnS7MTXUz4k21mEdDERfLWrRWPtk2CMfjJbab9yuzspe5Zqxc86UY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Ts/4SSiO; arc=fail smtp.client-ip=40.93.194.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ts/4SSiO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k9rlPBLdZYY/y8b/vX5X+Ga7EPPTqXIEkfIglkPPzITfrPJQC7bylRUnSVOX8cGz/SbN3Os9uWMnD0iPZPE/1Uwcwx0Fovny/7qH7O/6QCmX/TcR8ti/qZXXD7Ab/GAqxcFAgFIMFnQ15+KYLNLK1xXMBM4urAKz6Z9yMeG75C+M3VgRHsQcr0EpvG75mBsBCgLQ3AefTZzWLaXrULCoqaJK3qwgZj2ZEVs+Uz1X1m9aoChp/qneTaCk6gErlDyAxjwfc+qzSNQTSjahnsYSrnicv9j/rF2Fb7EePEVRcLYbY5YaoS3Ct4HzC7PZM5U3cRREakzgx6i9rKNmXYP8dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BaVjAYmwFOxeGTI8TzUKlNzw0wuhpntjzJ6OjRm3U2s=;
 b=jpmlx6+YJ9CTmD8eOKU3ZuFwOrbUAL5a818lG/35pdwJFewzpZJs5mkruf/mykHZe4ZNGpGvOPRHvCDi/hUtYuD4eBxjCOO1LPaJvDtV+r+wLsP/2pTEIoxNNAR3epRSgMD4EDI1b2wAPaqesfS1DT+uqB02bl6iu04wDXLheoEzDDyEKunmAbC53HTHVMKiA5nrXCGd/buNVgCgL6ANMNhF33ULFQr0pUuQ4pwMEPa4fw0jGl4VTqz9NPqotjZWrB6SWAxeMj+7cQ8itpWOAs2HE5bxtaeZuTLwiobKVwwlrt4UVGN+TueSf7W/4n5JQyucYWd8Y71x2GYnGff2iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BaVjAYmwFOxeGTI8TzUKlNzw0wuhpntjzJ6OjRm3U2s=;
 b=Ts/4SSiOBLogoxD2pIcPYpRcAelN8jCqI/+1F2nLufi8ykzID0z16/Z+s4ky26NiYD1CDtE/DbLBycJc/wcyA7kbMqrg9NgC9+5bsRg75SFtjgj2/ZlBymcEfjrSUclE5iFtmrtJWM1/L5a5IKD1Tk7vZxrLLC/MEH/SiGUt+w8H9ZA1Tx3k0mVtx9LXwmbBw+TqugpkuhlsMi7DqfbkISlQPAB6cFdoEkQWdKowEA/jXlo5HNnhmWBVuC2fJdsrevQ73k6gYpAgR6nabnRul36EYNUWrr0jpMwX0HG+DeprO2M5Sk5F1vKwzmQUXwDWLLQUDt99Hm5Jq8e7dmuBKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by DM4PR12MB6589.namprd12.prod.outlook.com (2603:10b6:8:b4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Fri, 16 Jan
 2026 13:15:15 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%5]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 13:15:15 +0000
Message-ID: <7510a358-608a-475f-9f71-50fa72a72d27@nvidia.com>
Date: Fri, 16 Jan 2026 13:15:11 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] memory: tegra: Add support for DBB clock on Tegra264
To: Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260116123732.140813-1-thierry.reding@gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20260116123732.140813-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0248.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::19) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|DM4PR12MB6589:EE_
X-MS-Office365-Filtering-Correlation-Id: 303bc679-516c-4014-f210-08de550149b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|10070799003|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OWlGaG1OWVREOVo5WmVvcCt2UHoxaGl1OEN0dkNadnczRHhCTERxdGJzNDVm?=
 =?utf-8?B?RDhnWGZVcDdXd2dmRXo5Mm0xcWJVamV3QXU1eForZWhQTk8xU01GcHVjbUZU?=
 =?utf-8?B?WE5xS2V4NERpdlc1ZUcyRFVySVg0TjJFUG9UN2lNb3BFY1VoNVBUcGJMZE1D?=
 =?utf-8?B?OWRHYTFDYk95Skp6MTRTODZ5S2VrRVFuSzQwZGczSWhncllyUmpEWW5ocGJu?=
 =?utf-8?B?QjIyM3oxN0tzZ3VnQmNlYnNNa3ZQY29YUitpYVRHVkhtV2hEZFh6YzlBcTRJ?=
 =?utf-8?B?blY4bXJ3cVlsNG14M29uSkNiNEFzc3M5ZjZ4elR5SmFOTm5FNGw2WVRsU09J?=
 =?utf-8?B?eXhMSjQ3ZGIwaEV4b2R5bkpzUkVOOHpET2h4dEV1LzRtdHhYSTBvRlhhM0lG?=
 =?utf-8?B?eEdHeFg2N0NpcWhjd1Y5ZkxpaXR6cTJCM1lSbGtiTksyL29tOVZLQ1hIUUVX?=
 =?utf-8?B?MXBOSWEzTGVCdERhRHJiQzdkNlR6WVJBKzZRVTJmQjk0cTlJaGVzNDFsOHlH?=
 =?utf-8?B?RWFDVVpkUHU5WUdab2NWQzRSVTNtY052a0Y5dm1zbmg3ZVh3R0QrNHVvUmdi?=
 =?utf-8?B?OG9YeGZOY1hUL3RkNElFRElpSHBpVU5zWkNOVVd6U1JtUk44a3d4UHZ2bytw?=
 =?utf-8?B?VW4yT1EvT1QvYUlxQ3pjUktoU3ptRWxIV3RpeFh3dk9QcHJNNk8rdFBsamJu?=
 =?utf-8?B?WVNrcTJuTFZBYVV0em10N0JteWFoeVpZRW9PS2JVbEhhWWRTd2UxWFpEQTlL?=
 =?utf-8?B?eWtoeXdaMlVBUVBEWmZLK0o2U0pOQlVKb041RXpzVCtMZkhzbFg5Z3B5Ujln?=
 =?utf-8?B?V0RwbUtubm1MbkJlTGhDdSs3dVFqcGhzT09udGI3QVo2SnJxa1BhVlozK3F1?=
 =?utf-8?B?UGRsZ0s3b24vZWNnU21UakhkYWxwZUVNcGRvSzNqbUhuRGd5b1JqdGZxQUtO?=
 =?utf-8?B?QjJPS2ZQaWtoQ2NtNFFKRWFhRTJ6VUZoSE5ITS8raVQ4dkM4eEIvb1JxdXg4?=
 =?utf-8?B?YTNJRlptUXJ1dGlqS04yUkZBYlZuUFpZa0R6VjBEcnNNSWdFQXcvdmJwUEtq?=
 =?utf-8?B?MnpIUlAyU1ZacWRBMjhmT2tBYVhmVDdwVk5LbEpleGxZakY0S3hDejJacXBQ?=
 =?utf-8?B?bDJGRUZUVFF2bjl6R1UrNmVQMmVOL2EwMHNlTTlveHVjN2ZYTEtDaDhuWGd1?=
 =?utf-8?B?Y3cvdC9QTGV0dklQTzRna0ZLU21WVjRvS1RCSG9hcWU4TTFkUzN2dW1xeE5B?=
 =?utf-8?B?a0M3MFRWWEd6Y2N2QmF3dVh2S2xGaWR5V2tYQVI5VmQ1VGMxc1RCdzNtVS9G?=
 =?utf-8?B?Y1lRcU5yQmFmVUwwZE1PdTgwZENuNkV4US9LM1FRbWo4djhnb1dCMUNQL1Jp?=
 =?utf-8?B?aTJRbG5OaS9BTUN4ZjM0b2dBellkWGZrMWlGVVM0MmZjY3ZhYVlWNWxxdVg0?=
 =?utf-8?B?ZGw2dktRa2ttOTlURjNiNVlqUjBGUHlsRll0YWZvT3VvOUZNNGExdDVtRWtW?=
 =?utf-8?B?MjBaNVVqa3F5ejNjdCtINEFyaDMwRkQ3bnA4cm1jdUxkUFlGL0Q4MDhldUNr?=
 =?utf-8?B?V3UrTkttNm1IYmRzMytNbHpWWWxmSVMva3pFbkIwZE1rbGFEclVSeCtEN2Rs?=
 =?utf-8?B?TWtTTnFaRXovTWdiZ1dNS1JtNkVyTm9OYXBlUjM2dkZXb0VQd2JOWDdSZFNO?=
 =?utf-8?B?NVRpbExicVRxSGJ6MkJybElPeldpWm9UODJOZXdyYUtTblNySDB6U0Zqemxo?=
 =?utf-8?B?ZEZhOVJwQ1VFd3dyR1I2bExKNW12ZG0rVUNsam9NRFF0N0loTjZVS2orZC8z?=
 =?utf-8?B?YzVGeVFIRHpaa2w5YWNqYzgvY3ZQNFNtZ1JpN3B5TUJ4YnI2RFBiUjRFOUFv?=
 =?utf-8?B?NStxMGFhQy9qZTBEQ3BSS3lOaktLTlpJQmtab0o3Y2c0Q2RBNWIzY2ZOOGs5?=
 =?utf-8?B?M1ovZnhDcWJCVk9lMzJUd1NKeFhjY3Q1d0Q4Ti9HeFdENjdUTThlRFdwYWlD?=
 =?utf-8?B?L3lvSFVwSms1KzJ5RG9pcklwQTNubkliUE4wTXhXcFFCcHB3UGpGZzF0TDJG?=
 =?utf-8?B?RmY2dGpWcCtGRXRvdVZmdDhXcWI1RVhXd1c4VDlVeVNBWmlldUl2dTRlK2VZ?=
 =?utf-8?Q?5ir0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QnFqSlJURjJ1N0Z5eXlDbUNiSEFlSTd3NjNIU2Y5WVpxUWpmR0VTbW9KWHFt?=
 =?utf-8?B?UVdaN1RqVFJpRGVlcm85ZE9jbXhmRWdTMjFZNlBCd3RyZjdHa1ZtTVY5VEhQ?=
 =?utf-8?B?MHJlZnZHQ0RyYWpRVlR6Q2xWa2UrS2RpTTg4cHZKUFQwVTVtZkkrNUYrQWE5?=
 =?utf-8?B?eko3cUI1WTZoazA1b05RcTgwcndpK3ZYVnR0MWJ6aHJxckpTRjFjYlAva2Zo?=
 =?utf-8?B?akM4clRsNVRQREFmQ2FqUDNkenVicFZ2em92UXBId0JuY3RVaS9mQmx4UC9N?=
 =?utf-8?B?dEV0MjFxY1NGZ2tVVUlmNVFPcnh6d3lQMkZweVRweUh4UTNVeFpDVlNOV0tG?=
 =?utf-8?B?bllzRWV6MjR3cnNuak9BUEJJNDRBUEFYYnd6d3ZRU2Ftb0hqYjg4UThIZUtw?=
 =?utf-8?B?QldUaysyQllIdk5XYmlRajB2MlRxVStOb0duNWIrckxlVUdCNmxkQ3YyYUc5?=
 =?utf-8?B?MTl2ZWR6SlhUU282Wnp1STh0djBnM1B0Tml1MjY5anZxUVNRQStHL3BSL2ZZ?=
 =?utf-8?B?WlgyRnM4dzhEWnU3Nm5mT0E4bTN0K3lKbzlzNzg4QUR2SE1kNkkrSlNCWTky?=
 =?utf-8?B?bm9KcGFaYXJBa1JReG0rR01uYk5tckd1VUtNRWZYL3RqTk1RVnBvSTNMeDla?=
 =?utf-8?B?K3NiVnljWkdMSWtHWFVmNnpxa21DWDU2ZjhtZ2Z1QmlFaS9yWFRMa0dyVHpD?=
 =?utf-8?B?V3ZTVE81NzVYNkM3Ym9abEVkWjlQYnJReldrZWo2dy9ncjIyTVhtT3pTa2ZS?=
 =?utf-8?B?KzYySU9FU291dnBpMStBV3Q3QWZEMVp5bDhCZnVmcFZQdjY3ZU9nODE1TDBC?=
 =?utf-8?B?Umhaa0VMSXdzd0tEOUVvQ0pPN0R1eTBGM1pxNnpNMUl4ZUdUbVBNd2NUMFM5?=
 =?utf-8?B?Y21YTHhkUVczMEpmOXJtV3RQOHdTS05jVlNxenFvWnZIMGlDWkZtaWRsVVRS?=
 =?utf-8?B?VVMrV0o5SDNvQzNQZlpscWcwb3pQQ211c2I3cERPTmx4dmIrQzRTMnhkMEV3?=
 =?utf-8?B?RVpTdEdTQnBwZzhLZW00OS92ZU5hNllSRWkrQ1FqYXdkZ3M1NE5nTlI0endU?=
 =?utf-8?B?Zk9JRXZtZS82a3BHcWhZek00NVNnQ1hGSU9nWHdEMmhOTVU2YkZtcTNUWjU4?=
 =?utf-8?B?YjhTR2sxNksvRmhSTGw4K0RYRVRPWlhpK09MWmZsalNVSERZb1V4bXB4cHdT?=
 =?utf-8?B?Mlk1TXdES3N4cUVUMmIrR3BCWHd6N0NvQnBCd3lOcDZIVVNwS3lqU0xYbEw1?=
 =?utf-8?B?d0ZoKzIwa045NHlrWVplaDR3SlBIQWpKUU9SeGtlN0FsU2tjZjFWODNjS3BZ?=
 =?utf-8?B?eVJtYUFVdWlWOExjUlB6Z0ZOcTZIdHIvSDhmRHQyVlA1VTNKNUVuV3VpVk1O?=
 =?utf-8?B?a1BZcjR1d3YrMkhqTGtuenZ0Z2hRWTFwcytYYlJjWk15TlNSdjNUaTM3Mnda?=
 =?utf-8?B?UTBPRjNCdEExRUFrU29YNWJ1emNrbURMbk9ocXdLQkNSUkoyK0JXOVhZTkZh?=
 =?utf-8?B?M1FyMmVIcVRLRUFMR1grOTlLZjgwa2FtNGdFRmR5WFdDWGxhRjdkRHd4QTVa?=
 =?utf-8?B?ZERKQ3VsdnF1T0p6UVJOdytENHdlckFzaUZrZDB6YTBHUk9kT0FYaFIzR2hU?=
 =?utf-8?B?UGw3Rk5ldHFCRFQxUEtCSmRwZDFUT2NvZDhlT1NYakFKZlk5bVIwbk1NWUZi?=
 =?utf-8?B?SU8wWU5zU3NxRWN1WTRkWmdYRlo4aGNWTHlsRzhxVDU4a2JlVGZkaEpmSDEy?=
 =?utf-8?B?ODFOUnQ5MG9VYVpTUWdITk9FL3R3S0V4NTlISUd3enRqMHIzalk0eDQ0bG5y?=
 =?utf-8?B?NEo5VDNUSE9zRVc1b0R4Q3U4Sm05NUpLMm5ybENhdWRYSHpwVitiOEt1UWU5?=
 =?utf-8?B?RFlWUmxEenpNR0RQOW5qYjcyc3gwMm1CdHBKN2pHbnBCTGNFbjFYMEVhbzZY?=
 =?utf-8?B?YnFVQ0QwYWUwQ0pvMDhrVzdnYjV4RzlFL2F0cit1c2w1L0lUZXE2OS94TlRn?=
 =?utf-8?B?a2JMSGlOQzAvbk44SmZ0U2kxcThMNForY2tndjRoU0RnL2ZmbWNpNkIzOVor?=
 =?utf-8?B?QVlxQndjeDJIeDQwUWdyMVVNQWdqM3JUSXgzeFlZdEJDeVFwMWc1b1g1YUFY?=
 =?utf-8?B?OHNsTXRvSXhFRDF6ZEVLN1ZqMkYxWW56S3Zqb2xzaStqdWpkRm1BYjRUQjE4?=
 =?utf-8?B?UjBTK21CdUdEaExtTmhzR1k0VFZnajVoVm83cUpDc1BBVC8xQ2VVc0lqMXp1?=
 =?utf-8?B?NTFCM2dla3ZzUHQ2KzhBNHNCbUhpblhmdDJoM1dZRU05ckd3TGJoQ1BDV2N0?=
 =?utf-8?B?dERKUjlhdmR1SE9hSkhieWl2K1ZaY2p2UE8rT2thdkY3TEZiL3p4UUFNU2d2?=
 =?utf-8?Q?Qe5IJeRqTmFDQkRs1JK4JigG3r+s5gDtlqqo9p6MeSr4f?=
X-MS-Exchange-AntiSpam-MessageData-1: e8mQRpCNN71mJg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 303bc679-516c-4014-f210-08de550149b0
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 13:15:15.4095
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qADFTMSUKZnIxrNPYLNwuS6S6Ciq+NUtmh2jpd+JMM17JxPwKix+Wrg7KuRUPhNDtZwTxk8+GvtU+6laYKmnPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6589


On 16/01/2026 12:37, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The DBB clock is needed by many IP blocks in order to access system
> memory via the data backbone. The memory controller and external memory
> controllers are the central place where these accesses are managed, so
> make sure that the clock can be controlled from the corresponding
> driver.
> 
> Note that not all drivers fully register bandwidth requests, and hence
> the EMC driver doesn't have enough information to know when it's safe to
> switch the clock off, so for now it will be kept on permanently.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v2:
> - convert to dev_err_probe() (Krzysztof)
> 
>   drivers/memory/tegra/tegra186-emc.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/memory/tegra/tegra186-emc.c b/drivers/memory/tegra/tegra186-emc.c
> index dfddceecdd1a..03ebab6fbe68 100644
> --- a/drivers/memory/tegra/tegra186-emc.c
> +++ b/drivers/memory/tegra/tegra186-emc.c
> @@ -22,6 +22,7 @@ struct tegra186_emc {
>   	struct tegra_bpmp *bpmp;
>   	struct device *dev;
>   	struct clk *clk;
> +	struct clk *clk_dbb;
>   
>   	struct tegra186_emc_dvfs *dvfs;
>   	unsigned int num_dvfs;
> @@ -328,6 +329,13 @@ static int tegra186_emc_probe(struct platform_device *pdev)
>   		goto put_bpmp;
>   	}
>   
> +	emc->clk_dbb = devm_clk_get_optional_enabled(&pdev->dev, "dbb");
> +	if (IS_ERR(emc->clk_dbb)) {
> +		err = dev_err_probe(&pdev->dev, PTR_ERR(emc->clk_dbb),
> +				    "failed to get DBB clock\n");
> +		goto put_bpmp;
> +	}
> +
>   	platform_set_drvdata(pdev, emc);
>   	emc->dev = &pdev->dev;
>   

Looks good to me!

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic

