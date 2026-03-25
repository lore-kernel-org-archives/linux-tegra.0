Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010001.outbound.protection.outlook.com [52.101.85.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C98241139;
	Wed, 25 Mar 2026 01:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774401234; cv=fail; b=kOnPfR7EYyUZ1OEKt9ODz5jX3DB/KXFlKm3c9rte5SODrgnZZTl+6cN4F9N4Nbq6fXpWQ0sECRMKsGBG6Hd0SQulzPoX/8ZZZQfXWm8zOkJ/AbY3gbCg12TCrEV2c78/wg2Yhn0jc5JiTKqNv6oW/DtKZURPJ+92OwXj6L9dzM4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774401234; c=relaxed/simple;
	bh=yUZLWlnOSkyDbquy0Cb06zF8m3Z0KyG2iJzKZijtIi4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cGwI4y4/WVMtDb4t1LEaW6VOxLjLXGFywNXTTUy5MpLHiHmjYBZpUH6v4Yr1S7fnHT2G9Grca+eJSuJDB96RwAOoJIelPpDqT5yLzBD5cy5geonLF9K4n8j6kEel3gG82A0ZxHbkHSQya6S2D09Rs06TJXxshupnqKPW198lJKs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=iLqwTI33; arc=fail smtp.client-ip=52.101.85.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="iLqwTI33"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bQCXc/Dss1WfDvMhMRrRyNvNniS09vo6iCG0MZIOdVqZHTOYQsXyDtozD///1J37/hP14I/LQ7WufzAw2YTncSoHijlX9weL9zPcX/csTLjLV0O8UlHhvH9VLk/meBgWW2AbWKRXU6b1WyIpUmM6BuIoOXzRlMUxHWqmo0aqrSlfJSgtyefb+GzkLx1EwUH3OBVaPC+znN5LwrSLyjx58h9eX7b2omlcO99PRn1zFbVW7+k7HpjB+1vaqcjC7t5aj+Uod/t6f3zKO51NthomaCp9VPORkUBhT4j+XZjts6WXbXHVRVYZBFF4nvRx+OgA8KR4E/Qiaum8V+dr2m7AbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OHWGX3NVRmIykr30gc04c73wna6FfWcVebIwHIeqPLk=;
 b=G4+6tPTaZ+kNClvaXKaUfdXJJPErp+u/af1rfknTMliGiiicfjzXhpA6cahexc6LBzv8kK34lbgZ6ab8B4Ek694q084YAplWQe0wSyd0fJhfxaG0MCOlJ4tES3/2T/hXRkzFP8NX2H8/GFKLyp0voPIKq733INvH4LWtJsazIJK2A+5NsN06SOlnVOmv+1m3478liXqzEgz6C6DMf5Nd9gXgdszSfHguqEl/vrfQqI898vtU9yDTv4l5E/Fcnd4wrdDyyR4nEQLAQoFpsKkKet+LlbGdNZUBtNbl5EoYR3Meg3/3v/PBPslRKQeDJ0zRbITbxAdaxQiskwwnspP4sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OHWGX3NVRmIykr30gc04c73wna6FfWcVebIwHIeqPLk=;
 b=iLqwTI33TKHRz+r6/TFqwUfmsxmJP9P8nT0GBeNO1N2ZHtzKuDwkyI514I+l5IFhhPP32KM3afXT5tWT2kQqDglWJ3e6qXQoduBuFvsZSWUn4txd2rv/moKoFVZ8RG+Y/XeoYtL9HPZV55gUGgNAcQHRvRiDyxWhNr71KZbvUZz9oNEj/vy9IfUXmjmAc5goQTu1gIpaVtjc+6cZYBVm0lZA+Hd11nri60tBF4JXj2JUUzqtRyvBdaA9QB0kXjRNeRtv11oE1jOa0ho87IkMbVowQDZnQA3eRelbhUDDbnlpRb4HRp1YLSbjRm4ECUoL3R/DE1XIlFQFHhIFgq4NCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by CH3PR12MB9172.namprd12.prod.outlook.com (2603:10b6:610:198::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 01:13:47 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%4]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 01:13:47 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Thierry Reding <thierry.reding@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jon Hunter <jonathanh@nvidia.com>,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject:
 Re: [PATCH 1/2] dt-bindings: pwm: Document Tegra194 and Tegra264 controllers
Date: Wed, 25 Mar 2026 10:13:44 +0900
Message-ID: <9168919.NyiUUSuA9g@senjougahara>
In-Reply-To: <acJLwYEfJVX4MseT@orome>
References:
 <20260320234056.2579010-1-thierry.reding@kernel.org>
 <511d83fe-eb94-4c25-8ce1-b2476dfbd404@kernel.org> <acJLwYEfJVX4MseT@orome>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCP286CA0356.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::8) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|CH3PR12MB9172:EE_
