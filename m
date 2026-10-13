Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011024.outbound.protection.outlook.com [52.101.52.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD34D388E6F
	for <linux-tegra@vger.kernel.org>; Tue, 13 Oct 2026 08:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791881396; cv=fail; b=AIt3DKR9Dby8Fcktd8JuiFkf/YNqHnGEPLnYr37H1UT5/+q95zZXf8ctaCjzQ3apUq/9IIZVtR224/1KZMvlwNgLN3pArFxzroJtEdld9n71XYK6tqi3qJtwZojSkcyChK8igX8S15/X4g/eXnYNL6EtZzuju61S7hivnch7Szg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791881396; c=relaxed/simple;
	bh=xUL+xO7f3QEkGtG020qR0pxVYlnCIowhOQHuXWrp3BU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LlDGjqxZ7BbAxI0HBoGLAaA5RM/zPIgtyTOSW45yb5ZNvcNOOxiId365PgDfDwDXViVQA31QI9AyiKsLVPGRx4KJl+iOXdUR3SVnixQGk7yeOvn2LpXkYJ2OFikbbRmaOD3iWUia9M2YeMZ5yr9ml3ku3F2eyLyjnY7UanjkYsE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rA+o/dfk; arc=fail smtp.client-ip=52.101.52.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rA+o/dfk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L6b/o2558jFyhhxamiXAn1zO3vvVhY0fIEyBIRbvos6Tghl16mgCaNLenbQXYopAJQ7AwWWIhLJFfm3HrAWdre9zGyXmSmtF4ouiGjN9mMkidtp2d25mtA6bObIXkku7XNk5m8fhUjWwvvKnedLsUVvtvC7J1DcHv74jxEGnrJbq5MJwroblPia59puq3JYkSlD2+sivGLwZrYcFdhpe9exAtn0i39YJEewFa3yYBL4hOYHZZeEoQGECmlI4ycX65dz3FxwESpVEx8+lnCQnA1blhpjmXjSz+7KNvR8j3c9Difm4ckGV49wvX1yDSOF2cH/oLXWJx3G+TAcixVf7oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LK0pDpA5UzN8HOBv9pD23iDZpIfink6zT0kvTumGElg=;
 b=N+GH0F0HvVnaPw+AJyRNKjJFluCCg6Y7KSwffTRYCs+COwfROld5hP8coRAl/G7t2ap07BCfNZAnryjPYg20X3C0qN8iJHia4rfcH7c7GCuPQYELOTnydW3nyEo8roH4pZx2qQMqRQswk2emtifrZ3E975+KyBy/W4tledvZ5hd1sVYbuGna31t69GMXg6UQxTors5RaiSZomWHw0bLzU3nC7UfZVTUKJ7Pz67YZQ+9zEyhRF33+5UqcB5LKWCy8EmBOhT0GgumkHlYv42hpVR2493qw/cEfHz+Qrh3AHLRbhEIz3KA1KB7CFG6nFd0YqR/2HRpsQncFJULFvdJY8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LK0pDpA5UzN8HOBv9pD23iDZpIfink6zT0kvTumGElg=;
 b=rA+o/dfk4G1tuIfgQPgKJy+k8g/8iRHlIibLuiwunyM+abSs0IbN29ZtdtoDr5gla7qNMwuyvmJnsbaKX1TNh0yOY7vHQfWciYjB4g2pC8R51YasHKPQiURy8gZYei1GKgS1v/kwDfkbRatcrTHSahCNKgSmMdkvlCX6JDm0k3RfrshD6Iq3isiTNk8S5MHxzhabTmpIhX4TAsT597rKzf1l787P9gafSYuBHJBsTa4mFMhh1EUaMTmtXfHhO824VKj2vbhgnw71Fdnh18CJM9t2cAMSnaSEaEZbJdTSp8t9fEm8OSmzmOe6Ebg7JJTtJsJPwPyEFWC4RUOadXgzag==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by BY5PR12MB4226.namprd12.prod.outlook.com (2603:10b6:a03:203::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Tue, 13 Oct
 2026 08:49:51 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%5]) with mapi id 15.21.0496.021; Tue, 13 Oct 2026
 08:49:51 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Aaron Kling <webgeek1234@gmail.com>,
 Thierry Reding <thierry.reding@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org
