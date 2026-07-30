Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012010.outbound.protection.outlook.com [40.93.195.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04DB734A797;
	Thu, 30 Jul 2026 08:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785398589; cv=fail; b=NY4+NGmynqeceEKZ0Oqm5/qKvFvVlbGUJ9aqEK1BPtRevANqaJ8nT/H3jxdCFxxg9H1TkW3It3+P67V+pKwc3aStDjvddzteu2h2kkJrVBSp0fZFAbHNLrTP4N4vNd4IWJ83bygzKVPbGeOpSBe1uXWdA5bVE7aHG57tPDYqbH0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785398589; c=relaxed/simple;
	bh=veRh0vq77rBVdGgcTnjWYwDsw78hwstxj872jGhER/U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DwbXW7YtYNiP2htXX25UUF0x6xFKJ7a8IhgumTblCKmMZZoA4BH0oM3Av8LySGERX3gvEuV/YKs//qat6mZFUR2xsqCgFZ8LGePLGlRbOmdWEGfD757FtJNBPybqxcBr8ZyPANtbrP5uVR1A3zBnpdP47REq666ZNocaIM2pMsk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=TBng+wIj; arc=fail smtp.client-ip=40.93.195.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="TBng+wIj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vPAzuSsjadzBIUqx8XGfHwPnO9hj8BltKS7EvDwcH7eZ2vM188+nh8OzpFKfmXDBEpOXNdFtFe836h7wIGu6vKbS8Gq11XKK8LYrbp3+0IubECW/4q98VdrHT9KBKyu0ttHt8bgGbMI2UM4nCKHBRT1UqfDzvA1dqC61CwjBzX9YHhZw6zBDPzogUDAJz6NiY/9YAQkBLZ0OhQUZrsuNMz7KPtPK6UnLvk2oXI5kjPyTirgcqXgvs+2a8Szaa4PoWlPUl+U0I4VBEG5B0D3/ErlaCzqV0DUFAzXlXjmXZL/82RaLWrVj60WAMJXCI/+6hb9f+VoF/BaksFMIkPkdKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B5aB0RbSl6XvC1aYQzJjt4s0845vfiLVQojJXYVw3Tk=;
 b=oe6S3d3bhubUk7VLbxJnmSpx7xHEG44xWAOJbqxKsCraR03qA2rCP5xLWiZvV2YsdSp0af9Wav2xLy1U4Hq4s08CHPtAu3ijDqhOvu653LipHhSQ0GpzDkqhczoF96ZrO/A8JV2PN4D8U6gwTjeWqxusKDF9zzojVjUJgww+AV3z99xk0cHT5BHbkQSpzyUABn661DOfFyVUCB37g9u1S327EwJJ1gH76WvoJEIqhiRnk+U9LfEtgRbrLH6KuU9TTMBhMnCcEvP5zb87fkOqDAhV+wvUFIyDnD28kbG6b9ZypTJlOKROSYQaOJUk0vqffttz1VugLvByCmIB75z89g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B5aB0RbSl6XvC1aYQzJjt4s0845vfiLVQojJXYVw3Tk=;
 b=TBng+wIjE311T7VICt6kXhak4i55/Nos1FDCSgcrfwtUhGpJcSLM/c0jO4jSQ9epyE/GDalXUftMmgtGTWNNrviq6IJueogwBp5veDKQekBlpVsZZaOdEPX5QXxVukBxWPOcnRFVC9PoICJRTQFMchPt/dFX4b3YI0PwiyV+qNyqtJLnCepKP4WGc0ccy266H0cSrm2P+TehWvQDfhnckb3ipNEwXf8uepy2Oi+mbaIz90U844I1at9aolNJ6Id4Ln0hpVnRfcPL4vmdaFwRcI0zk9YO23DzG4Ht0sOa0LTtf33YlLF9UlNjdBl+Ewo3wkrZ7TTj5dFPjCR3avE8PQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by MN0PR12MB5929.namprd12.prod.outlook.com (2603:10b6:208:37c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.13; Thu, 30 Jul
 2026 08:03:04 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%6]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 08:03:04 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v2 09/10] ARM: tegra: tf701t: Configure UART-B line used for GPS
Date: Thu, 30 Jul 2026 17:03:00 +0900
Message-ID: <MR-pmWD9T5SMTXp3xcI22A@nvidia.com>
In-Reply-To: <20260721101059.451699-10-clamor95@gmail.com>
References:
 <20260721101059.451699-1-clamor95@gmail.com>
 <20260721101059.451699-10-clamor95@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TY4PR01CA0017.jpnprd01.prod.outlook.com
 (2603:1096:405:2bf::14) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|MN0PR12MB5929:EE_
