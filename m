Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010027.outbound.protection.outlook.com [52.101.201.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836C63AFD07
	for <linux-tegra@vger.kernel.org>; Tue, 13 Oct 2026 08:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791881487; cv=fail; b=ldfeHw/dR61EJaCgu+50MYxBLVm10uCNZThtJoCtjY249G36V+DggT1mnaXIXz71uqMePybsZGE9p44kr60yBLDQoW7kOb+bmpdfqwDKz66ZZ3sOnqCzylrqcjWCJyA/RaSSk9HHiLYgL8riMatfWFvET0eNrzL9clpUbQSuljQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791881487; c=relaxed/simple;
	bh=TB6gcYvvZ+f7pSG3JOqBxgGTOejQ/Qw4ShJ5SMXEmFs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XqXKpp1VWtkusBhT+xNNTl8Na+E106/3IgsVU3vESt4AD1Gre2vmjuoLvyAnDkAaYzGQHfJeV9W0Xw1/WIMsbvfAENxeoHsd22WYVu/prJRCVJ3JbXCMesoMCudNS56eaQVuIJzt+ZI3FMMugx4cWUvaIivVo46IoL9GpfMUIo0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=PNKiSlRV; arc=fail smtp.client-ip=52.101.201.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="PNKiSlRV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TLeMfVu0AF1v+6vmK0pznP0rwKP3yU+eAXfGx4dwNItx1DdFQwYrxKHni/19V9kj+T1Sic0Msahdz/LykACsepki1O5jqP4abjtb6O9663TE5j3KGKPZwUc+m0sxa2m9y36Be5U5jIlkU+8u3pyrIwaM4qI8xhEXBsRlNNDkLlKYR8Jpp44XL9xqKIg4FnsBZ91KXsyWWuW+k9UTyubg39SCMvHJl+7tgbkyO8WZIb/24akaDR/an7DRGMPN7SIYgjjFtnJtKQnP3xm7aP+KETpjXr8xndWXksEqYrUEO9IGrz2Jwz2KivrbIrsmzl1S/z2tNuIySUBZz8EiIrqteg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t6Q7rwM4SmGnECPIs7WE8d425h940haE+TccVnsoIQs=;
 b=jyfgFn75eWA1YugYZc0Pbhv39cqb3JNr/T1Xp/VMVLZnwjxv06UepQwQrSBRFkDy0LjBqLUU6FQjUy356ITOYfgBadZKbE6Xe97mbRksf6Dm1HuzMN0ZnoaL6XuPLNTuoJP3PLsPYL2u9Rk1nHgmBWjS4qkiKH0kkZGbTXOEGVWhgELkW5f77uXhdEIq94xRwvJS6iPG6HV6Ac9C/9fIX5AsAGBvEzEpxZg8w8rFiNbfWZZVh0joS494GO3uunl85hEV6bsm4YKkUCTQZmHUCxYT4f28+EY8RIHBBCsHo6dIuwyWY0I7CiLOE27Onund6tPmpGCa36dVovWFcc1zyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t6Q7rwM4SmGnECPIs7WE8d425h940haE+TccVnsoIQs=;
 b=PNKiSlRVhkC6Qz8H0FgPpwrgUh9j7BNsf79398zIAVk6yGeMFGM55GFe6utKRTUCgFR/PAI23cHUUwwcsBlOMSxZiiDvoP1FWyjyoDthrtWctOcZQUGesYYnMR85Jas1mw5woRiB+sFsBw8aijnoUc8Pq6S2i+e5N3OL6otiZY8GUxnnsj40c+W43WOrrOk1y9l1pMHRv9EXWkBWdr9Cyq9rr0g2QxmGmWyw53traWHHHMPciAsuV2zeiz6Ac+jrsuEDqa4owBc5u0TpFOTRqqM7uTB/FMqr9+BBaILUqhWXVcGiW52c04SJqzeLoWPKEB8jqthKydaGOxcp1gBR0Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by BY5PR12MB4226.namprd12.prod.outlook.com (2603:10b6:a03:203::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Tue, 13 Oct
 2026 08:51:22 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%5]) with mapi id 15.21.0496.021; Tue, 13 Oct 2026
 08:51:22 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Aaron Kling <webgeek1234@gmail.com>,
 Thierry Reding <thierry.reding@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org
Subject: Re: [REQUEST] Release Firmware to Match Current Driver Support
Date: Tue, 13 Oct 2026 17:51:20 +0900
Message-ID: <YuEtlKWiT96iasuBtZCX1A@nvidia.com>
In-Reply-To: <BMe1VOJ9Rf6tF74Mkc7tPQ@nvidia.com>
References:
 <CALHNRZ8uHmx3nqpg1-F6RCprDavx3nY55en5gJds54RU8MDR5Q@mail.gmail.com>
 <aoQ4he4rBJSTPBbR@orome> <BMe1VOJ9Rf6tF74Mkc7tPQ@nvidia.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TY4P286CA0092.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:369::8) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|BY5PR12MB4226:EE_
