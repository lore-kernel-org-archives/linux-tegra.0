Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67BE171CD
	for <linux-tegra@vger.kernel.org>; Tue, 25 Feb 2025 00:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740441767; cv=none; b=anWMCLilx3BeDtASoumyT8iqwEanrMyt1GS7wJcqTnSD4s+VNNpofNZ31LsZ9keOFRkPLNkNi+nTkvNeyoEDsvtw7zvI3yWHwqqEBFrAf5KsMzwrDyaJpFEqw/ffVh+JswukGWgCWESliw62N7RfWl2R3dHQmeppnfRr2WPLRyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740441767; c=relaxed/simple;
	bh=FCD3YvL2BP6A1/nD5gF93ntF//QhnT6ba4fJBEggqmA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kdN0mollYYZpnQX5L/W7GkrxZQ6TcOcZsyoG5Cf6gA2I1l2kiekzPbdFQJm1Oe2GAOgjPDD+FEe2sh8Qbs4b7k3TjNUlCa3nDLEkGO3O185a1w7weOCuDpj2mWu5N5c2OSRJGo3Kgno4YFiwrU+perHexq9mFlN2V88Ui58c1zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io; spf=pass smtp.mailfrom=layalina.io; dkim=pass (2048-bit key) header.d=layalina-io.20230601.gappssmtp.com header.i=@layalina-io.20230601.gappssmtp.com header.b=jRFVxjqC; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=layalina.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=layalina-io.20230601.gappssmtp.com header.i=@layalina-io.20230601.gappssmtp.com header.b="jRFVxjqC"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-abbb12bea54so874854966b.0
        for <linux-tegra@vger.kernel.org>; Mon, 24 Feb 2025 16:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=layalina-io.20230601.gappssmtp.com; s=20230601; t=1740441764; x=1741046564; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JAcvR8DdnLL+idd+S21ZhdVCiAQLuq98Hshx/9DfUhc=;
        b=jRFVxjqC2V/KlkZz9Ku8Flm7BkE/AwnCriMwKPJhVGpYnsrELtNp7bgH4VSTR8wZQp
         3ep9agPhOSHWyOMox4SzxFTru8Tyn8OZ+GMN8iavlaoAsKtmxKF6wzv3oAcyyNqgQ+3r
         gS6SJHneRMgbIrVT+z8kLKkEHPNAtaGk+yqayfXQfoQFQaxb9W6pb4yyY3TPQlZHDYGK
         UPpQMADxILnQxh/ysxmzf3RPkkJR1kUk5z8ICfpD2uGddehYKrc9fMYT4Jk6NR2xVkCm
         76FTLYqRZp9I6WngvhFk92WpJS04jko2gRRW8wqMpkKQ3TSZAFrN0MaLuDcDuQ7kdMWr
         olgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740441764; x=1741046564;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JAcvR8DdnLL+idd+S21ZhdVCiAQLuq98Hshx/9DfUhc=;
        b=txYs3uWbglkiFx3IEEqowI1XHT6PsoB4pxee9QOKy34ds9EUzIooTU6Lxmrm2j9R2W
         BpRPr0WmXpjK6qzDQh5BPz3M6E+BErhV98VMIn286gBBc7f7inFYBulOLaAuLNRIkE45
         3V6twwJ/0Ol7arEIIimQ7qHpnaSZakfeA94Z5jv8cyO9gYt9HjoSjbkmSMnj9hZ25llv
         4wE9lefhZ/33d2weG0bjw+AU1FWJPiUGmhYsLBOgofZU3n7mP9jrR8Lc7k2XGc2LMQfs
         uMe7qWyRptA4p/1gLaCNdoWQ1zz32Np+SxM+LotYVEh6jYWxZFRKQsRTim0uHM4WF0LP
         UPwA==
X-Forwarded-Encrypted: i=1; AJvYcCW+CajzjJvmhsL+3Kg7KjsEXN7fvrgdA+z1e8MIP6bLrnZVHAbzs1Xb3GgFg6Fxd5JP9YILK/jcdOG2MQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1XDdYDQXoXVCSSKjZfSw1JepbX+K1h95jWMskKAGzO0aq1tNb
	D65nQ2O9EKdGOiU8NPSo8vIj73cZJCqgCJUZEC1gKb95ceXvJlzyRrvzrRqvWa4=
X-Gm-Gg: ASbGnct2QBXpsLtBPKcZwxNbuk9czf550rn77/v6zn39Kp3IObzZ9Kk8C55PQiu2TlJ
	2c0nUHQXB/CU61kDSFRnvIw+nbPNuGcv4TrYGjuw/dalg+lrbtqPmVUwAZafJSVIJMK7Sxksg3q
	/HJIXuMNQeCrWQsoU56pY5HOJbB7mWt70wW2iXP0MvOhYlZNN6KmoyWJ2Vst7mCVAapMa/acjBt
	pyCIPIN4WpFgRYAgRxbrSM4KtaYFIzrI+Qg96NV9y9/UWXwcaViINKJzlvxseKqgOF6S8KaA3Mm
	xJpVE3QhBxKkdzxn9lNw
