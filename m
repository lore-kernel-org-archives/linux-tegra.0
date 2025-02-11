Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2063.outbound.protection.outlook.com [40.107.92.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491582F5E;
	Tue, 11 Feb 2025 05:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739253073; cv=fail; b=q+PyaTGNFZ8IgBmEgdXNmlCeDDkycbDF9+R10005YTkRjI4GesmTbUrcFpYdqvOg6P2iGSrNo9Ugg+IOm/Yp7/2sFwmvpsP5fauXVX1TYmcJ2KHFpYHkwgSdkacopl+Gji0lre68eatppMVewOdCMVrQOEjOnXJSoJ9fQAnPMgI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739253073; c=relaxed/simple;
	bh=BJQSRrK9goo/fVs9h/+OUWX1Xce44W65sBXRK25qwrE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=tlVeHap4G+RQWkm7KyeEJZ9OBPTMmvUZ3qEPVOOk2VCNbtbfy0QOC1KxMV8HeKLLDAOU/REJWw5de2v6WapjRMSbKt08SKnUaDApsDlB8256sHIJjxTeuXqsHUMkFBR2zFWKxGm3pXOev2FUmtZuHSu8dns7soAxaHIB2fPT7lk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ETDt/1TG; arc=fail smtp.client-ip=40.107.92.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ETDt/1TG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d1tM16L9YzruNlxrtmhzCoaD1VEzJ7/9ZCG1ssTW2kZ6bJx4KySydrRIzLuDtWBEiN9KIvPMh/1+tE5WiE+tIU8nYewnjVQToEekUmWNIa5zb5h7vOEhq3TpfUCbTMDoR5Gc57081wLOc+CBQIsyQIWBIP5VZpRlNILuJx6cki7qHw6R3ks+KjskSHyHTjl5C7KJx1v0dNKoWBFclaaUDciFc7xiFJmw+tOBkoeSBvUNdU6yA3O/tWwJM8bNv3eKxJOh0McL4PunLjbCX/XNWoPfMWjFWYHopQw8AzYLBnePd7dqh1N3J02QHbUaKPJ1tqW2bb3TGwIMort3XZY/TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7utcaSbcM+PuyAiA33w3r+AYwK7WngbgdesADJCBnKY=;
 b=TpS3PFuZK82H2RLp1rgHlVTI+2Q/ceLmI7ZgJpnEQ8XA8xtllolpN6cjFIPprMTNJL5ofAlrPiO/sPynZFgiSJ8QYeLSw8At44xcBYP5I5uIDOZ8CoosnAzWds543sp2TwFRyduaRFKArEs0D56vfXsQyPqIaSLR9gk18qoLEvnuJ8Vb74S21bFalJajzQmjBetn9CvMHxt57VFB8KpFBN5HXz81G91aqYbKLcAfVlRuz6h3V8AOnXV+uh7/HeMzANF7o0UIlO8LB5fwxiZr+aUcxy2o3hl/R15A35aIBEcl28HcomkuwKWiA2n/J6Dysp2eYyhRYRsT/vcVjO2+mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7utcaSbcM+PuyAiA33w3r+AYwK7WngbgdesADJCBnKY=;
 b=ETDt/1TGfrOh9qpqzSWNAIdiDdnFlx+RIj18fPNboV7nUm9s6UekmRTn/jKYPhDsy+B2AjH6s5CXRc0om+bwIw9OEOfw7G2lhxwhW/Xzh6eNNpBXrhXPDc/VBb7k4+T5zXE8vzzGq4jKvISwi1qkdNUangjCyCbzqH/vXkhOvRReXnID3uNf24sE59nKA9CqPgqBaGAzoZhste6RegDXp8pZqMz6bwS1cUyF17uJ+8dB0qC9x8eZLerJf0bG6SH319WPrggpo5XiEksPCwZ90rhAIvCPQweaq2Qsla6CxeWo1dloS5m/FtsgD3iq7iBNlPeNfTzxRX7imMaUcRCAdA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL3PR12MB6473.namprd12.prod.outlook.com (2603:10b6:208:3b9::16)
 by PH7PR12MB9254.namprd12.prod.outlook.com (2603:10b6:510:308::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Tue, 11 Feb
 2025 05:51:06 +0000
Received: from BL3PR12MB6473.namprd12.prod.outlook.com
 ([fe80::25e1:5ee7:117:8923]) by BL3PR12MB6473.namprd12.prod.outlook.com
 ([fe80::25e1:5ee7:117:8923%3]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 05:51:05 +0000
Message-ID: <8ed14c8f-fb38-4f50-9319-f6d4e660fae9@nvidia.com>
Date: Tue, 11 Feb 2025 11:20:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] ASoC: tegra: Add interconnect support
To: Thierry Reding <thierry.reding@gmail.com>
Cc: broonie@kernel.org, linux-sound@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 jonathanh@nvidia.com, mkumard@nvidia.com, spujar@nvidia.com
References: <20250203105304.4155542-1-sheetal@nvidia.com>
 <ftyikuzu7avxlbyfruubjg5zucbstq5psilehpoahvdhpuqlr6@pcubq7dsm6fw>
Content-Language: en-US
From: "Sheetal ." <sheetal@nvidia.com>
In-Reply-To: <ftyikuzu7avxlbyfruubjg5zucbstq5psilehpoahvdhpuqlr6@pcubq7dsm6fw>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0091.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::14) To BL3PR12MB6473.namprd12.prod.outlook.com
 (2603:10b6:208:3b9::16)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR12MB6473:EE_|PH7PR12MB9254:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c2a564a-3cca-46c5-9a17-08dd4a60130d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YzdyOGNZUjZWUTFjOEd1WVVZSnVGOXNENEFZM0JLU1p5NmN0eFYzQ1ZHQXdp?=
 =?utf-8?B?cGtMUlpwcjZ0dERuQThhczBBQ1lxSmkxYTFJUWtnZGhNNjhkUDNKaHNObGxX?=
 =?utf-8?B?R0FuL0VMYkgxeVY2dC9oNVgvY0dWaVpNSjh6RFQ5c0dmR2t2Zkp3ZmZ2dEpa?=
 =?utf-8?B?MnlLOHYreHhZQ2twWnFBU0Q3aDBWWHByakZyY2JkbHc2RFkvdXVEcGo0ZnN6?=
 =?utf-8?B?UnAvUmltWlF0emJ0RDhJaTdLc1pPUWpsSUhYUC9xSTlLR01lSVBLZjVwclg1?=
 =?utf-8?B?aForMmFCekZvV0JsUEc2bHpFem4zVEQ2ODYzWjlablJJdlhIczA1RHRMOXBL?=
 =?utf-8?B?cmJ6VUg3N2VESjc1WWdpc0JZSTkzcFFkeUJCYXduSUhkeVA1OStNTFV0VTFV?=
 =?utf-8?B?WGRoNzRTeVg3My9Yc2w5bXFiUS9abnY4aGJwQlZFOTVnVGpvT0M2OUp4QlJ5?=
 =?utf-8?B?bGJvamhDekRZZ20vdnFkZnFnbmlja1VKZGM4UlpCd1locWtDVXh6MW5jK2xP?=
 =?utf-8?B?b2FBK3NXUlY1RVpRNmFrWktMUi9uZVBuWXFqUU1GaUZJQWtTS3FCdWhXdFly?=
 =?utf-8?B?NnFVdFoxblR6NWV4MlhXNUtZckorSUROMzc1emdyNzJOS3BUY3hDZ2gvUHF5?=
 =?utf-8?B?T0lRYXJSWXhTZ2JqN1FZWWxHTVNDNktvSlgvNDhxWFhtb2U3SnJUL2FMdC9O?=
 =?utf-8?B?U3YvSmRZRGV2NXFleGxRZEhjTW1tRjFGRzA0TDhxYThBSmlIRDgyVm9HeW1P?=
 =?utf-8?B?RXpTaWFzWFhHZStEYVpSNG00REpBUG5PMkVZc2l6dWhUdVYydUZKM08wQU5v?=
 =?utf-8?B?NHpENTNhWDFOMVpxZnB6TitmR3ZYZmpoQU1ZcVltZHo0djVyQjVjZ2xCVlFs?=
 =?utf-8?B?L29KREFJcDdOOStLYlFJU0FoYnk3YTNtOTJuOU1Rd3QybWFMY09YdFlUS1Zk?=
 =?utf-8?B?WGhpd1ZDWkVkS2lCQkY3d2FDUEEzK1llR0xYYURuVGxTMGFBeVh3YjBVMmc4?=
 =?utf-8?B?bXoyOGpiTlZCR0ZGMjh4cEJPMGlSUmJiUFhaR0tBYnZ5c1JWVmdYeFdQcTNr?=
 =?utf-8?B?MlhKSHFuVVhSOEE1ekRTSk51T2R1MTdOVDQwQlVCcFluQjVYeTJrYUsxamdN?=
 =?utf-8?B?TG9GMDdpY2x0c29ybUNIUEZOTHA3TXB3d3V3TVI2b05YekNHMkZyMDlXTkJP?=
 =?utf-8?B?UjlFVGF0WWZYRzNXOTJrOE1WamU4SG50VVhYZU9pRTFsZDluWHE3RVpNVVc5?=
 =?utf-8?B?Q0FFdTc4SVV4RmdOUVlWNVFIZnNTRlM3WXl5Z1UveWhkYy9aMjVSMStVR3RV?=
 =?utf-8?B?cUxLZXZ0NEJHbitnejM5SlQ3YjA1N1VYTU16RFRmVElnVW02TUZkTTB5TUx4?=
 =?utf-8?B?R094SnlOLzJudnRSZnhCQjc4bUR6RGNCcjg5a1VRMFY3cVNRQTlnOS9LRWZk?=
 =?utf-8?B?djZJTXprK0pTRFU2ZDh0MWlUcUwreXpaNkNsS2drTG9SbG81UXJwWUtSWWJv?=
 =?utf-8?B?c2ZFRkU5cVM1My84ZVJ1TzdTUGs4ODlZOGlkTG45MHBNbkU1Qk4wNzlyU01V?=
 =?utf-8?B?L0lhYlc1dng5Tk1CVXIvcjhURllheFJMRHI4ZWM3UEMvTU9sVW1BTnBNcHVX?=
 =?utf-8?B?ZlVzMXpCcEwvRGRjaDdnblpwYzcvS2ErWDdmWmJuNkVtYUc5M1BnaUdSb2l2?=
 =?utf-8?B?eUNZK3JzT0FrV0ZhNzBOWXpYZEU2Z0pEenZmUUtHbTlURFFUd3YwQTRZRk9G?=
 =?utf-8?B?Ykd5OGx5NkV5NDRyUDJqNHdMZWZJUTV2UmtQK0FWOFNsYU5aWGZ2YzNkaGE2?=
 =?utf-8?B?UXBDcjRzSlg2SWJSQ2dqU2JkSTRYMmVuYXhSSGRiMHQvb3I2VXllZEQ2ZWo4?=
 =?utf-8?Q?mNoAYsHORt11n?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR12MB6473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L0ZmS1dHcFZ6dDA4K0xWemorVURSVDJqSytxVm9BR3U4My93YVhIM3ZDR1Zi?=
 =?utf-8?B?M1ljU1FXMWpuWnhZWmw0cnNQeUtUVHhqaTQxVVJ4anA1Wm5wc3hKSTNQdGtD?=
 =?utf-8?B?Z2ZCbXBrK1JYcWZ2bzBSdVExSjcrUkgzR09PcUVOMjR0ek01MGI4TkdxN0k5?=
 =?utf-8?B?V2ViMWRPVWgzZ0JPeGdaZnBpWGFnUkNkeStValh6RVBiVEkyWVpTbERITzVo?=
 =?utf-8?B?MW8yZzRIRDJwcWNmVGVFOVk2am9UZVRiQkZoL0RsN3RlaUR4ZHRraDZ2czFJ?=
 =?utf-8?B?MWxNU2QwTnJKQ24yQTdnK0VWMmtYMlpvc1FPU0JwV1QyeEovUFRIRXF4cUYw?=
 =?utf-8?B?TlJQd0JGcXJIc3dXSFFRSzlmemlVdnBjT3djbmpVd0hCU1Rqc2xQZmFFUSt5?=
 =?utf-8?B?aXV2M054MkljNkllZ0IyRkswU3NhOUdMb1U2QTNWeTBsZ3JmYWlqSWJ3c2xY?=
 =?utf-8?B?ZGdQQldtTnk5Qy9IL1MvejF2Zi9KcCtCbUxPUTVEM0tiS1RHZW03R2VQM2J6?=
 =?utf-8?B?cTNTRkpLam0xajVMamJibitwb2QyWFAwMyt2cWhNVjNlbkdROFNzV1V4bHNo?=
 =?utf-8?B?WXJ6UjVFN3UzRDFJWFNDMkU4c0FubUZQMVIxUVlUY2FqR2ZVVEVwS0JxajNS?=
 =?utf-8?B?T0RxNFl3RDB4TXZpU3BZM1VPT2d2SjJTRmlpQXV6RVBnUWFVVXZHTS85M3hv?=
 =?utf-8?B?SHdmdEpRNnR0MUZ3ZWIzSlFYM0JTS1pLSlRwaUdzbk1pOGVMT2YyY205ZVRU?=
 =?utf-8?B?SmxwVTlzYXBRazluNmhRVXNSaXNYZzN3Q2F2NG5EZ1hWZis3MTkzVXJVakhF?=
 =?utf-8?B?Mi9QVFNoWnJucGdWekt5WER5UktSNkRyaGxLZnlYL3ZqOURiejVKdUR2WGcw?=
 =?utf-8?B?aVoyMEg5WmovK3dZR2dhMmV0dUw1QW1PeVBZTUtsM1g2WjRHUGcrY1lnN2tX?=
 =?utf-8?B?cnFlWEkvY3JIc09lZGJ5dHRvUjUrOHJoM1VWVmhzaVBUQ3ArTFB4aDU3MEsw?=
 =?utf-8?B?eDkwMWNZU3V6VVhhcCs0eDJmZis2eC9KNi93bDhZNFJvZmVORE1ZOS9UN3lK?=
 =?utf-8?B?ZktqQ0VaY21veFBaYlZOYk53cUhYSHZ5REtPUTl0dWhCemQ1T1o4UXR6aC9q?=
 =?utf-8?B?WkROR3MwRi95Z2ZONmNab0crMm5CZVQ1M1BNZWI0blJZWHJOL25lcTlGSUww?=
 =?utf-8?B?TWpsdklCWlR5VThKN1ZzR280S0YxWStxS1ZnTk5Ub3BEcFhOOHpjUGU4LzJt?=
 =?utf-8?B?b1d0NWc0UGNobXUzK1VLQ3pkYTNuWXNUTno5Qm96SkZ1bnowU2F1cm9EUWlZ?=
 =?utf-8?B?UkdFU0JjanBEcktyRjZraTdzeCtUZTAzTXJzRWhkazR2VnlsVzllZDhmbUx0?=
 =?utf-8?B?VzRpVm9uUjhuL05EOUtEVEZ1WSt2VVF1WmxyTDZtOHUwUEJzbTl2S1Awb1du?=
 =?utf-8?B?S05ET0ZycUFPaERpZytCRTJZOGlPOXRiVnFaU3BKSEtOT0VvaWVsVXNYM3Vp?=
 =?utf-8?B?R0ZyR0NlZFphSkFyWmo2STkzS1hOSTlXT2MxaVRCWE1HZkFpVlo0eUJOYzln?=
 =?utf-8?B?Y3BybzRHMGxlSWpZN3IwdjhIa2VFTHZHdGwvTkU0UUxTNys1OXRJbU85cjJm?=
 =?utf-8?B?OGI1M0VUVmpqRE5jVk92T1ZjMkR3czl2a3VSK0wxZG5YdFpQMHVWL3NDRjZM?=
 =?utf-8?B?V3Y3d2FXYlB0SXBBVEdLZGkwbzZURWxNdmtyRWcwd0l6QTFvakdOcXJZNjQw?=
 =?utf-8?B?L1pnQ0JkYjBmS0NvRnQwZ0t3ZW4zb09QTndLRDhkbnVPUWVCSTcvbGU0SXE0?=
 =?utf-8?B?MTZhSFowZDdBdWl0QWE4eHpPNXRzRDRhNjFXS1JMMXM2NndCU2JQeUZFY00x?=
 =?utf-8?B?R2d2MlVWdG4xbG5BMkgvZjZxMzgyR0dqam15V1RhQXJEV095QmoxVG1OdEV3?=
 =?utf-8?B?RngvME41UGw5bGRMNmc2R2tDam9BTHZwajY5YVFwN3FPQ256V2pNUVhIWkVy?=
 =?utf-8?B?bzUyM01OZlNPL0FHcDdkdXdQMi9DcnozdS9jRWxWYWpoYWVRRDdzTWtyeEpz?=
 =?utf-8?B?ODF0azlPQzNndU9Gc2YrcXVDQ0VwNkowZUhlbEkrcENhb25uRlVrVDhubnMw?=
 =?utf-8?Q?Kfdp+II9QdCvaIEKBDBw09b53?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c2a564a-3cca-46c5-9a17-08dd4a60130d
X-MS-Exchange-CrossTenant-AuthSource: BL3PR12MB6473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 05:51:05.6546
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 36NpZtN9P5NP5RTCqACMAbMmRQRksBVoFTutLRolBbGcrxuaotXa4wyouVJxiZNindKBsIJoJGe606lJZsB/Cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9254


On 05-02-2025 19:45, Thierry Reding wrote:
> On Mon, Feb 03, 2025 at 10:53:04AM +0000, Sheetal . wrote:
>> From: Sheetal <sheetal@nvidia.com>
>>
>> Add interconnect framework support to set required audio bandwidth
>> based on PCM device usage. The maximum bandwidth is determined by
>> the number of APE PCM devices and maximum audio format supported.
>>
>> If interconnect property is not defined or INTERCONNECT config
>> is not enabled then the audio usecase will still function.
>>
>> Validate bandwidth updates by reading the interconnect summary sysfs
>> node during PCM device open and close operations.
>>
>> Signed-off-by: Sheetal <sheetal@nvidia.com>
>>
>> ---
>> v2: Fix pcm_id parameter uninitialized warning.
>> ---
>>   sound/soc/tegra/Makefile          |   2 +-
>>   sound/soc/tegra/tegra210_admaif.c |  24 +++++-
>>   sound/soc/tegra/tegra210_admaif.h |   9 +-
>>   sound/soc/tegra/tegra_isomgr_bw.c | 132 ++++++++++++++++++++++++++++++
>>   sound/soc/tegra/tegra_isomgr_bw.h |  31 +++++++
>>   5 files changed, 192 insertions(+), 6 deletions(-)
>>   create mode 100644 sound/soc/tegra/tegra_isomgr_bw.c
>>   create mode 100644 sound/soc/tegra/tegra_isomgr_bw.h
>>
>> diff --git a/sound/soc/tegra/Makefile b/sound/soc/tegra/Makefile
>> index cea4b0d54378..defea7f53f11 100644
>> --- a/sound/soc/tegra/Makefile
>> +++ b/sound/soc/tegra/Makefile
>> @@ -13,7 +13,7 @@ snd-soc-tegra210-dmic-y := tegra210_dmic.o
>>   snd-soc-tegra210-i2s-y := tegra210_i2s.o
>>   snd-soc-tegra186-asrc-y := tegra186_asrc.o
>>   snd-soc-tegra186-dspk-y := tegra186_dspk.o
>> -snd-soc-tegra210-admaif-y := tegra210_admaif.o
>> +snd-soc-tegra210-admaif-y := tegra210_admaif.o tegra_isomgr_bw.o
> I don't understand why this had to be tacked on like this? Why do we
> need exported symbols for something that looks otherwise very specific
> to ADMAIF? Will this ever be used outside of the ADMAIF driver? If not
> this should just be moved into tegra210_admaif.c and then there's no
> need for the EXPORT_SYMBOL() either.
Thanks for pointing, will send a separate patch to fix this.
>
> Thierry
