Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2053.outbound.protection.outlook.com [40.107.93.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C504A226D15;
	Thu, 17 Apr 2025 11:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744887641; cv=fail; b=GeHO56JvEjqdLfZCsmG6h9deTQngBh++r8vdP+9FUe2v1AfjyXdjoWZRMWOfor7rRGJDtXa9GGZplCXa4887DxevCWMTwDnQ0tD0+CEmOaRSLtcP30SvbHaoRbWuTYFERYcieCurDa6MMvAHpwNmsdyN/dvX6nUVm35sep0uRfg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744887641; c=relaxed/simple;
	bh=5F/ouLNcpwIhuIb2jDOf4WAgBXLfAGKdZZ2in63O2EE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Vey530kG7YOkFR8uEJMjxTJAsD1181Z+0JnP1t6PwzRCYt94wHL8cCIH7pjWPl/POd6Z84Al9y/r1tDinPEsEBjxP6djORdgv70dtn+1doTEs6p58+l48h4sqJrcZkQKQIu0bOd1f+jK8syhwlGnz6rcmNdotdYmS6yqHAF2sCw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=lSPuTvAK; arc=fail smtp.client-ip=40.107.93.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="lSPuTvAK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eJAVq7AnjdDlHFJXkNTjZY39oynLmIWDiWiLypjwOqIizGMBNaE7vEcDdqDYm5yTc1kOXkco0uJFte2dTLViqNy3F1PPwFcFcWfDsvs019QWa9KTliAgTjmLcPUlgGTp3V5eo9O6la8yRnWTQ067CmnvKpQrvVFtKoUPpX+NlNhvADxtP66VDxL0xqTkiixNauCJTCoy3UogKrF/bNTd5fwEAnW+wCyC747Ngx8CTBAXQ9qwGYFI5vXkjLJAELavU2zOKmX+vSx0fVNnwNbIH70OgDWFQ8uEKMFY2oaDfT4k7ezeGXQXCwM8Fu/Ur1xvvJkWX2+2ha3voDcjPIGpGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sYfAmViZ2vugAzcFTLNHxZYqU7rsxRojgKggSv3QpEA=;
 b=dWKPyJNYZeuXyfuq/S/A6cle48Tu6fMSOvPPcyhoqqysanomfY46Teqh34gPNvSapUM+lMiVrVGWB4gmrPZV50/Cj7Wina1UWkLyZT7Egy3KvBEioYNUE1oYLny2/BxJjdCDnZ9WBQvUSokQicFdvbKctHw3LkfpEpLbWbheKK/PabqqK9lEviRJ8oZfrGZ4pQEe40tydED6X++fCjHPTUn3RVlE2/r7b7BA3V58wG9XbhpMun8bWOcUcbKJCaZs8KeSiml2SWrzSibQavenZMlcKDBO8ySwYufmebN0OuPGA2+kG11caHpBpPBfh6JsLKpYHOExDjGJ6qBFrJQyAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sYfAmViZ2vugAzcFTLNHxZYqU7rsxRojgKggSv3QpEA=;
 b=lSPuTvAK2a6tzfDywmmkVY5n8EuCHFHGFTtQbMSPUhVlcKj93tUdCh25sGgIhHiukkSqZVUZLjXa/6WGAiNNtXlvcTbI9+fIm78Y55v1C88YbAsQPqgvLPkUxWfkpsBP7jHkc4ca2Ztmp7J1MJ9D72N4atN5HLxnf4rhTrfbom9nxoUMQa4xkGQJrzXB9v0dx1AHPXcs36Jfh3JIazSkxCdghVQXN8wbxkaHGgole6fqGO975PoIisUmZ8MdqxcwH7B2rGM32pVA8/gcXPL/4oDrJXrA5Zy1KJ9edpW90PVIU3IgOpDBZ1Ozn1mYcqfNbKTue38qMo5WJMTicNj2+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by DM4PR12MB7670.namprd12.prod.outlook.com (2603:10b6:8:105::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Thu, 17 Apr
 2025 11:00:35 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%3]) with mapi id 15.20.8655.022; Thu, 17 Apr 2025
 11:00:35 +0000