X-MS-Office365-Filtering-Correlation-Id: 16c4bee4-9e45-49ff-abc8-08df2907282a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|1800799024|376014|23010399003|18002099003|22082099003|11063799006|10067099003|4143699003|56012099006|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	Sc3Ux3vC5NSZBe4uJUvHUdDQiOabf5380oy9gv6xG7lWn5LVxJbuQcjbmyUCKUckzrsH/wnOUEjMRtnWBz/yIyL3/MDKsg52rx1UgJeWjt30v4zGNQs6s1o4Mrgvy1/r3QX4W3BwT2OoAp1vMgMbAOUkWJeTXk4sCxinwzMnAsp5DeBXHG+OzlyDzgb/Eby3xPGb5DgLP6Sjn/9NIQJ74owOHIzjyKVszICaOnhmJtl37sBmvjXggQXCm1bwPbENlJdbOsAlVmbcji8aj189/bo1Vm4FJNfJ6OFSI3Xd7abwxNU347OiWrRob5+lNh06D+E4V+DeI+Ai3CRtjquEjKfan9xknR0Noz4dEAz4Ve+T5ul2AwSheI9g2V9Tfs+PkwzQePbm/ebBhGVHoopusp6AL3TT+iLOxiAqX35t0Fhja37i9WvGfXjD8uRU/6Rjb0wWym1+p+c8+EQOsSdNsAu0STja+UsDHHcqVuLUpX31/rYDmeqsSmPvYfR3RYpoAwq9tZdW+m9+C7VsxoA2G4RL3OWxNvAPnGEGhSO4j9KO1FTPr/xmgT94XUr60q2erXyx4PJKAsAJnhDejAd4TkdUL50oE4xW7Q8MZ222X8G5IJ2vrEVlBjPKqliZ2ObAguQ4ddm5VA6Vtkni3SI9jUEHWZXz3j0vKRkn6xg31no=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(11063799006)(10067099003)(4143699003)(56012099006)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WGZ1ek5ZdFV1UHNTdGxIbWpEcTd6VDZPNk9kM0I5b0ZNN00xRnQvY0tDV1NH?=
 =?utf-8?B?VXduZUpCb3h0aGQ4alg1WmM4RHRRdmhOL01uSHNvOCtsZDQvYlVLQVh1aHZv?=
 =?utf-8?B?aWREMUxjaGR0dm5BVm9EaUFIVnFuYXlJNXdjWE82bWxTRkJjRWZacWZIdDhn?=
 =?utf-8?B?a2FpRGtWVUl5VHFLdnVNVWR1NGhsVk1FcEp6ZG4xUEtUSVVIWXh0bXlRS2Yr?=
 =?utf-8?B?UEpiM2RlOExtenRaUXFKY05CTzhwSHE0a3JNNTNVZi80eGdlcUUxb1oyem95?=
 =?utf-8?B?OXh5cnVxTElyQXlnUk9hL0pHRHRacGtiYTFJUWx5ejRlc3BiZC92dzlTbVgz?=
 =?utf-8?B?WlZGc0xqKzhySDZBUklOSVdCeCtBNHIyL2UyRzQ4WFIzUm5EMjR4MVhpcUdz?=
 =?utf-8?B?RTN2ZmVRYVFnOG44d1dNYzdzRXptQ2ZMZHY2NCtwUEl5bTRjdDFjaFVXamRP?=
 =?utf-8?B?REY1ZU0rRVZHekM5aVFXalpETGh2MmhyZXBsZ0NhMmkxdC9TbHJtQUFFQWZH?=
 =?utf-8?B?Rm53dldZWFdRQWtuL3hhYTRQYWE2dU04ODRwMTFDVEhSTWlnRkIvRkV6d0JW?=
 =?utf-8?B?VVV1YkxWdVQ4QmxaVXh2NVFCZnJZYkFBNHRmc3Fsb0ZFZTh4VzJCbzFVcVJO?=
 =?utf-8?B?d2RjdktUT0FoNFU0TWJlcExEdkpCMGNsN0l5dVV4MDYyWmJKeDFpdnhzeGJZ?=
 =?utf-8?B?a3dBdEYyaVY4cXRqMFBxZGgwSXYzVmVIbjBoM2JBTEMyaVIxVTZNWGsxVWNL?=
 =?utf-8?B?NGN3czFCNmpkL1lQa21ucVdVRGVuS3NRUDM1d3lUYUJiOFMxVTdlK1d4QzBm?=
 =?utf-8?B?WFlMY0g2b1RsRU42VjVYZ2hQUE5OaENXYkFic1F2VDRIRG5ZMGszKzJGQkhj?=
 =?utf-8?B?d1dPR3RlZE1HelkxSHlaY2c1c1JwWU5aaWZxdnp1OUFGNHNLc3QweXJ2OWVw?=
 =?utf-8?B?b1BMbEtudHhxOE9XcXJzM2gyMEhGbWdkaFNuS2kwdGE1S1hZS0NXUDVlMjFy?=
 =?utf-8?B?dG5kUlZMcGVwOStWbFJ3TDNTZjNHeVhxVDErbHIvZ0ZYRFBMT1Z1TktyR2la?=
 =?utf-8?B?ZVdzUGNuVEVud2ZMNjA2TDFUcVRNRmNHb09tMHI3TzE0Tzl1c292RlBBa094?=
 =?utf-8?B?MHZMb3Q4Y1VLRGFkUG9lY0NRVHg5NTd3eDFoZ20zUnhGVDVnL3FBOE1CUUVw?=
 =?utf-8?B?ak5uVFBzcVE5WkpEZWtOZmFuOVBocVlrMUVwd2VDVDd5THI0VitFcjUzK3Yv?=
 =?utf-8?B?VHVrM2NMRXJJdmlFNFUrcE1KeVJzVTVsck9Jc1EwMC9lcVp1Z2dJRllSbW9M?=
 =?utf-8?B?Mi92cnYwSFRvUC9UcG5MVGYzcTkwN1RsemVra2FKK1E4czd6dlhoTDlBaTBm?=
 =?utf-8?B?TkxXVkhvYWF6d1Q5Um5CbW1UQ2JkNUNqc3UyTnZxWFd5UVBRcHUzOTg2M0dI?=
 =?utf-8?B?SCtmVVp6UjB6bHQ1T0tSZmN0SEN5ckFLQ2ViY0pWMTlwNjVCNU82dzRrUmRN?=
 =?utf-8?B?QjIrQVpwdzJFS2E5RmN0YldHQVlaS0o0YS9qR1k2aXoyV3Y5TFlta1IzQytz?=
 =?utf-8?B?OGx4cmo2R293UDhsaTJMczQ3MlZkQldtU2VyOHU5VmgyR2lSVEMzbUdWY3cz?=
 =?utf-8?B?SjBnVEROS2NWcEVkVTFUL0ZkVGNrNnRIaU16NnpCbk8wOW1iTGFmQ0lpT1hL?=
 =?utf-8?B?aFFLVFpQQUxNTEo4T01ySnRsbG9tQld5Snl0K2x6ZUhIMTg2blFqbnpTdTE2?=
 =?utf-8?B?elVDTURoc0g3NjJEdVk1djFCclplMkVCNjVQT1ZNM1VxZDZyNWt1aFR2Vm9S?=
 =?utf-8?B?dllzNExQd2wwVEtBRlFGY3VjdTgxenJSeHdsNzFWdUJ0cmlZcVNuNDdzeDkz?=
 =?utf-8?B?c043SGJHRHRaeU5FcUtZWU9Wbytjb2Fra2NjdkhHTFVLYlArckdVQlRKeGl5?=
 =?utf-8?B?T0dJT0ZBMmJXODVxNW15OFZHK2ZyYTZJTm5LMFo3dndYU29CaHVLQlkxZ2ds?=
 =?utf-8?B?MCs5NlNNa3pqZEcwRVZueFFQME1yUjFnUmp1cjMvKzllWWJRbENsRi9Yc0RE?=
 =?utf-8?B?aHhZQTZCK1M3cFZRN1ZwUElMUi9OSDF4WnZrSlpFR3VHRzQrSklxU2FCU04v?=
 =?utf-8?B?dWxyYVY4dXBZVHlLbytMZjdsUlZZTjhCVkRtUzFScDdOTXU4cFF5ZHhIcE50?=
 =?utf-8?B?OHZ0OEphc2pLSzJTTXc2N0w2enhHdlg2Mm01WEUybzE5SkxrcS9CS3FNVlY4?=
 =?utf-8?B?b0NBTU1yblhFK0lLVzVDbk5MRk95b0NLWEVpeFFVc21tUXp4YTM2WUM0MXhG?=
 =?utf-8?B?NjNXVTY0OG5uNDZKNkJ6ZDg0UDM4UTRKZkgzQTEzZ0xQQTl5aWkyNFVWenE5?=
 =?utf-8?Q?TjumlZcDqE06oxE2D1Ng3W2eUB51A0VVlrpficPsqXtM2?=
