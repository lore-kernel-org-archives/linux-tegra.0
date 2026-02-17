Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012020.outbound.protection.outlook.com [52.101.48.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD85322B74;
	Tue, 17 Feb 2026 10:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771323175; cv=fail; b=XDEF1y2QBd2Mx1t6HcNersZ07kxlR/Cnk3QS+si0Yr9rfMuEYwQqCx6fvZ+Q0JlwIr3rYFWuFw/8eY65EybYEw+ZRId3vovslt4r6dsuxPW5DDu8lu1d104c4XnooKggO/r92WfW1MuJCwIZt0WHCDugh8sAtxOnCZX60FjJJy8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771323175; c=relaxed/simple;
	bh=KCTgRcWCHhmWothVX5Iy82h5H64OH+Rnf/3ddiqLDV4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cIa860nM08x1KK/se85zPOoRczjbmcXiiqSeqsLQI7XB7pKGWID4rxZBl2vuLzXCOEeZc4WgeKvTTPg/gB84ve1+Vk4zTh2JJs2Ek6xTAKj11PrKvxBfreNOywmo6jt1pV2JiewnXBDvrpIZfXPYwVjAmSxbtrFRuTDHCcuvyc0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nov79n1D; arc=fail smtp.client-ip=52.101.48.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nov79n1D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F/wz/gEdH2bRqj0NCh8P1zTlfLtyNU8HTDIYXj4/6SnwV8PkoW90uqU8H6OT0UsxfvheTF9JDe+tmRKy0mxtWsRfSz+2C9Qm1gxRZ6Qdlfos2QSm67SioyimvuOB5h2wt56cmokMyPgKwC/BKXSFeDWMEM6FOO7Z2BzPq5/YKW/jF2UYbnIF1cUU2rXQm8xU2cDbTQjsRWJGbl6cT3L3JL95nRYgB6wwgdDQ5u+LMOiH4ZqB1ZWHtQaRntt6EyjTxLm/X0PgI12oOGhN5JP7Gant+mppS4hj3bHrnOfsTMA9g1nZtpH0KKEI7KKzKdYS4KgdMMucJqL9bVhlCaiXug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KCTgRcWCHhmWothVX5Iy82h5H64OH+Rnf/3ddiqLDV4=;
 b=UmBiHpWH+BHmS30JcQWC/iWSwh2MsxaGV4K1zEhm98KuGnp0FOBk2j8eCHIeXCvshpF8BEhhmHHxTkzdo7UnXKcDwlO8mCNBnkl8lru5bLala8sKgNQaDa3frhdDnIL+MGcMnz+h30DUvzKWSUC032At/xxMdCFE1cBqpYVzxDBylYaPhJvOM6omlIJGSB0d2yZqlX1hzyYbww0ctL3lpk1LQqXUoSSNqlAHJyQZ40yt5q6qApzMaRiKdIUcHB71NNgDQXXGtsQoB/h01+eT0Pv/uhPJBp+V32cm0MX6cdPkz5akrNteu1V+hKTP5jg/Rw04U5jJ/DJaaq84ahd+PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KCTgRcWCHhmWothVX5Iy82h5H64OH+Rnf/3ddiqLDV4=;
 b=nov79n1DnKDRPbjxecslTHuQWgOaJdxFVMek6HY9s6iBZ4dGrZyNA9GcOfRuzG6dQPBH8qZJccw8TZZ5t4cRXLLBP+XLrIl91FR+I8YqdwEq5aLEu1cFfkvbQj0rXO/cFAOVm3+rwrZYeHd9wf3wrIus7WE+DUpP6o+CFR2QOOtNS1ePzwOJiYGyjEg+bqGKwywlXKdmmyEqJ+xAkmt3ys407NyXjwyAonRXW9rfeepVxZJBIpD+NnbfIJusYV5SR6wACmC7jXyD/l47iasuOBtvM6ULhfwqbOnKkNVnadHK5BWrxlQuPY8HPD/uP25soIQIJP9npMz5xauop1ek+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by DM4PR12MB7597.namprd12.prod.outlook.com (2603:10b6:8:10b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Tue, 17 Feb
 2026 10:12:51 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%4]) with mapi id 15.20.9611.013; Tue, 17 Feb 2026
 10:12:51 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Svyatoslav Ryhel <clamor95@gmail.com>, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: Re: [PATCH] memory: tegra: Deduplicate rate request management code
