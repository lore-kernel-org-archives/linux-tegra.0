Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013062.outbound.protection.outlook.com [40.93.196.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B5D156F45;
	Mon,  2 Feb 2026 04:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770007383; cv=fail; b=UP+q1AUPtYuYK5J/NIiscbhaOyhWuPPgGGNwQtNbccRZPb7KuiJriq/xxAMvoKNy9rRW8vrfQIGEuwhFAoXmz6NI6+oAdxPdty0aApHB0jeUcH5VyhwL9ai5pCx1+KTOoEs5P8PBuTQkzvFhOu0MELh1Cf4yzQZ+CQR3cfSVi0w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770007383; c=relaxed/simple;
	bh=b4C5sabCJzsY41jJD+J49ePdlGDs5uqnwzJjoI4aPjE=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=MMY8UOs3V1u1zbFHPc0xiphslJrsZ4/my0qBphuQ27aXAG6lptZC1uDF1/R2p+ZHtqKxqVKyLWooHCLbPR86VDlMUTgD+j29Jv0f6HuCQEBiLaQSTF3qwlogdqYr2KQPJpZCyW5Q1fTNJV0e2Yw0OTQEPE2pBHs1E6s2IsoZxNI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RwV56zUk; arc=fail smtp.client-ip=40.93.196.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RwV56zUk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z7dy9Sbxjdn0xFc6+Xu5nYWXMvusZXlS0yObKXu10cbCTQnX/aGoqZDwmwOzfLW//1Lmjkxyr5pp1tzq3Ky0pON4UwAq5Ydq3H+Ko30Sxs9rzsO5A7FTQgLx0q0voE21z3i7d46HKxN/oCSAE56rzSoMUs4PS0YLStIVRLQEsEPPKBWK2WuKXOqH6UXtkox9/ZiJKqVhMsAFHG7xtQXTVXKxoSbin7fnByGPtFzLUCy8MLysTTk56iK2hAiBNvh1aioRl4JDGnjUcLw8ZFjD4rNEvnMj7P5GgWzNtVWqYtyf/LqqR6oAxKEZN1Tq87BVQr4lk7kVpzc1MZyfAbTopw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8+DMPJxLWlSzYY6JL1mLl6Bc9bs+Jcptf9cDH/PC1Iw=;
 b=hosYM1gqfekRTgLSLZU+y/1rNiJ4PFBifM7bj96vDR/5LhcrUMyVZlw8bwUYo529LfmJUPjE+p2g12AW/ZvUrI5tsZ5EjmcN6030egLcyzu+JJGe5VYcCUlVLwWBzMTzmuHnKY9kzIXu4aKCr+/z46uIE5VIBm4tCi+grOArTcEjXiSMJ/wpGwOkijXNzCbjWUwqLcd1t1lguBmJTrWRxOrcb2vkK7X/UPZPzQ8hD3mto72bHJQHwQz1myKzDhx/aF1o4RvKoL/lH6oavwYSTuxnBOMNarAYCqePGRT9FZnYnYHNPmmnnJhE7AuvliwIJkwZboQJtN1lcHo6oKN+PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8+DMPJxLWlSzYY6JL1mLl6Bc9bs+Jcptf9cDH/PC1Iw=;
 b=RwV56zUkF59g6OADmAPc5rSQCXeLtD+wNHCOilyD/oGTkZupGYINNIrDaWV31Awyq2MnvZQsuVpxHEtFfzn/DCCpjbm7+5UjpYMW9X75DtkLjl6gOiEo2bOu8o7C6xxwQzbzf1aKezexZEIUP6ucTxYy5nvUBr3NQXTzrnfqDSICY37GT7qmf01DZhR9ChKINxCQBGYR6g5GF96WoGJecSizTI7oOR6w8aH1thdxUd1U1TfNLacc5bWnn6pfC3AM+JZEqNuddO5Zya0TgI73CCxn+/+TnXD+M2Pwgq8czz0xzvSfz/LhyHEOXxWcr4CtbMi1jsDEUuxvzhvYwEBJkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by CY8PR12MB7314.namprd12.prod.outlook.com (2603:10b6:930:52::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 04:42:58 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%4]) with mapi id 15.20.9564.007; Mon, 2 Feb 2026
 04:42:57 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
