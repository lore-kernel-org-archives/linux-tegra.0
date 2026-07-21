Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012065.outbound.protection.outlook.com [52.101.48.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BDBC435538;
	Tue, 21 Jul 2026 07:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784619810; cv=fail; b=q1CPHo9tGSiB6nxVjXeWGTzSYUTi1JTvjI+Iu4lURiE2O09N5IGErqUrazxLpWxeq9i6x53slsbpXnyMVxm7ZLdGx/r4XQ6HueDOv5IOAEHWSjR/MTSfvH8DpMbX4waTgHNcjo6rum5ylpwH4lkHnspwgCX+lTbY/eIPVHRggqs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784619810; c=relaxed/simple;
	bh=KLJHQbAo53VTZpoXQxOJu/l3g2mHEDdsz171fqsY3wo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ItTS8CoZi+9KmP01tlAfzGVpLl0xmcurCtNJuO+DZaRMV7OHVegVA7uN7u9F+utc7OhDuXnEM00VRRfdsZLjQbTINY4mfLO3Z09BLwqd33G9+HnLQw3IkTordxp9GegQrAXc5PzCJVyk+l9W4an0BzrxHrUaxnsFPGaAXVToQzo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=XIyVyglk; arc=fail smtp.client-ip=52.101.48.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="XIyVyglk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CPR8qgdQOSxjmt/UwkSmtdjgXPdnEHR+uwa7Q9/MOhDhLaWgaTINOmQbw342AykH5rlqN69+3JSj+TxR/Iza4rT/PJsU8PEJyJ64yMUIksRW5H16VLbHRbjg7OXLw1Q1jGmGdf/DiofVOhBK56too3ZVhKYfyXeP+EAjQ4IswF3Ennppr/DlXrirljTzx+U7JPizEF/2tkSwb+pmSQwxFDF3Y2gCC+TdDXj5d3MUYPzzcf//MQGZd9mislwaOAjvUcs5VGA0pPtZ+qD6qVYelGKPeJqtUCfZ6JW4JOlNUHjTBGGrQP9VKSYIWri1B4DQDklnwG4DzplmDNAg+wR89w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wZCI1QiZGrcxdbQc6q6rm2GxyFAOIArSXj/VVF2f7YY=;
 b=UBsTBKXw7JkhFtqNoshJZ9wbkBCQWEVyXSk2o2g69hbbfGpstZt1CArUcfsVDmtSbJCwT/p5cNp2wPqDS0YLNCT5F1fcf5gRXQOP2GVZGEnBuSUdnju87fix41hAHtoYB6q1jWg/emyizqFkj2O/1w8cXB7OS/sgXLIq4NW5v7EOscuGtPk88WpNUZAuhs3Kp88nW1wWhsJGnwK6/OpVBc5sLp0bGk+RiCWLU3v6o2OYMDHywKrKAyOwCKVQCdhuMtZpjDjqkp4RQXUJeC/GO6uRRYycbxGqf4p2hiV5x9EFcZBffZeTeCQyn7b2b63Re6ebxBjVbS9g3O/fxtGegg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wZCI1QiZGrcxdbQc6q6rm2GxyFAOIArSXj/VVF2f7YY=;
 b=XIyVyglkt4vmrmhbX5dBBL7g57WdKgIzNubONThHv6W/YEvZawGqoP+F0D6sfh1m+/v++8hHyqzClJIJH4H6QlR265VcB2aMm6pY9S3xXAfiDGOGM7uGzQC2ighbKGEaLZww+w2Ma6Kl9VeR/7+30ky7npI1aqIJLeUcEMLinf1aHeHvtXDoPwmR1zOKu+fJzUYzpalxVIHHbmZSrfQHp9UH61VptVkERJsWeIR8l7jAUGsKNDS6ZgYuMBh3+tC6KpJ2dAhWoXKhYzGg7AzsXLYeGognVUoscXwklquJq/dSvSPXTYHhGf+TmaCCXd0/N/hahNGkrp8QUREFXknSRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by BY5PR12MB4244.namprd12.prod.outlook.com (2603:10b6:a03:204::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 07:43:26 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%6]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 07:43:26 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, webgeek1234@gmail.com
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 Aaron Kling <webgeek1234@gmail.com>
Subject:
 Re: [PATCH 2/2] soc/tegra: fuse: speedo-tegra210: Support revision B01
Date: Tue, 21 Jul 2026 16:43:23 +0900
Message-ID: <gVqt6-6mTtaAeVdWZqsmEQ@nvidia.com>
In-Reply-To: <20260717-t210b01-speedo-v1-2-f04a8bd4d997@gmail.com>
References:
 <20260717-t210b01-speedo-v1-0-f04a8bd4d997@gmail.com>
 <20260717-t210b01-speedo-v1-2-f04a8bd4d997@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCP301CA0008.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::6) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|BY5PR12MB4244:EE_
