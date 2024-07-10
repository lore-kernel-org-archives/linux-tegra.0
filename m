Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2077.outbound.protection.outlook.com [40.107.236.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B79176AD0;
	Wed, 10 Jul 2024 08:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720601619; cv=fail; b=XXfFvHJbDwKb3WT/2GDmhC6sLVi5Qx0HugROHDADmlECwXL5vGc9Nk6mLYRoNI1B5C6gLsx869dmbfYm4yq5Pm2DEEsV5s+cCnudJwl5XA/a4vVswduuk/BwL2szjORBnClBBTZyLXMBvLkD5wjnQHNbjoRzlS7N23oUKHrYhlE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720601619; c=relaxed/simple;
	bh=w30ZI0Qmn1vTJ0VnLfGcQYiOPc6FrdhawiSxn+AwTqw=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=EoHhOTAyxGo+SC14zPbfzp9PAhyg7o/DCXVA/wXjr198hHazhfSdJMIqCT3W8tEZHqQ4VDWVCzhdA0iR+FIS+NNRhwe4YdHAnk5SZyMZTte7D14C1+WLXZOrIqAIt4Bph4O2TgvEiw5eXwobJyTgTR0MfIODVODHNAA74Ngp0Eo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=bgJuungu; arc=fail smtp.client-ip=40.107.236.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="bgJuungu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cWS3upTM9oLj6S+0vlx+SbchPg4d7HfRqwKsgwtiBlaUJyILoEJQofDT6RFMEGlCe/16G+1tlPbln6FgNewN95DgMGoYji4h7XRTS95Grb/P6O2v8s5Uw6iYfMgMkwRu88yXvyju1vcIhBIKTSOQ4iAFEFfl/KDoJJ8Rije5jFbuVZWThVGlQao9IZY69lM1YV9lUjt6YuPpuxYcmtnDBxBB1CKLScuM1LdenP6BxTot3rH9G+8OZnFPRzvTihS3nusZBXYuWhSlirlRdnxSoz40GLK2bGEW/MxslVtSrEfGQVM9wGutivt8k0qWh43G6mYn5rmLwL4hr5Y6mg+UFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nIkcu5Gbit/hN3J09KTNiPUwLCDVeDv6f0DcpOJYLrc=;
 b=lbq9J8p2rburHn5Di1mbPeJfEIVWiY5uMcCZEHh9G034SJtVMEER35nA/ckZdbULAZeiXRiqiWgJmZYBslWrBIbT/131Itltse6C97m+d9pA0DccUznZV9kOxUN7fW85wLCDsttxoRbjOQz0PJEuMCNRYyrhvJ+5o6YxeXpFlS/vd7TyyxrnTsoFfqx+NPemAK1IbU68y+lxfzRxDqJdEGr1yDsidpKzYQB17CcXeowYmF+jy/G1eNvFNC25TzrMFOzPKNOQi20j33K7G8qrdEqpPXdNjmqS/RDReHoluWqerMAyDNtJa3/fvTTdDHADEcK/wyfPR3IRw01Mw/l80A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nIkcu5Gbit/hN3J09KTNiPUwLCDVeDv6f0DcpOJYLrc=;
 b=bgJuunguVU/vE24FRALnCWtxm69eH4g9c3IDw85E+4dU7+vg+CFv21gl5unojgESk+1yRPzbxJdEcWLHMXHbDVCXrFLdkcj+bFLkvr85SC5L7Et7RjEYwOfSR5okZD7OWTesOoyE9mBYpMMtsjSwyBbs3J64Eed0OGtpl+VbCc+DvJ7XBrKmrdtjogIJ5gA4CDdSndgNrTda1FMtcHjgpG8Lo7gaPUotmhVosR5ft3/mKnLdO5dgp1Mdfs/8uF4WgrIei1i/+/PHdqVqkUiCNYrkMPzmXlPYUYVBMS2KhFStutV4uA3CW6HG0yGbmMONKYyynqdz6DETqGmpBol7zg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 CH3PR12MB7620.namprd12.prod.outlook.com (2603:10b6:610:150::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7741.35; Wed, 10 Jul 2024 08:53:32 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::ae68:3461:c09b:e6e3]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::ae68:3461:c09b:e6e3%6]) with mapi id 15.20.7762.016; Wed, 10 Jul 2024
 08:53:31 +0000
