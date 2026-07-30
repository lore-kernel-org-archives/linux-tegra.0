Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010023.outbound.protection.outlook.com [52.101.193.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC32F3B5F5D;
	Thu, 30 Jul 2026 07:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785395980; cv=fail; b=j2XpA3DJwdckxLga6IWdB3vLZf1WJhcBqd4fR3Hdf+nCIN2izR3wVWeZiXVoAxNwR86bFGOitosuuvP9LkAaxzIa/tir/GUhMzvMu8okVoxjoH39HwiK2i9eR5OrOcPsmZJwMBPRuy/XSXv/hKf6SjGnYSixJ9aBrYRhpAMFtfY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785395980; c=relaxed/simple;
	bh=Fkian7TvYuS6oBD01mMSw+YPX32a9w+7VNbCuxgGjF8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=D01tjqJmIm6LTCxkCaJ4qrj7X9G+bTT8gEf58QCZJ6Gn5b18DGrT2BFWkfm0LOMReJ4mVQBl9ENI5RjAfW11RVp5CPiDLTQQ0ZCO5SStTRlJAiLqCWHarwlplskqn0uBIXWPmqxfr+4+Vp/s1+LlM5UGsSkcKsCcEIgnNJSNab8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=DFqXvP1q; arc=fail smtp.client-ip=52.101.193.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="DFqXvP1q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oWRPlU/qFp/797TZxg127ZWS1Z7wv4y7/zMfuOjk0LejmLpYaTYXW/1lsazFA6GsjCsJSXFFhWjYh7+lbI1VuucpsHu8OrGMlJlPkEXglzrDucNns/kEd9B0wqL8fjUkQ4nVH0zWMvLgX7xlT98ag2OXSqZ7W8RrLx1OXik9NfHJnOLh9aDqLaCOPkuRtEniFxGSTG2Gsq9NfPZ4vXT6A0RPYhhi77NAZsyIVazD6ncN+4LUea5HPavtvnMN+K4tN0uK6erGIP+isf1zkWSvIfkrksGfKZKe2az+HaxqnHlNZpJsjf6jPB+KlQeJ/IPZqOFo4MKXdEQ7A4fsQLb/ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q+CG0A8IKgkxT+UHuNVm5DOw40GQs+V1USEmtZvmkm4=;
 b=r8Ri2XnFySbeWNb16yhiNf45oM8N9C8HmPaORM3YQ93pL6QgzBRi5qKKS2Cmrr850KZEX4hOxvZ35qmwdBrnRfvQvJlgs2Bs6gC/6jUvVpLtZeHsx5++iA3wzEzrNXFl072mrWcwzMezIKqJ2BrI+RRGoSo/cc07YR8tvEH3wat2Dp1QUKx/Rga08BDGAvZKC7Np5jdFvGXTLcGmcheSRoCRDdEeHKCxVK11KDvpPEwB9Uq+P4GL+mmorJZclgLEb+a3b5Nc6qUpt8GyQ5I+DZG8EAvA2D2WTT3J4lCAqUL5Lhni2HqQr+PRkU6TxAqgeIswckUO8Xe2wn1xFMcvqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q+CG0A8IKgkxT+UHuNVm5DOw40GQs+V1USEmtZvmkm4=;
 b=DFqXvP1qGgMLNGCmVRbDYewJLTLdEuOEy3lf3pZ1Q+kgY2FbZb2mG6HNEcupkitRpm16KkS/TKHKtZy0hklcKXrEROsBFKc9MpeAX/vRYq290E6Ta4wZia/DcjGcx/rilz4BB+PElwwPiOmVYH4OTUGAZ6Uyr7DmYzZUAWk+HrAPId7eM8NzMe1LJOfGoam76YEr4AkL7dSsv0eAkoXAVq6Box0IcHi7jO0d4/JMYjxE1X661DooD+25XyHk4wOsXAqhq0AoUYnGJwXe/xpc3ZvpF+BhtEvxTqUhRnsCmLM74zgs0qmTsGosde03yqV/bpl0AChtZ+DDRif2lJ251Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by SN7PR12MB8434.namprd12.prod.outlook.com (2603:10b6:806:2e6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Thu, 30 Jul
 2026 07:19:35 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%6]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 07:19:34 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 08/10] ARM: tegra: tf701t: Complete power sensor node
Date: Thu, 30 Jul 2026 16:19:31 +0900
Message-ID: <1iUaa5ZcRA-hBsGscfl_Zg@nvidia.com>
In-Reply-To: <20260721101059.451699-9-clamor95@gmail.com>
References:
 <20260721101059.451699-1-clamor95@gmail.com>
 <20260721101059.451699-9-clamor95@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: OS3P301CA0038.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:604:21e::6) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|SN7PR12MB8434:EE_
