Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013049.outbound.protection.outlook.com [40.107.201.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ADEF377ECD;
	Thu, 30 Apr 2026 06:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777531956; cv=fail; b=DO36I9qVWHV6lRqRiqCvnUirIbkO+ihT6+Ep1W/L91/7nlK2cX+RuIqieyYjr1RtmAlgUr393fxdz8MA82NGBSzUhKD9AY6enV/Mua2PdPOMXIAOoaKMIYBTBU6DJ+vSfA+8uFGRRSZdb1DSt1/c1Od1uxZvG646TRAt4Wb6JRE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777531956; c=relaxed/simple;
	bh=oGz3mUeH0iYEbA4JBkl6p2/fsxjyHoB498GL7+kZaqg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=M4oUW31fvbo6l3apTGetx/GLP4ZB93QnEq1ZhJyuHNFE15gyWXKJJhHZEvExDmFbeJuI5Pas/e41CySrUXFJEKYq5yAF/7JrJ6zVgSnLpiKBWzVk1yFV8T0W/CJ2QMIjpx4X0x0L9+xegr4ua+r1/bia1PjLuqS6rvznRlR46EE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Yv5H5xHB; arc=fail smtp.client-ip=40.107.201.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Yv5H5xHB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f1R1AgfQBpi/ZLS2g1O+UXgut2RNyhua9miVtTZ3OzsU6pHX5+/RudRpTPCmxceo+1OLXC55DvUt81Z5efcs/iKPedQ+piyJeVLs7ZXTon0Ke+Yd/AiMjA8I6hr//B3O0P1MaLC8UYn0HIlCmt2n6xQs8AH31Pz5mou+ZZIRXJZBYGoej53zsWcmTO7EOtyXsqSUwD+pikuzbGj/l13TfkubE7VLEtKsKAGJ34bGNUjI6tYDInPZHnn36+XAC9KHqmroAgu3dCT93t5nMgnhnUGHff6BWIPU4v2YtZ+VtGOd+Ce24lo6qjXakZbI1b76q0i69EevJ2H7aH6+gxK1Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZOGfYrAd0DlYrg22MYBAhr88f28yzPSG4DwSQaztb8I=;
 b=wwrGN6+4uNbmAkeEs5Hc0dCI9VC4G0tjMjW6wbWreE765FgghZHcAqhofxQGmPp1EmrwOJxF9DVjMyvqjMKkosQtceqxa/PMQNNIh0HF+Ly8ze3cm3HHNvOQ2YR9KFBjGII9+bX7w50hpAHfvQSl61XdBcIF1Nmq5WwX0AUoAgVyDrrCw9G7IGatglAVH/5nlGBayxF7VSRQxF/CBfr9GqEWNahHxC/IR4gHi8Nxphy4PE5kVRkuLX4sARJr9nfJa8n1G3E/16W5JJa6BTwN+LwE2LygHq9lRHMkRP1NPWjbuygyscwE2HiOt8Xe7AxODSwocPZDuDpBApzhddS1zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZOGfYrAd0DlYrg22MYBAhr88f28yzPSG4DwSQaztb8I=;
 b=Yv5H5xHBylbFip70cGXeTz+QEhm4dZjBBAh7oF7TSfG6wSl4C0X2mrAgxI5roS1EycJfmz/npecs8uEjgLlQ7zUAznvVFtrw7tm4FKPPOTlNWyTbwfwxpa/reV6EA/RzP3I6hzWZPsX5h/tj4e6lU6NvauftcGHt4CxvFRC46S9RhNhlT7X9fMzYgcDs3Yv2hNJK+rXdtlNk22xRcyWIIfuNY04v2J8/PYdxStM5EhkOdzOnvxgoA22hu7RqxzxC89hrM0pW0kXHn5BMIMNgJ8f0axpknx77u6J0L2uRn1jl1LOsg77j4gseKn/cpQ4XO0iTqps6dCQT2UgqCuh5MQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by CH3PR12MB8901.namprd12.prod.outlook.com (2603:10b6:610:180::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.16; Thu, 30 Apr
 2026 06:52:30 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%4]) with mapi id 15.20.9870.020; Thu, 30 Apr 2026
 06:52:30 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Svyatoslav Ryhel <clamor95@gmail.com>, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject:
 Re: [PATCH v2] memory: tegra: Deduplicate rate request management code
Date: Thu, 30 Apr 2026 15:52:23 +0900
Message-ID: <ssTjwrygRry4zrF09Ff9-g@nvidia.com>
In-Reply-To: <bd17f11f-12ce-46e0-a743-3fbc51b94d97@kernel.org>
References:
 <20260417-memory-refactor-v2-1-1669de38798f@nvidia.com>
 <bd17f11f-12ce-46e0-a743-3fbc51b94d97@kernel.org>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: OS0PR01CA0017.jpnprd01.prod.outlook.com
 (2603:1096:604:24::22) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|CH3PR12MB8901:EE_
