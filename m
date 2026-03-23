Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013036.outbound.protection.outlook.com [40.93.201.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C90230BD9;
	Mon, 23 Mar 2026 02:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774233910; cv=fail; b=rGXi6fp/S5Jm7+Jwhll2tEfAzhGW3vI/28Pbimh0QAjciEbdVGB0kudQgZ179h62tB6GyqEEo1ei36VTJJvEASbZdHAXr4t7QItdV0oRMO2MKmu0T2+Lm4FxPKdYLcISAPSx5xYAdSA4jTvLTn/1r7WT6MepEeU5NQzci/wvoPw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774233910; c=relaxed/simple;
	bh=s5Xti+AcU2i/Ki3bxztkjWl176qhADEXdzk2DRPS52U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tEsPpQJlwU41Vf9hN2M33gmLRcNts9hGzmEpW6VDBgqGIC2yhmJoIjB2sV5Fo4Yx58kYzjv/Q8GSNWzKlVd9CqgP9TFTPYfW+qJb+k4nE5smo375WwUXXqAS3WT4siCCwSyhW2uGc2FeoH9zJOM180JlaBBC/+7nAE28t7Z9z6M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=DdZuFNpQ; arc=fail smtp.client-ip=40.93.201.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="DdZuFNpQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qVoe9IvEe+xwVBa58OMHtdUoIUMAh0y3C5w86xQE7REcrxrdq8KDp5yuvZeYGqjMsJ5Ft4wAwZJNUEpPN2dFO4CsjKh89P/uNzlTR4H7nMBFDsiQ7ucWHQjbB1ubTZB/gVN/cfQ9cuo008rzNQpDdoELZif0GZlOPX5XJIsOWCPiCs7iUU0UX0nuT4/Qa2wbpeX7YBA7nWZ64CEuc8FbkQcxiL73okAuYq4PlXPikV8mZg3Tx79p3mSYG8lA0l0gRtZoO6NhkywlGDhpzkkyiYunUcozostgROEBmvitWOj2DzQYxumJcN984Xv2wucYEjlymKpVcWr9cM60Hj7Obw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5xHAIweyA8h0lOsROAZ4E6GK3q830jBUYaDNRjvjl8g=;
 b=mOCH18eAB9bbvhRg9OKRl+llzHRwkD2ntZNbPoVdeM7ksRHQm5o5SqDq6shpA19IaaNMxOErK2B0VskdGfrqzADsIsMJ2iCqPkEA4ld1i6qlzMdniDJYV3sY7lGo3l8KobSEhHpGOHJwrBlYESDSXaCWGdgQfAQ1+mwp/pgMjJN/q9CAhFS0t4Al8RaUmAWimIBWizqYR4/knV2Q788EAvagdMXl54sof7H3kvUjWYrzkyKp+FHGdYqroRwQrCS8WCHaCFP5JL2lF4mR2MwpjoNpuurujLb4gdS8QbAMMyOXEz5rcIEDXiNEuoBEf2YyCLXGDo6iThRcrlVqE00FQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5xHAIweyA8h0lOsROAZ4E6GK3q830jBUYaDNRjvjl8g=;
 b=DdZuFNpQk0pP3pOlHhVMy17g1i/lxRjsDScVIBcOm7pEl0st7s+QOJ0u8fUOeafRfV1TmurWw9aF3GG1skBztKfrFX4kkBpczKS6WI9mJsQk7ehwNg675b9mx+ABRehbGA/H4/dANCYE70uUN6bgtd6QqGTjmFx+aPsUUfrN16gwtptzaNWAfiS3b9H0lUsHzQ2isAwoxfcAWVoy4j5pkPS3KIA0jGxgJSPfuKOKi4a/ju0tJBbLW3zzp8q8Pz9jhcFciJouVrRnV2/1ryd5ebu4yTKC+c77PiOUUQHQB0X+KI0oLCv6ZchxQ0YJ4vq7WO04pmQpZhJCXqLpdW6S/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by PH7PR12MB6717.namprd12.prod.outlook.com (2603:10b6:510:1b0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.19; Mon, 23 Mar
 2026 02:45:06 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%4]) with mapi id 15.20.9745.012; Mon, 23 Mar 2026
 02:45:05 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Thierry Reding <thierry.reding@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jon Hunter <jonathanh@nvidia.com>,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject:
 Re: [PATCH 1/2] dt-bindings: pwm: Document Tegra194 and Tegra264 controllers
