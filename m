Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795142893;
	b=vKzO4tD4qZjQFa99q0k1tzzht3LOg5CKGWBsTZwTyBfign4PSq0V/MRAr6l0yKCDhLKC
	 iNh4AO0+xfT1HMRowtUwR6BCu9XAw44rbFqZ59m5NUA+sJiQjxUKnmjspEgGZXoVXKeNH
	 pl8knqLmb3g3Bt2kFfrc8IboWYZL3C9o9Ixala/0npsvTt0rmmDTuIZj2o5ZMPU8/vxzR
	 Zw6o/tdqWOuGNx7hZABT3zdzDyg71nq077wFeJdaBqQJGSX0N6/SSsOj3LWFT3kUYkmxM
	 Dj2Izbh9UP7dNO1diWOZINmnfk8cZaGoRV5Zrfp+i6S81W3DY75o4diBoeSSjziLHww==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795142893;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:Content-Transfer-Encoding:
	 Content-Type:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-AntiSpam-MessageData-1:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=qqAOgzNmsCSfqryQinKzSeKX+TX3+ksV2z2gF6CMNCk=;
	b=PNmcjorNp0BH50lnkV0j99SMDVunci/lE4qYOcGq8hnEOyUAen5HS4ryOyqqJfubd7lO
	 p+WOSWCr204n49+Ostfe6o0afLl5nFD5mDtX4GDNlXw+HUVx1ANLck3LnHXJyVTHYfhRK
	 VWd9GJAzJrtaxnj3gqtnb7YUa72jyWkSJprkK5VmFlso+AhpcIE5aBToIdHTOl5yQ1k+D
	 3ehj3rftWTzi0L1ACQzURRAMIsM9J/Rlc7oRzAGF3nhxld+KyW8R1JiWwa1ua+hVicn6D
	 jbyP/rXyZPDGthbWEGJ1zxdy0VnylYHphjDKSgqH4Z4XQOYR6sfrxF3PXRiInz/bFvA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=aM344snd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.52
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011052.outbound.protection.outlook.com [52.101.52.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E50606A320;
	Fri, 20 Nov 2026 02:48:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1E50606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=aM344snd
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iyB/xp9w1Bog+x9O6RzGVDXUCBgWy+zJrN4Z9eriBlY7ByRDlQf02/SE+yfY1rWrnp0aXwhkX/EH8udN8eiDS5BAYxNobvAWUOPhoZnZvFBiq9GIwQOnmXN6HnocIaxuXo8wRWmuYBHV9lgQtjMVHuTEcshGPDekj9hi207XOJSXh67BjshcTW49Tn9PtvSV0sY/aG+nY1MP8Tb5Je3Lk/y5qHbzCTgas2bEJG1+sZ2fE2frl1GDIVYfy55cFvhRHR2GE9FnELlhMbSPfWcogeS2I3oomFQ3HtrmL6p39VEKgn3H6QNA4Npr/DKu31tTxgAgKkBueKRe6x8dmDpASQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qqAOgzNmsCSfqryQinKzSeKX+TX3+ksV2z2gF6CMNCk=;
 b=tADPWNXbA5abQO1S3/WhtWL3Tn4vUyOiMl8OwsfsYx05YUe+CCgAx+zS2YL5AgTPFS+Q7Op6oLeF3wgzfcBX24gLr+eleT6s4YZf2mnQM4k1vTxMUGyHzDztfzNyE7GlwkUXFqatslOCavLa3Q9qa5mJQ4MjCQsMs2xf3IRr1OBuSHANodzv6mb4lPydhiwOaa6dxq8IK4DdGyJlBf48b7eped8hXqvW29FOzSYA2s8o1+7OsKy7P7jwY7gdRQrNnGaerToHQKVADnNmUVFSE5d3VuFE6XFQZLBKB++YWCbPrM4LQVLrjagSV06fq3hMshb+mBiOn9Ot6/oauvEI7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qqAOgzNmsCSfqryQinKzSeKX+TX3+ksV2z2gF6CMNCk=;
 b=aM344sndFGDtveQR/LFVLY1puyuej8YOU6a4mvLQOGOqD7PP/ospz3VNs9KuafR/o1j97d8WrN5mwG12/mf749kfCAPpmheaCAOtDDV0vuzxwGiOFToyz8IqLvNaUmU96uoODvPb4o4ndnrnvmRzaqo8L4bvlXo8+8bHWynfu/SA20H2Hm54Cp0Yf1EAfz68tJZ6KMf7vJEK8HtKZMXzU8ocMjSHbKGmtNRtH/Xk/9cRkYPSCvA/fWyWCpUv/S48KFT8nFVbHWlF418c0u4aw1GYCxrpZ48m+v/XUrg3xcl+QjyHitstW4Y1DwxIvjsIHb0007ECqESFPa7MNNNDFQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by IA4PR12MB9809.namprd12.prod.outlook.com (2603:10b6:208:54f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Fri, 20 Nov
 2026 02:48:09 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%5]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 02:48:09 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Cc: Austin Schuh <austin.linux@gmail.com>, Aniruddha Rao <anrao@nvidia.com>,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 Austin Schuh <austin.linux@gmail.com>
Subject:
 Re: [PATCH v3] firmware: tegra: bpmp: populate debugfs in the background
Date: Fri, 20 Nov 2026 11:48:05 +0900
Message-ID: <5_ik4HOeQzCUNLN6ib_iaA@nvidia.com>
In-Reply-To: <20261103061125.3825178-1-austin.linux@gmail.com>
References: <20261103061125.3825178-1-austin.linux@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCP286CA0351.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::20) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|IA4PR12MB9809:EE_
X-MS-Office365-Filtering-Correlation-Id: 005d6c3e-6e3f-41ee-d465-08df46b0b60f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|23010399003|1800799024|376014|366016|22082099003|18002099003|6133799003|261009223027099003|11063799006|5023799004|56012099006|261028144727099003|261102123227099003|261026140227099003|261026121527099003|261021121427099003|261022105027099003|261021123027099003|261022075727099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	vYE1nzgetmm/UP+yY0/KHDMwAe4qIN45CO1EA789+N3V9hJ2uIjX8jLjab7g/qFqXxhi7zmKO0VDBmBLSSpaf9rzyyGXlXx+S+J7/NMTQDdrsnHYlA8VX9OOjhuTcFRxECfI4ZJ7oiVQBlgmcqCSA/kN+Et9RiWa0bbOSazNXQFqhalTkVUGxGqMPpnMAVSWuSSif/+kuSM/LXLMnXA/a+HCq6BchL8FNsFY66GVg1D5oduYHygyNOS/tGIMamw9reAd7PIlKJnH/Ssh4fCpW6UPbuWx4zDeT7AJ875IAH7yUSXAgKcodZhuV7UJ/ULrqqnNnEOypdngcCYEBieE5r95fsxP7inUEkes6S5I7owldN8B7+P9stZErxm2/WyKJ0v5vnRCXmMCcsSv3Yb8olu7ZZdtrrHlOxR793+f2Yli/JckYd/KG0UGjUdzIkIY6H/Qd52f2k2dB2hCZcVEUWiXKvq8V/IGDvszVD2aVZgj5tGTHtrmv6EwwQEjBtDj22qbkunITls7gTFjwpra4wczplin92RyBl63Lf2ENNGNgtddl+6tKV40zNsnmGNnCBlQrVLtlX0VWjmemdGLF4e/JPDPSwQzwvIzCLbWtjxFNcc5BJ1VrNl7YtnIURile6xa0/f338eMuOAliQfvmz3i3vqARCVjAtZV6S57ooY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(1800799024)(376014)(366016)(22082099003)(18002099003)(6133799003)(261009223027099003)(11063799006)(5023799004)(56012099006)(261028144727099003)(261102123227099003)(261026140227099003)(261026121527099003)(261021121427099003)(261022105027099003)(261021123027099003)(261022075727099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RUZpdWhRZzZqZDZabm1CTWVsaXV2akozb1ZHY0ZhNERKVG84aWZrVWRmcmEx?=
 =?utf-8?B?ZmpUdWQ1dmJUL3V3TG5VbHgzS2pncHUwZWg5R2QxS0c2QlpVenJkeENCdjlu?=
 =?utf-8?B?QnJSTGZ4OGZjNFBaTWpLbjBvNTc2cktBL204RVdteklxcmF6aUkxQ0hkcGd3?=
 =?utf-8?B?Q2R1Qmx5L00xa2xIaGZicGNYcW5mTGJ6ajlOQ3lMTDJNcmV3RXpnWkZ3MWlt?=
 =?utf-8?B?czZwOEkrRDUrZXlHeVM0SEl2ODhDSGdMbmw2NjljTFJrYUMvZk5zNHVlWEJt?=
 =?utf-8?B?QXpJbU9aSktpa2QvdFY5cmZMbHo2ZzNucWF3aGtENVZ2YWdiMzJoOFRxSnlE?=
 =?utf-8?B?N1BKRzRza0s5VWxTY3J6WTNGVjB1bDArOGlidUI5c0lVTXplV2FJNEIyQzhZ?=
 =?utf-8?B?MW5RYlk2QXl1L3ZYenZwemNZUmtMZG9BYi9vUzNPMWYyY2ZyaFA5KzA5NVVG?=
 =?utf-8?B?UHNzcXZZS0c5ZlM3OHZ0WWM1c1M4bmZSSWxPcVM5bkRUMUtYMGtURUhQaldB?=
 =?utf-8?B?UHlESlc5YUh0L1J0ck50b3VYNmN6U29KREZRZzk0N1MwUnV6cU5TMklTZEl3?=
 =?utf-8?B?TW42eUpSSTNxaUdLNXZPaUJIV2I3dENPM2FTWVhCc0NBRmZrZVl1VnhYNU8r?=
 =?utf-8?B?Yjc5R2c0eVRXam9PS3BNZlpEQnVOOHl2OThXTFZUQjRiMnAyZEhBZGdsbVZO?=
 =?utf-8?B?aW9HdnhpNktyNENZU0hrSkdIOHBaTnlBNkIxbzhaRlVVS3EvcllXQWkweWFT?=
 =?utf-8?B?bzFhVmd4MlVteXc4VW50MTE0NzJyMC82K3ZDOTNjMy8zQnNIcmd2WDVaSFlZ?=
 =?utf-8?B?M3E5ZnVLVk5IaG9mYUdTTUJ1VGFReDh1RHE3UEt6RkVETk0wd05Xb2NXYWJJ?=
 =?utf-8?B?VzVpQ3EzY0c5VEt3UXJ1cmZHNXNsc1FBTFdyckVFZlh4YkFOcmE4MTczM29V?=
 =?utf-8?B?QlpITUwvT2RwWVRhbk1TM3dLSjkxUy82aHlEM3AzNGJ4SGJ5bzdFa3RTKy9l?=
 =?utf-8?B?SlhiT1IyOHBDeVdoMGFWQ2hSeUplNlNRb0ZleFV1U2RBQzY2RjRNQ3JucUhI?=
 =?utf-8?B?SGdIaENSbDN2Y3pJWVZlNEl6enlGODZBemFIMjlTQmpER1dvWGUzYjVjZmRr?=
 =?utf-8?B?ZENPWmllVUR5ZFR2S0F5UmhxL3cxTlZlN1ExcjdNUjBGb25RU3ZXQnVDOGwx?=
 =?utf-8?B?Uk8rRWRxNVZHaXdQb1VNRkpIRjl2WCtxWlQ3bDdHVGt5ajQzL3dFTUczQTY1?=
 =?utf-8?B?bGtCcERuTEExUWo4Y3pUQlNEaWtUejZlRG1KV2ljL1lpUzZLUFVEdkcvTWQ0?=
 =?utf-8?B?Z2o1VmlDNzMxQXk3bHNIV0pMV3UxbkVZYkJzUmRhOW5YZVpkeWZQNEJ0Y1NV?=
 =?utf-8?B?aW5SYVdnZkFwWDh0bnVyeDdvd1poTWNaLytRUDRIRHQ1V1NmZFpYT1A3Z0lH?=
 =?utf-8?B?bDBjNU1IWDJFT1hnYVdDMS90S0I2MGtrbFdueTEyQWJxb2JBdjIxVExBZnlC?=
 =?utf-8?B?clBmWUNwVjlPNlRFVjlmcDlwWUZMZUoxcFR5SUowWUtmWlZsaklpWjB4Nlp5?=
 =?utf-8?B?aEx6L1NnSzNBWXM2SzhhUmQ4aVVXUXIxb1U3MVpzODBRTTg2UTdYZEl5UkFP?=
 =?utf-8?B?dXRRZGJHeVBSZUZKNHIvWkhmVTJxL25rOGtXWXhhZk13V0hLL0RuSUR2ckdC?=
 =?utf-8?B?UVRERksyc3dVTEExZE0wVWNHeGFrei9MVGVCTXN0VTA1VGxzYkNJMGFBcTZa?=
 =?utf-8?B?NytVSnBWNk5ESkZWOXFOejgzRzYydGl4WFhnc1FuY0Mra04ySUNaalRETDVk?=
 =?utf-8?B?Y21LS2doL3FjNWJwaitNcm5pbzNBQ3hpaVcrd0NkYmtzclloZUhIbW1yR2xR?=
 =?utf-8?B?Y0ZWdTl3dGQyVUl4aWtOZTRYdVZsbjcxRHZvYjFjdzdpdmdUdkpMOXI1bFAx?=
 =?utf-8?B?Z01kdWNHWmpTcjJsaFNkbjFodDl0czYzUThBMThSUFBDQnQ3VFBTM0FGUFVu?=
 =?utf-8?B?MDhCZE91ZGR3aGZQdisvTXZ3SzZ1SU0xVTI4SG9ma2NSd2dRRmo5VW5NdzEv?=
 =?utf-8?B?L1h4QytTU0xPQlB4WlRyMFVLQTlPeDNGVktCek45VXdnSnhQMWxPU2lGWS9S?=
 =?utf-8?B?VWlxZ3RJMThNVit6OU9IcDVtTVFHWWZUcjh3bUJtblVwNHZXV2VVQ1R1UU9I?=
 =?utf-8?B?blBENm84Snp0UU9HQnlKcTR5b1dTMk84eHJaajJVMWRzdnlmSWdXRXJqWVdK?=
 =?utf-8?B?NTZ2QUw2NnpHWHYzSStWQ0lzQVdCd205Z3g4U1RsSzJkZWlZdnVsT1JZWXFI?=
 =?utf-8?B?TWNEd0VySVplSVlaNzUzUWIwQVJiQnBxVW94bU9KVUVxTHN5ei9XRlFDZGc2?=
 =?utf-8?Q?EvfvDNJPh3TPt4W47hSxafKYXgb/Hp2j4Ugt99NuJaITu?=
X-MS-Exchange-AntiSpam-MessageData-1: 715gjbIkiceV0g==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 005d6c3e-6e3f-41ee-d465-08df46b0b60f
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 02:48:09.5651
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pj4r4lJWIjzy0wJRtkJZJbxC1sM7Ear9YMNey2EMjgKYzFa05+wUS9oZ/2qiIFbVs5L09I1VeM6BFhiXh9ujOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB9809

On Tuesday, November 3, 2026 3:11=E2=80=AFPM Austin Schuh wrote:
> Populating the BPMP debugfs mirror takes several synchronous BPMP request=
s
> per directory, which on Tegra234 adds up to seconds.  The BPMP probe wait=
s
> for it, and nearly every other device on the SoC waits for the BPMP.
>=20
> Nothing in the kernel uses the mirror, so populate it from the freezable
> workqueue instead, which system suspend waits for.  Create the mirror as
> .debug-populating and rename it to debug once it is complete, so that
> userspace never sees an incomplete state.  Count the users of the shared
> root, so that one BPMP failing doesn't remove it while another is still
> populating.
>=20
> On an Orin Nano with v7.3-rc1, the BPMP probe now takes 0.5 seconds
> instead of 2.6.
>=20
> Assisted-by: LLM
> Signed-off-by: Austin Schuh <austin.linux@gmail.com>
> ---
>=20
> Notes:
>     Changes in v3:
>      - Shorten the commit message and comments.
>      - Populate several BPMPs in parallel, and count the users of the sha=
red
>        root instead of holding its lock across the whole population.
>    =20
>     Changes in v2:
>      - Embed the work_struct in struct tegra_bpmp, and cancel it with
>        cancel_work_sync() from a devm action.
>      - Create the mirror as .debug-populating and rename it to debug once=
 it
>        is complete.
>      - Queue the work on system_freezable_wq, so that system suspend wait=
s
>        for it.
>      - Hold bpmp_debugfs_root_lock across the whole population.
>    =20
>     v2: https://lore.kernel.org/r/20261024055055.602558-1-austin.linux@gm=
ail.com
>     v1: https://lore.kernel.org/r/20261017065012.3063980-1-austin.linux@g=
mail.com
>=20
>  drivers/firmware/tegra/bpmp-debugfs.c | 62 ++++++++++++++++++++++++---
>  include/soc/tegra/bpmp.h              |  2 +
>  2 files changed, 58 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/firmware/tegra/bpmp-debugfs.c b/drivers/firmware/teg=
ra/bpmp-debugfs.c
> index 2efc48b522ac..d90ef912b66c 100644
> --- a/drivers/firmware/tegra/bpmp-debugfs.c
> +++ b/drivers/firmware/tegra/bpmp-debugfs.c
> @@ -774,6 +774,7 @@ static int bpmp_populate_debugfs_shmem(struct tegra_b=
pmp *bpmp)
> =20
>  static DEFINE_MUTEX(bpmp_debugfs_root_lock);
>  static struct dentry *bpmp_debugfs_root;
> +static unsigned int bpmp_debugfs_root_users;
>  static bool bpmp_debugfs_enabled =3D true;
> =20
>  module_param_named(debugfs, bpmp_debugfs_enabled, bool, 0444);
> @@ -785,19 +786,18 @@ static struct dentry *bpmp_debugfs_get_root(void)
>  	guard(mutex)(&bpmp_debugfs_root_lock);
>  	if (!bpmp_debugfs_root)
>  		bpmp_debugfs_root =3D debugfs_create_dir("bpmp", NULL);
> +	if (!IS_ERR(bpmp_debugfs_root))
> +		bpmp_debugfs_root_users++;
>  	return bpmp_debugfs_root;
>  }
> =20
> -int tegra_bpmp_init_debugfs(struct tegra_bpmp *bpmp)
> +static int tegra_bpmp_populate_debugfs(struct tegra_bpmp *bpmp)
>  {
>  	struct dentry *root, *d;
>  	char name[32];
>  	bool inband;
>  	int err;
> =20
> -	if (!bpmp_debugfs_enabled)
> -		return 0;
> -
>  	inband =3D tegra_bpmp_mrq_is_supported(bpmp, MRQ_DEBUG);
> =20
>  	if (!inband && !tegra_bpmp_mrq_is_supported(bpmp, MRQ_DEBUGFS))
> @@ -818,7 +818,11 @@ int tegra_bpmp_init_debugfs(struct tegra_bpmp *bpmp)
>  		}
>  	}
> =20
> -	bpmp->debugfs_mirror =3D debugfs_create_dir("debug", d);
> +	/*
> +	 * Name the mirror "debug" only once it is complete, so that userspace
> +	 * never sees an incomplete state.
> +	 */
> +	bpmp->debugfs_mirror =3D debugfs_create_dir(".debug-populating", d);
>  	if (IS_ERR(bpmp->debugfs_mirror)) {
>  		err =3D PTR_ERR(bpmp->debugfs_mirror);
>  		goto out;
> @@ -830,15 +834,19 @@ int tegra_bpmp_init_debugfs(struct tegra_bpmp *bpmp=
)
>  	else
>  		err =3D bpmp_populate_debugfs_shmem(bpmp);
> =20
> +	if (!err)
> +		err =3D debugfs_change_name(bpmp->debugfs_mirror, "debug");
> +
>  out:
>  	if (err < 0) {
>  		if (!IS_ERR(d))
>  			debugfs_remove_recursive(d);
> =20
>  		guard(mutex)(&bpmp_debugfs_root_lock);
> +		bpmp_debugfs_root_users--;
>  		if (root =3D=3D d) {
>  			bpmp_debugfs_root =3D NULL;
> -		} else if (simple_empty(root)) {
> +		} else if (!bpmp_debugfs_root_users) {
>  			debugfs_remove(root);
>  			bpmp_debugfs_root =3D NULL;
>  		}
> @@ -846,3 +854,45 @@ int tegra_bpmp_init_debugfs(struct tegra_bpmp *bpmp)
> =20
>  	return err;
>  }
> +
> +static void tegra_bpmp_debugfs_work(struct work_struct *work)
> +{
> +	struct tegra_bpmp *bpmp =3D
> +		container_of(work, struct tegra_bpmp, debugfs_work);
> +	int err;
> +
> +	err =3D tegra_bpmp_populate_debugfs(bpmp);
> +	if (err < 0)
> +		dev_err(bpmp->dev, "debugfs initialization failed: %d\n", err);
> +}
> +
> +static void tegra_bpmp_cancel_debugfs(void *data)
> +{
> +	struct tegra_bpmp *bpmp =3D data;
> +
> +	cancel_work_sync(&bpmp->debugfs_work);
> +}
> +
> +int tegra_bpmp_init_debugfs(struct tegra_bpmp *bpmp)
> +{
> +	int err;
> +
> +	if (!bpmp_debugfs_enabled)
> +		return 0;
> +
> +	INIT_WORK(&bpmp->debugfs_work, tegra_bpmp_debugfs_work);
> +
> +	err =3D devm_add_action_or_reset(bpmp->dev, tegra_bpmp_cancel_debugfs,
> +				       bpmp);
> +	if (err < 0)
> +		return err;
> +
> +	/*
> +	 * Mirroring the BPMP's debugfs tree can take several seconds, so do
> +	 * it asynchronously, on the freezable workqueue so that system
> +	 * suspend doesn't make its requests fail.
> +	 */
> +	queue_work(system_freezable_wq, &bpmp->debugfs_work);
> +
> +	return 0;
> +}
> diff --git a/include/soc/tegra/bpmp.h b/include/soc/tegra/bpmp.h
> index f55db918ccb1..f961c265326c 100644
> --- a/include/soc/tegra/bpmp.h
> +++ b/include/soc/tegra/bpmp.h
> @@ -12,6 +12,7 @@
>  #include <linux/reset-controller.h>
>  #include <linux/semaphore.h>
>  #include <linux/types.h>
> +#include <linux/workqueue.h>
> =20
>  #include <soc/tegra/bpmp-abi.h>
> =20
> @@ -103,6 +104,7 @@ struct tegra_bpmp {
> =20
>  #ifdef CONFIG_DEBUG_FS
>  	struct dentry *debugfs_mirror;
> +	struct work_struct debugfs_work;
>  #endif
> =20
>  	bool suspended;
>=20
> base-commit: 1bbcf4a19f1495f769b69e9569d8c1e81df074f5
> --=20
> 2.47.3
>=20
>=20

Thank you!

Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>