Date: Tue, 17 Feb 2026 19:12:47 +0900
Message-ID: <4179089.BddDVKsqQX@senjougahara>
In-Reply-To: <1af11e93-a455-44ce-a7a0-1b5664e48273@kernel.org>
References:
 <20260206-memory-refactor-v1-1-4385d439558a@nvidia.com>
 <12216338.nUPlyArG6x@senjougahara>
 <1af11e93-a455-44ce-a7a0-1b5664e48273@kernel.org>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCPR01CA0168.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::8) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|DM4PR12MB7597:EE_
X-MS-Office365-Filtering-Correlation-Id: 49714312-7382-44a5-5f33-08de6e0d1bb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L3dyWm1mbmphQjloeS80Vk5nSEYva1hRKzN3RkdQMGNUNlZsMThMdjVId1Vi?=
 =?utf-8?B?RW5qeFhEQUFEcHRDYy9lWGxxbzB3R3czTy8zcFgydDBYdllVMnRHU3duYUlP?=
 =?utf-8?B?MlVVaEhUb1FHNGhEcVlTVVJjU2Y0Y0IxaFEyWWg3azFpQUVkeHQ4Z0M3ZnpO?=
 =?utf-8?B?bTZUOEFod1c0aXptUzJOb29QeXhLVVJhdGZFK09ONG9KWmQ3Z1FBRTdjNGNO?=
 =?utf-8?B?M2IydXk3ZDVlSGtURHVaNkRDT2RJUXlVVEhmN1NSSm5hZ2dycFdWYnFldjNX?=
 =?utf-8?B?c3VyOTFHTzJNS1ErZGtHUG1HRFd5NHB0WHZTV21oL3U3T3V0RE9FNTVCNnFq?=
 =?utf-8?B?TnpzSm95YlpXZUZLS1BUVUFDWWRYTmFpbnovYjVUQXlnUWRUc1RqWWtHbDdw?=
 =?utf-8?B?RGVsb3VzdnZwM2gzenNXUCt1VjVuTUsyMXNMVExYVzNRK2NDZWFucEdrTm9p?=
 =?utf-8?B?RGt5VzZpTHdWTGJJNDFoVU1zRXJSNUdSNEhqVmhhYmRtUjJHd3hreVdKZ3Fh?=
 =?utf-8?B?dG8xaXUrNHMra0ZxVGpZRFVuOCt4VklSbW4yRjgzSUtoM2tMNzJ4WHU0UElz?=
 =?utf-8?B?QmpsWTZzOUdIcUV0U1Y1RXpwcEs1QkVsTVFuR2xvbjkxbmVmS2FubGRJd2RT?=
 =?utf-8?B?VFkyRUR0bUE0TmE0NDdkUnFkc0VsVVFRSTltQkFUWld3dWM3ZE53SFBVRjN1?=
 =?utf-8?B?bmdVV2lSWG9BUlRiYytSWFlhcytxdUNYSjkzd3dQcUR2YWpVZ3hvOXp0a293?=
 =?utf-8?B?bm9yMTd2S1p1Y09pR0NhZXhnZENRREJUMXJSc1JUckMzNHV6bDNDZ2VSdTA4?=
 =?utf-8?B?UEVZaWpiQjdTTXBycjdRWW9xekQybXU5WTBMR1prdktJbHpkNkFYdkVNaDdh?=
 =?utf-8?B?RmJvMEhkVy9WaDVCcVJOTERqMnpxcFpDbDlGQ3VYSFBKTEVGQldlRVFVMTBw?=
 =?utf-8?B?a3QzNzhsTWFtU0JSR2plWXhQQ3RiMzlrNnBoc1JYakZENHRwdkU2RTdMMUVk?=
 =?utf-8?B?amlFRHhQRWZ2dG1kSFhnTmh5RzRkSlVKY1BUM1lQdktLa1VNbTdVdS9MK0U2?=
 =?utf-8?B?N0lEMXhBbGI5VnVoS3JiYzRsOFZDMC9jSkpSTUJha0VyQTBNandnc0ZTT1d1?=
 =?utf-8?B?d3cvc1h6b3NIQjBtakZtejJoRFNCYlh3MWN2UHl2MDdhZ01FdTNUbVVtL3Z4?=
 =?utf-8?B?ZHR6emw5MTRRampLd0RaQUJZRlo0SWFDSzM5YmpEUHFSVFFINzBWTWNiaFpB?=
 =?utf-8?B?ZCtKamk3aEdPWWtSdlNWeHc1ZnlhUzJtOFY5bjFUcURiMUNkbUtWK2s5UmdT?=
 =?utf-8?B?NXBtV2x4aG9yc3MyTGJFaGU3aWpUSkhZWDJkb2VJbTZJMzJwbkJST3psTGRt?=
 =?utf-8?B?S0RRWXJkdmlGZml2ZzJsenMvNld5ajZiYUF1b3JEdWc0NlFodkFJU1Q2ZDk3?=
 =?utf-8?B?ZXZnN1d5V0YycDBwN1gvWGI5RHgzMVVlcDAxRXB0UTQ5Vi9XN1owS3NWM25x?=
 =?utf-8?B?WU9MOGZWRkMxR3Yxb2N0dEZZRnIybnV3SmJOUEhHU3hwcllvWGdCSVFXYkpK?=
 =?utf-8?B?ZDlaVmRSeXN6eUhFejVKelZvS3FFVjdCQmFMZ0JvbDRQblVORWM3ZHNkc2hu?=
 =?utf-8?B?MlpMSnRhUXczcVM1d1NaclI1S0FMV1FZaFdMVzhTWVE1U1pHNkkvN3BOSkty?=
 =?utf-8?B?ZVBVN2ZtY0thYjRFbjRjeTZYa2cxaWpMRGh4bmpzd0l6SzRQZjdLdVJkUFU4?=
 =?utf-8?B?TmZGT3k0ZG04UElab2lZWHZ5bEYxbzdzbUU0K1VPZGVlcjAwWHVRV1U5SlYw?=
 =?utf-8?B?MmxQdEhFaVVrei9xSGxFNUNKM2RiZDZERktidWVLSE42RC8xZSsxdlR5UVd6?=
 =?utf-8?B?TjNnalE0TThuTFUrd0lvR1RweEFwQW5MUHhQYmk5UHM2MnlQeTdTVWQwNjA3?=
 =?utf-8?B?RnpZdXVmU3dKWW1vWnJKb1hwRys3YkN2U1VvSVFUY1g4MEN4eGJPMFVmNEk2?=
 =?utf-8?B?ZTNPRjFVTDh4OFRtOWY4Qk15bDRHaC9lZllkTDdJc2YxN2dxS25Fd1UvTnpt?=
 =?utf-8?B?SUd5bjhjWE95YzdpVVl6aG5xVHNhTWVuNkd1M2J6TkdvTnNtMmFuVWFmMVZw?=
 =?utf-8?Q?dDFY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N3lFQjJSWWVJNi8zUmVpRGs4aXZ4SUlhM01pN1BqeklOeEdZbWw4WnlOTFY0?=
 =?utf-8?B?U0oreTNzV2dvaUxrK0dLVmY0T3NRbWZNaE45d0tKUEhlY0R4T3NTQTVyYTRp?=
 =?utf-8?B?SW5LQSthNmQwWjAzMjVQV0Y3RjVnQTlrUkVGbG9YRWFPU3dvVUJrWTRZbENh?=
 =?utf-8?B?aW4zeHprWVYvcitIM2dQZ21GWTJTU0NEWmlXRFBpV0RmSk5VVUcxU3g2S05i?=
 =?utf-8?B?TnZCTTlPclBLdkx5NktwV1JxUVQyUXU5MHUyeVVmRHplMWRFNDh2UGlnbjFt?=
 =?utf-8?B?UkJxV2FiaVBRZHVVN2hQOUV1cmRiOTMxVEw1UWdoMytWY2Jxb0NWUUxGcWVZ?=
 =?utf-8?B?aG5mQUZpOFhMNEpZT2JyYWFyK1JRc3NBMWw1WmQ1eGswekg5dzJvOEkrd1dL?=
 =?utf-8?B?eTYwdm9jcXdjTFZLRjMyMTlsZU1YMmVvY1IvRXgrbTFJd05vK01GZlVlbFlq?=
 =?utf-8?B?aFRVajlZZ0l3NlRXWEVPdFUzMzZOdFI4eWs3SFh0QWNRUEorQllMMlBPUGVF?=
 =?utf-8?B?RUdmSit2OE5ia1BreFhiWFMzWjRheTNIbWJuWDhJcnBBOGk5Q0VGSmsxNmZi?=
 =?utf-8?B?YmIzVWt6djN6M2hETUx6MmZGWGdHMnhtMTYyenJHSTdKRFFWOGpKNlRISmdk?=
 =?utf-8?B?c0V0M1lKSnFQbWp1QXNnSnRQZTdmTmVmM2lNMnB3aFYzMWlmSHM2WWZqclZ0?=
 =?utf-8?B?WW9wM1ZlTVBRYlh1SUt0bzVPMUkrRHRzdCtLOTVaMmFwVU9MOTFzd0hyOHVm?=
 =?utf-8?B?blBnYlJmR1pjNHZ3KzBBdVBkN0dBZWR1SGg2M09GZHFlanBYL2I4dmdvWmR0?=
 =?utf-8?B?U3lkbUUwbjVxVlNSRGNyQTJMQ1U1cmhseitjSXJJcXNZTHhuQlpXMFB2RXdU?=
 =?utf-8?B?Q25VNXluaGpNKzV2RGtCRnRpUXZrcGZkMlZRVjJ2cEk1L3BRR2dnc2FZVkxR?=
 =?utf-8?B?Y0lydFhtT2hGNzBVM0loVGFLMmFOSEh3ZnVJaGJUM0NEbjZDNm9HSXpjS2Mz?=
 =?utf-8?B?dXJGS2Y3TWl6YU5SNlM3T2gzOUtXYk95eHJRM2tWRmZqdHFXaUZ3a3NGbXhs?=
 =?utf-8?B?Z0MwelBONzR3RWMvMWxjbTVvWnJlZ3ZqYm9Wblo3WUpHOGxRdmgyNlkvN2Ri?=
 =?utf-8?B?RFN4d282S1FaQjVLOC9sZ2VKK2FiNHkrUkNKb3J3U0FUK2tqVDBFTkl4MU80?=
 =?utf-8?B?dkVCVTQ0eHVoNFJpODBaMWJ6eVgveWhvbU9EandabjM3bkZ5bmd2bTFwd2R3?=
 =?utf-8?B?RVl3TkZEYUVybk51bmQ4Z1FWZEd1MWRDa0MzTzlJV09tNldzZ2FiZUxiSXQ1?=
 =?utf-8?B?d1JpWmtMaTRPdjY4dldLWVBNQnVMcWM0ZkxwY0g4N0J0d2RoNkg1TXIrM3F0?=
 =?utf-8?B?TmpTMXFDRFFXSXJLaENnSHB4c0FrSjRUdC9ZZlFQQUV3SFliRHNHVzJWUTBq?=
 =?utf-8?B?a0pkQ1A1TURqR1FIQTVMdTJuYTNTeWRQTWZxSGZRRi8wSUwvRWZYd2lSL0Ex?=
 =?utf-8?B?VDdNRDlYT05KRzFIQzhPaEhUYWRvcGpTeXBuTHpscndvSm9qWmR2bWlqc2J2?=
 =?utf-8?B?c1JnNEtOWmgrUGpZd0RQU2tQWVZtUjgwUEl3ZzVmMUFVemQ2d0RzQkRnKzYz?=
 =?utf-8?B?SnZBSzcyekpwL1VXQzRrNHhIS1kwL2tZZEc2bE1GbFVYTlRQSUJFWTJpUG9h?=
 =?utf-8?B?KzFwNzBuRlY5SmRuQzlCTW0yVkhFNG9IR1M5K3llaXhhUTZENlp2SGcyVlM2?=
 =?utf-8?B?a21iVmtLcDBDV3drcndldkVBVEJ0MDY1UkdiQ2loa2VKNkJsQ3E0RDdqaW5V?=
 =?utf-8?B?ZzJadnZ5czBPeHdqYVVrVkd4VjlZY3E1QWxPdEo1aVFrUG5vbDJoRmZPUkta?=
 =?utf-8?B?cS85OUhTekYxbE5ySmVUc2ZGUGE5K1ZxaFJwNGZVZ0Y2cnljSlFTdkVoRlBr?=
 =?utf-8?B?ZTIxU0RvaDZjaE0zK0J2bGlkblRmTlBFaU5WeGRCZEljZ0pqNk5DWnNYbTNY?=
 =?utf-8?B?L0JNRTVmWXZSZklmQU5rQWh2a0xyUnl6QzA2em5YVXR2am1sNjcwWFkwL0NY?=
 =?utf-8?B?UURpU1g5cmtSMFp1SG15L1JXOVY4Y1NoaTE2Q2JRVHhsb2NlbitpNUM5S2kv?=
 =?utf-8?B?OW5RUHZSYXR6cC90dzBNMGZFODJFc3dTNzhPNU1mZVcwZ0g3bGtxYXAvUVda?=
 =?utf-8?B?OHM5ck1Lemh5dDA2QzhvekZvakJ2ZzVFaHpvdWtMYmtSNUNXcE8zSk1tRkRi?=
 =?utf-8?B?UXFROUR6bHFXcEYybjlSSWRGb2RaYk1uelkwNVRRY3N2YlAwN0ZBc1FjVnQ1?=
 =?utf-8?B?VXBMVFNsZkhZNEVxSHdSL3haamdraDNFV0pKNUloUDc4YjJkaEdvY01MVFhZ?=
 =?utf-8?Q?4wlJgH7JZeYRPPwxG2adHYHQDRC+r9zvOi9zTAuB7VgC7?=
