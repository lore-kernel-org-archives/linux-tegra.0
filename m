Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793420291;
	b=kdYZwuym4LEhuGEMFWy3f+zV0SZ8y8lrRf/P273Qr0qoAx/Vv1MuzYz2CujyQHS2sZDo
	 SFlpVwcRvIDm6O/2Kq+SYJoem8IZ+7iZii8sUIkDSvBFTLeDvzMMZqNLl+tA/oxJGoqT8
	 fr+HXlY8ZTGNG/uL+QUqJaInxKZ8I7PpXSWbiNiWChksElaN0EHCp/Chq2n/taywb+Uqb
	 s0MHuzvgu43tLkghFFIRwJ/iUj3u4SQMRtIEnZGONP6CCSWkjL6Z68qNZ3Ey1gO7R+Phi
	 hhdF1ggwqzhc5wl+K5ON1gZzYjkwssostGJUmhTrZdpXNamFPQhKyItxKzzLLvSSIAA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793420291;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=AOG8HUZz8XxdrGd9dGbJMFpZyN7UoKyKrEdlEI23Z9M=;
	b=kvTqJ6gdc2BvEKJfwe+pdlOYR8MDPI9CL2FzV1kvMDj2Mg5wX0zmMK9AtEfj/nx1mHkt
	 N/tUwXdbxDk/iaOvaedsLT8fRikPNDlAGu4sDCHGVn5XUl8PnXDAwaC61O7a0SqvSqFec
	 Qnfg1jNFF8enATBKLRID+CFxQFqsRp9PU3FpeGxtlxY7pmW0+SBJu/2ryJES+Yq+noL5O
	 oWxI0G1H4rh4mZkkhIJjYj2YE+W/iNC1RzcPNeRIz6lVhAhYebmk5PjhYETWPOGXFu+y9
	 KI4bFkjvv4NKK2hpZrMvELI2ydVfd9HcpnSHCNKeKuxuoeSh92GhefLjuz4CiN2rOaQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XdC3W1Ov;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE4F606A31D
	for <linux-tegra@vger.kernel.org>; Sat, 31 Oct 2026 04:18:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EE4F606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XdC3W1Ov
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-535f598d126so69041cf.1
        for <linux-tegra@vger.kernel.org>; Fri, 30 Oct 2026 21:18:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793420289; cv=none;
        d=google.com; s=arc-20260327;
        b=EaE6Gll2i21qk3Iq4eS6levDIPa+A15yLxC5eecotf4e7xAsgp7zun4anvMuwRBZra
         PwFKLzd9A2yw9YpE/TrdCgZOM/fPPgjzRo2ApeKRSfbU6oSYFiR2A0BiqzZSZqZZ3jyv
         PA9YM4gSTmvLUE5H5RihGSWa+hScGKTHyiEfaCRc0+FmC0wCLAdpnFpQsXAjwnefD5VS
         JcMJB1ed5IRIqvrxNIeOzMBWivC8fQeNtlbgBEyXo+euP9W5O80z3IwfUQzl5PmDTxEy
         sG40BaRBI+Xo/UyNI+IzMnZKWr6uiyagzUHXCPOuwIZJZjAuRTWPvivB7PGbK+zk4cr4
         5C/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AOG8HUZz8XxdrGd9dGbJMFpZyN7UoKyKrEdlEI23Z9M=;
        fh=ohoFtmW6F8YG5LEyNVRD8D39trUakBIG8Wgw/tTrdIs=;
        b=m9igYPRk2HI2UmXEyNcc5rN/EIsUYLhO9H4z6gov0snCvmnkBCCf3zrLe/PnHIq120
         Iqkd+0AX42Uk4RSJH/H1Z+bqkK6QzjNffhj/rtzDQ1T+aAsZo9Ddy4BJFzz5A+Yt7FRd
         bqx+90sjIxL80rf/yijs7taiWjRg9YUIBee1XsCqOJf6Oc/uJ65CktEyMSAUmQRBe+hH
         Im4YwJhDQ1+yCwlknJKQUXMnbyTeZDYolI3UoXXeD+GrbZuQHU50gUpEl4pC4brhgWad
         aminjSMUm24Pv2u3d57rcKaD75ehQRJ5kGNXqWVFShvkUcG0+dKGHqgm/1ENwL6/NAKC
         wWXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793420289; x=1794025089; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AOG8HUZz8XxdrGd9dGbJMFpZyN7UoKyKrEdlEI23Z9M=;
        b=XdC3W1OvHgcf+bted5hMSz9sX3uXdeTl49lm4k+oeIxpdXUzaUh5vZwul81zS0aLTN
         M4ZV74qlFbcFHV/ur6GdQIs0UqBG9LxjJIrdNarKneIlwm8osAyr0aVGUKvmUBfAerzr
         Ak5r12nEQ1ENLs4YUw0c/vLi7iUxaxr5t7aT6AUQqp69wGOQpqlHQ07y1hi0VEOoOJsZ
         6ffIgMo4UcIZYuO+4bm4ovnBrG97G1wMUztCKzLkopNdob+Lrf/1QWKKB93LqZMUtXfE
         ZDiLwB9moL2WnmrtmX3wG7tHeRY89YQu0wh2oldScVc/+USPeGZfbf48/E2zdEmZKEuE
         iTMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793420289; x=1794025089;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AOG8HUZz8XxdrGd9dGbJMFpZyN7UoKyKrEdlEI23Z9M=;
        b=SNF3ATavYBQjPvfn6mPezbHSdrRhnlsgAhTvIIMPEzI450Oka5JppmlCtKy5i930FZ
         BvqerwA1iLD/Gf/3ileluF+0vfBmrwzRlA4kSuoipkfLO6f4cZfDnfQK28uOS8cgWEjz
         vtq78xRaavJM+ebo+HRhVZicT5m1ekmCrXh+5GvlXDFKwryDEP8Ct5tEvp89LpuD+gBl
         cc7tEXdpEuCNrIv93sCgZtkFvDyPJE0x0GsbawC7iHf1RZ91wXndTJyQfSa9o3UhXghm
         OAsGyuE8wqPKamxckrAhNaTp0iQQweALbQQWIJR9ITvJWtDIURmKWW40C4PEGlNLkPrW
         fkZg==
