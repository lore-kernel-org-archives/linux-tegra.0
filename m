Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793383638;
	b=GJWa5FZen8vU4WoRQK6WmyrEAa2c5qMW7222cF4uxv0+Fp/vMEuljLuMiQvqfRuSowNT
	 j99kt4V2iVAEa6lZ3kCSTYMuxqvQWzHRRf2mhg5jHScmFx3KmRdQETLDUU0S9rascvsbO
	 dC869veLn3z46062csgeK5EyQjtIBqihWJJYR+zlzMjWohIcW+FKF0Tf9EfsH3pbUJ91i
	 649VKW133Mi8jNlIN45rRCoaNB37u+Nze368KdV9H/F0oOLQualvusouUSL1Y1Jd9HkxC
	 XCVzwlMyYm1hoLGq0kTQDY79JQMaCGfRdhfiOVynYUd3yd6q/z6hp3aTOG6OswIpOgQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793383638;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Yee/M/vhaQksyDRzfPy2oYsyP6s0T7Yq+RK3mjeMx4U=;
	b=bG6jfLfLB9vrocEzGpD2j2QSX7UD33gs3O63XOj+yiMmYHtSZX+Y/cuChsyp/1DATYqh
	 bJIB+73NANrsosGrPvneFrwWNOcfnI2OYBcSsVBKJwcXsHJejCriFb69p/ZIyUtqxyh9k
	 3F62A6yoKIMkaTFx2cgyDhwqVu0DhYH2nZvPaf7sZfe5SlrBHAl+9VKbgwIyhNK5En74K
	 ddKyWJNqM0nQlLT0AUos9ypzEboC8Cwg1zKX2yjuCUl1IJzkmTIsaT/oCbMQEr4MGReCU
	 nMuV+NgK1ArniIbhB/8qoBo9GRuYpBQBegnfkdZ6TEMM76917lI+hnROfFt7uByPgGA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=MFZfb5uU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54D1606A31D
	for <linux-tegra@vger.kernel.org>; Fri, 30 Oct 2026 18:07:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B54D1606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=MFZfb5uU
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-194d0c31715so541c88.0
        for <linux-tegra@vger.kernel.org>; Fri, 30 Oct 2026 11:07:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793383637; cv=none;
        d=google.com; s=arc-20260327;
        b=R9gzyY3BHtJfIDQDl6k+TLjfls6eH2IkLvsv1VOhYOIX0Dpd2wh1xxVLbcrRaZ1Ny+
         3Hdyw1TE+5bea+hg+C/x6GfnoziJJELBtjPZ9AJQYumcw0LdKHYKWK0tEF0Mgt3KjF9p
         rEyLZ/r64JlQHaEN4zHI+UjtCPkxC2s9VBN3M+42T1V7Gr8X99Y390SrVZb4Y6BTtqiw
         1eHz5l00psVx5eARhyxZXU2vpIgN2tfPGbVsruaZTK7CuLmrl097q+u20+2yH9MR4wRk
         i+d7NLicFvKZKm7wm7cy+YsoJy9Y6SwbEQQAMmo7BrU+uIG54Ya7kCPJQtN0HNQJEu9f
         5o8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Yee/M/vhaQksyDRzfPy2oYsyP6s0T7Yq+RK3mjeMx4U=;
        fh=0ieQtHopsZWyky7xgqqRyTCsl8NUguTgqihooWL9uU4=;
        b=FA0cKBR9eowGyi0aTVryxKvqUdZ6ZYywiSjEikpLFN0My0UN1o2ZnxbvjeBRWRoZk0
         yBR9qWucM8WzhITmp4PhvfH6rpY7jGVVt0Lq775Ck4pFLhXTorIG28KNB7hA7aiHpNJj
         PuiQwJ2RrOGj5QM88634m0Ru7rdnHP9VmRSeATSTSbaZcrOgHza7XLcQ0KlkmQvX1k8q
         Lc6OYJZFGBkq9gG/HcCRmeI71x/5qO9Fgny4HxyABIKgfkn1ghbDxa4AduDz+YhPBloH
         GZpMqetGIjkVsMiKPeYN5jl5ShDIHlhoBZnF6UWNAM3qUYmPRLpnPxkPLJXnMMiT6C1A
         ju5Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793383637; x=1793988437; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Yee/M/vhaQksyDRzfPy2oYsyP6s0T7Yq+RK3mjeMx4U=;
        b=MFZfb5uUpuPCKMoHiVswKA/CTet+ZjcCeKaMZc49/8un4YNIWAQ3A8wCFBFo8/0r4T
         I2MjO0Fwvj8mIfoKuXZ7VuNbagzXrJOww583+uv+LHGfuY2+WKUdxVTbuz9dupXYrEJB
         fX8UdXPueXf4LO3Y5pf7ZvQuU8o8f4oqpcrzWlIy2HDC45qTZmCVCRv99JmAwDpFPXnS
         ZzJadKqFJV/s3uC2+vE/lGmi3ByS56aw+1VBeshQ0cR9WrtRmtRBsM/ZtUZDGK98vudB
         p1QaHqobJLbTc2PCqLn+FVzHgDboERmc0JsL4Tvznxmla3Qw3QxCUTYkeJYsI7Owbfdm
         WChg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793383637; x=1793988437;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yee/M/vhaQksyDRzfPy2oYsyP6s0T7Yq+RK3mjeMx4U=;
        b=sS+zgSqrGeXByQ8rzUvwdZql4qBmTnnRirptsw9g0LXEVmFgLEyovi77GNnxN4B42z
         QFQy0E9bI5yAaolTTF/hlZZQmciWQdO14HMmlZfodq/EoRpTmq+undBRxoX136+c7vEq
         P97Z4eLts1xFj1sSbMQqiIqVBqZapqbTHoqgMBULOu79BoOF4gHLIrFVgSH/bkDEyy/O
         XkKKtUeIQ6QuNt4EPjywDVCZ7lIxFVdRTZlBbPhvQIZVaX6+RXSmrr2Hv7gtBUVQUM1r
         7TOhfyylAuXrjPFacLeteLTXpurXfMasRfOnRzFcneuEFnSrKCqcH6aQ8ILcSly7dJIF
         xOCg==
