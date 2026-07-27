Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012040.outbound.protection.outlook.com [52.101.43.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCDAA366052;
	Mon, 27 Jul 2026 06:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785133064; cv=fail; b=C86tl2j6ZW6cS01pL5ubcwnpjnYgMc+TvwVko/zH0KsUgkD4XIWPyq6Dg0eDIRFPGWB3VQacJHsjMQ1aS6+cWfAH1KXv/sw914M1mEP26LuyLWizTrlVsZWCa6uDibbHgpq7/3Jqhw/2pVxV36BVcgp+G/1DxCfIrzWrRrcVJqI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785133064; c=relaxed/simple;
	bh=KIOLb0MbFWsVXBoAQaWD/Hn9OEhBSvI71KmIlTF0FmI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=otw8DuyQYPVilNIr+Sh9JZSrYZrKSZguRoXG146+Zm/cg6BN3MlX0he3vYVgaReAJFarPCVqOnXMs478BfzP1bimkl9y9LsSpNx8nQb4Uf6bMFM+/08mmLQ45dt0Moy3gGIlblilWaRD2fVzAFrrIpKUQKiJ9AYSacCbcNiyS1U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=UPV+koVs; arc=fail smtp.client-ip=52.101.43.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="UPV+koVs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DnRDa6dBdJo+hENGZCzQC8SrSgBqEn8yqlkTM6Jik+QaGa1kaVpLGZTK948Y+RAleB4OHsVu6Z5equ30A0dXO66jpuDOObYXyhOYAtt3SsCZcFUxZsuEm29X+G+6mUOlxFq6QjAPG/VCIE/KTu7t7RMkq0JLbNULnE+SxbhLpvK1XIR0dYV8GBRyCnAJB+jysSxll0mu+K7etxj03EwQjGKpN13toozZCiA1osyXT1JbBvva//H+b6FHtaa8oGToKnR0nM5SRPPtrf1ctrBTSpcT2UbSDxnHiuez2FwVpKv1J8+my0gOdwORTetWEt/hsfZ9EI7wybGDsntQItM7Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=khUrek591WQB6cG+GUxKGk97JXscNuye8ecKo8KSM+g=;
 b=rBZJueiBac+hZxzoWsjPsb0T/Dcf7oqJ45goYJ2kxNTbk1KD+WGrW4m3ZPp88iVIP54XY/X3BRAJQKEeOimUpUZYgjbiV1LFyUjLePmTU+LTrwn4l9L46tpjPrE439o5HuUrTUXYD9MPDYeSUyA3Vd/2QOhi1Gun6XrvGWLfBty/xpVT+PlqYhBNTljAYASI2E+YR/c3fVPRS+DOSiSiP61ROgD+d9kb9FE1MvEWMtzXAZ1w/mKMcBvPmBeoUKhQUgtFO+wEYE5+nbB5G9RNb+wfVj5oKF/kFZRDrC+fiqfa+bjmA7x+/vNpktXzi0wUhmCpleoaC2hFAlADawzdEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=khUrek591WQB6cG+GUxKGk97JXscNuye8ecKo8KSM+g=;
 b=UPV+koVsWWWkHCrR9LDm3sr/jMA6GhXg5jDi6QfFNWHt3uGw/V/M8GIo/XLdXa8Sq38MR8Di8IxYFqapePydMbwi9vYxL9ypk4frGVtpn09IaCyEVVpRW6lCqAcnZn4WcbKiLh/pfdu4exxze/dR1/jW7K8Hh6d0e8G7xjOs8WGxaOYuV5D46x57+wmHiYWJCrlmMrWlbBT9kHAXG2bb1AHqb1TCm6uT5Zg7jVr9TIPdpsqlTesaHQCmNwdQKExyetB8y0jTuIxQQaHHh/S5ehu1XOK2sDELXM7nLJtVyTBcDDN7IwBRPoUx1kkpUFRGmC6d88PA/890Zl9Bz3/kHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by CYXPR12MB9338.namprd12.prod.outlook.com (2603:10b6:930:e5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 06:17:40 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%6]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 06:17:39 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Thierry Reding <thierry.reding@kernel.org>,
 Cong Nguyen <congnt264@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>, linux-media@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, Cong Nguyen <congnt264@gmail.com>
Subject:
 Re: [PATCH] staging: media: tegra-video: fix syncpoint leak in tegra20
 channel init
Date: Mon, 27 Jul 2026 14:13:47 +0900
Message-ID: <ThYdHmY5Tf6HyPqsz2R3TQ@nvidia.com>
In-Reply-To: <20260726100408.3262831-1-congnt264@gmail.com>
References: <20260726100408.3262831-1-congnt264@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TY6P286CA0040.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:3b7::9) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|CYXPR12MB9338:EE_
X-MS-Office365-Filtering-Correlation-Id: 78d9e5d9-5f22-42b8-5c2c-08deeba6c2c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|366016|18002099003|10067099003|22082099003|56012099006|11063799006|5023799004|3023799007;
X-Microsoft-Antispam-Message-Info:
	aV5j+GEDEKS6YtwRfSk3+FqND2THkmsjxDq9uPaf2hWsYfd6o37Mw9d5p3QY0ZYgeC9qmYR5CoModIcNpm/+RI6VaP0ed+uXpcInUr9As+g2sOlynfdYZbDVLhWE7k+/RpbW6TwjhVVkAmqdmwvm2YOyTapBLd9UVibKHVR+GqB7XydEAF5l6+d4cHORu0yveYpzQrzlg23aYKC328H9tb7n9Ztq1QT9WNwvq3d9q41tISEN2/MkhRzlROUd+BiBu5QltElP1LBb0ZBfvl8uVGK96G97E3lHjdOKbxPdKay9TEGIBzTThrj5jsFVfEPf41v3aW3NR0guUnc0bKkySsvEHx0Ll2jJfpmagiBXZIhtLZ6p2h62TKV0Phy5KAE+khnTqPmYy1ymKE62rKO8aOEba5MFVEGbA90ACu++L3bRHQ8s4L50j3SLfRUCDXVRxRwSi4/T9d6r+wxyERHlswBXQutieLmlChlxFQQ5PIenlZHa4qpaBMe1V7u792wFYa0Tl+MrqX6jmp5C611U5geDl7gZ0p5xulJWTbeT4mLDKi+iPsXbpVPI89HwXPih1HYEDptNN7bhkTaZUJCy+qUsYSvwkvMX9y/ilYuemmXTytrKDzBIlLIHaam9oeIeskt/WY8FYgPGhNy/GbBpPA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(366016)(18002099003)(10067099003)(22082099003)(56012099006)(11063799006)(5023799004)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OE82UEVQQTZVTHpwQll2ZW5VWU1TTGNxZTJ5QlNkL3BmMDBaVjFZMkpnQi8x?=
 =?utf-8?B?K0hIQ2FjRGNkL20yczlsRllzYThTSkNKVEhkOWZFa0lKdW9yVXliaVF1T1ZR?=
 =?utf-8?B?dlZUN0x0VWc3TktlR2JneUJNYkhXYTZvU2xva01VVUI2ZWRpL3U4NmFuRVNh?=
 =?utf-8?B?TmR0K0x0S2VIWmQvYWRvRzRkcEZaOElEZXBNSm1sNG03ZnVOZW12VTlucnJM?=
 =?utf-8?B?SHFzMEdRU0xvWXVBQzJyaHNiMXg5aElvRU8zVnB5NXRSNS9ia2pqZFdjUGZG?=
 =?utf-8?B?UVhZSzIyTzgwMFhWbkFjWUZ4TTcwaVk3RkpJSFNwVFNTRVFERzIxYjhqSHVm?=
 =?utf-8?B?akFmQVY5MFRnL1dNaFFYS3lkTU1tWUVBTnpwckxpbnZXcnNnUkNLZnA5cUF5?=
 =?utf-8?B?MStNMkw0WjdveDZEQktWWWVhbkVES211WnhKaDdjeU5PSHhzbHE1N1Blcmpu?=
 =?utf-8?B?dFdRbmVlL3lSUW9taFF0N1dnOG1uWWdwYmpBWHI0K2pXbDJGYjBDM2dZcUZY?=
 =?utf-8?B?Q3BHaitGNXAxVWxaUnc3UjBiYURHZkJRNWhpQXhmTVBzMVBjOVB6bkltVmhx?=
 =?utf-8?B?dlJBOVpEZDZ1ZmlPT1JFdmVZWnhKMFAvRkc5a3l6b3I4NzlMd0pwSGdVcWVu?=
 =?utf-8?B?aWpHekZzc3FwQUpVZnJmK00ycVk5TFJmb2NGRmd2STFjWGd3elZrRW5wTlMv?=
 =?utf-8?B?MU9DYUFyL0k0d290eGhvUHdvQXRwblE0SVFDU09FMG5PdHk0UkZMdEpyOE5U?=
 =?utf-8?B?UVE2VEVLSlBpb0pjNWtBYS9JRFUvWE1IdGVUQVl6T2tTRDFHRFg2RERBRExv?=
 =?utf-8?B?R2svZDE4LzFrVUlBWmhUcDdxT2ZsRXpoK0kyd3dhakFNYjVjUkZYdWdYQytZ?=
 =?utf-8?B?Q245c2tmRldSU2NwR1VLcDlsT2svM3RmVmYrRHFTVFM1OENKUnVQWUp2UXRK?=
 =?utf-8?B?ZFZldnpaRUQxMTg0UzloTFRGNWhmbHlpMVM2OGFJZlgwenlxeVhlaHMzU2tx?=
 =?utf-8?B?bXBDdFpQVXcrYWgrenlqNEYrTVJ5WXU0ZDk2bHdSTlpURDhLU2NLc3JLZERv?=
 =?utf-8?B?bVlNNzUyR3p4S1lCZlFSWjBQdDVvT2FzaVRTSjl6U2habjJaQVNCa2tWcTFQ?=
 =?utf-8?B?MWtjOERZeFMxOTNOdHRaanNmd0FYc0kvODgwYzJzaXQxL09iMzJmaXhEeDZs?=
 =?utf-8?B?MXhHcXNEVS9QdEVlQ2JuQkRUenN0cGNDNzZlQTVHRGt0Ym84d1NpUzBSZTNt?=
 =?utf-8?B?NjF0NkdlMFMzSU5YSmkxR2E0VlhyWlFZalE3K2c4U2xrRUtMU1hDVkRiWXNs?=
 =?utf-8?B?OTNUcG01UGp3RGZ5Z2JzRmVNY3dQZVJ4RzBtZzI0dlNpQkc3WDZPdU8vOUVr?=
 =?utf-8?B?STlGWUEyWDFGcXhLZlU3N0hpZ3k4ZlpydFFMWkNydFVPcVdSdjNsYVIzdXVl?=
 =?utf-8?B?MThuWkF6blZIN3BhMWJuK1hQb3hNRU14QmNhd0I3Uy8xYVk4YWd2ck1HZlVR?=
 =?utf-8?B?TlljYldDazRSaVYxby9oQUN6YzQxZVVDN0RscVdHaVdZczhDeU9kOGZUR3JV?=
 =?utf-8?B?RWRmNDJGbGl2eFI0RzE4dFJBcysxdG1CSkpKcWxFclJqVTFmNWlUWHJ6ZkJu?=
 =?utf-8?B?TEdOY1NsdHh2NW5nQkFDaTlTV2grMHJrUkFMV0d3ZUtJQ1BmbEZ3TDNMVjZQ?=
 =?utf-8?B?ek9zdjgxaUg0dHh5dGhCVGlvc1BLV0cyMzZXTlJ5cXVnZ2RYcFdWMjlWTXRV?=
 =?utf-8?B?SDNVbTNJaDNPRGpraEtRazNHRXVwTjNoaDA4SDBzT3Q1VER3YUV6WFUwMVBq?=
 =?utf-8?B?YXdTWnNsMmEwUTM5c1pyMHRySXVqNUFhWVRVMm5jbjlrMFBEQXlNM29lUUw3?=
 =?utf-8?B?OSsvckt3WWF1R1V4QUZpeXBiM2FtT1NiRXo1c25hWklUdWpEWHVGSy9Dbk5v?=
 =?utf-8?B?U29XdUJkL3U3UXRPR3lkTWFoWWo3eU5BRm0rVy9PVDRJZ1d2R2tVaHFvNG5L?=
 =?utf-8?B?M0dOTDI5eStFSC9OSCtmM01ma0lCb3Y2ZGEzRjUxYzBJWStxeXRjTG5XN3dQ?=
 =?utf-8?B?ODA0czJsQ3dQTXpDbWJRcmpvYTRUVW52ZUluZ3FuR2p2TUFhMS9sQkxLb0VS?=
 =?utf-8?B?WkQvWHV3ZHk5b0kyOHV6K0xoL1J4NUNOTWdTV1FEZldHT0QvZjNRRVpFNGlH?=
 =?utf-8?B?ZmVjTlNQRUl0Vjc2U1FJYkJkWllZdS9LNmpKS0YyV09JTWc5bStDWE5Bc3J6?=
 =?utf-8?B?aWplZVFDRW8xTTVBdDJ3Q3BnMFd3U0dCOWNEcTdYZnMwejN0V2JSU1l2amJs?=
 =?utf-8?B?dUx0ek1lVzZ1YkpQMHlQV1RjSHJUVnNGUFlYcy95QkUrR1h1OGZUZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78d9e5d9-5f22-42b8-5c2c-08deeba6c2c4
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 06:17:39.9375
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K2dcTKvmic+hYJ6m6CdIc0gk4Ba57r3yv+Rv5tK2E+tjtMC6tm6+E7hWBrmDGKJLCkO67ATwwjG/ceiEXYFycg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9338

