Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011047.outbound.protection.outlook.com [40.107.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C223769F0;
	Thu, 30 Jul 2026 07:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785398019; cv=fail; b=RTnpxPauaDik1+SnKIadoq8nfArQp9S7oEWoJz9oax6hqOCRlX55cKRRoD8ayMGWqowRM7qEo7Vc4Ae2NlZsxHAtTbjtpy0u7W5Mna/3yYSYB6SCdw1fMK9tmDDG3g+hcxDRpievqvSfMlcdE8CTW5UwJaHMjGcy8Tx/eE7gqG0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785398019; c=relaxed/simple;
	bh=hv6g0cNoart7uCVEIKZh1YyulpfF5lhkb+i0NaCcJmc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=O1FWv1RaF1rvsW0zbeHyeDLeOsRIPMeJoexqZY2nImnMeTfdbPTxyEZfvafuRLZ0WPRKGQyJq/+hAavbLAr8oYqSDTjaHogFmAbhTxgr05g4KL9SnSnu81Vw33P52ZtWdEMpxUWsNE/7Q1XlCaV05pLxs3gQqizDLqquOhmbRKk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Z3L7zXyX; arc=fail smtp.client-ip=40.107.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Z3L7zXyX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yX1GGAge19RxKrsTclprD/i3tbZWdVQpHAYcd8PKmQmnlgRuaDYVozD99wZ3q+iM5rh9ML6zuhGHWD8g9oW+EHboxjIS8QQtez4A9yhtEK29qscj7RzBAvgiMWgqBkGo1DyIdvZkYtRiJOl1quukGRDHAGo59X2MKtqzes94guv/J5T1HYfiP1LAuBqrxfZLVIJw37dkg956WZUq1gKsDKj5doH5SK53Y11fR7nUQbLfEPmSopb2OwvcjSbzArPbIlH/fWEwtkJgc4ShKbdBIlVKLVbnQzGRuzvmShUhUmZD3Mq39TDl9aJHGFGuCJWn7OiwHEr84vYk6X9iG21PiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fVwWrZ7wQdyWIYlZDeMCJZvZqA24EjsqBUklAK2UaGU=;
 b=TMEsvi4YyiGSrnj72y7kKIRPk871xHaiyDxNkY4VUbx9tjNIPnK2zrrtgMaZ8BbaPkeDutlG1A3GsDT1i7JgabIEodPHqBThNK2b3mq19tKwysjF0fSXTIbSVaeccke9jLuOGqgzAz4HOLS5bohTQ6Qz96KCLYA48EMkEzMDsEhuJQ8M0kGh9DcF3hcVnRyg0q/D3sjhBcsIm9wJs/e6UoE+PClcpZHiJdx01KA1lJrtUV07TB1z9aBycO/2yWWYa6w1av5LWSBL2PDGVWxdMD0OGCHMicLUj1O1vtkDiw5dtY+VbF1vQnLgTtPdVE76xvXfP152MgGRLdhRe5AWsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fVwWrZ7wQdyWIYlZDeMCJZvZqA24EjsqBUklAK2UaGU=;
 b=Z3L7zXyXABO6gsO6RLbN4UUSY2ebwUciDQghvN3af1vCUqMyJ8DIcJ0uEA1MhsYWKxape52cMPctvACujhSyaEmT557eUvuWw5tgBc27ZIet0i6HNl6pG4JKxKDiEYrbJEAPrib3ov7IU9f5qCf8jVnDRWkHdKJCCjr/ciUSC1Rg6BSp9XvRrei2aBSy6LHjPYsqkaZAZsOOn69JU9/3aQUHpSqtgRpTenTQ/eJQk+O9uPCdz48PvzPq+Cm6t3bB9HJkVhqj8xnuTHrDS73Cy6zkc7Wv4f3lNSN+/c8e+t0nAaEJlU2IE10RFkvzRwcAbNVMIKLbwxTnpYTJgUGlPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by SN7PR12MB8147.namprd12.prod.outlook.com (2603:10b6:806:32e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Thu, 30 Jul
 2026 07:53:32 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%6]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 07:53:32 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 06/10] ARM: tegra: tf701t: Tune MMC devices
