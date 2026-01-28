Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4E5337BB1
	for <linux-tegra@vger.kernel.org>; Wed, 28 Jan 2026 08:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769587434; cv=pass; b=A3RhYABQQw8LbvYhMQimDMPvGtZD+OplfqwBA4WbfJO77m+2x2ftCvIEgc9aoAxKZo4p4dPAOUrscakJ939UvD0m9u+nf4AFfBV12IcU0C8mRIZc8mXxBL26etGR+9SuqNd5vuCm3iz0dL36Qj8IyBTBaJQBr43tG6UY0LAq5Bs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769587434; c=relaxed/simple;
	bh=aqn+gN2OxI69735lSHDX86lDwmZbS9vqddn2YqjxpN8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M8YrnhTiV12KMMIzlsqR0ZCNBKn+A8bpX6np/ZukITUALMBUUe11CxwWaU7mAtBDheIAAxKMoeC4S1o9RWyNOoJNtECFNacFEpWPjPvTJTv2je5ZK7BJ9g5ZZp6xj/NfQyMT8unIVw6h8WsHFl1F8S0fMvXu1jTyDpIbR6Pli1A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FtyZqgom; arc=pass smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FtyZqgom"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2a0d06cfa93so47125ad.1
        for <linux-tegra@vger.kernel.org>; Wed, 28 Jan 2026 00:03:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769587432; cv=none;
        d=google.com; s=arc-20240605;
        b=ZsNBnwzBk/gTRXoh+UvpLGh4JdXeEA2xVdmkAq4f3QA++hoxDCapghG3XxmKdDwFfF
         VTI9oSeeYCBzft4uL8Xkq0111BsPCx1MGBsmo3Op58doC6mgoaSM43NqNSjtTVU8vntH
         R7j6FyTpTHtGYTZQQwccZO8lVnoWJuJpzwUYZojKYXr8Cbf/+/Q9Pj+hoiNDiURc9dZd
         1ae8FpEDLJBUPuJHGRNVBTAI4OZ6NJ9A41c3Ylj9WZS9BLPlDQ7qob9Uj2vjddhcUh+J
         yfIrlw1y1Wvv1oh4+sEyj4qA7Mk4dMGWwp08tDAdbAPPc6FqNrhbtZXwrBlKHCjhkz6M
         NI8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kwxqyPY7kwvh1qYq0RNe4lMNJMkXau1MJhNry6YmLss=;
        fh=qSwhCqHBnjJbwS6NKakiXxaE0H5ezss6Z5jb92RCS7s=;
        b=SFRYt7i0jGWNe5Qy4kfVXYGCywoGbqR21cMikWP0NMhzjgkJg8yZm9bW9x8GfgBAws
         NXSLDIphoE/AAU+L2av5J5lal67/FvQwvtLTObzPhKcQxS6dkaUqLGxgCP5WYNxvnQ2P
         QDN7gAAthsrixmhCzZTurehSpQYslAAyj/PYpO+muA3X2CAUKYP/zzV1LouxloZajpmE
         NgQAUmWLprZ1mGUIVgpvujCmkFZ6ZL+1L6N5b19fMjXCCkfC7x122GcIjRGOfTpBh06Y
         Yv62riBWB0D0mSuSuli8YE9gkg+5T8VWN1c6R9ZM+rMp20iq5J6+CfeDIa6sJpiA/wlG
         2/Og==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769587432; x=1770192232; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kwxqyPY7kwvh1qYq0RNe4lMNJMkXau1MJhNry6YmLss=;
        b=FtyZqgomLOQzIcb530lwU0srOzkzzwPj8YVFumXkpsz4njhIpgUKE5+iU8QFkxvRVw
         NkvChfDP3jNBvViTnBKQWeVUy6tJLjKeYNLcwW4TiyxloUNc2hDjiufymK3/e3xQXDeI
         NfY+xUR5LwyrRvkSp5tQhD8OzuJow+lmILEvawhFOK3FleILFv/exV7lxNRCGAFoT/uy
         3Fbskhwr9wZ2S4kD9BX/Z5jKwMZ4mLxfykn+JFfi+1SsorFi9VEUZATXMeTDYpshwtgK
         B5eiGbeYXAQgvvKMpJHGv5TaEqvDzjhlhnp5FdnU+ujvUDwsTr+w9IF6TSSnQCvZsEpP
         CWNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769587432; x=1770192232;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kwxqyPY7kwvh1qYq0RNe4lMNJMkXau1MJhNry6YmLss=;
        b=AxdYFzOzzwp6kmFAkQjuRmvnKywbHgmZRFwTb/r5wGus3CFXNVLcFpy7M28WrB51uP
         wtWOStTXnqhhouD1yNuXRIQp92GLH6vvPr6F1tjK9P9hcrCqZZUE9MJUhMVRaqxotFzy
         j8T4Vyr/+mbljn4spFDqX+TNPB7Z0Mgs6V6mPYz47uhFczWu/Mu75/xjkm4PqlUpk+fz
         7NxjS/YfsNCdFPsB7t3N3khZxorB+6UzFQVEDgVnLcQ9BgJxw1MEWOKkXOZfZAUyp0PZ
         FkgJerrmcKpH4ZYM/5OCmOOiaiDjMTSuo6Ib+29+W/3lBuwDtzttMFRtLXcPAFXB/pg9
         svbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXV0BlNIrpD3yuEdi9aeDczGHbKar2ppbYmxWSBrec91lmdiG71RLDoNnNPbWZwWyA+c1a2htHekKG76w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzkVHwWoxvP6mb4AKpA/ZZw9BplDEh6iSAjoDlMkO260BwwKsgY
	C28292v/08P0AizjqiKYE2x9uTznAnvdxjX+7qN3whXKcC3Q8vLHM9dnjKZ2ezEaZSNYao+y9Qe
	g4LAjtBHA6G9Hi2z+FuvPtK4c7OfOKsj6tOlk9PXr
