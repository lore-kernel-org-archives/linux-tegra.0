Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793809570;
	b=eUx4xKdoJ453zstHSvqHzL3x2uUh/OI9fBSwN7DslwXaIXkwLWMl21bvAidzW1CfflEr
	 WUltzDlF3Dc6tJhqgGX/iFy9Zcg6hqGHsmtkPjFdU7NS5Saae167xkG3B7WnuXCX7zSR9
	 aXJNui/snc+vccEnbAnKMcyJO1Hj1e8QVUvcnWxhHS6dXDcagD9kTJVsZDTSxvaaFQ1dK
	 J4CnnlGZ5xnch0zgJrHXSUveR58rNjw/FGOIDla4pKoMWjdtS3bL/QrukYLG1+4edaKnW
	 3/d7prQntBjKoB3WBHKLfnstG/OOSBE//UV24WHOWebM0YGglapsZ5s5eYHaaCRhWgQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793809570;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=02xlunbPJG9twMrNC4lzpNV5WoLplwFKW8EyaQv0RmE=;
	b=ovbaU+VJcGLCCez6MXh14FpvDUHJ8+WvVjHzgsLGzXT/hbgXRU3lccGSE82Q0NG15eLn
	 Zp8xDb13cLAdKRRr2uw+PCrkerEWO6FyaPvDk7mqjizBqABWUPfzGxhLBWkeLx8ZHYlvQ
	 V+ytrJOGHyuARRkRoPnGCQ40Pr3YMy3Rg5fdxAr9g2Ve1GjbB+NJEWAODg9e0+zDY/LBR
	 UeCtjjPz13t0QZRWdeukGvsBTWgFF3fgnMT1ZsxOenhAR2GJ9xHY74kxOLXaTdAmQ3UzN
	 7bxzm9kJqJesoofhvvARrDH0LM3pWsS9FluA+fk8H11sNVA+ex5hhZ6L1Re8wnYEvxQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PkQndnVj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85785606A329
	for <linux-tegra@vger.kernel.org>; Wed,  4 Nov 2026 16:26:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85785606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PkQndnVj
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-5383c97c8cfso322011cf.1
        for <linux-tegra@vger.kernel.org>; Wed, 04 Nov 2026 08:26:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793809569; cv=none;
        d=google.com; s=arc-20260327;
        b=le4kNCrA7G4db5ETdWVfO/vNef+6N56omYSNe6hA1iVxXAv11Fy61dG8z6mSGxh55R
         YxhOV/A1Vve3s6nxYkbFzvrfVxGnPT4AiLQ11No4iULFAPb81cdcr/0ntXnrpMDAxxMx
         43aimUI29MQZzGSSDDN7i3Zcu3a2h8wQRxPUTsiM6fYdB+WstmaJECyPo6FzwkgFwhQU
         m5eqETeksRlfOkmGCsp7MZSGkv1MQ6HRblswsOEj26Nl5kOiQm1goX+aV5H7txZyyUM+
         za8iRdozxJNm5xDeMuPblB3G2m3+j61tzMu0XeUpdstBRas2D0VkIkFicj668iOgQjUZ
         wYcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=02xlunbPJG9twMrNC4lzpNV5WoLplwFKW8EyaQv0RmE=;
        fh=ZYQkTOzfzqbYOKicDL0kfrlGLQ4dcCNa1ZddSERhv0U=;
        b=Mrjn2yAfzlm4GQjNmVwlNWlcJTNRs99Ra5qWV94j0aNJi1vP2ZXymLCA8NL7kRbcbm
         0F7P0YALQCwr/HPkzxJpmJjCPyO0OteMUikBrFJyTv5APRQvwMAkTNM02uDkPfONt2M2
         rwmcVNqd5IFtJzykMUgdaqgHqlt3dsOTbaf14hFdhkvE6PYmJNlAW9DAg7ellPCe0Fh/
         YWdF/yPqEdwxpk2oP3JGx4JVsV/kxUJFwZFEaUNoOK6UJcgpiP6jbzedCWv2bu0PP2Ju
         rIImvDrvKOFWxuaB5OMo32aVNqjLRDcMzhi1RB/kjadAvRUNR5mDY0QbAfz61Em0IgM+
         o/gw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793809569; x=1794414369; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=02xlunbPJG9twMrNC4lzpNV5WoLplwFKW8EyaQv0RmE=;
        b=PkQndnVjODxfjk8gWoorlSWxkVs/Yt5AWI09ReVaivDetcOVoiHlse74NWIkMgMaeb
         FO2aotMPrv6Lzhpa4STmuW3+HlnXlLkdo4v/bfjyhhO7kuZDShCgQwC2McSN7nSDbAnA
         ON0bC5dM29QNnL7HT0hpEhyAa2qFUgX+11YrSQQfiA2PV0W+vrOCmGZ+W3X52hDqBOOW
         /QpB4VOrYkjQC4GFqDPnbDmu7Kr4n3Bz1vzOx9XcoZrrt86Uq+8zP5948IA4yQq0VNIl
         8ehpcuEVERdPPEspxAeYIMQj+53DYvfn9JvKi4J1dhamhRs4yXIXU4g3G9VZWSm3UdiX
         dHpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793809569; x=1794414369;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=02xlunbPJG9twMrNC4lzpNV5WoLplwFKW8EyaQv0RmE=;
        b=IyseoCRF0AtSMexbvkxi3ysWTjoSBmLYrkKcMqXHolCrGQjyWJZ6a3IMNumuZF29VR
         zAu2bJzHQ8Aa2gJlRt7KTNWnHIKiXGAHCizFdjEO2ii815xSs1HW2bdU8O+RAXBDSph/
         +vuu2dASfZ5BKEg9k5o6Gp/J1OZlyJCMciMtweiMrHqcNK/kQtp6kYH8kPu0pJsJZ4Tb
         f4hahCfgGrelrCwtjjNpH41ocBR2ZetWkl6nwL1j+wM4YD6QYxpFohuadoCvp4X1my1v
         e3HLURIe+42u2ewICXxnZOhHwHB7ztFFNgUH8QVPfoUew9mW0DSZco4ByPS7v1y5T/rS
         kIcg==
