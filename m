Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011046.outbound.protection.outlook.com [52.101.57.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB44E33CE86;
	Thu, 30 Jul 2026 06:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785394494; cv=fail; b=gb2JJpM6R7+kLqQVEAwImkTUkXxrD59AGFuA2Kd5F+Skj7ZZu6zkOsSHn3UW+jrshdw/qsjTSdVEc8c0ZHoe9m31h9CSMJ4rWsrLj3rgnYzYb+v53aLEn1XM5bUXz/Z+OptT7DDqh13OdbG46w+UN5xlDAhyHBvl0pY3lCRY9f8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785394494; c=relaxed/simple;
	bh=9vfjdxGd2IFm+m+21Nw+6VYiM3mW5cVGwvMNjtReIJ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Dd8+LEAcBM/b9X0ykMpt/3I63+XP2+ohk9yPfH+EK95aEoZPFaR4bRfPr8Qz8ovPFg4zgqasZOT/xyy8osTnL0xDNxnM7kYgWrN4kQSYzfj6onjTwfR85z9gPm4RLbBMbP0p4moth05t55fblkaGtq5+1fekztI66MyjuAkNKEg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=h0uRv0Hg; arc=fail smtp.client-ip=52.101.57.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="h0uRv0Hg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ANybhMP8JKP3ToVpVfm5BVBmUX3Ja6R4vK1Xj3Oo6JSwzTDotQKuMfxRpqTxQEqJ0sTNN5e3fvWZ+OFmNYMjydYqUbZt5VesNPriTXW579U+6I1NVtqjlpdFVp4WcIeE9ygprb/25hECQ855rQLBUTgPbRs44M4Ybxb21FoXHl2NhY039eLIFMNNAPwhFTQX+XXoxXou+rJN1FmE3PdjEFBPBLMUpBlktnF9zC8kQpb6awpu++kuoox1J9GxQRxur6bzoohRRaNwx49DH3SthlnHRtKE0SzHkwdda/hOuwi5hTjWK1w3I+dCPFW2N6ur7fRGeE91VRfEZNPlYwiVwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t117NxRosjf7Kw/pyb3gcWdQnhFyc38oObUjDl+5VUk=;
 b=vlY6qpDbgFicYJccESJ2NZLOB18fLd3ykji4MyugRemE0Lmp8abeUZFmlKNpG0zsaGFPbwzn1ZfeYpIu2Vhqhy7oLXmE+PEPAjCZoL4YGFB62OZgnYqDN0UTx+f3nHBOtlxDrNKI3NuOT3WDvQv/sv8ZwrhfKfP4Z+NJbMmUZyV8XVxzUrw6wiVqsKyAxwceU3BzYzWP9bq/3lql1uVIBboNMUKMYqbDqBGyVUnM4AHAy/NWJ/pIwKMJrTwDBOBldlnFrj4Q4t6cTqRK15BdhMUBoywgaPAcw9ZQrXQ+o2yZXGTTVA7jk5mMcx17g/P+mxZ/cJsP9RyCXyGh0fkRrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t117NxRosjf7Kw/pyb3gcWdQnhFyc38oObUjDl+5VUk=;
 b=h0uRv0HgPhSH29jm4uclp0wAYjL3Uf6Hgidr1FvY7WkAiIA9/8il18BzpCJo3FB5hv2GZmaerBOkbgo7OS6gOt25Hjyps7/Kv7WRIp7BMxXYw9m9XPbU1vWV0eCzPKDVVftnK82mCW0i+wLzuB99wGafN6oDouNLOo36aZRAYjgd7WH39wHVjdMsk/iMiUIeGxrRs5Q9B6hq/+Mn4kMhl7mr4DqFFMuICisepDx9wlL08ydqkDWC4Nj9vOmYV/tTQeqxoEzJRtHgKqSj1eaNZahDn/8gKE/0FKmA9WhwUkH0soAm7CeVvaj9nYugUVkXWPjr3alxdavMjpW5JTkmKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by SA1PR12MB7223.namprd12.prod.outlook.com (2603:10b6:806:2bc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.14; Thu, 30 Jul
 2026 06:54:41 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%6]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 06:54:41 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 03/10] ARM: tegra: tf701t: Add MC and EMC timing nodes
Date: Thu, 30 Jul 2026 15:50:54 +0900
Message-ID: <e1fSIXThTaiPka827bFPDw@nvidia.com>
In-Reply-To: <20260721101059.451699-4-clamor95@gmail.com>
References:
 <20260721101059.451699-1-clamor95@gmail.com>
 <20260721101059.451699-4-clamor95@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCP286CA0204.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::8) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|SA1PR12MB7223:EE_