X-MS-Office365-Filtering-Correlation-Id: 1401341b-282e-4b4c-d3e7-08dea6850c3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|10070799003|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	SZ8pCEEyY7PdyE5q2jwIipxPrmaC06YPYJfpGfOVCugH7HqyEQV5A0FS3U+4/HQntr3RB3hdtvrA0tWqILHKBJ6IDzpfLtV4VuWDdFRkVnP9UJGib9kweoB6YvwHyVAlceoFH/LMOlWGFvNtfui2LrrgDtf1OaEHgYW5BvuB12silxLmzNIc65Ip2k0RY7Fljsw/AYcDIoELnlB0cr+yp4zmCmnZkFAtwgq4LcyHMCENToY90Pu2XWwm4R57RYjmBfncvI4nInvT1NB6w6HvCEXbuumpRcDizJURnX980/e6IKcsWZwD1SxmlgXrjPBWyNOFppzuGmvLGpZKquyvk5vLguVGQ3z5m1UqyZxw7E4gMsQCfZrK89R3cBL+bARnmZJy7vr1w09vf+e9jXTLFm5B4GUgDPv1Qnl258vLaZH5O/cqRDrd8/RyKcSUJly4v+UL3vsFWXcLZct7ioUojzViB+X86yywMX/LzWDbW9LfGbNPcoStPu+52Hzn8DBrxDURXyJzmT6DYOvTVJY2Ul5H8+ZEyeYJ5wuRDdO+ajSPXghfab49Jt5LTWHb5WeDZYWN7QENLgEBjkXexy02okfzS/KJnYPoM5jLY0uqOYJbtBRjc0HEtcohxKWWCjEGX86XnjCTzo/hN2koHXlAXkx2ngKY8UFZnii5UmAtbpiUezRfQJhgvT4Cm1RObY0vUPCnRciK7/BjgEoYGGjl8TgcHLsbINpPkSuwL+spcbI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(10070799003)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?enlMa29TNXozemRqQ1A0VWgwNzhoY0pmN3hlVWhNL1RPdWVFekpPNFAvMUs1?=
 =?utf-8?B?S213azZvTWpZY3lkUU11eXFNckRoeVdSZjJRN3FKejVmUHZVVFlUSWdLQys1?=
 =?utf-8?B?M1pJTWpkTFE0aWRzYVhYU3pCRzk2SGEyc25jOFlMN2FkM0Z5dFlTcW5BbGtN?=
 =?utf-8?B?cDRMdEJzRVFqT04vd25LNGw2ZXhjeEQxTDhFUkpyUlJ0d2xkZVpQUGlaZWpl?=
 =?utf-8?B?ODdNcWN5eHNIRnJKREIrcDZiREpaNkRQcVJiQ21CZUVLZWJiMFJRRVRDWjk5?=
 =?utf-8?B?VDh4THAxTjlheVNib0gvODdQZWh4c3VFZjY4a1UvWTk4YnJoeEg3WEtSNVps?=
 =?utf-8?B?ZndoTHVTV0lzWitFQWZYNXFtRk9SWGtNZ1pDWE1zTGpjeHgyMFU0c1NTeEdR?=
 =?utf-8?B?eU9JcEdYWHFYZUVRM0JLN0grdVVaeGdObmNBYzF4LzNrY2hsR1o5UGJLQVE3?=
 =?utf-8?B?eEU4dmptWDhKaGlxcG9jR0ZmV3E1SXpkNVJMUjdSRG9VeUZmRDZVZGZaUW84?=
 =?utf-8?B?WEd0TEJBMDFuRU42SUdKLzR4dGtUZzRaUmI2SU51MDdQcWRvR2YvNGR2M2dD?=
 =?utf-8?B?dzZpTVJ2cHo0V0dsWEdQYWpxQTdDRHI0cG9hZWl3WHJ3akVWQU9OVCtYSWdM?=
 =?utf-8?B?WHBkUXk0OUszOFAxYkxweGQvRU40RHRyS3I4a0hyYUEvK05sa2tUSzhKakpR?=
 =?utf-8?B?Q0Z3TFlldHlQY0g1VUFIbURkcytCRGFxUlRQeVU2cXNIdWxlWWg5WTU3d29p?=
 =?utf-8?B?NGZheTFHbWIvb3VmV0pZOHY3M0ltT2RDRmVpWWhiVzdWMGVVL3djY041QVRJ?=
 =?utf-8?B?cVdWTkg2cVNIN3NuN1RhWXdyMUE3akNHc01lUnovUFlPKzBzNThud01SSjRs?=
 =?utf-8?B?alJQdWRuTU1QVHY3bjB4bzM4RXcvNTJmMjQ5NStqL3hMMVRTaG1xWW0wZ2R6?=
 =?utf-8?B?YTdzWTJ2cURFZVJzMFc1N3pnTXVzSVVYTS94QzljL09pUVRxZDl3dEl5YzNk?=
 =?utf-8?B?a1RJTmRrM2lRM1V3REZ5Uzc1U29uVStodDZQSWhJb080MFFRLzF2Q0FYbUNt?=
 =?utf-8?B?aHB4bjdzRXkwcmlNTWJRb2J1Y3c1NU5ETHF1cks1S1BJRzNCWkNXMnRicEhU?=
 =?utf-8?B?T3E1OEZpQldzYTA1N1I3UlBRMTQwWDM3bFRabnNsdmlYOEFHaGZRUWVWMlpW?=
 =?utf-8?B?LzFnanE4ak1GQmppR0JuNllJMVYzVnpQblZ2dFZNaDhpcDNMcGhnK3lIK3lO?=
 =?utf-8?B?SE8wUnRrZ296NFdrZHgybFJrZk8ycGUwU0Fnb0tPS1VwTlpKakVCZDR4VGRZ?=
 =?utf-8?B?NE9ybHJPaVVhY003eVFVQ3dJUWNWQTIxdnZMY1o4amNpNStrNitHRjVtZFhZ?=
 =?utf-8?B?WE9wTlU3Q3RFMzB2VWhVR0dXOUpRU2xlSVRiZ0c5QmQ4bTdpRUZCbkdYc21i?=
 =?utf-8?B?OU1kdWFTL2tiNEpvckcxUXZMQjZLdS81YnRaZUg1ODdNL3VleENOcWwvdEkz?=
 =?utf-8?B?bDZJSTZERHdwQ1o2SlAxRTJWUkNWSk1vLzhYNGx6V3dwQzFmZnpjYUYyNVJL?=
 =?utf-8?B?eG5Wd2xydVpNK0ExSHlmUWNCYU5sY00wOG1MYWxpVSsyVGtneG9YcUpGalND?=
 =?utf-8?B?RlpVandRNURkSXpwc3BqMTlYMEd5V2ttdk8rWml3YlBXOWhGbGoxZGdSbG9Y?=
 =?utf-8?B?enlEUHJ1ak1ZQXRyZU1SSEZWUUhIdkRBWU9EaW5oNjhTdDdxQVNjWk9yYlNu?=
 =?utf-8?B?T1pZYzhNTGdURTkwLzkxeVBKb1dGZTdqbFhMTjRHSGZhZi9taFpCeEIvRzNp?=
 =?utf-8?B?Ykhjb0NaQnhMNzl6VXhVb0VoUEZHOWtlQ1A0cmFoQTV4dXcxNWROcHNuTzR3?=
 =?utf-8?B?YlRIMWNIcHNIN3JyUFpEN3ZuVXpvRlM2SFVrdGJDZDViWk93OHROMHI2UDBS?=
 =?utf-8?B?MEU2RDZHaERvYmx0bWRsYlI2azdPdDdVQlRoRXp6RDllekZKb2doNHJNdXFD?=
 =?utf-8?B?cTUzWG1tTi80SXhXK0RBWUZZUGhpOXRsaXVuNEs5RU1BQ0oxdzQyZHpYSkhY?=
 =?utf-8?B?ZldnZkVIaENDZ2JiRmxneThoRUJWeXI4Tmc1dklxdG53M2NxYWwySTRvanpn?=
 =?utf-8?B?dzVLaU9zUGJSNSs1RVFLekhYajVVdzh2cUdURUxyTThMNk8vdFZCL245YWVx?=
 =?utf-8?B?L2pKSjllTUt6ZVUxeUxucW42amhIT1hIV1lsZUQ0L0hkY2JROTJyaVFaNnR3?=
 =?utf-8?B?VE0wemdYTjRPcVBiUkJtWUFwMmpBeENReExCUUw2ZzB0WEFHOUd1UlprNjg0?=
 =?utf-8?B?RlVlQXhaODVIbTdCQ3p4NTlRSkhhaHZNTmhPZHJid3B3NTZpWkp6bCthdHBk?=
 =?utf-8?Q?AEeKsagDgOLDUDSJhXwmVINuuSnFnbZZIPUef0FjyrY0j?=