X-Forwarded-Encrypted: i=1; AKwUvBy7bC7JxdEj9XylC21iaYZ2dd8qsDF+uvY3awZ8NOhio2MgAwSDEcpwlMXz2LVU8MvIIy/EqfSG57P8Uw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+GJ4pprLw6OUUZBajkeAnaXVbLJXkYxsYmQPSKhIkV35GVHFp0
	8uiRnzR3Ab1gkr8rNAHm3OWj05yGq5BxGUSckEtM+a9zTY13msV7EXTUuC5L6bq0JHFGhEwhNHF
	trHvgd9G3tEqprEWPpU8ifn8FTzI23O5cOl4oqvYg
X-Gm-Gg: AYBFou2F3yqWtEDgYb03SnsERjfxaloAVccMXwnABjADbJCHE6x3enaWCdybh5zEQYc
	3sRcwnKmWaIbjYhXjQUeQhDcUa2ynuQxKh0xGVWuohkBift2tIq6P2Fx5aQTAZAJevUkAN2HLIm
	LqqlT9g99t6cQP2XmUalLLgE7CiCNAQbR/7V/nPhRN9Sqv7tSz2AQ4+rkIx23YWMvXgjn8KHVFx
	umK83dHHQJqV1R4hijZ3tx3rTXmu7opSA9W3eyv2ApJhK3MDOmbJRbe/WdIeTMHqXqA9aLM5lu/
	rw6CZLx9dQB+w0tNYePTWH0FPvSUpUpkB17Sq3t/ceX48upNw/fr46uaJlhbK7ONcRDtm0RPaQI
	nRwsbKMPfqZbnHoqoD2ATbDa+bs0818DocxEPA3cBygU1s7ENU+53COzVIzaqciWKYtKiAdCOUy
	Uxyh+3v2FZB9M=
X-Received: by 2002:a05:622a:4894:b0:535:9aa3:5ebb with SMTP id
 d75a77b69052e-54b4cd278d4mr21858561cf.8.1793809568468; Wed, 04 Nov 2026
 08:26:08 -0800 (PST)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104160716.2910873-1-bwicaksono@nvidia.com>