X-MS-Exchange-AntiSpam-MessageData-1: Ncjvi4DnBwN4IQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16c4bee4-9e45-49ff-abc8-08df2907282a
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 08:51:22.8090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xqhMGW06hMF1aKqOPjHgeQX83nT9yremw9toTh96kvHWq9UF/f+6pSkOGzSKcjPwWb7UgCVUfpBQxEcts4dNsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4226

On Tuesday, October 13, 2026 5:49=E2=80=AFPM Mikko Perttunen wrote:
> On Tuesday, August 18, 2026 7:49=E2=80=AFPM Thierry Reding wrote:
> > On Mon, Aug 17, 2026 at 12:17:27PM -0500, Aaron Kling wrote:
> > > On Mon, May 11, 2026 at 3:02=E2=80=AFAM Mikko Perttunen <mperttunen@n=
vidia.com> wrote:
> > > >
> > > > On Monday, May 11, 2026 12:05=E2=80=AFPM Aaron Kling wrote:
> > > > > On Fri, Nov 14, 2025 at 2:17=E2=80=AFPM Aaron Kling <webgeek1234@=
gmail.com> wrote:
> > > > > >
> > > > > > On Fri, Aug 1, 2025 at 4:56=E2=80=AFAM Thierry Reding <thierry.=
reding@gmail.com> wrote:
> > > > > > >
> > > > > > > On Thu, Jul 31, 2025 at 04:22:32PM -0500, Aaron Kling wrote:
> > > > > > > > This was originally discussed on the freedesktop issue trac=
ker [0],
> > > > > > > > but there hasn't been a response there in 6 months. So I'm =
reopening
> > > > > > > > the discussion here.
> > > > > > > >
> > > > > > > > * Nvdec firmware. The driver has been in the kernel for ove=
r three
> > > > > > > > years and there's still no available freely licensed firmwa=
re to use
> > > > > > > > with it.
> > > > > > > > * T234 vic firmware. The driver has supported the arch for =
almost
> > > > > > > > three years and freely licensed firmware still isn't availa=
ble.
> > > > > > > > * Nvjpg firmware. The driver is awaiting final approval, pr=
obably
> > > > > > > > worth it to release the firmware with everything else.
> > > > > > > >
> > > > > > > > * T194 nouveau firmware. This does not have driver support,=
 but there