X-Forwarded-Encrypted: i=1; AKwUvBw6ZFhJND9eUQT/A9Qo2VhHQ4h2kkRiZ1ltPMrWYCRZ007+Ji8Kb7k9kFDWNiagdtdepm46gxkYgVE3UQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYK9z1OHrBFK7M9B5bad1YDFV2TgExVl5Y6hmDfY8cUUTLQN10ih
	JQj+NHYiSvIMlOMBvWGUuWnlgJMnegpQy+7MiBFLf9B5JX9tOoETNOJqnAy0chKkfp3a3EBTfIB
	DUYBE1Xl76M6NnHlrENons/nro61lCU6FRPRtATMo
X-Gm-Gg: AYBFou0uFmxmvT0BA7rK0i8dHICATNYHcQCq4SdUBn514L4zrie/c2hyv3Id5kVmysv
	fYORygUSSBPj3S3liPOtro8fUDrrwiTKeWf5C8ehUaaGFkxqUfoEph/+MPy6oW+Qkk+fIDBBoJY
	G3Y+AfIDT+ROztkVwBq1gyepsvDaMr3RKuZWf3U4JAo3l6L5zzBCKx9LviMBbH066ktt48JRE2/
	Bs2VHeRWFhPHT9o4zYSldZBlacCg2PmCrWJelZMjd97IzMsVcKsl7RiAPSmeo61hLI3X1ZvK4c/
	s4FhE2b+l4q2kvHosPIRns/koKFN+nUd4YtEGAG5o9/JiImK5zTrZ7E4vo2/BibmoQqDIqY2CHX
	2MZzbMnsAEmZNW8vejjdzl10o5g9EFA24pEdlnw==
X-Received: by 2002:ac8:690d:0:b0:534:b7b2:634f with SMTP id
 d75a77b69052e-5414d92c15bmr56455931cf.8.1793420288686; Fri, 30 Oct 2026
 21:18:08 -0700 (PDT)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030174816.1544471-1-bwicaksono@nvidia.com>
 <CAP-5=fUEmNrREh-ipxYMiStr5xCakGDBZW8OmAj1rhACs8qaZw@mail.gmail.com> <SA1PR12MB6773B13BD3EB2B60FBED6013A06D2@SA1PR12MB6773.namprd12.prod.outlook.com>
