Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792892769;
	b=IWSGU/BpwsVpbZK6JDH7+p2vCrCwbbei4ZgLG/RJb/1/kiuWPhLKjDIJ3RiLkf7QLR9U
	 qiPUEGZcSgM2rZZ3dOsOT090o54tPSkguCUlmWLXQOd5GN67cGLbbF6vfNx48uLn2eJj2
	 mGTrlcW62sxnxKXyA2y1xaVkM0NPJ5ln7IUX5P0wZ2sIpT7UzHCunJl3/vS7MxeFgJ5qX
	 +qK34nAFdB4xseesvtoCMJyWRuFWMqg/t0/BB7I8IN3N0OXSKs8K1qQXmM8ZTy5vd/suL
	 lyNYUMin6OlCkLltGSygAcenbHZ6w9K10faNwhKg/jxzLXARcDizWV+S79zNp35Vbyw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792892769;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
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
	bh=AVqR15kde+TFrpCrpkaYq+3Nkbt5mpAHzfbEMaNw6os=;
	b=PWgQ4UnEqE4oozvFPJV5Pi2KIV5v9ieNy60lCKqUzupbJlR1nBB6VAMm52zwSRxBpOuS
	 PGchlRxn56J22VjdgZXOQicNbsaCpiUVdjNcMzWAqwvjhZT4SVfzwMEJOTRyVIUVgvQZF
	 vJHkfDXRVvCB0vuKYUJUgkceNXCpIFqNIzVq824GVNc5KTZnVAdtDgE9UgYZOvy0kabPH
	 rWr0RQL6I8IHVMbc/TFJl2ftNtidnSEpg1gqNwhv06jdM3ZpMqSzzXD7zFgAZ62p2+3a8
	 f9vUlbp/QlleBNALa+5MM34EaGcqKx/fZUv8HGzmDR0tbrayOSjSbekX8lLcsGG4f/Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Kjz9opSq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.51
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012051.outbound.protection.outlook.com [52.101.48.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8C2606A322;
	Sun, 25 Oct 2026 01:46:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E8C2606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Kjz9opSq
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DuMwZxVgmcgH4lonNUXDnlu/9YTxAdY+n1XChwLpfW/Xti9Gi87aHEx2xE72JljgavvCyBzSpkgMsYC0oWS+b8aQ3R3roo7IIF0gTrIRbzITVjWyxCMnsOnoh2kJcLDfFoC6hCUAh2kipATpnP3/BsisazQ4mYnHl970i/VP3p+eSCQsXfyhYkf/Kh1Sp/E2VJ/1ntcGYs2Jt/d4ZnWIangYI99hiBytUMs2DQ4e5FA7X5KO5g1hQ2Nhi51HQTG0he8+MniDJecRpSR3HpiF/0ndaZES6iH0UKOie0N1/2CH+R7xUAslrvVIajJwFUKcCA35ZsX/7hg64S9tIkHegQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AVqR15kde+TFrpCrpkaYq+3Nkbt5mpAHzfbEMaNw6os=;
 b=dAHGhMDce3FPGBAWdnVS6exhVj4/l4d/7ysOHzezU0Qi0G0vboS7V0Sir/0zfdX8zkMvUajtAW9r1tC/OvayWUqjqM0hnj3MolhWjZB5cZyEwnIx+Wg4oX+joO+ljWlDI9VUEYCKoQYGXb7YxUz5MLNS5H0CKc5L7tUQDxBFaf+k7BpVmbJzBDRhpam8oXXIX4bPzajwy/qaL47DI6F4KkzuJxeSfre8sUu5jdJncZ84TCIrPKIPIE5uvo4qtXnRzTlYyXQ8iXdUP7FfAqOSqoxXEENGg6b43Qvn4/csHBm1kpYtc8jkLeUB9JP06AH4ts9ctvbKs363K+bctpGY6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AVqR15kde+TFrpCrpkaYq+3Nkbt5mpAHzfbEMaNw6os=;
 b=Kjz9opSqHEtir2cuej61EDTDFn4EBkPKM/xnXbo+WfGzmb2RJadQnwWgl/LPKfnaJjJBrm2wRFnMgq0u3A5OWkjzaN6CRQmMcjKAn/1LTPsFl4NOFvB72HMCbWCB7AfNCIW+wfl2SNPSMvMHRmmQYI4LYMOQEwcA0dYW7h6JPUIB+Wu3yuVyr36EQoGTt0hdDq5tOASM0So8iFf7W0370zsG2Owm8UiIK4F5Ia5arfYPnlx1oRq74/1+eUXqQhi1Je3IOX/Xkr0jPLmPSyCmXnSaYrDyrzOSLNcKufh2hZLpU3nu0D0wxxwXQUqAc/VgHaXDy+5OKA7xkdx0EP/w0g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by PH0PR12MB8127.namprd12.prod.outlook.com (2603:10b6:510:292::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.18; Sun, 25 Oct
 2026 01:46:03 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%5]) with mapi id 15.21.0546.019; Sun, 25 Oct 2026
 01:46:03 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
