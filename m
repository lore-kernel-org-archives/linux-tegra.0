Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F6829AB11
	for <linux-tegra@vger.kernel.org>; Fri, 30 Jan 2026 20:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769803665; cv=pass; b=pyCYubmaRRQ1edE36V3Xz2zuQ5bQEY85qRIj4G6fc8JJBU3x/MiNuY/OcUTAJn8zuKUzxcF+4DM1QtM5VhAHoza21nSpqL7bikDSt6W3GUzqL579dTsYtQTtRrWVaRrsGTvHN4rRe5cXUNhHS2dCyG9yvl1Bwme8Bc/wUT7F4Ok=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769803665; c=relaxed/simple;
	bh=JN6foRqG40JPLGE38gjlFr46l76oJx2SOKRwokKq1T8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c0UNlnNxApQrkD5NehDer/SDJsE/Fc0EcNmP5oKN/OqiNex2txx6VUX0AyG3q/FZzVGTq5LUqnNQfwWO8rb0VLLENCQVatTJNkAZbkHE06OpPJ/Pi04+0U8ZhwBlYMVEs03/mNMvr+jolcCTirWPbEpUTOas8kgv5LkU35FEFs0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ddyj3eEC; arc=pass smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ddyj3eEC"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2a8e4ae61a0so15295ad.1
        for <linux-tegra@vger.kernel.org>; Fri, 30 Jan 2026 12:07:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769803663; cv=none;
        d=google.com; s=arc-20240605;
        b=dOZ0d2geT8MfiKhErqKn7b1z6qGOV3e10Scdc1TLLLNSB3ilXWVoA90BIOlPby64OR
         4pbuTwhTP2OYpHJdCS/MoLDgksoPVjfjFbcyCDAop7+kN/iLKWLWaG58PBdFKV69grdw
         ShJj3IEV7mkQxwcBODZJFn/BcgMvdIE+9zF2lqTtncyA9+noM6keG398BxFUx2J6L+gz
         jYF3ky3ywhcUcc2jx/mp8e9AD68sbJbUQQCmMLQtGbnaDUYoip3RYEPav+o+5nigVxv6
         kGxx8frMUVWhpmx2G7S5xhQNOty7S/XWU5JjGD+LJah6ZoRtRZMk+nLHGrgUZzji9Rh0
         lw2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xfZ/yn2sX+8CvDNrIoBnhlU34L/OaV7M5POjaoUPrSs=;
        fh=o7I4y2GpDuyDxaDBvYJ5QaRRbL8n/lOIRcXh996goww=;
        b=aIpF0gvrgI915Tt90cyeMBl1jXxoDnttV0qb0AG9ZWFkUA+1oX08dkf+4clIvvH97f
         4u3HLDQFBvWeWl9qIOoBtFPPBysV3F1+hpS5uBiL4EOb9fLeXLg+aOxok99pG1c2vBZt
         kVzKVD6JjFHZmEjEphOaCYo7w3zLY+fZBHkQYY7+FuVYWAztrgtYjHOA+M41nq4Dry/X
         B5DrlYJ6RC36jjKgz3uhGcCiRKhn9PoDtWk3FjNpCbnMiTKC0pkEmqsZ/3WabBPJBHKi
         5I53GADXa/RdBDw8na4tQOodDtbOt9lhXE2v0kTkmPmXr9DIJXOMV+gD5YOpTeSFOdpS
         zPdA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769803663; x=1770408463; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xfZ/yn2sX+8CvDNrIoBnhlU34L/OaV7M5POjaoUPrSs=;
        b=Ddyj3eECiWcQOxTCLGp6hMoD8PP3lJ96qZMoAclBiJX1T7IB4ZxawYb9iYSB9JabD6
         Za5nOiXNgPtaT3ei9icAHpSugQN2sSzXRBucBaey1xQnVcB93MjmbvABdAgT1BK6XZpT
         TMAEKNFbMy9XFqg/UWzJTDNjLH1Qk2p05mWehwa2uV9KiO/1VVegfCifQG2uAGCAdGxU
         4/pZ72zNbI7fFfHYRbcTPhBv6WFE0JWsxwTwcAZPL2d9DqI+xRaocJ9GvLc6vMmbUgs1
         4KnIYaZ/xvCwOCBOJE3e6vuygOal0KBInCcPPyFdPQurUqhHiisO94cCQv0VySPGN93B
         6glA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769803663; x=1770408463;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xfZ/yn2sX+8CvDNrIoBnhlU34L/OaV7M5POjaoUPrSs=;
        b=MBfRR8CHCJSjpgqXYHc3WbcuX4bEq2a6fttL9bU+5InPOgCqMvv9BC7t08rFhqBEXb
         Z4BssrHBRucR6KQOwZC9/ZL1slbG4+v2XuCX/E/7VTVtxqsjhVuhiKvERvplmJBi2cYb
         oyaPSeF9OQa6DPSc0RF2pVgV/NVBlrGN1f0Ac03nMFp3O8gZCVaBOe8ZESb+oNRThTSe
         W5v/DKKS4YzpaoESM2gw4jFTerspmQhTb86q6n/La19oPcE8vC03viuKQH8zgXTCjuZM
         CNTyfVj1lU4TTpR6VRYPyHhODdR6tmx2bc7e4lT0JWuAtAQ1iKHRXyjqHtg+bnrIw3UT
         PqLA==
