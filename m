Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792528735;
	b=F5rFTAPPW3I92Vfbuy5wW01p0BcYY2GjNa/R7EfngNXpBezmriSODRFYuMFlNOMHqC/o
	 p06f00cxYu6a6GwO+LDKxb/RrKZ9tO4ZSKag1izxI9HTfoEUPW0d98rSnvYDasDhm4GBU
	 wu/yHd5D2VHqLTnBAk9dExANaoxDyjvuN0L3QZ38MHw8sizaRWU+9eoospwXL5BSkzf0x
	 ebBph52MVFr4XQTp4Mbl6L92emY9SQkylXM1tll6aiQwOzfuOgAT5o5i/mB7/Ao1ZefoD
	 j+Y7tx3GlgWFViDWkzIrGg2NLMwUV+ujgHGdYq++LYYnZn1a2nwv4x9OqDvXeVNuL2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792528735;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:CC:Subject:User-Agent:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Jj9W1Fne0Eiht74C80diOWke64Mz4zGkFNYLVP0fVM4=;
	b=3gjm0rIiFf+xHpnsH4xwhXPJWR2hPeFahbLka/b8GtzcWmWkfCeLvOhza9NIBMVZnvm0
	 Efw/uvczRzszl8grX1RpjPS4RJkDChlJb6qBQb54ZlB4xvZIwXXoNL3V++wY9GmCyYdLP
	 bmyR0AngZRIPIpA2q8MygiSKzPncSNlV3V1jecWNXoJu8q2sJdR42zt4MEcfS//QZwacs
	 K40O/fAbZ7yUpy+LXQ7aFBf8voO/DNLvPAthsRXJXJOfcYW4TrbHRgGosqtBKN5K0E+ev
	 5eF+A2NH/9trcJxVzVdmrX0ZncQwe9nTvZft/XC5I+9SXUSTkhGMFQO2+8NgXfFcgzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jTBO8R2R;
	arc=none smtp.remote-ip=209.85.222.50
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D32606A319
	for <linux-tegra@vger.kernel.org>; Tue, 20 Oct 2026 20:38:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8D32606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jTBO8R2R
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-99071945aa7so33437241.3
        for <linux-tegra@vger.kernel.org>; Tue, 20 Oct 2026 13:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792528734; x=1793133534; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Jj9W1Fne0Eiht74C80diOWke64Mz4zGkFNYLVP0fVM4=;
        b=jTBO8R2RDGFldB5sTmqyvIMD7lIP4ciDhUAXegojI3fPn4+naP/jvyuk1AUOiUxOpc
         U6RsmckMC+p1qW1pSrLeSvNhQb5tUomZopc2/16tD5QSu0rlwuTS/gGEA0KPb59hywPA
         EizmoNKwQ1tDYD6zwtYymLyeijMj+EOkGmiGR/UFeX0a9k3HAK9wOJXNzoMlBrZUUQ6V
         TqePOZxYKOoLdz7OO5bkhibxzmXsNzBSX6j8tGg/HEl2BZv+UHGS51KNmrzRK8jEugEP
         xS1omLgaia3/NIswYLQBJelu6dBbW2j/4sQKZec8HlZgcVqvqLiK4Ry60X3YDFzSxwsx
         nTMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792528734; x=1793133534;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jj9W1Fne0Eiht74C80diOWke64Mz4zGkFNYLVP0fVM4=;
        b=eG3hrLnxnJOq0RZ1vvS0kjTczMtEVoE/xDpv4+Nf0ePLaZCtYWPkYfvqaQtjeAiJp4
         Tjyr9BPXZML0XRYy/5RZkKzUjG4N+MIwDpX0TT3Q6nexXgNdFtQtLYRP+PefRIFW71c7
         Rhf3BQfCYL7a8zqzPM6DC9FWbcoixbuojB+NmIOeJVY+X8VZn7ugLnuL7YUSlCzjserD
         w09RlRoEZEnlIzCtTbEE2HBKWeu2R3CpNiDcgbvXvoL92etYVbTg/29+Tw1d8qNazx3e
         7qFe+9pOsIev4vgQ9X/IqsS7fN6M/U+SWRRE/I0vTJPfmsKbAlypIh5FRoLYUWh9evsw
         rYhQ==
X-Forwarded-Encrypted: i=1; AKwUvBxdC2rG9QwKgPYSd0qOJOMav74uj7cedqj+Ih/Exajcbzg3W1iKmM2mzYhsbKeMvatFUjP8aBAmIh26/Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYLMo/AZstT2gh3lEhj+2gd4/ogC1Jri+YCLPp+8pYrr3AA0atGH
	HTUmwTMH2TUgrCgwB6mmiaBtOtaQ456BhiCtP+yNVNrzqKpYXSB1ooY6
