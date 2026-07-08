Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013014.outbound.protection.outlook.com [40.93.196.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941F13B2FCE;
	Wed,  8 Jul 2026 01:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783475938; cv=fail; b=Sd7Nz2WPHDxMKO6FrGX7KlEZEEf6xT0NeES21XTMP2i0O1R30Cf1vXFrS1jCIQ1+ORYrxqtCPtOft5ZfcJJ1q2e6rc5YSPkhfS49l6kP5DPhRRLs/YxUPye97t7tB+OVZVBlLneIF4qzztVLLoMO0isbIo23sulk59CTm3C/mLs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783475938; c=relaxed/simple;
	bh=7vhLItdQ7M3H0qNzyoPeEsK6H5XOn9F4ObT4EswdMYI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GM42NhZqlrihl7yA0wnoEhrCW+Vh2YDAgw0HAtkBeG+ISRBMEiyfaaPBKQcQpXxrRdJhZULnbZKskXv+z90oYsbZK2WSGF0lvSUdg8k+dQiWoTgix8kx70Yf9Ye8RrZlcpkXS+iBED7hjM6GXaOoL9R98xDtuC5ZE4Q28LfB56c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=IbSbeQ0o; arc=fail smtp.client-ip=40.93.196.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="IbSbeQ0o"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qjp8XzXQjuZwUxe8DjznYkud9spV56yuhxpSNcjqFrelOcmQm7XFOWohbxWVRlpV/7xdhETXHckCtr9GPWq0y4+7H/aDfLe4vIZQmWa4Q/P3RUsYSHBjJ+LDpTRdWdGgnWeHeJsdSfIuIbq+LNuvIZi3JbPmLlFIFo6M+x9JPPQa+lGcXpTcoS7XzE+xIjp1OehpS4HfjBi5j9D6ZJUvI1njPYcD/3AEHYBGhrtmVCPn43h7ZKU4GFdNr3kFD06FAFyoCiwH6a8212ja0bbY8wc93PWbzIIJ1tAPsR+VIT6Iy+AEmPksQYa+pjHCjvy0wTzPLcMLHHslOBklsWinpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CQlm4vmU3COFFMkrmwifDfThCMQOsM11VduN56ipgVw=;
 b=MwCW5zVNd/1omI4wkAjrqmAAJ/yjVHdmm+00ySfqbZYp/1XnRae4LTAFiOJ0kngw3/ywecIz12cgRpIzcnKfGIl582ydISjQVFiIUstWMFqvwX9Ca6cOPksduWQXMHf1bF+0Fn5K7WJGzef5M/vPKsaPoRHTQtgrpH7vyWFyfv5Fzgu0uVay5FTiDvoY48e91Yc2JSYsa45Ys23aYNd0N+nUucfOTBwn8+G/hgtmaIDqe+moen3YNwtXGaf/XFhddgjkuPPzHQgHE9P8zR2WiVTOfZ1MADfvoqIzEd4lRk1xTKeCagbCe2NHcwjuBuJd8OEeyuJ2oPrFyop9clPi3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CQlm4vmU3COFFMkrmwifDfThCMQOsM11VduN56ipgVw=;
 b=IbSbeQ0omNzQV9dTwFblmPnKDoS65S7UQ9qnHEA53u9reysWkWR6E6p3Zx+DIaZBSA/4KCJ9H4HlFoPPGsLNylHDQi0mZkZtaX3JcixVBmmxNmYNHcUeeTsUwD3AuLSlKa2/BMBi7PB5yrvaooDr2MvoZIukQ1ZUEEQeb1C3Rg6n2yLCXopa9MiKtOFttoNyUuvhnDTec9lp6h4wOOdMpI0gO2NXOuKPAHuSteIZTrLC7Cp4wDr48J6F5V5IZSu28j0PRFm9kO6NL0+IHCM7VHrCu389UD0qUiXNh7ilGN+SfEL3JEnJoszpZVReQhKy00xEWd03DQmbyVp38HGDaw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by CH0PR12MB8488.namprd12.prod.outlook.com (2603:10b6:610:18d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Wed, 8 Jul
 2026 01:58:48 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%6]) with mapi id 15.21.0181.008; Wed, 8 Jul 2026
 01:58:48 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: linux-tegra@vger.kernel.org, Jiqi Li <lijq9@lenovo.com>
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, krzk@kernel.org, jonathanh@nvidia.com,
 thierry.reding@gmail.com, mpearson-lenovo@squebb.ca,
 Jiqi Li <lijq9@lenovo.com>
