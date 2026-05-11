Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010046.outbound.protection.outlook.com [52.101.56.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68EBD3A2541
	for <linux-tegra@vger.kernel.org>; Mon, 11 May 2026 08:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778486555; cv=fail; b=P010NRobH1EajMWw2L4FRFtN2Y/9Y1uwje+BBdWeN+feW0lw44MCIydjUFeOe6GmHBIi8lnHpas+4VaXmOWVXIo+sXnY3G5BnfsTkgLBR5xs/khRKocBSnSK2YDyG8TPMX6p3NHI5HgEyaMOQpfL9PQ6FXE18/1P/wn6yS6BDTk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778486555; c=relaxed/simple;
	bh=PiQ2m02W7genbk6/o2JJ0DQyd5jmScVDbIzZtJA3tNk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=O5gdL7Bn1AqSi3cUwsbV+tyxulsigvV/1mf+oe/A7kAPv9XgmwVN0qKn0J/Qp1LcbZ8yxlZKmQrWSDUWsMTAf2ystBscKV3yiigHbuz8XqXTRKnwPRl8l6nou3HD/7LN079in1l28Lbrx0+btRDg/VfV+mJ3N9+vu5/wZrL1NR0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=L7MugfcY; arc=fail smtp.client-ip=52.101.56.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="L7MugfcY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XwDwX/0E81ejDxREYYoUO4NKFaqC3kF0fK1Fq73zP9zZBAtvRSa6kkZ/ZA8Bj1ISqB1Hwl7BZTPYtOtWeVG6Jc+Wat58EvY4b6eVjKihmsnjplqWYyYy32SIixMmrkVZF5j2s2PipBb4hsf/Pqfj4Hnb+iCr9MfG66GzLTkoBSEGz5nbsPRKkjBZ5L1Frim1X35jfrGe7ch7Muh4ccep2gksxNqCZtCCGHL/HMwTzCgk/Gjc2ZGygKMBMj5jzR0PSOgbT05uhGYLi+e4LMHLuHPJeUyj1s/FH18T+NKzCxV2cIS7H1SY8vW8XPPV4pdw/zS2YtYhS9vo6TDCWHcz1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PiQ2m02W7genbk6/o2JJ0DQyd5jmScVDbIzZtJA3tNk=;
 b=O4tjE29Zzpv/yZB0tw3gy/C7qRnnVEQ7Ccy8R9XOnywb/WNYnYGVEisIeCF49HYqWDJCJicdmI7QeZfIvFnDoAD7Jscrd7F7k+N9RMwg0kbKxQF6s/ybCRTtYFoT5mUBiO0ffH9ur4H/u6nl7skjiSqG2A6X+ZXkJUKUBPUroGnkK1ygg0GRV5gPmCF/wcelSwAANmnkaFRLQdycJ+GZ7YMFi+BCWJ/mZdba1fINo6C9J8wjrgM+aCiasSnFY+8A+PQm9DH9pn62+nHKhYR+3eD5J0CifMlponggBel+AIcNIQo7xRfMqf3Ruc7FxClJH55wAUTNSj2PtjCvKwFQ6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PiQ2m02W7genbk6/o2JJ0DQyd5jmScVDbIzZtJA3tNk=;
 b=L7MugfcYh36jUkxgXBhsk7L583f0vFt5qq7TsDG0eZl4sUq5+nNUW+DL8AxZzVp4764oAevJC3d5qRfFq9zFSMiKXKUNLvbQFQ7KxK8HE450HobsJkyiiK0lDa/oVOWRTtqGY3DeGV0KHNuwSIV0wc27iJSvYvrcw/PZyWIuau47py0bo0RKVRuLEAVymL5awNmUNIRtFDkbN/Auw58f0bZfyUkYzHul0JE+zZz7thMo86ayy/THppNyVKa5i/j2eTAfyzDmhfZne3eZFOzQ+Al0A1vAZHAHENp0SjPLIMs2OP0myilpCdg7Bzjn0xmyyDfuGwAkdKKD/gVXA7uBgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by PH7PR12MB6586.namprd12.prod.outlook.com (2603:10b6:510:212::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Mon, 11 May
 2026 08:02:20 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%4]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 08:02:20 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Aaron Kling <webgeek1234@gmail.com>
Cc: linux-tegra@vger.kernel.org
Subject: Re: [REQUEST] Release Firmware to Match Current Driver Support
Date: Mon, 11 May 2026 17:02:10 +0900
Message-ID: <78vIAjaWTgyGORO7lyOZcw@nvidia.com>
In-Reply-To:
 <CALHNRZ9152Ox=Y230zmFM_eywsOtr0Z07CYLKZH+hGbOhRmF7w@mail.gmail.com>
References:
 <CALHNRZ8uHmx3nqpg1-F6RCprDavx3nY55en5gJds54RU8MDR5Q@mail.gmail.com>
 <CALHNRZ_4WaAuJmpTnvdpn10=vw5SXcv-5Qq+UX-T_pG4Snba7A@mail.gmail.com>
 <CALHNRZ9152Ox=Y230zmFM_eywsOtr0Z07CYLKZH+hGbOhRmF7w@mail.gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCP286CA0137.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::15) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|PH7PR12MB6586:EE_
