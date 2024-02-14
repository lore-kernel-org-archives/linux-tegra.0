Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB6384FA7
	for <linux-tegra@vger.kernel.org>; Wed, 14 Feb 2024 17:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707931190; cv=none; b=KP/9ixy9VoF9uw0B4EjgRbrlZ9qLkGLEM/31I1ZCBVejEflEjG2vA3syKWOUQoJrtZObfLsW087OCWngnVTciymABaxdSuwZF+UywOWgzL2PngnagMkupWWcLl82i/fPAKTNAX8Dz5Gyql1Bi72eX9UzNrCos+hASOWmE68XWQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707931190; c=relaxed/simple;
	bh=Yku4QTzDRgKI/i8hKOFaa1PxharxpUPm5kuh1Z3KMas=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Prkl1PrdbxSrEW8KB1XUM1hm4JDBwUDmdYOI5zIt6bMpgEHBTv+rBsdnfd82+XJpbPNBBRs7wO3t6a1pTwnYHlOj8l8vuaD1XeEkfSsa9YlddJ9nSRjdXlfEoxB18KXDLc5R0TLnsdf8rh8mTEVqamKJSsn2Saiit0tLMmlhV90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bz2viO5C; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bz2viO5C"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1d94323d547so50368005ad.3
        for <linux-tegra@vger.kernel.org>; Wed, 14 Feb 2024 09:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707931187; x=1708535987; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kQJxYiPtkKunXHr1tWOWmm3RzE0fHMgYFU5N+FoanzQ=;
        b=bz2viO5CXR43zHcNBPXSQpr8axEtMcy6ugW9CYGG1Dg3Ei1haWIZcwbHlbyoVQDMQ4
         0jObCmRQs5ZYIbbHCKY/pVWw3MAdFFG+bU6GBKz5T1CaqR1veJY2i6RMqyA+cmOvBObq
         UNfXg5sw3jDh1HpblzSn2ZKpUWwXmdbmWE4KtydlQylNrklVKXO2S0jq+0tn+rRZpxbn
         OlIbro1TGzQwJLqrDh4txKaz52dlkrhX+Oqb50tGky4eJ1EKzIopcBTMKtzsiVUsv+dv
         HKbLsM0cIzS+gIrtXfMjuhW7rppLJsCZ5fZ0TfTibyLLYvsmTcRNCgGn3eG7YTbUnvnB
         36+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707931187; x=1708535987;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kQJxYiPtkKunXHr1tWOWmm3RzE0fHMgYFU5N+FoanzQ=;
        b=ofpO5/XrO5yEnrp0ptuYc/zlvKZar1EWgewpDDA0lX15Y7TcBI00TqTJpwLXXDnbBK
         DqPXxneMnhI/9A2geagwk1Jhw2kuqAqrgrrC7EkC+4Rp80GoDtcOZ8mhgAJpU4LnCk2I
         +urTTe0NU017z1e1HQ0vDq8Sg0jBr4T9VCrgFy+D3cDsCR/4p6BktZ1/I37d3nXesaXP
         6wN3bHzHpwESdCuf1qc1BSE6yFWVGP2LMd/FBFtRejrptDHLwxc8096HShe0q6EMR5r+
         bvJ89aHj0jRPND9aEbLJ/9Qk+QzCNPm5EW9xC1pNcJRsno4Zp3P/1BNqhpFsggJlMT0C
         ouWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNqYJyPVbbg66o+cYMT19aQWcDlZaZn8BMKwRfVuHnIN5qAPdUIwuarpu8tb0NQgSSQn9o0ktzn5ch6xzxTaUmpNLANQQgsll+0AI=
X-Gm-Message-State: AOJu0Ywvx0Y5KkvXQWGhszg0TkL2o5yrsJJtYdEquDFPlpTRU//DhpN8
	b/pkp26DCMjRATOWuzenlnFeJpdsfSi1OgLcQ6LQmpsyfrch0OY0CEc7yuGvtmtrYhSbPV2zp3X
	pWrNSbN034y1aTbuQVI4VjtaAVOK66NXsnCxKnQ==
X-Google-Smtp-Source: AGHT+IE/4Jb60J8umLNZe6538ribl0j0RPOFasDoPpDRIFX5AjneBXpKfyUvuFsnp7LDN4A0Ix05qgk5V9Wx9geOoCA=
X-Received: by 2002:a17:90b:351:b0:298:ba30:789b with SMTP id
 fh17-20020a17090b035100b00298ba30789bmr3088028pjb.32.1707931187327; Wed, 14
 Feb 2024 09:19:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240114183600.135316-1-vincent.guittot@linaro.org> <6ec54a8f-a602-4f33-96ce-0204f07046e1@nvidia.com>
In-Reply-To: <6ec54a8f-a602-4f33-96ce-0204f07046e1@nvidia.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Wed, 14 Feb 2024 18:19:35 +0100
Message-ID: <CAKfTPtAR-yWG8odEv-b8XoZQa05OiYd3PLn56MA+AqPb4h=NJA@mail.gmail.com>
Subject: Re: [PATCH] sched/fair: Fix frequency selection for non invariant case
To: Jon Hunter <jonathanh@nvidia.com>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, bristot@redhat.com, vschneid@redhat.com, wkarny@gmail.com, 
	torvalds@linux-foundation.org, qyousef@layalina.io, tglx@linutronix.de, 
	rafael@kernel.org, viresh.kumar@linaro.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, 
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Thierry Reding <treding@nvidia.com>, 
	Sasha Levin <sashal@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, 
	Shardar Mohammed <smohammed@nvidia.com>