X-Forwarded-Encrypted: i=1; AKwUvBzoTzzVwwc9GzNVTO+15Y4tjRkuNL9F6iPd4uspmlOHyP+9jTo24yvjfsqXL9NNPGMKDqV9KSt7KlLWcQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLxMEemPY+zWqxUEtUNTDCfdeT3ZCTwLNPiccDAyJlvTeeMiGAQ
	VLhkOTaUcspeJ5iEelNn0DR3Mhzbk7b2lbVLvtCBRp/1x4sb9Qn8M8dqz3ABK2x3cr+GSRpOTKR
	cWPGuKD7Uf0GiFlx+FmgazMVyFlEaDLGiUx1bhSGh
X-Gm-Gg: AYBFou3WgUYwoWcLXdrV/pn46g0D3LsSjajmBCx8UVQYU25m2c0jGPVbUbZlkZUAzOQ
	qvCtG11O5wqWm9/gkE0ZtDFZCRNt/7+rLjLdL0zEYm6t8+HGhegveCgBja11mK9CXAMnS/PeZRr
	TaPG0fXsm54YZb18VT20gNQ+wmdbwZ/UsI3ASBZ/JOL9+czLTiniVTkV14knSpEbhbRHhbKN+c4
	Xu1k9JEo84YSnuX9UmJxlPdtH7ikFFExhdweRSxDOAYyMMq8NoGgVK6vYKXVgLa4AVxuqu+aEhs
	LfIHt/EFeHk8ZnyxnuqWMVDYSgQ0PjTAtPkdnUUoab/BFFy2SbaIrxwueD/F8q2/vk4D/uwNvIg
	AuHyAkh/SAkenOkEgDq5QRkg8aUytj6Ek6auf8OdKbjVG31bsNzesuPtNI01pprCnnlmAlBFqR1
	7mSlDaXHsuOTaxJw==
X-Received: by 2002:a05:701b:418f:10b0:162:1b69:fe06 with SMTP id
 a92af1059eb24-1a99bfb8c44mr948799c88.14.1793383635496; Fri, 30 Oct 2026
 11:07:15 -0700 (PDT)
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
In-Reply-To: <20261030174816.1544471-1-bwicaksono@nvidia.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 30 Oct 2026 11:07:03 -0700
X-Gm-Features: AclHuK_KkDFZvz94Iv9OiENJydeV5pIlSlXsWtxJeGMUrrlYUp2oAVSujcV7xFQ
Message-ID: <CAP-5=fUEmNrREh-ipxYMiStr5xCakGDBZW8OmAj1rhACs8qaZw@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] perf: Add NVIDIA Tegra410 uncore PMU events and metrics
To: Besar Wicaksono <bwicaksono@nvidia.com>
Cc: acme@kernel.org, namhyung@kernel.org, ctshao@google.com, 
	linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	vsethi@nvidia.com, rwiley@nvidia.com, skelley@nvidia.com, mochs@nvidia.com, 
	rajjoshi@nvidia.com, treding@nvidia.com, jonathanh@nvidia.com, 
	john.garry@linux.dev, will@kernel.org, james.clark@linaro.org, 
	mike.leach@arm.com, leo.yan@linux.dev, mark.rutland@arm.com, 
	alexander.shishkin@linux.intel.com, jolsa@kernel.org, adrian.hunter@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 10:49=E2=80=AFAM Besar Wicaksono <bwicaksono@nvidia=
