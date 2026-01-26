Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010060.outbound.protection.outlook.com [52.101.61.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE502868B4;
	Mon, 26 Jan 2026 06:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769410282; cv=fail; b=mo7yzfwZML0w+ocFx8td/hVmtuALx31Qi9TY7psPN3YR9dgrBpvdfRbElY/D3ki0hsy8RSW+Sw891JKtwZWJs2y9zhqNRykjDAF3Ek9QO3K2tt46q+5a+kNoGzPZSfYTKppD5MisTCED6QoRkjwh9zDQ3ITu9c4Sm9L9yOxWdL8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769410282; c=relaxed/simple;
	bh=M35QIkkt5WWM1NvWEBwbCnBKVHbmWymkFunPelwwVGw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=pepCrFWvtRqnBgrs5FKURSc8vRuGfZm7bGPuFBEHPJvxh8R0yrBQPLasafkaHWvsqwwTN22c7ow9vZbngL855OCNvjdiSpfELRaSembK1RjWGNLtEot4aeRRRD9NTHN/Q4hEw/xdOejUC9Ns5p9jerUyZ3lPZ0ZerAudfnCnPrU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=C4Drx6Y2; arc=fail smtp.client-ip=52.101.61.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="C4Drx6Y2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o6fMVjAPHSF6BVEYmqKP0OeGxrnx+tWqE5RJcVt66tCQJw+nI+LIZSMOmGlpF//7/+yb4UWtjApw//tV4XesrsmR0He6MFapkAuY+S+AG7D84pIpNtbK7K+bnqQH/MrJ4yr1TpUAFtp6/vMXFOAbFcPL8EWVWD03rZKE2+tAlzJ5c7VVLYfzy7ogmGVSIu4Lms0J/AUXLxsMlhaX/CI1xDZhDmma/7dlB7puplj3dYF+Wj46oerqPUxP65CWBBmSHQauXAxvAtpTfzDpR7wUwYKoM/LV+U5DY1uOhpPXrGmyHDxht88WcpMhZZIJ2PrROMKAcyNLiT1jsL76JbMnrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t9LKPYuwdF9zF5QuDI3+tKlBlolwsRL8Q32NOoz8EJg=;
 b=TinPr0tGjTVaGUA8IXRzV4mb+yj2G8ZO+ih92g0rHxWKKdgKNkbEvszHvQOvaJ4LrP0XXiJ/laLvmGKOgOdxYONHzg5gZhvaahSQ5jpLCZgKP5M479Cw8Auf/qlrAOcl7J71/AJZA/SGOEZ5dQAO41n/V57ag98Exw8bzJrvry9FOj/17zB/MDD2SNmdRh1n07z6GK0MgpH3LDka5xJlD6/UyeUqFnohU/w4S1ncdI66hUQpBPDEbpk8G8+ddFyrTuwXD3fFvMTbyFBoZTbIJYjlDWr9cHCYH3r58xQHs3oe7YqULgabFsk92ARQqz+5Io5RjC1oXk3QKfZ9b9vdag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t9LKPYuwdF9zF5QuDI3+tKlBlolwsRL8Q32NOoz8EJg=;
 b=C4Drx6Y23d5hY7tA9KNj2qTGSTeQb/fzQlR4JEizr4CrocxxnT/XfodavwdWLRmOZDSPeym5lqYtb4rYH5H/JY/q5+QPfxPSji2y+ExO399oK4Et1QyDgP0gL/aF6/RX8LMjRdOKmyYYx9w6qe7sJA50x4Jq35elnWvY2/Zw1gWas6/XGDU6j3PhCHdosEo8CCaCKIpWJxGya3wQZj1qJHCWg/GmvObVgCJNRui1MnoA2nYNFDB42aR7HZwZXRoB04pgRGs2IIWW3BzKIxaCBbRl8Ak0Xv7ACDguDM/yRCoduk2HyNrrWCifmpg1q+sZ9nX9M9z6YWo7+0VPEunjYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB9152.namprd12.prod.outlook.com (2603:10b6:510:2ec::22)
 by SA1PR12MB9490.namprd12.prod.outlook.com (2603:10b6:806:45b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 06:51:18 +0000
Received: from PH7PR12MB9152.namprd12.prod.outlook.com
 ([fe80::fc7a:4d2b:7118:d39c]) by PH7PR12MB9152.namprd12.prod.outlook.com
 ([fe80::fc7a:4d2b:7118:d39c%5]) with mapi id 15.20.9499.004; Mon, 26 Jan 2026
 06:51:18 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
Date: Mon, 26 Jan 2026 15:50:42 +0900
Subject: [PATCH 1/2] memory: tegra124-emc: Fix dll_change check
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260126-fix-emc-dllchange-v1-1-47ad3bb63262@nvidia.com>
References: <20260126-fix-emc-dllchange-v1-0-47ad3bb63262@nvidia.com>
In-Reply-To: <20260126-fix-emc-dllchange-v1-0-47ad3bb63262@nvidia.com>
To: Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
 Svyatoslav Ryhel <clamor95@gmail.com>, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Thierry Reding <treding@nvidia.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0277.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::7) To PH7PR12MB9152.namprd12.prod.outlook.com
 (2603:10b6:510:2ec::22)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB9152:EE_|SA1PR12MB9490:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a955651-235a-4386-625c-08de5ca74ea8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c2Z3MVd1Y0luL2Y2WGRmTWE0ZkhYT092VE52Qy92UTM4ZHVnS2J6MWQ1SHFI?=
 =?utf-8?B?NGpPVnp2YS9oMTJjYkp4d0Jvdk1Na2pmUnVBZGMyNlZBN3F2bjBucGxJSG9J?=
 =?utf-8?B?ZWVTM3V4eHhkUUo5OFZPaWNkOG9wRHVRb2ZZNHIweUV5SFBpWjJmTVM2Y3Bx?=
 =?utf-8?B?QVo1VHB0TkFGZkVNWS80VXpFWUpTMXFlSXM1RFk5NGZmRFlHOFJ5WHp6SDF4?=
 =?utf-8?B?OVlraUZxbmczNVNLYTR5VThWd0RtVFpGeTkrUlRsYXBxQlc2NmdWUjlmcVp3?=
 =?utf-8?B?eU9kMDJCTGplaWoxeWJzZFBaeURMSnBwTEZvOXdFRFFSYiswYW9rdWpJdEJm?=
 =?utf-8?B?STVZeDN1dXgzWW5xc09hL1YzS0U2dG44Tm5DRUJKS1U5U3ZlV0RGMXdNcU15?=
 =?utf-8?B?aTYwZlBGQkpNOThUWk9ic1lJYm9tZUZFL2NvaldNMVdpb3MzdGp6K2JzbHRk?=
 =?utf-8?B?akVPTC9lRWRGaFNPK2lwRlVDR0hRU0JjK1RHdmxXOUtuQ3dJN0IxZmlSTk1T?=
 =?utf-8?B?a3FNSlF6SzZMMnF1cXpLV0RQS3pLSXJ5UjIvWnU1MjNycUhOOTY4YXZoY2Zh?=
 =?utf-8?B?L2ZBRUVmSVpMc0VqSURiZHA2cFdJNmxCaWhkalgvVTl2dEt2MFBKM1lSekNz?=
 =?utf-8?B?ZWs4V2Z6NU5ETEVyVGZwZXllamoybHIva2xuOENuYi9mdkFHVXY5TGplemV0?=
 =?utf-8?B?dnY0VWhQQ1NtcW9VWUJ6ZG5MS2Z3V0U2Wm1vcGJMTjNYYVNlamw1cGlCRy84?=
 =?utf-8?B?MjFTZlVwTWQyemVOUHNHNm1FNkVCMjdJbnI3ZWljZHAwNWtqT0FPUU4xMkxu?=
 =?utf-8?B?a3A4bG02YjFYTkR5TzhwT2NlOFpqeVpTT2lSblJWRDEraytSYjFaUGU2MlVl?=
 =?utf-8?B?Rms3aS9UVFllOGtlTm8vYTRqd2lhVDM0aFdNcnJMc09WeXBrR1FKZk5VaUZ0?=
 =?utf-8?B?UVFmK0V4R01JY1FlUmRObEJFQXYrVkEyYUVEQmNSaXcwUUphVWozWmlzNTE5?=
 =?utf-8?B?eHdzTW5oNFdxN0JUZGhHcjQ5Y3RjemR4ZElOMDdVZUFObTZRbVpQeDU1ei9x?=
 =?utf-8?B?clhZOU9RRTBmcVNpdE9yR1Zjcm03azNRbndzcW9QRnU0M3J3UEtHVExKdytu?=
 =?utf-8?B?T3p2S1FwSm5lYVFTRGpCM3hqakN5UHdIQ0E1amg2bndxOE5RSlI1R2YrSVFQ?=
 =?utf-8?B?RXR1WjkvcE1hK0RPeHlvdVMwOGJEbmRHODlmbXBFU1NscjZGaTIvVFdINldw?=
 =?utf-8?B?ek9MTUc0SlBpYytzNHFDNmJlbEY5Y3BnZWpyZ05COHpFLzJlTm1BQThqdm5J?=
 =?utf-8?B?SnJqdlpjRUd5TlNxZUN6WndSUjNxSEt3N0NLVlFPNXp3K0l5QjJ0REh6TjN6?=
 =?utf-8?B?RkpGbHlCdnMvQ2laZmVpU0F0Wm1YRHlpM1NEVlZPTFNndnlOektPa0gvckds?=
 =?utf-8?B?blhidEIydmxhbERNeUpOeXFRYUpNS0VZNXVNR2ZxWmJvODdKOUZCcC9uYWh4?=
 =?utf-8?B?cURjeTBOWVkrNkdHMUtISWU1NTV2dzRpV1JSUnZSb1dWcHdralFwem5nL2hJ?=
 =?utf-8?B?Wi9vVzdMNkhmZFJUL3VvdHVlWDVzYmZQM0w4ZWoxalVLT2xPVDlGZld0YlBz?=
 =?utf-8?B?SXFHcDR6WUR6UEpDbWRmdkVOOVhBMTE1VThwaCtXVzArQzVQSzBwZ2tvSytj?=
 =?utf-8?B?d3dHQzE3Zkc4b1RpOTNHelVBbTJQK2NHd2lDMG1vaUl1dUg1ZDl3WVBFU0Uz?=
 =?utf-8?B?ZE5hUXZySUV0WG56MmxnWVIxREFmS29IVVlhY2pMZkNHRHJRWkZ4L25uY1FV?=
 =?utf-8?B?TXRCNXFHREhLTUJnM3kwK045azA1ZDFWSkc1QjY2U2lTTlZzalgvUXVPcWFq?=
 =?utf-8?B?dUV4VzlvcWdaS3MvRnh4U0VSb3BueVBJWTB4d0Y1dnJrQVo4UzNJUlV2Rm56?=
 =?utf-8?B?eW1zc0VqQXk1N0FtY0E1dVRQd1E3Tm1TeWQ4dXFiYUhEWTd5STY0WGtGNzhQ?=
 =?utf-8?B?dVVZb3N1aWhvYjAzWFY2TC8rMytTMVI1K3RZRWxlekMyMEY3aTRQQlpBeVlI?=
 =?utf-8?B?aW5sUmxzd2RqQ1hQTExyRWJXUG02Z2FsTGpaNnJkZXkzb2JJYmJmU21LL3cy?=
 =?utf-8?Q?v4xc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB9152.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WGorZzE2NFpmb2tmQnJIZWtyRFFqcC9qSlBxelg1OUxHbkI3SGRLL2QxSzBH?=
 =?utf-8?B?UmtqWFpUR1ZFWWFsMW5uWlUxaDB5UW8rTXh2TGJoaTM1c2R3RkJKZzY5aTNF?=
 =?utf-8?B?SU1ZVjZ1bWlzUzJhZHhwY1hkd0g5cWVZVk91U0YzZTFkYVdFZVluN2RTSW1Y?=
 =?utf-8?B?RkJjTzBvckk0Z24wdER5UGc2NlFaNjhzb3lyNGt4UFVkZVE4NnJBMkFMd0dv?=
 =?utf-8?B?SVNoejF3c0JWUTg1Z3FHd3ptd0g4KzVKbzgrdmFMSjNQb3QyUjI3VUZPUEpw?=
 =?utf-8?B?Z0pPa1Z6VkpNQ0dUTGE0UlYxVm1TeThnRm9LOW1kUG10aWtvbWZsMVIwVjlX?=
 =?utf-8?B?NGVkekJja3pSK0QwZXhvaXNQY3BONHQ1MkVCaWJhKzBFYzVWNjVhL0R4ZmhU?=
 =?utf-8?B?TURhZHhWaCtTSDdNb20rVDRPc3lyNTh4Z3FQV1N2RjdrRWR2OXVYbXA3VUt5?=
 =?utf-8?B?cjQ1amZmeGpUNVo1dEk0cTd6eXJnOXVqNUh5MkVmMldJK3BwbFF5NFhhcnJV?=
 =?utf-8?B?N3lXVkRkYjVwOUdiekF1TnFxcVV6ZlVqMEJVV0drdG82M3hsWHYyVmhTaWhP?=
 =?utf-8?B?Unp4ZkkzTHFRRVpSa3AzemxKUk43eDB2anp6MEtMNWJiRjFSK2g0THdxTDJu?=
 =?utf-8?B?T2QrS0pORXUvK1BwT0crRTRtK0VtaXNIRFplNDdvNUdYWm9JU2JzQm10MzI1?=
 =?utf-8?B?aWNCUFkrMFFScW12bjhIMUlSM1NwTld1Rk1tVXh3WVNvTllpUWR2cFhlbm9V?=
 =?utf-8?B?UkYvOEFtd0RrOTlFazJKdnBvQ3VZMENQelBZSURXaXMvcWt1L3pWZU1FeENW?=
 =?utf-8?B?M3BXS201dnVwMXJwbExwVncyWk9SakRJb3hhZWMwRVhlWTBtVDNyR2xmVUJR?=
 =?utf-8?B?YU4zTXZjVjBZcHRENUx0N3hpbVpNMy93Y2MvbVczWWZUSnMxSUx3Nng0a1FG?=
 =?utf-8?B?UUxUOGJvS3kzS2gydmUvVG1kUDFIRTZJMzFVMmx1V2xDQlp3eEFELzZJZ1pV?=
 =?utf-8?B?dHlEWWxSQ1Z3YmdKSmxLNllSamdINVhJeGxpcnpZVWYvS2Y0UXA3cWV2K3pP?=
 =?utf-8?B?U3UrY1UzZEhCTHRHY2pKVzZGQU5SOTJyL0tmeG41UzJYaW1TSExoOERpM1Bq?=
 =?utf-8?B?V29oc0hEaDhDTGlkbFVzaTZlTzUwaFZHd2x4TVdmOEtMTUJBR285bzBackVM?=
 =?utf-8?B?UmJyajh0RW5HangxZG8rUVZlZnFJRmxEOVo2d0dPQ093Y21aYzJzblhkd2Q1?=
 =?utf-8?B?MzlyRGp5ZUxRTHRGWmJmdG9KWFdSNVNxd1luR0ExYzJwbVB6dWJ4ODFZWHI1?=
 =?utf-8?B?cmMzQnZka2c5NkN5RHcrUkJ0YncyTkN0Vm94ZTVJajUxVVJOZXU5Nzd4R29y?=
 =?utf-8?B?cTZlNTkxZUpsb09xb2tIc3grQXc4WlM2Y0t4WEVNZTlCd1E0NUR4dGlmcXBX?=
 =?utf-8?B?cEt3eTRTZXdKRGxnRENRQ3ZxM2I3Tm5WVURLdFk3Y1dXQ2M2akpnTjZqeFQ5?=
 =?utf-8?B?eFROVTk3anRqeXhCc1c0K1VncTRvYWNYVCsrU1d4eXhxNENOQTRMZjRpNmlm?=
 =?utf-8?B?TkpHZGxJaWgvT0J2ME12b0FaM0Q3Z0REaDRqdzNPTjVOTXVmN0NvYWgyOUdV?=
 =?utf-8?B?ejg4Y3QvMHJXT2FHdmZUVzVLVnRqeDBla1UxWVpzSjEzakFvUGZiQVY4Y0xt?=
 =?utf-8?B?YTFta0U4U0ozbXdCYUhjZE5XYnpiZHNiVnNsYUtweUtsNkdXS0FHbjVSUC9L?=
 =?utf-8?B?aUMycFV6bnpDTTVKbzJDcEFQbnRqUVBocGNFZDR4dlk1YXZrQTBoVFIzNnhU?=
 =?utf-8?B?Y1VMTlNkZGVDNWxZSXQvRFhPSUw1R1AreTVqdzFCY245QmdVTW5QOHcycCtN?=
 =?utf-8?B?TDVyUEpFZmxONWFlTGtrVHh0SUl5ZldWYzJ2c3U2QVREVnlGazVtTXJxL28x?=
 =?utf-8?B?RGpuaW9mVEdlOGt2Qmo5c2RwRHB3Zkc0ekduZklnZ0dSSmpMT1UxSlNaOGdJ?=
 =?utf-8?B?MWVDRlQwNTVQaGtQR1p5QVM1VWpCK2ZkVkEzUjVRWDliNGRadHc4bWpiV20x?=
 =?utf-8?B?UmpTY2tRZFFhcjdmNWVRZ3NqK0VpZHJCV2pqdXZKb1hOcDhYNWRVcjB4ako1?=
 =?utf-8?B?ZmxzQ2V5U0FrRjVRZnBYTjBVZXpEcTdEMkVaekdkVXo3Z1A4ekdack12Ym9M?=
 =?utf-8?B?MXpIM2dFVWFKRzRtc0NBd2xRVWt3OXlTbUtXUEptL3JoVGlMUkJaWmhnZE5l?=
 =?utf-8?B?WmZNOVJoeTJ6QWFQS0pFVmVvMWNkOUJ6TFBadFBCVlR3RHpCUmpVNW5ZWHJE?=
 =?utf-8?B?VGFYVkYyZDNXZ2M4bEpQUU1tdEhrUGhHdGJXWHhzQklUanZVR21wdTkzK0pt?=
 =?utf-8?Q?WLsWBonU5HQA5giB9+M7F5iT0dY5PSeIRlcr7+7iUs6gU?=
X-MS-Exchange-AntiSpam-MessageData-1: SMSUc6astCp5AA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a955651-235a-4386-625c-08de5ca74ea8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB9152.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 06:51:18.3054
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YKmq9Gxr/D+U24QHwldQT5ms58o5cEuCHWyJUT7ooBo1BHSwVZLGdqiZmbBWHEIdfydJ7Q8IW1IHmhVlHYDXSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9490

The code checking whether the specified memory timing enables DLL
in the EMRS register was reversed. DLL is enabled if bit A0 is low.
Fix the check.

Fixes: 73a7f0a90641 ("memory: tegra: Add EMC (external memory controller) driver")
Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/memory/tegra/tegra124-emc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/memory/tegra/tegra124-emc.c b/drivers/memory/tegra/tegra124-emc.c
index 9978ff911c47..05d0d8527961 100644
--- a/drivers/memory/tegra/tegra124-emc.c
+++ b/drivers/memory/tegra/tegra124-emc.c
@@ -608,7 +608,7 @@ static int tegra124_emc_prepare_timing_change(struct tegra_emc *emc,
 
 	if ((last->emc_mode_1 & 0x1) == (timing->emc_mode_1 & 0x1))
 		dll_change = DLL_CHANGE_NONE;
-	else if (timing->emc_mode_1 & 0x1)
+	else if (!(timing->emc_mode_1 & 0x1))
 		dll_change = DLL_CHANGE_ON;
 	else
 		dll_change = DLL_CHANGE_OFF;

-- 
2.52.0

