Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022119.outbound.protection.outlook.com [52.101.96.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C5F3955DF;
	Wed, 27 May 2026 11:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.119
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779880772; cv=fail; b=J1JymbA0VTxooSBbNaxTkvKFnbl7a9sZwWPw5JVmZV9Gdou9wJoFvWC8HOT5YNaacYPeSLEydPj3keCZVuezDCAkL91StkoJhYs4oml5i+cWmY/7IAOTV0aXCMYT21C+Cd5fq16NZPZNQmFMCGRwZ5VTMfxuIzi1nQksJdwogUs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779880772; c=relaxed/simple;
	bh=WZC0gJXCrbo743Zdciuln6sfGJT0s47WG3K4Y7KTjL4=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=d3LMJYw/XLLba/+0OUmAzeg/Ij4YCEokhHHb62IpWZ5dT2HeDjglzOmHh4h8/bUbjJHK98rXk00SxmscTGndKf9Fla7NGxOuU/KjviEYAVu5QE/J+wGXyU0u2klpT5rQWR1huoYtJzO7kUtPKlPXWnhK8J7Dc75Epp7kAbSWbdg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=acO+ODRo; arc=fail smtp.client-ip=52.101.96.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="acO+ODRo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l02oV2KvFu0ubsRg0e3CFgIPOz6d0lFkvOspjo1FtT+5+eSxjDA5Do/5/961eId+50f/FL/c3VvJ2wz3/zNPLHfgkjflQ6CvvTZ4hy2MdFkzwhy8wj8NTU4TLOSROxGXnUY0yop/TYa5dE3B8VoaGhls/x1sYjBN3nUAtxwkXklInTK1p/7mmq6AE6AKeOVt9x2003pdM2QIQvAe7bmhjryi/oPk7MpqPtV/8qFimLjSf1X7SGNNGEE8VUJToz/ZaS/uhkZbBqyST66gYp5AcEpaAyikNZ5LuLlE6TAvswGE63qBQmUsFE686usEmlKqWXlqeYWbg8Wcpooc0S+o9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/1qQmcGHwo8tfRMDo6HEhkERD82LPQDLNEo5RLkw5RI=;
 b=nsioqx/fLnaqvjbLB0DpkuwIKGko6U9OMuTeNHTwPvXsovf6Yyq9ZABRs2lFS36A+rg7HGPdEcr0ovjy+5s4ZsVAbb4ljfnLc4dblyeYbJmZ/MZH0uo9R3L9/CT3G3OHRrh+2rutOgp9PYUfCknoY9UqoMtZKzM0BgyU8GAI9pYiNltbzlTD7hHiF87ihn+/nco0QdCltnfvRZCWFGsQSo8JBCGOVtaIc9HNzR6HiK7Z67r90PJdKHT7BPZ8//vFsDIi6zWhqVzIsAGHljuD9r+f3rYX+yoX9jEK5BJ76rdduV9Y/WZPo3na4Xky92YGy8Ymcxt4J1gnTSFFEjdVyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/1qQmcGHwo8tfRMDo6HEhkERD82LPQDLNEo5RLkw5RI=;
 b=acO+ODRooz5E9bHh0WsVofvJCpqV3CSAiYEq+sbo00t4uK1sf5Sz0s9DfDUmKfgS1OKNg6w9/R+U1qKCF2I8dYqj2RchU/P4B8r+WKRnbJZ1U6EzQ5hMc7xz3HMnLok1WA85mR4EJ8Yz2HFbvXlGzMBFjc3BdS4/vZP5lOAy4YQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LOYP265MB1888.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:e5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Wed, 27 May
 2026 11:19:28 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 11:19:28 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 27 May 2026 12:19:27 +0100
Message-Id: <DITF2OMVKRUU.18RS8QOJF6I4R@garyguo.net>
Cc: "Rahul Bukte" <rahul.bukte@sony.com>, <linux-kernel@vger.kernel.org>,
 <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
 <driver-core@lists.linux.dev>, <rust-for-linux@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, "Daniel Palmer" <daniel.palmer@sony.com>, "Tim
 Bird" <tim.bird@sony.com>, <linux-modules@vger.kernel.org>,
 <linux-tegra@vger.kernel.org>, "Sumit Gupta" <sumitg@nvidia.com>
Subject: Re: [PATCH v5 2/4] kernel: param: initialize module_kset in a
 pure_initcall
From: "Gary Guo" <gary@garyguo.net>
To: "Shashank Balaji" <shashank.mahadasyam@sony.com>, "Suzuki K Poulose"
 <suzuki.poulose@arm.com>, "James Clark" <james.clark@linaro.org>,
 "Alexander Shishkin" <alexander.shishkin@linux.intel.com>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Danilo Krummrich" <dakr@kernel.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Jonathan Corbet" <corbet@lwn.net>,
 "Shuah Khan" <skhan@linuxfoundation.org>, "Luis Chamberlain"
 <mcgrof@kernel.org>, "Petr Pavlu" <petr.pavlu@suse.com>, "Daniel Gomez"
 <da.gomez@kernel.org>, "Sami Tolvanen" <samitolvanen@google.com>, "Aaron
 Tomlin" <atomlin@atomlin.com>, "Mike Leach" <mike.leach@arm.com>, "Leo Yan"
 <leo.yan@arm.com>, "Thierry Reding" <thierry.reding@kernel.org>, "Jonathan
 Hunter" <jonathanh@nvidia.com>
X-Mailer: aerc 0.21.0
References: <20260518-acpi_mod_name-v5-0-705ccc430885@sony.com>
 <20260518-acpi_mod_name-v5-2-705ccc430885@sony.com>
In-Reply-To: <20260518-acpi_mod_name-v5-2-705ccc430885@sony.com>
X-ClientProxiedBy: LO4P123CA0026.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::13) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LOYP265MB1888:EE_
X-MS-Office365-Filtering-Correlation-Id: 09b4a8de-9d41-4305-aa8b-08debbe1d10a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|10070799003|1800799024|4143699003|22082099003|18002099003|921020|56012099006;
X-Microsoft-Antispam-Message-Info:
	XwMkzx3sgmfXY83TbZaDuRA+V0uDcmLGXOx+5NNr4c/x+IJrCHmLEw132UUlyTn88eropX4RXEYUaSLXz58fnGNWwYQ9wgHCpw0sVOu59uhk/i0GhVikDZi484UIpMTDpcW3c1JoUowLjC+JptVRcrMcEGITHsj4HrCguQ8GuM3QQh4IZlNvHOyUREOsSF6nHEVWW5uxUeFE0usePRLMnqRcKiV8+641h3JztB+MU3hyFDi9FH7uD5lRu4fMNOrVRCELAQ4g7kpQ6KV6QOvIO22jqlA832YGp3ArxT8B/kPzLmT7WkXjau4lIlhDtNmNcAB896gm4/bWQKjlTdtkCyKffw2jsNcIMfU+ZwInRJ/IwUgI70wTK7CoRdbp9cG/2YUejtl8fnNulVZ0LVCFVfZEH+BG75dVQKWz7BuBfURuR5qpO+TzSBCFMNAnnGkDaCAMYl/BaU/T6UjeR7Lhv+Z1YVFNwuZETF3ai9IHsId/0jC5nq4nbym6zqRvO/sLEnsGnG/2I2hpbqHTtTGhrVU1GWOz+g7wXwGuc9f8DLoSjqQeh4BrWIyqIq5n1MT4NCDoVUBRL4nJYLuVE+zNOPuOfD2YPH1DWuu5RRAJLyR/ZaGub9QiUBJhjdaPtwSdv7kI7pWjWAuuNWo8ZGe9Z22MJGtx8lkt2Ghh5jmQJcdllbfAMi0DfYTjVb8iIr9lHtwoET8gX3L6MdC1Fxu3gozjaTpCXmUDPsaFqDqA144=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(10070799003)(1800799024)(4143699003)(22082099003)(18002099003)(921020)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?STlhdkdIRFNURERMeTVtNHh6ZGJtYXZpRnhMQ1hvV3ZQR2gvWjduWUdUdHVz?=
 =?utf-8?B?dFNZRUU5N0dWTUo0V2R0ZUEwUVUrN0RKcWViQUtBVEdsbUlNTUprdGRyV2xM?=
 =?utf-8?B?UmJSOHRLMG95YytaZ0tpQzUzalgwZ3R5d0ZzVWt3Y3dwcDRVeXZkMUYrWnFl?=
 =?utf-8?B?TDg0QzJkUWZaTkdSamZHRnY0cVNaU0dBNkN2ZVIrNWlyVFd0QlRnNW04azli?=
 =?utf-8?B?TTI2aHEzSDVIVDByS090QWZaYlJKc1A1L3dYeGpnSjE0TTBuZjZmQnhSRENP?=
 =?utf-8?B?OGtGYXpzZUFnNXBkb2Rzd0xCTjcxL3BXWGRNSWhhK1VvSWxwYWFaNGxNOURU?=
 =?utf-8?B?bG10UHFQdjF0SmhoU3JSbXhLR0xaZnpOeHNFRUkrUG11QjJ2ME9HdmtuVm9Y?=
 =?utf-8?B?THJkRWdBTWpXRTdrMUNKMEkzdE9lSXIxdTR3Ymttb1pvOEU3SHRGR2ZwdnZq?=
 =?utf-8?B?cFYzUldnbmlVaUlLMTFRTzZ3ZUd0NTdVRzNtRGVNNGM5d2V5QW1WbmpxZXFw?=
 =?utf-8?B?OFhMY3VsNHU3Znh6d2lyZktIUFJWbEs2aisyUGZHTUg3Sy94azI4NlgzdkN2?=
 =?utf-8?B?dHVTMkU3bmowQmdGMXVrRVlNY01XN1dlWStrSjFrUVpCbWpiMGYzQW56WFUr?=
 =?utf-8?B?TE94MWpGbUlya0F6UmhlNGdWMkttbGswUjNUVHhGUTlTNDdGMkh4OXJYWGla?=
 =?utf-8?B?bldnQlM1VFNUVm00Mmhlek8yWHo1YXBPL2hzN0xYejROMi9wQWpoTWc0V1Jz?=
 =?utf-8?B?UkR2bmVrV0EvelAyMXZFQ0FhOWdMOEs0eCttS3ZKVVl6SkZHNU1kSUlHYUhC?=
 =?utf-8?B?alVzT1YvRkRQL3lUcFYxaWhXVDN5NHN1c2hSMHJOdkY4c1J3cEV3QnlWcWRj?=
 =?utf-8?B?NFZ2SGc3QS9ndVZvd0FCa0xvSFFSSmd1b0xIcVJwMnl4MVo3NEd5cGhnczdu?=
 =?utf-8?B?MXdBak1uYXVtVW1IS1hyVzNnWDRiazNKQ284QWxIN1dZMERUS0tDQUp1ZDFh?=
 =?utf-8?B?OERnSTkzYUN3c2xVZEZqQXcwdFdEbG9ZTm5pUk04bWVNdUZ4NUcrOHB1bXl1?=
 =?utf-8?B?Rk9MVUNtbkc1Z2xSZmNwbVh3OFhBMVpVWEw0eldITHA0d2VidnhqRHg0TTgx?=
 =?utf-8?B?UGo1a0JuWGtSV1hQUjFmaFFxM2F5dEx0ZW0vcCtvYklNOUVDMjhITjRQSURJ?=
 =?utf-8?B?N3BBNmNIS216ZDAySU9sVTlxRktOOU02MHM5RFYvRnFWemNYWmRVSGdRd2p6?=
 =?utf-8?B?SHo3c2Z3eHhmRUJROVlBV1pqc1FJb1k4eFJJSTVqL2drd3czL3lqZFRtZTJ1?=
 =?utf-8?B?eWhkUlpXTklUN21oMHFBYWdHK0RRQzliczhWUXl3WVRoMHI1T0d1aUkwREVF?=
 =?utf-8?B?N2ZPRDQ1emxGY1pvL0hYRlMyRHhRMDRtRGxlN3phRUd2NlpldmlzUHYxWURI?=
 =?utf-8?B?UHhZWDBSZG9LaU1vZ1BJekhoQ2dwdzNublg0STQxQmJ3S0ZMc041VjNhUTdB?=
 =?utf-8?B?S3RNTi9PNi9SSjJZZzA3dVB5QytKU2RabDlMdWhKT1hTU3ZYMEM2NzZYNVVJ?=
 =?utf-8?B?VzNmMnVZOTZLbTdDN2tleHIrWkkrOXo1RVNUMzhHOXBuLzNIWGw4UWowWXNE?=
 =?utf-8?B?MWFvNjN3NU16Uzdmc3dFeTlQSmppMG1JbVN1K2ZBUEo2ckg4UkJZUTBNYkdQ?=
 =?utf-8?B?UUlLNDl4WDZLNy83b3R0eU5CMk4xTExOaWpVRnRuNGRnS2p5ak9JZzdtWkRD?=
 =?utf-8?B?R05meXVQd1Jlb21Ib0ZiSUhtaVNWb2dPcFJYNVdGZnEwVDcyQ1Z0amhqWmEw?=
 =?utf-8?B?K3lpOWo4R3psVWxjMjNiSHhsYlh2bi9zeUNaS2V0RURHS3FPUDdYRGNVUEZh?=
 =?utf-8?B?ckpwZ2JYWW9IcXFGM2YxRXdlbm9yTUZnemlVWHova3Fpa0NkaVo2bDNJSGtz?=
 =?utf-8?B?bk9kTmdYS0pDTDgyay9CUXIyOXZFWFpNb0JVOFZBVm93QTUyOHkxcnJNZWd0?=
 =?utf-8?B?RWU4Ym9HSGw3UStsWlZ2bDZCWXU1VWduVGZoOTFTeEI5WndudytJS0ZGcVcz?=
 =?utf-8?B?bWtDNHVwT1lxMlpmL281Y28ydDl0U1BXeFp2WHkrV0krRzM1TWFUVWlKMkJ1?=
 =?utf-8?B?RlVPM1BXQmxsUE9JcmFuN0tUc1RBVFdCWW1TaGpoQVRUdUxldkN2TW9rYmhi?=
 =?utf-8?B?RG41R05PUEE5R3hTVDRWZnV1VDIrZWRWaXhBSnVlZ0pxblVMU1ZiWDNVV1lD?=
 =?utf-8?B?OE9RcVJwaUwzU3JmdmxYQ0I1WmpjZi9nK1dQUElzU1B2Q1ROTkx6YUd3TDhu?=
 =?utf-8?B?Q0VvUzhaOFFIUVpJL1Y1c0hZT0JSU3p0TGRlNFlYUDlTeGoyNEw2Zz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 09b4a8de-9d41-4305-aa8b-08debbe1d10a
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 11:19:28.3295
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FXC9mWTjg2Ze3IsnDwl1rVKmDMEWUmMpPee75lmK5LUl2YiLMAoUFrMz0GPaWpH39VEqmvtQRVUCYnNaOqgnDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOYP265MB1888

On Mon May 18, 2026 at 11:19 AM BST, Shashank Balaji wrote:
> Commit "driver core: platform: set mod_name in driver registration" will =
set
> struct device_driver's mod_name member for platform driver registration. =
For a
> driver to be registered with its mod_name set, module_kset needs to be
> initialized, which currently happens in a subsys_initcall in param_sysfs_=
init().
> The tegra cbb drivers register themselves before module_kset init, in a
> core_initcall. This works currently because lookup_or_create_module_kobje=
ct(),
> which dereferences module_kset via kset_find_obj(), is not called if mod_=
name
> is not set, which is the case now.
>=20
> So in preparation for the commit "driver core: platform: set mod_name in =
driver registration",
> move module_kset init to pure_initcall level, ensuring it happens before =
tegra
> cbb driver registration.
>=20
> Suggested-by: Gary Guo <gary@garyguo.net>
> Co-developed-by: Rahul Bukte <rahul.bukte@sony.com>
> Signed-off-by: Rahul Bukte <rahul.bukte@sony.com>
> Signed-off-by: Shashank Balaji <shashank.mahadasyam@sony.com>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
> Patch 4 depends on this patch
> ---
>  kernel/params.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