X-MS-Office365-Filtering-Correlation-Id: 95362daf-7d71-4570-3a19-08de8a0bc458
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|10070799003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	CUJMT24BuQ4iniTjzSuIcn7UqhsN5uqO1MNU9w3evq0wWPB4YDDiBtUVaXGd5K+bj5yhG0I65f44utKoBwOIkyiCd4JCEkcLqxoZDZtEkaFtrk5wy94nYXPjqzC6kFqY9JCeY+V0rg/yZuL+57I5QP/eEM/6iBX4fs/x3wWCuyqAVVhZAft1OP1mmi448Dzym+zTQXoMj6NCYxfz05Rje10YAbcG4YyANNYx9+fgwq2MXvwKEgIj4Sc+odNxHGF8mmg7TbV4X2X3bnaeNYbYz+GbFXzpNRdqolG6aqJFErdzTSMufBOOsWUf21/WVRqHeV3zjFV2mOU93Ex4fXFhwek0XxXPOUKIUYxMQimiWW8iArjQ5ty3tw8oWkEy2+lOnD+5S+kAdJcgAPylre2Ty97lvAvGp5o+f+Z6IHnVzrOqBYKubFeFFVxi739QTDS83ZDNbMvZz1GZjp1CAajez36pkl9Ixl4MXaHIVdYOBhB6yLZ0/CkBb6KKOdcWyM75h7KK0KShiwBVACzxYrBsrNjCVjTwYbtrsE547x7zbnQHHpvx1i/CXbJ4t7beTZfUm766nGfca65+BhbOB4lZboqOBSzNqdmy7xE/ied9UIP2BXBpwMfj538hBuCbwhupah64OXAveMbqqUzlznbMKYwTqIawjQrGrK9u5mPz97mtD4Kt+nRpTciz99iY2lpDESPJo73KqIyOJFrP4uUUuGw5uIen7xh4EdTwQpzr1UrL4J1udsHj/zNMS+r40NRS
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(10070799003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b3RlV0V5eWtGTnlkTUVPQXpNVXM4NG1FY041VmtyN0N1WWdqdHhsWTdnK3da?=
 =?utf-8?B?Y3Zla3ZQNkJyV1RpVk4wVFN5YkdBWSsyYm1zdXJHRENvc2hheEczU2t3K2ZE?=
 =?utf-8?B?YkFURXVuR3plMFAxeWN0ejR0eGY0dmh3eWR4Q0VGeEpFbThFcjYvQUw3OFFY?=
 =?utf-8?B?QjJETlE1bGNUajd3cjVyU3Y2citEM2g2dUN3Wk9CRXFMOWFKMktLbk1FTzFn?=
 =?utf-8?B?UGpGeDVZRmlDVXhqeUFHRmpzQzMwWWhSTzVtWWVFVU92TmF3dWZKUHVYYUxx?=
 =?utf-8?B?akdkbWprdEtERGZFNE9rNFBRb0VCdHk1aElKMTZUY2dHU2tkV2ttaEwxVkph?=
 =?utf-8?B?VExYSUtLVGI0NnpqZS9oUkNtN0NodTEvS1NKOFhQR1RkN29HRFgxZkoyWEZx?=
 =?utf-8?B?M21DVEVidUtOMGJ0c01hMFNRTWNlU3AwOUlLdE5pOWNzRk80cGxHNXJMbnJF?=
 =?utf-8?B?bkFWQ1VRUHp0TEpXeTJ5QjlqRG5EZG1PdlpDV1FCbzdoWFlLdXhOMVdwRFBU?=
 =?utf-8?B?cGMvdHRWV3VJSTVoejBVU2s1Q0FpZzV5MlY5U0FRWXZDRmgzSWsxT09iOEhT?=
 =?utf-8?B?THI0UVBtSlBCQTQ3elVZVS9tWjl1aWQyZEVXdUtNTnUyUlpoQ0ZKOStMOHdS?=
 =?utf-8?B?U0NEbU95NHd4ZjBiNmZ2U2N4STkzVDB1aks5SktoekdJVGFWcSs5ZEt4UWFY?=
 =?utf-8?B?UTZJTlZwc01oOHJvYzFrVlNraFdFNnRlQXJYdmxqci9wd1BaZXVmM1FlcXM4?=
 =?utf-8?B?VUJvY3pRRDhHVUc0bUJzbk5Od201cllNZmMrRmthSDVXSGE4UW9WYUJ2dHZO?=
 =?utf-8?B?Ujdmd3pKejQvQmtvTjVmY1FIWmlESTJmODNrQXZuZnZMWFBrL0hONzdRSlQ5?=
 =?utf-8?B?dHB4eGczY0xPa25PTWhCR2s4cnBwc2RyUHNXeUhXcWRJL0h4bXhLU3BKQTk2?=
 =?utf-8?B?WU1XQys4QTBqVGc5bEgvN05kOUhxREpWREdlbENjNE1Qa1pTcDRvTUoxQTVF?=
 =?utf-8?B?dWdOaVR5LzZsR3gzZFJHWlJHaW96L3RTVjV5YUMvKzNPMksxbjRQTnZ0V1U4?=
 =?utf-8?B?NWdTSEM1TzRkLy9lUGhCWjI0MjRsOURJRzNkNGtLNlI2d211TVZtMmZlYVFW?=
 =?utf-8?B?amgwdGEvak1DbE5keEpIaGQzY0syaTd5UHBqcTZNbk5EOVRhZ2hVZy9VZUMy?=
 =?utf-8?B?RnFIUEFjdzRHSTR2aVFTdWtjaE00M1J6ZzNUbFYwdXh5R3IvNzdjQUViYm9K?=
 =?utf-8?B?ODdoSEFjRHNCZWdjUDVXKzl2MytueDNlelpwRDIzN3gyQ0c1OWl1UVBHQS9s?=
 =?utf-8?B?VWJGTWpheWVHaUVWMDYwVXZyR3M4N3pYclJaeHVTRnErY2dOQmtCR3J4VVhu?=
 =?utf-8?B?TVJ2bTA1N3FrcmR3WlJsUlZ5aEIrenZTWFVnWHBrWUV4bGZaWGRrb3BTWngx?=
 =?utf-8?B?RHdIVHM5ZE5QZXF4QmNSekhDVjdtMHJVU0VXbmV0dmNOeENvV2JVVmt5Z0RV?=
 =?utf-8?B?bTNoMW1jYVVGZEpUOFYwWHFranVmZmNIUUxCN0VLMVRYN0FOQU1MNWtLL2NZ?=
 =?utf-8?B?SUNTaEVLbUhYd1h4N0lDVXJ2QTJxN05iTVZpSXVsaEIzem9wdGlBaC9qMXZh?=
 =?utf-8?B?c21ZMUtqRHZqeFhTL09kUE4zTGE2Y0VPTkgvTDZETmJnUzBZemp4QzBqMWlr?=
 =?utf-8?B?KzZneVRkK0h3VUZwNkExVy83WFNHYTA5YjlSNkl6VHFvOEwzdzByYzRyd2l6?=
 =?utf-8?B?REM3T0NDZnhpZTNFcTF4TWY5clgyaE5CQURWN1VtZ2ZtbXRoeVl1YTU5QXB6?=
 =?utf-8?B?TDNIZUFSNWQwU05aMDd5R1BYY0RMbFB6RVhlNTNnZUxkRmh3L0YyaGprc1d4?=
 =?utf-8?B?VGJTQU8xTmdYbFlUM0h5NmNPSW84V2NNWGFXaXRzTC9RNU1vQW9PamVjVHlq?=
 =?utf-8?B?T3RDNG0yN25LRHZ3WXJyUU9OamJSNENxZmNMcXRTYzNLZkFuNnB3cGpuaEZp?=
 =?utf-8?B?SmVsckVEV2EzTWpxRCtiM2RrWHg0K2VmWXJ5L2JkdHZJd1prenRvNHh1SDVH?=
 =?utf-8?B?ODJkbVZPMGZ2RzZQVjlGejcwQ1V3RDhrZW5mR1N1Uk83Tm1kT2Z0WXRTVW5F?=
 =?utf-8?B?bUNaUEh1TWFjNjhXSFNuYTRpWXdsT05VUUtDZlFqU3d1Y0RaQ2VvVG4ycitp?=
 =?utf-8?B?YUJWL1duSlZFQ3hPOTZkeVEzZWMvaWYwTGdzYkFDdTY0U1hLOUNITTFLd0Q4?=
 =?utf-8?B?cmtMWlRRSmo0R1R4K254YStVR0Yzdy9rbk1qcnBZSzJ5QWZvWStWdGpPbW9s?=
 =?utf-8?B?Yzc1b0NOT25SKzJSY0p3MUVuaktPM1ZoT003dktxMWU5cTh6Z253ZzdIREF4?=
 =?utf-8?Q?XRiknNhA7ZbkuBztkgYiNQOHpopugi90fjOFIYCnfOZOq?=
X-MS-Exchange-AntiSpam-MessageData-1: CZzti4FER1VRxw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95362daf-7d71-4570-3a19-08de8a0bc458
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 01:13:47.7885
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /6uiCziCLMcynBEFTndGhOCvov+ENno2eq3JkUKVSfYRLyN7UdHZShHFbCeU4q6BgaZsIChiAIoC3qPAg5DAag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9172

On Tuesday, March 24, 2026 5:32=E2=80=AFPM Thierry Reding wrote:
> On Tue, Mar 24, 2026 at 08:02:04AM +0100, Krzysztof Kozlowski wrote:
> > On 24/03/2026 05:24, Mikko Perttunen wrote:
> > > On Monday, March 23, 2026 4:23=E2=80=AFPM Krzysztof Kozlowski wrote:
> > >> On 23/03/2026 03:45, Mikko Perttunen wrote:
> > >>> On Saturday, March 21, 2026 7:49=E2=80=AFPM Krzysztof Kozlowski wro=
te:
> > >>>> On Sat, Mar 21, 2026 at 12:40:55AM +0100, Thierry Reding wrote:
> > >>>>> From: Thierry Reding <treding@nvidia.com>
> > >>>>>=20
> > >>>>> The PWM controller found on Tegra264 is largely compatible with t=
he
> > >>>>> one
> > >>>>> on prior generations, but it comes with some extra features, henc=
e a
> > >>>>> new
> > >>>>> compatible string is needed.
> > >>>>>=20
> > >>>>> Signed-off-by: Thierry Reding <treding@nvidia.com>
> > >>>>> ---
> > >>>>>=20
> > >>>>>  Documentation/devicetree/bindings/pwm/nvidia,tegra20-pwm.yaml | =
2
> > >>>>>  ++
> > >>>>>  1 file changed, 2 insertions(+)
> > >>>>=20
> > >>>> Where is the driver patch? Why this is not being part of driver
> > >>>> submission (see also submitting bindings DT in description how
> > >>>> patches
> > >>>> should be sent)?
> > >>>>=20
> > >>>> Best regards,
> > >>>> Krzysztof
> > >>>=20
> > >>> Just posted:
> > >>> https://lore.kernel.org/linux-tegra/20260323-t264-pwm-v1-0-4c4ff743=
050
> > >>> f@n
> > >>> vidia.com/T/#mfb40392e07d7ac9cedbaf853442eed822da7671e
> > >>=20
> > >> so this is completely misplaced. Please read submitting patches in D=
T
> > >> dir and follow standard style of sending patches upstream. Just like
> > >> every other contributor. You don't get any exceptions here.
> > >=20
> > > You asked to see patches, so I thought I'd be helpful and clean up my
> > > work in progress and respond. I'm not looking for any exceptions.
> > > Please do not make such accusations.
> >=20
> > I asked where are the patches. The non-existing cover letter of this
> > patchset explained nothing in this regard. After my question where are
> > the patches, you sent them without explanation why, so don't assume I
> > can read your intentions that you posted them just so I can see the
> > patches and you do not intend to merge them.
>=20
> Alright, alright. I'll take the blame for this. I should've coordinated
> better with Mikko and made my intentions clearer in the cover letter.
> Let's move forward by integrating both series.
>=20
> Mikko, can you please integrate the DT bindings and DT patches into your
> driver series?

Will do.

Mikko

>=20
> Thanks,
> Thierry