X-Gm-Gg: AZuq6aJqU2QITGbwbKfRiDluzZ4a99//JTTcaXsLGKaY7lLYglMdjmheivc1nbRkJ/z
	EjJeWVRdtwTr88itVKRD78XmldgFZXTUZly0iHQJ1N8nSgSFz4oGCtqSNMsJp5t7pwHCFL+kT6d
	Omr9w9Voblq8TwL55Ejv+NHUwpEnxm/aCloPDzJPfrpZ9BWOdf3lulSunmT5UXd/wcKk8W5cPWm
	BHkVaviIkZTJooNm20sNMejihLWhhbU8xJHjU2aJiJRVNOjFJer+VYGb/tZ058TyAAPoQK+
X-Received: by 2002:a17:903:3c2d:b0:26d:72f8:8cfa with SMTP id
 d9443c01a7336-2a870b49cd1mr4464695ad.13.1769587431647; Wed, 28 Jan 2026
 00:03:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260127225909.3296202-1-bwicaksono@nvidia.com>
In-Reply-To: <20260127225909.3296202-1-bwicaksono@nvidia.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 28 Jan 2026 00:03:40 -0800
X-Gm-Features: AZwV_Qh52YOdWkzhjqwDKEE_iLJJ8-fVjQ4au_Elxnl29BT84Z16fQ67obstxk8
Message-ID: <CAP-5=fUxhbR1xs1f9mrkcUXZZNLrVqDG0ebhwW--WtgVRnNxNw@mail.gmail.com>
Subject: Re: [PATCH] perf vendor events arm64: Add Tegra410 Olympus PMU events
To: Besar Wicaksono <bwicaksono@nvidia.com>
Cc: john.g.garry@oracle.com, will@kernel.org, james.clark@linaro.org, 
	mike.leach@linaro.org, leo.yan@linux.dev, mark.rutland@arm.com, 
	alexander.shishkin@linux.intel.com, jolsa@kernel.org, adrian.hunter@intel.com, 
	peterz@infradead.org, mingo@redhat.com, acme@kernel.org, namhyung@kernel.org, 
	linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	tmakin@nvidia.com, vsethi@nvidia.com, rwiley@nvidia.com, skelley@nvidia.com, 
	ywan@nvidia.com, treding@nvidia.com, jonathanh@nvidia.com, mochs@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 27, 2026 at 3:00=E2=80=AFPM Besar Wicaksono <bwicaksono@nvidia.=