X-MS-Office365-Filtering-Correlation-Id: 215d3544-a2c4-4977-e5b8-08deaf33a03a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|10070799003|366016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	D896Q8z088BG64iIIOTBk6ssEy97roEqfdSUOy2xmQuDMhgUDb2uTmuVnRVbDXfpYJh042DYfm08PWQnm8TNPPeLaKCl3udHrOSPXtcSQkStBU3D8J+X8a0VembBn+fT965LJQCF21eGaahmG0VOuSS7hDD1G6g3/VpV81GNt/MNiYn91i+4YmMcma7bpdd4tDywj2uw6IyXQCSFcwnjz/yrqV/y4xFRV064OYBWyFv3jXS0InJh5SAyB2hFkBB8kwTKDzXvbPkuYV1N3CRiq+W/wTzpvjsEZHGmf7spd7PNAy9INHbOka2LwcieuT0iCnMny28QWDcmQoHYFK+2I3mpuWHE8Zzug5mU9MPsqUx0b4RDOwTrM7StPLC+tNtj1mmPF6Jf1NWsJriq/ZQvnaLjf951lVqpHU43FEfedq+FsJ8/r5GWZymjO7ZfmolAKymAbsJ6w2/octnq7keRFwk1dfGM4pWG3NV6LNzYfF9lLSoGj2rpu2/tgtDfhAWYBHRKehE7jTwwH/3H4OIlrIgNbYnyahBLdIHAOUv48vgHardmh2mHnKcHwnrY5zMJSJ6mU0eDixCyewnWgQx9IrfjwXtvLztU4ZH9SD8+EfdEpQAV1fqociKwmc6uAciFRgzHaqM5zTb48XRChpY/GEUO2i67exW8RBhLCrnDD7yuEUoS7OTyFiU+v283RGMaUDA77/TgdxJiuf04MVOqHA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(10070799003)(366016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cFdzcGluS0Jyb0lWNmNtdnF3bGRJK0kxRk9weTVKb2VGMFNEZGJNK2xHTTZ3?=
 =?utf-8?B?U2tOV004Wm5ITzdHYzMwajhOVURUb2xPemRwd3N6TTk0UUhuL1FYeWREWjEw?=
 =?utf-8?B?OTdoU1RzWDJVdTdoUERNTGpOVmpPNVg2bWY5cjRYdld3U1NwTUEzODR5ZTJT?=
 =?utf-8?B?K1hNb3UrdlFCTCtjaVNRNkgrMnNtT3dEajNvTlpMRXJ3WlpKOEc4Zjl1Y2tK?=
 =?utf-8?B?N0RGbUJIdkcwT1Yzb0hTc3BvcHU0VklxWWEvSmhRYjJLbjZCUTFUUDZEZnI2?=
 =?utf-8?B?clJBT2lIWHZGSmNRcjJTdU9rNGFDTktjc3lESWpoN3NGRWxGU1BOTGVWNXow?=
 =?utf-8?B?WWdVMnJtRFFNWSszekQzd1h2a3huamlYWjRRZFJwMUtwVzJ4blVWdkNRc3BZ?=
 =?utf-8?B?czhQU1JmYy9qUllDUmZpRkdHdTFzdmpjVk9yaXp1N2ZLWHhmVjJTeFMyNXNX?=
 =?utf-8?B?SFVNaXVhL2llekNpZVR0OTFPeVEyYzgvWSt6SE5RNG1PU01GWUpBUkptaHZH?=
 =?utf-8?B?dXlzU2wxcktOcXBHS21XWlRnN0NJb0EwUEhJc24zUHpPSktJUnZqZWNpMW0z?=
 =?utf-8?B?Z3NzNGpKekc5dzZjL24wVm5LQkxaOENVdG5DSmIwaDBZSFdFdEF3WmI4c3o3?=
 =?utf-8?B?bFJDTWk0dVBtRnVvMlBtKzN4QUFQUWZiRDlDYVNIQk5TWFV4d0Rza0FlRkkz?=
 =?utf-8?B?UWJoRy80OGFKWnZGS0ZPL042ekNybm81L294dFNYUmhhZjQzcHcxeEk3NU1l?=
 =?utf-8?B?MTZyZDJVbTFxSHF6a09wTk4yS3RBSmJxYUdaVmZIcmtLT3RiaXRETEh0YVVM?=
 =?utf-8?B?bnUxSmtkODErUnNHN2Z5bEJCSjhYU1hleHNwc0hUU2Y2bVRhdEVnUDBPRjZJ?=
 =?utf-8?B?Wi9qUzlucEJKYVdFcEVzUURuazZQMG1OYStwWlF5MnhSM2g1U3Jmb0dPOEgx?=
 =?utf-8?B?ZW1lakZWMTB1SjBrczNSeEdpeno3MU5wN0YrNHdaeG5rTHR5anZOM1BQWXFQ?=
 =?utf-8?B?NE9xbnJ3QWhQaDJWNzM4WUVWbUJmbEVCcjFMVzM4TmtZZW9rRkFCejdob09s?=
 =?utf-8?B?K2tYNU5NajgwenhvUW14ZnlvQ0JoRlpSNnRWbUlQc29qYjdCU2xtRmZXNm95?=
 =?utf-8?B?bjVWd2NqTlNkUm1yLzh6RVNqT1lJQWlxZUxuUGd2R2o3ZG1Kei8vWmxTMmFs?=
 =?utf-8?B?U0ZyeXpKbDJ2emwzQWRCZHdja2V3SktQZzQ4VXhJNmt5Z0VsNXlQRVllSnJr?=
 =?utf-8?B?WUkxSHl1NWlGRXhPMnE3N0pyR2FZY05qR21kWTA2SFZzUXBvL3UzOEdVei9W?=
 =?utf-8?B?ZUJyclN1ZllHM1dPLzY1OFdZTElDQllSRlZpVjZOVTR5cmxESk1rc0dDbjFG?=
 =?utf-8?B?ZGdsdlBUamhvUXpHTjl0cFFVRmNidkMxcVRhemhpZU14dHNJbCsvQzZIR21w?=
 =?utf-8?B?Nk5GUVg4a1M3MkdiU3Z3cjBrUDZxN3M3ZlNNcGhoMUxzRXI4eUxXNUdRdTFC?=
 =?utf-8?B?c2lFamd4Qnd3dzRjMUpiZjF0Q1p0YU13TUJaaXJiZGdscHZVcjNlMnFTWktC?=
 =?utf-8?B?MTNGMFZJWkNpTENEcFczRW5mQmNJRytFaXRDWVE2cklYbXliVlVmL1BDM2ln?=
 =?utf-8?B?Z3NRTllMVXZFRUVXN1JDVGJmWDZxU015L3oyZFViakFYS056amU0NU5CQUNQ?=
 =?utf-8?B?cko5Tno4Z0liOUdPL0NNNzBUcXFOc0tNOEg3eE9YcWtyOW8xMnNBVFRKclBZ?=
 =?utf-8?B?ZW9UelltTnZRbGlTTDdFbHhjNm5hSytWenNLWHFvZWQwNFlKeERDMXZnaXRI?=
 =?utf-8?B?QWY0Sk1iWDRubkhoOHZPVndyeEZacGxKSVd1a1NEY1RHUG9rb09xOUtHL016?=
 =?utf-8?B?VDFmNnB4T0t6dWhpbXg2Y09HTk1sQnQ2dGliV1ZNRzF5NFVHUFIxdVQ2MEd0?=
 =?utf-8?B?R1NEc1o5TWFOTENxVVhQU1preUNRdklKYkM0bS9ZVkR4RlVSeWYwZCsvYjkr?=
 =?utf-8?B?ejZCYXdQcEVVekZsTVA3MSs4RS83QXdTcCtFeTVaSXBDRnh0SnczWXZTZHY3?=
 =?utf-8?B?ckM1U2Z0M3lZL3ArTUI0S1JKWTg3R3J0dXpyeUlBcG1jL1NLQlViT1hzSUJ6?=
 =?utf-8?B?MXNmaUZqelpvYlFmUEtycHAyQlo5V0tDOENHbFFJYnZnRGdzOW9welpIbElQ?=
 =?utf-8?B?aklZU2NDOUE1dHorMnI4aWU5Q2ZZMlU5RzhDa3JNZklXRDlzNVZJcFhFbE9i?=
 =?utf-8?B?YWVUNFN0b3RuVzBVZ0tyWXF1ZzA3WDduSEZtcGhSay9aWVQ4Mjl2OVN1WjhC?=
 =?utf-8?B?Z2MzVzlDaWp1YXRWYzRsVDIvR1hLV041OUdJT2dYbW1tZVFTSW5XMzNrelN6?=
 =?utf-8?Q?YsInjHkeMu9wTQfYXzf7MzWqoJ9Xg6QsanCcdYLNzjxov?=
X-MS-Exchange-AntiSpam-MessageData-1: tH8D9QQIiiKi0A==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 215d3544-a2c4-4977-e5b8-08deaf33a03a
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 08:02:20.1435
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lnVm1heA4VX+N4ICd2Z6LkQpSctgLVX7YCxUXO2kQuNao2lbkRkhKLIX2C79nWEnpfZiJCtd4QxBDrjA9ksOmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6586

On Monday, May 11, 2026 12:05=E2=80=AFPM Aaron Kling wrote:
> On Fri, Nov 14, 2025 at 2:17=E2=80=AFPM Aaron Kling <webgeek1234@gmail.co=
m> wrote:
> >
> > On Fri, Aug 1, 2025 at 4:56=E2=80=AFAM Thierry Reding <thierry.reding@g=
mail.com> wrote:
> > >
> > > On Thu, Jul 31, 2025 at 04:22:32PM -0500, Aaron Kling wrote:
> > > > This was originally discussed on the freedesktop issue tracker [0],
> > > > but there hasn't been a response there in 6 months. So I'm reopenin=
g
> > > > the discussion here.
> > > >
> > > > * Nvdec firmware. The driver has been in the kernel for over three
> > > > years and there's still no available freely licensed firmware to us=
e
> > > > with it.
> > > > * T234 vic firmware. The driver has supported the arch for almost
> > > > three years and freely licensed firmware still isn't available.
> > > > * Nvjpg firmware. The driver is awaiting final approval, probably
> > > > worth it to release the firmware with everything else.
> > > >
> > > > * T194 nouveau firmware. This does not have driver support, but the=
re
> > > > has been some interest in working on it. Making the firmware
> > > > available, even if it isn't merged to linux-firmware, would be one
> > > > less blocker for someone that doesn't work at Nvidia to work on
> > > > support.
> > > >
> > > > Aaron Kling
> > > >
> > > > [0] https://gitlab.freedesktop.org/drm/tegra/-/issues/4
> > >
> > > I will continue to look into this, but it'll not be high priority. To=
o
> > > many other things going on.
> >
> > After some discussion with nouveau developers, it was pointed out to
> > me that the gsp on ga10b doesn't do much and the setup is more like
> > prior tegra gpus. And that it wouldn't make sense to support ga10b on
> > nova. So I would like to expand the request for gv11b nouveau firmware
> > to also include ga10b. Perhaps not directly pushed to linux-firmware
> > until they can be verified working, but made available so driver
> > development can happen.
>=20
> It has been over eight months since the last response. Nvjpg driver
> support has been merged in the meantime. Has any progress been made on
> any of the firmware releases?
>=20
> Aaron

I have the multimedia engine firmware files on my todo-list. I'm
planning to send these out after Tegra264 VIC support is ready to send.
Unfortunately there have been some delays in that.

Mikko