X-MS-Exchange-AntiSpam-MessageData-1: kqc+/cHNgE5Reg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49714312-7382-44a5-5f33-08de6e0d1bb5
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 10:12:51.3174
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DeWX/TOAomjmOMkz4jf1mnKzPs5S1T9V5Yx71knc8ZqJme780FRiOpB8gJyhwFwPsJ/8HjOqs6H2QclCICKAEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7597

On Tuesday, February 17, 2026 4:14=E2=80=AFPM Krzysztof Kozlowski wrote:
> On 17/02/2026 05:22, Mikko Perttunen wrote:
> > On Friday, February 13, 2026 7:24=E2=80=AFPM Krzysztof Kozlowski wrote:
> >> On 06/02/2026 03:54, Mikko Perttunen wrote:
> >>> As is, the EMC drivers for each 32-bit platform contain almost
> >>> identical duplicated code for aggregating rate requests. Move this
> >>> code out to a shared tegra-emc-common file to reduce duplication.
> >>>=20
> >>> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> >>> ---
> >>> This patch is on top of 'memory: tegra: Add Tegra114 EMC driver'
> >>=20
> >> If that patch is not merged, then this should be reversed. First you
> >> remove duplication then you add smaller new patch. Not vice versa, whe=
re
> >> you add duplicated code just to remove it.
> >=20
> > The code is already duplicated multiple times before.
>=20
> That's the meaning of duplication... and adding more duplicated code is
> obviously not proper choice.

I understand you want the cleanup to be done first, and that's fine and you=
=20
decide -- and more duplicated code is obviously not good, but I don't think=
=20
the order these series should go in is obvious. I'm only saying that becaus=
e=20
to me your wording reads as accusing me of making obviously bad arguments, =
and=20
it's not making my day better.

>=20
> > The Tegra114 driver doesn't change the situation in any significant way=
.
> > Sequencing in this way is just easier rather than disrupting that - mor=
e
> > important - series.
> Fix your email so message will be properly wrapped.

It seems some update must have overridden my email config. I think I have=20
fixed it.

>=20
> Also in the future, please use normal ways to express dependencies - by
> lore links or b4 deps.

I did use b4 deps.

>=20
>=20
> Best regards,
> Krzysztof

Cheers,
Mikko


