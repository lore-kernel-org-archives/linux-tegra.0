Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF0B3F23AD
	for <linux-tegra@vger.kernel.org>; Wed,  4 Feb 2026 13:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770210164; cv=none; b=f+bDih266QBn7DElsAF4WviSOlKEJ5e9YQUjN3cD8UQXGFD/khRfFU/jDWLSyp7mmiJjuUxpY4SdxHOaKc77pQin9lQeE/c476KO25d7oqUmuSJ7PFNJpUFP98Vdf1gNHrPVuxSRSDEJhPtuWzklCC0SBUGW8IFnvI1gLIDTbIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770210164; c=relaxed/simple;
	bh=I+ebxz3GapT/F42T4+CxRemWso5iJAqp78kDiVsXGsA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f2FA3PVgm3okMJA0t6gNYNgUm+VCrc9fECr+HWd3RNr8z3lpOju7tqRBq+tgPvlCQF7gzVQqq2PpZQBRlPJPZ6xR1V/DgOTgdrfv1FmnPXtpLJRvhnlHMMjqCwT64zQYzqgG3uBhCnrovAA+TEROUK+GZmieJ8euColF4bkvLkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k2SMLjeo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k2SMLjeo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0444C2BCB6
	for <linux-tegra@vger.kernel.org>; Wed,  4 Feb 2026 13:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770210164;
	bh=I+ebxz3GapT/F42T4+CxRemWso5iJAqp78kDiVsXGsA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=k2SMLjeoMxgqrP9O11yM0THTNFof0IyFuplTiMntgVPmOeZQkcvvAKO4rYcZM9rcr
	 5+l927RQxN5kEzCB9av0ZCrRydtWDOiP9+/TIdXNoFYgOR2U2W/E6Tw2vjK19Keg46
	 RSfnHwXJCj8G4/vlnBQvKr/DbscynCXb3Dv0Wd6rXpnUKLapKAG7P9gPVf+blnU4No
	 eRtHnB8NcsDen4UzMgA7UMlwAm8tE1+QyP4Ni34z6566CVPxaAgoElV30r+jpwqIu1
	 VACtYgRemTiw0WDa8bvR3BP47qYYySIbO1cM2VblmJlkxUGMBvCyXTkLmyM1Wq907B
	 La+z0mO1Tt1eQ==
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6630d0685abso3668809eaf.0
        for <linux-tegra@vger.kernel.org>; Wed, 04 Feb 2026 05:02:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWXFH7dzMWU1kgU2U32q6XQbz6acJc1+cshAwKgQ3KY6DAaf5XZ2OE9QUvxsp6Xxu15/5NT3U34FLlL0g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6MPHh1uTuBpIOFxlq8i4EbvcUpv+t6hPHs6bw4CupMca/hAlZ
	OIvCnKt1xBdztC135CiLrjU3eHeUQ3b5pD2g11PnfZd+Hx5soTAycVnbzPOehwBvsYUiuTJrC71
	W6PZBGRN09OMMlxq2s9erpyMGpPVDwis=
X-Received: by 2002:a4a:e906:0:b0:659:9a49:8eb8 with SMTP id
 006d021491bc7-66a23432fe4mr1265953eaf.60.1770210162665; Wed, 04 Feb 2026
 05:02:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260129104817.3752340-1-sumitg@nvidia.com> <20260129104817.3752340-5-sumitg@nvidia.com>
 <4432fa04-e67c-422a-aae4-2938be431985@huawei.com> <c96312c7-b13f-4f5c-9512-cc0382c1c77b@nvidia.com>
 <74f3e6cf-7c13-43e6-a8f6-2b46184b8ad6@gmail.com> <944fc140-e5c5-425f-a6ad-883e87eed8a3@nvidia.com>
 <CAJZ5v0hUdLsh8UK5G6rHHD49RQGYLAiU1J-11DK-fLTKnuqhUQ@mail.gmail.com>
 <CAJZ5v0ggzD0PEti-r20Sm-8n0gPigPh=NgE2Oa=UKzMmwB0jpw@mail.gmail.com>
 <211d9dfa-26e6-4fc3-b70b-f5fbca49e5fd@nvidia.com> <CAJZ5v0if=tMiyLB-efkzB67SniJS-2pCVv1-eN+vzZxqrdAM8Q@mail.gmail.com>
 <e7570bc3-5420-4743-8a75-8602559ca235@amd.com> <b8603fcb-b0ab-47da-ae90-e82f7b9bcd67@nvidia.com>
