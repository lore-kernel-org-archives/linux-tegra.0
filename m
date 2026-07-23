Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010043.outbound.protection.outlook.com [52.101.85.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17DF6374E40;
	Thu, 23 Jul 2026 04:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784780323; cv=fail; b=dPThe6xWW7ximBlcRCXEmh0p7Asfybpx+aDRk8Spnd21ZzoyNkK/2erNihM7OwNLWscm5JSrpZeXEMS+16Gj4aQe2Yy4GtRrsaHVsON8wKM5sumiX6JuEUf/TsEuNwmiI48TbKLZk32TQy6J2ZdivtItbVroG4zJDOkFCG6exfc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784780323; c=relaxed/simple;
	bh=L806BsAV7SV5mD1qhunQT0/AV5vU+23d/2sb2UvBy7o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qd6nqptsdTSqsqMaLEXb/ai7R9qlC44UFYpMDXI1TNy+8EUoNPEd15nuFKG8Q9N2t+JeQtzyCY524GLa3NWur+RoZTnF1IcPZdciEbB0jK1WMMRc5VnwwJs2rFTM54QZfLay2zd4sI2KsfYluFZyoYCxgkxkT6aRSB5l1aK0LyQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=kdOOo11L; arc=fail smtp.client-ip=52.101.85.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="kdOOo11L"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XMWqd2IFiCoAYu4u++xIHDkujGGA/REQPkdnXAqs6Nx8illk9Oh2nama6oFwzp1RVzsGQwI8Xnm9n4/qq5w3T82e/dDyhM6WjXaLkvb1QyVn/NTpZtukXs6e45eZ+zJbc/t9KbfKEj9IdikueCvuyWNgSpt/qmyNfBy+jlceVW5I1XjnRYECmrHdS67ls/lmNRTqn7F2ut5Wi0mzomVSKAyUBcVmMGlc8kRwRYiSSKGBC9svaEYupCu1jIFWTIMkTSZvnbUxSS0OEIbDbXqCbeLCyk7q6sGDkUZgzfjoAI/5XLAJQrDDmXEYH7JxLP8+5h0/o394j+G/9L0vQJfbyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/VTXmaTYEzqQS+TP74aml+gz6dqwqOHnLeg+WxBLpWQ=;
 b=niSwwdWc0R/vAbMFD2cl66RBEXY3P/x96Zn24mHJrcQq78t3gArh6CvOSdhtg+g0UtOFXySG6ArQqdItfdWA/rO+GI7mYxsOugahgiv+NbfclcQeBUaOePjuWAj1qt0OsC5CZYCyWbsohrgzT6I0BthHvViBYxBJQBK0bKExgEZ25vGWrBvxDGg9C9x7cYTGI61DvitkD+VpiPxaCYiMqRZDPzz15nBqcQxMsjQFpgoD2/vhxFZXG0jGXJa1jarpq/PEwL1XWzpTKQVR/6261Di9tlyZIxQmmWmdojlZj3YW1EMG4Tw/i0UZEXioN+aGa28bjf9CGgSrzktTpJNk5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/VTXmaTYEzqQS+TP74aml+gz6dqwqOHnLeg+WxBLpWQ=;
 b=kdOOo11LX8IH2F2mGYagG+yac80bi6WVTKuwx/CU2jZSnTPRw9rpj3d1zqahzPx3HgX38yGCiypuj2F+zuW7TJYDfllLVwCe+D8xreQnGq0a6wP3977/Z5qp90WO9+8B4oixWhZWU/EjxDNk9AHbsnYspAo1G+9FgGaiNYqn4EcODBnX6K4z1xImMz2mFZwjUlpxzmn+6+ZkejwBFcV+03LuPTLKS0aHxagXp2Mzt/0Ou+Rb8CudMi24H3ynFMzSWVcDiyA2FkKz0qDaAanlr6+0dgfjjtLXCmOrA2QDZfwGEN9Wo1q3g0Gz/ZSm9l4htX6BQoc3IPD8Ubw152C5NA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by SJ2PR12MB7961.namprd12.prod.outlook.com (2603:10b6:a03:4c0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 04:18:15 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%6]) with mapi id 15.21.0223.017; Thu, 23 Jul 2026
 04:18:15 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: thierry.reding@kernel.org, jonathanh@nvidia.com, skomatineni@nvidia.com,
 luca.ceresoli@bootlin.com, mchehab@kernel.org, gregkh@linuxfoundation.org,
 Faisal Mukhtar <mukhtarfaisal03@gmail.com>