Subject: Re: [PATCH v3 0/2] Add Lenovo ThinkEdge SE70 carrier board support
Date: Wed, 08 Jul 2026 10:58:42 +0900
Message-ID: <TwdYRdQxROulqyHmM20o9w@nvidia.com>
In-Reply-To: <20260701090639.669524-1-lijq9@lenovo.com>
References: <20260701090639.669524-1-lijq9@lenovo.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCP286CA0071.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::15) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|CH0PR12MB8488:EE_
X-MS-Office365-Filtering-Correlation-Id: a7efc530-494a-48c7-e22b-08dedc947379
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|23010399003|376014|22082099003|18002099003|6133799003|5023799004|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	pNbWU+dEaAW0nUJr0WyRC9oWWt+lIa1280Tcb42Wm8SDrIHXIcGGHmGWMwPj/aO9Vn4GSc/DC57P6ySt8YRMj/gxV4wr/qpIyekzCZ7AI1sPhOBKstlzqdf88Yrlxg9FTp31I+hNjIFBgD4Jis44PjV3dWdpRB2NGRGjz73DFP8XMaB0YgXWbMB79oD7TIHJvQrB/ONRcKzE5+5LRI80WfdQk6j5IeKs8S6veD6ccGw9Tw3XhLINnuFih8n9b48vNShag1g24oaqIGUnr0atBNJmwSUN5f5xFsFfiIyJw6ruQORYJtCC63tTI5pCqMT5XpO57ECk1xAg2Olt+GduOS40L7lEyYg51Azu2GpyrTgYuYGoabw43g5i/FohaQiUQ/P0ETBeHukOfVNGDqIUPFbLJgz+DCAmtdO7qUjJeXSvNaYrf5zpJILqrnz2QC1GhpgYgyb3PLHoXs39VCdfxf7EkVIABGY8RuaYsfSChSBBKm4SArAzpvh7nSG/SrcNhqEsGc+K14ggBlJzN7BMxaNdBe29pgWSBJJsE8DMJK5KiZpvIESY8kab6udHk3gE1rE/f6xGEoX7/N1GSjL0rSe+lqAa9ungZr+9vVx9Jr81ziuzCML+FwYw74V+Ui9787twqlkv8goMB0LCVBym7EV706nlEOeNkXNliLwqmg4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(6133799003)(5023799004)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YWxlZlV2RGd6NU8xMWdMak1jUHphK2h1anEyOWtXZS9MVTlWOHc0bS9yamZS?=
 =?utf-8?B?cUJ6L0VhWFErc0g2ZlhQV2dJZEdGbkNibmptSWYxMXA5R2JSaUpvelFCYkNS?=
 =?utf-8?B?OTc4NjM5L1hQOFZOK25zeVVVbzBKYUNwbDlQSGlYSnZ6ck1pT20yV2VpSTNt?=
 =?utf-8?B?b0VDZ3gyUk53Q2hYMGRWR2hoWFN4L3RrWkZwZGIxZUJjUFNtcHBZaWZVSXpK?=
 =?utf-8?B?TG5JZDBPeDlRT2paNjF3VW9lN29zZ2RSay9jb2FDVkFWOWhGVEdCVmFtdjMy?=
 =?utf-8?B?ck9MaVpYY3BWQTNLQ1hmdURJQ09BckowL2sxRmJackMvQVc3K3VmQVkrYzBR?=
 =?utf-8?B?aWsxWXBGcEw1SCsyN1VheWIvczFRL3RUWVJpYUZZV01hTC9mV014M0Y1WWdu?=
 =?utf-8?B?NUVJOTAyYnZpTTdoLy8xdUpPUUNERlNCK2FVM1dDS0N5WmxWUko5RnVVNTgz?=
 =?utf-8?B?TVdpcXZPRXJwaVF1aXBNNjAyNlVxa2lJMkxxakJ5bHQ5ai9kSk9oa2h5UHBo?=
 =?utf-8?B?Uk9yY2MyZHB3cnMwdHdvM1NsNVJPZEdwMksvQ0RuYUpCK0JwbkZTbjBhdjhU?=
 =?utf-8?B?aHh5UWJCQkxKdHcwdng4NEpURXY1b3Vyd0FKVHRrUktSRUh4V2tPRmhvcDcw?=
 =?utf-8?B?VTJQazJoWGFna0FhOTlSbzQzYnhSc1VzTUEwUUl5U2lmVGJGemJmZjlObFJx?=
 =?utf-8?B?dkVxUEpQcUJyUzVoTEExUnV5bUlHYXowMDVDaEVMUWhmM2dXYndJNzZWakFm?=
 =?utf-8?B?WWc5WWRUSjB5RzFCaTBBaDhkU01vMEF3YWMrVzEwc2syblB1dkJRN1R3UGdr?=
 =?utf-8?B?ZngzVlAzQTYxcFBmZmFZRVZtMWZXcldSMzZGSm9rZzJZZ2dDcDVuMzJMNHZn?=
 =?utf-8?B?TDVjM1ZUVzN0MFJiejlFUm5mM3U1YlpoNmYvUWVHandsaFllL0FyZDlTeWsw?=
 =?utf-8?B?R3YwSG9KdHRYaHZMU0JkcXJHSWY4ZGZHTUg4ajdkcEoxdC9VckJoWVhmdlQy?=
 =?utf-8?B?anc5R250QWgrSTZ5SHhORXZjMHVXa0NRMWVhYUNHWmZWWGtDUk84Y3l5aW53?=
 =?utf-8?B?V3A4S0wwdjJRYVlFcFRLL0oxd2J3V3psNE1CZHFsTUFxTk9HSXU1UjJmOTNS?=
 =?utf-8?B?VFZPaTdaRDk5MEdqM01VS04rcThscDRoYmg2MlpRVnMvckxEWTBvcFQ5RTl1?=
 =?utf-8?B?YzFUKzVxcXVOanNDckNKRzljV3VRaE1sTUhqNEZVbW04UWM2amtnSVBtNFRF?=
 =?utf-8?B?MTFlWWpQNDJjeGlicDJhaVNsOCt0NWdZRkNWZlhidm52K245Rk44RGg0SzFo?=
 =?utf-8?B?S1loSldJblZPUk01SGlhT29sZ2VpcEVSeXVpb0dwQzZBYW1kWmdVL0p1UGtq?=
 =?utf-8?B?eGlwTlN1RlIvMHk4Qnd0UTJDQ1JORHFyTzZIVUJBbktUUGdUN1E5T1Jvanow?=
 =?utf-8?B?MDFTSDhxTTAzZ2tFVkZkcmg2M2Zxc1ZxMUFvTGFwMzQ5eTZEN2Z3bXhRazRF?=
 =?utf-8?B?MEorTXRUYTR5eEp2b1YvQXQ4NzdFRjFKL3RxT0NwNEc1QkxKNExLTEV3LzJ1?=
 =?utf-8?B?M1d0WXJISDA2Znlsa2JpOGRWczIvVVhTL1R5bHFVMWpOMVI5Y0lvZEMvdzRx?=
 =?utf-8?B?SG5iQXdRTFdQbmpLcldLbXN2SmdaeU5LNXpva2p6aUFEU2tFTDR0VVRwOFBv?=
 =?utf-8?B?TzhCL3hqaGdNM2cvQWJaTDhocDdiOFg5TnZodzM0ZURnc0kxVVVnbDI2SFVk?=
 =?utf-8?B?SS9oOWxJOFhOZlkwcCtualBwY2d1WFpqTTRIZEkxMHZVNE9nQnFBNGNHcVlw?=
 =?utf-8?B?ZjNmQnFqYWpaN05MVmRzRXVreE00Z0d3b2Ixa0RBL3hRKzh5Nm84eDkzZWZN?=
 =?utf-8?B?NnJhQm9oQ0RoT0F3VTRhWmR1dlBDS3FUOTFkYlNMVXNnSjk2dGdYRVNPRE12?=
 =?utf-8?B?V1hyaFR3eUNLM1c5UDh4UUFhL0NaL1IzcXZ2d3M5Z2g2QU81aHJoYUZKZk90?=
 =?utf-8?B?SXluRUxzNXh1WDJsNHhnQWsreFgzelZEZGRycURSK2xsUFIzUVE3V245eUJW?=
 =?utf-8?B?d1VVdUxSb29WVkZyMUkzKzRDejgweDF1b2lNNXNNbzA5aWQvcnFhdzVyeEQr?=
 =?utf-8?B?YlQwL3R2NG1NLzJxWEd3Q09icGUwdmw1SFBZVXFPWWZaZkNSOHB6aVdWZjY5?=
 =?utf-8?B?ZEJkcmpvdXJzbUtlaWh5L3VpUTd6K3FQTlhVS01YalBFL2hsc3BocXNpanRQ?=
 =?utf-8?B?Q0s0OG1kRnVLK3pnVXA3cUpGWG1URDNhZ0QweFY4NTFSekYzZTdtSU9GTVZ3?=
 =?utf-8?B?K1J0c0MwM2JJeWhzWkMrMGpaU3A3T1RleXo1Z3hIRjBRaUVvV05XMUtqbzdP?=
 =?utf-8?Q?8fsbijdyRrTVco7dmcBWS08dmd+sN/rwX7mzBLoKQfZz2?=