In-Reply-To: <b8603fcb-b0ab-47da-ae90-e82f7b9bcd67@nvidia.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 4 Feb 2026 14:02:31 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0h4yOAW5y-B76EooeBLdMBmmL1hRf3PZ0udA+FYR4EPKQ@mail.gmail.com>
X-Gm-Features: AZwV_QhCjeh-XYu45P0hnBYAXK49X1-cttxr4eR82FwIbJTI78XtQKvZNdg_NH4
Message-ID: <CAJZ5v0h4yOAW5y-B76EooeBLdMBmmL1hRf3PZ0udA+FYR4EPKQ@mail.gmail.com>
Subject: Re: [PATCH v7 4/7] ACPI: CPPC: add APIs and sysfs interface for min/max_perf
To: Sumit Gupta <sumitg@nvidia.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Russell Haley <yumpusamongus@gmail.com>, "zhenglifeng (A)" <zhenglifeng1@huawei.com>, 
	pierre.gondois@arm.com, viresh.kumar@linaro.org, ionela.voinescu@arm.com, 
	corbet@lwn.net, rdunlap@infradead.org, ray.huang@amd.com, 
	gautham.shenoy@amd.com, perry.yuan@amd.com, zhanjie9@hisilicon.com, 
	linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-doc@vger.kernel.org, acpica-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, treding@nvidia.com, 
	jonathanh@nvidia.com, vsethi@nvidia.com, ksitaraman@nvidia.com, 
	sanjayc@nvidia.com, nhartman@nvidia.com, bbasu@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 4, 2026 at 10:51=E2=80=AFAM Sumit Gupta <sumitg@nvidia.com> wro=
te:
>
>
> On 04/02/26 01:58, Mario Limonciello wrote:
> > External email: Use caution opening links or attachments
> >
> >
> > On 2/3/26 2:24 PM, Rafael J. Wysocki wrote:
> >> On Tue, Feb 3, 2026 at 3:32=E2=80=AFPM Sumit Gupta <sumitg@nvidia.com>=
 wrote:
> >>>
> >>>
> >>> On 03/02/26 18:24, Rafael J. Wysocki wrote:
> >>>> External email: Use caution opening links or attachments
> >>>>
> >>>>
> >>>> On Tue, Feb 3, 2026 at 1:45=E2=80=AFPM Rafael J. Wysocki
> >>>> <rafael@kernel.org> wrote:
> >>>>> On Tue, Feb 3, 2026 at 10:41=E2=80=AFAM Sumit Gupta <sumitg@nvidia.=
com>
> >>>>> wrote:
> >>>>>>>>> Hi Sumit,
> >>>>>>>>>
> >>>>>>>>> I am thinking that maybe it is better to call these two sysfs
> >>>>>>>>> interface
> >>>>>>>>> 'min_freq' and 'max_freq' as users read and write khz instead
> >>>>>>>>> of raw
> >>>>>>>>> value.
> >>>>>>>> Thanks for the suggestion.
> >>>>>>>> Kept min_perf/max_perf to match the CPPC register names
> >>>>>>>> (MIN_PERF/MAX_PERF), making it clear to users familiar with
> >>>>>>>> CPPC what's being controlled.
> >>>>>>>> The kHz unit is documented in the ABI.
> >>>>>>>>
> >>>>>>>> Thank you,
> >>>>>>>> Sumit Gupta
> >>>>>>> On my x86 machine with kernel 6.18.5, the kernel is exposing raw
> >>>>>>> values:
> >>>>>>>
> >>>>>>>> grep . /sys/devices/system/cpu/cpu0/acpi_cppc/*
> >>>>>>> /sys/devices/system/cpu/cpu0/acpi_cppc/feedback_ctrs:ref:34290401=
8856568
> >>>>>>>
> >>>>>>> del:437439724183386
> >>>>>>> /sys/devices/system/cpu/cpu0/acpi_cppc/guaranteed_perf:63
> >>>>>>> /sys/devices/system/cpu/cpu0/acpi_cppc/highest_perf:88
> >>>>>>> /sys/devices/system/cpu/cpu0/acpi_cppc/lowest_freq:0
> >>>>>>> /sys/devices/system/cpu/cpu0/acpi_cppc/lowest_nonlinear_perf:36
> >>>>>>> /sys/devices/system/cpu/cpu0/acpi_cppc/lowest_perf:1
> >>>>>>> /sys/devices/system/cpu/cpu0/acpi_cppc/nominal_freq:3900
> >>>>>>> /sys/devices/system/cpu/cpu0/acpi_cppc/nominal_perf:62
> >>>>>>> /sys/devices/system/cpu/cpu0/acpi_cppc/reference_perf:62
> >>>>>>> /sys/devices/system/cpu/cpu0/acpi_cppc/wraparound_time:1844674407=
3709551615
> >>>>>>>
> >>>>>>>
> >>>>>>> It would be surprising for a nearby sysfs interface with very
> >>>>>>> similar
> >>>>>>> names to use kHz instead.
> >>>>>>>
> >>>>>>> Thanks,
> >>>>>>>
> >>>>>>> Russell Haley
> >>>>>> I can rename to either of the below:
> >>>>>> - min/max_freq: might be confused with scaling_min/max_freq.
> >>>>>> - min/max_perf_freq: keeps the CPPC register association clear.
> >>>>>>
> >>>>>> Rafael, Any preferences here?
> >>>>> On x86 the units in CPPC are not kHz and there is no easy reliable
> >>>>> way
> >>>>> to convert them to kHz.
> >>>>>
> >>>>> Everything under /sys/devices/system/cpu/cpu0/acpi_cppc/ needs to b=
e
> >>>>> in CPPC units, not kHz (unless, of course, kHz are CPPC units).
> >>>
> >>>
> >>> In v1 [1], these controls were added under acpi_cppc sysfs.
> >>> After discussion, they were moved under cpufreq, and [2] was merged
> >>> first.
> >>> The decision to use frequency scale instead of raw perf was made
> >>> for consistency with other cpufreq interfaces as per (v3 [3]).
> >>>
> >>> CPPC units in our case are also not in kHz. The kHz conversion uses t=
he
> >>> existing cppc_perf_to_khz()/cppc_khz_to_perf() helpers which are
> >>> already
> >>> used in cppc_cpufreq attributes. So the conversion behavior is
> >>> consistent
> >>> with existing cpufreq interfaces.
> >>>
> >>> [1]
> >>> https://lore.kernel.org/lkml/076c199c-a081-4a7f-956c-f395f4d5e156@nvi=
dia.com/
> >>>
> >>> [2]
> >>> https://lore.kernel.org/all/20250507031941.2812701-1-zhenglifeng1@hua=
wei.com/
> >>>
> >>> [3]
> >>> https://lore.kernel.org/lkml/80e16de0-63e4-4ead-9577-4ebba9b1a02d@nvi=
dia.com/
> >>>
> >>>
> >>>> That said, the new attributes will show up elsewhere.
> >>>>
> >>>> So why do you need to add these things in the first place?
> >>>
> >>> Currently there's no sysfs interface to dynamically control the
> >>> MIN_PERF/MAX_PERF bounds when using autonomous mode. This helps
> >>> users tune power and performance at runtime.
> >>
> >> So what about scaling_min_freq and scaling_max_freq?
> >>
> >> intel_pstate uses them for an analogous purpose.
> >
> > FWIW same thing for amd_pstate.
> >
>
> intel_pstate and amd_pstate seem to use setpolicy() to update
> scaling_min/max_freq and program MIN_PERF/MAX_PERF.

That's one possibility.

intel_pstate has a "cpufreq-compatible" mode (in which case it is
called intel_cpufreq) and still uses HWP (which is the underlying
mechanism for CPPC on Intel platforms).

> However, as discussed in v5 [1], cppc_cpufreq cannot switch to
> a setpolicy based approach because:
> - We need per-CPU control of auto_sel: With setpolicy, we can't
>    dynamically disable auto_sel for individual CPUs and return to the
>    target() (no target hook available).
>    intel_pstate and amd_pstate seem to set HW autonomous mode for
>    all CPUs, not per-CPU.
> - We need to retain the target() callback - the CPPC spec allows
>    desired_perf to be used even when autonomous selection is enabled.

intel_pstate in the "cpufreq-compatible" mode updates its HWP min and
max limits when .target() (or .fast_switch() or .adjust_perf()) is
called.

I guess that would not be sufficient in cppc_cpufreq for some reason?

> [1]
> https://lore.kernel.org/lkml/66f58f43-631b-40a0-8d42-4e90cd24b757@arm.com=
/