Date: Thu, 30 Jul 2026 16:53:27 +0900
Message-ID: <QjD02ThARhuC9RycPaAIOA@nvidia.com>
In-Reply-To:
 <CAPVz0n2cBDZ16rek-phtp0J5QKSfyZHWHtJX7CeWjraEuz=5qw@mail.gmail.com>
References:
 <20260721101059.451699-1-clamor95@gmail.com>
 <L1pGU82wTC69ycdbd3YRJQ@nvidia.com>
 <CAPVz0n2cBDZ16rek-phtp0J5QKSfyZHWHtJX7CeWjraEuz=5qw@mail.gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TY4PR01CA0111.jpnprd01.prod.outlook.com
 (2603:1096:405:378::12) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|SN7PR12MB8147:EE_
X-MS-Office365-Filtering-Correlation-Id: 480d6c3c-ee2e-4ae1-e1bc-08deee0fa693
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|23010399003|366016|1800799024|6133799003|56012099006|11063799006|10067099003|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	RCqi0b1ncUVH7A8BareCgmo5WIYoQOJv8mCi7vBRCKJ8K1Zn2FraaoLqQqc7CK12RYNvaJ0fMozIyXTPpsKG07iYm9yCaMGmfk4zmHP8u2i5TQWKQF8jSAa3my8d4ubyjo2xma1A/O/ZR0JFxCbzomOSGO/R3xsMB8lFm74tYkITEtsXnVQl4t+MIcV7gn+hEFynFBrjwNXu8RbjbONyyplzWPEOWDJSVGK+mIliiJpogA5j+68RE+tW6K7/fO7Rk8IS8eyZFiWqH3zmET06O2CgaL6behi5dxk8kOXhuPC/j68nBuPOMIUf/VUaCHpBiDzw3OtkXNJ2qojCrtYjgmSwZrLOYaKC6OFZeD2Uje5gcBorFG5JxFv4LhPmRBFvqx+PyO2PNE5DI3lwDWIiP6siJrLD+jByym+0j0xN50l6pjCpv/aMlKurECfhJKDbm4K74OsrCQoADkfUD1GN2p+F+QGfWrjs6DWFN21CnnS7+OLBKkasnIPDyMoruWZvPixrtfxUmrIOSGEmTJgakaEC4BLljIg5XQjgbZD5Mg+2YCqncJHohvDV63m2smcicaaGv/8JryO/grsOYDppsHTpipQ0MFGLfZjTXy8g2+XsdMnRxHlAxTU8musz5uaJ5cINsLk0LjbG+W+QMhAvfhu/gpXG3By0bzdhqVsnQ2Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(23010399003)(366016)(1800799024)(6133799003)(56012099006)(11063799006)(10067099003)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bXllaGppaVJPMzM2YkovY1J1aTBtbDVaOUJzd3B4bGN6dEdHZ29wQjZjZ0lq?=
 =?utf-8?B?ejBUcHpxQk10Z0JrcXVNMDFkYmpGeWxybzFadXBoaVJOR3lqaHNqSHlOV2xZ?=
 =?utf-8?B?bm5TN05OOWR4WGlna0IzaU9yT1R6RzEyRDNCUG02K2ZPSHBuT29WV3pLZDFy?=
 =?utf-8?B?aGtlQUtPUnlPb2hOemZPRDlpaFpXOFdQUGxsa0lacFRCZFdHaE00dlFWVG5W?=
 =?utf-8?B?WkNsUUJ5SnhHZXp5ZjFFZTI4aVNUelFmYXpxWStQVUQzQUlRQnFJMlZLSFVV?=
 =?utf-8?B?Q2VaOGFIRlVRbWFuRWdRVHkwbFZVQTArMVQwUllIWGFVNFVOdDQ5bG4rTWNI?=
 =?utf-8?B?NVdBZ3ZOR1FRTHd5eXMrVlc1Sm5Fam43R0laQWRuUlBYQTg2TGJZVjZwRG9O?=
 =?utf-8?B?d29ad3JGSHZoYkJZM2k1cW45MnBkSi9xVm9SUGVDS1AvdVVzTytlY3N4M2JC?=
 =?utf-8?B?L2k3WWFXeGpLOUwzTlE2VWxuQ3dDSi8rMHVhaW1JOG85azFkbHBYNnBnWlp4?=
 =?utf-8?B?OUp4MXVqWEFwdFdtSkVWVm5GVzZtU2VZaGhEbFdGNUJIdTF0TFA1aXNRWDYw?=
 =?utf-8?B?OHVGNTh4Rkh5bGdyOWlvYjg2V2FQdWFhOWRwSTJvdlZBOXdwY2lZSTNFTytU?=
 =?utf-8?B?emdOSzUyM1hveXlZQTFscW5tSDBZV3VBcldlUE1ZM21OWWdkVlNuZnVxWG1W?=
 =?utf-8?B?TGF2ZjVyaGdkMU5SR0cydW1yaU5zZXFwWC9wVytpV1NURXlGWHRQMDYxdXhv?=
 =?utf-8?B?MkZyaWJzNDQzejl4cXV2QU5wM0tZTzBXak9YMXJFcUJXOFJIcnlOSnVVVTRK?=
 =?utf-8?B?c0lDTWJVK25hY1hQRk50VnRYMEpqV3pscEZISUVhNFF0NCtraFNoa1o3VlFj?=
 =?utf-8?B?ellLQm04cGxHeG1jSHdWcnJzUERmMm1Xa0NpemwwcFVCbkdsRlJGTFY0dXhP?=
 =?utf-8?B?ZjViZyt0L3V1ZlZZYnVtalRhVHRlcXNQR3hJa3B6REdyUHVCaWxvSWREZGh5?=
 =?utf-8?B?MkpiaFIwYjNOMW8xTnVIeGJnNERWWUp5NnNLUFB4RHoyWFlBaG9EUy94amxO?=
 =?utf-8?B?VmZrRnprd005a1ZMcTZuVDQ0VFNDZG13YW41R2FSR1IxSlNJTzhPVlhYaGJv?=
 =?utf-8?B?NmRSSi9xZU12MXIrNlp4RDErbStkOVRiQXlOWkhtVXVmK2tBTlhYcWZ4aisr?=
 =?utf-8?B?YkJFSGFpSjFIZndON2cyaHp0SmN4MmFMcUgyNnRsSGVLd0ZBZFVKaHFjSGQr?=
 =?utf-8?B?Zm83MjUycWRXaktGdy9kc29mejBRNEpBQ05qb3ZVa0ViMGxXS0xoU2JOSlJP?=
 =?utf-8?B?Q3hqblJtSmFsVFZ1eUQ0MDVhaXIzWXlES0pnSU13K3FLMjFYajlBaVRrMG1l?=
 =?utf-8?B?VWpWWE16YkM2TmVKcWh4SjFPeHlqOTdKY1NSR0h3SExMYW1aa0lOZThOMTBO?=
 =?utf-8?B?aEVOWHZnQmJ2TGRSSzBGSlpuT29JekFXbDRrNDRLWDZJdk5uNUlta0M0YXMz?=
 =?utf-8?B?eTRsK1hJZXE1VzcxbTNKS3FYOGJVbXRWUTdEQnRrTW1MWG5McmhDNVBzYk1H?=
 =?utf-8?B?NGJ4NUJBaWNDaGpmRFUraDVSTHlERnNwWVdKWDQxbStRc2d5em5ORGhyNG83?=
 =?utf-8?B?b1dIaGE4Z0dFaVY5a0NrcWFHV3BWczAyZ2ljZFNmZlpuYVhtcGdQNXZKWU1S?=
 =?utf-8?B?YUJLUlpvdDNkamtYbEF5MExMYllIREtMMXlCTHl2YklITkxWY1dHYXcrUXpi?=
 =?utf-8?B?L2dua0l1WDMwUktHWHJhZzJHQ242SU9NMERGV2Z0MHFPeTFWZW03Qk5MNG9Z?=
 =?utf-8?B?Z0NXWWo5NWdzbHB0b1pCY2hkRnJHeFdYWFlIY2Ezd3diZ3hXeXNqem1tbGZM?=
 =?utf-8?B?ODBuOXZKVk9nNFZ5Si9ZMXRtSDFBZzVoNHpXNW1McEYzTWFnNVlybFI2REYy?=
 =?utf-8?B?Zzk5STVmbGRNOWVNZVhQTUQvL2U4Wk45V29KQTdvTGxjRzRhNGhEMkMzZVhn?=
 =?utf-8?B?SURSaTAxdWxpeEpxWitlT0JTcXR1TDFjVWRUMS9XbHhlWGlqaEZGUjFZaWg1?=
 =?utf-8?B?S0dqVGhGVElrbXY2YVpubE41Vyt0RTJDaS9TN3BTSDNscXBtUVRlak1BZS9F?=
 =?utf-8?B?ZEJKMVEyRFdremgycStad2lzRlJ2NWhSUUhIOVhBQS9TYWxiM1o0eEoyYWhi?=
 =?utf-8?B?OVo4eUE0dW1lSTZtT3MrVDlsNlF6M2gycFVtSXluZDBoZFowenUzV3E1MXhx?=
 =?utf-8?B?RXRyUlpEb3FYZHBkR3RSZkxaMFAvWTJMZDVFQm5Tc1cwcXQ3R0p3TWhNZlJW?=
 =?utf-8?B?bG5VTDZyc0dYajFFb0F6MDRjdVNiam1EclQvVStlTmIyZGJrR241KzVPMHht?=
 =?utf-8?Q?V4oJ9oorPGbiWCK3trQ+YbLj6MctSQ6qctTTZLneBTyig?=
