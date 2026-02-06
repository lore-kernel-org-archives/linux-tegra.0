Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010056.outbound.protection.outlook.com [52.101.46.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07F82248AF;
	Fri,  6 Feb 2026 03:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770347659; cv=fail; b=Fv+TkxdL+mLrUh8goIwcXOwWqK3bAlMKq9SA2aNszpwCd47u6tvWNDcW97/lkPTGm4K/edJHhhlY6IKfJl+ZTp/9H3hlf+FApd8aUbSAH9WkCpXyBZS2zEvUppUBq2BYBFPNcHz9Z+oIfZFJD0dGTbfI/bZF6OoxLWJ2b90E6bk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770347659; c=relaxed/simple;
	bh=pvON7CGMMCTbao7RihWlQ1qdjX9zL4nG+SBsA8XUBrY=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=IpMxHesFKCoqaWrSSLgV++NPlDW5hTLdud2tlXGtkh8tPgFHdb0Xh42yxFcEwYj3f4QtoZJ+NIjNdPIvEcFqD27oj7RPe8Elmz2cdgEOjRgEwwqbQ7n/MEaW/mXFTKFTOy8bD/BLK+y5F7Mlm0h+pWddFz0sJai9iFnQMQedeMM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=SWrPy/SQ; arc=fail smtp.client-ip=52.101.46.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="SWrPy/SQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RYaUwr5Ww5qwwX3rUozBIphpdO0pt9Bk+naz40TppuA+1a2TXjqSTzT79GpeGgXPmCsGGbbtrBnNJDz15gQiDVCZxDxP0IXKUonPz0VcoHC/6zsMUiVXoDyMdZztHWEMOewQRzyX7bNpuHz5XDOh+8wED5Qpj/91nskhjHcOZgk0u60ih1IjX1czsBDy9C3VexNJWrB4vBejWnnPUJh4tfhd8Td7CgbC2BP7/hKdbzrADD22MHcYyrkjBHQJaQbMj3rgLIyNoaHsohlZWdW9g4Nn2OBLUdKdmIVfw0HMDnJOH76qopCcgnOCv6T6iUvXCoIr1vtywOSL3AZPrjmCUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gA6N1x7ZG+kUCN3222UCdvdydPEJcc+zs16dWJkJj8s=;
 b=AYeP/Qr6Amud1LfakZcJW/e1+ZX3FGf51umDb2dErerNMdRqq+Dr+IBO1XZZTL3hX661VsJAMbWTFtHlol85ayTCp0mLsraw2HbzZ6vswCwBybffdFGXpYRSQSQWiAiG1l9bVJ4nAO2A2FQTDoLQRumoHAVzmPo5gvabHU/aJyJIuUZU7Lw1FYVUORjqjsmA9Ee2QX9xTP4bchp14wKLI6uFaWvU15NQk1VqxEOEHuZ6ayE/Uu6zWmuMPwN1Oyk+FpdaoxDxwjTSUOvIwJNDwQv769jmPksusUl8j1g1ZvyvixCssB9GF2jPGwB+ilLdv2g/YQXwAO/9mVZjOi0L6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gA6N1x7ZG+kUCN3222UCdvdydPEJcc+zs16dWJkJj8s=;
 b=SWrPy/SQJUlvbIXpVDhLaZq65SZbTbUfCQuNpV/11DvgnwTrFINij+Qzq9dpEbHdABJ6v8DqCyOwlbNBJ6FFJyFteSZ0AcszdNvt9iHzrGseAwoLKkwDubTFVhK/migP4duuIxslxAFKQycFeUSAExfKeJEnRbUeuc8JfC6rkmFiC4z/hvBAjrGxuPr9BoUNBVrnTEkUJV7nC4QElapx7eh+k/Mu7BdSS9smNVzvalvC9UFCXJWPqYVHVAvOpkDVawvlsitOQmnZ8XzJpK5oSDLUjONk00RlFb2yhvpIt5WXYP8+rLWS3F/OHm7Y5udceYyGkGMC6KQtC6lx6GMkWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by SN7PR12MB7786.namprd12.prod.outlook.com (2603:10b6:806:349::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Fri, 6 Feb
 2026 03:14:13 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%4]) with mapi id 15.20.9587.010; Fri, 6 Feb 2026
 03:14:13 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
Date: Fri, 06 Feb 2026 11:54:18 +0900
Subject: [PATCH] memory: tegra: Deduplicate rate request management code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260206-memory-refactor-v1-1-4385d439558a@nvidia.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWO0Q6CIBSGX8Wd63BAAuJa6z2aF4RHYwspMFdzv
 nukl99/9n//WSBhdJigKRaIOLvkwpiBHQqwdzMOSFyXGTjlknJ6JB59iF8SsTd2CpGIykhaa1N
 3tofceuaL+2zGa7tzxNc7i6c9hJtJSGzw3k1NMcuSaRKt+nc9pmS2yaY4bYuMS6apEqJUdaUEY
 cQ+TH5Ai8vgjXuU2XOGdl1/xbaUVMkAAAA=
