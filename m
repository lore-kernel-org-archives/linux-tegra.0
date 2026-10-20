Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792528381;
	b=OWS/CVOfZ93FAhoUC1tA3uD1fGfKfdiHRl3kDG5izFxlKKi0N+wx95xnEYSZ6e+U6Ukw
	 0T4sanN7pVAMQPzdd+AjlYE8duG+CBEXSSixUV7ssVq+RJzQGXS7FV8ws0X+WzDNTRFk7
	 C+9+BXSQYf9MjEfbLW4axQYFXm4VfM5jiA6OjEVwXIuEaJKqo5ryxIFgXheh7HGx9Z/hD
	 t1oHDniOekQTYgKsIbijnu+Vk0YLlVDGdzPyAN5FXxhDkRaRKqoEBQyUPWV8vyQjQsu1n
	 FHNNx0HSZGleZfI7kjaBcs+MHE5RHY39B5T0W0aeu3bfQhEj83UF1eTUG7G1/8GXsTQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792528381;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=QMefv3/6k9FkgL+3cbApnvKoEevqgboVZWdJy3KQ1RU=;
	b=pVMIlNx/fHqtbzE1hkmmzbZxpvyLySCZdIjg5yi67+DjglJ4Fhw8cyV/rEeZIZbtLtxi
	 bKPMqdDG075TTQg0HCpSVKo2JWXDAqfxuO4YhAp7yQHr6UlniON//WFKVbCnG1+tMy+LH
	 iWGNUtOQnhSDvappbjye1040DjzfY25M95IDKpOGSz+MB1isZBIUmbMowOCRv/ALrMcd5
	 5e2Z+Sf4IQzmFQCatHkrVb9ac5aOeb9kaW8QypcXGNjqvzYvx/JGwjya5O1GldRLmPI5W
	 a403HecDy9HYaQdWzsCSK+ZaL0/0EYmcmeTmMBPBcMPFhodhxc9oNbziviUbp7zJRYQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=INaSu8fI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768E9606A31E
	for <linux-tegra@vger.kernel.org>; Tue, 20 Oct 2026 20:33:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 768E9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=INaSu8fI
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-5337c7b9937so83421cf.0
        for <linux-tegra@vger.kernel.org>; Tue, 20 Oct 2026 13:33:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792528380; cv=none;
        d=google.com; s=arc-20260327;
        b=KvjtVAoT9Yprj9DQpBgNe6YnhGt1ib8Q4orJuVEf7Any3cWJ6K94zLWQioHhS8gIDL
         LjoqW2CHIoOCDsrpon2TOPBRBD8ClY4l9a/PAfG30OCD7U7LDkUX2vLQa6qXVZher/Gi
         MkraxxeCNI/tuxtHKIIjx+6GlDgN6Rq4uIvFVLa3EI/CwTDoNlmrfuLE0q/r9WfvTG+A
         Arg8X5mUiS1BEQnEi6zCv9vgSqbIyVqph9bRGJJor9egijDGbKYaM/G+R/we03jHptvV
         F0osWWSajtIS9Z+PXgwe1DHCkxAi23ieKt2cKanTgZvi1FYdf+nLWSYzNHV6ZQPhkLvR
         dsfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QMefv3/6k9FkgL+3cbApnvKoEevqgboVZWdJy3KQ1RU=;
        fh=qrtB1Aremw5blDJF//0f86R7L/hVpLSw/TC2V2ZfJD8=;
        b=azMV2CpB1tNZsGkgY6Fc1JF3NeKw5YCJZzsqjOM8xvwzfT8gNIxpEWnqrHix/nfC/g
         YhScFyeSEaMjdA9MXUZcir9LCfrZ97I1qWxFS0tgjkCmwoDYYwu3NtJ4FkxAw0vMnbGG
         eggZkSNlu2ES62j2NS2Pg+EUHRDm/QL/OwT4xAp163EXRdo29Q6g/OZOI2KqRalpZGYb
         Mi2M6pnNlfAk8xBFZX8Y6aQCMyLtPCLXMe4wQ1WwZjr+A1VlKReYOPnz2oW1XUur1MmD
         t/jMdQZLsLeDvPkTRM5+Ne1mQQa7GR0VcD4QCl0KDlijXalxjKhNWMtl1GDCxcYH8+Uw
         Q8eg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792528380; x=1793133180; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QMefv3/6k9FkgL+3cbApnvKoEevqgboVZWdJy3KQ1RU=;
        b=INaSu8fI/7lJBJ0KTHaoc6xXLKw/+UVbNqMVNmC0u3YPecgPvG7my29CGG2Hf86BRl
         UohI/DvxwBADAiDrGI7Mo7R4ayl47O2Df2mGk2mBN3zupJ3q/D+Lwyqd/66bU8J0N1uy
         sr5QnQO4M+IwF6/P2lwJO31Xo6RDR+NNZMDcAL2ds0LuSZAj5Y034e/HUIGdO75taV18
         hcaxzj+JdGcisLATb70lncWRDsJkkjxRhhpWsejh2R5gQgzl6VTY2YKqdlPdMSHPd4Q9
         zFXbSfbj42NLZ8+s3WdSCUl5szgPNA0/UUKA26SntDhmhjTJwJXF+FicjSHwMHyXNPxN
         4ryA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792528380; x=1793133180;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QMefv3/6k9FkgL+3cbApnvKoEevqgboVZWdJy3KQ1RU=;
        b=RTb+quXkz7ky8pIyW6B0KmR7Dm0/kynnBB7SfXaWd7AYw3Bwwsm5Z4TkKiD7cD3OMc
         L1zYyrCDUt0EsiMaDbGhIoSl3ea8CYbtXp+Uht/X8DLiGak63BPCr4O7WrbbtbBFSwIe
         Rz4phuXm+o0yFXf1TgRVWZoghjmn6wb2e0jAIzEPUYl/QfOOVA9uRl+KwgjnzoUecJG5
         rLd43XA6Qm5WaZanL31IsroLitb35Kq34FvuhYU1A4g7kaQAPeEy7fjb046xylSbY/nz
         MKjawZ1FYOIObvuyUOgZ9xpQnmYHirJtRfbWFhZpUq5eFHfr2Ekyqer4pJDgCQPVevYP
         mTgQ==