X-Forwarded-Encrypted: i=1; AJvYcCWlweZRWDQVDAEVyY0az760MqI22y5jew+xezj/8iH9J6aL+49GS9T0lCwnfJv1YLPm/haFOQFP5MKFDA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwD6xfC8uf/WLsh+pIx9Unutpum7mTqmAam+WiiVM3/wn7u22bD
	JQNIuk5IT9/KyrGRMCYqncSOAzm1EyEjlUnCZHfIIc1T5jn8mF7aC8YLkjelBbCnYokGpUqge25
	EawYTaVDEAjHlcqtxxHGFFnKVJY7zefb6P1MkgcdX
X-Gm-Gg: AZuq6aL+XVt85zqtJs8spBJ59vgLpgOya41mazDUer9FnNARcOYTLkYtqsJPaIKspte
	P81Kp58sVYuzA3WQ7DO4omhbI8qenLKqdHFhQNSWn8cC7KJMDZ8RXqIUI5O7NTsJbGuJYMs4rer
	4fL3Paw6SIUX+1afhqVK6nrpM1z4cN7PWeG66nUiEaFiRmiETWwrasUwpcK2lmc5RpCzAhzliQE
	N4cKAhAyM8N3okMESLc2Jh3fsLT4BYaTmkczAQbPpDwtpfOV0SxNMAb9eerzfqdwSfz0EgnXGG7
	QChinR5jZM5H9GTJjKa0rABv
X-Received: by 2002:a17:903:3d07:b0:2a7:4151:2c74 with SMTP id
 d9443c01a7336-2a8f32da681mr397915ad.16.1769803662323; Fri, 30 Jan 2026
 12:07:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260127225909.3296202-1-bwicaksono@nvidia.com>
 <CAP-5=fUxhbR1xs1f9mrkcUXZZNLrVqDG0ebhwW--WtgVRnNxNw@mail.gmail.com>
 <40988c57-ee6f-4693-afe4-2615dc43f395@linaro.org> <MW5PR12MB5681E958BDDCEB137E65CE54A09FA@MW5PR12MB5681.namprd12.prod.outlook.com>
In-Reply-To: <MW5PR12MB5681E958BDDCEB137E65CE54A09FA@MW5PR12MB5681.namprd12.prod.outlook.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 30 Jan 2026 12:07:31 -0800
X-Gm-Features: AZwV_QgiJyUG5mr0pnscOQIDv9TtdTed9GqfFQg3UrXw3XStpF8ShZ6gj_R5UHg
Message-ID: <CAP-5=fWB_nbnc6W9X-6iJH-ZasFriASOtduLjFLgY_exRKCqnQ@mail.gmail.com>
Subject: Re: [PATCH] perf vendor events arm64: Add Tegra410 Olympus PMU events
To: Besar Wicaksono <bwicaksono@nvidia.com>
Cc: James Clark <james.clark@linaro.org>, 
	"john.g.garry@oracle.com" <john.g.garry@oracle.com>, "will@kernel.org" <will@kernel.org>, 
	"mike.leach@linaro.org" <mike.leach@linaro.org>, "leo.yan@linux.dev" <leo.yan@linux.dev>, 
	"mark.rutland@arm.com" <mark.rutland@arm.com>, 
	"alexander.shishkin@linux.intel.com" <alexander.shishkin@linux.intel.com>, "jolsa@kernel.org" <jolsa@kernel.org>, 
	"adrian.hunter@intel.com" <adrian.hunter@intel.com>, "peterz@infradead.org" <peterz@infradead.org>, 
	"mingo@redhat.com" <mingo@redhat.com>, "acme@kernel.org" <acme@kernel.org>, 
	"namhyung@kernel.org" <namhyung@kernel.org>, 
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Thomas Makin <tmakin@nvidia.com>, 
	Vikram Sethi <vsethi@nvidia.com>, Rich Wiley <rwiley@nvidia.com>, Sean Kelley <skelley@nvidia.com>, 
	Yifei Wan <YWan@nvidia.com>, Thierry Reding <treding@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>, 
	Matt Ochs <mochs@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 30, 2026 at 10:08=E2=80=AFAM Besar Wicaksono <bwicaksono@nvidia=