X-Change-ID: 20260203-memory-refactor-54a6089a8dcf
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: Svyatoslav Ryhel <clamor95@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-tegra@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0087.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::18) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|SN7PR12MB7786:EE_
X-MS-Office365-Filtering-Correlation-Id: 4305a821-3158-416e-c360-08de652dcd23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|10070799003|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WEpWTWZCTkRVT054WVpLYzl3ZGtnajNxMVpUbU1qU2NxOUw2eGFBaHFINU9I?=
 =?utf-8?B?Y2VZRGFLRStkUlFIZVlFaGNxb0RPZUp1MmttR0wzZ2laTjhsaUlTbythR0pX?=
 =?utf-8?B?TDlnTXVPcVYxWnQra2kzNkd0RW40TEpsZmcwcmxMNU8vcy83a1BYd1lBUWF4?=
 =?utf-8?B?ejFJWkpCbHMzV09WemRKQlRpdkhjQ1I3UDYwL241cXV6VlJibGxVSFZIMzN2?=
 =?utf-8?B?OWxKd1NsZk1VUkRtR0xDZkNFdGhpcWVlYjlBb0FUQVZaTU9oZ054WE5xZjBC?=
 =?utf-8?B?Z1FNWUdaczIwcnJWUVZlMlE0Sm9zMzEyRzA2S0NBQ1lVMWxud1NjMDJheXBM?=
 =?utf-8?B?RVV2b0w3ME9VRGp4UTJGSmh1RlZPZjdHTlE5M0o5ZU9SaWVKdzBMR0JZNko4?=
 =?utf-8?B?OGMrNVoxdmsrZ1Z2dkhhbThhSW90ZFRWcUcyWWt3OUNpTkZvQ2Zmb1NKOThw?=
 =?utf-8?B?ako2ZjRsK0ZRbG5oRi80NmNzdlJEUWpYbDdKMWlGbVZVODQxc3hWNHNVdC8v?=
 =?utf-8?B?Mzk5bjd6VDVMUHE3NXZwZEZhM2FReGN2YjVuRUE2NmlWbjJlRE5tREExNXlk?=
 =?utf-8?B?aXFCQ0FvWGhOMVY2RnlkdmJJeElaV1BnaU9lM25BRmhXN3JNZGVYOUNsZVRk?=
 =?utf-8?B?Wm1WNkI3RkFPTzV1OE9Gdm15c1RpcTFkVEgrQkJUSVBqdzZVSng2OGtHVEc5?=
 =?utf-8?B?dHNuTm5KMVA0MnFVVndBcG9tbGd0SXpQOXJwRjc2a0Rza0prcUlBMnpQUlAw?=
 =?utf-8?B?WnRiZGtQQ1dwTXp6cnpOUXg5a3JEV1NTWnhvRStLR2MrdGVsMk0xd3NmOFRR?=
 =?utf-8?B?Um1pWGdRdVBpQ0dpUUxKTGNpQ2xSQkNjZ0d5VzNxTlpsN3UvcmErS29iRFpm?=
 =?utf-8?B?ZFhsbVQ2V0N1WFk2T1dCSWQwaEpLTkpoNmNoaEFIRk95aGJDbUw3OWlxT0ZS?=
 =?utf-8?B?cjdEMi8yR3FLaDE0RWFUUWZKd3ZWRkw0dnBtR3pmVWpWdDhGQ3ArUkhUYy9w?=
 =?utf-8?B?ZzJGcjNJRFU1RFdyeGVZVFZUWStTdlc1bmZKbVZ2Q0VWWVpINytjakx1Tnhq?=
 =?utf-8?B?ajBWanUxZklzYW5Sam5kTHNuOTJFQStHSm83QkpTb1R4azF3OEV2N1pscjBm?=
 =?utf-8?B?bDRseWpkejdyZWovZVRicUNRb1poLzhVbWJxSzVhU3JuQlhHaEpYWEhCS1M4?=
 =?utf-8?B?c25zZnZYazJJMlZIYVlwYUJaV3ZvaHI0anFYUUJvSU9TUEUxb210bktPdURT?=
 =?utf-8?B?d2FQa3V0NitxcXZXak5SYlVKYmFsMUdMejBLRjRlb3psVjBlejA2bGRtYkVY?=
 =?utf-8?B?b3lvZndCNk5heTkxWjRpQ2cvMEhXcGptZ3g4VDhFUXVWQ3ZlU0pMajhEUmlT?=
 =?utf-8?B?WE1UUXl0UmpzMGFYNDNBWGpJZVVCZXRnaFZKczgxb01tVnJMSFAvNEdJTGZE?=
 =?utf-8?B?eWZIQVI1T2pMcTM0eUhQbllORXZtWGtDWklEQWdPOXFMZlN0OHh4V0NFN3o0?=
 =?utf-8?B?bWFGdlA1Vmw3MFdvSU1BSmN0bHZQM0V6RDVPNVdkNzBoOGJoRHJjc3JSOENV?=
 =?utf-8?B?NnMzMzEzejNianVQaS8wUGJxaFVnUkUvYXUyTk9hN1RjZnUxNWxTdWdqSWYz?=
 =?utf-8?B?M2haS0FWTDk2eU1LSk1JcUo0SnZxREdtMGgwUmxuMUsxbHlKM0g3U0N1NlFn?=
 =?utf-8?B?MUI4NjFrYW0xamN3MzRXUWZ0WWk5NFczVTZtQXFzOVd2bXVHYWE1b2J4Ym9L?=
 =?utf-8?B?YVZZOTkrV1ZGa0hXSFMzVWtoeGtGNjdwM1NjUENUUmM5VGx0TnJIOCtKdG12?=
 =?utf-8?B?MW12TDc4Vmtpem4yQVF3WnFTdTBOWEdrc1ZXR250VUlyMFRhV051clNSck5r?=
 =?utf-8?B?N29SLzAzU2Y4Q3d6OEJ1S2Nyd2N6V0p6aFl1SjR5blBtSmoraEFld3NnNjUx?=
 =?utf-8?B?RWZyY2w0VDNYRnl3NlZZWExscFg3Q2UxaU14Qy9jUjZJOTBBNER4MnI1SVZT?=
 =?utf-8?B?RlNWcU1ZL2VGL1Z0T1BEaDlKZ2JFeVpNejlQZjVVTFpBWVN1akoySzdTK2Rr?=
 =?utf-8?B?S09ZaXpSUmo0b3RzenFNNUpzdytIYUZwOXJOOTZxdysvWXE3cUZ4QmtFVXlR?=
 =?utf-8?Q?25FA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b2pUSGZnUWpVY3ZJYTNhM1R4eEUwREpDTXlrSldrclpCek9GUkFnWXpyaG9i?=
 =?utf-8?B?OTY4aWgrYlpqOUFTaHFhODRKOSttT042WnMwcVZwcmlSK0JCa0xoenpCbE9i?=
 =?utf-8?B?Yy9xdzRtRGhlVnJEbmhncTRoczM0ZnZldk52Zk1WYmo5cEtxL3gzdXBBdDg3?=
 =?utf-8?B?T2hOcWwxVmhuUmJHTHJTQXdMRVYvemVzVXV4TnlTMnFMQkdHV0dXSnlxVXg1?=
 =?utf-8?B?OWpXKzdWaUNnU1U0QTVlV3RiclVCSXZxajNhV2NMRVQvRkNTbk4yNEgzZXYy?=
 =?utf-8?B?Y1RQc0FuRy9Nd1E1ODdYRWpQUGhuNzMzOVo4Umx3TGRHbmFYTWJhQUhWMUtO?=
 =?utf-8?B?QUVBZHBOTGNmc3BTZ1VrcmxoamdkNEVvSG1jbXdHZ2NKOVloWEFaR1pyYUFm?=
 =?utf-8?B?UkpFR1JBaDZNV0p1eGNxSzZwbnZEc2JKRk5SS3RIZm5oMmdiK28xR2xkUlYx?=
 =?utf-8?B?WjBUMEpnMTkvY3JhUkdNWk1na3ptWjIzcnN3THF4cDdzOUxDTFpTSXhIMnVH?=
 =?utf-8?B?TzdWKzlNaXdTQm1Ma214cElweXVUY3ptcFM3SHVJdGpWM09aNVJNbUxvSk94?=
 =?utf-8?B?cXRqZ1htWnZYMzJoeC9BUjJMVUpiYmYrZUM2cFJJWGU0U1doZkxZWTRPZE5U?=
 =?utf-8?B?MEFRU1l1VFIrSy9KNkMvQzJ5UXJNVmJ4NDlXYlpCa1lLazh5M0RUWWR2TmRG?=
 =?utf-8?B?cEZtakRia2RhWnJmTm1HMVRzZ1h1bGdPMGlLUVo3by9mZDd0dkJsMlFUS1h5?=
 =?utf-8?B?U0s4M25uVmJOYXRiTTJPb1dHMGlDNGczTTVzQlU0NW5MbytkTTNCbkd3NXpi?=
 =?utf-8?B?ZFhKVXZuY0xEekZaUk5CNFRsektBTWdoVGxTa2ltK3ZSMGlIL2xod2plVEJ0?=
 =?utf-8?B?VGtLZ3NwaFdMSFhjb21HMVF1OVFydGNQWHczVlFaNWorMHFpdUFqSUs5bnEy?=
 =?utf-8?B?TFBNZ0toRFV1M2M2TmU0RmYvdTFPMG53Rk1tRUZ5ZlJGNXlhUURtMXRTelVy?=
 =?utf-8?B?cExMNnFOR3lIc0h1V05WNG12WE92SkpjOVI4R3JsZGVwcm9zQURHYlRsaU9N?=
 =?utf-8?B?Lzh2UEVQN3VIR0h0TWxGNWtNaDJWMno2WEpteWhwdGJ2alhvNjhWZGZCdXNn?=
 =?utf-8?B?UVBYSVJjc0hxZktzeThsVlZMNWc2eWE0NVhvNHY2M21mQk4xM3EwRkRsVUNx?=
 =?utf-8?B?dGxDWDZLTVJPN1dtWVpoOTJndmhORVIyRUtKcTF0RHFTQmZpK0FUalRGR2g4?=
 =?utf-8?B?bG5KcTJVL0d5UTlHbzVMMzhvM1NYQ2o5dG8rK1hvVDlLUkpaYm05VTVSRWsy?=
 =?utf-8?B?enlmUU1vVWpPKzdvLzRLZzEySlM4Q3RVVnB2UGliZW0zTEpsR0txZnFFTGxv?=
 =?utf-8?B?L1h5OVBMSDVlV1lZcHU5UDFkYXN1V1F0eUN3c3JkQnRQN0pkNU4rRkh3Zndy?=
 =?utf-8?B?QjBHL3JIRTZndXRYRFI5UHRlYkZDTlBySDhuV29mRDEzVytQSFB0N2pXYUpO?=
 =?utf-8?B?SHNsK1RiVEdjTkk2a25xNlU3WCtzVFc1YzFjOWJhZ0hyTmFJN3VxWXpnamR6?=
 =?utf-8?B?NkxMY3FPV3Nvd3dLdzNEbXU1TFlrejQrY0Z3K3BrRGt6MFNjYjFoZ3NZSTNx?=
 =?utf-8?B?TTRNejdjVUZSdHUzdDh4S1JMLzg0QkU3Nmg4eE1iYVJIa1U5SFh5YitqZGRM?=
 =?utf-8?B?ZEMycFgrNnpFcWxSclVxTUVCTlVhZmtqQ1lhbzdTdG90MlFxQnlBc0RmaGor?=
 =?utf-8?B?eVRIWUhUSzlSRHVqN2NDamJTcWZOOTNsalFpc0daWWMwVlNFMUJNdG1jVnk1?=
 =?utf-8?B?MXEvN0QwRko3MzQ0SW9IdWdTZVkwTzROL004UmFiN2YxL1BJVDNQdElkZHVl?=
 =?utf-8?B?LzlSRDc3TUhnbEtjV3dYMDdhRGh3dS9XWjE2NTBuRnVkVmhsdncweWRkaDR0?=
 =?utf-8?B?MUV6SndheHR0ZGNEZkR0REpBZHNFYXNFMW4zamlGbnplaENBNkJpQVJDSHdr?=
 =?utf-8?B?K2VjRUYva29vM2d2a0x0QWtlem96YlBwSzJvUDFEcGVqYzYrbVlGTkkxL2ty?=
 =?utf-8?B?UFhSMUxRU3Q2bVlmcEhBc3hvRWY3UmpPcWN6M2p6UGNwQTIyVTlCdkQzbjBC?=
 =?utf-8?B?Uk9SVVhLcExaZmtERE1wd0kwK21zZlN5Y0w5UGdyb0RmVGJlVXVwRkx2T2Nr?=
 =?utf-8?B?Tjk3Zk9wY045TW42anJjOHNYWW82U3NzcWE2STNiOU9sb3dLekxJNjNoNkV3?=
 =?utf-8?B?M1NnVUVsMWJpQUliK2xYRzdUSjZibXBIa3lFeS9hdEpYUTl0ZXA2WmlyQUtF?=
 =?utf-8?B?V0hnSUtmUXc4M0FXb1lqY05EVndNVEVsTEc2MzdoUFpJeWtBUmtGR3ZPdzN5?=
 =?utf-8?Q?ILgozbC4S7iK9eVIhpbW9xMpnErz6fs0Hk9xMcNn3z3RH?=
