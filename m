Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012028.outbound.protection.outlook.com [40.107.200.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C5E34BA50;
	Thu, 18 Sep 2025 09:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758188746; cv=fail; b=pQfWKBCVIzsesgvBrwAXLgnvVVZq84Ljk+5Fvtbb7ir/m+eVcIcsG4iKNtfHnSZno3aRTYWesYb/rxqsbPi4Grjc3ADGsJdC1r5oyfmhAQE607vfwAOYuOQMdiVc1PN6LHjB9qZIsKExuE2Y6OEB2JcUDB07CUOfSR8cYG55QGo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758188746; c=relaxed/simple;
	bh=S+85kAg4PKtsWt+0zbU4fNlWcFVvAhbMr5uUJ79IZlU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jF16EFePw314IwZPvMG8nT6Hr0lAZKeA8QXG0UwJWQLKpdVaLTvjc5oZUfQp4YrV+exI7oAyHrjLSi/Hd5FtT7Hy9HsAh/5FZ8UYnVaewNriH8VN5mOe+5thHprK2QHGicL/d7tW2D6spSLs1SZZeX2v9iXgHOB6Ixf6voR8Gtk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=c9uPSBoh; arc=fail smtp.client-ip=40.107.200.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="c9uPSBoh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=idQQKAeuOgmg1SkJeJRTa5LgX8+Mcpcd5wJ3PGyWSZG3iVDfoUZAXy9Ginsc2rSt+lDTOpB0/gTHj+/qo1DkfZUIqPTAN5AgOJQZ2EfvKI1CuM2lUY7T01PEihJL79mnCaT3OIG5ZV+bVu/NCo3Ng1PFFBi4ytO6Z9d6nIFziu1wbSaRaK+IxxOlQPMlhCj+5QkdEC6C7bAFyoZRyh1QPEpQ4ShkYOS5CVew2QsqDSCWbHbN24AqF6BHzu+dLzIjc0GZeWoxkQ2DSnOqBATbcBKD/QkRgx0mHCCo8NYdwlEafdzZGDMYkTRxTWzu5hTUm70Lvx90gvDcaBhzjR2HMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3LbkSFUduJJ3zC8UkhPjkHTBKdAxoZ20euTYbilETOw=;
 b=X7B1kXR6hSLEElZwz/0V/5EwXwYXIHcJUSU1QgKfj1q3bTmvRyZxTdocrxC51mWCg5MliVWu2MSZ9EKi9vdQi2BhzShI3KccpVF8y86iSGz+Xg3tH/nHlMc2zA+pxdFtXsK9QjA+Fjogc0sS7j86KeV63Loe3p/wTBUMoPWiwUd3tnvC9xqzojPIs8z+SchbOeOYadWK9cBRkL0Xe6bVWEpCL7BJV9TO7I8ETnXeSNdIq/2FU6JOG7aHjTm0AZ/3B4by6VLuIIQkICPpmkNTfydqkbLBTyeb3eBN12LA0MlpbKe22jnBj8lfQnYDb1PBOoD2DZYwUALWhWtzCM45TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3LbkSFUduJJ3zC8UkhPjkHTBKdAxoZ20euTYbilETOw=;
 b=c9uPSBoheP+imTjU6oRf9f4qbt1+ONWDUJJIzHD8bfVcWSvCS2cRCwzYrzC2A66fOAZJjKTQ+qq1bYRJ5rqWHxWAaXx1M7dBy3SPAqDiePmsXrEPmuqX8zChai+1lKD6vPH1wPpGZSGL1M65zx/yd7qS196J/j92zl7WtUtJIw+JqwCwBpf6p+LSeHR/9aXrO7vYRhBiyWaN48s6oQac6TSbPMipZva4hNge+MbrM9Ae4RNDwBX9IfUVi2xIKId/oZXc0tHFXlyRSJfCX+vXmBfWWkeNg+KFjS/luDhdM/ax8uHJd3gYSMDm8XqIx1gNHH2bOnU5wKzotLXXAqgeYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by SA3PR12MB9108.namprd12.prod.outlook.com (2603:10b6:806:37d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Thu, 18 Sep
 2025 09:45:41 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%5]) with mapi id 15.20.9115.022; Thu, 18 Sep 2025
 09:45:41 +0000
