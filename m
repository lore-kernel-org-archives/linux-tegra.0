Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6B9245009
	for <linux-tegra@vger.kernel.org>; Mon, 24 Feb 2025 09:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740389261; cv=none; b=Hr4YOnHTOtaRnx5UOrCep1sStyPEcOPBaKn2X2eoyqk4Jt3Ow4IQzeNdFQvw2OFiXE7Ex6Tfn2SLFEZHJ774UQpbo2VbBGaDnUmRNHIC6Xa6nSGJ1VHfoKwRbneoZV17elcBXAVkkIrp3wre80oN220O3xZk56rCtUjnFUbjdAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740389261; c=relaxed/simple;
	bh=pUC6Ed2z/zY6KZOsQgf29yYj/OuBkJWzoRQUf/rC154=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=umVJBTvPKFPW3+hsfYBdQ1hvAonC6Zpnl8+72sAuM4uxLu0VKetbHAh2FNXV/3epPZmiab9h2R8UfxA3pGVCwUU70bKtBxh6SOcn7IvLR9Og+1f3pyMxtcWtt4UFXTEnexTnwTYKvpJy4gahf9xbX6YuIC7bs9CdAxzQfsWv8YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iY0hEtjV; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iY0hEtjV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740389258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0X0AQO/2ghVbNwC3CVRjTuq8PTR+HZJjGnXHV3qwXKY=;
	b=iY0hEtjVQxjTdAKZvQ3xt88SnOWDnncSELXqJ2lh4kB9iMwDKFvbUbmP9LuqDeDOzrsXW3
	6l8NtiF3MOM/wlutq7lvC4cJV+vU5NEvaBzrkkcmJMNE/OHXqE6MEmM30r/mCG/GqpCDmw
	/NkrE0rDxvWfnBOb5LMrnyQRjrws+ZI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-687-1-wYLZFRPLG4fREHfrlgxQ-1; Mon, 24 Feb 2025 04:27:37 -0500
X-MC-Unique: 1-wYLZFRPLG4fREHfrlgxQ-1
X-Mimecast-MFC-AGG-ID: 1-wYLZFRPLG4fREHfrlgxQ_1740389256
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-38f455a8e43so1578804f8f.0
        for <linux-tegra@vger.kernel.org>; Mon, 24 Feb 2025 01:27:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740389256; x=1740994056;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0X0AQO/2ghVbNwC3CVRjTuq8PTR+HZJjGnXHV3qwXKY=;
        b=m+5o7ZiOwaE/1nKSL2sok9P6SWcF8pCYLKXqczd2V+AlhbU8W3aegRN5SLJ6z1ODgc
         /f5f8h+f/rmG2kN6iKzOh/2UNFtULusJTJd+u0pmwePVqE2X62zF+1PTvMPjS+WgGdvK
         O4/JJEIQgcvOqOXXGgWHObTykBH3OHDtA/VBf9r3jjd5aL41ix7TNsY2UZpeBDiViUg7
         svSkLStP2D2sW7iuXxxF2bdcWfK+S7YryogMQzk6OiImOsw3yfE9UFa3Ut6EYfnG33Zi
         6dx1+FMmYrEoZ6HzOtrgNL0tZChKUDoX23a8pUIp96X/y2zM8MCeV6gNi/VN2CEfH556
         5ARw==
X-Forwarded-Encrypted: i=1; AJvYcCW24NKIl6i03CaL2uZOtLU0tr49puZkOqXFEl5ATeYCcW5654VRkqSj3hy/62/i545LV8tO8aMb0LJktw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFMH1Fj+O11M8n1Fr1kJOnzmbW7eUXMArQApJQo7duvu5AWVNz
	QBtcZX4qmYETsDTwp+Mq1a/YnL9kkpFku/E8f1YQIX6IeegW+Gms3iniLAhZ9ieX/rw1cDaVoQI
	3XrwrwXSrURZ5aLA8KWtLXWqd2B1sLUgSuek/C0qhb6x5uuH5aT9t1r5Gf/P5
X-Gm-Gg: ASbGncs3fbiW/GTLGUMmTkg1k79m924Tmjud8bxKxiBfu+iT2ldVbdIucnwEMKr2DOi
	prkCydHEVvpuqNMZVcqCsr5LR+bMqVNAl1uCllV+WF/yCtvCNQBSXAlIYAtc02nggi3h3v6MKDh
	Gsj0kUe58q3KitgzFgwmXQgxsqgEUNiOg4S+YP8rYZa4kZ1nWke/FdP5oShoBdrUpCNEdex0825
	vATvYdpUytHNubmJSaQ3b1UNXquPGpEm5ORepvksSgpAQT7yl59B+GXu3miW3fnHG6aQ3Nq295f
	T1kzB0M6jPABNUuUw5RS9Mr7I9XJWqewRJD0rjeQsAgs
X-Received: by 2002:a05:6000:154b:b0:38f:4c30:7cdd with SMTP id ffacd0b85a97d-38f6f09789fmr8445601f8f.37.1740389255973;
        Mon, 24 Feb 2025 01:27:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHaS0RFZ37ne1nVAbmV7xLchKHTtvTGvrdxafr5L2u+6HaGa2IC0AD7fHvr/akM++F67G10Dg==
X-Received: by 2002:a05:6000:154b:b0:38f:4c30:7cdd with SMTP id ffacd0b85a97d-38f6f09789fmr8445575f8f.37.1740389255519;
        Mon, 24 Feb 2025 01:27:35 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.34.42])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f25a0fe5esm31411004f8f.99.2025.02.24.01.27.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 01:27:34 -0800 (PST)