X-MS-Exchange-AntiSpam-MessageData-1: ZtsZbW1+VnAXqA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4305a821-3158-416e-c360-08de652dcd23
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 03:14:12.5185
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cpoXSASndkqF5ZdcvJ/zb7/IgQXQTlkCmyCeA9o6HDmCu7hPtyo9KLECsm4sB/z9+DfNmchQXX3CSyNwXAfzig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7786

As is, the EMC drivers for each 32-bit platform contain almost
identical duplicated code for aggregating rate requests. Move this
code out to a shared tegra-emc-common file to reduce duplication.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
This patch is on top of 'memory: tegra: Add Tegra114 EMC driver'
---
 drivers/memory/tegra/Kconfig            |   7 ++
 drivers/memory/tegra/Makefile           |   1 +
 drivers/memory/tegra/tegra-emc-common.c |  96 ++++++++++++++++++++++++++++
 drivers/memory/tegra/tegra-emc-common.h |  38 +++++++++++
 drivers/memory/tegra/tegra114-emc.c     | 107 ++-----------------------------
 drivers/memory/tegra/tegra124-emc.c     | 107 ++-----------------------------
 drivers/memory/tegra/tegra20-emc.c      | 110 ++------------------------------
 drivers/memory/tegra/tegra30-emc.c      | 107 ++-----------------------------
 8 files changed, 167 insertions(+), 406 deletions(-)

diff --git a/drivers/memory/tegra/Kconfig b/drivers/memory/tegra/Kconfig
index 11e7cc357d39..aeda7f104d34 100644
--- a/drivers/memory/tegra/Kconfig
+++ b/drivers/memory/tegra/Kconfig
@@ -17,6 +17,7 @@ config TEGRA20_EMC
 	select DEVFREQ_GOV_SIMPLE_ONDEMAND
 	select PM_DEVFREQ
 	select DDR
+	select TEGRA_EMC_COMMON
 	help
 	  This driver is for the External Memory Controller (EMC) found on
 	  Tegra20 chips. The EMC controls the external DRAM on the board.
@@ -29,6 +30,7 @@ config TEGRA30_EMC
 	depends on ARCH_TEGRA_3x_SOC || COMPILE_TEST
 	select PM_OPP
 	select DDR
+	select TEGRA_EMC_COMMON
 	help
 	  This driver is for the External Memory Controller (EMC) found on
 	  Tegra30 chips. The EMC controls the external DRAM on the board.