> > > > > > > > has been some interest in working on it. Making the firmwar=
e
> > > > > > > > available, even if it isn't merged to linux-firmware, would=
 be one
> > > > > > > > less blocker for someone that doesn't work at Nvidia to wor=
k on
> > > > > > > > support.
> > > > > > > >
> > > > > > > > Aaron Kling
> > > > > > > >
> > > > > > > > [0] https://gitlab.freedesktop.org/drm/tegra/-/issues/4
> > > > > > >
> > > > > > > I will continue to look into this, but it'll not be high prio=
rity. Too
> > > > > > > many other things going on.
> > > > > >
> > > > > > After some discussion with nouveau developers, it was pointed o=
ut to
> > > > > > me that the gsp on ga10b doesn't do much and the setup is more =
like
> > > > > > prior tegra gpus. And that it wouldn't make sense to support ga=
10b on
> > > > > > nova. So I would like to expand the request for gv11b nouveau f=
irmware
> > > > > > to also include ga10b. Perhaps not directly pushed to linux-fir=
mware
> > > > > > until they can be verified working, but made available so drive=
r
> > > > > > development can happen.
> > > > >
> > > > > It has been over eight months since the last response. Nvjpg driv=
er
> > > > > support has been merged in the meantime. Has any progress been ma=
de on
> > > > > any of the firmware releases?
> > > > >
> > > > > Aaron
> > > >
> > > > I have the multimedia engine firmware files on my todo-list. I'm
> > > > planning to send these out after Tegra264 VIC support is ready to s=
end.
> > > > Unfortunately there have been some delays in that.
> > > >
> > > > Mikko
> > >=20
> > > The Tegra264 VIC series has been picked up into -next. Is there any
> > > update on the firmware release process?
> >=20
> > We're still working on it, it's just taking a really long time.
> >=20
> > Thierry
>=20
> Firmware files for VIC, NVDEC, NVENC, NVJPG, OFA, and XUSB for Tegra124=20
> and later are now in linux-firmware:
>=20
>     https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmwa=
re.git/commit/?id=3Dbdeb9f0f93f18d10b281217e66e81838527ce55a
>=20
> Thanks for your patience. I was about to lose mine a few times.
>=20
> Mikko
>=20
>=20
>=20

I'd like to add that I'm looking at GV11B and GA10B support and=20
associated firmware as well.

Mikko