Date: Mon, 02 Feb 2026 13:42:34 +0900
Subject: [PATCH] i2c: tegra: Don't mark devices with pins as IRQ safe
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-i2c-dpaux-irqsafe-v1-1-5b1847e8bc97@nvidia.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MMQqAMAwAvyKZDaRBRPyKONQ2ahatLYog/t3gc
 nDD3QNFskqBvnogy6VF983E1RWE1W+LoEZzYOKWDKgcMCZ/3qj5KH4WlBioabmbGnJgXcoy6/0
 /h/F9P+/4UlljAAAA
X-Change-ID: 20260202-i2c-dpaux-irqsafe-edc04628b401
To: Dmitry Osipenko <digetx@gmail.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY1PR01CA0189.jpnprd01.prod.outlook.com (2603:1096:403::19)
 To SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|CY8PR12MB7314:EE_
X-MS-Office365-Filtering-Correlation-Id: e8273963-0de2-4054-ded6-08de621589c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|10070799003|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b1JBK1kwZG9QWHpvZGNPTUlZalB2cmg5elZFLzREK3cxNGRQY25ISEp4b2Qv?=
 =?utf-8?B?M2loTTdzRmJJZTNueXJyQlZDeGszZm9VdWFnYzUxQlJVV2hBOXo1Z2xSV2VQ?=
 =?utf-8?B?UU9PM1YrQy96LzE1TTFuSmVpMUhkWCtIVmhoOE0zdVVWWEN5OW9VdEdrYmNC?=
 =?utf-8?B?R0NqZE5KVW5rYWFaYWg4djQ3cjlTS2twSjF6VnlSZlZTNlUwdG9ybWtyTDQy?=
 =?utf-8?B?NzVVQU1XQ3BJMFZKYTU5VUk0OGlhbHlZRlJLaEhJdGVCY3FZeUJ4UGV4N1Z0?=
 =?utf-8?B?YzNHZHFRbjQ0aXdBd2s3ZUJ4bG1NS1pXbHk4Ny9SaktSTjhMQ2I0YWlmbnZq?=
 =?utf-8?B?T2dPMnI0RHBZeW5GNWg1NVZmdnZMM2RuK0o5VGRPRjZWUnV2dkZQeE51QkpB?=
 =?utf-8?B?djkxSU9TbUlYekJyblMwOUVBcWVNbEJRU1ZYeC9UR2VXZGdZVkErdC9WdjhT?=
 =?utf-8?B?S3ZmUnVNNUtTeGpsRW5xdWxFZGZkZGd6d09JcitEOUJqN0xlOTB5RHJuTmxl?=
 =?utf-8?B?dXBaSFgva3JCWlhlZUhoTm1oN3RkQVdacEI1TWFvS3IxT3UwV0Z4M29VN1Q2?=
 =?utf-8?B?eWtjYzlKcFVNVkpGYmlrbzJHcldGVjc3SG42SGlYRVBnRVpSYVUyZ01mTW1p?=
 =?utf-8?B?alNxeGpPNmpVenN3V1lOUXJVUVhia1gyaENrWnYrQXhHUWFhRE9lQThZZDJY?=
 =?utf-8?B?dGlIUHlQM3V1ZlpSUjRRRUJNbFF4dE1BWHlqbzd2SzBkcnhuek1MdDhzOTRy?=
 =?utf-8?B?NG5VUGRtRVV6TUZBd1FUdTM0V0N6TWtPcVhKV0JBWmxPSWNtZlI5M3UvSWps?=
 =?utf-8?B?ZHgzeXlMTUQyZ1FEZ2gvSGhvTzduWlpST0NHMDFaVUhmWFZVVTdNOCtFa29z?=
 =?utf-8?B?cUZDWXVXY1E2THByaEVLY1c4Sm92UTk4RUt6VElGOGg4ckI2T29UcitqVGtq?=
 =?utf-8?B?UkVlMjhqd2ZvbHJ3ZmoyVXNVS05uQmU3Z0ZhWUlua1pxMktCMGI5RkpWdEpl?=
 =?utf-8?B?ODRnOXRWbmNwbkowenRBNC9Jdk95UGJvMEZxZ0d5MkRmNm84dXBLaFp6SkhR?=
 =?utf-8?B?WWNPdDZDangyZzRHdmJGeWt6cDNFSnFJZHVqMDdqRG1QeHFnS3ZmVExZSXo5?=
 =?utf-8?B?ZWJicFVKM1VCcVhya1dscjRacVlCc0VqRi9SOFlsSG55UmVXL1B2Z0Z5S1FL?=
 =?utf-8?B?cmgwbVBmU2UyUGlvTklZSDBpTEFBa2Rvc2VBVEFBcUY4UmZScmVrc2JjaGpK?=
 =?utf-8?B?ZGxDcTdnc2RVZ2dYTWkyQWpWellWSmhpaFJhdWR1Tk1ZS1QzU3VLUXhEdzdX?=
 =?utf-8?B?b0ZkeUpJZWswQWpEMFB0VndMNGtMdXZlNWU0aXJsNjhJakEzcEc3QUljdWdj?=
 =?utf-8?B?bDNkVkVqOENld3pBRC81WnhvQlR2YjBaUU5OTWJDVFpxWGZkYXl0cEl2TWlN?=
 =?utf-8?B?S2Nab0lSWU5FT05YN3lvd1JkUGwrSkNLK1kwSFVSekpIVTNiM2NPL3FmcWlQ?=
 =?utf-8?B?TDhVblduYkJaY1haT3h4eEQySUxQUGlUY1ZWNDdHbnFsY3U3Z25kc2dKd2dx?=
 =?utf-8?B?dXcwbG9sNjdqb2p3bm1zb3Z0bExRdnB5OTB1TEtrRGV2QkJ3TnlVL2RTeS81?=
 =?utf-8?B?NzRBYldVZ1hpQk94L0FodE0xVmVoSFJMbnZWeWlmNmUxcHhyK0dqMDN5a0du?=
 =?utf-8?B?N0Vqc2RRRXpGUDRiK1lUaWwvY3h2emhFOVlZbmdoSStkY3ZYUFV0c3Zhb0hR?=
 =?utf-8?B?U2lNdXY3UTFQL2RMVWxCd2RVS3owZm9hTm1KNkMzSU9reGJTK3JQOGJ6RjZO?=
 =?utf-8?B?R2VjNDJqUVEvdTgyRk5uaXBDaVlOdXlNNDdaQ1JRd253UzhyNFB0NXlsVUJW?=
 =?utf-8?B?U0RTaUJpc1hpSC9SOElLMlhLMFY2UEFUek9GY0N4cmx3YzNZTExGRjE4U0VP?=
 =?utf-8?B?UmVaOFVIRFZiZGhURGd3NEQrWS84OTJ5STE0OStOc2RPSW5vdUhKM0NvNVlG?=
 =?utf-8?B?OTVKaEYrbnRYUUhDT1JlNnhlTzRRNis2aGIrVlpyY3VDa09ienZuR1NxRGRV?=
 =?utf-8?B?NVhuZnNSWW4xZm83N2pTdUw5UG45SWNiS2pPc2ZzTFZaOEpjaHVPa3FlblV0?=
 =?utf-8?Q?RLK0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?STJieFNJVXNTN2ttT3VZbWxHKzgvNE4xMi80enl5QnZVTXNCMG13K1JPNzRh?=
 =?utf-8?B?cnY0cEN1bTAvSHZMQ2Nrc09VQjhZcXZHMFQ1bUxkU1pxT0dzMCtGVFRMdmhJ?=
 =?utf-8?B?R3NoL0VPNFpTdWZZNXA1ampmeXl2UzZ4OC9tK0ZIZTMwY2hjMkNoUWZzYSty?=
 =?utf-8?B?d2pIWUVSdUxyaFJTQk5zVklhazF6S2N0Y3FmZm5jU0paUzVIdjRlWnR4ZVI1?=
 =?utf-8?B?cm5IUUF5UThTYWdJamY1RmVHNUpVcjh2aUVGNkp5QTNEUGNHbkNXTCtUc1J1?=
 =?utf-8?B?SHZUOGIrbk5rRjZkcXE4azNLQlJHM0lGaVdvVC8xTWxDOWtIVGw5Tkxxd0xo?=
 =?utf-8?B?ZTF3cDUxc3BNZ1lvbitrUHJMaFNTMnczRkF6N2hLaEszMkFRQ2pNc2JkNTdI?=
 =?utf-8?B?UGtPYlIra0xOWHluNEluUXgvWE1zTzFYYkJqVS9pamp4dGk0MlV4dWxxcFh2?=
 =?utf-8?B?SEE5UWpBYVMxVzBzTG1JSXI3UTBVTDBiRHExdmN1VnlaUFJQK3Z5LytQcG5o?=
 =?utf-8?B?QnVtOURvSmFxRlVhU0pnb1IzZ3F4ZzdMcTdqMWpwOTc5TUxYUGkrRXI4Y0JQ?=
 =?utf-8?B?Ym8yS1pFUWQ0V1Z5ZlpmZDFUQlpsc1ZkeENVbnN0ajEyTjNPUVBpcFNseTNU?=
 =?utf-8?B?RTJEaU5KOWNUaUMxdTZQTXB0ZEpva3J0a1pOVDdzUTFPSFBiZzZJbjJYM2V0?=
 =?utf-8?B?YXZXOFl0V3hqbWlJcUpVemoyZjZSUk1nSzlUV2FJL21zeXBnOFV0VXR0NWhQ?=
 =?utf-8?B?V244aG5QaWJndU0yRVdOT1JHZlRUelZyUnR3SkVITmNjWTB1SkQwd0xnRUpY?=
 =?utf-8?B?empqNStXWUxLa09kcHhhR1pnckJtS2JuMEMrS0cyMHIxZDliZVN6MnY2dCti?=
 =?utf-8?B?cWVXRkFzREFRUUxRSDRCRU84ZlFGb25WZC80a1VnbnpJYy9wSUZqbkY2eUJn?=
 =?utf-8?B?WEUrZ3FzN2xMYzlxUXlTNExmZE13bjlOVTFQcWNlVzJNR1FpNXU3L2pCMDdG?=
 =?utf-8?B?bk1mandqL3hFdzlyN21BZVl1Sk45UUdkenVIS2wrdjJPZjBTQkovSW1PUGcv?=
 =?utf-8?B?Y1NrdjlnN2IyM2J6aWIyS0FFWUpiWEVhZlk2TE9ERFhQR3FzZ3A3ZHFCOVhW?=
 =?utf-8?B?Znptc0tvUmNqRXpwTG5DWEVBNGN3RFl0RHkvcG9LUS9yVFdnNmgrNGR3UnpU?=
 =?utf-8?B?bHpJOGNmLy82RG5oME56MFF0SkdTZGZ6SHlOMFJubmE3VlVEZldTNmZqWXNl?=
 =?utf-8?B?M3Uxd080ckJaWklyR0IwbGVnaUtPaVJyYjFjU0sxZGp6MHRhd2VEcTEza3Bz?=
 =?utf-8?B?TTlHaUhaQVlQc2xLcHh1VWhGZU12TmpQQ0ltU2M4Y0tVWWN3akNxRHA0Yng1?=
 =?utf-8?B?azZOR3dPbEtTclE1U3pRS1lRUThnTFpUeGRrWkdselRTZVkzN3VUN3k4Q3dH?=
 =?utf-8?B?bmlsaExvT3hvM3A2UW1wR20vWDI0aS82OVBBeGdJMHEreVFEcUVNR2RYeUhS?=
 =?utf-8?B?Umt3T3EvNXpqNkJlVzVpWW1lYW4xZkZNeWttZ2d2SS9xRDdHM0VvSTlNQTNL?=
 =?utf-8?B?blBMUzlxcE56cFd0ZFJlL0JRK01EM0dVZGZTWFh5d1NlQnp2NlVGM21sTXlF?=
 =?utf-8?B?TnVFZTJoYUFwcE41ZnhtbnJIUGFCRnVFc3BtZGgwQ1JMVk1OTlluc2ZtcElh?=
 =?utf-8?B?S3RkdTNuQnBsenNIVWFaRTdzcVIvRmo2cmFjVDVicmQwcnVsbnNvZ3JNa3B1?=
 =?utf-8?B?NlRiZTFmMjl0S2NxQkt6dnZLYU9zdFBPYUk4SW5XUFJLT2NFYVdCL1ZESnFQ?=
 =?utf-8?B?U1doQ2lITWhuYkV2ZHRtNmMzUkVOWUt6VnVJaTNCNENSS2JGMlFET3NiLzhP?=
 =?utf-8?B?L3FDRTBhYjZnYUlQWHltNjlaUGxJNkozMkp0TWpmRlJJMnNpR3NYeWdHSzBT?=
 =?utf-8?B?bjJvNXlDNWtFVmgzU2piOGxiVCtJRGlvNVp6Qk5WNWpyM3JYeFdZeGZqWW1H?=
 =?utf-8?B?bE9JUmt1V012QStSTU5KbUpEdG9VSUVLWGFmU0F0MnZlMmNWRllNSFM5QmJm?=
 =?utf-8?B?NTgvZmgxZ1VCc2I1YjZTenF2a0hOWEhYRjZDYjJVSW4reU54dW0xWjVidlNq?=
 =?utf-8?B?aVJrNGMvTFM4ZmRUdGZ3M2h5ekhRRE5BSXI4RWJBUHpTNzErbVpNUGJuNjd0?=
 =?utf-8?B?YmM2WXlhUXRjbXJqRkdJVXk4SjI0SC8xZHRETG80OGRMWlNCdWVTeGNRMnJD?=
 =?utf-8?B?RFFRbHRYSC8rZzFCWUVYakpzRXl4bFlZYkM3Y0xkSkhRQ1Uwa3dkNk1NQUhi?=
 =?utf-8?B?akdOMG5YMm11bjBJampwbFJSWFJldGxuZ1VrRjZNWUNsbklJYitiS2MyS29y?=
 =?utf-8?Q?6Z3PqMOl6LaVgrS7L9dLXkZ14zyUqerZnbdI7psNFPoVg?=