Date: Mon, 24 Feb 2025 10:27:31 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Qais Yousef <qyousef@layalina.io>
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
Message-ID: <Z7w7g1zb0nfu9-C7@jlelli-thinkpadt14gen4.remote.csb>
References: <db800694-84f7-443c-979f-3097caaa1982@nvidia.com>
 <8ff19556-a656-4f11-a10c-6f9b92ec9cea@arm.com>
 <Z6oysfyRKM_eUHlj@jlelli-thinkpadt14gen4.remote.csb>
 <dbd2af63-e9ac-44c8-8bbf-84358e30bf0b@arm.com>
 <Z6spnwykg6YSXBX_@jlelli-thinkpadt14gen4.remote.csb>
 <285a43db-c36d-400e-8041-0566f089a482@arm.com>
 <Z62PPUOY5DClYo1A@jlelli-thinkpadt14gen4.remote.csb>
 <20250216163340.ttwddti5pzuynsj5@airbuntu>
 <Z7NNHmGgrEF666W_@jlelli-thinkpadt14gen4.remote.csb>
 <20250222235936.jmyrfacutheqt5a2@airbuntu>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250222235936.jmyrfacutheqt5a2@airbuntu>

On 22/02/25 23:59, Qais Yousef wrote:
> On 02/17/25 15:52, Juri Lelli wrote:
> > On 16/02/25 16:33, Qais Yousef wrote:
> > > On 02/13/25 07:20, Juri Lelli wrote:
> > > > On 12/02/25 19:22, Dietmar Eggemann wrote:
> > > > > On 11/02/2025 11:42, Juri Lelli wrote:
> > > > 
> > > > ...
> > > > 
> > > > > > What about we actually ignore them consistently? We already do that for
> > > > > > admission control, so maybe we can do that when rebuilding domains as
> > > > > > well (until we find maybe a better way to deal with them).
> > > > > > 
> > > > > > Does the following make any difference?
> > > > > 
> > > > > It at least seems to solve the issue. And like you mentioned on irc, we
> > > > > don't know the bw req of sugov anyway.
> > > > > 
> > > > > So with this change we start with 'dl_bw->total_bw = 0' even w/ sugov tasks.
> > > > > 
> > > > > dl_rq[0]:
> > > > >   .dl_nr_running                 : 0
> > > > >   .dl_bw->bw                     : 996147
> > > > >   .dl_bw->total_bw               : 0       <-- !
> > > > > 
> > > > > IMHO, people who want to run serious DL can always check whether there
> > > > > are already these infrastructural DL tasks or even avoid schedutil.
> > > > 
> > > > It definitely not ideal and admittedly gross, but not worse than what we
> > > > are doing already considering we ignore sugovs at AC and the current
> > > > bandwidth allocation its there only to help with PI. So, duck tape. :/
> > > > 
> > > > A more proper way to work with this would entail coming up with sensible
> > > > bandwidth allocation for sugovs, but that's most probably hardware
> > > > specific, so I am not sure how we can make that general enough.
> > > 
> > > I haven't been following the problem closely, but one thing I was considering
> > > and I don't know if it makes sense to you and could help with this problem too.
> > > Shall we lump sugov with stopper class or create a new sched_class (seems
> > > unnecessary, I think stopper should do)? With the consolidate cpufreq update
> > > patch I've been working on Vincent raised issues with potential new ctx switch
> > > and to improve that I needed to look at improving sugov wakeup path. If we
> > > decouple it from DL I think that might fix your problem here and could allow us
> > > to special case it for other problems like the ones I faced more easily without
> > > missing up with DL.
> > > 
> > > Has the time come to consider retire the simple solution of making sugov a fake
> > > DL task?
> > 
> > Problem is that 'ideally' we would want to explicitly take sugovs into
> > account when designing the system. We don't do that currently as a
> > 'temporary solution' that seemed simpler than a proper approach (started
> > wondering if it's indeed simpler). So, not sure if moving sugovs outside
> > DL is something we want to do.
> 
> Okay I see. The issue though is that for a DL system with power management
> features on that warrant to wake up a sugov thread to update the frequency is
> sort of half broken by design. I don't see the benefit over using RT in this
> case. But I appreciate I could be misguided. So take it easy on me if it is
> obviously wrong understanding :) I know in Android usage of DL has been
> difficult, but many systems ship with slow switch hardware.
> 
> How does DL handle the long softirqs from block and network layers by the way?
> This has been in a practice a problem for RT tasks so they should be to DL.
> sugov done in stopper should be handled similarly IMHO. I *think* it would be
> simpler to masquerade sugov thread as irq pressure.

Kind of a trick question :), as DL doesn't handle this kind of
load/pressure explicitly. It is essentially agnostic about it. From a
system design point of view though, I would say that one should take
that into account and maybe convert sensible kthreads to DL, so that the
overall bandwidth can be explicitly evaluated. If one doesn't do that
probably a less sound approach is to treat anything not explicitly
scheduled by DL, but still required from a system perspective, as
overload and be more conservative when assigning bandwidth to DL tasks
(i.e. reduce the maximum amount of available bandwidth, so that the
system doesn't get saturated).

> You can use the rate_limit_us as a potential guide for how much bandwidth sugov
> needs if moving it to another class really doesn't make sense instead?

Or maybe try to estimate/measure how much utilization sugov threads are
effectively using while running some kind of workload of interest and
use that as an indication for DL runtime/period.