Message-ID: <2334a545-9a06-42d9-8282-674b94fdcb2f@nvidia.com>
Date: Thu, 18 Sep 2025 10:45:37 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] soc: tegra: fuse: speedo-tegra210: Update speedo ids
To: webgeek1234@gmail.com, Thierry Reding <thierry.reding@gmail.com>,
 Joseph Lo <josephl@nvidia.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Thierry Reding <treding@nvidia.com>, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250903-tegra210-speedo-v3-1-73e09e0fbb36@gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20250903-tegra210-speedo-v3-1-73e09e0fbb36@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0155.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::23) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|SA3PR12MB9108:EE_
X-MS-Office365-Filtering-Correlation-Id: 611caeac-82c7-42d4-6117-08ddf698219f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RWRiSlhxRDdWSURYbTFKYUNnbVU5YldTeGlybXMvaExhblM0T1lNNVdBcitO?=
 =?utf-8?B?aDhWOGVyUDZVMmhReGZ5emJua0JTVlNNWXhLKzJQRU8rMU1YL1lmekp3OHYx?=
 =?utf-8?B?QitFb2p6d1owWTRkVHRLRDRVZkhWYlpaa3FiMmNwcWpuQVJFU0JGSVUwR2d1?=
 =?utf-8?B?QzNHQjR2Y2hSaEl4SXJtUmRFUWU1MjdqTlFiOHI1OTZZN0pLUnNMbXZjYXY3?=
 =?utf-8?B?dmFPVi8wUnZoMXQyT2M0WXd0WVh2dVBVNGZZWUFzQmJ3UHMxZ2lRbGxzYzhO?=
 =?utf-8?B?eDlyd2RQOUszbVVRTlZrNEh3V1pPNHJMQk5XQk9VY0JDWlllZ0syb1UrMWQ3?=
 =?utf-8?B?NXlnenQyNko0TDA1Q3RkempxREQrSEVpZkU0aE5DWmI2WTJDZzRNVDdLZ2pY?=
 =?utf-8?B?d0xLM3l0WXkzYm9kNjdCY1VnL1BwN0FZT2doRGZCRmtNYnZTd2JWbm5icjcy?=
 =?utf-8?B?M0hiUzBIbW5Vc1VSUDF6SkpxbXZ4aHJ3b3JTRi80SE44dzFrUWR2bGgvdXZu?=
 =?utf-8?B?bTRMVGR4UDREVG5tQmdmdnhBTWxhSzRBcGpyc0xURFZEMjB6eG9LZEVwWlF0?=
 =?utf-8?B?SXF2RzFPU3I0bS9zaTNRUkxkeFpqQTVURWszWERCY0gxeXJja0hWMkordG1L?=
 =?utf-8?B?UUdQU0x3RlB4V2ZHUTd4MFdaMFN0RGc2Y1VWTlpyT05tTGlMQ21KcDcvNjJM?=
 =?utf-8?B?VnRXYWxWR3p5YVFWMXV4RDBOU1hlWDljTEx1UDU0MGEzcEVvbEJkNXRnUTRB?=
 =?utf-8?B?Q2pUVTNaQnJwSEJOY1N5VzVraUFoZnQ0MXpMK1A2UEJYVmRwTzJkWGRoN3c1?=
 =?utf-8?B?Yy9DemNTNUo5MzdvclpYbUk5T01zL0YxRDFCUkpBZjlpQ3pVUm1qcktqSU1V?=
 =?utf-8?B?MzZqQ21pWmR0YnRWb1ZnSklHb2R5WVpXeWlZYkRNSW9SS0h1MDh1SXlRaFdZ?=
 =?utf-8?B?RDcvMm8weldKc1ZVSXZjRXNYZFF2ZVhqZ3d5eXpaWW5wa3crN2crSVRoTkll?=
 =?utf-8?B?akhKY2IremFGOWdCc3Z3Sy9SSG5SRzh4OXZGYTNBeW0vOU5QRjdrK3VtUVJE?=
 =?utf-8?B?QjlRdmZOKzFDYzlYU295d3ZITW1YME12WWdvUkNFR0ZnTkNhYUw0U1M5Lzcz?=
 =?utf-8?B?Tk0wM0p2MWdpcTFrdVorcEw2QzdZL0tpODRSdyt5SzJEdDk0Tm5CZWhYQnA4?=
 =?utf-8?B?QkIxRk5vTTVJU1IvdE8yaE1lL3pSTnZuN0Nrd1NQbk5KWVpwcDI0Q25lQjVP?=
 =?utf-8?B?SGQ3d2JtZWZrdDdlOForam83bHd6UnM1dDFPT3hjSHM3aHBzd3V3ZVF3WUlw?=
 =?utf-8?B?Q1RiR2RnbktSZXFCc2JEMFlxbG50Tk5vaHFIWkF1Q2xwQTI0VVRhSE9RVExp?=
 =?utf-8?B?UXNWRFNBTzIvNEYybWsvRzd3dEhMcU01T2pLaU5KS3BOODZnMjZNVFpPOXda?=
 =?utf-8?B?cmdCUDRDUlNCUUJSK1Z6VEVQN2JUUlBrOFhnaGJHVVQyaGZUZnFLeEgvcmZy?=
 =?utf-8?B?eE1IYTJOZzhOdi8yVEtJTTFVdjZEOXlzTUhTSkJUd1QxbWppcXJrSFc2YUU4?=
 =?utf-8?B?aERmWXZNcVJOS1RsT2g4L0lrZFlLNFFOdWRBS29HOWIySTFnM29WN0I3Qjl0?=
 =?utf-8?B?bHFieW9kQUlZSmMyN3VBZFdvVlFuNmxMVjlXMVI1d3YzSXhiTmh6d3dPdkRO?=
 =?utf-8?B?NUVmZzBGWHlHRkZyMS9PWkZwYnk2Sm9WR1hYUTgya0IxRTNsaHdIb2Fqekhy?=
 =?utf-8?B?MHU3TUZyUjdXOU4xcUVZemQyRkVrdXJYN3VEc1JYbUNPQzFBQmhiU3NWRyt0?=
 =?utf-8?B?T3VOS3VYM3EwTlJwUExObW55S0x2RkpNTnNUNzBURjNlZ3c1SWRlYjhOY2Jo?=
 =?utf-8?B?TXNkUFAvMjBLTlJ6N1A1UzVlbW41UFJuK1ZGcHRqWVhtaDlYUTRaOC84T1FV?=
 =?utf-8?Q?7nf0ZY8ZLF0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bElRd3VxaitvbjNrSVF3Q21xdjhFUS82T0Y3ZDVVb05IdmtnVTdNUFY5b200?=
 =?utf-8?B?dnVNUE1TcXpzWGF0TXltaWZBemZISEl1VU84VWVVUmMzNWlEajdPT3hoMHhq?=
 =?utf-8?B?L1lzRC9mQWRhUUhqeFpuVDAzMDVWN3BGTTV1dEZVNkN4WVlnSlo1azQrODBv?=
 =?utf-8?B?OE5ja1ZnSnRZWkp0ME8zcnlRRTgzTTNhUWZrRC96NEF0azNvTGhXMXlqWWYx?=
 =?utf-8?B?ZHVWQUJiWHlEUWJHemxNbHAzRFlQc3c1U0dRMHlEKy9ETVEyUktTQ0x6UmZD?=
 =?utf-8?B?aDIyMkIzc2I5UGNFSFpSTHVLOGRRU3B2MTVWaGpnY2dCQVpXR0dneklZOXh2?=
 =?utf-8?B?c3ZsRVYzSkg5S0JQVGZZYUdxUExwMjhCM2hxbzVCU1M2YzhrYVJ0N1FNWWV2?=
 =?utf-8?B?MDk0SnFGc0pjZEpGaTd2cWh1NjBiajhvN0k0aWM4Q1Irck5tNjN0cm5xa2Fl?=
 =?utf-8?B?MWJ5WGdORENZR1l0Q2JCbnNoNnByNnVtMXFRVUhVNnprWlhJTE9KVzhJR1pm?=
 =?utf-8?B?U2FobEZiQ295STBrM0NpOWZpR3NxcDJRd090VjNKVkYrbnlMM0lkVmFhMmFi?=
 =?utf-8?B?OG1FWTVJNmczY0l5R0p6NjJ2SHBFd0MyWXF0UWo3aXErZzNCVFFDd3ZxMm5t?=
 =?utf-8?B?ckNtUSt2RGk2WUlRWDc0U3lNOEppcmUvdFVqTzloOXQxZ2R0clJJRlN4Q0NF?=
 =?utf-8?B?ak8valZ6R25wNWd2L2szdk1hWkh0WExETklHaWYrZVVtbTJrVkRuQ3NWeUtE?=
 =?utf-8?B?TFZPYVJTcU8wWldlbnlzdFp2YkVlSUdWMU1janVCT3pLeUVuNHdyWjdZK0lm?=
 =?utf-8?B?Z2U5T1Z2MDBSQnlBUEIzYkNBTGZRVStRdkR0YjVOdmVxakFYV1c3aDBPbnNm?=
 =?utf-8?B?akcvNmNiNzZpVVd1KzZFVE5zaVhkcGtHdmk1YjVJWFVlbDl0bmQzZXhiVDdS?=
 =?utf-8?B?M21VQXpkK2Rsbys5YUppbG9rL0JnQ0p3amNxZnU5d0FhYmZoeGlHTm1yeU5y?=
 =?utf-8?B?SE42T3pwQ2g0c04rUlhpU0NGUzJ2OUMzUmdRNlJuZG5iOFhCclJiWW9WeW9Z?=
 =?utf-8?B?K1FxZUhDclpxYjlKYTFKdHRMSEJ4dHhoUTVrOTRrRjk2TEJQV3BSSU4zNXNS?=
 =?utf-8?B?K25GYk1UWjhaYnpob1VGN2pEbmpZNWMzWllHRGZ6NG9xVUk1d1V1dTAraXow?=
 =?utf-8?B?VHJrMXZ3SUcxVnUxM2dkcGxYVWpmeGRhTmZNQXU4YXNhY0laK3FUTFhsaCtT?=
 =?utf-8?B?c29ycHFKQUNJQmo3WGZDSncyV1lOVTFxbGhCSS9sZWJwSCsrUWNWUlRWek9r?=
 =?utf-8?B?Q3NMSEZUY29JRG9xK2MvQjJaa00xbTF6TGdRV1ArU0RySkFlTnRLR2hYRTRl?=
 =?utf-8?B?M0Z1MmpFRDkyOFRHNGU1c2FPNTFGZkVqL2YwTERsWGdQanFQeEJxaENOb21l?=
 =?utf-8?B?Tkg2RUlEWTJBS2g4Q0pJajAxU0NoVDYzUlpNdlEwdUdyY3NTcktsQkExbW9p?=
 =?utf-8?B?WmFIY2pLMXF2MHFVTytSdXNyYVJ0c2p5ZjZSUUFHK253MzRST2RmSXJBQ2hC?=
 =?utf-8?B?eEEyMUJoekpwSEJodHNLZFZpL20wL1NTbUlvRDFIWlNzalhNVGh0L25UZGNX?=
 =?utf-8?B?cVZIdXdNcStlRnZSWGZoZzFvQlFSbU1tejRTcFhoenVYUGs3NEZkT1U0VGV2?=
 =?utf-8?B?dC9aeDdlVlYvNUxkOXZidlVNdnlwTE12d1ZxTVpBaGJuR2MvNXFuNGpIRlR1?=
 =?utf-8?B?UDExR2VDelhrYkhBWVZCSnBHdHRNOEcwdlRlRW5BU1JtdUVxZTZheEJUeFBN?=
 =?utf-8?B?a0cxbWkwMTJqTXNqdFgxcFN5Y0UyRUt2T2d5WEtKeUFBQllJUitpOEk2cVBX?=
 =?utf-8?B?VDFncGFLbUZNankvcHVUNnpZcHUrQlIzNU9rWStWT3FVeStxeFpJNnAwOVBv?=
 =?utf-8?B?a2thZi85YjhvNDVvVElWb0d4anArdnYrVmdwUTk2WVpudFI1UEhBbnVZTlhl?=
 =?utf-8?B?cFB5em50YTdnSVNYNFBzZE1JNEt4WUM0YVo1eHJ6WFlUWGIxby9VWWRCZFdz?=
 =?utf-8?B?cThEWExlU012aVdITHlrYXM1SzdMMjJFN2syWEw0TnlIZm1aNmQwYTNyVWlC?=
 =?utf-8?B?WUFrTS9YWU1kblBFdVFxRkZqMTZiRU81ekhpNFZhZE80NmZpbnlVL3kxcUc5?=
 =?utf-8?B?Zmc9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 611caeac-82c7-42d4-6117-08ddf698219f
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 09:45:41.8532
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ksm6Kd3n3HhG4Yaj7Ytse7xeWW8qGs0Xd8I1en9s4xZmSzqxEDBsgAXl15StBNbbyP98STWmvWSMlXzKfqC2QQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9108


On 04/09/2025 02:58, Aaron Kling via B4 Relay wrote:
> From: Aaron Kling <webgeek1234@gmail.com>
> 
> Existing code only sets cpu and gpu speedo ids 0 and 1. The cpu dvfs
> code supports 11 ids and nouveau supports 5. This aligns with what the
> downstream vendor kernel supports. Align skus with the downstream list.

Do you have a reference for the downstream kernel change you are 
referring to? I have found this change [0]. However, this does not quite 
align with what you have in this patch.

Jon

[0] 
https://nv-tegra.nvidia.com/r/plugins/gitiles/linux-5.10/+/2a8660e3d1e4f75ba4390b72991744174237b025%5E%21/#F0

-- 
nvpublic