Date: Sun, 25 Oct 2026 10:45:41 +0900
Subject: [PATCH v2] clk: tegra: Fix Tegra114 MIPI calibration clock parent
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261025-b4-dalmore-fixes-mipical-clk-v2-1-0a2d1118f930@nvidia.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NSw6CMBQAr0K69pkWpIAr72FY9POUp0BJi42Gc
 HcLXsDlJJOZhQX0hIGds4V5jBTIjQnyQ8ZMp8Y7AtnELOe55E3BQZ/Aqn5wHuFGbwww0ERG9WD
 6J6AuqpLz2lopWUpMHncpFa7tj8NLP9DMW3MzOgqz85/9H8Xm/bmKAgTwUtQapamaqrmMkSypo
 3EDa9d1/QLbYZxD2wAAAA==
X-Change-ID: 20260930-b4-dalmore-fixes-mipical-clk-eb375008dd66
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>
X-Mailer: b4 0.16-dev
X-ClientProxiedBy: TY4P286CA0135.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37f::18) To LV3PR12MB9166.namprd12.prod.outlook.com
 (2603:10b6:408:19c::13)
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
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|PH0PR12MB8127:EE_
X-MS-Office365-Filtering-Correlation-Id: ee2c687c-2d30-4bc3-5278-08df3239b5f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|10070799003|366016|11063799006|56012099006|261009223027099003|261021121427099003|261021135927099003|261021123027099003|261022113327099003|261022105027099003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	WbbcgPIUNFTXN7m4WAGopvYN1U9B2k0VAdjtChMlNTZh6GsPPN0TxGcARBmEA4iifaPwBdtP40JpHuFyNJ1vsUSQGtJeJPDcPJMFmsV21rDlSQWcgEJEetNrLrO4RuKZzBFqZPMsnnhkjmKt3p4iobso6oe5yZDXX4v1mdrivKVRH7dZHTpJjVProR8M69j3lj1YfzGX1+rlfhpoqnBuWqtYm0aYWGfiR0e4qJGhpG+6uoPH9m8KvOqvSWmVf5E+zBm1z5NVdP5Gz5nV1SYSBHyR6Uarp1iV6Ju0iB/zQdpop+Nm9+2Vwtvnalt3NSF5tYgEwCywcEWOA12scpR83LVU8rZI+EYaanLi4Fg2gkmfStPxGhrS7r69t8seL9J2qpgx0AcdWnz2rnkKWUNLUNO6KgXlEuVW4vHaYptU78Kjn27ZHknKzDBxj11qhdpLcZTEOAcvLaZpX4w0uJvFNaOL51hKcPdWCob67BCz+KuSPjXHLsLteDpuMEkMexkrCFWjhQIN58vuRg1f2tqnsnIWse86iA4HYBoycL+jaKp8GE6zk1S+nhP8iiYTF/sB0dxn5c8ezG/2IcaiLsjLl7eMIFWReTtEdh9MvlTxLjPvjzTAjwQVba+feHUsU1zo9970JKm7C+sTqkOvq4Vebhspz+l0D3CwXbBB4oXc0UE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(10070799003)(366016)(11063799006)(56012099006)(261009223027099003)(261021121427099003)(261021135927099003)(261021123027099003)(261022113327099003)(261022105027099003)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N3pHVkdMS1VXYmFNbFhIUFVzNzNXYnRYcWIvWUQvQ0R2eTByVitHRkNVRWlj?=
 =?utf-8?B?MWdkN3BsWk4zZ3ZnRE5Hd2ROa0lQMkQrMjIrc2RsMjdMemgvSWdCeStHVGpG?=
 =?utf-8?B?MGQ3OUxVeGdGK3FDbXJ5ZWt2TjN2dUtjU1dZbVZpT1NRS1dnUjhyQXNNOEQ4?=
 =?utf-8?B?ZzBGdlNLOGdHVmVTN2hpUFEwVTF3YkI0TlEyZ3JTaldBN1Z2U2VUeXNyNW5R?=
 =?utf-8?B?c21IZmQrNkxtK2l6a2wzSlNtWlVOWVdwT2dYSkxrYlFhZjdOLzgrT0V4UkVE?=
 =?utf-8?B?aEtlR0UzVDJEOXQ5RVczQXY1VG5WamRNWUxPWVNYS042WTJ4S3Z5TDZOSmNW?=
 =?utf-8?B?N09sRkxwdktKRDFYUW9pUSt6K3JjWCt1dUJUa2JwcDZ0ZTVFWFNBdFB2bE5M?=
 =?utf-8?B?MjBEZXF0M2pXZmJBLzh3R3dHcm05OTZCell5aDdPbDU5UUZIRVFrQzJqcmNv?=
 =?utf-8?B?Y2Fxd3BYSnpTYWFhSmdYMFFNVG5yOGJjZWJaMVBZaEZ5Rmtid0sySWNBUUJq?=
 =?utf-8?B?U1pQaGVzU21PUmVWeTY5bmhMRktsVVdXREhlTzJkemszeEhiNE52UTFhVUZm?=
 =?utf-8?B?L3htQS9KOWs4bFJXUjkyZmtoU0h2cmpHeWRKYkxEN3NJZWYvZzBsM21VaWU2?=
 =?utf-8?B?YzhSNzJyVmdjY0hXNHFOUWlqb3lxMys0eFNYT1ZnV09OMTVqeVNNZEY4WW12?=
 =?utf-8?B?REVrcEtMNXoxNDBtRGpHSXJ2dXZMbGRmMXNtVm12TG5yVmhxU3huQmYrRDZH?=
 =?utf-8?B?cll6SFovS01DM0c4VUxHOG1GQkZyQlRnVmhxOWt5MURMaGViajlvVC9HdzN0?=
 =?utf-8?B?WlRCdFVXci9rVHBJT09pZ1p5N0ZLNW03S1hwUmNKVzVjTFowaVhFVkVVekY4?=
 =?utf-8?B?VW52WXhEZlZnamdJUVRVdEliWjB5U1pOL2xVRzNrZ1EyakZpajNBT24yejcy?=
 =?utf-8?B?L1N5MTVsMkRDc2k0djJ1TjAvS0FWVE15cnlPN1Rob21GNDRFODVGRkRwRUd2?=
 =?utf-8?B?RFlBeHgzV00zMVZwSlQwMjZKM3BYMEhISWxJdExFMGR1L2thUzh6NDVCOTY3?=
 =?utf-8?B?Zjgya1FmdEFzYy9BVkRJMzc5YUxmUjFOZ0xwTmtQQVg3ODJ0WGk5dFpnelYy?=
 =?utf-8?B?RXUxRzlNMXdaQmpVZys2dlg4T0czK0szZnhlWm14QjUwMnIxOENMWlhjZUtL?=
 =?utf-8?B?T0QwN0w0K2x3UXFPS01aK2R4cVhKdkxhNEhQNHFrdWtVMDV0V0xNeStKNk1z?=
 =?utf-8?B?ekZrY08zaUVmcng2ZWRUM1UwRURaWmdNT2Z3REwyZ00xalcxak9MWTlZU3NS?=
 =?utf-8?B?aHlzWEZiTDFjbFV5U2wveWhEcHY4YXE2dFlzRk5OVnowd3YwMDQwRmxMd0U2?=
 =?utf-8?B?Rm5yNWFIK29lTG9RT3Joa0R4WFFkQnNFYmhXTWpjd2FHU0RKR3hUdmJPQ21I?=
 =?utf-8?B?bG5vOXVJNngyUWx1OW90cmFXbG13eFNvT3ovSkc1aThFQjVCTTB4bW1TUDJ6?=
 =?utf-8?B?RmlvSWZ6MWVFZlpFWnJ5Q0l6S0J2a0NWNy9BK3dNVVBBd1lWM0xkYmxjblRL?=
 =?utf-8?B?QlB2TFFlVlNzMllrVUpLZUpJMTU1ZFJwRkZpdithbEF1UlRhcDlJQlZYT3RJ?=
 =?utf-8?B?QkJVandFRS9CZzhtQ3ZsdlB3Rm9BSHoxWE5ob29PckVUZ1lxUDJVcHUyQkV1?=
 =?utf-8?B?ZjJkaDN0QVo0QW94VGc3T0xLWWZCQ2pXbjRHMTYvWFFoTGx2bUl5MitKbjZw?=
 =?utf-8?B?dk9oaHBtNDhXU3lnTUx3dHYyY0xaemErVkw3eW1FRXNhK29qSnJHME5YYnJJ?=
 =?utf-8?B?VDF2bkpneTkrdEw3N3AyMHFuRThtZUxCMzVQU2RRVTVhWjdpWVExRG1ic2du?=
 =?utf-8?B?MlludVFUQ0tvRWdhUHdvblNLTmN3K2VLL0UwSHdjeVZqZXl4S2ZJV0lZS0x5?=
 =?utf-8?B?eTY0RHRGYjV5TmNNR2ZGaXk2Y0Nxc3FFcmJpK0RlVHNNQ1Q5cHVOTjRhU1BG?=
 =?utf-8?B?cjg4MnF6bTRyeXFlUStkUlpHcVk0WWdPWTB4ZktHNENGa01ETEozb0dxVE5Y?=
 =?utf-8?B?ckNzU0dVUW5KcEdPbFZzWHVIZE81a0Z5M1dOaHFuaUt0ZG1xQXVxbWFwbHpo?=
 =?utf-8?B?OGt4M2I3dC8vUDQyUFZNR1E0SFUvQ0pKOVEzTWU2Qk4yTGZjcHFSWHAxQ3R0?=
 =?utf-8?B?bTJNaXRGQURiSUZydVRXV3JnL1JBT25haTVlazhGYVdJd2daZnNVMDR1Y0xQ?=
 =?utf-8?B?TjFiQjZWck82cG5GbTBpOE9FWnFjRTdLODEzZGxrU3ZFMlNUS1NnR3FPOU1h?=
 =?utf-8?B?RzcrMDRONlVrL1pna1RnVzlhYTQrbjFDT3B1c3ZmTWhSSnBqR2F6VFNIdm1y?=
 =?utf-8?Q?n1s1oBWaJxafU3Y8sebDTyTmIREPmCJh4FLHL4iolo/rz?=