Message-ID: <7cacddaf-e3da-42ef-91f0-73ca653f8dcb@nvidia.com>
Date: Wed, 10 Jul 2024 09:53:26 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: tegra: enable same UARTs for Orin NX/Nano
To: Vedant Deshpande <vedantd@nvidia.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Brad Griffis <bgriffis@nvidia.com>, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org
References: <20240709214609.2472562-1-vedantd@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20240709214609.2472562-1-vedantd@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0510.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:272::14) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|CH3PR12MB7620:EE_
X-MS-Office365-Filtering-Correlation-Id: fd535a49-bac6-48c8-d925-08dca0bdc658
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d21SYit0S2w4SnlZZ1NNajZucVhZL0dYdEUzYmJQbitpT29NSmI5Tm81NnJQ?=
 =?utf-8?B?eWZndEhqZzRnRTI1ZHh2SnQ2WnA5S0RFQUFLOU5iSnRzckdmUnVvRTNqUGcr?=
 =?utf-8?B?V1RBdXdXZWc1RDZRaXpxQlZhSVArcEcvVWdicW5nZGhkTjFoMkNuTnhtb083?=
 =?utf-8?B?V0NXWDFxRkZncTkxUUR3dVVzellFRzhoTnRqQ0F5VGVMZHBia3RmWnFaMWJR?=
 =?utf-8?B?VzF5QndONHh3cXBwNFpEbUo1dEh0MThIdDVSTjlhRktGckV0WURkQ3l3ZFVW?=
 =?utf-8?B?eGFxZUczL0grbmg4S213L2h0TWlGNXRrUEp6WVRvUWhTOE5lN215U3JjR0ll?=
 =?utf-8?B?Ti9OdUU0V25uRHVCSjRtSG1PajE4cjZ4emZXTWtPdEpMRE1wM1J6SGtWY3Iz?=
 =?utf-8?B?MHJYOWhYa3FDa2Exc24rNTFHZDgwV2dTZWp1bk8wNjVhaHlYdFlZM3hUZXha?=
 =?utf-8?B?QUdzT1FXdDJhVnZYdWgzUEFRT1FrZ2NlYU1EMjcyangxTGc4WThhRFA5NnlN?=
 =?utf-8?B?TU5uYVYrZzRKRzJIeDdHRXprMER2TkNVZzZzMjNHeE9OSHBwNkYybHA3VTla?=
 =?utf-8?B?dGxnR3hwZDlHMzh1dHBqaWZ4UlVCaUR5RWp2VFJBdFk1eTFKM3BoWmtvUkoz?=
 =?utf-8?B?ZmVtSGFjSHRwT2VlTU11M3Y5VVEwVFZJSUZhVWRMcWFWa0hjZlNiNU5Md0l6?=
 =?utf-8?B?UzVjTlJvUzIwK0djblpHajVsbmdMaG1vYWttMXdMYlV4bGphYis5bHpvcEZM?=
 =?utf-8?B?RmxMUzllaW1kZVRseFdwcThTa0hQMUFrd1Z0ck1BbjQ5VFRqQmpHL3ZXU3Ez?=
 =?utf-8?B?dFdDQWEvTTJOYTlnZWFwZ2FpS1FybUVibmNKYTBWY3kyMExFSnVjTWVMSEJ0?=
 =?utf-8?B?YnBybTg3eUR4MVZ4WXBUTi9DOFhnS1VBWmxYRUJVWmtmOTFXb1B1NUN0Q1pK?=
 =?utf-8?B?dDM5emJ5aEJ6OWg3dVBYZ1EwaFhDZ1hRbWZ0U3FSenJOUWVsRXNIemNuQmlt?=
 =?utf-8?B?Q0xVdG44dVVwVEF4SjRQeDJiUmtPMUhEMDBkK2IvUHlVbHNtdWFEYVVmUmli?=
 =?utf-8?B?b0RWUzZTUUd6UkJLZXpWQ3R0aW9rZWt4Qld6RXZpZFNoaFBjMHdUREd4ZUN6?=
 =?utf-8?B?cDVaVjd1aUY2Mk1HL0hBVk5SbkVORENyeVJXRXpCWng1UVJFSlJaSUppOE5s?=
 =?utf-8?B?WWwwMnFzbmRLOWpFSlRlMk9uRlRJTUVIY2VhYXh3T1lndlk4YnVGd0dtWDBO?=
 =?utf-8?B?VlBHREhJT3AwZElzTHM5YXlHSkh2OVpCQy95bVFuTmpCWExhOG53aVJxR0Fp?=
 =?utf-8?B?bGFudkhjUDlyeDcwcDFocUorbjROajFjZmZjZU1YMXdUN0VVMmhMaHJ0bmlF?=
 =?utf-8?B?eWgxcWNuQ2xrR3FsNDcrZE1CMnNTb20zVWtsQjFqYmVOdkZ0Y1Y1NFJRTk91?=
 =?utf-8?B?ek8wZk15R3d6SE9KOFdwOTEvc3daejFjRkhQUENtd1cwdnRpS2o5QVQzRmdz?=
 =?utf-8?B?eW5nbTQvWEFSdDIrbEFvTWtwZmY5b2FGeHVLaGt1VkdUWDY4RmhQMlZIYkJC?=
 =?utf-8?B?VFFjTS90d1JMQ3cyMUJielh3ZzRuQ0RJd1R5dFI1NFJPS0w4STdNVkJaMiti?=
 =?utf-8?B?b0pzcHVmT3hzZk1pb0g1WitYSjIya1ViSmJBSEVPbGJJQzFrNzI0OEEvVVpW?=
 =?utf-8?B?Zm5OSkgvc29LR2JMZ2R6YXRRS29qTExwZUhmREY4ODl4S2pJVS9JOEFDL29S?=
 =?utf-8?B?L3B4emlNWXlhMW9TMDA5N0M1WTRFazZzNWpwdElISTBBT213ZWNUbVR4WmZk?=
 =?utf-8?B?aDJpV1JmZ3lnTzg3TUtmQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SjJ2VkFmS2ZUNlRNTEhRelNxZmhnU2dpREltMmhvOWVQWFZRcktoaytPVzB6?=
 =?utf-8?B?T1FZNU5NTklNSmV3bXRBUmIxVCsrcm1lbmxBb1Z0S1dNQTRoUDdGWVNDWHZk?=
 =?utf-8?B?MEJ2V1FQZjI4SkpCTlI0SUNFV21SOWdTc0w2bjdMdCs5MDIrdml3ZjVMWnJR?=
 =?utf-8?B?ZXp0eUd1cWU4Uk1EWDl5cUVwU0RpOEFGS0ZpanlhaVZYY2lMUFR3Wjg1cFYy?=
 =?utf-8?B?OUV3TjZhS0M4eEdXOC84ZFpTQVU4R1BXVmRYN3NJQVFCYml0UnJUZWNoa250?=
 =?utf-8?B?UTN3dHRnUUFEdVhIWXRDOXIvcitEdmYvQnNaSnRTOHRyQjlzdjBFWCtUUDZ5?=
 =?utf-8?B?bjhNVHlQT0VDWFRGVVJ1NDhybXFwUzhrRDdjSG11ejBhK0pWMDhER1QzU2ZJ?=
 =?utf-8?B?d01wTCtiYWJ3K28rK2xnOFZONHpUdlJxZmZDNTVqWjdkTGlXVzZCUHQxK1Y0?=
 =?utf-8?B?LzhuSVNBTUZnTVBLaURmTzNyeFpmaDVpSVc4WU9qdmlJVEd2T1E2VVdYZ3gy?=
 =?utf-8?B?YXJaVVZoNzRrTzNxYXpxQjAwUkpHM1NaMjRrTHpneTZOUUJHV0RmVkFMcEhO?=
 =?utf-8?B?OXltWlhZUlE0QzF2cFNhL25lRW9YS2lVd3FJa203STBGUEhGRjVTcUpIVER6?=
 =?utf-8?B?Z1FHSTB3QUovRnp1RjdtWDZsL0d3cGZ3NzdJd0grRFdnQUNlTkpqUkphbGYv?=
 =?utf-8?B?Y0h6NXZGZHJReWJNaUFIY3FidzZnZ3ROZkVZZ3Q3eTRYelQ3Q2hMSnRhcGFo?=
 =?utf-8?B?RVlsWFltbmdldC9VTE1xUjcxZXJKcUxJNFdvVWdNeEhmNVdmYmZzKzFuSVov?=
 =?utf-8?B?d3lScXdNbEZzZUlwaWFOaDZrNjczYW85ZU9FNytMTi9oMDJWSkNQZlZTUENU?=
 =?utf-8?B?ZWEyV05JMDREaTRFVGFLejZjTHN0bUFoU2hmejJQSFRnc1BmbXZPWmpENUl6?=
 =?utf-8?B?aEdFblkrUmZQcDVNQk5HNW0rMTBHN3JiUjgxU2J2S3lOZGFwZ0ZzaXJ2Qzho?=
 =?utf-8?B?dWdyV3VNdXMzSlJUd04rVGF5TUtaMi9nUzVxZGVaSVR5Z05yaHFDdnNHdmNv?=
 =?utf-8?B?Rk5rMCtBTHJsYlFJTEJJcjh6SUEvWkdybmFYbGhYL0c4bnFoc3dHSWpscVpr?=
 =?utf-8?B?RnVCNzhBTFQ2eW1EYzNoSGd6eUpsVFFES0FDSjlhdTNPNFlUTVY4MHowVm5i?=
 =?utf-8?B?d0FtS2NQeVh6K0xqajM5U0M0bWR4eWZYQnRWNFk4M1BEazRYNU1RdzFGcllX?=
 =?utf-8?B?S2poS1JLMWFDS04yZFljcEFJaS9sRDBKYWdFYU9CdnF0Tk9WY08zbkEva2ZC?=
 =?utf-8?B?SElsaVpQU1dPVDc1ZDI5MUM4K1JkVFBHQ1pkSjl2MDBub0dIUkhjQ1RxVVlt?=
 =?utf-8?B?Mk1SQm10OW1wbXN1RDhSVERnUjg3ck1vVUlYN2VWODd1UDFFNjg3QmlhRENm?=
 =?utf-8?B?WHZkNkV6WjhqM2Q3R1IwUmtxWkNDV2MrcmJ2YTFQNHdXMmdTN3AwUmpjaGQr?=
 =?utf-8?B?ZWxsYkpmZlVGcTltZmV3YmI1TGx6U1YwRTgydzY0ZmpmTmJ3eU5INDE3Y0xu?=
 =?utf-8?B?SjhkYVh0M1ZhNHVVV2VLeDBVZ3RKVFJiQ20vazB1bGR0ZmR4cnJHZVRDLzlM?=
 =?utf-8?B?aVVwVVFqakg2UElTRGtFdXpKSnZTellYd1NGdTdpbjZTK3QyM0wrRjFkNmRm?=
 =?utf-8?B?YU5ZOHNhVHQrR3dmeEpBeFV3RHE4S3h4Mm5FVjRmT2w2ZUlnSGVMSjJjMTUv?=
 =?utf-8?B?NE1GNnBuYzh3ZGdpNWtqOHhLeTQ4d21jdDB1RzcrcnNLTEtBaGNlYTVXeHRJ?=
 =?utf-8?B?dnFCcjh4ODEvbW8yaFgyTEYxT1QwamR0ZEZoQkdaQ3NibFdPQUpzMWhUTUZG?=
 =?utf-8?B?WUJRYTBuUW4ycXZlcXZUV3ZtS215ak5DVE15VGpMRlhZb08xMk5SYlRYSnpl?=
 =?utf-8?B?WWVPdE9CZ2t1KzhydDA0dkYvRzloUGMrZmR6cmxrOXgrMUZGNk5YbklROFVM?=
 =?utf-8?B?ZUtiTEhHU0UyWVpzMW5uUElvM2lMdEpBSTRPMzVDTUcyVVRwWFdmOVRGdDJl?=
 =?utf-8?B?RlpZTDJXVXZLa1c2cFhZSWZ0U21BM0ZteEJwS0Y4SUVyQld4TFFpRDByTE56?=
 =?utf-8?B?NjMrUWJQUzZnYVlWSVg1dFhoWFlkS1llam0xb0ZVZmYvS3J3QVhtb2RhVzJj?=
 =?utf-8?B?R2M3emR2WXovRVpwcFNGbEg0RGtWa3JhdUJiRXQvSVhsRUU4cXR1akFzL3Zr?=
 =?utf-8?B?dG94T3Q2YjcwYWVtRkNQMkV5YnVBPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd535a49-bac6-48c8-d925-08dca0bdc658
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2024 08:53:31.9482
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ZYMbqnCuBB2Bddc3wnZeItIa4EBzptxclB86qHzfm5fbZ8JYniOhpp20AamcXxT7CbgwEZg8KWDZf6EPmTN5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7620