Cc: linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Faisal Mukhtar <mukhtarfaisal03@gmail.com>
Subject: Re: [PATCH] media: tegra-video: Use BIT macro in tegra20.c
Date: Thu, 23 Jul 2026 13:18:11 +0900
Message-ID: <A0-05eQLQFWwHGewIFE3Kg@nvidia.com>
In-Reply-To: <20260722154055.385164-1-mukhtarfaisal03@gmail.com>
References: <20260722154055.385164-1-mukhtarfaisal03@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: OS7PR01CA0245.jpnprd01.prod.outlook.com
 (2603:1096:604:24b::14) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|SJ2PR12MB7961:EE_
X-MS-Office365-Filtering-Correlation-Id: c581be49-e576-43f1-163a-08dee8716a66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|10070799003|22082099003|18002099003|3023799007|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	3P/pkDd9zinyUW6ES4usbulcKztIixi8loduTyryhoVW8Trw/MCbsWIs7e4q22YZ9I0BBNWaKHjLLp2srwDjzmWwJ7f0vGz5cQhow+zwweWXzPCgSsT5UpFKQjK2gk+kR93kPKFG4BUHLrv4gLiObwydOxJnhvsUZBtmNGjhAiSjDYFZBMdJsWEMlM/Z4NY0HiQcGCq5yIwqkeF/XzQOZTozxRyrG+cnPlD//0eBtLEEoQeMpEKyxYEX+8o70f5CM0EzKrgmvbAciWu7PMd0lPtEV6cKEI4NK7Lg++1gGbDyyV3w16OSx3ShiMqr23dg65XDgEEHInrBQ87bNFvExd8iNsVM/sGfY+UlY3Ty3uatREq7KTieDgGFevRi331XPtIvFvMnYOYYDVnX22X1jG5GEzCULAVI9FlJ2MgAlgnHYQ0Hfir3JxXzP0hpXfGCZdBhPL6WFXoyHznDUo9po2bqEyiK4b+n+UU0Lm54IZQiSyrrrwxVwogbKlw2V6A+YvwHiwcdQUdDVLXfMi8ML1UsB2WctIFGPJRoykGnj1BqHCQODLEcovcI9QmGK30IIbMhdxQuA+Pnbv31XEYpKWxn6/Dm++QP9j8PDYR6ok+0Fa4wTKb1D2Y2/a15E1o8Ma0XgB3PmV/ozdM5eBNpvyIMLEDpZ9X+pD/VCb1gaRo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(10070799003)(22082099003)(18002099003)(3023799007)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZHlCMjJGZ3g3Q2VDMEkwTDM0anNyVTVkOUh2cVEzbXlXK0M3dGZlRkZ2dVRv?=
 =?utf-8?B?VnNQdTBhdXFrUVQxelVxWGlKd3Nqc2lGNXBOMVZhUkpjZU9GSXNycXVFRVp6?=
 =?utf-8?B?STM5TVBDbE15aUg2TW9kZHdGdFFVMVlHcnZVRG5qK1lRNytlQnczL0NtL2Rx?=
 =?utf-8?B?SmZvR3o4Tm1WRjM3REhjOGRxVnR6MmZQaVVJcG00RGNCVlRKeVJhY2E0Qm1W?=
 =?utf-8?B?OGZWNTlSTXluZmZZRUhIMW1tWUJaNDN1RW9iWXdTUW5kcUhFS3cvZnRqUzVi?=
 =?utf-8?B?SjdLQ0syeStsc1JHUTVPVk8wa1FHZHFKQmJERGJWUE82SG5SaE1YM280ejdt?=
 =?utf-8?B?bTlCREd1MDBVb3EzR2VJOWJHbG51SVExdWozS1NCV1lkdFU3ZjZ2aC9KdktF?=
 =?utf-8?B?Q01BSVpWakFsK1BPc3dxZjZ3OGU2VEFpWldsY0pZejhKMnAwQjdMVy9EVm1I?=
 =?utf-8?B?dVdzaFBRb05FM0pXL0poTkFXamRaTzUzQzNGVEtLeU55V3ZVYXI5azBUd0hJ?=
 =?utf-8?B?NzJhWXZDZW41QVdON0ZWZGkxMjBTb0VWKzBFZTNXbDBRcmdiS0FvVUJQZkRR?=
 =?utf-8?B?OXg4YU9EcHRkZTlmWU9wRDBSTHZsd1ZRV3dnM3h0ZWxDdnJyNU95VEZPVXJI?=
 =?utf-8?B?ejV1dDRMSXliQ3MxM0lvcGxWejJrVUxRU1FHR2hib0ZXMXoyQlVhd1FpRVc5?=
 =?utf-8?B?Z090TkxSUlk3Vk9RYUFROTZnL3BqTVJNYlljVmptek9PNWFBeEZQK24wMG5p?=
 =?utf-8?B?VUxXU0dUaVpxeDJ0dmp3NU9RVENlZHNmUWdKcjRzUXdLbnd5S0tqdGs5L0Jo?=
 =?utf-8?B?dmd6dDZwd2NjWGVxVGhtSnVITXVFOVBDTWh4M0cvaEFxeHJ1c216aEJxOWVj?=
 =?utf-8?B?OGlobkpPQlllem42eDdDODZsZnlsTmwxMTFSdmswUlo5ZnJmajNMd1NKTUR3?=
 =?utf-8?B?TTdLUmVUYTdKVGxybGxqcEwySEFTOS9DMlE5UDA0ejl0d1NTWGZ3MjYvMnZo?=
 =?utf-8?B?S3JxQjVvbmx4cXZMVnZSRTNUWHVqNWtuWWZSZDBTSVBTeGo1ZXZqVVNEL0R2?=
 =?utf-8?B?cHdCSXgxeWk1eTNFSUZQeDR5RDEyd0tIU0JxYnZjY0dIdjA3K0svQXNoU1o1?=
 =?utf-8?B?WFFCS1k5a002K1k3MlpDQy9qbTF5RDFPUFlZWVovOWhZejdzNlpVVnVoMzhP?=
 =?utf-8?B?VnNEaXFWTlF2dHM0bklMejFnTG53N0V1Mis4OUc1WFcvZk5ORm5udFUrU2Zs?=
 =?utf-8?B?VEpVK2Z5Vmg3Q0k3Mm1GdnZKU1MvaDZqMFp0MkFZSU9zZHBWR0dpMGRUdmhy?=
 =?utf-8?B?ek5WUGRDVlhyRndwZHNvUEZkS3ltWEpaVC9IUWpHMEllT1J1b0hnNXlESjYy?=
 =?utf-8?B?WTQ4enlOU2R3NVdUZ2RBTFJJcVAwMzdSb1VnNEE1NmJJVzJKczFCTEdrN2ta?=
 =?utf-8?B?a21PUkxERDExckgvMFMxK2J5UEJ5SXNVOWlrV251dkNyaDREWFBtY0VicEtC?=
 =?utf-8?B?d1pmVDhBZ1JPRk5Ha2xLc2NsSmhwL0c4b0NIOHVxU3FtY0VRSWFITTYyVGpR?=
 =?utf-8?B?S2dSQm5Uck5nZmZCSmhlbzRsMVRJM1Nxd2NWbis4REM3UmVRT2tqSjM4NGhl?=
 =?utf-8?B?NVgwNkg5ZU45T2VnbjZzV1hSTHFFZmkyOFA3ZTNleEE4dXZEbGp1SGFYd3Qx?=
 =?utf-8?B?anlQQSs3OC9OaXJyYU9HVlhnNWQrenBYanhaV1hKWUo1L0ZQZXBTY05xUW9w?=
 =?utf-8?B?aHpxL2Vra2JwellqVmRadFpVanQwVjFJSzZyVjJsS2JKM3RDSVg2azNWVHhI?=
 =?utf-8?B?enYvWkg5UFIvQXltejFpNy9xOWdVWklCMmh6WXl0dnZWcmtLYkE3OVRuTXNq?=
 =?utf-8?B?cjM4MzJyTWtIbitGS2NHaXRjeE04N3M3Y2hDSWxXRGxyYnhwYzltU3hTeTBr?=
 =?utf-8?B?YTd6RFFXQjQwYXpJcEY0dFVVdDYyZ2E1L3JtSUxnM0c1YXAyWjFMMGxkUVZ2?=
 =?utf-8?B?cU5DQXZDOE9aNWg2WVdMdkJIbjgrWUJ0NFlZY3Zld2NBS015cU9qS3pXc3JP?=
 =?utf-8?B?WHFzbmd6MUdOYVhPSmlKNHJ2ODFnYk5LSEpXZ0tsRDJsSlQ5MXZZZEhaNkVs?=
 =?utf-8?B?ZEczV2h3Ump6citmQm9oRFQ4Y3YxVFp1SUxWcmJOc2xUYkxpRVl6YWtpRWtx?=
 =?utf-8?B?ajBIYWMxL2NvMGw0ZkVkUnVYdTAzQjdnUENid1JjSVBhc3NaZlFUQjNFRmdz?=
 =?utf-8?B?ZVpsc0ZjS092d3BpZjdmRHhpaXMwbDFnak0vdzRjNmwvblJvK3lFSWV6TGMr?=
 =?utf-8?B?MElwRFZUOHU0OWJ4Qk5XTGw2aVdST2pDVWo1ZDFOT0FRNEVURElxRWFQL3lx?=
 =?utf-8?Q?K5Qa4rKcDJOwtq0/mUKgKvG+J7ve0yIrmK0HNa6H7nSFM?=