X-MS-Exchange-AntiSpam-MessageData-1: jAU3Y+kH4lEvcQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee2c687c-2d30-4bc3-5278-08df3239b5f4
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9166.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2026 01:45:57.2093
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EnCglDYYeAU5HN5oJljQmxpfLe8Kclz/cAyg/8UWU2ASBUouEOBYTMYw8tSXK7ACrp3RK8hoR9nxvwZP2+kHMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8127

CLK_MIPI_CAL on Tegra114 is a plain clock gate with no source mux; the
fixed parent is PLL_P_OUT3, which is specified to run at 72 MHz. The
clock driver currently registers the gate with clk_m as its parent, so
the clock framework never enables PLL_P_OUT3 when MIPI_CAL is enabled,
and reports the wrong rate for it.

Register the gate with pll_p_out3 as its parent. Also drop
CLK_SET_RATE_PARENT at the same time: the parent canonically runs at
72 MHz so we shouldn't change the rate.

Fixes: 07314fc108e1 ("clk: tegra: Special-case mipi-cal parent on Tegra114")
Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
Changes in v2:
- Add Fixes tag
- Link to v1: https://patch.msgid.link/20260930-b4-dalmore-fixes-mipical-clk-v1-1-0518be6c7979@nvidia.com
---
 drivers/clk/tegra/clk-tegra114.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c
index f1bca81b7776..97f5500b13b5 100644
--- a/drivers/clk/tegra/clk-tegra114.c
+++ b/drivers/clk/tegra/clk-tegra114.c
@@ -1050,8 +1050,8 @@ static __init void tegra114_periph_clk_init(void __iomem *clk_base,
 				    &emc_lock);
 	clks[TEGRA114_CLK_MC] = clk;
 
-	clk = tegra_clk_register_periph_gate("mipi-cal", "clk_m", 0, clk_base,
-					     CLK_SET_RATE_PARENT, 56,
+	clk = tegra_clk_register_periph_gate("mipi-cal", "pll_p_out3", 0,
+					     clk_base, 0, 56,
 					     periph_clk_enb_refcnt);
 	clks[TEGRA114_CLK_MIPI_CAL] = clk;
 

---
base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
change-id: 20260930-b4-dalmore-fixes-mipical-clk-eb375008dd66