Subject: Re: [REQUEST] Release Firmware to Match Current Driver Support
Date: Tue, 13 Oct 2026 17:49:40 +0900
Message-ID: <BMe1VOJ9Rf6tF74Mkc7tPQ@nvidia.com>
In-Reply-To: <aoQ4he4rBJSTPBbR@orome>
References:
 <CALHNRZ8uHmx3nqpg1-F6RCprDavx3nY55en5gJds54RU8MDR5Q@mail.gmail.com>
 <CALHNRZ8PcnQ7mHwpvJwk29N0FvTh2vqZSBhfE4ckf=78NkKEHw@mail.gmail.com>
 <aoQ4he4rBJSTPBbR@orome>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TY4P301CA0105.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37b::6) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|BY5PR12MB4226:EE_
X-MS-Office365-Filtering-Correlation-Id: 44e79dc3-a5bb-4238-e133-08df2906f196
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|1800799024|376014|23010399003|18002099003|22082099003|11063799006|10067099003|4143699003|56012099006|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	qn6V78nqp4H5o0u8XTq9+rP+jhN9nC+/KUr+YNGycfDsqtG4PM+CdIpbQsBw02DuaG4rI32iTuuSzpDpsqmgRAiAPADzZvyQjafTO+hHsgcwoLeLHn+ORio6fFS23Nz7AjwYFNaAaAUHz1Kb65ocHWvqDxT2ScwoX8+lFhWg4gkQ2bv5Q1QLxQAjEcQ2evvOV/QHpGCHZJKaM4S9a2aeLNkq0TNYNSLNyKfT74pBXfmIUljDgV/gM3Z45b+0SJbJYqYFFGNOJV3rNjDD2RokxfaOCOBlE1SrUge2FfGvLNN0qHhshG3DaHSw7fdZA5YXCsKjLWfWDWvA5D+WqXJnNCChSkE7zYBWMEbrrLX0z4ADzLxLTdoItBOL1An/FBfR7xMe2bUdwqaUH5YIncbXJssfIekVrsJkhpHXt5RZCXNlhcH+K7KjISusRGR7tkin7OxHAKyy7GNNRToR7oQYg4fOGg0j1r2W4709w+Dfz7YLq2hJEs+uz3X18+XgFF4tLY+Dr0hkSznD3wo+0UYkJUBgGcZzD4ITYWmt0DJlbiJ51VuEel12Zk9NebqTEENqLDINO2XhWetw+xo9WpXqJTzx2QpqaG7qZm/0I2xAtH2FHbl/dc1G1Fj4gtuqfGFDFsBJLIpBuBRApsw66uJoEJA+ttO3zVktTmPRGn9kJCk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(11063799006)(10067099003)(4143699003)(56012099006)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Snc5OEVkWWtPcWJnb2FMYkxlZGYvWGpNY01SSTNJelBQZXVHcEE5dm1WTkRE?=
 =?utf-8?B?dDEyUTJQN1RsbENDSmRWOSt2aGlvSWlmNlIreWg5bnZEN0tVUVJBc016YUoz?=
 =?utf-8?B?OE1Mc0ZZWG1EcUNRZHR1cXlnbG5adk9TOGRsem1rL2dtZlplRndySjIrNjRI?=
 =?utf-8?B?b0VXU1ZJVmpMb2tHT0E3cjFGbjR3a1dvekF5dVpnRVU4WkdGVHVxdDVyc09F?=
 =?utf-8?B?bkJ5NU5rR0NlbWxueGxId1FudnRreStSclhsNW5QOTlobElDSUVZNE0vUkJq?=
 =?utf-8?B?R0tYd0FLb2xtdGhyTWJqbEMzYXVMaWQvRXg1eHhTVjVaV0dDVVVCTGtMZVN5?=
 =?utf-8?B?S2pUV0x6S3dHOWZ6WmxWVjk4VlQ5L3dzRThobFNRckhsN2tnaFYxNVRSak9F?=
 =?utf-8?B?T3M2SlhZaFo3VjR6Zit3a1Z2Umdvc3F0SDJvUisvZVZMQ0puTnEwamMxM1Uz?=
 =?utf-8?B?SkFBWXlLYytWTk4vbFFibGY1M0JPTkFDaE92NG5oVjRVc05IUnVDNHdEakFz?=
 =?utf-8?B?L3V6OXZhQnVvL2lkeS9McDJtTkRYOFVyRjhsazZRWmJ0SmMwQmNSSmRveWcw?=
 =?utf-8?B?cEFheXBobnhUOVVMakNyNXNsNnV6djNtdkJ2cmVmdEhxSlRNRXNMNUlPdUps?=
 =?utf-8?B?eGEvVEFFNnU0dk1zZk51aFc0ZERhdkNXWjFVN2NIMUNHWFJVMzlJbXduNkdC?=
 =?utf-8?B?NEY5bGlaT1RFRUhIaEZjTXJIMmZ0V3JZdGg0d3lVemxiUmd6dkNsUnpPYWZR?=
 =?utf-8?B?ZlliL2crS292MDdhUXpqRmZ1V1pIQzB2SmtTS3FDeld2bUJSRkFKNDVsTnNQ?=
 =?utf-8?B?aUNRbHFWQjJuT0k5WXpIUXVibmpPazNxa0ZUc0dHc2E2VGR4UGdqNEtWU1h0?=
 =?utf-8?B?R1hFazJlL2MwS2VFeC9SS29UN0hydEhkTkdsZ0dHUTNiWitTSWlJQktTOGpL?=
 =?utf-8?B?SUphZmVCNGQ2T2lBc0U4YktMVXF0amcrVEQwVG50YkozSm1GYlVEOGphc0Nj?=
 =?utf-8?B?b1FORUVYN1oySUFaV25qTnFTenJlTTQ2U2RoTUVSTlZvb21ZWXJHbGJMVFNQ?=
 =?utf-8?B?T1NNUkhjeDRmL1FiZjFTWnhObUNYNlNhanVIVEVtWHlObkt0WnFXakN1YXRa?=
 =?utf-8?B?VUc1SVhIT0todXhheTV5RGFGSGFkYUd6QUFmUkQwa3lJUHkrV1d0ZC9tZXZw?=
 =?utf-8?B?cnZoUEJRYnJWK2FSdW9lczZLRlY2b1JwZG9oVjNtN0h5SGVPRnJXR3RNSHgr?=
 =?utf-8?B?RnE5U0J2VlAzeGFVT2JDREptOHdUZWtyV0tUVVMwc0tDdHIyM0hGYlFIdlk2?=
 =?utf-8?B?ZGlUS2dNWnB4Q3dxbkNOTmVNVWp4Q2VUTWhlaVlOeitNaFB2eHF6dm1rYit0?=
 =?utf-8?B?MEM3eGdUY21PdUcyeUVWNmk3ZjBYOE82c0w0bHU2cGxERGlJeFpmM3VqMEk3?=
 =?utf-8?B?R2U2SEJ3ay9ZYWx4b1IzZHFZcXkyWmRzN3RONndYNnRZUDJHS2ZHb2dNekVI?=
 =?utf-8?B?ZHphMVNqSzlzNk93azJzUWxURUlFTTcyZCt3L2krTXkyaVAwZ0VMcmo1ZEpU?=
 =?utf-8?B?U2hIazFhUHI5MnZIdE5QQ2Z2MnkvQzE4aFhVcW9xeDJ1QW55bTVVL3RTQkVy?=
 =?utf-8?B?Nm1RbUE3MnFxb3hqejhzQWFtSU0zdFdPbjFwVnBIOUtMRWNFb293c3pBMjNC?=
 =?utf-8?B?U0lZVVJPMS93ODY2Z2tFNmZRUnRSNHNxMkpJVlY5dGZSUXVPVEEyTTJpenps?=
 =?utf-8?B?VHV2WjhaOSs5ckM1Zlc2RzNudXh2bFdaeFd0M2tRWjFROTR3WkVSaFhueitq?=
 =?utf-8?B?d2ZjdVRnVlNhQTlmblZFcHh3OXlWMlA4WlgweWZ0KzZuRmFsZGQ5VFFGYVc4?=
 =?utf-8?B?aXM2MUozVUFwVzZKODJqQlRvanU2RUpnNlI5Z3BXVjBtUmJzeCtZMWt3L0RP?=
 =?utf-8?B?c2dYTTdkMVpjN29BUGlQSzBpaDFTYUtvdDhLek1BckpNSnVSYTVLWHJXdXZR?=
 =?utf-8?B?V1lzZld2L1UyR1JOcmttZ3hCckNGMGpFSXArMWtYRzVWUC9heHljZkdLN1hW?=
 =?utf-8?B?bGhMclJrcWNRWmJpejRyWmRIUjg4MHZPKy94VkJhbmd4Um9MZ0R0Q0p3ejVZ?=
 =?utf-8?B?b1BvR2JyNmJMMXk3VlMrcHd3NkVnQkg2OUNHbGlOcGFkMFgvZ0cwOVRGWnVR?=
 =?utf-8?B?aUswZGlvcitWQ0M1Vnd2Zmp3S1EwQUtBSGVaQWlVZjMzZDFXczFPYzFMSVU2?=
 =?utf-8?B?UXpHNFg3cmVpRVB2TW1HOVhwM3JJUlpZSW5wSVBtbGF0WkdSMDVzRkF5bmtu?=
 =?utf-8?B?R3RkbFdUdnZDeGZhWDFrWnJpOUJNaW1iUTRtanY5bC9ZZjVHNkNRVzdrWDJi?=
 =?utf-8?Q?aqyh1qxiUnR5KJQlPkzE5Nd4M2KA9AxoOdHGWPOlvcMT/?=
