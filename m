Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013003.outbound.protection.outlook.com [40.93.201.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD551E5B64;
	Tue, 24 Mar 2026 04:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774326306; cv=fail; b=m5O0zK2o/63uutwt2bMGy3I3XwoKCMsGQHlRUm03rdTs+tINeAPgJpzxK/YzqY3/xLOv5df9wlpY1syj5hJ4zXTT6egdSUSmeaBS6D1i9HoSXh3TxxvyWGxttvdqc0h5SchNnWa1VRG17bb9r5dC9aZvmaxOR+uEV9kfo7l39Ps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774326306; c=relaxed/simple;
	bh=JCsyfID8wm0Wt0Ev7zgaq5zFXFmJSDDIfQT0yGnr98k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CViOEHCL/vJ4iNtqGfxdWQJnEjg/FEUA2I5t2zCOoPTjEER8qz7QD7rERJR0EVGWOjxn/fmRTFMZho+jxqnxGuz4+63j0mpay2I5qwdG/ktrjXYhB/R2+YVFD9MlnPVlR33cQLaLEMBu6i2U1th6zE5odS1X3A/9n4OkpQbYnw8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Tjks4Wag; arc=fail smtp.client-ip=40.93.201.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Tjks4Wag"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OiJvNbkyfBZTCfTkHLZfvtUWTwKXkSqoNWEI6bfLDmR2eqP1vbdM8hr07ehBoF3vt9VLiMMuZBTv/Qd60BxWIw0eIsJKnK5Ea8dd89FccGKzub9LvsUAtRcBFVicxUGUM1xesQeI/Fus8d7YB2kvZ+U2sPUNFYi09jxTBWJW/T/5xGGeFWQesr2Od45xH8qqJZeRXvEIMs8/Qk7dx3Lxl0kQq/E82gq+EA1GDAgu9wcFb+Yvem3EkqPQLa4BMvsNEosYqo6GE3uq7gAHcPHVQ4ESZPEQUYuyILZeJ/le5UEornliEszf+0p+29XGMhg31rSCwpNEiQjmpq3Op7cWvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dmgx7komrT6t2Xwx0+GIG4bL5Avc5OUjveGC1MmNKhc=;
 b=NvKlSDYxH0qVU1bUWGYr4RMM5zsq5w6m59gXT582lfSvvhsBUTSFR2N+AgvK0XGhrmJOXdiyjnSBMxCCeEri9ISxr502EDO821Z1CD6k46WR63trU/1Ms2bQ6bTNjiFL4RrHUKKDTg5sJi1n+zUoX9GLhVR0HPRQ4iEnIWmaEqRCjcNwFmyy6WnQhGAzdEC0lYDXJlaC3r3HaCBC8xrweEa7FUnn8sDlT/GHO/8nLxfe90c4xXpoqeUHJ1XCwSI4jKWhrDRR0/YhyQLwduiKZ3nap/e6zRr8KnHwBWJ60Jm9pCL+C2rN+WcOwM/mSr8brZYBV7u86wyo2IsSXTOtFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dmgx7komrT6t2Xwx0+GIG4bL5Avc5OUjveGC1MmNKhc=;
 b=Tjks4WagzAw6ahlcLX93a1Naa6iMzx9P5waywNXhAFKnYNuR+cXznJ1EHnbMWSERPiOXysBmbW0rvFr74qmohOZ4Zdr1Aks7XUEdtvs0Kp5fwcUF5lJcX+MYa8rH2geq/0+SY3x/8wtKB7/nEwa9mjY/5EbACzwQ8ppwbVslP/vf67gWkzktNQDy2uFp2dIOVfpJ8VoJuFVCI5x9kemk2E3ooUnecPSQyFNjs3ybH5W0/WSF2HrdSGd4+2JKRYDsRMNd4dnOUpqRx+pTVvG/gDz/d49I9d/qXLHYcs+7J9pypEr0IacH7MlgfH1FyGBnUQ4ytS6KLteEIafIoILKkQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by DS7PR12MB8291.namprd12.prod.outlook.com (2603:10b6:8:e6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 04:25:01 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%4]) with mapi id 15.20.9745.019; Tue, 24 Mar 2026
 04:25:01 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Thierry Reding <thierry.reding@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jon Hunter <jonathanh@nvidia.com>,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject:
 Re: [PATCH 1/2] dt-bindings: pwm: Document Tegra194 and Tegra264 controllers