In-Reply-To: <SA1PR12MB6773B13BD3EB2B60FBED6013A06D2@SA1PR12MB6773.namprd12.prod.outlook.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 30 Oct 2026 21:17:56 -0700
X-Gm-Features: AclHuK_OY8SV1nYCVpefSonLzrvbO-Js_d73IE_n_dvtQxEV32bei9opm-np6oo
Message-ID: <CAP-5=fWJn=Fws6ew_HCsxVo6Bcqvvgn-8g=21+nvoEHA5GhLKA@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] perf: Add NVIDIA Tegra410 uncore PMU events and metrics
To: Besar Wicaksono <bwicaksono@nvidia.com>
Cc: Will Deacon <will@kernel.org>, "acme@kernel.org" <acme@kernel.org>, 
	"namhyung@kernel.org" <namhyung@kernel.org>, "ctshao@google.com" <ctshao@google.com>, 
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Vikram Sethi <vsethi@nvidia.com>, 
	Rich Wiley <rwiley@nvidia.com>, Sean Kelley <skelley@nvidia.com>, Matt Ochs <mochs@nvidia.com>, 
	Raj Joshi <rajjoshi@nvidia.com>, Thierry Reding <treding@nvidia.com>, 
	Jon Hunter <jonathanh@nvidia.com>, "john.garry@linux.dev" <john.garry@linux.dev>, 
	"james.clark@linaro.org" <james.clark@linaro.org>, "mike.leach@arm.com" <mike.leach@arm.com>, 
	"leo.yan@linux.dev" <leo.yan@linux.dev>, "mark.rutland@arm.com" <mark.rutland@arm.com>, 
	"alexander.shishkin@linux.intel.com" <alexander.shishkin@linux.intel.com>, "jolsa@kernel.org" <jolsa@kernel.org>, 
	"adrian.hunter@intel.com" <adrian.hunter@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 3:19=E2=80=AFPM Besar Wicaksono <bwicaksono@nvidia.=
com> wrote:
>
> > -----Original Message-----
> > From: Ian Rogers <irogers@google.com>
> > Sent: Friday, October 30, 2026 6:07 PM
> > To: Besar Wicaksono <bwicaksono@nvidia.com>
> > Cc: acme@kernel.org; namhyung@kernel.org; ctshao@google.com; linux-
> > tegra@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-perf=
-
> > users@vger.kernel.org; linux-kernel@vger.kernel.org; Vikram Sethi
> > <vsethi@nvidia.com>; Rich Wiley <rwiley@nvidia.com>; Sean Kelley
> > <skelley@nvidia.com>; Matt Ochs <mochs@nvidia.com>; Raj Joshi
> > <rajjoshi@nvidia.com>; Thierry Reding <treding@nvidia.com>; Jon Hunter
> > <jonathanh@nvidia.com>; john.garry@linux.dev; will@kernel.org;
> > james.clark@linaro.org; mike.leach@arm.com; leo.yan@linux.dev;
> > mark.rutland@arm.com; alexander.shishkin@linux.intel.com;
> > jolsa@kernel.org; adrian.hunter@intel.com
> > Subject: Re: [PATCH v2 0/9] perf: Add NVIDIA Tegra410 uncore PMU events
> > and metrics
> >
> > External email: Use caution opening links or attachments
> >
> >
> > On Fri, Oct 30, 2026 at 10:49=E2=80=AFAM Besar Wicaksono
> > <bwicaksono@nvidia.com> wrote:
> > >
> > > Add event aliases and derived metrics for the NVIDIA Tegra410 uncore
> > > PMUs, and fix perf's aggregation of PMU instances that are numbered i=
n
> > > more than one parts in their name.
> > >
> > > The series covers the UCF, PCIe, PCIe target, CPU memory latency, and
> > > chip-to-chip interconnect PMUs. It provides symbolic names for the ra=
w
> > > event encodings and metrics for bandwidth, frequency, and average rea=
d
> > > latency.
> > >
> > > The PCIe and PCIe target PMUs are named
> > nvidia_pcie_pmu_<socket>_rc_<rc>
> > > and nvidia_pcie_tgt_pmu_<socket>_rc_<rc>. Their json Unit uses the
> > > existing comma-separated form ("nvidia_pcie_pmu_,rc_"), but perf only
> > > merged instances that differ in the trailing number, so these events =
and
> > > metrics gave one result per socket and were reported incorrectly (e.g=
.
> > > with --metric-only), as discussed in v1. Patches 6-9 fix this:
> > >
> > > - Patch 6 adds a check of the cpumasks of all merged PMU instances to=
 the