X-MS-Office365-Filtering-Correlation-Id: ab98fd99-7119-410b-3aa5-08deee10fba4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|376014|23010399003|366016|4143699003|11063799006|56012099006|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	bjWFxNTUeAzfz69t50TZCgx7ekWnGwM7bnKBFRuZJafp76bXH1KgOrpvklxZr2QtHyUGv5pa0b7MBpW1plsz61hEoYa5YCXELmP4gRvOVMvjpBAh88knNRQx3BaTebLpw2zqFryV5oTbbGrBpoRDh/5vS7xQAj2lPqmvASkUpEqbfwjQw8i846ZKNlGGQqlt5lCVrgGGetpFeR/n4oRSJeypeRgFyeICmJ2/L5FfMzIhlnxEov7BCsoX4DPCG24B+MaojsG7sleZ0GcYr3+M4dunzN8PZKVT355d1ULeJkBYIDARMntqs+dzkSKDZ4rO9yylvF3Z7iEw2EvF6jYfIwd/d4jGHhMu5tUsKCN4GYMjwZRe/xdNpen8SYe3MPEPbehsziF8N+niRAT+HiiCF7ZsgfkiAMTxYCHXgV+rPkeuZfPZCOI/MYQ9MmaPG2ZXanNgLDnNuElfM05BfylyRCXy4GaC1CwefPhsS1cTRepVk0qgNsRvbOD+d2fTgz7UMaWi1M3xL8kDOZ1InNL2Hn0XY+OgfsZ1EGyrtIJvX1/UMyU+Q2mEUD0K37n4q3b1oDHyzJCt0m0RyacDjopTd7ZF4f0xeIiwXPQSOEsdrrpkA8TxPaQQYtf76QsMsTiptJrEs19cLoCofQsb/E66s3nuvYt8uz9EFok/15BSpg0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(376014)(23010399003)(366016)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NjZJdG00UWJ1Z3dydnRXUHBSbGk5UW9BQlFITk5DL0ZjQzJMSHU0d3k2Umdy?=
 =?utf-8?B?YzZNWjI0bUtsNW5QQ1VueVYrb3dWL3QrNmU3emRJYWd5ai9KdmJvQ0Rud0NN?=
 =?utf-8?B?bjgrSTY5QmRrUTRGYUViQVJNeWdHT0IvMEY2Wlp5R1RsZG1QQkxEdXA4Z0Zi?=
 =?utf-8?B?Ui95Um5tVHFXRzlJcytwUThMLzhzaG9FODV4c1JKOW1GOFRubUcxUkZPRldv?=
 =?utf-8?B?bHNiVUtvTThac2RSWjNETVFOd2dNeXZOd0tGS0dkNnoxZFdFVXR3YWJXeHdG?=
 =?utf-8?B?U1Uxa29UMXdBL2lFU1VJelY1a1lGUUFFVWxrVEdYeUs0Sk54U3JxdzhFelZY?=
 =?utf-8?B?STJzU0RmaU9HVUJOZHhtR0Y5Mng1ZDZEWkJyRElVSENFVStVUTcrQ2xHMFY3?=
 =?utf-8?B?ZDlub2lzNC9EZUcxRHgvbjVSVzhreTJ5QkN1aVVWZThjbHhYMktNSk1QcTkr?=
 =?utf-8?B?eFhyMXRJSjdHT3BlUWxIenE0Z0VxYi94R3BOZ0JYbFJaUHhWSzFRZ3p2Vk5S?=
 =?utf-8?B?QVRsTE9KSmxZZ0tXclFacjVzYVFuL3NIbmJvdklBa0Ztdm9VNFFwMTMyaG9J?=
 =?utf-8?B?bHZvSXN0WlFTamI5SXRzR3BkQld4RWg2VzFpTENOd2ZZOUhUb004R0VnOXhj?=
 =?utf-8?B?a0NJTkVmSUlTWERBN1RpMFVublRzZk85eE1nWnA4c1dqYWlDZHdUQWNNOG9S?=
 =?utf-8?B?Zk1GVzZ0M0RabEtDUEI4MVBCelV0eksyNFhCRTZWRDVDMnhqK3NZRU5mRThi?=
 =?utf-8?B?dWtOME5CQUpKTWkyNFBBMTU2Z2FhZU9TZUVrbUdsU2h3b2N3NmNqSWIrenlz?=
 =?utf-8?B?czcwcGlHV2I1eVNvd29DdmYzR1dQNkx6bG84cU9vRzRESStWd3IzUXEvRXE4?=
 =?utf-8?B?Ymg4eVRDOXJpemVnREpwZzVOTG5xVkgxQXFrcFZ4OUdIWDNnZG5JYkczdkkx?=
 =?utf-8?B?WTA1a1lVUUorOGc3OE9hVVNCNkowcTM2cFN1YUR1dDEyZUJnaFlYTjZGQURF?=
 =?utf-8?B?SWk1NDJYWUl1T2NzNVptNENTc2VLNDZVRkxMTWg2OElRUS9pY3RqZmM4S3o5?=
 =?utf-8?B?R0VwRnlJZGhxVUU5RVVSNXNoWDYyN2FzajB2eDY0Zjc0Wm4xRWlrREJYRVFX?=
 =?utf-8?B?K1c4RGhqYWw2emd2Tmk4Vkczd056V3NaZ01HVTNYZHRncURUdStzVVM2aHl0?=
 =?utf-8?B?TXJnN3FLTHlidEpOZHpyVlA1cFh1TlJPeUlGQ3Y3TU5Mc09yRGs2L2N1Sjly?=
 =?utf-8?B?RTQ5Yy9ZSGptQU95TWpuai9obTB5aDdQVkpJSmVoV0Q0S011ZXJhcWdtMXB2?=
 =?utf-8?B?Nk5acE4xNHpWQ2RsUXBZbjdiQTBDQ3FPL1lSQW9BTVRmVzJwYkVkYXlqbDBt?=
 =?utf-8?B?TmdQYnZLUjRDQU5sTk1UOEpjVUVkNWl4ZVNzL282UXNRSTBQa2FwMit5R1du?=
 =?utf-8?B?cWNxaHMwMlk4ZWRDR1BTYmpKRVJseDFiczBJVjR0MUIxbmRPTDFXekJqU3FF?=
 =?utf-8?B?Q3pJcHk2czRWSXpIVTlnc3FldmkrVG1zbjVZVlQ3NlE4MGZsRkdmSXhGakhH?=
 =?utf-8?B?TjdpWFMvSC9CUS85SjFoQzhhMHVWRnRiNElWQmpzS2lRWG83NnhnbXFPYVNV?=
 =?utf-8?B?ZVhHV0ZPVTQrZ1RUTEhFcFFhbVp1dTJqZjN6VTdkd3Y5Nnp6eUhuVWMxWlJy?=
 =?utf-8?B?dXM5Zjl6YnhSQjRybERFdlZtem1BU2hOS05nRzVGNGkxbk1kbmE2eTVHcXFN?=
 =?utf-8?B?czk3ZElMc3J0Sy9GQzFkM3E4N1FZb1FWUHMrM3liY0dwMHZHcFdGdnV3d3pr?=
 =?utf-8?B?cEVZbmhzZXRqL1FQS3hjdjVLRUhIMmo4b0JqMFlDRjBQcWZkKy91SEJYb3Zp?=
 =?utf-8?B?NEZmVkpaVHZja2k4eXQ4K05weGc5V1NFeHFiSFYySENKSTdOUGl6UkxTbStj?=
 =?utf-8?B?K3AvZEJsQ3BOZXg3NW1WSDdUZFBUWVpuK0hUNUoxRDhXdk1TQ3I1cmNoQTJW?=
 =?utf-8?B?OCtUeG1FQTNybUl5cWFtczZQQkhDeTJZMkUxY0hMeWw0OUJMNGZyTTl3YzZY?=
 =?utf-8?B?NENqQk40UVdKVW1MRWRYZEN2ZktXcGE4cTd6T09BQW9kNFl0aGJoc051K2Vp?=
 =?utf-8?B?aGFBTlpUeDhGcWw4RVh4RVpVZnRBQ0ZGcjVVNUNnc2JOZnJBM2hhU2w5RUIz?=
 =?utf-8?B?cWd5QWZvT1RBQTNzcGl4bkg5c2lQbFYvdjNvKzVMbjl4OVNnelg4c2dUUG5V?=
 =?utf-8?B?ZXpQQjFxS29Xa01NMmhYUDZnc3JEbWwwNklYMnJaaDVnNHJYeEhLdlpITnow?=
 =?utf-8?B?TkE0UXJyQ3R6dXBPM0hSaFFkaFE5dDBrWEh1REJUYVd3czVvQXFSa3NaRDRG?=
 =?utf-8?Q?kzcgAbZg4wb36SdK2/9/Uw+X8BmLkNgF/4GFCB/qKUhEw?=
X-MS-Exchange-AntiSpam-MessageData-1: 9F/Q0jxLqaQbQQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab98fd99-7119-410b-3aa5-08deee10fba4
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 08:03:04.3838
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3fZd7HQTN4R2CfZnD4BSwOp/LveNn9rT6CqjIF5PRFQ34HYExoUBEe+G5L0765yAjkPvLTXmiwLXRukfhcc0Fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5929

On Tuesday, July 21, 2026 7:10=E2=80=AFPM Svyatoslav Ryhel wrote:
> Set UART-B line to use hsuart since it has GPS device linked to it.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts b/arch/arm=
/boot/dts/nvidia/tegra114-asus-tf701t.dts
> index 32d55c18c7446..0d182fa5c1af2 100644
> --- a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
> +++ b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
> @@ -1283,6 +1283,11 @@ drive-gma {
>  	};
> =20
>  	serial@70006040 {
> +		compatible =3D "nvidia,tegra114-hsuart", "nvidia,tegra30-hsuart";
> +		reset-names =3D "serial";
> +		/delete-property/ reg-shift;
> +		status =3D "okay";
> +
>  		/* GPS */
>  	};
> =20
> --=20
> 2.53.0
>=20
>=20

Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>



