Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9943033CB
	for <linux-tegra@vger.kernel.org>; Mon, 17 Aug 2026 04:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786940015; cv=pass; b=QhR+7p9/Tf+Ws1zVJK4PA1c1FAboOAUJEyUwAMz6SePLS3o3lyT9eC0ojoHAV4qgSyedXeNcoc8gdUWuc8js1M+knUb7YHQZoIqqPsdoqJazVR9SJF82YGCgR4DP5cMh47fX3bLk63KU3rOzP1WM9FeJusBSJXDcSI3hNNmnZgk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786940015; c=relaxed/simple;
	bh=5Blta1wT0z6cp3scoqrFYSVq0hVhmY3Q87T2OMyervA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sr7ywLJinsvq2t9Mas7z82zIKtHqFPLpl0iPIjlt+nPDAgVDeHQNRlbKBwDsMtIQgfM/4A6CWZ3r25vNhXBO2bvR7wEVdJHNZst3wgHnO36idKOAof0AajCVuvhbXVgnIPTAXMPHZ4iFKB+sJ3J2ziixlEoGcdY3EyFXN6buJlk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KTfDUxee; arc=pass smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KTfDUxee"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-51c10ed63c0so540391cf.1
        for <linux-tegra@vger.kernel.org>; Sun, 16 Aug 2026 21:13:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786940013; cv=none;
        d=google.com; s=arc-20260327;
        b=DcwHNFT8PbobVuPCZUsQqEgaTS8/amI3uMvHoJijAXlcAro+XXpQQzgZR6Aon9Mij5
         6F+bmY1ZqmhmnkMFCyVX+fV/tKOUnCxskBXzvY4owkN1pWEfgbzo4DkewMAgL8orJeMT
         B39q5pWuItkWOfjN9eY7kSLgyhdTOWsGE3ciwiqrYFmzRWGQV88HH+6HgR4TO1hN6udQ
         JCUUHdh1iflPTMBEyOKow1hlIujwTV0zUJn9AjLaujo2truZeu5xVaoOLaIKcuCeVqX0
         s+LJylD1dLVcDLnnl3h+2Vd4KDvatnuoNcxQ7G8rql8TblWNUWsx1M2Wi9q4e8jRQ07a
         uQQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=m6ws6hhoYl9pEf/rI1rxibuzyydRkmy7kW/80lYzhYw=;
        fh=ndM03nJXbvtdRDpXBBcqmXkJk1IA8FCXyUODKLDWK/M=;
        b=mXJl3fQbEWVuThxAyBZ/GiMV9mPNcFMq0l8YK47KqbGYdYOOVugHXuEzH2iB8VfAyd
         lR/PMR04HFqdcldrHak3WhDokqK8sEm622HNZz++n1FCUfA1W9z95NpNAMhwKfZRFhd7
         pGf2ZDN7+Fn45WZUYrshDDS4JxVRw+S1aDSuVZTKNiP363CURA232qTFmZbWyM3x7+Fo
         cHdx6hMmQG3ZlElpcHL2zjB+JMg4/fNkx7S2OqcCa1duR43VidZrpQjSG3vkdGbbhn3A
         YKZRgAuNA7evWvaucGNjv2ax7xfnDMtNcyDxlmZYTONuw8IyH3oX93KWQ6rumE5gjVFP
         tUUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786940013; x=1787544813; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m6ws6hhoYl9pEf/rI1rxibuzyydRkmy7kW/80lYzhYw=;
        b=KTfDUxeexBcLCHFpTTYXPSd1OJyA2bJ6IMmj15y58ADXJrd86ewmB8eG59UAwfWB7K
         WYZW2fojwclS/7bpFJ9iVFPyTsAydKKS5eansvK789v56Q6FaAPmAP2jLrQ4zTLlKxOG
         ZmyUti3XOmMacKpMXNLIo7ZTRf5XMO+Ix76xHm7t8y5ienS6Uz+EojVvgMBnve2+a4Tn
         7sOfYcQl8dmmQqgcckmIXWujKxA3+Xe9rOQ81QO0PHeVUTCczbByzYk0zmy0keb9xfnG
         IEALccVDlpMBvEY8GSFpLLXFfy2IarPinI73I9jqgCHaFOSgKLo10sPVMfxzPttl7zLb
         s1vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786940013; x=1787544813;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m6ws6hhoYl9pEf/rI1rxibuzyydRkmy7kW/80lYzhYw=;
        b=dqT05j/9DNVW54ZwDu7Bdr8J9qdK7VKLWS4A3c/YbnvB1JECnoX2gXE0v5J5qtJTe9
         l+UfQr8nhULCAUFMWc/SZ8lsxPMwktCvogi0qsaeNEvZ2JXU6dHzean8CTb6nD+IqrRQ
         ndu5tCPIv1r6D0icS7tusHIFh00+1JM1WfJ9ozGsoqxid2bg0DzqDPZStd5sJrAZUgkk
         xudQ1/W6TFpVRn8mRHWec7M08tLZYAuc41bd7LpAz9xxnhRtEceYyTmD0nqOJfD9Cdni
         NDdLJrsR5owhMxyNglgQTI+Pu//YTXyvhe8iwKYWyAsm4+d8NzbJ6h/q/nwtoafxw443
         rkiA==