Date: Mon, 23 Mar 2026 11:45:02 +0900
Message-ID: <8611828.LvFx2qVVIh@senjougahara>
In-Reply-To: <20260321-lurking-courageous-centipede-5e82cb@quoll>
References:
 <20260320234056.2579010-1-thierry.reding@kernel.org>
 <20260321-lurking-courageous-centipede-5e82cb@quoll>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCP286CA0277.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::7) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|PH7PR12MB6717:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f111000-454e-4759-3483-08de888630af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|376014|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	3iTrqX9YUvWgNniidYNVFYZXqZU3hE3mXhVUHkQfHsnzI2oWbH9YbVYEnrFizZGjRmFxW/gad5x23H+AOj3J2JSk8VsAT/i/Hxi3x1W2r3QdJ17jmNNwYGl2cCkhL1/K1en5KV/WakvcyvZ1NvS78kopUMBgiebNY24Yd8iNomkWF1RqnMDJXK1RQFsNroerFFW+LB5EWikUIRR0tAlTPsDnVLK9YyGkFD2Ge8eLhFnvMLezVfkI+YbA3ZU4Sjs1rO/lzbLSB7J1wSUGupkqmWCDloi5X88vNezB9qwSIcPvmWT9C/TEDndzyOfqvyI4NpVt715P+09rwlfwVJcjaGFVKrl5rcEq1GiVT0Kk6poGXwxAEoWWhPXVAH9E8CkTmEKx1mpLhUOPuNoUpmHeI5OJymqxc0MEca7duYwV3+3wBHi4EcdxIl5HeA1/4MenFHGPpPaJthvH+6zrdH10V1pBetXVUnKNTr5UNIrHIKoHNqJz9Fqo3NVdTr1VekFwmufoGVQ8cJa7yDOVQqF3hmuEZ95MgLGE+tU4jHzM++J9PZHWQcin8TI5xjaOtuA2NLA/EE1SZcOJlx+/3ZHminyAU/kuPsf+H7iP9urEri+7I/1vpdB2wNCcWL8GFu2DClqEn3jG/xz/c09EVAoZhRL2gjxoVgBz3WkqvmpSwps7jwDINMT9cb2RTKei5Zbb2Zb5ELQD9lYi4N4pMWvdMySqd0BEuCHv7ep8ArQyFZ8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TzdoV0FESmcyMDIvdXJORnVxaTRjaDZTandRemtTUkRVRjlJbURSVTBPdXNr?=
 =?utf-8?B?eGdwQ2tqMzMrZ0tMNG54eXVVRUVNYWhZcVNBeFpuZFR4K2pjS1VxYWFLdUhh?=
 =?utf-8?B?NUwvTURCMCtLUEIzVnNsa1ZZSWUrRDJEUTgrUm9kYTN1WUI2WGlGditVVjRw?=
 =?utf-8?B?MmVOQUc4WUJCb2s5bXExbk5KaVBJMm4yRlNKQlJDNTYva0JCa25JN2s0aTR1?=
 =?utf-8?B?WGVtaXM0NzJ3N2RueFpzZVZTQlZaUVlLOWNVNTVETEp6czkzYSswajl6aEhX?=
 =?utf-8?B?Y0N5dTFIbGFOcWFuQ2RqSExpdHhrbmdUWFJHUzNVdkVIU0sraXVoc0lIQWE0?=
 =?utf-8?B?SDFOMXNTSHdtQzdwbWtFQUgzQ09sUmxaL0tQdVM3UG9INmhONWhNUFpLM0Yr?=
 =?utf-8?B?dVRPZll2SDVXSnQxS09PcHJYZkVXSVlLNldvWFFGSjB5Mi9IWEtHcjgydGZm?=
 =?utf-8?B?NHp2aEUxSytWZEpxZEZFS3V5cWViMDAxdUJuOW1SanhjYzNVaXJyeHN1UVND?=
 =?utf-8?B?QThaWkZrdXhXUGFoYytMajBldEJURWdRN0tRTDRSU2xtbllHNFlkS2gyUTBH?=
 =?utf-8?B?dUNEdnlmQzFVVFl4MFBOZXRlUUJLc1F4WkhwYWloc2YzTGdFUDU1RDB5N2F2?=
 =?utf-8?B?MWZkQ28wUmNpN2lVME96WXU4TjJMdytPZ2NIcnhsR21oM2FTNWlxbnJYV1pL?=
 =?utf-8?B?YkVkNisrSHdHV2phODJJQ1VsZ2Q3NmtxY0p1NjZZWm1RS1dnM21wRHcvSmYr?=
 =?utf-8?B?SEtzTUdBUFR0c015QkVjM2cvTlp0NFBSNGl1TDJmaUVOZHczdUlOU3lYa2M3?=
 =?utf-8?B?NGMvY2JSK3BTaDgzSnRnMVc2cWgrb3hBOGRtblppTEZVVjE2a1lhYk5jeDRy?=
 =?utf-8?B?elErOEhmRWI2M3lNLzJWQmtDMWJFMnMrUExHOXFvODZhL1V0MHNXU29ISkVz?=
 =?utf-8?B?aFFVQWF6QjIwOG5MY1FxQW94YmViaWZTL0MrSnU5OVhGRGxTa0tRMmVTK1NT?=
 =?utf-8?B?cVZnQy9EWm1FemdnemFtZ05DaWpUMWN4bitDQ3lIU2dYa3E2MUkwS3p6SEZQ?=
 =?utf-8?B?VkhKYlNaQmZmeFB3eUZRdERWQ2NaTWRTVEdveDdpOFJhSGg2TkxBVkRzQWor?=
 =?utf-8?B?UTNvc0RhakV3UlhXcFBiT21BUnlxSjFza29DQXR2L1QyLzZPdFYrOE10KzI5?=
 =?utf-8?B?c3ZwQUtxTGdjaDllenllS0NScXJwcjdwYWdEcEI1OW00VUg4elVvNytiMERF?=
 =?utf-8?B?RnNYYlJSamhNS2xSUGR4YkJ6UjIzWTFaYzlvWlNCb09VTmFkbCszRWJydXgz?=
 =?utf-8?B?V1dNUEVoVDE5d0ZMZlR0b0ZyaDhZN29obllQZmlSMlBJQU1heFJBT3ZPL29P?=
 =?utf-8?B?czRaVENxUlo1ZG1JbW41cDJhTnhLZCt2SXJDd3RsRUVyRXZqazR4N0ZRaHNx?=
 =?utf-8?B?WUZHVDd2aDE0Vi9OWmV1STdHdFFzNGUyUmdLbVd2Rmo3YjIvaXJyTFhqampX?=
 =?utf-8?B?YlpLTXkxTUhLU2dXTGdoNEZsWDZDV2JqK2YyczI3T2xNNmdFZWoybENlaEp4?=
 =?utf-8?B?enM1STFWYkVYTHVySjBFVVQ1NEFkczJyUEZ1L2JKNmJrcWNGWHcySmNYZzZL?=
 =?utf-8?B?b1EzN1B1V0RCVEJkcXZkMU4zbDM0WHNsNTFZOTJ1MmFMd2lDUlJtS1dueFpH?=
 =?utf-8?B?Z0RiazBQVzlLcnkrMGpVRHd1ZXZXZlZONGgzd1RDanFabTRKY016NDd1YlJo?=
 =?utf-8?B?WWg2WURrTGRGY1F1cUFYYVJta2txdXBpVGxzWUV3VGEzWHBuSURkanhXNTNy?=
 =?utf-8?B?MVBJOGNLVENETlIrVzJOZzM1VnNOSEg2U0d0RVM3WFVLUzA1ek5TWDduQnls?=
 =?utf-8?B?ZVEvNmJLUkF0MC9KeUNBM1lKT3I5UERmY28xeThkZDFBWHMrTVlrZUNXUGFh?=
 =?utf-8?B?dndPaHBCc2xPa0lVWTBIMnRVZXhpY2ZBbU5qY2xwWXFIanlIWGdZVmFNYytt?=
 =?utf-8?B?SUYxY1BVZWtiZ1Q1Sk1DYkpIbytmVjVIQy9lNmlRQWhCUVJLSjRFd01rbStJ?=
 =?utf-8?B?WURxQkxpWXc5Wm5NZFVUZ2F0dDRSRzdMdWtDVzU0OG13RnBlZnFId0RLOHNI?=
 =?utf-8?B?RG5kWmJjeWdVZlB1WEtzeFRoblR4cmh5ZzIvN3h4OGJ1OWNmNkNhZ1RDT0J2?=
 =?utf-8?B?bk9ocTNqNFZ1MTBMNkdzekEzTERWalNEemNneVpSUm9qQXpPcGRBTjMwcVlX?=
 =?utf-8?B?bUN2MU44cHpVNHRQTFIvTjRTTEFXNnh0ZERQWUl6ekNyMmMvcnlqU2JVanp0?=
 =?utf-8?B?SmZicW5JWjdxayt0UVU4anFraEVjb1RXVStFZE1PZVRhT0V0S0lDcVpweFhq?=
 =?utf-8?Q?ImLZYy3UlQ91zfRMd4K/AqR9Mt5G0PwMQNaMeBMS6n3Yj?=
X-MS-Exchange-AntiSpam-MessageData-1: uS+uG8CUi9KIYA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f111000-454e-4759-3483-08de888630af
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 02:45:05.8486
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mzbYbx9ljmWI6Zd8jAmM/y2Ocp3OS4H/nY/Y3UaRWUTReRGUwEiq0a7Rm6ayo1ZtTRCtaPSwtob7Kkovw3Dq7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6717

On Saturday, March 21, 2026 7:49=E2=80=AFPM Krzysztof Kozlowski wrote:
> On Sat, Mar 21, 2026 at 12:40:55AM +0100, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > The PWM controller found on Tegra264 is largely compatible with the one
> > on prior generations, but it comes with some extra features, hence a ne=
w
> > compatible string is needed.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >=20
> >  Documentation/devicetree/bindings/pwm/nvidia,tegra20-pwm.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
>=20
> Where is the driver patch? Why this is not being part of driver
> submission (see also submitting bindings DT in description how patches
> should be sent)?
>=20
> Best regards,
> Krzysztof

Just posted: https://lore.kernel.org/linux-tegra/20260323-t264-pwm-v1-0-4c4=
ff743050f@nvidia.com/T/#mfb40392e07d7ac9cedbaf853442eed822da7671e

Mikko