X-Google-Smtp-Source: AGHT+IE1gN36OEqXHk3bEOc/eNB2zLyup3HVNy8IBn/fV3tT8rSaFX9NnDUW1mv0d46C+VuFFeXjdw==
X-Received: by 2002:a17:906:31c6:b0:aba:7a3a:e267 with SMTP id a640c23a62f3a-abed101d92fmr101313966b.45.1740441763959;
        Mon, 24 Feb 2025 16:02:43 -0800 (PST)
Received: from airbuntu ([46.186.201.36])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed205e53fsm40783866b.159.2025.02.24.16.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 16:02:43 -0800 (PST)
Date: Tue, 25 Feb 2025 00:02:37 +0000
From: Qais Yousef <qyousef@layalina.io>
To: Juri Lelli <juri.lelli@redhat.com>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Christian Loehle <christian.loehle@arm.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	Thierry Reding <treding@nvidia.com>,
	Waiman Long <longman@redhat.com>, Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Michal Koutny <mkoutny@suse.com>, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Phil Auld <pauld@redhat.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	"Joel Fernandes (Google)" <joel@joelfernandes.org>,
	Suleiman Souhlal <suleiman@google.com>,
	Aashish Sharma <shraash@google.com>,
	Shin Kawamura <kawasin@google.com>,
	Vineeth Remanan Pillai <vineeth@bitbyteword.org>,
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH v2 3/2] sched/deadline: Check bandwidth overflow earlier
 for hotplug
Message-ID: <20250225000237.nsgbibqigl6nhhdu@airbuntu>
References: <8ff19556-a656-4f11-a10c-6f9b92ec9cea@arm.com>
 <Z6oysfyRKM_eUHlj@jlelli-thinkpadt14gen4.remote.csb>
 <dbd2af63-e9ac-44c8-8bbf-84358e30bf0b@arm.com>
 <Z6spnwykg6YSXBX_@jlelli-thinkpadt14gen4.remote.csb>
 <285a43db-c36d-400e-8041-0566f089a482@arm.com>
 <Z62PPUOY5DClYo1A@jlelli-thinkpadt14gen4.remote.csb>
 <20250216163340.ttwddti5pzuynsj5@airbuntu>
 <Z7NNHmGgrEF666W_@jlelli-thinkpadt14gen4.remote.csb>
 <20250222235936.jmyrfacutheqt5a2@airbuntu>
 <Z7w7g1zb0nfu9-C7@jlelli-thinkpadt14gen4.remote.csb>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Z7w7g1zb0nfu9-C7@jlelli-thinkpadt14gen4.remote.csb>

On 02/24/25 10:27, Juri Lelli wrote:

> > Okay I see. The issue though is that for a DL system with power management
> > features on that warrant to wake up a sugov thread to update the frequency is
> > sort of half broken by design. I don't see the benefit over using RT in this
> > case. But I appreciate I could be misguided. So take it easy on me if it is
> > obviously wrong understanding :) I know in Android usage of DL has been
> > difficult, but many systems ship with slow switch hardware.
> > 
> > How does DL handle the long softirqs from block and network layers by the way?
> > This has been in a practice a problem for RT tasks so they should be to DL.
> > sugov done in stopper should be handled similarly IMHO. I *think* it would be
> > simpler to masquerade sugov thread as irq pressure.
> 
> Kind of a trick question :), as DL doesn't handle this kind of

:-)

> load/pressure explicitly. It is essentially agnostic about it. From a
> system design point of view though, I would say that one should take
> that into account and maybe convert sensible kthreads to DL, so that the
> overall bandwidth can be explicitly evaluated. If one doesn't do that
> probably a less sound approach is to treat anything not explicitly
> scheduled by DL, but still required from a system perspective, as
> overload and be more conservative when assigning bandwidth to DL tasks
> (i.e. reduce the maximum amount of available bandwidth, so that the
> system doesn't get saturated).

Maybe I didn't understand your initial answer properly. But what I got is that
we set as DL to do what you just suggested of converting it kthread to DL to
take its bandwidth into account. But we have been lying about bandwidth so far
and it was ignored? (I saw early bailouts of SCHED_FLAG_SUGOV was set in
bandwidth related operations)

> 
> > You can use the rate_limit_us as a potential guide for how much bandwidth sugov
> > needs if moving it to another class really doesn't make sense instead?
> 
> Or maybe try to estimate/measure how much utilization sugov threads are
> effectively using while running some kind of workload of interest and
> use that as an indication for DL runtime/period.

I don't want to side track this thread. So maybe I should start a new thread to
discuss this. You might have seen my other series on consolidating cpufreq
updates. I'm not sure sugov can have a predictable period. Maybe runtime, but
it could run repeatedly, or it could be quite for a long time.

TBH I always though we use DL because it was the highest sched_class that is
not a stopper.

Anyway. Happy to take this discussion into another thread if this is better.
I didn't mean to distract from debugging the reported issue.

Thanks!

--
Qais Yousef