Message-ID: <36b98b84-d18e-4781-8a80-51950eb941ec@nvidia.com>
Date: Thu, 17 Apr 2025 12:00:31 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] clocksource: fix Tegra234 SoC Watchdog Timer.
To: Robert Lin <robelin@nvidia.com>, thierry.reding@gmail.com,
 daniel.lezcano@linaro.org, tglx@linutronix.de, pohsuns@nvidia.com
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 sumitg@nvidia.com
References: <20250417093110.2751877-1-robelin@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20250417093110.2751877-1-robelin@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0444.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::24) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|DM4PR12MB7670:EE_
X-MS-Office365-Filtering-Correlation-Id: 59725969-1b37-4425-e0fa-08dd7d9f1476
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WnNCSEpsUUhMcWtUNVVvbEd2K3lFMEdtNCtXTUxBMUY0R2xmZGR1eURxOTl0?=
 =?utf-8?B?czhLYXZTeU5qV2tVZHJkUmNvR3hHNmN3ZUNjaHR3YVZ6SEpudzMzVVNPN0N1?=
 =?utf-8?B?Y2ZxZkdsNllvRkFXRlpLUWs1a09sOE0xVlhqRCtXbjZuNDRzd1lkdkNxQ080?=
 =?utf-8?B?LzIzREI3bFJhM3NySy9ucGZZVG1Od0JSc09WYXVKcWRrdjJ3dUk5THlNa0d6?=
 =?utf-8?B?enVYUXRGVXY2czJuNVovZ0I3K3dXa2NUcjNLWnE3Ris5bTZNNEM2SU5qNmNG?=
 =?utf-8?B?L1owb21CMng5WlJHOEhGQzg1U2tlY1E4M1RiYnM5SE55SGlHTUQ2TFFKSnR0?=
 =?utf-8?B?MzJ3NTVXSDBYNDRmQU4rMzFWSk1nR2l2NkdZakwzclYzaDdCODh2SDFxak9H?=
 =?utf-8?B?bGl0aFBsMlpjN29ITzZkKzVjb2xwWjhiKzdWZDZOTmQ0UkJXcDBiaXZNQmIy?=
 =?utf-8?B?NmVXbEZhMmdKQWplclV3RHU4UlZvU1M5dDloUGxyd29EMFdSOVZSYWdURDZB?=
 =?utf-8?B?R2xYOHhRM1d0VWphVFA1anRQdndVbk5EOGZXcXJ0R0xRT2JtTWh2MlRiS09j?=
 =?utf-8?B?Yi9TM0pTeGhER25yTFhLTkFkdmlLc3E1cXN1MngyUGdFRVAzL2FaUVJZWURh?=
 =?utf-8?B?bFJKa3B3WDBhWitjUFJHWmlqdWVsWDRod2ZwbHUzODduMUpKWEJyOHR1UnZ3?=
 =?utf-8?B?b2NURWlYbmxxQWQ3R1FmS21hemFMcGxnTlh5eTJjZHgyK1ROdjZkbTRTTnl6?=
 =?utf-8?B?dm5LWmZ6UEg1WnFNZW9tZEEwZjE5ZmJqWm5iY0lwaWQyaVpyZ1VObVBjU3dT?=
 =?utf-8?B?U1paNTh3aGdla0RXV0V3dWVmOVhvSnZRVnNjVk16OGlmenFtRTY3UmUrOUJT?=
 =?utf-8?B?cFMyR2NXeThyUzdFRVg4U2lZd0NUb2NncUxpYUFhRFcwVDJ2bE5jd2hXSy9x?=
 =?utf-8?B?T3d4YTZtbmlDbm93cFYvZHJORnJBQ2lxamNFOWV6L2VVMGJuZjRWbjhGSUtu?=
 =?utf-8?B?L1ZiYVZ1b3NBSDg4bjk1L2s0NzloWWh1elQwU0RuWW94REZKZE5FNXNsbjVr?=
 =?utf-8?B?bS9sYUh2UUtzTG81Ly9sa2U2UmpmcWtRd1gwNnVzY25FQjVIcURxc1o5SUJt?=
 =?utf-8?B?RVUrREJ1RkRRTWJwc2d1aEltUmhTMUwwMUUzeUUxSCtNZ1J3aERtVHFMS0Q3?=
 =?utf-8?B?bzdqTFdRaVdsNVRaSTBYM2NEQURURWFxZFMwOE41WVZ2TXJKZk1OUy9hUXZ3?=
 =?utf-8?B?Q1o2UWVqT3ZHRmMwcUdPaVBkOFVMUW9qL2Y0Z3JYQ2l6TXBHV0xJYUJ5cXdE?=
 =?utf-8?B?aXN1bzRyQWRzb1VnYk5KZzIrU2xjcDlXSURiVmNXaEsrVG9YVFBkWkV3WTRO?=
 =?utf-8?B?UVlYV1RKbWp1cU9xZE5qVUdnbVlhZm16MTUwNCs1KzFsM1drZHFlYTlIWnBV?=
 =?utf-8?B?d1FmMk42L1JzS1d4M0w0eWFIb1kxRldJbmlMUG5HZEhsTG1JMXdnUVVjaUZJ?=
 =?utf-8?B?MU8yOTkwR2NYSG11b0dWNHZMQ1p4d3hoYlBFVjlWODRhV0dMNDVmYWpSVGpV?=
 =?utf-8?B?cHVtWXJMWHE2amdZNHl3aTk5TGhnbTlYL1Y3bUJMR0VvZzU2NmhQY2J6djdH?=
 =?utf-8?B?SnRKRDZQd3dHb3F6bzJhQXIxK1dHbWIzd0hmNzhNTGVOQTNHL2k2VU9lZFB1?=
 =?utf-8?B?YXZEaEpKbTNSRHkzNWZPOG4wUExVOTJXVG1HNStDSll4N2YvWFgxcXJrQjlI?=
 =?utf-8?B?cHVaQnVlWDJrQTgvMnFxMnJkbWFwRHZCZ3NVbUMvNVEzdmg2MldPOXdyazlu?=
 =?utf-8?B?K1M5eTYxMTc4cHVUTVFQRTVmV3Y1MlJJalZmcy8xYkNnSksvb0VXdit1dEpN?=
 =?utf-8?B?dEJFbkR2STVtbktmSVF0UFRBV0JMQ3VHTno1M243MmN1RndEaW5RdlhtQ0tE?=
 =?utf-8?Q?2GHf4eym3Nc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a01MMWQ0NDlnakFsZVZBb2t0L1FhclBSLzhjcUpUTlBUSjZ0cXNvdXJ2aHpJ?=
 =?utf-8?B?TjhYdC9TQy9NRFcvaHkvQnMwTXBKcWtPQVRCTEkreTBTSU1tV2ZEVWVLOUEv?=
 =?utf-8?B?QkdzUHp6SXhaalpRUElsMVFjYmRhVUlRQ2tkajBjRjF4MS96R1I4d3lmS3Za?=
 =?utf-8?B?Z2dFSDJMREp5SFI3dmVvcVhLdDdtREk0Rm1DQWxMTzQ0c3BKanBuK1dacktP?=
 =?utf-8?B?Z0o1QnJrWE1QdGFybHpwOGhCOFZsbDIwRFhtUU5DZkgzV2thOWdlaTg3VlRC?=
 =?utf-8?B?b0tEUGRGTjZISW1qQ2Q2bEZMYnFBdm1yUndMTjBnVHZlQThiT3kyWUhXS0I0?=
 =?utf-8?B?bDE5U1NPMUs3dDdTWTNEdi9Dd2V6K0NxazBGTVR3OGJmSUhlcGRJNDFtSTRr?=
 =?utf-8?B?b2R2Z0pwQ015eUNXZnh6Wm1RNEZld2E2QXdON01lUEhTak9QcnFydHVjM2xh?=
 =?utf-8?B?VXQxbFVFQjhxY0FnVjFxa2VoK1VtdENmM3BQTlhwT2Y1RHczWHVVUDNWLyty?=
 =?utf-8?B?MVVjQVcxSGhWbEthZUpJVmUvNVVuamExUTUwR1h0UHN6ekRkQWtqcnM1b0dW?=
 =?utf-8?B?Ymova1dqTEdlRHhHWXZWTHpDZXlKNEd4ZWJBcmtnc2U0VjhEaWthdDhsTVZa?=
 =?utf-8?B?Y1BVK0oyUCswakhOUTVReWx1RFFtaGFXUzh1bU5VR2tYRFpMTW5TUkc2YUlZ?=
 =?utf-8?B?VjJCdzUrNzF3T0cwemRSRHVnM21IeWdacmNlOHJQR3Z4T1RZNEhLd2NXUVNZ?=
 =?utf-8?B?NTltSUJqRUd1dHBKM29zM1VGOUZKeGQ5QWxaeklreU1ua2lMMFZKYXhqakNt?=
 =?utf-8?B?NUJCc1dVUmVZVFBNWFdMMGtMUWs4cUFUcUpXU2NFaCs4akhmSzJPTGNPWURr?=
 =?utf-8?B?YTdIbTF4ZXlYYWNLSmFaYWdHUndQU1pVNGZnRVVQY0llcVR2ajVYWFplL2VW?=
 =?utf-8?B?VmV2NzZDK1dpMVpEM0ZTakNiM0RRdHRtWWlzdGZwRHQ4U2xhc09XMzZYRVFW?=
 =?utf-8?B?ZXJtTHpTMVRXYUpRcTFjMEhIeWlyMVdyeVhDWkoyTHBxeVZFUSsweGtOM1BI?=
 =?utf-8?B?N2JQNGF2VmpVV0dTcE11MklWTkpBUXBpMy9pM3lMaUtxd0ZUREdGZ2lTQS9E?=
 =?utf-8?B?d1ZzUkcxbUN5SVNhVVdSYWNmRFdYWEd0ZGNGUWxaa2JjQUEvbmJTOUw3bDRt?=
 =?utf-8?B?TnhrUWdNUzJwbk9iRlpBSW5ZMENjQkhVOXlSa0UyM2Y4M2haNnNTaVZGU1Fn?=
 =?utf-8?B?SDhZcS9wYmV1cHgzV3Vsc3FtMVVlY2FjTjVLSlNOazB4TmNPZzhZWXFGMXZZ?=
 =?utf-8?B?R2lEYjYySHhzeXhaZXNJVEVWT1ZwcDh2bjVtS1RiNmkySjJNbjVPVlRUOE95?=
 =?utf-8?B?Z01oR2tadmFKdlpnSG5GRWNJNEQ1OTN3cml0d3RueW1qOTdnVE1kb09zdFFt?=
 =?utf-8?B?UDkwc0doeUgzYjVseG4yZXF4SUdzUm1ZZ3hQalB6Z2E4RDdsdEEwRWw5TUlm?=
 =?utf-8?B?bnBVWEs2aEZ6R3B3RVF5NE55bEpKejVCOWVISlZYQngxdzlaRS9sN1c1OXpD?=
 =?utf-8?B?RDlqbzdJT1V4VnM1YXQ2SDZRUmo1MGZGeUxrUU5OSlpGTURtSXRmUWdpeTJN?=
 =?utf-8?B?c0dUSVBCWEZqSWlVM2o2Tm9GWDFzRFVOdDBIeFc1MVRRMDNzWGxiT1NqaGRh?=
 =?utf-8?B?bmJFZzlkQ0pjK2NsNDFYdE1tOFB3b3BvcWszM1hqdWJUMkFucVBLSG9FQk5P?=
 =?utf-8?B?MTV5MWVhcWpHQWIvN3ZxWXJkcXROeFlBSVZ1OXgyVHJSeWF4WlM1dGVTM0hm?=
 =?utf-8?B?M21QWEUxUUttV2Mxd1VhK25rMVpiVUxNekc5ZGRVMUJHc1BVS1ljellwRkF6?=
 =?utf-8?B?bS9WZHBYaEtZeG16YnVNenQxcFFJRFlTdzVNdElJSUR2d053eW9Pc0lBdTUr?=
 =?utf-8?B?NHVlbHM3dVdRM0gxUDEyWVRLb2dPcTE4azIrZXpsVmRTMGloZ3EvUnlyTm1M?=
 =?utf-8?B?TFA1ZHp6d0hXS00yeEd5b2czL3puY29pelRHeTBwYnZLajJPRldsSUNiMW9k?=
 =?utf-8?B?Q093SkFGQ0pUVVBBdVdYdmx2UTZWNUM1REU3ZzM3SWJTeENxK0psck1TOTFw?=
 =?utf-8?B?amlicXRtQVdna201QjkyWllUSlFmT1FiblJxTiswbERLelRtcTJxeTAxODdl?=
 =?utf-8?B?Mnc9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59725969-1b37-4425-e0fa-08dd7d9f1476
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 11:00:35.5821
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7V/jxPFxDC8Tm3b+3mEqWFo+IVbrtFcJx7jAuupi6QPz0BRFltYi7ZsNPxdN5OgF5uft/K9C8qpgD8uCWsb1tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7670


On 17/04/2025 10:31, Robert Lin wrote:
> From: robelin <robelin@nvidia.com>
> 
> This set of patches includes a fix for watchdog for it may not bark
> due to self-pinging and adds WDIOC_GETTIMELEFT support.
> 
> --
> V4:
> - Improve the precision of timeleft value

I believe you also fixed the unused variable warning too!

Jon

> 
> V3:
> - Improve comment description
> - Refactor to fit codeline within 80 columns
> - Remove unused if(0) blocks
> 
> 
> V2:
> - Fix a compilation error, a warning and updates copyright
> --
> 
> Pohsun Su (2):
>    clocksource/drivers/timer-tegra186: add WDIOC_GETTIMELEFT support
>    clocksource/drivers/timer-tegra186: fix watchdog self-pinging
> 
> robelin (1):
>    clocksource/drivers/timer-tegra186: Remove unused bits
> 
>   drivers/clocksource/timer-tegra186.c | 92 +++++++++++++++++-----------
>   1 file changed, 55 insertions(+), 37 deletions(-)
> 

-- 
nvpublic