X-MS-Office365-Filtering-Correlation-Id: 40bf8e00-6121-49b7-3ba3-08deee0ae847
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|10070799003|11063799006|4143699003|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	hwL9bEffgtUHrtQ5f6MI4nK6kdGmie8oWxGlO2HLRGq+HgQYjpnBAolDXwNnMv79EwOqifDkDEL/D9UzJqMfVtuCdsPxJK7F8PAJxUOoRzEgb2SgbIacioNu4nZFjKxarJeUlxWMEMVZDDOFGtsxnUCzSe7mj5SyaHOtgbuWWjd3hoI93O1PannFQFk+fIM4zdvxE8l93ALacayBd4AgPkPq4GWlgK7qcKZSGsVRZp/mKkwASmWilnkq7zScO4H4sqOb1SbIPdcKp0JKb6bPQGdlL6w1+S/1Zv/YxXJyGEcQF6WJLjh20tJMVgBqh2Ie315vpJvSt9uXXZxaVDyWq3/YsP8RF7gdf64AD9VkiawhfxUYJBnW4/URSEss9HHpTksU9QVEPuazar/0Fh63PaR7M/pm842yFl90AcLbhRK35maD0XEuS+ISb/UQC4OvMMyJg/BW8RDrNsbGQSVg1ZesrrGBaVRIL6G8Jyt/wJpWxl2Fz9B5PsiIrk5VysGsbIoAe1Y/maX9/T7OXOZyzjSMluaDy/+RiAKMMOoKwQBGAtm/xK5vJT9zjzXbmayWUPCSQpoyltTKywYkpgyhlKu6iPRC5o158tTxaSJE8VbQMec1Eytv/mClkdqVHxpE9B5ghzflkxhgUsDz8+X8PsOvkwiGyjfjD/TfLAJD8zI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(10070799003)(11063799006)(4143699003)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q1dNQ21BZjE1aVIrTnhzSlZ2cVRycHFMVk1xcVQxRlB5eEpxQVZFWXNiblZx?=
 =?utf-8?B?LzFpSHJWdzRsVTduTEJjZTVtdUhVZVgwY3lITVcxc21HbTdJUlZobThpaVA3?=
 =?utf-8?B?N1VwMVRTK01LZFBUTFVzenR3ZjRhWTVmODhaNUg1Q3FmVHZuTHg5WDBPUUhE?=
 =?utf-8?B?dWlwcUo4NG1ybEwrQTBPNlh2cnA5dXhQSW5IRDFnZXV1YXZUVDNZNE0rMW5l?=
 =?utf-8?B?dDlhRVVQZ2NsMXhPUnc0T090QXhTeVprUnNZcjJXdGFKVXpBSW9LM3lDYzBQ?=
 =?utf-8?B?UXhxR2VzKzF0d29jTGphSTJTa2M4WWxWamhvalllRktRcTk3RjhaM2pYNGVT?=
 =?utf-8?B?NThvLy95bi9abHdYVTZVVkJqbWFBOHRiV1RiVzExclZmd1F6L1V3a0lsQ3N1?=
 =?utf-8?B?MkJyTTRrTGg0T21NUnpxbEV5REtiT1h5Ynl1QXFvYzNFY0R6cEUwOHQvTThj?=
 =?utf-8?B?ZDJtZUg5N0luRGdTcFYySmpFNEpEOTUvdnJmSXBoRDlLbmk4UFQ2L3hmVW9r?=
 =?utf-8?B?cUdrRmJtL08zYmxNQ1BtbVBsRG43TWQ1Yk9CNXJ4RmlScGk3MVJmUTJ3T21C?=
 =?utf-8?B?ZkVFd25SSVFEdUxzNTBmT0ZjZ0s1bGpzK1JIbzlONk5ISUxVbmZ3c0NSVk5E?=
 =?utf-8?B?a1NiYVk2Y2VXdzA4MlkvUkE5NXd5Y2FBOU9Id1FYWE1BL2FVZmdIK1Bqd2ZO?=
 =?utf-8?B?NDBtaWR2UzNuUnRkRkp5Q3dMQ0FCR1JPTGdRZTRzVzVxeXVFWG4wMm83OFNY?=
 =?utf-8?B?bUMycGRGY0RSNEt2VzdvdFAyelNRZFVXUWdJZFpURXQrVGVpN3JUOGg5dVVL?=
 =?utf-8?B?Y1FiMjJweGhJWE1BK0JiMVhBRVB5MWxKajV3TDUzd1hIWnZ5SkNaYi8yb2tn?=
 =?utf-8?B?ajJFQml4TjFkd2dLNzhlZ1lxYXhNNVMrRUJJaFhtd2tzemMrc1Uwbll0NFBq?=
 =?utf-8?B?bmJFT2Q1Umd6R2d2Y2tGZmErbG5mMFh5cFgvcEJIYjFGK2FwY0Y4b3hKRFN2?=
 =?utf-8?B?QXBrb1ZncjlXUzNHaldUUlppWmRSNHRrVHc3T3F0VElMQk8rNENMZnVIOTVo?=
 =?utf-8?B?UWNBRVQyUWlmVk01bEV2Qlhzd0ZFaEx2ckdBNTFWNmp4empYeW1jYnA2WTl0?=
 =?utf-8?B?SDNmMlFTcUxEZGQrbVc2WmlUc2tJWGprZkdLK0pUT3c5NkJiSjRvRy8vOUZl?=
 =?utf-8?B?NVg1dnZUWlAxUWp4czFyRjdIL2tDVW5LT0l5RjBZU1A2ZlIwV05yKzNaZzhi?=
 =?utf-8?B?VTVkVTl6c3ZBenRFV0E5dEdWY2VnNVFiMlAvanNXTXl5ZDBNVXU4c3BBMGZx?=
 =?utf-8?B?UEJpSDJndFFlMXprVWlXTFM2c3hBdFdFcHFZWlFUbEhzcS9tazdETTRvdjls?=
 =?utf-8?B?VWlPemRscDI3VG9uWUdEUVFaT0ZIQUtOTVFrNHpOZFJPWGM0ZjRnNE1QbHNT?=
 =?utf-8?B?S3dVaGZockdoQUNoTkNGMk83cnhzRXg2UU94eklqVmdLOXM2UXVOQUJSZFlr?=
 =?utf-8?B?R0YrdHpXUFVrSFJXMmowamRyb2tGWUFzVWhTd2wrMEhBWFlLbmVEVVNmS041?=
 =?utf-8?B?SWVESUNaYnN3QzJ4Y0NCdndHWXVsVkZlejZaamZJeCtuWHRyeHdudTh3cHVr?=
 =?utf-8?B?R09Ka3YzNTZkdVpDbm1EZ0RaSlh0U2NPNmwwVlgwaysrb1FGeWtrQUFodGNv?=
 =?utf-8?B?K0RjRGlQWTFEeTI3U3JNcENsejhUTkFyQ1ZkZmNjNTRIdzZsbDc5R0tZcDlT?=
 =?utf-8?B?YUtZMVQ3cWswbytwc1ZtQzEvNlcxSmdyU2R0UnZIcVhJZ0lGSmlINStobHZF?=
 =?utf-8?B?QnhGSkN3M3p0R3h3blJsWEZSMzZ2bTVWQU1TM0tkSUsveENWRlBjZnpxRmoy?=
 =?utf-8?B?eG1lUnJtNVpaR3B6dUpvWEk0ckdBTjJpQzZlaEFJRHMrN0ptVW96WDByaHh6?=
 =?utf-8?B?QUpJWTZUL0tEL3dyU01qNGpxZkIvckxFaUZqcjRmU0J5YUdlaHpVTkc0azg1?=
 =?utf-8?B?RUY2bWgxOVZCUEQ3RmRxQ2VzS2JFb3dOdVBoaHZHbHQzV3BEY0NRRHVSNmFM?=
 =?utf-8?B?ZE9vR3ZSREdFUmZjeVF2UXpjeUZqQjBPZjByWnkyTE9IMGEwOGVBeXlFREsz?=
 =?utf-8?B?NG5PcUd6Sm1zOWlOTG9wSWRCNTNBUU9rdFlCcnExNDVCUHZmbS9pTTRKMkdZ?=
 =?utf-8?B?bW45NWZXMDhoZDRJWjF4eTdKd0dkb0c2Yll2MDBLYk5VV051ejVlaEdKODdP?=
 =?utf-8?B?YXJpSEVsTGltWHZEZFlVeU9Gb0xMUThMTjZaZFdWems0ZFA0aUdVSytRRDRx?=
 =?utf-8?B?VlpiV3piN0cycjl4MmlTaTV4enhyZFBNTjVGY3F6ai9FaUtjbnR2bXdvdnhH?=
 =?utf-8?Q?XTVFW6gdDjt5BBIDWAsyBsiZdb7yihaeEF5DB0z4hTFXp?=
X-MS-Exchange-AntiSpam-MessageData-1: 5PqWnLZhMvOp7w==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40bf8e00-6121-49b7-3ba3-08deee0ae847
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 07:19:34.8639
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZlO/JWnF72irpixE3lCIKl9U6oGpw9rBUhOMmTs0vsxAx8f4p7jGuFsPYu8ENUu1YBIMAkpHTEfvhfhoZGfHjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8434

On Tuesday, July 21, 2026 7:10=E2=80=AFPM Svyatoslav Ryhel wrote:
> Add missing vs-supply and io-channel-cells.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts b/arch/arm=
/boot/dts/nvidia/tegra114-asus-tf701t.dts
> index b71a02b3fd86f..32d55c18c7446 100644
> --- a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
> +++ b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
> @@ -1391,6 +1391,9 @@ power-sensor@44 {
>  			reg =3D <0x44>;
> =20
>  			shunt-resistor =3D <5000>;
> +
> +			vs-supply =3D <&vdd_3v3_sys>;
> +			#io-channel-cells =3D <1>;
>  		};
>  	};
> =20
> --=20
> 2.53.0
>=20
>=20

Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>