.com> wrote:
>
> Thank you James and Ian for the comments.
> I will try to address the spelling mistakes on v2.
>
> Please see my other comments inline.
>
> > -----Original Message-----
> > From: James Clark <james.clark@linaro.org>
> > Sent: Wednesday, January 28, 2026 3:37 AM
> > To: Ian Rogers <irogers@google.com>; Besar Wicaksono
> > <bwicaksono@nvidia.com>
> > Cc: john.g.garry@oracle.com; will@kernel.org; mike.leach@linaro.org;
> > leo.yan@linux.dev; mark.rutland@arm.com;
> > alexander.shishkin@linux.intel.com; jolsa@kernel.org;
> > adrian.hunter@intel.com; peterz@infradead.org; mingo@redhat.com;
> > acme@kernel.org; namhyung@kernel.org; linux-tegra@vger.kernel.org; linu=
x-
> > arm-kernel@lists.infradead.org; linux-perf-users@vger.kernel.org; linux=
-
> > kernel@vger.kernel.org; Thomas Makin <tmakin@nvidia.com>; Vikram Sethi
> > <vsethi@nvidia.com>; Rich Wiley <rwiley@nvidia.com>; Sean Kelley
> > <skelley@nvidia.com>; Yifei Wan <ywan@nvidia.com>; Thierry Reding
> > <treding@nvidia.com>; Jon Hunter <jonathanh@nvidia.com>; Matt Ochs
> > <mochs@nvidia.com>
> > Subject: Re: [PATCH] perf vendor events arm64: Add Tegra410 Olympus PMU
> > events
> >
> > External email: Use caution opening links or attachments
> >
> >
> > On 28/01/2026 8:03 am, Ian Rogers wrote:
> > > On Tue, Jan 27, 2026 at 3:00=E2=80=AFPM Besar Wicaksono
> > <bwicaksono@nvidia.com> wrote:
> > >>
> > >> Add JSON files for NVIDIA Tegra410 Olympus core PMU events.
> > >> Also updated the common-and-microarch.json.
> > >>
> > >> Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
> > >> ---
> > >>   .../arch/arm64/common-and-microarch.json      |  90 +++
> > >>   tools/perf/pmu-events/arch/arm64/mapfile.csv  |   1 +
> > >>   .../arch/arm64/nvidia/t410/branch.json        |  45 ++
> > >>   .../arch/arm64/nvidia/t410/brbe.json          |   6 +
> > >>   .../arch/arm64/nvidia/t410/bus.json           |  48 ++
> > >>   .../arch/arm64/nvidia/t410/exception.json     |  62 ++
> > >>   .../arch/arm64/nvidia/t410/fp_operation.json  |  78 ++
> > >>   .../arch/arm64/nvidia/t410/general.json       |  15 +
> > >>   .../arch/arm64/nvidia/t410/l1d_cache.json     | 122 +++
> > >>   .../arch/arm64/nvidia/t410/l1i_cache.json     | 114 +++
> > >>   .../arch/arm64/nvidia/t410/l2d_cache.json     | 134 ++++
> > >>   .../arch/arm64/nvidia/t410/ll_cache.json      | 107 +++
> > >>   .../arch/arm64/nvidia/t410/memory.json        |  46 ++
> > >>   .../arch/arm64/nvidia/t410/metrics.json       | 722
> > ++++++++++++++++++
> > >>   .../arch/arm64/nvidia/t410/misc.json          | 646 ++++++++++++++=
++
> > >>   .../arch/arm64/nvidia/t410/retired.json       |  94 +++
> > >>   .../arch/arm64/nvidia/t410/spe.json           |  42 +
> > >>   .../arm64/nvidia/t410/spec_operation.json     | 230 ++++++
> > >>   .../arch/arm64/nvidia/t410/stall.json         | 145 ++++
> > >>   .../arch/arm64/nvidia/t410/tlb.json           | 158 ++++
> > >>   20 files changed, 2905 insertions(+)
> > >>   create mode 100644 tools/perf/pmu-
> > events/arch/arm64/nvidia/t410/branch.json
> > >>   create mode 100644 tools/perf/pmu-
> > events/arch/arm64/nvidia/t410/brbe.json
> > >>   create mode 100644 tools/perf/pmu-
> > events/arch/arm64/nvidia/t410/bus.json
> > >>   create mode 100644 tools/perf/pmu-
> > events/arch/arm64/nvidia/t410/exception.json
> > >>   create mode 100644 tools/perf/pmu-
> > events/arch/arm64/nvidia/t410/fp_operation.json
> > >>   create mode 100644 tools/perf/pmu-
> > events/arch/arm64/nvidia/t410/general.json
> > >>   create mode 100644 tools/perf/pmu-
> > events/arch/arm64/nvidia/t410/l1d_cache.json
> > >>   create mode 100644 tools/perf/pmu-
> > events/arch/arm64/nvidia/t410/l1i_cache.json
> > >>   create mode 100644 tools/perf/pmu-
> > events/arch/arm64/nvidia/t410/l2d_cache.json
> > >>   create mode 100644 tools/perf/pmu-
> > events/arch/arm64/nvidia/t410/ll_cache.json
> > >>   create mode 100644 tools/perf/pmu-
> > events/arch/arm64/nvidia/t410/memory.json
> > >>   create mode 100644 tools/perf/pmu-
> > events/arch/arm64/nvidia/t410/metrics.json
> > >>   create mode 100644 tools/perf/pmu-
> > events/arch/arm64/nvidia/t410/misc.json
> > >>   create mode 100644 tools/perf/pmu-
> > events/arch/arm64/nvidia/t410/retired.json
> > >>   create mode 100644 tools/perf/pmu-
> > events/arch/arm64/nvidia/t410/spe.json
> > >>   create mode 100644 tools/perf/pmu-
> > events/arch/arm64/nvidia/t410/spec_operation.json
> > >>   create mode 100644 tools/perf/pmu-
> > events/arch/arm64/nvidia/t410/stall.json
> > >>   create mode 100644 tools/perf/pmu-
> > events/arch/arm64/nvidia/t410/tlb.json
> > >>
> > >> diff --git a/tools/perf/pmu-events/arch/arm64/common-and-
> > microarch.json b/tools/perf/pmu-events/arch/arm64/common-and-
> > microarch.json
> > >> index 468cb085d879..6af15776ff17 100644
> > >> --- a/tools/perf/pmu-events/arch/arm64/common-and-microarch.json
> > >> +++ b/tools/perf/pmu-events/arch/arm64/common-and-microarch.json
> > >> @@ -179,6 +179,11 @@
> > >>           "EventName": "BUS_CYCLES",
> > >>           "BriefDescription": "Bus cycle"
> > >>       },
> > >> +    {
> > >> +        "EventCode": "0x001E",
> > >> +        "EventName": "CHAIN",
> > >> +        "BriefDescription": "Chain a pair of event counters."
> > >> +    },
> > >
> > > Cool stuff :-)
> > >
> > > For wider counters AMD does something similar, but should this be an
> > > implementation detail rather than an exposed event? How does it
> > > operate as an event?
> > >
> >
> > CHAIN should be excluded from the json, it's used internally by the
> > driver when you want 64 bit counters. Userspace can't use it because it
> > can't control where counters are placed to make sure they're adjacent.
> >
>
> Sure, will address this in V2.
>
> > > [snip]
> > >> diff --git a/tools/perf/pmu-events/arch/arm64/mapfile.csv
> > b/tools/perf/pmu-events/arch/arm64/mapfile.csv
> > >> index bb3fa8a33496..7f0eaa702048 100644
> > >> --- a/tools/perf/pmu-events/arch/arm64/mapfile.csv
> > >> +++ b/tools/perf/pmu-events/arch/arm64/mapfile.csv
> > >> @@ -46,3 +46,4 @@
> > >>   0x00000000500f0000,v1,ampere/emag,core
> > >>   0x00000000c00fac30,v1,ampere/ampereone,core
> > >>   0x00000000c00fac40,v1,ampere/ampereonex,core
> > >> +0x000000004e0f0100,v1,nvidia/t410,core
> > >> diff --git a/tools/perf/pmu-events/arch/arm64/nvidia/t410/branch.jso=
n
> > b/tools/perf/pmu-events/arch/arm64/nvidia/t410/branch.json
> > >> new file mode 100644
> > >> index 000000000000..532bc59dc573
> > >> --- /dev/null
> > >> +++ b/tools/perf/pmu-events/arch/arm64/nvidia/t410/branch.json
> > >> @@ -0,0 +1,45 @@
> > >> +[
> > >> +    {
> > >> +        "ArchStdEvent": "BR_MIS_PRED",
> > >> +        "PublicDescription": "The Event counts Branches which are
> > speculatively executed and mis-predicted."
> > >
> > > nit: The capitalization on Event and Branches, as well as other words=
,
> > > is a little unusual.
> > >
> >
> > If there's nothing specific to this CPU then the public description
> > could be left out entierly. The common strings already say the same
> > thing as this:
> >
> >      {
> >          "PublicDescription": "Mispredicted or not predicted branch
> >                                speculatively executed",
> >          "EventCode": "0x10",
> >          "EventName": "BR_MIS_PRED",
> >          "BriefDescription": "Mispredicted or not predicted branch
> >                               speculatively executed"
> >      },
> >
> >
>
> I will check on this and other events.
>
> > > [snip]
> > >> diff --git a/tools/perf/pmu-events/arch/arm64/nvidia/t410/metrics.js=
on
> > b/tools/perf/pmu-events/arch/arm64/nvidia/t410/metrics.json
> > >> new file mode 100644
> > >> index 000000000000..18c2fd58ee9e
> > >> --- /dev/null
> > >> +++ b/tools/perf/pmu-events/arch/arm64/nvidia/t410/metrics.json
> > >> @@ -0,0 +1,722 @@
> > >> +[
> > >> +    {
> > >> +        "MetricName": "backend_bound",
> > >> +        "MetricExpr": "100 * (STALL_SLOT_BACKEND / CPU_SLOT)",
> > >> +        "BriefDescription": "This metric is the percentage of total=
 slots that
> > were stalled due to resource constraints in the backend of the processo=
r.",
> > >> +        "ScaleUnit": "1percent of slots",
> > >> +        "MetricGroup": "TopdownL1"
> > >
> > > Note, on x86 we place TopdownL1 in the Default metric group so it is
> > > shown by `perf stat` when it isn't given events or metrics to compute=
.
> > > Perhaps you want to do something similar?
> > > https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-
> > next.git/tree/tools/perf/pmu-events/arch/x86/icelake/icl-
> > metrics.json?h=3Dtmp.perf-tools-next#n116
> > >
> > > Thanks,
> > > Ian
> >
> > That's currently true for the Arm topdown metrics in sbsa.json, but we
> > probably don't actually want this because there aren't enough counters
> > for the perf stat defaults plus topdown and it results in multiplexing
> > and bad results.
> >
> > I was planning to change it but we also don't currently expose the
> > number of counters available either...
> >
>
> Agree with James, we may not be able to cover all the events in
> Default + TopdownL1 group.
>
> Ian, James, in general, is it fine to put some metrics in a same group be=
cause
> they are actually correlating even though it may cause multiplexing?
> For example, "Miss_Ratio" group in this patch provides miss ratio from L1=
, L2, TLB, etc.
> It's convenient to have this and get the miss ratio from all cache levels=
.
> There are many events needed for this group and it might not be accurate =
due to
> multiplexing, but user can get a (rough) broad view in the beginning.

These things are strings so there's no real rules for how they get
organized other than Default being a special name. For Intel topdown
there's a convention of having a _group as a suffix to allow some kind
of drill down. There's even some support in ilist.py for this:
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/perf/python/ilist.py?h=3Dperf-tools-next#n477
As writing json is painful there's code for generating metrics from
Python and that tries to structure metrics inside groups of groups:
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/perf/pmu-events/intel_metrics.py?h=3Dperf-tools-next#n264
My hope is that at some point this will allow some kind of pretty
printing of headers and the like.

Thanks,
Ian

> Thanks,
> Besar