X-Forwarded-Encrypted: i=1; AKwUvByVQmpBJ3dEPrX1sAavIhXMnCTVjNeXYB1T9OJUzdVJufWsfvMvl+Jkyjo2EiCYc2wtl9bD52vSL8NwoQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYIbRdR+yS7LQE6ioWWiNko4jeH1bMC6CG9exJZ/lnZqkY66txry
	M9cVbNsGoRfGMsJex0BuE/70u8jwRpEdmswc6h/+f0IwzlpZrflpAMA5qpiFGFu1VUffhZ+OMGA
	nelrsY7wIT3ZGYst10aavYtQEZQvvx+LwDFeY0tE0
X-Gm-Gg: AYBFou0uR+GR+uRmbtMl80HjOfFd51+2Vx2QJKNvLIzdzGas9EoMUsT32FaERp+F+3E
	4aiF4yy4H/DlA2E+PLOfG5I2ZUa5nfJLQO55aQZMeYvSORZvaLxsXON1b0fj2FHViEGqeZCSUSl
	E9ggt+EyAiL3ZEEah1Sa4Sq1fAaG5OSAJZ79L4a9OT/OKsScNn7VhPx7/7GUtur8SybzKyO5Fte
	sVEOSgAZBvGVpLzuvgX+miOTYJ0sRTm+9Vld+B1lN/YiKIDioFnLpus8wXHU3/vhWH3NmwRF+HN
	Br6Kd0xXIOycY0LOfgsn21fyCyDslEUFhpyJU6vX6X1b+VtogyUtFAv2b1HumBSQb3vGkGtEGuA
	vvoscCLFGgA==
X-Received: by 2002:a05:622a:1b9f:b0:535:9aa3:5ebb with SMTP id
 d75a77b69052e-536882804d2mr9529261cf.8.1792528379608; Tue, 20 Oct 2026
 13:32:59 -0700 (PDT)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019164241.403644-1-bwicaksono@nvidia.com>
 <21f58af0-fa3f-41c5-ab03-216c60fbe2f1@linaro.org> <ate93zQFkfAecIv2@x2>
In-Reply-To: <ate93zQFkfAecIv2@x2>
From: Ian Rogers <irogers@google.com>
Date: Tue, 20 Oct 2026 13:32:48 -0700
X-Gm-Features: AclHuK9CSuFZK-b6UAodiXJykR-dvBn1qDmPctgNXXAV69jhyRNTIACuSsADFoU
Message-ID: <CAP-5=fXUMVJwtAp+8dA8V=hBD9q4x6J4YiUufwXAOXcAJoAKTg@mail.gmail.com>
Subject: Re: [PATCH 0/6] perf jevents: Add NVIDIA Tegra410 uncore PMU events
 and metrics
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: James Clark <james.clark@linaro.org>, Besar Wicaksono <bwicaksono@nvidia.com>, namhyung@kernel.org, 
	linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	vsethi@nvidia.com, rwiley@nvidia.com, skelley@nvidia.com, mochs@nvidia.com, 
	rajjoshi@nvidia.com, treding@nvidia.com, jonathanh@nvidia.com, 
	john.garry@linux.dev, will@kernel.org, mike.leach@arm.com, leo.yan@linux.dev, 
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org, 
	adrian.hunter@intel.com, ctshao@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 12:15=E2=80=AFPM Arnaldo Carvalho de Melo
<acme@kernel.org> wrote:
>
> On Mon, Oct 19, 2026 at 06:23:16PM +0100, James Clark wrote:
> > On 19/10/2026 17:42, Besar Wicaksono wrote:
> > > Add event aliases and derived metrics for the NVIDIA Tegra410 uncore
> > > PMUs.
>
> > Reviewed-by: James Clark <james.clark@linaro.org>
>
> Thanks, applied to perf-tools-next, for v7.4.

Hi Arnaldo,

can we not take these in v7.4 as there is unaddressed feedback:
https://lore.kernel.org/linux-perf-users/CAP-5=3DfWucvdYefDOL3Vn=3DO=3DYUPE=
XE+tngDDfPLv-T5i3WkCJVA@mail.gmail.com/

The specific problem is that the NVidia PMUs have adopted a convention
not supported by the perf tool of 'pmu_name_<socket>_rc_<num>'. rc
stands for root complex. What ends up happening is that aggregation is
broken as the json is claiming that pmu_name is the PMU's name while
the suffix perf_pmus code thinks pmu_name_<socket>_rc is the pmu name.
They've wrangled support via the json by claiming these are sys
events.

We can either:
1) support a new suffix convention of <num>_rc_<num>
2) push back and ask the driver writers to name their PMU correctly as
defined in the ABI:
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/ABI/testing/sysfs-bus-event_source-devices

If we do (1) then it would be nice if the support for that could be
contained in this patch series. In any case these events don't belong
in sys.

Thanks,
Ian

> - Arnaldo