X-MS-Exchange-AntiSpam-MessageData-1: 95P1FPWJWPzLtQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7efc530-494a-48c7-e22b-08dedc947379
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 01:58:48.5326
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sxvb+6dxuVbpIc5kmyZBN5e7Amf7vXNGdx1GlUanZuHX9gRp5udVGdPrzTvJX2OH4SPhlsWF6i344yPg2IWi3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8488

On Wednesday, July 1, 2026 6:06=E2=80=AFPM Jiqi Li wrote:
> This patch set introduces device tree binding and standalone DTS file
> for Lenovo ThinkEdge SE70, a fanless industrial edge gateway powered by
> the NVIDIA Jetson Xavier NX module (P3668-0001) on a custom carrier board=
.
>=20
> Patch 1 updates tegra.yaml bindings to add the three-stage compatible
> string matching board + SOM + SoC, following the existing Tegra
> carrier board convention.
>=20
> Patch 2 adds the complete carrier board device tree, including:
> - 40-pin expansion header pinmux configuration
> - External Micro SD card slot with dedicated 3.3V regulator
> - I2C bus for 40-pin header
>=20
> All static device tree checks pass: dtbs compile and dt_binding_check
> complete without errors.
>=20
> Jiqi Li (2):
>   dt-bindings: arm: tegra: Add lenovo,thinkedge-se70 compatible string
>   arm64: tegra: Add Lenovo ThinkEdge SE70 device tree
>=20
>  .../devicetree/bindings/arm/tegra.yaml        |   5 +
>  arch/arm64/boot/dts/nvidia/Makefile           |   1 +
>  .../nvidia/tegra194-lenovo-thinkedge-se70.dts | 113 ++++++++++++++++++
>  3 files changed, 119 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-=
se70.dts
>=20
> --=20
> 2.43.0
>=20
>=20

Your patch email formatting is off. The individual patch subjects should
include the series version. That's what you should get out of the box
with git send-email.

Also, please don't restart series numbering. The above two make it hard
to track the series.

My strong recommendation is to use the 'b4' tool to manage and submit
your patches. It will by default result in emails that are easier for
maintainers to work with.

Thank you
Mikko