@@ -41,6 +43,7 @@ config TEGRA114_EMC
 	depends on ARCH_TEGRA_114_SOC || COMPILE_TEST
 	select TEGRA124_CLK_EMC if ARCH_TEGRA
 	select PM_OPP
+	select TEGRA_EMC_COMMON
 	help
 	  This driver is for the External Memory Controller (EMC) found on
 	  Tegra114 chips. The EMC controls the external DRAM on the board.
@@ -53,6 +56,7 @@ config TEGRA124_EMC
 	depends on ARCH_TEGRA_124_SOC || COMPILE_TEST
 	select TEGRA124_CLK_EMC if ARCH_TEGRA
 	select PM_OPP
+	select TEGRA_EMC_COMMON
 	help
 	  This driver is for the External Memory Controller (EMC) found on
 	  Tegra124 chips. The EMC controls the external DRAM on the board.
@@ -73,4 +77,7 @@ config TEGRA210_EMC
 	  This driver is required to change memory timings / clock rate for
 	  external memory.
 
+config TEGRA_EMC_COMMON
+	tristate
+
 endif
diff --git a/drivers/memory/tegra/Makefile b/drivers/memory/tegra/Makefile
index 6b9156de4b66..28f22c957a34 100644
--- a/drivers/memory/tegra/Makefile
+++ b/drivers/memory/tegra/Makefile
@@ -14,6 +14,7 @@ tegra-mc-$(CONFIG_ARCH_TEGRA_264_SOC) += tegra186.o tegra264.o
 
 obj-$(CONFIG_TEGRA_MC) += tegra-mc.o
 
+obj-$(CONFIG_TEGRA_EMC_COMMON) += tegra-emc-common.o
 obj-$(CONFIG_TEGRA20_EMC)  += tegra20-emc.o
 obj-$(CONFIG_TEGRA30_EMC)  += tegra30-emc.o
 obj-$(CONFIG_TEGRA114_EMC) += tegra114-emc.o