X-MS-Exchange-AntiSpam-MessageData-1: 4Je7ijS0yCs9Ng==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44e79dc3-a5bb-4238-e133-08df2906f196
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 08:49:51.1751
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BCnYuluOO0xSnc0NuKWyuxiJUgChroko8sWCnu+vb8tsKWo0VgFFRGO/DM+0nw+okyAvRYy5jSLhrQqIbsD/WQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4226

On Tuesday, August 18, 2026 7:49=E2=80=AFPM Thierry Reding wrote:
> On Mon, Aug 17, 2026 at 12:17:27PM -0500, Aaron Kling wrote:
> > On Mon, May 11, 2026 at 3:02=E2=80=AFAM Mikko Perttunen <mperttunen@nvi=
dia.com> wrote:
> > >
> > > On Monday, May 11, 2026 12:05=E2=80=AFPM Aaron Kling wrote:
> > > > On Fri, Nov 14, 2025 at 2:17=E2=80=AFPM Aaron Kling <webgeek1234@gm=
ail.com> wrote:
> > > > >
> > > > > On Fri, Aug 1, 2025 at 4:56=E2=80=AFAM Thierry Reding <thierry.re=
ding@gmail.com> wrote:
> > > > > >
> > > > > > On Thu, Jul 31, 2025 at 04:22:32PM -0500, Aaron Kling wrote:
> > > > > > > This was originally discussed on the freedesktop issue tracke=
r [0],
> > > > > > > but there hasn't been a response there in 6 months. So I'm re=
opening
> > > > > > > the discussion here.
> > > > > > >
> > > > > > > * Nvdec firmware. The driver has been in the kernel for over =
three
> > > > > > > years and there's still no available freely licensed firmware=
 to use