X-MS-Exchange-AntiSpam-MessageData-1: OICHxVLKKm9ZmA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 480d6c3c-ee2e-4ae1-e1bc-08deee0fa693
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 07:53:32.2045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MZUAczhG41S2WnOif6vb49lov41Uk2YYzz/hxLwT8i57Owpfbof+YDuFy984n3RBtUtP4eYsFjdoiyXX4OuZMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8147

On Tuesday, July 28, 2026 11:17=E2=80=AFPM Svyatoslav Ryhel wrote:
> =D0=B2=D1=82, 28 =D0=BB=D0=B8=D0=BF. 2026=E2=80=AF=D1=80. =D0=BE 15:09 Mi=
kko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > On Tuesday, July 21, 2026 7:10=E2=80=AFPM Svyatoslav Ryhel wrote:
> > > Add SDR104 mode to WiFi SDIO and uSD device nodes, remove mmc-ddr-1_8=
v
> > > which is eMMC specific and improve their power sequences. The uSD car=
d
> > > refuses to work reliably with fixed regulator and 1.8V IO supply. Adj=
ust
> > > configuration to mimic setup proposed by the vendor in the downstream
> > > kernel. Add HS200 mode support to the eMMC sdmmc device node.
> > >
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > ---
> > >  .../boot/dts/nvidia/tegra114-asus-tf701t.dts  | 35 +++++++----------=
--
> > >  1 file changed, 13 insertions(+), 22 deletions(-)
> > >
> > > diff --git a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts b/arch=
/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
> > > index 83f8dd84d28a2..3de5c84d5f009 100644
> > > --- a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
> > > +++ b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
> > > @@ -1645,9 +1645,9 @@ ldo8 {
> > >
> > >                                       vddio_usd: ldo9 {
> > >                                               regulator-name =3D "vdd=
io_usd";
> > > -                                             /* min voltage of 1.8v =
is not stable */
> > > -                                             regulator-min-microvolt=
 =3D <2900000>;
> > > +                                             regulator-min-microvolt=
 =3D <1800000>;
> > >                                               regulator-max-microvolt=
 =3D <2900000>;
> > > +                                             regulator-boot-on;
> > >                                       };
> > >
> > >                                       avdd_hdmi: ldoln {
> > > @@ -2350,9 +2350,9 @@ brcm_wifi_pwrseq: pwrseq-wifi {
> > >               clocks =3D <&tegra_pmc TEGRA_PMC_CLK_BLINK>;
> > >               clock-names =3D "ext_clock";
> > >
> > > -             reset-gpios =3D <&gpio TEGRA_GPIO(X, 7) GPIO_ACTIVE_LOW=
>;
> > > -             post-power-on-delay-ms =3D <300>;
> > > -             power-off-delay-us =3D <300>;
> > > +             reset-gpios =3D <&gpio TEGRA_GPIO(CC, 5) GPIO_ACTIVE_LO=
W>;
> > > +             post-power-on-delay-ms =3D <100>;
> > > +             power-off-delay-us =3D <100>;
> > >       };
> > >
> > >       /* WiFi */
> > > @@ -2372,9 +2372,7 @@ mmc@78000000 {
> > >               non-removable;
> > >
> > >               sd-uhs-ddr50;
> > > -             mmc-ddr-1_8v;
> > > -
> > > -             power-gpios =3D <&gpio TEGRA_GPIO(CC, 5) GPIO_ACTIVE_HI=
GH>;
> > > +             sd-uhs-sdr104;
> > >
> > >               nvidia,default-tap =3D <0x2>;
> > >               nvidia,default-trim =3D <0x2>;
> > > @@ -2396,14 +2394,18 @@ wifi@1 {
> > >       /* MicroSD card */
> > >       mmc@78000400 {
> > >               status =3D "okay";
> > > -
> > >               bus-width =3D <4>;
> > > +
> > >               cd-gpios =3D <&gpio TEGRA_GPIO(V, 2) GPIO_ACTIVE_LOW>;
> > > +             power-gpios =3D <&gpio TEGRA_GPIO(K, 1) GPIO_ACTIVE_HIG=
H>;
> > > +
> > > +             sd-uhs-ddr50;
> > > +             sd-uhs-sdr104;
> > >
> > >               nvidia,default-tap =3D <0x3>;
> > >               nvidia,default-trim =3D <0x3>;
> > >
> > > -             vmmc-supply =3D <&vdd_2v9_usd>;
> > > +             vmmc-supply =3D <&vcore_emmc>;
> > >               vqmmc-supply =3D <&vddio_usd>;
> > >       };
> > >
> > > @@ -2414,6 +2416,7 @@ mmc@78000600 {
> > >
> > >               non-removable;
> > >               mmc-ddr-1_8v;
> > > +             mmc-hs200-1_8v;
> > >
> > >               vmmc-supply =3D <&vcore_emmc>;
> > >               vqmmc-supply =3D <&vdd_1v8_vio>;
> > > @@ -2608,17 +2611,6 @@ hdmi_5v0_sys: regulator-hdmi {
> > >               vin-supply =3D <&vdd_smps10_out2>;
> > >       };
> > >
> > > -     vdd_2v9_usd: regulator-vdd-usd {
> > > -             compatible =3D "regulator-fixed";
> > > -             regulator-name =3D "vdd_sd_slot";
> > > -             regulator-min-microvolt =3D <2900000>;
> > > -             regulator-max-microvolt =3D <2900000>;
> > > -             regulator-boot-on;
> > > -             gpio =3D <&gpio TEGRA_GPIO(K, 1) GPIO_ACTIVE_HIGH>;
> > > -             enable-active-high;
> > > -             vin-supply =3D <&vcore_emmc>;
> > > -     };
> > > -
> > >       vdd_1v8_cam: regulator-cam-vio {
> > >               compatible =3D "regulator-fixed";
> > >               regulator-name =3D "vdd_1v8_cam";
> > > @@ -2655,7 +2647,6 @@ vdd_3v3_com: regulator-com {
> > >               regulator-name =3D "vdd_3v3_com";
> > >               regulator-min-microvolt =3D <3300000>;
> > >               regulator-max-microvolt =3D <3300000>;
> > > -             regulator-always-on;
> > >               regulator-boot-on;
> > >               gpio =3D <&gpio TEGRA_GPIO(U, 1) GPIO_ACTIVE_HIGH>;
> > >               enable-active-high;
> > > --
> > > 2.53.0
> > >
> > >
> >
> > Which vendor BSP are you referencing? The one I have seems to set
> > MMC_UHS_MASK_DDR50, but I'm not quite sure what board definitions these
> > devices are actually using.
> >
>=20
> TF701T is based on Macallan board file. Downstream sets
> MMC_UHS_MASK_DDR50 for sdmmc 1 and 2 (sd and wifi) and no flags for
> mmc. From extensive testing on the device I can confirm that sdr104
> mode can be used on sd and wifi sdmmc (in addition to ddr50 which is
> not removed). Same story with eMMC and HS200 mode.

Very good. From some searching this is down to the board design, so if=20
the TF701T works with it then all should be good. I think at this point=20
if any user has an issue they will know where to complain, anyway :)

Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>