diff --git a/drivers/memory/tegra/tegra-emc-common.c b/drivers/memory/tegra/tegra-emc-common.c
new file mode 100644
index 000000000000..9292472a5890
--- /dev/null
+++ b/drivers/memory/tegra/tegra-emc-common.c
@@ -0,0 +1,96 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/device.h>
+#include <linux/mutex.h>
+#include <linux/pm_opp.h>
+
+#include "tegra-emc-common.h"
+
+void tegra_emc_rate_requests_init(struct tegra_emc_rate_requests *reqs,
+				  struct device *dev)
+{
+	unsigned int i;
+
+	mutex_init(&reqs->rate_lock);
+	reqs->dev = dev;
+
+	for (i = 0; i < TEGRA_EMC_RATE_TYPE_MAX; i++) {
+		reqs->requested_rate[i].min_rate = 0;
+		reqs->requested_rate[i].max_rate = ULONG_MAX;
+	}
+}
+EXPORT_SYMBOL_GPL(tegra_emc_rate_requests_init);
+
+static int tegra_emc_request_rate(struct tegra_emc_rate_requests *reqs,
+				  unsigned long new_min_rate,
+				  unsigned long new_max_rate,
+				  enum tegra_emc_rate_request_type type)
+{
+	struct tegra_emc_rate_request *req = reqs->requested_rate;
+	unsigned long min_rate = 0, max_rate = ULONG_MAX;
+	unsigned int i;
+	int err;
+
+	/* select minimum and maximum rates among the requested rates */
+	for (i = 0; i < TEGRA_EMC_RATE_TYPE_MAX; i++, req++) {
+		if (i == type) {
+			min_rate = max(new_min_rate, min_rate);
+			max_rate = min(new_max_rate, max_rate);
+		} else {
+			min_rate = max(req->min_rate, min_rate);
+			max_rate = min(req->max_rate, max_rate);
+		}
+	}
+
+	if (min_rate > max_rate) {
+		dev_err_ratelimited(reqs->dev, "%s: type %u: out of range: %lu %lu\n",
+				    __func__, type, min_rate, max_rate);
+		return -ERANGE;
+	}
+
+	/*
+	 * EMC rate-changes should go via OPP API because it manages voltage
+	 * changes.
+	 */
+	err = dev_pm_opp_set_rate(reqs->dev, min_rate);
+	if (err)
+		return err;
+
+	reqs->requested_rate[type].min_rate = new_min_rate;
+	reqs->requested_rate[type].max_rate = new_max_rate;
+
+	return 0;
+}
+
+int tegra_emc_set_min_rate(struct tegra_emc_rate_requests *reqs,
+			   unsigned long rate,
+			   enum tegra_emc_rate_request_type type)
+{
+	struct tegra_emc_rate_request *req = &reqs->requested_rate[type];
+	int ret;
+
+	mutex_lock(&reqs->rate_lock);
+	ret = tegra_emc_request_rate(reqs, rate, req->max_rate, type);
+	mutex_unlock(&reqs->rate_lock);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(tegra_emc_set_min_rate);
+
+int tegra_emc_set_max_rate(struct tegra_emc_rate_requests *reqs,
+			   unsigned long rate,
+			   enum tegra_emc_rate_request_type type)
+{
+	struct tegra_emc_rate_request *req = &reqs->requested_rate[type];
+	int ret;
+
+	mutex_lock(&reqs->rate_lock);
+	ret = tegra_emc_request_rate(reqs, req->min_rate, rate, type);
+	mutex_unlock(&reqs->rate_lock);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(tegra_emc_set_max_rate);
+
+MODULE_DESCRIPTION("NVIDIA Tegra EMC common code");
+MODULE_LICENSE("GPL");
diff --git a/drivers/memory/tegra/tegra-emc-common.h b/drivers/memory/tegra/tegra-emc-common.h
new file mode 100644
index 000000000000..420ff574045c
--- /dev/null
+++ b/drivers/memory/tegra/tegra-emc-common.h
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef TEGRA_EMC_COMMON_H
+#define TEGRA_EMC_COMMON_H
+
+#include <linux/device.h>
+#include <linux/mutex.h>
+
+enum tegra_emc_rate_request_type {
+	TEGRA_EMC_RATE_DEVFREQ,
+	TEGRA_EMC_RATE_DEBUG,
+	TEGRA_EMC_RATE_ICC,
+	TEGRA_EMC_RATE_TYPE_MAX,
+};
+
+struct tegra_emc_rate_request {
+	unsigned long min_rate;
+	unsigned long max_rate;
+};
+
+struct tegra_emc_rate_requests {
+	struct tegra_emc_rate_request requested_rate[TEGRA_EMC_RATE_TYPE_MAX];
+	struct mutex rate_lock;
+	struct device *dev;
+};
+
+void tegra_emc_rate_requests_init(struct tegra_emc_rate_requests *reqs,
+				  struct device *dev);
+
+int tegra_emc_set_min_rate(struct tegra_emc_rate_requests *reqs,
+			   unsigned long rate,
+			   enum tegra_emc_rate_request_type type);
+
+int tegra_emc_set_max_rate(struct tegra_emc_rate_requests *reqs,
+			   unsigned long rate,
+			   enum tegra_emc_rate_request_type type);
+
+#endif /* TEGRA_EMC_COMMON_H */
diff --git a/drivers/memory/tegra/tegra114-emc.c b/drivers/memory/tegra/tegra114-emc.c
index 789b8e959a68..4fdc30e29488 100644
--- a/drivers/memory/tegra/tegra114-emc.c
+++ b/drivers/memory/tegra/tegra114-emc.c
@@ -32,6 +32,7 @@
 #include <soc/tegra/mc.h>
 
 #include "mc.h"
+#include "tegra-emc-common.h"
 
 #define EMC_INTSTATUS				0x0
 #define EMC_INTSTATUS_REFRESH_OVERFLOW		BIT(3)
@@ -392,17 +393,6 @@ struct emc_timing {
 	u32 emc_zcal_interval;
 };
 
-enum emc_rate_request_type {
-	EMC_RATE_DEBUG,
-	EMC_RATE_ICC,
-	EMC_RATE_TYPE_MAX,
-};
-
-struct emc_rate_request {
-	unsigned long min_rate;
-	unsigned long max_rate;
-};
-
 struct tegra_emc {
 	struct device *dev;
 	struct tegra_mc *mc;
@@ -425,14 +415,7 @@ struct tegra_emc {
 
 	struct icc_provider provider;
 
-	/*
-	 * There are multiple sources in the EMC driver which could request
-	 * a min/max clock rate, these rates are contained in this array.
-	 */
-	struct emc_rate_request requested_rate[EMC_RATE_TYPE_MAX];
-
-	/* protect shared rate-change code path */
-	struct mutex rate_lock;
+	struct tegra_emc_rate_requests reqs;
 };
 
 static irqreturn_t tegra_emc_isr(int irq, void *data)
@@ -995,83 +978,6 @@ tegra_emc_find_node_by_ram_code(struct device_node *node, u32 ram_code)
 	return NULL;
 }
 
-static void tegra_emc_rate_requests_init(struct tegra_emc *emc)
-{
-	unsigned int i;
-
-	for (i = 0; i < EMC_RATE_TYPE_MAX; i++) {
-		emc->requested_rate[i].min_rate = 0;
-		emc->requested_rate[i].max_rate = ULONG_MAX;
-	}
-}
-
-static int emc_request_rate(struct tegra_emc *emc,
-			    unsigned long new_min_rate,
-			    unsigned long new_max_rate,
-			    enum emc_rate_request_type type)
-{
-	struct emc_rate_request *req = emc->requested_rate;
-	unsigned long min_rate = 0, max_rate = ULONG_MAX;
-	unsigned int i;
-	int err;
-
-	/* select minimum and maximum rates among the requested rates */
-	for (i = 0; i < EMC_RATE_TYPE_MAX; i++, req++) {
-		if (i == type) {
-			min_rate = max(new_min_rate, min_rate);
-			max_rate = min(new_max_rate, max_rate);
-		} else {
-			min_rate = max(req->min_rate, min_rate);
-			max_rate = min(req->max_rate, max_rate);
-		}
-	}
-
-	if (min_rate > max_rate) {
-		dev_err_ratelimited(emc->dev, "%s: type %u: out of range: %lu %lu\n",
-				    __func__, type, min_rate, max_rate);
-		return -ERANGE;
-	}
-
-	/*
-	 * EMC rate-changes should go via OPP API because it manages voltage
-	 * changes.
-	 */
-	err = dev_pm_opp_set_rate(emc->dev, min_rate);
-	if (err)
-		return err;
-
-	emc->requested_rate[type].min_rate = new_min_rate;
-	emc->requested_rate[type].max_rate = new_max_rate;
-
-	return 0;
-}
-
-static int emc_set_min_rate(struct tegra_emc *emc, unsigned long rate,
-			    enum emc_rate_request_type type)
-{
-	struct emc_rate_request *req = &emc->requested_rate[type];
-	int ret;
-
-	mutex_lock(&emc->rate_lock);
-	ret = emc_request_rate(emc, rate, req->max_rate, type);
-	mutex_unlock(&emc->rate_lock);
-
-	return ret;
-}
-
-static int emc_set_max_rate(struct tegra_emc *emc, unsigned long rate,
-			    enum emc_rate_request_type type)
-{
-	struct emc_rate_request *req = &emc->requested_rate[type];
-	int ret;
-
-	mutex_lock(&emc->rate_lock);
-	ret = emc_request_rate(emc, req->min_rate, rate, type);
-	mutex_unlock(&emc->rate_lock);
-
-	return ret;
-}
-
 /*
  * debugfs interface
  *
@@ -1144,7 +1050,7 @@ static int tegra_emc_debug_min_rate_set(void *data, u64 rate)
 	if (!tegra_emc_validate_rate(emc, rate))
 		return -EINVAL;
 
-	err = emc_set_min_rate(emc, rate, EMC_RATE_DEBUG);
+	err = tegra_emc_set_min_rate(&emc->reqs, rate, TEGRA_EMC_RATE_DEBUG);
 	if (err < 0)
 		return err;
 
@@ -1174,7 +1080,7 @@ static int tegra_emc_debug_max_rate_set(void *data, u64 rate)
 	if (!tegra_emc_validate_rate(emc, rate))
 		return -EINVAL;
 
-	err = emc_set_max_rate(emc, rate, EMC_RATE_DEBUG);
+	err = tegra_emc_set_max_rate(&emc->reqs, rate, TEGRA_EMC_RATE_DEBUG);
 	if (err < 0)
 		return err;
 
@@ -1280,7 +1186,7 @@ static int emc_icc_set(struct icc_node *src, struct icc_node *dst)
 	do_div(rate, ddr * dram_data_bus_width_bytes);
 	rate = min_t(u64, rate, U32_MAX);
 
-	err = emc_set_min_rate(emc, rate, EMC_RATE_ICC);
+	err = tegra_emc_set_min_rate(&emc->reqs, rate, TEGRA_EMC_RATE_ICC);
 	if (err)
 		return err;
 
@@ -1357,7 +1263,6 @@ static int tegra_emc_probe(struct platform_device *pdev)
 	if (!emc)
 		return -ENOMEM;
 
-	mutex_init(&emc->rate_lock);
 	emc->dev = &pdev->dev;
 
 	emc->regs = devm_platform_ioremap_resource(pdev, 0);
@@ -1424,7 +1329,7 @@ static int tegra_emc_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
-	tegra_emc_rate_requests_init(emc);
+	tegra_emc_rate_requests_init(&emc->reqs, &pdev->dev);
 
 	if (IS_ENABLED(CONFIG_DEBUG_FS))
 		emc_debugfs_init(&pdev->dev, emc);
diff --git a/drivers/memory/tegra/tegra124-emc.c b/drivers/memory/tegra/tegra124-emc.c
index 9978ff911c47..04ca1f606d29 100644
--- a/drivers/memory/tegra/tegra124-emc.c
+++ b/drivers/memory/tegra/tegra124-emc.c
@@ -27,6 +27,7 @@
 #include <soc/tegra/mc.h>
 
 #include "mc.h"
+#include "tegra-emc-common.h"
 
 #define EMC_FBIO_CFG5				0x104
 #define	EMC_FBIO_CFG5_DRAM_TYPE_MASK		0x3
@@ -467,17 +468,6 @@ struct emc_timing {
 	u32 emc_zcal_interval;
 };
 
-enum emc_rate_request_type {
-	EMC_RATE_DEBUG,
-	EMC_RATE_ICC,
-	EMC_RATE_TYPE_MAX,
-};
-
-struct emc_rate_request {
-	unsigned long min_rate;
-	unsigned long max_rate;
-};
-
 struct tegra_emc {
 	struct device *dev;
 
@@ -503,14 +493,7 @@ struct tegra_emc {
 
 	struct icc_provider provider;
 
-	/*
-	 * There are multiple sources in the EMC driver which could request
-	 * a min/max clock rate, these rates are contained in this array.
-	 */
-	struct emc_rate_request requested_rate[EMC_RATE_TYPE_MAX];
-
-	/* protect shared rate-change code path */
-	struct mutex rate_lock;
+	struct tegra_emc_rate_requests reqs;
 };
 
 /* Timing change sequence functions */
@@ -1041,83 +1024,6 @@ tegra124_emc_find_node_by_ram_code(struct device_node *node, u32 ram_code)
 	return NULL;
 }
 