Content-Type: text/plain; charset="UTF-8"

Hi John,

On Wed, 14 Feb 2024 at 18:12, Jon Hunter <jonathanh@nvidia.com> wrote:
>
> Hi Vincent,
>
> On 14/01/2024 18:36, Vincent Guittot wrote:
> > When frequency invariance is not enabled, get_capacity_ref_freq(policy)
> > returns the current frequency and the performance margin applied by
> > map_util_perf(), enabled the utilization to go above the maximum compute
> > capacity and to select a higher frequency than the current one.
> >
> > The performance margin is now applied earlier in the path to take into
> > account some utilization clampings and we can't get an utilization higher
> > than the maximum compute capacity.
> >
> > We must use a frequency above the current frequency to get a chance to
> > select a higher OPP when the current one becomes fully used. Apply
> > the same margin and returns a frequency 25% higher than the current one in
> > order to switch to the next OPP before we fully use the cpu at the current
> > one.
> >
> > Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
> > Closes: https://lore.kernel.org/lkml/CAHk-=wgWcYX2oXKtgvNN2LLDXP7kXkbo-xTfumEjmPbjSer2RQ@mail.gmail.com/
> > Reported-by: Wyes Karny <wkarny@gmail.com>
> > Closes: https://lore.kernel.org/lkml/20240114091240.xzdvqk75ifgfj5yx@wyes-pc/
> > Fixes: 9c0b4bb7f630 ("sched/cpufreq: Rework schedutil governor performance estimation")
> > Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> > Tested-by: Wyes Karny <wkarny@gmail.com>
> > ---
> >   kernel/sched/cpufreq_schedutil.c | 6 +++++-
> >   1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/kernel/sched/cpufreq_schedutil.c b/kernel/sched/cpufreq_schedutil.c
> > index 95c3c097083e..d12e95d30e2e 100644
> > --- a/kernel/sched/cpufreq_schedutil.c
> > +++ b/kernel/sched/cpufreq_schedutil.c
> > @@ -133,7 +133,11 @@ unsigned long get_capacity_ref_freq(struct cpufreq_policy *policy)
> >       if (arch_scale_freq_invariant())
> >               return policy->cpuinfo.max_freq;
> >
> > -     return policy->cur;
> > +     /*
> > +      * Apply a 25% margin so that we select a higher frequency than
> > +      * the current one before the CPU is full busy
> > +      */
> > +     return policy->cur + (policy->cur >> 2);
> >   }
> >
> >   /**
>
>
> We have also observed a performance degradation on our Tegra platforms
> with v6.8-rc1. Unfortunately, the above change does not fix the problem
> for us and we are still seeing a performance issue with v6.8-rc4. For
> example, running Dhrystone on Tegra234 I am seeing the following ...
>
> Linux v6.7:
> [ 2216.301949] CPU0: Dhrystones per Second: 31976326 (18199 DMIPS)
> [ 2220.993877] CPU1: Dhrystones per Second: 49568123 (28211 DMIPS)
> [ 2225.685280] CPU2: Dhrystones per Second: 49568123 (28211 DMIPS)
> [ 2230.364423] CPU3: Dhrystones per Second: 49632220 (28248 DMIPS)
>
> Linux v6.8-rc4:
> [   44.661686] CPU0: Dhrystones per Second: 16068483 (9145 DMIPS)
> [   51.895107] CPU1: Dhrystones per Second: 16077457 (9150 DMIPS)
> [   59.105410] CPU2: Dhrystones per Second: 16095436 (9160 DMIPS)
> [   66.333297] CPU3: Dhrystones per Second: 16064000 (9142 DMIPS)
>
> If I revert this change and the following ...
>
>   b3edde44e5d4 ("cpufreq/schedutil: Use a fixed reference frequency")
>   f12560779f9d ("sched/cpufreq: Rework iowait boost")
>   9c0b4bb7f630 ("sched/cpufreq: Rework schedutil governor
>
> ... then the perf is similar to where it was ...
>
> Linux v6.8-rc4 plus reverts:
> [   31.768189] CPU0: Dhrystones per Second: 48421678 (27559 DMIPS)
> [   36.556838] CPU1: Dhrystones per Second: 48401324 (27547 DMIPS)
> [   41.343343] CPU2: Dhrystones per Second: 48421678 (27559 DMIPS)
> [   46.163347] CPU3: Dhrystones per Second: 47679814 (27137 DMIPS)
>
> All CPUs are running with the schedutil CPUFREQ governor. We have not
> looked any further but wanted to report this in case you have any more
> thoughts or suggestions for us to try.

Have you tried this :
https://lore.kernel.org/lkml/20240117190545.596057-1-vincent.guittot@linaro.org/

It's in driver-core-linus' branch and should be sent to Linus soon

Vincent

>
> Thanks
> Jon
>
> --
> nvpublic