> > >   zero-count skip in perf stat, so a socket that counts nothing shows=
 0
> > >   instead of having its row hidden.
> > > - Patch 7 merges PMU instances that match the same comma-separated
> > json
> > >   Unit. This also applies to the HiSilicon hisi_sccl PMUs, which use =
the
> > >   same json form; not tested on HiSilicon hardware.
> > > - Patch 8 labels a merged uncore counter after all of its PMUs, e.g.
> > >   nvidia_pcie_pmu_*_rc_*/cycles/ or nvidia_ucf_pmu/cycles/, instead o=
f
> > >   after the first instance, such as nvidia_pcie_pmu_0_rc_0/cycles/.
> > >   Output with --no-aggr is unchanged.
> > > - Patch 9 describes these PMU names in the ABI document.
> > >
> > > Changes in v2:
> > > - Move the uncore JSON out of the sys directory and remove the
> > >   "Compat" fields. Thanks to Ian Rogers for the feedback.
> > > - Drop "perf jevents: Process model files before sys subdirectories",
> > >   which this series no longer needs.
> > > - Add UCF SLC and memory bandwidth metrics from all sources to local
> > >   CMEM (read, write and read+write) and from local sources to local
> > >   CMEM and to remote memory, PCIe bandwidth metrics to local
> > >   destinations, and read+write bandwidth metrics for UCF SLC, UCF
> > >   memory and PCIe. Thanks to Chun-Tse Shao for the suggestion.
> > > - Add patches 6-9 to fix the PCIe instance aggregation. Thanks to Ian
> > >   Rogers and Chun-Tse Shao for the pointers.
> > >
> > > v1: https://lore.kernel.org/all/20261019164241.403644-1-
> > bwicaksono@nvidia.com/
> >
> > Why don't we look to fix code in drivers/perf? This series introduces
> > PMU instances, overloads the meaning of aliases, and a bunch of other
> > silly complexity due to poor reviews and maintenance of drivers/perf -
> > specifically by not pointing out the ABI issues. Isn't this a
> > straightforward, whoops we did a bad suffix and here's the patch to
> > rename our PMU in the driver? Throwing more complexity at the problem
> > doesn't feel like the right fix.
>
> Hi Ian,
>
> My apologies for the names not following perf's PMU naming convention.
> I will be more careful about this in future.
>
> These names (nvidia_pcie_pmu_<socket>_rc_<root complex> and
> nvidia_pcie_tgt_pmu_<socket>_rc_<root complex>) have been upstream
> since v7.1, and several customers already rely on them. Renaming them in
> the driver would break their use case.

It only breaks their use case if they name the PMU with an event. You
have multiple naming conventions for the PMU and only those involving
multiple sockets have a broken suffix.

> Given that, what would you suggest as the next step? Would handling these
> names in perf, as in patch 7 and 8, be reasonable, or do you have another
> approach in mind?

So we don't need a new abstraction, I've been reducing aggregation
abstractions in the perf tool. As I pointed to previously, the suffix
is computed with pmu_name_len_no_suffix:
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/perf/util/pmus.c?h=3Dperf-tools-next#n66
So you can do something like (untested):
```
size_t pmu_name_len_no_suffix(const char *str)
{
  if (strstarts(str, "nvidia_") && strstr(str, "_rc_")) {
    // nvidia PMU with a non-ABI suffix of nvidia_..._[0-9]+_rc_[0-9]+
    const char *p =3D str + strlen(str);
    int n =3D 3;
    while(p > str && n > 0) {
       if (*p-- =3D=3D '_')
          n--
     }
     return p - str;
  }
  // The rest of the existing pmu_name_len_no_suffix code.
  ...
}
```
I'd much rather we didn't add bespoke behavior to the tool for every
new PMU. This happened previously when PMUs were merged in
drivers/perf with hex instead of numeric suffixes. We already handle
certain PMUs specially due to their lack of hotplug support:
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/perf/arch/arm/util/pmu.c?h=3Dperf-tools-next#n41
And due to event name fiascos:
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/perf/builtin-record.c?h=3Dperf-tools-next#n1395
At some point, perf's internals become so forked due to mismatched
conventions that every code path will have a variant. This saddens me
as something that we've much improved this year is being able to say
`perf stat record` on one machine type and then `perf stat report` on
another.