X-MS-Exchange-AntiSpam-MessageData-1: mrVC5ufuas+Ryw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1401341b-282e-4b4c-d3e7-08dea6850c3f
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 06:52:30.1372
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fFrjy5yDCdD6VYvPa5u0pyeHUSnwod0r2eEAgi2Mu8fQOzt3YFUa5vIxFlF5PY6UDKXrfsxSKxthYV2j/M1POQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8901

On Tuesday, April 28, 2026 6:12=E2=80=AFPM Krzysztof Kozlowski wrote:
> On 17/04/2026 11:19, Mikko Perttunen wrote:
> > +
> > +struct tegra_emc_rate_request {
> > +	unsigned long min_rate;
> > +	unsigned long max_rate;
> > +};
> > +
> > +struct tegra_emc_rate_requests {
> > +	struct tegra_emc_rate_request requested_rate[TEGRA_EMC_RATE_TYPE_MAX]=
;
> > +	struct mutex rate_lock;
>=20
> You introduced a new checkpatch warning. Wasn't there before. Probably
> the old comment feels to obvious in this context, so it should be
> extended to be meaningful, e.g. what data structure, which members,
> which code paths etc.

On my system, it's just a 'CHECK', not a 'WARNING', so I thought it
not necessary to address in this relatively simple circumstance.

However, I do agree it's best to err on the side of verbosity when
dealing with locking, so I'll add a description for v3.

Mikko

>=20
> Best regards,
> Krzysztof
>=20