On 09/07/2024 22:46, Vedant Deshpande wrote:
> This patch ensures that Orin NX and Orin Nano enable an identical
> set of serial ports. UARTA/UARTE will be enabled by adding
> respective nodes to the board dtsi file.
> 
> Signed-off-by: Vedant Deshpande <vedantd@nvidia.com>
> ---
>   .../nvidia/tegra234-p3768-0000+p3767-0000.dts   | 17 -----------------
>   .../dts/nvidia/tegra234-p3768-0000+p3767.dtsi   | 14 ++++++++++++++
>   2 files changed, 14 insertions(+), 17 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dts b/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dts
> index 82a59e33c46c..5dc974bb360c 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dts
> +++ b/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dts
> @@ -7,24 +7,7 @@ / {
>   	compatible = "nvidia,p3768-0000+p3767-0000", "nvidia,p3767-0000", "nvidia,tegra234";
>   	model = "NVIDIA Jetson Orin NX Engineering Reference Developer Kit";
>   
> -	aliases {
> -		serial1 = &uarta;
> -		serial2 = &uarte;
> -	};
> -
>   	bus@0 {
> -		serial@3100000 {
> -			compatible = "nvidia,tegra194-hsuart";
> -			reset-names = "serial";
> -			status = "okay";
> -		};
> -
> -		serial@3140000 {
> -			compatible = "nvidia,tegra194-hsuart";
> -			reset-names = "serial";
> -			status = "okay";
> -		};
> -
>   		hda@3510000 {
>   			nvidia,model = "NVIDIA Jetson Orin NX HDA";
>   		};
> diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767.dtsi
> index 6d64a24fa251..81d4f4f12ab1 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767.dtsi
> @@ -9,6 +9,8 @@ / {
>   
>   	aliases {
>   		serial0 = &tcu;
> +		serial1 = &uarta;
> +		serial2 = &uarte;
>   	};
>   
>   	chosen {
> @@ -16,6 +18,18 @@ chosen {
>   	};
>   
>   	bus@0 {
> +		serial@3100000 {
> +			compatible = "nvidia,tegra194-hsuart";
> +			reset-names = "serial";
> +			status = "okay";
> +		};
> +
> +		serial@3140000 {
> +			compatible = "nvidia,tegra194-hsuart";
> +			reset-names = "serial";
> +			status = "okay";
> +		};
> +
>   		i2c@3160000 {
>   			status = "okay";
>   

When running ...

$ make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/serial/nvidia,tegra20-hsuart.yaml

I see ...

arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dtb: serial@3100000: 'dmas' is a required property
	from schema $id: http://devicetree.org/schemas/serial/nvidia,tegra20-hsuart.yaml#
arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dtb: serial@3100000: 'dma-names' is a required property
	from schema $id: http://devicetree.org/schemas/serial/nvidia,tegra20-hsuart.yaml#
   DTC_CHK arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0005.dtb
arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0005.dtb: serial@3100000: 'dmas' is a required property
	from schema $id: http://devicetree.org/schemas/serial/nvidia,tegra20-hsuart.yaml#
arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0005.dtb: serial@3100000: 'dma-names' is a required property
	from schema $id: http://devicetree.org/schemas/serial/nvidia,tegra20-hsuart.yaml#

Although this was already an issue for tegra234-p3768-0000+p3767-0000.dtb
it is now an issue for both boards. Could we add a patch to fix this?

Thanks
Jon

-- 
nvpublic