-static void tegra124_emc_rate_requests_init(struct tegra_emc *emc)
-{
-	unsigned int i;
-
-	for (i = 0; i < EMC_RATE_TYPE_MAX; i++) {
-		emc->requested_rate[i].min_rate = 0;
-		emc->requested_rate[i].max_rate = ULONG_MAX;
-	}
-}
-
-static int emc_request_rate(struct tegra_emc *emc,
-			    unsigned long new_min_rate,
-			    unsigned long new_max_rate,
-			    enum emc_rate_request_type type)
-{
-	struct emc_rate_request *req = emc->requested_rate;
-	unsigned long min_rate = 0, max_rate = ULONG_MAX;
-	unsigned int i;
-	int err;
-
-	/* select minimum and maximum rates among the requested rates */
-	for (i = 0; i < EMC_RATE_TYPE_MAX; i++, req++) {
-		if (i == type) {
-			min_rate = max(new_min_rate, min_rate);
-			max_rate = min(new_max_rate, max_rate);
-		} else {
-			min_rate = max(req->min_rate, min_rate);
-			max_rate = min(req->max_rate, max_rate);
-		}
-	}
-
-	if (min_rate > max_rate) {
-		dev_err_ratelimited(emc->dev, "%s: type %u: out of range: %lu %lu\n",
-				    __func__, type, min_rate, max_rate);
-		return -ERANGE;
-	}
-
-	/*
-	 * EMC rate-changes should go via OPP API because it manages voltage
-	 * changes.
-	 */
-	err = dev_pm_opp_set_rate(emc->dev, min_rate);
-	if (err)
-		return err;
-
-	emc->requested_rate[type].min_rate = new_min_rate;
-	emc->requested_rate[type].max_rate = new_max_rate;
-
-	return 0;
-}
-
-static int emc_set_min_rate(struct tegra_emc *emc, unsigned long rate,
-			    enum emc_rate_request_type type)
-{
-	struct emc_rate_request *req = &emc->requested_rate[type];
-	int ret;
-
-	mutex_lock(&emc->rate_lock);
-	ret = emc_request_rate(emc, rate, req->max_rate, type);
-	mutex_unlock(&emc->rate_lock);
-
-	return ret;
-}
-
-static int emc_set_max_rate(struct tegra_emc *emc, unsigned long rate,
-			    enum emc_rate_request_type type)
-{
-	struct emc_rate_request *req = &emc->requested_rate[type];
-	int ret;
-
-	mutex_lock(&emc->rate_lock);
-	ret = emc_request_rate(emc, req->min_rate, rate, type);
-	mutex_unlock(&emc->rate_lock);
-
-	return ret;
-}
-
 /*
  * debugfs interface
  *
@@ -1190,7 +1096,7 @@ static int tegra124_emc_debug_min_rate_set(void *data, u64 rate)
 	if (!tegra124_emc_validate_rate(emc, rate))
 		return -EINVAL;
 
-	err = emc_set_min_rate(emc, rate, EMC_RATE_DEBUG);
+	err = tegra_emc_set_min_rate(&emc->reqs, rate, TEGRA_EMC_RATE_DEBUG);
 	if (err < 0)
 		return err;
 
@@ -1220,7 +1126,7 @@ static int tegra124_emc_debug_max_rate_set(void *data, u64 rate)
 	if (!tegra124_emc_validate_rate(emc, rate))
 		return -EINVAL;
 
-	err = emc_set_max_rate(emc, rate, EMC_RATE_DEBUG);
+	err = tegra_emc_set_max_rate(&emc->reqs, rate, TEGRA_EMC_RATE_DEBUG);
 	if (err < 0)
 		return err;
 
@@ -1327,7 +1233,7 @@ static int emc_icc_set(struct icc_node *src, struct icc_node *dst)
 	do_div(rate, ddr * dram_data_bus_width_bytes);
 	rate = min_t(u64, rate, U32_MAX);
 
-	err = emc_set_min_rate(emc, rate, EMC_RATE_ICC);
+	err = tegra_emc_set_min_rate(&emc->reqs, rate, TEGRA_EMC_RATE_ICC);
 	if (err)
 		return err;
 
@@ -1441,7 +1347,6 @@ static int tegra124_emc_probe(struct platform_device *pdev)
 	if (!emc)
 		return -ENOMEM;
 
-	mutex_init(&emc->rate_lock);
 	emc->dev = &pdev->dev;
 
 	emc->regs = devm_platform_ioremap_resource(pdev, 0);
@@ -1487,7 +1392,7 @@ static int tegra124_emc_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
-	tegra124_emc_rate_requests_init(emc);
+	tegra_emc_rate_requests_init(&emc->reqs, &pdev->dev);
 
 	if (IS_ENABLED(CONFIG_DEBUG_FS))
 		emc_debugfs_init(&pdev->dev, emc);
diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/tegra20-emc.c
index 398cb8ae2e38..1fd59f49242b 100644
--- a/drivers/memory/tegra/tegra20-emc.c
+++ b/drivers/memory/tegra/tegra20-emc.c
@@ -32,6 +32,7 @@
 #include "../of_memory.h"
 
 #include "mc.h"
+#include "tegra-emc-common.h"
 
 #define EMC_INTSTATUS				0x000
 #define EMC_INTMASK				0x004
@@ -182,18 +183,6 @@ struct emc_timing {
 	u32 data[ARRAY_SIZE(emc_timing_registers)];
 };
 
-enum emc_rate_request_type {
-	EMC_RATE_DEVFREQ,
-	EMC_RATE_DEBUG,
-	EMC_RATE_ICC,
-	EMC_RATE_TYPE_MAX,
-};
-
-struct emc_rate_request {
-	unsigned long min_rate;
-	unsigned long max_rate;
-};
-
 struct tegra_emc {
 	struct device *dev;
 	struct tegra_mc *mc;
@@ -212,14 +201,7 @@ struct tegra_emc {
 		unsigned long max_rate;
 	} debugfs;
 
-	/*
-	 * There are multiple sources in the EMC driver which could request
-	 * a min/max clock rate, these rates are contained in this array.
-	 */
-	struct emc_rate_request requested_rate[EMC_RATE_TYPE_MAX];
-
-	/* protect shared rate-change code path */
-	struct mutex rate_lock;
+	struct tegra_emc_rate_requests reqs;
 
 	struct devfreq_simple_ondemand_data ondemand_data;
 