X-MS-Office365-Filtering-Correlation-Id: defb17aa-9f54-404b-04b5-08deee076db6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|10070799003|366016|376014|18002099003|22082099003|6133799003|10067099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	CS2dl5WhQMuL0xwu++1MotG1yqJPQc0a5bU9wGe0AQj4WEbQ/t6fNg2+XSLpmVPzuAd589xBJP22pDS6C9MCNNsvOCmhL0FDdEVUL8HPvoyaGe+A1aOmXA6gBinwWndtarzNDd1UzmLgpvIZhB+qTQVHEH9AHEVe+l7Swku96L0AkP4LM195PvveJ5U6y2UOWy44ZFEJaUQL4yNaSj3KQJjbk4Y7Jp82pgHQCgGgsrmuC9SDvTz4rhk/5c+QWBUL7y2+2dIu8dzlFMgI2aNU2FFHEjXdlBFVACpYfxRm7FESP9RUaBjRtIJk+mwcsjpQ6azELDACeHlqp5l+uFvcUlRRI4aTUEEOBTGi8iDHH3B3oGE5o4AqT4EdGdlZhB2TfIzW9o/OyH8xvfUBmbxIYldg2Ex2HwsZLosYHkZjeJMQNw6vjdNL4qqxKvfV8TSbgc3dXT67UhLM8He6v/OoFME4zJxdXCehbz+e10fOAoGwPR3PCRRaHfcvv/nXPXCXMz5alw6dBtTgfvqTicDMqOY5/Lt584sThyXatynt8cQEs8z+4VM/4VZEsuINqkW139jJcjXEgg5kln26QiERmBe2hPPLikB9Adl7+XjOEjh8uf85tG60b2J3BRpY1d7RcHGKwQnWpsNsjhGJY2OZxAXu5e4fQU3KLRHfM0hrMFk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(10070799003)(366016)(376014)(18002099003)(22082099003)(6133799003)(10067099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YmVueVhodDBGVTZhL1RleWh1aDJEY25RT0tLTGEyMk5WTTUzNjBYUU1MN0Er?=
 =?utf-8?B?b2ZkV3dxMFcxOTRMZU5PM2d4U3hJZGNiVE5SWngrL3J5bHI3YStTMXBYSEFz?=
 =?utf-8?B?a3FDN082ZnBBNjVNNE5vYVhQNmpFN001YVhqMW5XZjlpZkc3WnhtdFVsV2pT?=
 =?utf-8?B?MFluTE84VUw2ZWcxR0RGZy9iQjJvdUxxWlBQeWdaTGxTZVc3RVpvdFJjd3RF?=
 =?utf-8?B?TVBOMTBDRFRPdWM1UzgrTXdWc3Qvc2xqRWQ0a29ZakJUbjluOUJrNHdzeUxK?=
 =?utf-8?B?NllGMlRMV01sNXp2R2ZHZHd4aUxIbUNzMnp1VzRBZkxEMkFzWmJTMDFxUDFM?=
 =?utf-8?B?ZjF4SzVrQmpsTWJYWWdHeFdXM2hYWHRWTW1VMXFsNTIrWmxXZTYyelNlQkFx?=
 =?utf-8?B?MlN0NW9GTG1FcmpyR1RTeDFPY1FwQ3paWHNZWlpwcUY4Ly9DcGNyY2NIYk44?=
 =?utf-8?B?SVlUZk5qOThWbE02VUlLc1B2TWN1TjNaSDl0WUJUbmRNb0wrT3JlUXdPTkZl?=
 =?utf-8?B?bHRURzBodnJlRnhKTDdaTHE0dVZLNnRMYklXVEQ1VHQwNWhaWmRVb2ZrNHlu?=
 =?utf-8?B?U1Nzc055ZS9udkY2bVRnZjcvOUU1b1RRZklOR3lOQkxwYjBoQXZuN3dMV3RV?=
 =?utf-8?B?V2hxU1FKL2FJL3NYbUc3YVhzVDR6eTNmUUw2UnZlSitRcjduclpKMmdFMnh4?=
 =?utf-8?B?cWVQc3pNVE4yQXEzbjNTSzdmWWdGUzJlREwxQ2FvbnJSUE1EWktXdDczQmEz?=
 =?utf-8?B?bEdiRFpMRWpqOGdEWDZDVkpnVkdUNGw5V00zMTF2ZjZPeGpsSUlyb05pV3dn?=
 =?utf-8?B?R3ZodGZIMk1OZW1Nc045ZnV4SUdVOGVyQjRnejV5empaWENWZjRuc3F6NTk1?=
 =?utf-8?B?Z0xvZUdJS0xBUU1vMFJYWm95ZlN6YzVFRWdaRzYzanVqTjRrWTZrOHpSdUEz?=
 =?utf-8?B?dmxJUXRWYWIwQjBEK2lIc0lJeVpRLzgyWWJDamxsOFJXY3MvWTN3VzFTUWpZ?=
 =?utf-8?B?cUhaMWZiN1FMdVQ3aDdFa0srejFEbjYrSWo0NUE3RGx2VWtQYU9LRS9KNTdX?=
 =?utf-8?B?THVuRVhlNEp2ZmljS0hja3ZVd29mSzRyVFR3Z052cDNpaGhaRGZTRW5iRmlu?=
 =?utf-8?B?YnlHaS9pbEtySmJISnRVdmhuV0V0UjBxcXNJa3lYWEkyRnVBQkcwQXltZGJY?=
 =?utf-8?B?TGZpVkdoWndTemdwNUpIa1JMWGJudkhySVFOa0NSb2hpbVRvajVETzJ2MGdB?=
 =?utf-8?B?V2hiMVhkV0k1NlpUaWN5eldEVUd0S0xIenh0R2tyMnU3U2dLSzBQeXl5Znlw?=
 =?utf-8?B?VmluaDZIcmN0QkdkK1hmZjJoaUhSeWc0Q2RwRGRRNktXVFo4SU9hb29GZEZq?=
 =?utf-8?B?REdxZDFlVEU0T3JVWjR5cjl0eXhiWUJaTGlGWFAxM2NOVFBvR1lXTWpmc2l1?=
 =?utf-8?B?YzVEUzY3bGR4MHd0RmZGNlh2VFd6dHBIc3UySjdOeGt6K2VoaXh2cmxKWTlE?=
 =?utf-8?B?ZDZ1aEMwOXByUUpOUUEzaGxsR29ISVlxOFhaTk5nbzlsajZSRGRESkszT2ZV?=
 =?utf-8?B?M0Vzckh4UFN4NVhnZjU2dTBRWWhyL0N3NU5Fcjk4S0xWOWVIZm9vSVZSOG5F?=
 =?utf-8?B?dFVSdWpCdlpWdStIQThiUW9NLzBid1ZmTlVHMEgwSW1oWmVTN1FqeW1ZZFU1?=
 =?utf-8?B?dUJ1cDNYd1k5aFdmTFhtdjNlVk9oSnVEcEIyWVZHOFBkRjE5UTBMUkJMWkVN?=
 =?utf-8?B?enFHbDBQVWFQWHMwUFpnK1B0NGl1R3NCVnE0OUFYMlkzZnN3YkFHZnM1dXBC?=
 =?utf-8?B?bHBHbUVFY1JZQWp2bHprblVnaVR4QjFEL2ZESGNCa3ZrbDVIS3cvdjhMdzd2?=
 =?utf-8?B?TGFlOFFPNUFqeVZWS1h3SFdKRnMwVFhlSCtOU3hlV0R3NElLL3hjcEc3WkJi?=
 =?utf-8?B?cFVTNUFvMFZDVDVCNEJwQ1lOTFBxV3pJQ3ljdHl2QndqQUZGV0FUMnRROFVG?=
 =?utf-8?B?TTh1QitGVGp3OHAwc2Q5cC9KUW4yYUYxdnIrajMrWmdJYVBTNEZsR1JlNnVx?=
 =?utf-8?B?OEd1T0YzNjBMbnJFNkNQSW5OQmZWQXFhV1Q0Tm9URUtSVS9Dc0l5R2FoK2l0?=
 =?utf-8?B?ZGJGMFNNR1ZISmZxaFMySXR2aUxzckV5NFRDeUlMYWUzZHBGRkEwOGpDN01I?=
 =?utf-8?B?emZyL2VoNXA3YTRrVmpzTVVNRnJ2SzVoZFJsamRFOVVEQ25FY3pXM2VWa0tp?=
 =?utf-8?B?Y3J2am96ay9sSHliUmR3T01uakxWWVlZUVgxVFRIUklyVGcycTI2SFRYSFVP?=
 =?utf-8?B?bGZjK3hscUdtblkvRXZteW5nWWpucGNKNWZiNXVpcGtJczRtWHlOUzdwTndG?=
 =?utf-8?Q?uASyrLfYzdpuJrxRLEUym/X7AmGimRczxBYWaGK+5HeUz?=
X-MS-Exchange-AntiSpam-MessageData-1: Qtu3oVNIIH3ayA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: defb17aa-9f54-404b-04b5-08deee076db6
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 06:54:40.9814
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hg7/AXJ7ARhMhhSGoS5Zr7UTO9TDnFMnZadIWCp045gGCZ57WH94uHGM0NBGGtHfVpiHvugf7oA8X5DvmOOXtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7223

On Tuesday, July 21, 2026 7:10=E2=80=AFPM Svyatoslav Ryhel wrote:
> Configure Memory Controllers of ASUS TF701T.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../boot/dts/nvidia/tegra114-asus-tf701t.dts  | 713 ++++++++++++++++++
>  1 file changed, 713 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts b/arch/arm=
/boot/dts/nvidia/tegra114-asus-tf701t.dts
> index 55e9256e80f33..00eeedf3ef7a5 100644
> --- a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
> +++ b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
> @@ -101,6 +101,89 @@ panel_secondary: panel@0 {
>  		};
>  	};
> =20
> +	clock@60006000 {
> +		emc-timings-0 {
> +			nvidia,ram-code =3D <0>;
> +
> +			timing-12750000 {
> +				clock-frequency =3D <12750000>;
> +				nvidia,parent-clock-frequency =3D <408000000>;
> +				clocks =3D <&tegra_car TEGRA114_CLK_PLL_P>;
> +				clock-names =3D "emc-parent";
> +			};
> +
> +			timing-20400000 {
> +				clock-frequency =3D <20400000>;
> +				nvidia,parent-clock-frequency =3D <408000000>;
> +				clocks =3D <&tegra_car TEGRA114_CLK_PLL_P>;
> +				clock-names =3D "emc-parent";
> +			};
> +
> +			timing-40800000 {
> +				clock-frequency =3D <40800000>;
> +				nvidia,parent-clock-frequency =3D <408000000>;
> +				clocks =3D <&tegra_car TEGRA114_CLK_PLL_P>;
> +				clock-names =3D "emc-parent";
> +			};
> +
> +			timing-68000000 {
> +				clock-frequency =3D <68000000>;
> +				nvidia,parent-clock-frequency =3D <408000000>;
> +				clocks =3D <&tegra_car TEGRA114_CLK_PLL_P>;
> +				clock-names =3D "emc-parent";
> +			};
> +
> +			timing-102000000 {
> +				clock-frequency =3D <102000000>;
> +				nvidia,parent-clock-frequency =3D <408000000>;
> +				clocks =3D <&tegra_car TEGRA114_CLK_PLL_P>;
> +				clock-names =3D "emc-parent";
> +			};
> +
> +			timing-204000000 {
> +				clock-frequency =3D <204000000>;
> +				nvidia,parent-clock-frequency =3D <408000000>;
> +				clocks =3D <&tegra_car TEGRA114_CLK_PLL_P>;
> +				clock-names =3D "emc-parent";
> +			};
> +
> +			timing-312000000 {
> +				clock-frequency =3D <312000000>;
> +				nvidia,parent-clock-frequency =3D <624000000>;
> +				clocks =3D <&tegra_car TEGRA114_CLK_PLL_C>;
> +				clock-names =3D "emc-parent";
> +			};
> +
> +			timing-408000000 {
> +				clock-frequency =3D <408000000>;
> +				nvidia,parent-clock-frequency =3D <408000000>;
> +				clocks =3D <&tegra_car TEGRA114_CLK_PLL_P>;
> +				clock-names =3D "emc-parent";
> +			};
> +
> +			timing-528000000 {
> +				clock-frequency =3D <528000000>;
> +				nvidia,parent-clock-frequency =3D <792000000>;
> +				clocks =3D <&tegra_car TEGRA114_CLK_PLL_M>;
> +				clock-names =3D "emc-parent";
> +			};
> +
> +			timing-624000000 {
> +				clock-frequency =3D <624000000>;
> +				nvidia,parent-clock-frequency =3D <624000000>;
> +				clocks =3D <&tegra_car TEGRA114_CLK_PLL_C>;
> +				clock-names =3D "emc-parent";
> +			};
> +
> +			timing-792000000 {
> +				clock-frequency =3D <792000000>;
> +				nvidia,parent-clock-frequency =3D <792000000>;
> +				clocks =3D <&tegra_car TEGRA114_CLK_PLL_M>;
> +				clock-names =3D "emc-parent";
> +			};
> +		};
> +	};
> +
>  	vde@6001a000 {
>  		assigned-clocks =3D <&tegra_car TEGRA114_CLK_VDE>;
>  		assigned-clock-parents =3D <&tegra_car TEGRA114_CLK_PLL_P>;
> @@ -1610,6 +1693,636 @@ i2c-thermtrip {
>  		};
>  	};
> =20
> +	memory-controller@70019000 {
> +		emc-timings-0 {
> +			/* Mozart Rev B Hynix DDR3 792MHz */
> +			nvidia,ram-code =3D <0>;
> +
> +			timing-12750000 {
> +				clock-frequency =3D <12750000>;
> +
> +				nvidia,emem-configuration =3D < 0x40040001 0x8000003f
> +					0x00000001 0x00000001 0x00000002 0x00000000
> +					0x00000001 0x00000001 0x00000002 0x00000008
> +					0x00000002 0x00000001 0x00000003 0x00000006
> +					0x06030102 0x000a0402 0x77e30303 0x001f0000 >;
> +			};
> +
> +			timing-20400000 {
> +				clock-frequency =3D <20400000>;
> +
> +				nvidia,emem-configuration =3D < 0x40020001 0x80000046
> +					0x00000001 0x00000001 0x00000002 0x00000000
> +					0x00000001 0x00000001 0x00000002 0x00000008
> +					0x00000002 0x00000001 0x00000003 0x00000006
> +					0x06030102 0x000a0402 0x76230303 0x001f0000 >;
> +			};
> +
> +			timing-40800000 {
> +				clock-frequency =3D <40800000>;
> +
> +				nvidia,emem-configuration =3D < 0xa0000001 0x8000005b
> +					0x00000001 0x00000001 0x00000002 0x00000000
> +					0x00000001 0x00000001 0x00000002 0x00000008
> +					0x00000002 0x00000001 0x00000003 0x00000006
> +					0x06030102 0x000a0402 0x74a30303 0x001f0000 >;
> +			};
> +
> +			timing-68000000 {
> +				clock-frequency =3D <68000000>;
> +
> +				nvidia,emem-configuration =3D < 0x00000001 0x80000076
> +					0x00000001 0x00000001 0x00000002 0x00000000
> +					0x00000001 0x00000001 0x00000002 0x00000008
> +					0x00000002 0x00000001 0x00000003 0x00000006
> +					0x06030102 0x000a0402 0x74230403 0x001f0000 >;
> +			};
> +
> +			timing-102000000 {
> +				clock-frequency =3D <102000000>;
> +
> +				nvidia,emem-configuration =3D < 0x08000001 0x80000098
> +					0x00000001 0x00000001 0x00000003 0x00000000
> +					0x00000002 0x00000001 0x00000002 0x00000008
> +					0x00000002 0x00000001 0x00000003 0x00000006
> +					0x06030102 0x000a0403 0x73c30504 0x001f0000 >;
> +			};
> +
> +			timing-204000000 {
> +				clock-frequency =3D <204000000>;
> +
> +				nvidia,emem-configuration =3D < 0x01000003 0x800000fe
> +					0x00000001 0x00000001 0x00000005 0x00000002
> +					0x00000004 0x00000001 0x00000002 0x00000008
> +					0x00000002 0x00000001 0x00000003 0x00000006
> +					0x06030102 0x000a0405 0x73840a06 0x001f0000 >;
> +			};
> +
> +			timing-312000000 {
> +				clock-frequency =3D <312000000>;
> +
> +				nvidia,emem-configuration =3D < 0x0b000004 0x8000016a
> +					0x00000001 0x00000002 0x00000007 0x00000004
> +					0x00000006 0x00000001 0x00000002 0x00000007
> +					0x00000002 0x00000002 0x00000004 0x00000006
> +					0x06040202 0x000b0607 0x76e50f08 0x001f0000 >;
> +			};
> +
> +			timing-408000000 {
> +				clock-frequency =3D <408000000>;
> +
> +				nvidia,emem-configuration =3D < 0x02000006 0x80000190
> +					0x00000001 0x00000002 0x0000000a 0x00000006
> +					0x00000008 0x00000001 0x00000002 0x00000009
> +					0x00000002 0x00000002 0x00000004 0x00000006
> +					0x06040202 0x000e070a 0x7547130b 0x001f0000 >;
> +			};
> +
> +			timing-528000000 {
> +				clock-frequency =3D <528000000>;
> +
> +				nvidia,emem-configuration =3D < 0x0f000007 0x80000190
> +					0x00000002 0x00000003 0x0000000d 0x00000008
> +					0x0000000a 0x00000001 0x00000002 0x00000009
> +					0x00000002 0x00000002 0x00000005 0x00000006
> +					0x06050202 0x0010090d 0x7428180e 0x001f0000 >;
> +			};
> +
> +			timing-624000000 {
> +				clock-frequency =3D <624000000>;
> +
> +				nvidia,emem-configuration =3D < 0x06000009 0x80000190
> +					0x00000003 0x00000004 0x0000000f 0x00000009
> +					0x0000000c 0x00000001 0x00000003 0x0000000b
> +					0x00000002 0x00000002 0x00000005 0x00000007
> +					0x07050202 0x00130b0f 0x736a1d10 0x001f0000 >;
> +			};
> +
> +			timing-792000000 {
> +				clock-frequency =3D <792000000>;
> +
> +				nvidia,emem-configuration =3D < 0x0e00000b 0x80000190
> +					0x00000004 0x00000005 0x00000013 0x0000000c
> +					0x0000000f 0x00000002 0x00000003 0x0000000c
> +					0x00000002 0x00000002 0x00000006 0x00000008
> +					0x08060202 0x00160d13 0x734c2414 0x001f0000 >;
> +			};
> +		};
> +	};
> +
> +	external-memory-controller@7001b000 {
> +		emc-timings-0 {
> +			/* Mozart Rev B Hynix DDR3 792MHz */
> +			nvidia,ram-code =3D <0>;
> +
> +			timing-12750000 {
> +				clock-frequency =3D <12750000>;
> +
> +				nvidia,emc-zcal-cnt-long =3D <0x00000042>;
> +				nvidia,emc-auto-cal-interval =3D <0x001fffff>;
> +				nvidia,emc-cfg =3D <0x7324000e>;
> +				nvidia,emc-mode-1 =3D <0x80100003>;
> +				nvidia,emc-mode-2 =3D <0x80200008>;
> +				nvidia,emc-mode-4 =3D <0x00000000>;
> +				nvidia,emc-mode-reset =3D <0x80001221>;
> +				nvidia,emc-auto-cal-config =3D <0xa0f10f0f>;
> +				nvidia,emc-auto-cal-config2 =3D <0x00000000>;
> +				nvidia,emc-auto-cal-config3 =3D <0x00000000>;
> +				nvidia,emc-ctt-term-ctrl =3D <0x00000802>;
> +				nvidia,emc-mrs-wait-cnt =3D <0x000c000c>;
> +				nvidia,emc-sel-dpd-ctrl =3D <0x00040320>;
> +				nvidia,emc-xm2dqspadctrl2 =3D <0x0000a11c>;
> +				nvidia,emc-zcal-interval =3D <0x00000000>;
> +
> +				nvidia,emc-configuration =3D  < 0x00000000
> +					0x00000003 0x00000000 0x00000000 0x00000004
> +					0x0000000a 0x00000003 0x0000000b 0x00000000
> +					0x00000000 0x00000003 0x00000001 0x00000000
> +					0x00000005 0x0000000f 0x00000006 0x00000006
> +					0x00000004 0x00000004 0x00010000 0x00000000
> +					0x00000000 0x00000004 0x00000009 0x0000000d
> +					0x0000000f 0x00000060 0x00000000 0x00000018
> +					0x00000002 0x00000002 0x00000001 0x00000000
> +					0x00000007 0x0000000f 0x00000005 0x00000005
> +					0x00000004 0x00000004 0x00000004 0x00000004
> +					0x00000000 0x00000004 0x00000005 0x00000064
> +					0x00000005 0x00000006 0x00000020 0x00000000
> +					0x0000aa88 0x002c00a0 0x00008000 0x00064000
> +					0x00064000 0x00064000 0x00064000 0x00064000
> +					0x00064000 0x00064000 0x00064000 0x00000000
> +					0x00000000 0x00000000 0x00000000 0x00000000
> +					0x00000000 0x00000000 0x00000000 0x00000000
> +					0x00000000 0x00000000 0x00000000 0x00000000
> +					0x00000000 0x00000000 0x00000000 0x0007c000
> +					0x0007c000 0x0007c000 0x0007c000 0x001112a0
> +					0x00000000 0x00000000 0x77ffc085 0x81f1f108
> +					0x03037504 0x0000003f 0x20820800 0x00249249
> +					0x0000003f 0x00000007 0x02000000 0x00000042
> +					0x000c000c 0x00000000 0x00000000 0x800001c5 >;
> +			};
> +
> +			timing-20400000 {
> +				clock-frequency =3D <20400000>;
> +
> +				nvidia,emc-zcal-cnt-long =3D <0x00000042>;
> +				nvidia,emc-auto-cal-interval =3D <0x001fffff>;
> +				nvidia,emc-cfg =3D <0x7324000e>;
> +				nvidia,emc-mode-1 =3D <0x80100003>;
> +				nvidia,emc-mode-2 =3D <0x80200008>;
> +				nvidia,emc-mode-4 =3D <0x00000000>;
> +				nvidia,emc-mode-reset =3D <0x80001221>;
> +				nvidia,emc-auto-cal-config =3D <0xa0f10f0f>;
> +				nvidia,emc-auto-cal-config2 =3D <0x00000000>;
> +				nvidia,emc-auto-cal-config3 =3D <0x00000000>;
> +				nvidia,emc-ctt-term-ctrl =3D <0x00000802>;
> +				nvidia,emc-mrs-wait-cnt =3D <0x000c000c>;
> +				nvidia,emc-sel-dpd-ctrl =3D <0x00040320>;
> +				nvidia,emc-xm2dqspadctrl2 =3D <0x0000a11c>;
> +				nvidia,emc-zcal-interval =3D <0x00000000>;
> +
> +				nvidia,emc-configuration =3D  < 0x00000000
> +					0x00000005 0x00000000 0x00000000 0x00000004
> +					0x0000000a 0x00000003 0x0000000b 0x00000000
> +					0x00000000 0x00000003 0x00000001 0x00000000
> +					0x00000005 0x0000000f 0x00000006 0x00000006
> +					0x00000004 0x00000004 0x00010000 0x00000000
> +					0x00000000 0x00000004 0x00000009 0x0000000d
> +					0x0000000f 0x0000009a 0x00000000 0x00000026
> +					0x00000002 0x00000002 0x00000001 0x00000000
> +					0x00000007 0x0000000f 0x00000006 0x00000006
> +					0x00000004 0x00000004 0x00000004 0x00000004
> +					0x00000000 0x00000004 0x00000005 0x000000a0
> +					0x00000005 0x00000006 0x00000020 0x00000000
> +					0x0000aa88 0x002c00a0 0x00008000 0x00064000
> +					0x00064000 0x00064000 0x00064000 0x00064000
> +					0x00064000 0x00064000 0x00064000 0x00000000
> +					0x00000000 0x00000000 0x00000000 0x00000000
> +					0x00000000 0x00000000 0x00000000 0x00000000
> +					0x00000000 0x00000000 0x00000000 0x00000000
> +					0x00000000 0x00000000 0x00000000 0x0007c000
> +					0x0007c000 0x0007c000 0x0007c000 0x001112a0
> +					0x00000000 0x00000000 0x77ffc085 0x81f1f108
> +					0x03037504 0x0000003f 0x20820800 0x00249249
> +					0x0000003f 0x0000000b 0x02000000 0x00000042
> +					0x000c000c 0x00000000 0x00000000 0x8000023a >;
> +			};
> +
> +			timing-40800000 {
> +				clock-frequency =3D <40800000>;
> +
> +				nvidia,emc-zcal-cnt-long =3D <0x00000042>;
> +				nvidia,emc-auto-cal-interval =3D <0x001fffff>;
> +				nvidia,emc-cfg =3D <0x7324000e>;
> +				nvidia,emc-mode-1 =3D <0x80100003>;
> +				nvidia,emc-mode-2 =3D <0x80200008>;
> +				nvidia,emc-mode-4 =3D <0x00000000>;
> +				nvidia,emc-mode-reset =3D <0x80001221>;
> +				nvidia,emc-auto-cal-config =3D <0xa0f10f0f>;
> +				nvidia,emc-auto-cal-config2 =3D <0x00000000>;
> +				nvidia,emc-auto-cal-config3 =3D <0x00000000>;
> +				nvidia,emc-ctt-term-ctrl =3D <0x00000802>;
> +				nvidia,emc-mrs-wait-cnt =3D <0x000c000c>;
> +				nvidia,emc-sel-dpd-ctrl =3D <0x00040320>;
> +				nvidia,emc-xm2dqspadctrl2 =3D <0x0000a11c>;
> +				nvidia,emc-zcal-interval =3D <0x00000000>;
> +
> +				nvidia,emc-configuration =3D  < 0x00000001
> +					0x0000000a 0x00000001 0x00000000 0x00000004
> +					0x0000000a 0x00000003 0x0000000b 0x00000000
> +					0x00000000 0x00000003 0x00000001 0x00000000
> +					0x00000005 0x0000000f 0x00000006 0x00000006
> +					0x00000004 0x00000004 0x00010000 0x00000000
> +					0x00000000 0x00000004 0x00000009 0x0000000d
> +					0x0000000f 0x00000134 0x00000000 0x0000004d
> +					0x00000002 0x00000002 0x00000001 0x00000000
> +					0x00000008 0x0000000f 0x0000000c 0x0000000c
> +					0x00000004 0x00000004 0x00000004 0x00000004
> +					0x00000000 0x00000004 0x00000005 0x0000013f
> +					0x00000005 0x00000006 0x00000020 0x00000000
> +					0x0000aa88 0x002c00a0 0x00008000 0x00064000
> +					0x00064000 0x00064000 0x00064000 0x00064000
> +					0x00064000 0x00064000 0x00064000 0x00000000
> +					0x00000000 0x00000000 0x00000000 0x00000000
> +					0x00000000 0x00000000 0x00000000 0x00000000
> +					0x00000000 0x00000000 0x00000000 0x00000000
> +					0x00000000 0x00000000 0x00000000 0x0007c000
> +					0x0007c000 0x0007c000 0x0007c000 0x001112a0
> +					0x00000000 0x00000000 0x77ffc085 0x81f1f108
> +					0x03037504 0x0000003f 0x20820800 0x00249249
> +					0x0000003f 0x00000015 0x02000000 0x00000042
> +					0x000c000c 0x00000000 0x00000000 0x80000370 >;
> +			};
> +
> +			timing-68000000 {
> +				clock-frequency =3D <68000000>;
> +
> +				nvidia,emc-zcal-cnt-long =3D <0x00000042>;
> +				nvidia,emc-auto-cal-interval =3D <0x001fffff>;
> +				nvidia,emc-cfg =3D <0x7324000e>;
> +				nvidia,emc-mode-1 =3D <0x80100003>;
> +				nvidia,emc-mode-2 =3D <0x80200008>;
> +				nvidia,emc-mode-4 =3D <0x00000000>;
> +				nvidia,emc-mode-reset =3D <0x80001221>;
> +				nvidia,emc-auto-cal-config =3D <0xa0f10f0f>;
> +				nvidia,emc-auto-cal-config2 =3D <0x00000000>;
> +				nvidia,emc-auto-cal-config3 =3D <0x00000000>;
> +				nvidia,emc-ctt-term-ctrl =3D <0x00000802>;
> +				nvidia,emc-mrs-wait-cnt =3D <0x000c000c>;
> +				nvidia,emc-sel-dpd-ctrl =3D <0x00040320>;
> +				nvidia,emc-xm2dqspadctrl2 =3D <0x0000a11c>;
> +				nvidia,emc-zcal-interval =3D <0x00000000>;
> +
> +				nvidia,emc-configuration =3D  < 0x00000003
> +					0x00000011 0x00000002 0x00000000 0x00000004
> +					0x0000000a 0x00000003 0x0000000b 0x00000000
> +					0x00000000 0x00000003 0x00000001 0x00000000
> +					0x00000005 0x0000000f 0x00000006 0x00000006
> +					0x00000004 0x00000004 0x00010000 0x00000000
> +					0x00000000 0x00000004 0x00000009 0x0000000d
> +					0x0000000f 0x00000202 0x00000000 0x00000080
> +					0x00000002 0x00000002 0x00000001 0x00000000
> +					0x0000000f 0x0000000f 0x00000013 0x00000013
> +					0x00000004 0x00000004 0x00000004 0x00000004
> +					0x00000000 0x00000004 0x00000005 0x00000213
> +					0x00000005 0x00000006 0x00000020 0x00000000
> +					0x0000aa88 0x002c00a0 0x00008000 0x00064000
> +					0x00064000 0x00064000 0x00064000 0x00064000
> +					0x00064000 0x00064000 0x00064000 0x00000000
> +					0x00000000 0x00000000 0x00000000 0x00000000
> +					0x00000000 0x00000000 0x00000000 0x00000000
> +					0x00000000 0x00000000 0x00000000 0x00000000
> +					0x00000000 0x00000000 0x00000000 0x0007c000
> +					0x0007c000 0x0007c000 0x0007c000 0x001112a0
> +					0x00000000 0x00000000 0x77ffc085 0x81f1f108
> +					0x03037504 0x0000003f 0x20820800 0x00249249
> +					0x0000003f 0x00000022 0x02000000 0x00000042
> +					0x000c000c 0x00000000 0x00000000 0x8000050e >;
> +			};
> +
> +			timing-102000000 {
> +				clock-frequency =3D <102000000>;
> +
> +				nvidia,emc-zcal-cnt-long =3D <0x00000042>;
> +				nvidia,emc-auto-cal-interval =3D <0x001fffff>;
> +				nvidia,emc-cfg =3D <0x7324000e>;
> +				nvidia,emc-mode-1 =3D <0x80100003>;
> +				nvidia,emc-mode-2 =3D <0x80200008>;
> +				nvidia,emc-mode-4 =3D <0x00000000>;
> +				nvidia,emc-mode-reset =3D <0x80001221>;
> +				nvidia,emc-auto-cal-config =3D <0xa0f10f0f>;
> +				nvidia,emc-auto-cal-config2 =3D <0x00000000>;
> +				nvidia,emc-auto-cal-config3 =3D <0x00000000>;
> +				nvidia,emc-ctt-term-ctrl =3D <0x00000802>;
> +				nvidia,emc-mrs-wait-cnt =3D <0x000c000c>;
> +				nvidia,emc-sel-dpd-ctrl =3D <0x00040320>;
> +				nvidia,emc-xm2dqspadctrl2 =3D <0x0000a11c>;
> +				nvidia,emc-zcal-interval =3D <0x00000000>;
> +
> +				nvidia,emc-configuration =3D  < 0x00000004
> +					0x0000001a 0x00000003 0x00000001 0x00000004
> +					0x0000000a 0x00000003 0x0000000b 0x00000001
> +					0x00000001 0x00000003 0x00000001 0x00000000
> +					0x00000005 0x0000000f 0x00000006 0x00000006
> +					0x00000004 0x00000004 0x00010000 0x00000000
> +					0x00000000 0x00000004 0x00000009 0x0000000d
> +					0x0000000f 0x00000303 0x00000000 0x000000c0
> +					0x00000002 0x00000002 0x00000001 0x00000000
> +					0x00000018 0x0000000f 0x0000001c 0x0000001c
> +					0x00000004 0x00000004 0x00000004 0x00000005
> +					0x00000000 0x00000004 0x00000005 0x0000031c
> +					0x00000005 0x00000006 0x00000020 0x00000000
> +					0x0000aa88 0x002c00a0 0x00008000 0x00064000
> +					0x00064000 0x00064000 0x00064000 0x00064000
> +					0x00064000 0x00064000 0x00064000 0x00000000
> +					0x00000000 0x00000000 0x00000000 0x00000000
> +					0x00000000 0x00000000 0x00000000 0x00000000
> +					0x00000000 0x00000000 0x00000000 0x00000000
> +					0x00000000 0x00000000 0x00000000 0x0007c000
> +					0x0007c000 0x0007c000 0x0007c000 0x001112a0
> +					0x00000000 0x00000000 0x77ffc085 0x81f1f108
> +					0x03037504 0x0000003f 0x20820800 0x00249249
> +					0x0000003f 0x00000033 0x02000000 0x00000042
> +					0x000c000c 0x00000000 0x00000000 0x80000713 >;
> +			};
> +
> +			timing-204000000 {
> +				clock-frequency =3D <204000000>;
> +
> +				nvidia,emc-zcal-cnt-long =3D <0x00000042>;
> +				nvidia,emc-auto-cal-interval =3D <0x001fffff>;
> +				nvidia,emc-cfg =3D <0x7320000e>;
> +				nvidia,emc-mode-1 =3D <0x80100003>;
> +				nvidia,emc-mode-2 =3D <0x80200008>;
> +				nvidia,emc-mode-4 =3D <0x00000000>;
> +				nvidia,emc-mode-reset =3D <0x80001221>;
> +				nvidia,emc-auto-cal-config =3D <0xa0f10f0f>;
> +				nvidia,emc-auto-cal-config2 =3D <0x00000000>;
> +				nvidia,emc-auto-cal-config3 =3D <0x00000000>;
> +				nvidia,emc-ctt-term-ctrl =3D <0x00000802>;
> +				nvidia,emc-mrs-wait-cnt =3D <0x000c000c>;
> +				nvidia,emc-sel-dpd-ctrl =3D <0x00040320>;
> +				nvidia,emc-xm2dqspadctrl2 =3D <0x0000a11c>;
> +				nvidia,emc-zcal-interval =3D <0x00020000>;
> +
> +				nvidia,emc-configuration =3D  < 0x00000009
> +					0x00000035 0x00000007 0x00000002 0x00000004
> +					0x0000000a 0x00000003 0x0000000b 0x00000002
> +					0x00000002 0x00000003 0x00000001 0x00000000
> +					0x00000005 0x0000000f 0x00000007 0x00000006
> +					0x00000004 0x00000004 0x00010000 0x00000000
> +					0x00000000 0x00000004 0x00000009 0x0000000d
> +					0x0000000f 0x00000607 0x00000000 0x00000181
> +					0x00000002 0x00000002 0x00000001 0x00000000
> +					0x00000032 0x0000000f 0x00000038 0x00000038
> +					0x00000004 0x00000004 0x00000004 0x00000009
> +					0x00000000 0x00000004 0x00000005 0x00000638
> +					0x00000006 0x00000004 0x00000020 0x00000000
> +					0x0000aa88 0x002c00a0 0x00008000 0x00064000
> +					0x00064000 0x00064000 0x00064000 0x00064000
> +					0x00064000 0x00064000 0x00064000 0x00000000
> +					0x00000000 0x00000000 0x00000000 0x00000000
> +					0x00000000 0x00000000 0x00000000 0x00000000
> +					0x00000000 0x00000000 0x00000000 0x00000000
> +					0x00000000 0x00000000 0x00000000 0x0007c000
> +					0x0007c000 0x0007c000 0x0007c000 0x001112a0
> +					0x00000000 0x00000000 0x77ffc085 0x81f1f108
> +					0x03037504 0x0000003f 0x20820800 0x00249249
> +					0x0000003f 0x00000000 0x02000000 0x00000100
> +					0x000c000c 0x00000000 0x00000000 0x80000d22 >;
> +			};
> +
> +			timing-312000000 {
> +				clock-frequency =3D <312000000>;
> +
> +				nvidia,emc-zcal-cnt-long =3D <0x00000042>;
> +				nvidia,emc-auto-cal-interval =3D <0x001fffff>;
> +				nvidia,emc-cfg =3D <0x5300000e>;
> +				nvidia,emc-mode-1 =3D <0x80100002>;
> +				nvidia,emc-mode-2 =3D <0x80200000>;
> +				nvidia,emc-mode-4 =3D <0x00000000>;
> +				nvidia,emc-mode-reset =3D <0x80000321>;
> +				nvidia,emc-auto-cal-config =3D <0xa0f10f0f>;
> +				nvidia,emc-auto-cal-config2 =3D <0x00000000>;
> +				nvidia,emc-auto-cal-config3 =3D <0x00000000>;
> +				nvidia,emc-ctt-term-ctrl =3D <0x00000802>;
> +				nvidia,emc-mrs-wait-cnt =3D <0x0171000c>;
> +				nvidia,emc-sel-dpd-ctrl =3D <0x00040320>;
> +				nvidia,emc-xm2dqspadctrl2 =3D <0x0001013d>;
> +				nvidia,emc-zcal-interval =3D <0x00020000>;
> +
> +				nvidia,emc-configuration =3D  < 0x0000000e
> +					0x00000050 0x00000009 0x00000003 0x00000004
> +					0x00000008 0x00000002 0x00000009 0x00000003
> +					0x00000003 0x00000002 0x00000001 0x00000000
> +					0x00000004 0x0000000f 0x00000006 0x00000006
> +					0x00000005 0x00000004 0x00010000 0x00000000
> +					0x00000000 0x00000004 0x0000000b 0x0000000d
> +					0x0000000f 0x00000941 0x00000000 0x00000250
> +					0x00000001 0x00000008 0x00000001 0x00000000
> +					0x0000004d 0x0000000e 0x00000055 0x00000200
> +					0x00000004 0x00000004 0x00000004 0x0000000d
> +					0x00000000 0x00000004 0x00000005 0x00000982
> +					0x00000000 0x00000004 0x00000020 0x00000000
> +					0x00005088 0x002c00a0 0x00008000 0x00030000
> +					0x00030000 0x00030000 0x00030000 0x00030000
> +					0x00030000 0x00030000 0x00030000 0x00000000
> +					0x00000000 0x00000000 0x00000000 0x00000000
> +					0x00000000 0x00000000 0x00000000 0x00000000
> +					0x00000000 0x00000000 0x00000000 0x00000000
> +					0x00000000 0x00000000 0x00000000 0x0003c000
> +					0x0003c000 0x0003c000 0x0003c000 0x001112a0
> +					0x00000000 0x00000000 0x77ffc085 0x81f1f108
> +					0x03037504 0x00000000 0x20820800 0x00249249
> +					0x0000003f 0x00000000 0x02000000 0x00000100
> +					0x0171000c 0x00000000 0x00000000 0x8000138d >;
> +			};
> +
> +			timing-408000000 {
> +				clock-frequency =3D <408000000>;
> +
> +				nvidia,emc-zcal-cnt-long =3D <0x00000042>;
> +				nvidia,emc-auto-cal-interval =3D <0x001fffff>;
> +				nvidia,emc-cfg =3D <0x53000006>;
> +				nvidia,emc-mode-1 =3D <0x80100002>;
> +				nvidia,emc-mode-2 =3D <0x80200008>;
> +				nvidia,emc-mode-4 =3D <0x00000000>;
> +				nvidia,emc-mode-reset =3D <0x80000731>;
> +				nvidia,emc-auto-cal-config =3D <0xa0f10f0f>;
> +				nvidia,emc-auto-cal-config2 =3D <0x00000000>;
> +				nvidia,emc-auto-cal-config3 =3D <0x00000000>;
> +				nvidia,emc-ctt-term-ctrl =3D <0x00000802>;
> +				nvidia,emc-mrs-wait-cnt =3D <0x0158000c>;
> +				nvidia,emc-sel-dpd-ctrl =3D <0x00040320>;
> +				nvidia,emc-xm2dqspadctrl2 =3D <0x0001013d>;
> +				nvidia,emc-zcal-interval =3D <0x00020000>;
> +
> +				nvidia,emc-configuration =3D  < 0x00000012
> +					0x00000069 0x0000000d 0x00000004 0x00000005
> +					0x00000009 0x00000002 0x0000000c 0x00000004
> +					0x00000004 0x00000002 0x00000001 0x00000000
> +					0x00000004 0x0000000f 0x00000006 0x00000006
> +					0x00000005 0x00000004 0x00010000 0x00000000
> +					0x00000000 0x00000004 0x0000000c 0x0000000e
> +					0x00000010 0x00000c2e 0x00000000 0x0000030b
> +					0x00000001 0x00000008 0x00000001 0x00000000
> +					0x00000066 0x00000011 0x0000006f 0x00000200
> +					0x00000004 0x00000004 0x00000004 0x00000011
> +					0x00000000 0x00000004 0x00000005 0x00000c6f
> +					0x00000000 0x00000004 0x00000020 0x00000000
> +					0x00005088 0x002c0080 0x00008000 0x00030000
> +					0x00030000 0x00030000 0x00030000 0x00030000
> +					0x00030000 0x00030000 0x00030000 0x00000000
> +					0x00000000 0x00000000 0x00000000 0x00000000
> +					0x00000000 0x00000000 0x00000000 0x00000000
> +					0x00000000 0x00000000 0x00000000 0x00000000
> +					0x00000000 0x00000000 0x00000000 0x0003c000
> +					0x0003c000 0x0003c000 0x0003c000 0x001112a0
> +					0x00000000 0x00000000 0x77ffc085 0x81f1f108
> +					0x03037504 0x00000000 0x20820800 0x00249249
> +					0x0000003f 0x00000000 0x02000000 0x00000100
> +					0x0158000c 0x00000000 0x00000000 0x80001941 >;
> +			};
> +
> +			timing-528000000 {
> +				clock-frequency =3D <528000000>;
> +
> +				nvidia,emc-zcal-cnt-long =3D <0x00000042>;
> +				nvidia,emc-auto-cal-interval =3D <0x001fffff>;
> +				nvidia,emc-cfg =3D <0x53000004>;
> +				nvidia,emc-mode-1 =3D <0x80100002>;
> +				nvidia,emc-mode-2 =3D <0x80200008>;
> +				nvidia,emc-mode-4 =3D <0x00000000>;
> +				nvidia,emc-mode-reset =3D <0x80000941>;
> +				nvidia,emc-auto-cal-config =3D <0xa0f10f0f>;
> +				nvidia,emc-auto-cal-config2 =3D <0x00000000>;
> +				nvidia,emc-auto-cal-config3 =3D <0x00000000>;
> +				nvidia,emc-ctt-term-ctrl =3D <0x00000802>;
> +				nvidia,emc-mrs-wait-cnt =3D <0x013a000c>;
> +				nvidia,emc-sel-dpd-ctrl =3D <0x00040320>;
> +				nvidia,emc-xm2dqspadctrl2 =3D <0x0000013d>;
> +				nvidia,emc-zcal-interval =3D <0x00020000>;
> +
> +				nvidia,emc-configuration =3D  < 0x00000018
> +					0x00000088 0x00000011 0x00000006 0x00000006
> +					0x00000009 0x00000002 0x0000000d 0x00000006
> +					0x00000006 0x00000002 0x00000001 0x00000000
> +					0x00000005 0x0000000f 0x00000008 0x00000009
> +					0x00000007 0x00000004 0x00010000 0x00000000
> +					0x00000000 0x00000006 0x0000000c 0x00000010
> +					0x00000012 0x00000fd6 0x00000000 0x000003f5
> +					0x00000002 0x0000000b 0x00000001 0x00000000
> +					0x00000084 0x00000012 0x0000008f 0x00000200
> +					0x00000004 0x00000004 0x00000004 0x00000016
> +					0x00000000 0x00000005 0x00000006 0x00001017
> +					0x00000000 0x00000006 0x00000020 0x00000000
> +					0x00005088 0xf0120091 0x00008000 0x0000000a
> +					0x0000000a 0x0000000a 0x0000000a 0x0000000a
> +					0x0000000a 0x0000000a 0x0000000a 0x00000000
> +					0x00000000 0x00000000 0x00000000 0x00000000
> +					0x00000000 0x00000000 0x00000000 0x00000000
> +					0x00000000 0x00000000 0x00000000 0x00000000
> +					0x00000000 0x00000000 0x00000000 0x0000000c
> +					0x0000000b 0x0000000c 0x0000000c 0x001112a0
> +					0x00000000 0x00000000 0x77ffc085 0x81f1f108
> +					0x07077504 0x00000000 0x20820800 0x00249249
> +					0x0000003f 0x00000000 0x02000000 0x00000100
> +					0x013a000c 0x00000000 0x00000000 0x80002062 >;
> +			};
> +
> +			timing-624000000 {
> +				clock-frequency =3D <624000000>;
> +
> +				nvidia,emc-zcal-cnt-long =3D <0x00000042>;
> +				nvidia,emc-auto-cal-interval =3D <0x001fffff>;
> +				nvidia,emc-cfg =3D <0x53200000>;
> +				nvidia,emc-mode-1 =3D <0x80100002>;
> +				nvidia,emc-mode-2 =3D <0x80200410>;
> +				nvidia,emc-mode-4 =3D <0x00000000>;
> +				nvidia,emc-mode-reset =3D <0x80000b61>;
> +				nvidia,emc-auto-cal-config =3D <0xa0f10f0f>;
> +				nvidia,emc-auto-cal-config2 =3D <0x00000000>;
> +				nvidia,emc-auto-cal-config3 =3D <0x00000000>;
> +				nvidia,emc-ctt-term-ctrl =3D <0x00000802>;
> +				nvidia,emc-mrs-wait-cnt =3D <0x0122000c>;
> +				nvidia,emc-sel-dpd-ctrl =3D <0x00040320>;
> +				nvidia,emc-xm2dqspadctrl2 =3D <0x0000013d>;
> +				nvidia,emc-zcal-interval =3D <0x00020000>;
> +
> +				nvidia,emc-configuration =3D  < 0x0000001d
> +					0x000000a1 0x00000014 0x00000007 0x00000007
> +					0x0000000b 0x00000003 0x00000010 0x00000007
> +					0x00000007 0x00000002 0x00000001 0x00000000
> +					0x00000005 0x0000000f 0x00000009 0x0000000a
> +					0x00000008 0x00000004 0x00010000 0x00000000
> +					0x00000000 0x00000007 0x0000000c 0x00000012
> +					0x00000014 0x000012c3 0x00000000 0x000004b0
> +					0x00000002 0x0000000d 0x00000001 0x00000000
> +					0x0000009c 0x00000015 0x000000a9 0x00000200
> +					0x00000005 0x00000005 0x00000005 0x00000019
> +					0x00000000 0x00000006 0x00000007 0x00001304
> +					0x00000009 0x00000006 0x80000000 0x00000000
> +					0x0000ba88 0xf00d0191 0x00008000 0x0000000a
> +					0x0000000a 0x0000000a 0x0000000a 0x0000000a
> +					0x0000000a 0x0000000a 0x0000000a 0x00000000
> +					0x00000000 0x00000000 0x00000000 0x00000000
> +					0x00000000 0x00000000 0x00000000 0x00000000
> +					0x00000000 0x00000000 0x00000000 0x00000000
> +					0x00000000 0x00000000 0x00000000 0x0000000b
> +					0x0000000b 0x0000000b 0x0000000b 0x001112a0
> +					0x00000000 0x00000000 0x77ffc085 0x81f1f108
> +					0x07077504 0x00000000 0x20820800 0x0028a28a
> +					0x0000003f 0x00000000 0x02000000 0x00000100
> +					0x0122000c 0x00000000 0x00000000 0x80002617 >;
> +			};
> +
> +			timing-792000000 {
> +				clock-frequency =3D <792000000>;
> +
> +				nvidia,emc-zcal-cnt-long =3D <0x00000042>;
> +				nvidia,emc-auto-cal-interval =3D <0x001fffff>;
> +				nvidia,emc-cfg =3D <0x53000000>;
> +				nvidia,emc-mode-1 =3D <0x80100002>;
> +				nvidia,emc-mode-2 =3D <0x80200418>;
> +				nvidia,emc-mode-4 =3D <0x00000000>;
> +				nvidia,emc-mode-reset =3D <0x80000d71>;
> +				nvidia,emc-auto-cal-config =3D <0xa0f10f0f>;
> +				nvidia,emc-auto-cal-config2 =3D <0x00000000>;
> +				nvidia,emc-auto-cal-config3 =3D <0x00000000>;
> +				nvidia,emc-ctt-term-ctrl =3D <0x00000802>;
> +				nvidia,emc-mrs-wait-cnt =3D <0x00f8000c>;
> +				nvidia,emc-sel-dpd-ctrl =3D <0x00040000>;
> +				nvidia,emc-xm2dqspadctrl2 =3D <0x0000013d>;
> +				nvidia,emc-zcal-interval =3D <0x00020000>;
> +
> +				nvidia,emc-configuration =3D  < 0x00000025
> +					0x000000cc 0x0000001a 0x00000009 0x00000008
> +					0x0000000d 0x00000004 0x00000013 0x00000009
> +					0x00000009 0x00000003 0x00000001 0x00000000
> +					0x00000006 0x0000000f 0x0000000a 0x0000000b
> +					0x00000008 0x00000006 0x00010000 0x00000000
> +					0x00000000 0x00000008 0x0000000d 0x00000014
> +					0x00000016 0x000017e1 0x00000000 0x000005f8
> +					0x00000003 0x00000011 0x00000001 0x00000000
> +					0x000000c6 0x00000018 0x000000d6 0x00000200
> +					0x00000005 0x00000005 0x00000005 0x00000020
> +					0x00000000 0x00000007 0x00000008 0x00001822
> +					0x00000000 0x00000006 0x80000000 0x00000000
> +					0x00005088 0xf0070191 0x00008000 0x00000009
> +					0x00000009 0x00000009 0x00000009 0x00000009
> +					0x00000009 0x00000009 0x00000009 0x00018000
> +					0x00018000 0x00018000 0x00018000 0x00000000
> +					0x00000000 0x00000000 0x00000000 0x00000000
> +					0x00000000 0x00000000 0x00000000 0x00000000
> +					0x00000000 0x00000000 0x00000000 0x0000000b
> +					0x0000000b 0x0000000b 0x0000000b 0x001112a0
> +					0x00000000 0x00000000 0x77ffc085 0x81f1f108
> +					0x07077504 0x00000000 0x1c71c700 0x0028a28a
> +					0x0000003f 0x00000000 0x02000000 0x00000100
> +					0x00f8000c 0x00000000 0x00000000 0x80003012 >;
> +			};
> +		};
> +	};
> +
>  	ahub@70080000 {
>  		/* HIFI CODEC (i2s1) */
>  		i2s@70080400 {
> --=20
> 2.53.0
>=20
>=20

Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>