X-MS-Exchange-AntiSpam-MessageData-1: ZmZdsfVqw+G9Rg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c581be49-e576-43f1-163a-08dee8716a66
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 04:18:14.9401
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sf5V/W5aWCXYH4ZKgEQPSepbM6uu5B58u9P5p0kOOXPzyUBs5w4NwcnFvz10iVdXSixwxrV65NQoV5+2N6LMsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7961

On Thursday, July 23, 2026 12:40=E2=80=AFAM Faisal Mukhtar wrote:
> Fix checkpatch.pl warnings by replacing explicit
> bit shift (1 << n) with the BIT macro, to better
> adhere to the kernel coding style.
>=20
> Signed-off-by: Faisal Mukhtar <mukhtarfaisal03@gmail.com>
> ---
>  drivers/staging/media/tegra-video/tegra20.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/stagin=
g/media/tegra-video/tegra20.c
> index e513e6ccb776..cdfd9f276d11 100644
> --- a/drivers/staging/media/tegra-video/tegra20.c
> +++ b/drivers/staging/media/tegra-video/tegra20.c
> @@ -177,15 +177,15 @@ enum tegra_vi_out {
>  #define       CSI_SKIP_PACKET_THRESHOLD(n)		(((n) & 0xff) << 16)
>  #define TEGRA_CSI_PIXEL_STREAM_CONTROL0(n)		(0x0018 + (n) * 0x2c)
>  #define       CSI_PP_PAD_FRAME_PAD0S			(0 << 28)
> -#define       CSI_PP_PAD_FRAME_PAD1S			(1 << 28)
> +#define       CSI_PP_PAD_FRAME_PAD1S			BIT(28)
>  #define       CSI_PP_PAD_FRAME_NOPAD			(2 << 28)
>  #define       CSI_PP_HEADER_EC_ENABLE			BIT(27)
>  #define       CSI_PP_PAD_SHORT_LINE_PAD0S		(0 << 24)
> -#define       CSI_PP_PAD_SHORT_LINE_PAD1S		(1 << 24)
> +#define       CSI_PP_PAD_SHORT_LINE_PAD1S		BIT(24)
>  #define       CSI_PP_PAD_SHORT_LINE_NOPAD		(2 << 24)
>  #define       CSI_PP_EMBEDDED_DATA_EMBEDDED		BIT(20)
>  #define       CSI_PP_OUTPUT_FORMAT_ARBITRARY		(0 << 16)
> -#define       CSI_PP_OUTPUT_FORMAT_PIXEL		(1 << 16)
> +#define       CSI_PP_OUTPUT_FORMAT_PIXEL		BIT(16)
>  #define       CSI_PP_OUTPUT_FORMAT_PIXEL_REP		(2 << 16)
>  #define       CSI_PP_OUTPUT_FORMAT_STORE		(3 << 16)
>  #define       CSI_PP_VIRTUAL_CHANNEL_ID(n)		(((n) - 1) << 14)
> --=20
> 2.53.0
>=20
>=20

BIT is only used for true/false fields. These are not that.

Mikko