@@ -710,83 +692,6 @@ static long emc_round_rate(unsigned long rate,
 	return timing->rate;
 }
 
-static void tegra20_emc_rate_requests_init(struct tegra_emc *emc)
-{
-	unsigned int i;
-
-	for (i = 0; i < EMC_RATE_TYPE_MAX; i++) {
-		emc->requested_rate[i].min_rate = 0;
-		emc->requested_rate[i].max_rate = ULONG_MAX;
-	}
-}
-
-static int emc_request_rate(struct tegra_emc *emc,
-			    unsigned long new_min_rate,
-			    unsigned long new_max_rate,
-			    enum emc_rate_request_type type)
-{
-	struct emc_rate_request *req = emc->requested_rate;
-	unsigned long min_rate = 0, max_rate = ULONG_MAX;
-	unsigned int i;
-	int err;
-
-	/* select minimum and maximum rates among the requested rates */
-	for (i = 0; i < EMC_RATE_TYPE_MAX; i++, req++) {
-		if (i == type) {
-			min_rate = max(new_min_rate, min_rate);
-			max_rate = min(new_max_rate, max_rate);
-		} else {
-			min_rate = max(req->min_rate, min_rate);
-			max_rate = min(req->max_rate, max_rate);
-		}
-	}
-
-	if (min_rate > max_rate) {
-		dev_err_ratelimited(emc->dev, "%s: type %u: out of range: %lu %lu\n",
-				    __func__, type, min_rate, max_rate);
-		return -ERANGE;
-	}
-
-	/*
-	 * EMC rate-changes should go via OPP API because it manages voltage
-	 * changes.
-	 */
-	err = dev_pm_opp_set_rate(emc->dev, min_rate);
-	if (err)
-		return err;
-
-	emc->requested_rate[type].min_rate = new_min_rate;
-	emc->requested_rate[type].max_rate = new_max_rate;
-
-	return 0;
-}
-
-static int emc_set_min_rate(struct tegra_emc *emc, unsigned long rate,
-			    enum emc_rate_request_type type)
-{
-	struct emc_rate_request *req = &emc->requested_rate[type];
-	int ret;
-
-	mutex_lock(&emc->rate_lock);
-	ret = emc_request_rate(emc, rate, req->max_rate, type);
-	mutex_unlock(&emc->rate_lock);
-
-	return ret;
-}
-
-static int emc_set_max_rate(struct tegra_emc *emc, unsigned long rate,
-			    enum emc_rate_request_type type)
-{
-	struct emc_rate_request *req = &emc->requested_rate[type];
-	int ret;
-
-	mutex_lock(&emc->rate_lock);
-	ret = emc_request_rate(emc, req->min_rate, rate, type);
-	mutex_unlock(&emc->rate_lock);
-
-	return ret;
-}
-
 /*
  * debugfs interface
  *
@@ -857,7 +762,7 @@ static int tegra20_emc_debug_min_rate_set(void *data, u64 rate)
 	if (!tegra20_emc_validate_rate(emc, rate))
 		return -EINVAL;
 
-	err = emc_set_min_rate(emc, rate, EMC_RATE_DEBUG);
+	err = tegra_emc_set_min_rate(&emc->reqs, rate, TEGRA_EMC_RATE_DEBUG);
 	if (err < 0)
 		return err;
 
@@ -887,7 +792,7 @@ static int tegra20_emc_debug_max_rate_set(void *data, u64 rate)
 	if (!tegra20_emc_validate_rate(emc, rate))
 		return -EINVAL;
 
-	err = emc_set_max_rate(emc, rate, EMC_RATE_DEBUG);
+	err = tegra_emc_set_max_rate(&emc->reqs, rate, TEGRA_EMC_RATE_DEBUG);
 	if (err < 0)
 		return err;
 
@@ -993,7 +898,7 @@ static int emc_icc_set(struct icc_node *src, struct icc_node *dst)
 	do_div(rate, dram_data_bus_width_bytes);
 	rate = min_t(u64, rate, U32_MAX);
 
-	err = emc_set_min_rate(emc, rate, EMC_RATE_ICC);
+	err = tegra_emc_set_min_rate(&emc->reqs, rate, TEGRA_EMC_RATE_ICC);
 	if (err)
 		return err;
 
@@ -1111,7 +1016,7 @@ static int tegra20_emc_devfreq_target(struct device *dev, unsigned long *freq,
 	rate = dev_pm_opp_get_freq(opp);
 	dev_pm_opp_put(opp);
 
-	return emc_set_min_rate(emc, rate, EMC_RATE_DEVFREQ);
+	return tegra_emc_set_min_rate(&emc->reqs, rate, TEGRA_EMC_RATE_DEVFREQ);
 }
 
 static int tegra20_emc_devfreq_get_dev_status(struct device *dev,
@@ -1190,7 +1095,6 @@ static int tegra20_emc_probe(struct platform_device *pdev)
 	if (!emc)
 		return -ENOMEM;
 
-	mutex_init(&emc->rate_lock);
 	emc->clk_nb.notifier_call = tegra20_emc_clk_change_notify;
 	emc->dev = &pdev->dev;
 
@@ -1228,7 +1132,7 @@ static int tegra20_emc_probe(struct platform_device *pdev)
 		return err;
 
 	platform_set_drvdata(pdev, emc);
-	tegra20_emc_rate_requests_init(emc);
+	tegra_emc_rate_requests_init(&emc->reqs, &pdev->dev);
 	tegra20_emc_debugfs_init(emc);
 	tegra20_emc_interconnect_init(emc);
 	tegra20_emc_devfreq_init(emc);
diff --git a/drivers/memory/tegra/tegra30-emc.c b/drivers/memory/tegra/tegra30-emc.c
index 914116d8ec16..93aeef65b9d4 100644
--- a/drivers/memory/tegra/tegra30-emc.c
+++ b/drivers/memory/tegra/tegra30-emc.c
@@ -36,6 +36,7 @@
 #include "../of_memory.h"
 
 #include "mc.h"
+#include "tegra-emc-common.h"
 
 #define EMC_INTSTATUS				0x000
 #define EMC_INTMASK				0x004
@@ -341,17 +342,6 @@ struct emc_timing {
 	bool emc_cfg_dyn_self_ref;
 };
 
-enum emc_rate_request_type {
-	EMC_RATE_DEBUG,
-	EMC_RATE_ICC,
-	EMC_RATE_TYPE_MAX,
-};
-
-struct emc_rate_request {
-	unsigned long min_rate;
-	unsigned long max_rate;
-};
-
 struct tegra_emc {
 	struct device *dev;
 	struct tegra_mc *mc;
@@ -383,14 +373,7 @@ struct tegra_emc {
 		unsigned long max_rate;
 	} debugfs;
 
-	/*
-	 * There are multiple sources in the EMC driver which could request
-	 * a min/max clock rate, these rates are contained in this array.
-	 */
-	struct emc_rate_request requested_rate[EMC_RATE_TYPE_MAX];
-
-	/* protect shared rate-change code path */
-	struct mutex rate_lock;
+	struct tegra_emc_rate_requests reqs;
 
 	bool mrr_error;
 };