X-Forwarded-Encrypted: i=1; AHgh+Rpnxy6Eyi6NoISGdfJgXtPKXRohKUqFM293rr3s76aYv8lZJZXG6PCWl/zkEXQrpTHzilR/lhsM02UsGA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZfJsorv2E1OWkNcRf01tojjhzbCn5tZh1MDJNmc5pd86t+bZy
	bkjBKnBnXwUlCwUdEXpo9YGVklcJB6DZZR8bXScvc3CNWheNroN1ZKN95ZHUcj/0tjRj0RHpIs/
	kU/4IRZTk/f/HtWSIoz455vV7fhYxnSdiudUboP/M
X-Gm-Gg: AR+sD10MPdgf8lykP1kH80bGSep53xVLw3iPBBn6HqWbB0I4FSEiS98UXLkrz0ZF7kx
	zwwmRVMbaHNt1EIa62qtuiUiJxmkvEt86tcT7dJ9nnYM0tQL0QwsWJlo72xhC9/gPpYk7Vm2Ns5
	QNCa8ls7iqEQTfc+eZLn23SriwlM3us6yX0F405JKuhiy6wd5Ovi+aXBTbwondsy7NWVNtU+gbS
	ae74K724DFPZcLF7t+z15QOk1KK8BgNkxy9+5vMNSBhcJ48OsHiwb8v1/kJGAYlB1xs9AaNEYMU
	PYiFyCUZF7RhNMnqEF8wixvp5ufK1e2ropqsTtyY7Q6/Lw==
X-Received: by 2002:a05:622a:258b:b0:528:38d6:71b4 with SMTP id
 d75a77b69052e-52db1f07d0cmr5546611cf.11.1786940012189; Sun, 16 Aug 2026
 21:13:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260813170155.1156593-1-bwicaksono@nvidia.com>
In-Reply-To: <20260813170155.1156593-1-bwicaksono@nvidia.com>
From: Ian Rogers <irogers@google.com>
Date: Sun, 16 Aug 2026 21:13:20 -0700
X-Gm-Features: AcwNN1VNLEZmh2YCuKGehmfZoT5-qHlv3AMCfSLe-X8oH-pX3c8TxAnfrF0rZHw
Message-ID: <CAP-5=fURdj7hsk50k-KyiNQD_23KQtAYcNTvKfC93uGEsM0e7w@mail.gmail.com>
Subject: Re: [PATCH 0/2] perf vendor events arm64: Fix Tegra410 Olympus PMU events
To: Besar Wicaksono <bwicaksono@nvidia.com>
Cc: john.g.garry@oracle.com, will@kernel.org, james.clark@linaro.org, 
	mike.leach@linaro.org, leo.yan@linux.dev, mark.rutland@arm.com, 
	alexander.shishkin@linux.intel.com, jolsa@kernel.org, adrian.hunter@intel.com, 
	peterz@infradead.org, mingo@redhat.com, acme@kernel.org, namhyung@kernel.org, 
	linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	tmakin@nvidia.com, vsethi@nvidia.com, rwiley@nvidia.com, skelley@nvidia.com, 
	rajjoshi@nvidia.com, treding@nvidia.com, jonathanh@nvidia.com, 
	mochs@nvidia.com, sauravsc@amazon.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2026 at 10:02=E2=80=AFAM Besar Wicaksono <bwicaksono@nvidia=
.com> wrote:
>
> Fix two issues in the NVIDIA Tegra410 Olympus PMU event definitions:
>
>   - Correct the swapped MetricGroup assignments for the L1 data and
>     instruction prefetcher metrics.
>   - Correct the name and description of implementation-defined event
>     0x0197.
>
> Patch 1 resends the original patch from Saurav:
>   https://patchwork.kernel.org/project/linux-arm-kernel/patch/20260511210=
832.91408-1-sauravsc@amazon.com/

For the series:

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> Besar Wicaksono (1):
>   perf vendor events arm64: Fix Tegra410 Olympus event 0x0197
>
> Saurav Sachidanand (1):
>   perf vendor events arm64: fix swapped MetricGroup for Tegra410 L1
>     prefetcher metrics
>
>  .../arch/arm64/nvidia/t410/metrics.json       | 28 +++++++++----------
>  .../arch/arm64/nvidia/t410/misc.json          |  6 ++--
>  2 files changed, 17 insertions(+), 17 deletions(-)
>
> --
> 2.43.0
>