.com> wrote:
>
> Add event aliases and derived metrics for the NVIDIA Tegra410 uncore
> PMUs, and fix perf's aggregation of PMU instances that are numbered in
> more than one parts in their name.
>
> The series covers the UCF, PCIe, PCIe target, CPU memory latency, and
> chip-to-chip interconnect PMUs. It provides symbolic names for the raw
> event encodings and metrics for bandwidth, frequency, and average read
> latency.
>
> The PCIe and PCIe target PMUs are named nvidia_pcie_pmu_<socket>_rc_<rc>
> and nvidia_pcie_tgt_pmu_<socket>_rc_<rc>. Their json Unit uses the
> existing comma-separated form ("nvidia_pcie_pmu_,rc_"), but perf only
> merged instances that differ in the trailing number, so these events and
> metrics gave one result per socket and were reported incorrectly (e.g.
> with --metric-only), as discussed in v1. Patches 6-9 fix this:
>
> - Patch 6 adds a check of the cpumasks of all merged PMU instances to the
>   zero-count skip in perf stat, so a socket that counts nothing shows 0
>   instead of having its row hidden.
> - Patch 7 merges PMU instances that match the same comma-separated json
>   Unit. This also applies to the HiSilicon hisi_sccl PMUs, which use the
>   same json form; not tested on HiSilicon hardware.
> - Patch 8 labels a merged uncore counter after all of its PMUs, e.g.
>   nvidia_pcie_pmu_*_rc_*/cycles/ or nvidia_ucf_pmu/cycles/, instead of
>   after the first instance, such as nvidia_pcie_pmu_0_rc_0/cycles/.
>   Output with --no-aggr is unchanged.
> - Patch 9 describes these PMU names in the ABI document.
>
> Changes in v2:
> - Move the uncore JSON out of the sys directory and remove the
>   "Compat" fields. Thanks to Ian Rogers for the feedback.
> - Drop "perf jevents: Process model files before sys subdirectories",
>   which this series no longer needs.
> - Add UCF SLC and memory bandwidth metrics from all sources to local
>   CMEM (read, write and read+write) and from local sources to local
>   CMEM and to remote memory, PCIe bandwidth metrics to local
>   destinations, and read+write bandwidth metrics for UCF SLC, UCF
>   memory and PCIe. Thanks to Chun-Tse Shao for the suggestion.
> - Add patches 6-9 to fix the PCIe instance aggregation. Thanks to Ian
>   Rogers and Chun-Tse Shao for the pointers.
>
> v1: https://lore.kernel.org/all/20261019164241.403644-1-bwicaksono@nvidia=
.com/

Why don't we look to fix code in drivers/perf? This series introduces
PMU instances, overloads the meaning of aliases, and a bunch of other
silly complexity due to poor reviews and maintenance of drivers/perf -
specifically by not pointing out the ABI issues. Isn't this a
straightforward, whoops we did a bad suffix and here's the patch to
rename our PMU in the driver? Throwing more complexity at the problem
doesn't feel like the right fix.

Thanks,
Ian

> Besar Wicaksono (9):
>   perf jevents: Add support for NVIDIA Tegra410 UCF PMU aliasing
>   perf jevents: Add support for NVIDIA Tegra410 PCIE PMU aliasing
>   perf jevents: Add support for NVIDIA Tegra410 PCIE-TGT PMU aliasing
>   perf jevents: Add support for NVIDIA Tegra410 CPU Memory Latency PMU
>     aliasing
>   perf jevents: Add support for NVIDIA Tegra410 C2C PMU aliasing
>   perf stat: Check merged PMU instance's cpumasks when skipping zero
>     counts
>   perf pmu: Merge PMU instances that match the same comma-separated json
>     Unit
>   perf evsel: Name a merged uncore counter after all of its PMUs
>   perf Documentation: Describe PMU names numbered in more than one place
>
>  .../testing/sysfs-bus-event_source-devices    |  14 +
>  .../arm64/nvidia/t410/uncore-cpu_mem.json     |  43 +
>  .../arm64/nvidia/t410/uncore-nvclink.json     |  67 ++
>  .../arm64/nvidia/t410/uncore-nvdlink.json     |  43 +
>  .../arm64/nvidia/t410/uncore-nvlink_c2c.json  | 115 +++
>  .../arch/arm64/nvidia/t410/uncore-pcie.json   | 249 ++++++
>  .../arm64/nvidia/t410/uncore-pcie_tgt.json    |  83 ++
>  .../arch/arm64/nvidia/t410/uncore-ucf.json    | 764 ++++++++++++++++++
>  tools/perf/tests/pmu.c                        | 134 +++
>  tools/perf/util/evlist.c                      |   2 +-
>  tools/perf/util/evsel.c                       |  83 +-
>  tools/perf/util/evsel.h                       |   2 +-
>  tools/perf/util/parse-events.c                |   2 +-
>  tools/perf/util/pmu.c                         |  65 ++
>  tools/perf/util/pmu.h                         |   9 +
>  tools/perf/util/pmus.c                        |  47 ++
>  tools/perf/util/pmus.h                        |   1 +
>  tools/perf/util/stat-display.c                |  20 +
>  18 files changed, 1737 insertions(+), 6 deletions(-)
>  create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/uncore-c=
pu_mem.json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/uncore-n=
vclink.json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/uncore-n=
vdlink.json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/uncore-n=
vlink_c2c.json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/uncore-p=
cie.json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/uncore-p=
cie_tgt.json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/uncore-u=
cf.json
>
> --
> 2.43.0
>