X-Gm-Gg: AYBFou0IdwYAWxOzBTbl1hoy6ayiliK/FW5fKIimKfgBhNcWLBQV3OOPI9qtWwWm+yQ
	/hYuBNCFQjWLBOblM8AnvUHvok8LsgwPOvq74Bw3nj4sxFZGr3nE7RJrwU5Ya8CtX/C0dEKrYTr
	zuSJptkBMjM6llQmvzNQ3c3IeSte7SEf8ug1CU9/YXqg2avUrAFnqs3Te02Bm0vxpQCpgebOkbN
	VOnPEOwwsweP3YBnA+TCmACr/m98e5udt4LHGmIWfZoTze8/56Jtb8hfL6jzhCnxGLa9JqyQ0+U
	WXMULwDPvGeUMG7jGojV04as88/Q1ZpWR1SgepDjhnZp0LGBoh10fyaZkAbjlNUZDlnLa4fDsZs
	W/sa9nN5Ok1c54hkKGKCLwoLvnmUBlR0Ft4vc8vpZ0mcNT+sFxlsmNOjJcIv2G++Q04xsDyxMWe
	crMpxDRVa+7GaTnFE6ScVlKj6anjwRsamwxfR1q2NpuqIql3MzHU8hDDL/G3xeLoHod6ZVQUsjo
	XZpmr3EOJkLkZQqEmWHLZf61A==
X-Received: by 2002:a05:6102:2b85:b0:7c0:c6e3:3b88 with SMTP id ada2fe7eead31-7cc926fba03mr132043137.28.1792528733875;
        Tue, 20 Oct 2026 13:38:53 -0700 (PDT)
Received: from ehlo.thunderbird.net ([2804:2bf0:60e7:ae00:617a:6625:1f37:5d9f])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cc92428d7asm405406137.10.2026.10.20.13.38.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 13:38:53 -0700 (PDT)
Date: Tue, 20 Oct 2026 17:38:48 -0300
From: Arnaldo Melo <arnaldo.melo@gmail.com>
To: Ian Rogers <irogers@google.com>, Arnaldo Carvalho de Melo <acme@kernel.org>
CC: James Clark <james.clark@linaro.org>, Besar Wicaksono <bwicaksono@nvidia.com>,
 namhyung@kernel.org, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, vsethi@nvidia.com, rwiley@nvidia.com,
 skelley@nvidia.com, mochs@nvidia.com, rajjoshi@nvidia.com,
 treding@nvidia.com, jonathanh@nvidia.com, john.garry@linux.dev,
 will@kernel.org, mike.leach@arm.com, leo.yan@linux.dev, mark.rutland@arm.com,
 alexander.shishkin@linux.intel.com, jolsa@kernel.org,
 adrian.hunter@intel.com, ctshao@google.com
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_0/6=5D_perf_jevents=3A_Add_NVIDI?=
 =?US-ASCII?Q?A_Tegra410_uncore_PMU_events_and_metrics?=
User-Agent: Thunderbird for Android
In-Reply-To: <CAP-5=fXUMVJwtAp+8dA8V=hBD9q4x6J4YiUufwXAOXcAJoAKTg@mail.gmail.com>
References: <20261019164241.403644-1-bwicaksono@nvidia.com> <21f58af0-fa3f-41c5-ab03-216c60fbe2f1@linaro.org> <ate93zQFkfAecIv2@x2> <CAP-5=fXUMVJwtAp+8dA8V=hBD9q4x6J4YiUufwXAOXcAJoAKTg@mail.gmail.com>
Message-ID: <F2F3FF02-67B6-4EBF-BD4B-364C7CD28535@gmail.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On October 20, 2026 5:32:48 PM GMT-03:00, Ian Rogers <irogers@google=2Ecom=
> wrote:
>On Tue, Oct 20, 2026 at 12:15=E2=80=AFPM Arnaldo Carvalho de Melo
><acme@kernel=2Eorg> wrote:
>>
>> On Mon, Oct 19, 2026 at 06:23:16PM +0100, James Clark wrote:
>> > On 19/10/2026 17:42, Besar Wicaksono wrote:
>> > > Add event aliases and derived metrics for the NVIDIA Tegra410 uncor=
e
>> > > PMUs=2E
>>
>> > Reviewed-by: James Clark <james=2Eclark@linaro=2Eorg>
>>
>> Thanks, applied to perf-tools-next, for v7=2E4=2E
>
>Hi Arnaldo,
>
>can we not take these in v7=2E4 as there is unaddressed feedback:
>https://lore=2Ekernel=2Eorg/linux-perf-users/CAP-5=3DfWucvdYefDOL3Vn=3DO=
=3DYUPEXE+tngDDfPLv-T5i3WkCJVA@mail=2Egmail=2Ecom

Sure, will remove until the discussion comes to a conclusion=2E=20

- Arnaldo=20

>
>The specific problem is that the NVidia PMUs have adopted a convention
>not supported by the perf tool of 'pmu_name_<socket>_rc_<num>'=2E rc
>stands for root complex=2E What ends up happening is that aggregation is
>broken as the json is claiming that pmu_name is the PMU's name while
>the suffix perf_pmus code thinks pmu_name_<socket>_rc is the pmu name=2E
>They've wrangled support via the json by claiming these are sys
>events=2E
>
>We can either:
>1) support a new suffix convention of <num>_rc_<num>
>2) push back and ask the driver writers to name their PMU correctly as
>defined in the ABI:
>https://web=2Egit=2Ekernel=2Eorg/pub/scm/linux/kernel/git/torvalds/linux=
=2Egit/tree/Documentation/ABI/testing/sysfs-bus-event_source-devices
>
>If we do (1) then it would be nice if the support for that could be
>contained in this patch series=2E In any case these events don't belong
>in sys=2E
>
>Thanks,
>Ian
>
>> - Arnaldo

- Arnaldo 