@@ -1228,83 +1211,6 @@ static long emc_round_rate(unsigned long rate,
 	return timing->rate;
 }
 
-static void tegra30_emc_rate_requests_init(struct tegra_emc *emc)
-{
-	unsigned int i;
-
-	for (i = 0; i < EMC_RATE_TYPE_MAX; i++) {
-		emc->requested_rate[i].min_rate = 0;
-		emc->requested_rate[i].max_rate = ULONG_MAX;
-	}
-}
-
-static int emc_request_rate(struct tegra_emc *emc,
-			    unsigned long new_min_rate,
-			    unsigned long new_max_rate,
-			    enum emc_rate_request_type type)
-{
-	struct emc_rate_request *req = emc->requested_rate;
-	unsigned long min_rate = 0, max_rate = ULONG_MAX;
-	unsigned int i;
-	int err;
-
-	/* select minimum and maximum rates among the requested rates */
-	for (i = 0; i < EMC_RATE_TYPE_MAX; i++, req++) {
-		if (i == type) {
-			min_rate = max(new_min_rate, min_rate);
-			max_rate = min(new_max_rate, max_rate);
-		} else {
-			min_rate = max(req->min_rate, min_rate);
-			max_rate = min(req->max_rate, max_rate);
-		}
-	}
-
-	if (min_rate > max_rate) {
-		dev_err_ratelimited(emc->dev, "%s: type %u: out of range: %lu %lu\n",
-				    __func__, type, min_rate, max_rate);
-		return -ERANGE;
-	}
-
-	/*
-	 * EMC rate-changes should go via OPP API because it manages voltage
-	 * changes.
-	 */
-	err = dev_pm_opp_set_rate(emc->dev, min_rate);
-	if (err)
-		return err;
-
-	emc->requested_rate[type].min_rate = new_min_rate;
-	emc->requested_rate[type].max_rate = new_max_rate;
-
-	return 0;
-}
-
-static int emc_set_min_rate(struct tegra_emc *emc, unsigned long rate,
-			    enum emc_rate_request_type type)
-{
-	struct emc_rate_request *req = &emc->requested_rate[type];
-	int ret;
-
-	mutex_lock(&emc->rate_lock);
-	ret = emc_request_rate(emc, rate, req->max_rate, type);
-	mutex_unlock(&emc->rate_lock);
-
-	return ret;
-}
-
-static int emc_set_max_rate(struct tegra_emc *emc, unsigned long rate,
-			    enum emc_rate_request_type type)
-{
-	struct emc_rate_request *req = &emc->requested_rate[type];
-	int ret;
-
-	mutex_lock(&emc->rate_lock);
-	ret = emc_request_rate(emc, req->min_rate, rate, type);
-	mutex_unlock(&emc->rate_lock);
-
-	return ret;
-}
-
 /*
  * debugfs interface
  *
@@ -1375,7 +1281,7 @@ static int tegra30_emc_debug_min_rate_set(void *data, u64 rate)
 	if (!tegra30_emc_validate_rate(emc, rate))
 		return -EINVAL;
 
-	err = emc_set_min_rate(emc, rate, EMC_RATE_DEBUG);
+	err = tegra_emc_set_min_rate(&emc->reqs, rate, TEGRA_EMC_RATE_DEBUG);
 	if (err < 0)
 		return err;
 
@@ -1405,7 +1311,7 @@ static int tegra30_emc_debug_max_rate_set(void *data, u64 rate)
 	if (!tegra30_emc_validate_rate(emc, rate))
 		return -EINVAL;
 
-	err = emc_set_max_rate(emc, rate, EMC_RATE_DEBUG);
+	err = tegra_emc_set_max_rate(&emc->reqs, rate, TEGRA_EMC_RATE_DEBUG);
 	if (err < 0)
 		return err;
 
@@ -1511,7 +1417,7 @@ static int emc_icc_set(struct icc_node *src, struct icc_node *dst)
 	do_div(rate, ddr * dram_data_bus_width_bytes);
 	rate = min_t(u64, rate, U32_MAX);
 
-	err = emc_set_min_rate(emc, rate, EMC_RATE_ICC);
+	err = tegra_emc_set_min_rate(&emc->reqs, rate, TEGRA_EMC_RATE_ICC);
 	if (err)
 		return err;
 
@@ -1622,7 +1528,6 @@ static int tegra30_emc_probe(struct platform_device *pdev)
 	if (IS_ERR(emc->mc))
 		return PTR_ERR(emc->mc);
 
-	mutex_init(&emc->rate_lock);
 	emc->clk_nb.notifier_call = emc_clk_change_notify;
 	emc->dev = &pdev->dev;
 
@@ -1664,7 +1569,7 @@ static int tegra30_emc_probe(struct platform_device *pdev)
 		return err;
 
 	platform_set_drvdata(pdev, emc);
-	tegra30_emc_rate_requests_init(emc);
+	tegra_emc_rate_requests_init(&emc->reqs, &pdev->dev);
 	tegra30_emc_debugfs_init(emc);
 	tegra30_emc_interconnect_init(emc);
 

---
base-commit: ed4cdcc0b03e72cfdffbff9f0ea24338517bc893
change-id: 20260203-memory-refactor-54a6089a8dcf
prerequisite-message-id: <20260126190755.78475-1-clamor95@gmail.com>
prerequisite-patch-id: d0cc6cf04447264ce099226c9157f1def25df716
prerequisite-patch-id: c57efa588876ea5cf00ea0f28f814ec818bbea58
prerequisite-patch-id: cddf792516ed7582a3cc20eb00ae7745969ff984
prerequisite-patch-id: 9e7e9d889caed5b5deeb60e03b233ffcb0f25724
prerequisite-patch-id: 90ba18fe5154b59da1c7b2db058e93c9f007854e