Date: Tue, 24 Mar 2026 13:24:50 +0900
Message-ID: <5154962.LvFx2qVVIh@senjougahara>
In-Reply-To: <d3ca4cd0-c343-4885-ba97-814aeaf80fac@kernel.org>
References:
 <20260320234056.2579010-1-thierry.reding@kernel.org>
 <8611828.LvFx2qVVIh@senjougahara>
 <d3ca4cd0-c343-4885-ba97-814aeaf80fac@kernel.org>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TP0P295CA0025.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:5::17) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|DS7PR12MB8291:EE_
X-MS-Office365-Filtering-Correlation-Id: 755ae6e9-27ec-497a-a518-08de895d50cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|1800799024|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Svca+jBWDc+hJun7tA0r4Apgju1xFAiP8F7kOp9lIKtY5SWHbqUFNazWo8w268xvXWy9AI6BEdYy+InrfWq9HHLWETEPCRsogqRzrZ8KJoU7X3xelSZFFxgHji9+Ro37vFwPi0qAwClLYUzdFeyA8+rWsJcgYt9CtXvdkpDKDBguAA+C3MeB62sJHMdKBFJ+ja/jiajqnLwGMs1OeKByKduploO4iMl0QQLqbUYet0WVN/jT9Ksh85aDk/fAuzKFh8dBqb5M+iltsd0slIKnq6m/+bGaM/95txGCYlW6xKtblY4B1pclP/QHd416KpRrRGlUAbDwbX53LFkM0bQfflClyl25ev4NRqB2xKl3oNkM0sBVpkW+hhlkiXJaXfbia94PQS53z97I9F894nR16kTjknPihB9Z85ovGyoNWBVe9CxSI/HVWrEa87Y1mdl9oY1r24KoFq3Ac+9PzBH2Gka1tvsX/1MHCehDHWuG0cOT80GEk80wxlV1h4DVVGCN+4l9H+NTGNAQjXrUddJutWuxcMn7eCthTxXPbmtgfez7YIZQu1oXuyvBELW04+wya1NsMEAwASu5lptn9ukGySDZ0eBO98hM+fBXhQZB743MUSv2GVY/wjvx1JolWVJ4+o65aqIgpMBUSCXO7weD7zwaZ78y3gI1eWO249aBic39YotfuIWqX+Gz4knW+ji10mME2N+961t7zLlIwflc4HV9HgKm626W9+ypeVo6qMc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OEd0WGRlNHQvQlFOOGllZ0pkWU5iWnhadTF0bnBjNXpNZnJKZ2RDMnlHQVFI?=
 =?utf-8?B?R2NUdDVFK3NzeEkxam8rTTFhaXNtYXI2cFg1QTRUUTB5ZFY4OE9xMTVsaEtH?=
 =?utf-8?B?M2pPUUxNcVM3WHpXVnJkeGhOYkxOSEpZSVFYNFR0dE5URkF4Y3Axb1JOQ01V?=
 =?utf-8?B?TXNoMkordkRsK1VoK2NkNFlBNmowSkFsUUt5NWFGQ3NTZUgyOWMxMnBkSlpj?=
 =?utf-8?B?LzRhVGxzRHNnY21xMFdTRzJ6U2c0bXpFV3RlbTFBbmErVXUrRGZqRHd0YldY?=
 =?utf-8?B?eDJXYjNET01mTmw2Mmx0R0JmZmhoTWtYSWk4N0JudUlmelduRDYwcmtZTnFx?=
 =?utf-8?B?WGh5WEdjY2V3bHdlM2JjVW1NeUdLZEQ5R2QrVTFVendBdFc2UmZZSzdDTmVO?=
 =?utf-8?B?blZiZ3FuQmhFalBFbWo5endTejY5YjhTcjUxNEx6Z1V4L1hvVzdhTEQzcTZz?=
 =?utf-8?B?V1RtNzdPbjFUMEdyOU91SHZQS0tjWlQrV3BDV2RIZGdZRGxIamZVZEdNMFhr?=
 =?utf-8?B?S3lZZUVvUjgvWmUyYVBxcnAyc0lkdFpRTmZNdUxQOWRKMnNXMWgrVW9ETkRG?=
 =?utf-8?B?ZGZXM2FGZ3lIL2xPMEEzMGkxc2Y2d255Y20xaFZJV3lTM2VPY290dDUwQ2tW?=
 =?utf-8?B?VElXaVZwdW1xMFkzM3pXcE1VWUF5YXlvVTNFbGh5UmhyU0NYTFVxaEs3d3FL?=
 =?utf-8?B?SHlMWVpsRXQybXBQKzY5Y2VaY091STRsSjd2QzVVQkQ3RTEvUkMvbUZBUTBV?=
 =?utf-8?B?QnhUSG83MC9XSGhHS2Z1ZkdDU21Cd0EvVXJJZXBPbWh6YlFLTldyNkwvdytZ?=
 =?utf-8?B?dGVrdUd2eG16MTF1YmdGMUJYdmpIZDM4aHU1SEhPZWU0aTJLVHErSERVbUNJ?=
 =?utf-8?B?N0lPOFFsendPdjhqcTE2ck4rbWMxU1BBUHNWaVZQR1EyR2lqSlpMMk9zYWZZ?=
 =?utf-8?B?ejg0bzUrdFhXZ2RpNHdjSGpwbVl0OHByc3kyM29RRUJkaXJxOFI5MnFnbXJW?=
 =?utf-8?B?SHgrOStwbW5aRi9BdWQ4alRLcVdNSHREUm1BVUliZytjQkd2MnIzRHBTMGow?=
 =?utf-8?B?RWVqODVmMGJldnFxc09POU95TU1DZlNsQ1psZmxORkZwKzhMVDNMaXMwa2V6?=
 =?utf-8?B?UWhKVjFNM1BqQUlZWStXNnVzRFNwT2VoS2w0bnJKUW4xd0Q3a1BLNDd6ekxH?=
 =?utf-8?B?Z2J4Q2RFV281TGxrK0V2RWplNHFNVGZBMkIzTlpyOXBXK1hybTZEYVdGOHlu?=
 =?utf-8?B?SHFIeU5QTUpWYmpxa3Q3cktPalhRbkhUR0ZDZ21Cb0dHVnJEWmFvZzkwdlRk?=
 =?utf-8?B?MEs3RXI1ME9VeVRrR2JONmtBNmh0Q0hvblljdkIrM1VYbzBkRENXdTBwZ3hx?=
 =?utf-8?B?amNNWndDMHBVbzdBbHNBSHZRRHdETHFGMER2aEZOVmtuNlRoMklwZ3RwZ0pC?=
 =?utf-8?B?b3MyNHVkZFg5RE1zVVQ5eTRSWnFyZm5KMzZrU1FvQlk0ZWZpQkNnY1Q1K1l3?=
 =?utf-8?B?cm5jU3VJNWMvcWY0TGdzbXVYSXVEdjhDaGlLYXo1ZE9KaTFkRVNpNHhCYWxp?=
 =?utf-8?B?Z2JmZGhKY2dPNE96RnNZTmpXME1FNjZXeFpsRFBYLzIxMGhVeHdwSE5vQ2pS?=
 =?utf-8?B?Q0tOeUh2QzRlck9KTVA2R2czNGpoRGpQSG5wNDZtNjdrZVNLOVFucVZ3Y2xW?=
 =?utf-8?B?ODlyL2d6ckMxdnkxVlVvUndiTFZzT25nMGNFakxLeW5lQlhhSXNMcDBUNTNY?=
 =?utf-8?B?akZ1TEt6Sk51Vi9JOEltNndGS3V1UDFLdUxkRXh3N1EwYTdRRHFPbkpYQzFV?=
 =?utf-8?B?U3RTQjF2ZnJSdDZkWmV0S2NoUVEwc3pvZkdhWklOSEhhRUVzTy9aZ24zUTRr?=
 =?utf-8?B?Yy82MTNZRmdLamZVRWFJOGRqRW9tQm9vTXFHNzd4ck5JT3hYMnRhWnhFWW5G?=
 =?utf-8?B?RFZVd3NFY0JvUSt3STA0ZFdtdkZsS1J5RllGRE1OSkZRT1ZKaTVWSno4NXN0?=
 =?utf-8?B?ZnBaZCtzYXgrZnFpWUx2UjF4NnU0a0VHTUhseVMyUDhCS2NxaTI1MmxxTURR?=
 =?utf-8?B?d1g0SjFHdnFGVGxhQjZJcEltVEdLeU9NMk9BZmNrUThYK2RObElHMkRzamFS?=
 =?utf-8?B?QWl2TXVCYk5KOHkwUldKOVFmcm1TZVVmYlpZa2hvMzR5TDNZVkhVUCt6M0pr?=
 =?utf-8?B?NnBhYXF2c1FCMW9zeEE5T3hkazVqQjgwMFFxbEszWDNrSWg0SjgrbjB1dndx?=
 =?utf-8?B?dVRVaVBBd3dYYkRUSHBnc0dpcU9nYk1QNHB4bS9GdElLTUZWK0ovV1l6eVNI?=
 =?utf-8?B?aGdKdWJwQnhZQ0swNjlEOFNmZzAveE4xRXB3anB4Y0pYYWhJT1Voem93Y0w5?=
 =?utf-8?Q?KjUzEMjWe4zubI/znb41jarSYdYqxeTPPtHTr/17H5KqT?=