> > > > > > > with it.
> > > > > > > * T234 vic firmware. The driver has supported the arch for al=
most
> > > > > > > three years and freely licensed firmware still isn't availabl=
e.
> > > > > > > * Nvjpg firmware. The driver is awaiting final approval, prob=
ably
> > > > > > > worth it to release the firmware with everything else.
> > > > > > >
> > > > > > > * T194 nouveau firmware. This does not have driver support, b=
ut there
> > > > > > > has been some interest in working on it. Making the firmware
> > > > > > > available, even if it isn't merged to linux-firmware, would b=
e one
> > > > > > > less blocker for someone that doesn't work at Nvidia to work =
on
> > > > > > > support.
> > > > > > >
> > > > > > > Aaron Kling
> > > > > > >
> > > > > > > [0] https://gitlab.freedesktop.org/drm/tegra/-/issues/4
> > > > > >
> > > > > > I will continue to look into this, but it'll not be high priori=
ty. Too
> > > > > > many other things going on.
> > > > >
> > > > > After some discussion with nouveau developers, it was pointed out=
 to
> > > > > me that the gsp on ga10b doesn't do much and the setup is more li=
ke
> > > > > prior tegra gpus. And that it wouldn't make sense to support ga10=
b on
> > > > > nova. So I would like to expand the request for gv11b nouveau fir=
mware
> > > > > to also include ga10b. Perhaps not directly pushed to linux-firmw=
are
> > > > > until they can be verified working, but made available so driver
> > > > > development can happen.
> > > >
> > > > It has been over eight months since the last response. Nvjpg driver
> > > > support has been merged in the meantime. Has any progress been made=
 on
> > > > any of the firmware releases?
> > > >
> > > > Aaron
> > >
> > > I have the multimedia engine firmware files on my todo-list. I'm
> > > planning to send these out after Tegra264 VIC support is ready to sen=
d.
> > > Unfortunately there have been some delays in that.
> > >
> > > Mikko
> >=20
> > The Tegra264 VIC series has been picked up into -next. Is there any
> > update on the firmware release process?
>=20
> We're still working on it, it's just taking a really long time.
>=20
> Thierry

Firmware files for VIC, NVDEC, NVENC, NVJPG, OFA, and XUSB for Tegra124=20
and later are now in linux-firmware:

    https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware=
.git/commit/?id=3Dbdeb9f0f93f18d10b281217e66e81838527ce55a

Thanks for your patience. I was about to lose mine a few times.

Mikko