In-Reply-To: <20261104160716.2910873-1-bwicaksono@nvidia.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 4 Nov 2026 08:25:57 -0800
X-Gm-Features: AclHuK-GeTinNBFNoWnfPGGAtOY6Xq1W9g3atyK1ujiBfiA8CNbeKnUu-zkauLA
Message-ID: <CAP-5=fXriq3akwKxsxSuBZ0M=1OMuCe8ig_j-r6ehfCeCVAYcQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] perf: Add NVIDIA Tegra410 uncore PMU events and metrics
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

On Wed, Nov 4, 2026 at 8:08=E2=80=AFAM Besar Wicaksono <bwicaksono@nvidia.c=
om> wrote:
>
> Add event aliases and derived metrics for the NVIDIA Tegra410 uncore
> PMUs, and fix perf's aggregation of the Tegra410 PCIe PMU instances.
>
> The series covers the UCF, PCIe, PCIe target, CPU memory latency, and
> chip-to-chip interconnect PMUs. It provides symbolic names for the raw
> event encodings and metrics for bandwidth, frequency, and average read
> latency.
>
> The PCIe and PCIe target PMUs are named nvidia_pcie_pmu_<socket>_rc_<rc>
> and nvidia_pcie_tgt_pmu_<socket>_rc_<rc>. perf only strips the number at
> the end of a PMU name, so the instances of each socket were treated as a
> different PMU, and these events and metrics gave one result per socket
> and were reported incorrectly (e.g. with --metric-only), as discussed in
> v1 and v2. Patches 6 and 7 fix this:
>
> - Patch 6 adds a check of the cpumasks of all merged PMU instances to the
>   zero-count skip in perf stat, so a socket that counts nothing shows 0
>   instead of having its row hidden.
> - Patch 7 treats both numbers of the NVIDIA PCIe PMU names as the
>   suffix, so the instances on all sockets are merged as nvidia_pcie_pmu
>   or nvidia_pcie_tgt_pmu. Per-RC results are still available with
>   --no-aggr or -A.
>
> Changes in v3:
> - Replace v2 patches 7-9 (merging PMU instances that match the same
>   comma-separated json Unit, naming a merged counter after all of its
>   PMUs, and the ABI document) with a special case for the NVIDIA PCIe
>   PMU names in pmu_name_len_no_suffix(), perf_pmu__match_wildcard() and
>   pmu_name_cmp(). Thanks to Ian Rogers for the suggestion.
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
> v2: https://lore.kernel.org/all/20261030174816.1544471-1-bwicaksono@nvidi=
a.com/
> v1: https://lore.kernel.org/all/20261019164241.403644-1-bwicaksono@nvidia=
.com/
>
> Besar Wicaksono (7):
>   perf jevents: Add support for NVIDIA Tegra410 UCF PMU aliasing
>   perf jevents: Add support for NVIDIA Tegra410 PCIE PMU aliasing
>   perf jevents: Add support for NVIDIA Tegra410 PCIE-TGT PMU aliasing
>   perf jevents: Add support for NVIDIA Tegra410 CPU Memory Latency PMU
>     aliasing
>   perf jevents: Add support for NVIDIA Tegra410 C2C PMU aliasing
>   perf stat: Check merged PMU instance's cpumasks when skipping zero
>     counts
>   perf pmus: Treat both numbers of NVIDIA PCIe PMU names as suffix

Other than the nit the that commit messages adding events refer to it
as "PMU aliasing":

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

>  .../arm64/nvidia/t410/uncore-cpu_mem.json     |  43 +
>  .../arm64/nvidia/t410/uncore-nvclink.json     |  67 ++
>  .../arm64/nvidia/t410/uncore-nvdlink.json     |  43 +
>  .../arm64/nvidia/t410/uncore-nvlink_c2c.json  | 115 +++
>  .../arch/arm64/nvidia/t410/uncore-pcie.json   | 249 ++++++
>  .../arm64/nvidia/t410/uncore-pcie_tgt.json    |  83 ++
>  .../arch/arm64/nvidia/t410/uncore-ucf.json    | 764 ++++++++++++++++++
>  tools/perf/util/pmu.c                         |   9 +
>  tools/perf/util/pmus.c                        |  23 +
>  tools/perf/util/stat-display.c                |  20 +
>  10 files changed, 1416 insertions(+)
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