X-MS-Office365-Filtering-Correlation-Id: e2c27e79-e94e-49d0-f7a0-08dee6fbbff2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|10070799003|1800799024|366016|11063799006|4143699003|56012099006|10067099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	CQEvDUZfcQwseF5Cmf+k6yvaWELJkOFciyM5heoQsO7mM9rfvZ0myINP/r/iSZiXVyxBW+zhetWIA29Dea/0gGWnLIx34x8FNwPGlzdtkgx39tFOZA0y3Merb9UqheNNXltroQwwZKJx24gto/VVq23iNqUNXaPlvhd109MSaln812iKBqjC/U02ZqSuFr23B49KvPqzgdMwtvqsHvY673l5jfSgXciBg27UoiTkRbMFgY2Op5MefuA/QzkazU4ehvXBzkWuSzOIDOnJt+d3gHkIUTH+GSyRXEGiI4glUQ4PvmrP1HGBorXlhoJROfX5nN685YSp6KX5gtlNxj2YbNd3a886swudiEC8SeCiCuz5NrjCYjUEUm54S1g0XapFtgh7Dtu1QE6CQjqLUR9RnFN9FXskkUE7wMOLwUyq6yTOC3n4TkQxD1Brp0a8RvsKoCzmLHCiKNyo/fXbxwgwGcxk5tK6kyksbbZt8GZAph7GEFcz7bO+VOU8xoj22NKorJ2XrcyylW+XPQim93u1OLFhkWQXqnM15RkVikSr+y4nf0zLjWfHDGAXwkw9AXVOSxS40WDzXuug4Oc0d0YSvS5E6umXLoKJgu8vAH0Ox/SYxuUIeGoFK5WA+9WFb1rwLthBY0eHg7kWs7+EiS6PHQ+BYeE5YvwpU2U/N/Tuq9s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(10070799003)(1800799024)(366016)(11063799006)(4143699003)(56012099006)(10067099003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b2VVejRDTm81Y05RdHdXUnU4a21lOHlEVkNITVc0RHlVeHZrM3I2c3VydnZM?=
 =?utf-8?B?OERjZ3ZvUzJOakFkb1pXcEQxQkdvdmJuNVdib2FVYWNCay96dWlUN2NVYUkz?=
 =?utf-8?B?dHI1MFQzQ2dmVVh5ekI2aVZ3M0dxSEVBQ2tCM1FPTzVieEZEN2Z3OUh0SmNo?=
 =?utf-8?B?Z2tyRlVSNUVJQng4K2NJRWliNndDdkRMTXlOdzlnZ2tSWWxJL2JSQVpmRFc4?=
 =?utf-8?B?bEpmNEtiNEwwenIxamxVRytIQTcydno3NkY0dVNBNnVVZXlVcXpJNUh1U0lN?=
 =?utf-8?B?MWx1TnJiT0E1dUs0a0tDdDFEZnBHSGFHWmc5YW1QY3BQeGRwUG9DYjhob0dJ?=
 =?utf-8?B?ejk2ajVCcm5rbEhVZHdlL0E2OTJHb3h2S2laM3J2UUR0dlQ2Y05WajkydWNq?=
 =?utf-8?B?bVNWNSt4dDJpMk1GZVZwYnNkZEJOV1g4ZkozR3d3K3dKQkd5bHB6UGx3UXlC?=
 =?utf-8?B?cldydW05UDNSd2lLc1ZDME41NU1lU1UxVVRpanVXUW5SZXJmck5nR0J4SWJV?=
 =?utf-8?B?Y0EwTnluQ2o4cFh4M1pHZXBZbkc3aGZqelVwc2k0YWRoN0l3RmQzSmkzeXNW?=
 =?utf-8?B?c2Ftc1dpU1l4bkwwQUxIU2NWSEo5SllubG5EM3pZNHJMc0ExTHZJNzJQaHRo?=
 =?utf-8?B?eENhM2Zjb2dXVFo0TUJsV3MrY2lpZVdSOGY3WUR1WGljOUFhc3B2Q0FydkhD?=
 =?utf-8?B?MThnUVI4TjEweDRqb21EenJNWFE1NDZ6RnhZdnl4Y3pkWXFZc0g2b0QwdVJw?=
 =?utf-8?B?RmJKelppRlc0aSt2VXQrcFh4RERiVWVkN3c5YllIYk04REoxNHpSMkxHL2tG?=
 =?utf-8?B?eDF1UlRlaGdxV0xPYm1taWxwNkFGOS9CVW8rSmVzQkRrMVVzdy9zT0Y0bGEz?=
 =?utf-8?B?elliVkg4ZDgxZVllQXE3bFJQN3ZyaksrQnoxcGt6YWRBa0UvMCt3NVQ3ZC8r?=
 =?utf-8?B?N3Mrb1NYK0JyZW90U05pdDI1cFZGYmQ0ZXRNcUtTN1ZvRUp3VjAvSXlXeXM3?=
 =?utf-8?B?NEVTUUpuMWdnUng4cWo2aXZ3d1J6UHdSQUU5cjNhbW9XRmFCTm5KRWNCVDRL?=
 =?utf-8?B?TWVuSVV3YTVhUjl2QnA2NW1aTFNYdDhNNnhpaVRIbndibGRvZDRHT0tucDFm?=
 =?utf-8?B?TC85NUp1Vks2ZHMwaSs5YlBxZUdLTnRreEdWc1N3NngxTVJXcVVsKzgwcDNu?=
 =?utf-8?B?M2JVbG0xYWZrYlhBNENrK0p6VDl6SlVuNzUvd0w2R1BmcUt5VmJnLzFHRGFY?=
 =?utf-8?B?SCs3V3l5NTVTTnBYSVUwQytGUnBLUDdQcXJTRmh4UGVkNEcxZzEvdFpCYkU5?=
 =?utf-8?B?REsrYnQ0eHZnWmV3SG0zWXdjeld2ZHJTZFBEZERSL0o1U0Qxa2RCYkFaaWkz?=
 =?utf-8?B?MUF0bFc2NnA2TTIrb3VUSUhqaDJlRnF5citpMVpGL01DakVRMzI5VWEvQ1Yz?=
 =?utf-8?B?TDhTRzhla0k2aGgrRStoL01tNjhWR3lmQiswYnBtVVFFYy9rdGszM29EbE9D?=
 =?utf-8?B?cjR5ZkpJWFR1MWVNdmxZWm5Rd0NYUzQ3bmNwZEJoeUxudnAzNEZiWlBRbWxm?=
 =?utf-8?B?d0VscXRieFBDeVJkUTh2OCsrbVBrWkltRTd5bFo5clBvbXFKOWtmcnZNQkEw?=
 =?utf-8?B?Zk5ONCtIVk9XejVpeUFZenJaczdTeEw1UlJtODFNVzZlRFV0SmVVYWppelA5?=
 =?utf-8?B?TG45amlRNW5MSFd0M0djaFFhVUZBek1QTEI3VkVBZkF2a2ZhZ3JuY0FHS0ZE?=
 =?utf-8?B?VkdOL01QaE1GS0RNN3JYajY1WjgvNlVjZUNTQno1TERlZXA1bDJiaXNjTjU0?=
 =?utf-8?B?bmFkbTBMTmRYT1lIc2gxTVJaUzRXN0lEanN2RFhObE8xbnNLa09rSmRDTWlV?=
 =?utf-8?B?WFA1ZWc2OWQ0ejFMcDUwY2FTdC9MV3Y0eFA0YjBHRklhVmxDSUs1SG5wcU03?=
 =?utf-8?B?TWhwREVVbUExdllZcmJxc3BKLzFUbEM1c3FGb0l5Ui9STmsxWld5ci9Gd3Nw?=
 =?utf-8?B?bXRpWjEzRlRTZDcycStBWlNwR0l4Z3FDOWZLbnRyWHNreU9Lc1Bvd3E2em8v?=
 =?utf-8?B?aDFUM0JJU2FRcmpEbkp4Y3JJV3BwcFNvYkhZc0RVeFBPQTdNYlR6M3c3LzQr?=
 =?utf-8?B?TnFSVWFhQmVCM1NZUHAzd2NvS0tMTUI5OGQrYys2elpQdE16WDAzM3ZaUU9h?=
 =?utf-8?B?eWU5eTRHdjk3WW11NFp0WkRobXo5MVZ0azl4WUh0dGpxSWZ2UzhFQ1FRMDgy?=
 =?utf-8?B?aDVsNnJ0SWJEUmtaZ094R2xxYlk1MjNTK1p0MnNEV1Ryc0VQdXJGWkFWNXlo?=
 =?utf-8?B?aW9kS2Q4L2hqOHJ0NVpJcTB4dDg2ZEsrMmIvVlRHeXpBNTMrbjhFc1ZjWGFK?=
 =?utf-8?Q?8JUnC+KhRjmtDLVvQXLNhbpswIjDY/yXzkXxJ8PQ1UX0d?=
X-MS-Exchange-AntiSpam-MessageData-1: sTySGhqKrg1lug==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2c27e79-e94e-49d0-f7a0-08dee6fbbff2
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 07:43:26.6241
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rFsbNrrTrvA1tM+ewZwYT9e6j2tOXNCHkJxkR5912PoZJ1P7IP8tX8IodoRm2PgnC0QVy7hXDN1tByoU71ch+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4244

On Saturday, July 18, 2026 8:19=E2=80=AFAM Aaron Kling via B4 Relay wrote:
> From: Aaron Kling <webgeek1234@gmail.com>
>=20
> Tegra210B01 has a separate set of skus and speedo tables
>=20
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>  drivers/soc/tegra/fuse/speedo-tegra210.c | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/soc/tegra/fuse/speedo-tegra210.c b/drivers/soc/tegra=
/fuse/speedo-tegra210.c
> index 06c2bcbee5734..699751f4bd0c0 100644
> --- a/drivers/soc/tegra/fuse/speedo-tegra210.c
> +++ b/drivers/soc/tegra/fuse/speedo-tegra210.c
> @@ -65,7 +65,25 @@ static void __init rev_sku_to_speedo_ids(struct tegra_=
sku_info *sku_info,
>  	sku_info->gpu_speedo_id =3D 0;
>  	*threshold =3D THRESHOLD_INDEX_0;
> =20
> -	if (sku_info->revision >=3D TEGRA_REVISION_A02) {
> +	if (sku_info->revision >=3D TEGRA_REVISION_B01) {
> +		sku_info->gpu_speedo_id =3D 1;
> +
> +		switch (sku) {
> +		case 0x00: /* Engineering SKU */
> +		case 0x01: /* Engineering SKU */
> +		case 0x83:
> +			break;
> +
> +		case 0x87:
> +			sku_info->cpu_speedo_id =3D 3;
> +			break;
> +
> +		default:
> +			pr_err("Tegra210B01: unknown SKU %#04x\n", sku);
> +			/* Using the default for the error case */
> +			break;
> +		}
> +	} else if (sku_info->revision >=3D TEGRA_REVISION_A02) {
>  		switch (sku) {
>  		case 0x00: /* Engineering SKU */
>  		case 0x01: /* Engineering SKU */
> @@ -154,7 +172,7 @@ void __init tegra210_init_speedo_data(struct tegra_sk=
u_info *sku_info)
>  	speedo_revision =3D get_speedo_revision();
>  	pr_info("Speedo Revision %u\n", speedo_revision);
> =20
> -	if (speedo_revision >=3D 3) {
> +	if (sku_info->revision =3D=3D TEGRA_REVISION_B01 || speedo_revision >=
=3D 3) {
>  		sku_info->cpu_speedo_value =3D cpu_speedo[0];
>  		sku_info->gpu_speedo_value =3D cpu_speedo[2];
>  		sku_info->soc_speedo_value =3D soc_speedo[0];
>=20
> --=20
> 2.54.0
>=20
>=20
>=20

Thanks!

Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>