com> wrote:
>
> Add JSON files for NVIDIA Tegra410 Olympus core PMU events.
> Also updated the common-and-microarch.json.
>
> Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
> ---
>  .../arch/arm64/common-and-microarch.json      |  90 +++
>  tools/perf/pmu-events/arch/arm64/mapfile.csv  |   1 +
>  .../arch/arm64/nvidia/t410/branch.json        |  45 ++
>  .../arch/arm64/nvidia/t410/brbe.json          |   6 +
>  .../arch/arm64/nvidia/t410/bus.json           |  48 ++
>  .../arch/arm64/nvidia/t410/exception.json     |  62 ++
>  .../arch/arm64/nvidia/t410/fp_operation.json  |  78 ++
>  .../arch/arm64/nvidia/t410/general.json       |  15 +
>  .../arch/arm64/nvidia/t410/l1d_cache.json     | 122 +++
>  .../arch/arm64/nvidia/t410/l1i_cache.json     | 114 +++
>  .../arch/arm64/nvidia/t410/l2d_cache.json     | 134 ++++
>  .../arch/arm64/nvidia/t410/ll_cache.json      | 107 +++
>  .../arch/arm64/nvidia/t410/memory.json        |  46 ++
>  .../arch/arm64/nvidia/t410/metrics.json       | 722 ++++++++++++++++++
>  .../arch/arm64/nvidia/t410/misc.json          | 646 ++++++++++++++++
>  .../arch/arm64/nvidia/t410/retired.json       |  94 +++
>  .../arch/arm64/nvidia/t410/spe.json           |  42 +
>  .../arm64/nvidia/t410/spec_operation.json     | 230 ++++++
>  .../arch/arm64/nvidia/t410/stall.json         | 145 ++++
>  .../arch/arm64/nvidia/t410/tlb.json           | 158 ++++
>  20 files changed, 2905 insertions(+)
>  create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/branch.j=
son
>  create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/brbe.jso=
n
>  create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/bus.json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/exceptio=
n.json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/fp_opera=
tion.json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/general.=
json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/l1d_cach=
e.json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/l1i_cach=
e.json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/l2d_cach=
e.json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/ll_cache=
.json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/memory.j=
son
>  create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/metrics.=
json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/misc.jso=
n
>  create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/retired.=
json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/spe.json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/spec_ope=
ration.json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/stall.js=
on
>  create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/tlb.json
>
> diff --git a/tools/perf/pmu-events/arch/arm64/common-and-microarch.json b=
/tools/perf/pmu-events/arch/arm64/common-and-microarch.json
> index 468cb085d879..6af15776ff17 100644
> --- a/tools/perf/pmu-events/arch/arm64/common-and-microarch.json
> +++ b/tools/perf/pmu-events/arch/arm64/common-and-microarch.json
> @@ -179,6 +179,11 @@
>          "EventName": "BUS_CYCLES",
>          "BriefDescription": "Bus cycle"
>      },
> +    {
> +        "EventCode": "0x001E",
> +        "EventName": "CHAIN",
> +        "BriefDescription": "Chain a pair of event counters."
> +    },

Cool stuff :-)

For wider counters AMD does something similar, but should this be an
implementation detail rather than an exposed event? How does it
operate as an event?

[snip]
> diff --git a/tools/perf/pmu-events/arch/arm64/mapfile.csv b/tools/perf/pm=
u-events/arch/arm64/mapfile.csv
> index bb3fa8a33496..7f0eaa702048 100644
> --- a/tools/perf/pmu-events/arch/arm64/mapfile.csv
> +++ b/tools/perf/pmu-events/arch/arm64/mapfile.csv
> @@ -46,3 +46,4 @@
>  0x00000000500f0000,v1,ampere/emag,core
>  0x00000000c00fac30,v1,ampere/ampereone,core
>  0x00000000c00fac40,v1,ampere/ampereonex,core
> +0x000000004e0f0100,v1,nvidia/t410,core
> diff --git a/tools/perf/pmu-events/arch/arm64/nvidia/t410/branch.json b/t=
ools/perf/pmu-events/arch/arm64/nvidia/t410/branch.json
> new file mode 100644
> index 000000000000..532bc59dc573
> --- /dev/null
> +++ b/tools/perf/pmu-events/arch/arm64/nvidia/t410/branch.json
> @@ -0,0 +1,45 @@
> +[
> +    {
> +        "ArchStdEvent": "BR_MIS_PRED",
> +        "PublicDescription": "The Event counts Branches which are specul=
atively executed and mis-predicted."

nit: The capitalization on Event and Branches, as well as other words,
is a little unusual.

[snip]
> diff --git a/tools/perf/pmu-events/arch/arm64/nvidia/t410/metrics.json b/=
tools/perf/pmu-events/arch/arm64/nvidia/t410/metrics.json
> new file mode 100644
> index 000000000000..18c2fd58ee9e
> --- /dev/null
> +++ b/tools/perf/pmu-events/arch/arm64/nvidia/t410/metrics.json
> @@ -0,0 +1,722 @@
> +[
> +    {
> +        "MetricName": "backend_bound",
> +        "MetricExpr": "100 * (STALL_SLOT_BACKEND / CPU_SLOT)",
> +        "BriefDescription": "This metric is the percentage of total slot=
s that were stalled due to resource constraints in the backend of the proce=
ssor.",
> +        "ScaleUnit": "1percent of slots",
> +        "MetricGroup": "TopdownL1"

Note, on x86 we place TopdownL1 in the Default metric group so it is
shown by `perf stat` when it isn't given events or metrics to compute.
Perhaps you want to do something similar?
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/perf/pmu-events/arch/x86/icelake/icl-metrics.json?h=3Dtmp.perf=
-tools-next#n116

Thanks,
Ian