Thanks,
Ian

> Will, do you have any comment on this?
>
> Thanks,
> Besar
>
> >
> > Thanks,
> > Ian
> >
> > > Besar Wicaksono (9):
> > >   perf jevents: Add support for NVIDIA Tegra410 UCF PMU aliasing
> > >   perf jevents: Add support for NVIDIA Tegra410 PCIE PMU aliasing
> > >   perf jevents: Add support for NVIDIA Tegra410 PCIE-TGT PMU aliasing
> > >   perf jevents: Add support for NVIDIA Tegra410 CPU Memory Latency
> > PMU
> > >     aliasing
> > >   perf jevents: Add support for NVIDIA Tegra410 C2C PMU aliasing
> > >   perf stat: Check merged PMU instance's cpumasks when skipping zero
> > >     counts
> > >   perf pmu: Merge PMU instances that match the same comma-separated
> > json
> > >     Unit
> > >   perf evsel: Name a merged uncore counter after all of its PMUs
> > >   perf Documentation: Describe PMU names numbered in more than one
> > place
> > >
> > >  .../testing/sysfs-bus-event_source-devices    |  14 +
> > >  .../arm64/nvidia/t410/uncore-cpu_mem.json     |  43 +
> > >  .../arm64/nvidia/t410/uncore-nvclink.json     |  67 ++
> > >  .../arm64/nvidia/t410/uncore-nvdlink.json     |  43 +
> > >  .../arm64/nvidia/t410/uncore-nvlink_c2c.json  | 115 +++
> > >  .../arch/arm64/nvidia/t410/uncore-pcie.json   | 249 ++++++
> > >  .../arm64/nvidia/t410/uncore-pcie_tgt.json    |  83 ++
> > >  .../arch/arm64/nvidia/t410/uncore-ucf.json    | 764
> > ++++++++++++++++++
> > >  tools/perf/tests/pmu.c                        | 134 +++
> > >  tools/perf/util/evlist.c                      |   2 +-
> > >  tools/perf/util/evsel.c                       |  83 +-
> > >  tools/perf/util/evsel.h                       |   2 +-
> > >  tools/perf/util/parse-events.c                |   2 +-
> > >  tools/perf/util/pmu.c                         |  65 ++
> > >  tools/perf/util/pmu.h                         |   9 +
> > >  tools/perf/util/pmus.c                        |  47 ++
> > >  tools/perf/util/pmus.h                        |   1 +
> > >  tools/perf/util/stat-display.c                |  20 +
> > >  18 files changed, 1737 insertions(+), 6 deletions(-)
> > >  create mode 100644 tools/perf/pmu-
> > events/arch/arm64/nvidia/t410/uncore-cpu_mem.json
> > >  create mode 100644 tools/perf/pmu-
> > events/arch/arm64/nvidia/t410/uncore-nvclink.json
> > >  create mode 100644 tools/perf/pmu-
> > events/arch/arm64/nvidia/t410/uncore-nvdlink.json
> > >  create mode 100644 tools/perf/pmu-
> > events/arch/arm64/nvidia/t410/uncore-nvlink_c2c.json
> > >  create mode 100644 tools/perf/pmu-
> > events/arch/arm64/nvidia/t410/uncore-pcie.json
> > >  create mode 100644 tools/perf/pmu-
> > events/arch/arm64/nvidia/t410/uncore-pcie_tgt.json
> > >  create mode 100644 tools/perf/pmu-
> > events/arch/arm64/nvidia/t410/uncore-ucf.json
> > >
> > > --
> > > 2.43.0
> > >