X-MS-Exchange-AntiSpam-MessageData-1: vBRELrFtMhKmDg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 755ae6e9-27ec-497a-a518-08de895d50cf
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 04:25:01.5393
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vWT7csX0Ulso+j87C5ZKD9dIdvrIV5k7v3kKVbriXGmxMzkiDcM8qaNqQWLvn/G27aQLtT9LGOCVbRe5tiA3LQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8291

On Monday, March 23, 2026 4:23=E2=80=AFPM Krzysztof Kozlowski wrote:
> On 23/03/2026 03:45, Mikko Perttunen wrote:
> > On Saturday, March 21, 2026 7:49=E2=80=AFPM Krzysztof Kozlowski wrote:
> >> On Sat, Mar 21, 2026 at 12:40:55AM +0100, Thierry Reding wrote:
> >>> From: Thierry Reding <treding@nvidia.com>
> >>>=20
> >>> The PWM controller found on Tegra264 is largely compatible with the o=
ne
> >>> on prior generations, but it comes with some extra features, hence a =
new
> >>> compatible string is needed.
> >>>=20
> >>> Signed-off-by: Thierry Reding <treding@nvidia.com>
> >>> ---
> >>>=20
> >>>  Documentation/devicetree/bindings/pwm/nvidia,tegra20-pwm.yaml | 2 ++
> >>>  1 file changed, 2 insertions(+)
> >>=20
> >> Where is the driver patch? Why this is not being part of driver
> >> submission (see also submitting bindings DT in description how patches
> >> should be sent)?
> >>=20
> >> Best regards,
> >> Krzysztof
> >=20
> > Just posted:
> > https://lore.kernel.org/linux-tegra/20260323-t264-pwm-v1-0-4c4ff743050f=
@n
> > vidia.com/T/#mfb40392e07d7ac9cedbaf853442eed822da7671e
> so this is completely misplaced. Please read submitting patches in DT
> dir and follow standard style of sending patches upstream. Just like
> every other contributor. You don't get any exceptions here.
>=20

You asked to see patches, so I thought I'd be helpful and clean up my work =
in=20
progress and respond. I'm not looking for any exceptions. Please do not mak=
e=20
such accusations.

> Best regards,
> Krzysztof