On Sunday, July 26, 2026 7:04=E2=80=AFPM Cong Nguyen wrote:
> tegra20_channel_host1x_syncpt_init() requests two host1x syncpoints. It
> stored the first one (mw ack) into chan->mw_ack_sp[0] and only then
> requested the second one (frame start). If the second request failed the
> function returned without releasing the first syncpoint, leaking it: the
> caller tegra_channel_init() bails out with a bare "return ret" on a
> syncpt init failure and does not run its free_syncpts error path (that
> path only covers failures after syncpoint init has fully succeeded), and
> the channel is subsequently torn down via the kfree()-only path, so
> nothing ever releases the orphaned syncpoint.
>=20
> Release the already-acquired syncpoint on the error path, and only
> publish the syncpoints into the channel once both have been successfully
> requested, so chan->mw_ack_sp[0] never holds a released handle. This
> matches the handling in tegra210_channel_host1x_syncpt_init().
>=20
> Fixes: 0e2c4117c351 ("staging: media: tegra-video: add CSI support for Te=
gra20 and Tegra30")
> Signed-off-by: Cong Nguyen <congnt264@gmail.com>
> ---
>  drivers/staging/media/tegra-video/tegra20.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/stagin=
g/media/tegra-video/tegra20.c
> index e513e6ccb776..f8acb6834a0b 100644
> --- a/drivers/staging/media/tegra-video/tegra20.c
> +++ b/drivers/staging/media/tegra-video/tegra20.c
> @@ -429,12 +429,13 @@ static int tegra20_channel_host1x_syncpt_init(struc=
t tegra_vi_channel *chan)
>  	if (!out_sp)
>  		return dev_err_probe(vi->dev, -EBUSY, "failed to request mw ack syncpo=
int\n");
> =20
> -	chan->mw_ack_sp[0] =3D out_sp;
> -
>  	fs_sp =3D host1x_syncpt_request(&vi->client, HOST1X_SYNCPT_CLIENT_MANAG=
ED);
> -	if (!fs_sp)
> +	if (!fs_sp) {
> +		host1x_syncpt_put(out_sp);
>  		return dev_err_probe(vi->dev, -EBUSY, "failed to request frame start s=
yncpoint\n");
> +	}
> =20
> +	chan->mw_ack_sp[0] =3D out_sp;
>  	chan->frame_start_sp[0] =3D fs_sp;
> =20
>  	return 0;
> --=20
> 2.25.1
>=20
>=20

Thanks!

Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>



