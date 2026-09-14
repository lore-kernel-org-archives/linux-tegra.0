Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012028.outbound.protection.outlook.com [52.101.53.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2EBB358389;
	Mon, 14 Sep 2026 05:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789363338; cv=fail; b=Q/czOGi0jE+FjTqDwA/eaNK+Go6CwZTsrYffnPoENZq9y9V4cjkleq4mwzK0b6nL2jqrvGcdJ+Em887mMz74ZNJzHxhCLFOKpfttvireby+j4eHRJgfw5GR7X/ir60ze4/mlVxY/iHmCIgeAAUH0GCD3Hm6PkuNJroy7Zsd2wOE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789363338; c=relaxed/simple;
	bh=/OZl/X5rLi4M1L6i1nC8DxfFmzOkFlINiPFKMbCIFDg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TI3VcQdlUx6RlQSoFD0OFI8ahadovrDwf7/mIUMLFhPejzlvO4s4HVM+MKYyYB3KndwEK/m5g9FKh2EMy1MTSq+OXbg0xVsIckIolgdt2CI+GvuXRwF0LRaf7ZlykalV9FwnXS3RDiYVRCUp0y4GsSldIu9UYDqzYC76F0NxyiE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=uZEzedPi; arc=fail smtp.client-ip=52.101.53.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="uZEzedPi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nvrdh9WNFRcyjxHbK3p0RrlqbTumY+ysGczr9/1Yseqq2nD3Ik3I2osPz/QIHat9DGL62kcxOvNy5u5+GbCL/sAQjRr5Ejhju47Nhv2BdCL6cROtAl7YyZJtB3UKjjbKRTnTTHzU75kmH5I3SqX9SwZGRZs3W7eeNNnneF3rKNhqGdFvIR79orcDQjHah+jpmRstm1X7Yb8Zgz3uu/Ieyy5BmBn3At17+AJw0QW4XH0gzbXQLUVpgc3pVbIyWzNGShEpi4CozmlrGShqmv/USLwcDSW4+QbAiX2RQLTLBu4AXgTIyjjdHeaPEnVRkWt6C8NEyf/rYR7e1d+9LVNl+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yqMfXFo5LHCy4bYmOj5PWDHBAK5AD6KwMUnoeVNu780=;
 b=XyG7Slwirr1bUMg1+n3Xvi7G6Ndnh1l9gGD+rnEi6qu9xszoUXTX0OkOICXQRtwMGOzfMCgdachrfyQITKA5wtoQqVfgd/x3ty+9AwsP6HZBa+CrOMhaod32JL3+/6qwOHgKCRPESDf8aqeUEBS9kE/JHOXLDY9WK7tia44OeKomvM8T/mXcgu3tgtGaId0feGV21sUWD5JPbwNy7FCpf4s7kBw4RA54/Z5Mos+Gss7kadiIS35mTzhpi/IBO6e5bV88R138WC3JLq2xrYH0TMNzwkPNNQ1jwVuh1+8Mu2LZ71rtZnoxIEiTKKJDBR1yREctCPjJq4lbWx0XVOL77A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yqMfXFo5LHCy4bYmOj5PWDHBAK5AD6KwMUnoeVNu780=;
 b=uZEzedPizhJSI5lv8WIrMqZRWL0aPYX7BsyPS0RKzrpqAkr4asF1eXxoLGjh6UJc6oUzfPSU5SqLMh5BKWTkiyMC8DL+N/a/l0ksAjHugPVgaQKQRm37wbrrbjboYPgkFefn2Q0FSx2OoFXya/t05eGsBCKEoVgHVAPdHA9OShQE2DHOGKDvR90A9ioM+D8P7KONRtwJH7a9PiOLHZNA0XSWvCX2p8bSuYVVq33JBSzzGUPYvqURfOVgYL8hEJRTK596coDyGmdx3jglAkyuHknJTnHoprQsoCQTPCIbo+PRGY/YCNa9ytCEqz7QFDrVuV2uvGK+EBykbC1vrJCaaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by LV0PR12MB307006.namprd12.prod.outlook.com (2603:10b6:408:3b8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 05:22:13 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%5]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 05:22:13 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: thierry.reding@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 Slavin Liu <bolin.liu@seu.edu.cn>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, bolin.liu@seu.edu.cn
Subject: Re: [PATCH] gpu: host1x: skip trace payloads after mapping failure
Date: Mon, 14 Sep 2026 14:22:00 +0900
Message-ID: <gIo8Vs5ARM2sxperdLO4aA@nvidia.com>
In-Reply-To: <20260913125128.109827-1-bolin.liu@seu.edu.cn>
References: <20260913125128.109827-1-bolin.liu@seu.edu.cn>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: PS2PR01CA0070.apcprd01.prod.exchangelabs.com
 (2603:1096:300:57::34) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|LV0PR12MB307006:EE_
X-MS-Office365-Filtering-Correlation-Id: 766c4f09-a919-4d44-60e4-08df1220226a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|10070799003|376014|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Ug4gAEhxS/RQTRlVw8ihudiRmn3jAX/WKeRMWi164kyGsEwTLP1x9Q15QhDuzETqiiV5Hf0O87HDVlNwEctU8tMFgDCgpVtU7E5ysdsOm7YGkQQfI9CKRlhDPO4k7qVJyjmJAxiKjVkiA0io01BaDEJNwnccCR3smWzVJgtsHhWHbbEahzfqxBAu8nK18bHKRX9F0VR/aWGo8r1JckW4JeAJBe2tcFFPJzt2s9GoSxKTKndaoa8ixgRDknnYMLO0rCZlbMZQX8Zqr7+sgeVnTTic4CVLHxgQGM/Hb9rgE8GA1dEli3ZC9hyE95BycJjaOYh2geaVP+y6B3nQ5h/Ovl1XkZlZ3+n/Y2hQotoWp9fb4SOU9HRTbbiDwuZpyCNRbQX4jobl8x7juxUss3RrL1EcreEuPB4e+MD9n+h/ccgcIqZ+evkilmJy0rDQntJKrxD/jQ/gL5z/LnrqF62yFi4B6ZimHpNrYW/r6bCVBv6y81vYu0pHK8cgEIBj6KQDO39bJ0SDfEdwjtn/qo8u6wjspKJotP/lunKvw4547pqjieORQoqJjAEJSZjbJ+hfNY0ISPVLoXo5DDMHVy7HyXydosYBxyZQJ1phUsF5hyaffnGgkeuqZHL2fjJiS5qLPV1YSzUYTVSlq6nVaVoYq/5iN2915mBQSsJ5ywKL1nU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(10070799003)(376014)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OXZBbTE3cjJhaW02SFJFaG1jQytkRVljZ0J1RXZ0TjN0RnRNSmY5aTd6ZTcy?=
 =?utf-8?B?N0tneDNaQzAwTVZ4aS9HbkJOVHZzYWZrV3lFYWs4SE5nYkpVemcvRk5DbVJK?=
 =?utf-8?B?cVVVQlRkTC9GNXp1R1FKbzU3Y3MyWS8raW40UDJUdkVyTGI3bmNrY2dBTVdB?=
 =?utf-8?B?azFwekt3eE0wUWxjekhiL0I1WjNFNHJ4RTZUQy9LZFlOWmUxWXlyM1lZb3Yw?=
 =?utf-8?B?d29pYmhnWU9CWWNQck1ZSUk2MXFnTi85Yi84WXdYTm5rS1JzNG44Q0RFZGEz?=
 =?utf-8?B?WklUV0Q1clU3SXJmZmNiT3o2QnpvdnpZWXJielhHRjRhVEc0N2loRmNCMUla?=
 =?utf-8?B?OU5zd0poK2E0TEtHR25IVTFTbCsrSnIxaGo3VUpMQzV4bjRmc3hiN29nWGZJ?=
 =?utf-8?B?bjVQR2gzcEFxWlc1YVcvWmZ5azhhVWlFWCtxQnpVbGFiSFE1bnUyclZPVHlZ?=
 =?utf-8?B?SjdLamNiREZZb3pUWlNyMTg2TFFUcFczeHhOSTE0cTlyTnVyVGkwRkQvcTRZ?=
 =?utf-8?B?NW9GUFBUMjZ0YnVGMnUyUkkrNS8xMEMzYUJTQzhFSi8xMGtLSXJTZzZVT3ZV?=
 =?utf-8?B?cEMwR095anpBMUhwUWZJb2dKMVBVcGljMndhdUdYT0RUQ1lxUS9SL1U0TnVB?=
 =?utf-8?B?Rm0za2lJcTF4NnZHSGZPb2hpQkhMSk0rTEM1L3oxUmZ2RlNuYjRuN2xSb2Ev?=
 =?utf-8?B?S0pWMm9lVmdVMU54S0hHaFNMSzNnOUZ1WmJQdGtuTWNNLzZvcTVTS0NETzdF?=
 =?utf-8?B?Z1pvOGtwRkdLLzJNV2R6eTRVcW5qUnRkb3JadmgyakQ0NUUxWTZjMmprS3BK?=
 =?utf-8?B?QVBTWDBCRkFnS2VIU1NDRERkbjhaMWY5cWlhTXlWM1lwU0ZxUHBpd3FsaHZ3?=
 =?utf-8?B?YVk2VHgzT3QrcE9BTHRKanUvd1F6ZFhYVHRiWHdzVFdEQXJPVFExcmJGNjNJ?=
 =?utf-8?B?ZVV2UXpKRjNUZElZUzRLQU1pYTRqV2pOdmEyYlpIZEdIT1FwUFNjTTBzNEsr?=
 =?utf-8?B?Vit6cXo3SEdmMUR3c291djViWXlLVTYyMFZJUjlQc0lKYnZFOS9VVTFnNUJv?=
 =?utf-8?B?MXlWalh6Tjd2SXpUeWVZRDZUeFJPTWJlZXlCZ2E1L1pWNklwVDd4a3gwOTdv?=
 =?utf-8?B?OU1nenhYa0hxWFhJYXBvQ0MvMGNHSFlPSWZwUG1mWW5xQy9adWg1NmNDbWly?=
 =?utf-8?B?QlBYTjNsZFRyZW9OOThZeU9KL2Nrc0hXcmsyRytHbkx6cnROUGxFYVZzSmJv?=
 =?utf-8?B?ZjdaUTJvamdvMFk2SXI4cXd6djc1b3pjNGpTeHBmQ1BjRGgvUW93T0pVZjRj?=
 =?utf-8?B?RXgxQUg1WENxbHNzTGVibERvN25ZVzdtdGFoWDZGUTA1YmN4Mk1QZExkekJE?=
 =?utf-8?B?ejNWOEx6WmRhNVZXdVMrdDhoNmp2Wk5ZbmdtNWF4RndQZi9yS2V5bmhPNnVS?=
 =?utf-8?B?Unc1SU9QZzdTaDZSU0NRT3NxRFBiVyt2SGtQZHgyMEdReEgrbVpVZWIvM3lx?=
 =?utf-8?B?Q29FbWRhRzNXQU9JN0diNVo3cnFRWmltR0xJcUh1TXByek41RjgxVGIvZE1t?=
 =?utf-8?B?QTkzb050aEYyR3lSNkczTkNEZ2JvaGs1OVlyY0t5aGx2MEorQm9ERmFUemtF?=
 =?utf-8?B?MjhNWDdpWVVQTjRja3dCNE9ldDVvVC9xYS9xKy9LQVBTYjMyYUppbkk0aGJh?=
 =?utf-8?B?TExWWldKc1NwQS8xVUxsdVY4Z251aldQMUpqKzFrK216c051VXphdk96N0Vl?=
 =?utf-8?B?Y3RLTDlOdWxJNFVJazlCYnN5YlJzWDFIZHFDVXJCQkYvMnVuMitUUm5rcWVY?=
 =?utf-8?B?cTN5SzBZeTRnVXNvWHlLWWdKZHpvK2k3bEd2bDhFWk1uRkY0YmdLVnpsZDRM?=
 =?utf-8?B?QzNaeVJSdFVhZENqMVJLVmZWU1E2NlBTc0IyNWNINTF4RTAydURjaEZkQ3VT?=
 =?utf-8?B?Z01PZ0xleDEyMHpJWU9jdEp3UkNsVS9ScGxRQllaeDljQ1JocFplTjl1Y1Zm?=
 =?utf-8?B?K0d4ZUhJejlaZHl2cWxTZkJJcEM0VUVTREs3WmNUVmNoSkRkTXY0T1F5MUt5?=
 =?utf-8?B?OGpVdVFBMkx3cjI1ZTdJT1Q5aXYzUnFnYXkwd0I5QnRPdzJxQlQ4UVZiVitm?=
 =?utf-8?B?VHhZT29MU1dQR0VyRktPWVVJL0tlVWp6MytZbTllUnVJRm1XcW5pWERFTEh0?=
 =?utf-8?B?SThtNkhHRkQ4Zk9MQ0JSNTdrZUxBYXRVbjJnZ09FYU1kczdNMXd1MnZobUlj?=
 =?utf-8?B?aEFRcWNPa2J0MHJSVnROQi9tT01pMk1QTFc5MFUzR3cvMmtLdTRsM3IvdEF5?=
 =?utf-8?B?N0toWTR0YUhBUzNsZzdLdFk5cSs5ZTRrb0RUd3ZBekFjbkdyaklSRlNzZ0VZ?=
 =?utf-8?Q?8vjOm+cIaHPhQEJ5HcTdipX0iHSbYOYv7LkD6CYhXm0nY?=
X-MS-Exchange-AntiSpam-MessageData-1: tlBWiDz5b/tXtQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 766c4f09-a919-4d44-60e4-08df1220226a
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 05:22:13.6733
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nDDXq8AvgddDNujcwR2OKVNVm+ZLNarrZH3lgUr0KsuvUqBefeq0FNtuyse4hlfXteUfiZIZNXv9ZrHFyvQLVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR12MB307006

On Sunday, September 13, 2026 9:51=E2=80=AFPM Slavin Liu wrote:
> Command tracing maps the original buffer independently of job pinning.
> An ERR_PTR mapping is non-NULL but is not readable. Skip payload capture
> and unmapping when this diagnostic mapping fails.
>=20
> Detected by static analysis and reviewed with AI-assisted source auditing=
.
>=20
> Fixes: 3f257bc63c0d ("drm/tegra: gem: Do not return NULL in tegra_bo_mmap=
()")
> Assisted-by: LLM
> Signed-off-by: Slavin Liu <bolin.liu@seu.edu.cn>
> ---
>  drivers/gpu/host1x/hw/channel_hw.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/host1x/hw/channel_hw.c b/drivers/gpu/host1x/hw/c=
hannel_hw.c
> index a8251ec0810c..19949c99c427 100644
> --- a/drivers/gpu/host1x/hw/channel_hw.c
> +++ b/drivers/gpu/host1x/hw/channel_hw.c
> @@ -28,7 +28,7 @@ static void trace_write_gather(struct host1x_cdma *cdma=
, struct host1x_bo *bo,
>  	if (host1x_debug_trace_cmdbuf)
>  		mem =3D host1x_bo_mmap(bo);
> =20
> -	if (mem) {
> +	if (!IS_ERR_OR_NULL(mem)) {
>  		u32 i;
>  		/*
>  		 * Write in batches of 128 as there seems to be a limit
>=20

After the commit in Fixes:, host1x_bo_mmap should never return NULL=20
anymore. So IS_ERR() would be the proper macro to use.

Could you modify the patch to use it?

Thank you
Mikko