X-MS-Exchange-AntiSpam-MessageData-1: ni06XKuvyd3gUw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8273963-0de2-4054-ded6-08de621589c1
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 04:42:57.9239
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ExRfUOmvPzMSFbJRASfZwBz1WbKoN0QwHjlpvZVn5ovoxg2tRdL1Jr4itH4U2LwtYzoHPn6nUTd+ihZoI8YiQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7314

I2C devices with associated pinctrl states (DPAUX I2C controllers)
will change pinctrl state during runtime PM. This requires taking
a mutex, so these devices cannot be marked as IRQ safe.

Discovered through lockdep.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index bec619b9af4e..4eaeb395d5db 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -2047,8 +2047,11 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	 *
 	 * VI I2C device shouldn't be marked as IRQ-safe because VI I2C won't
 	 * be used for atomic transfers. ACPI device is not IRQ safe also.
+	 *
+	 * Devices with pinctrl states cannot be marked IRQ-safe as the pinctrl
+	 * state transitions during runtime PM require mutexes.
 	 */
-	if (!IS_VI(i2c_dev) && !has_acpi_companion(i2c_dev->dev))
+	if (!IS_VI(i2c_dev) && !has_acpi_companion(i2c_dev->dev) && !i2c_dev->dev->pins)
 		pm_runtime_irq_safe(i2c_dev->dev);
 
 	pm_runtime_enable(i2c_dev->dev);

---
base-commit: 4f938c7d3b25d87b356af4106c2682caf8c835a2
change-id: 20260202-i2c-dpaux-irqsafe-edc04628b401

