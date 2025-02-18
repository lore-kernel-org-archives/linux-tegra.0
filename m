Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58473269D1C
	for <linux-tegra@vger.kernel.org>; Tue, 18 Feb 2025 14:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739888329; cv=none; b=otlW3R1JrB3iRRtew8CpZCq0KeWGyuq4JS+Ne72s2WHfttBzJFO9fHyXFb4am3RnbaPf44H3/9QYJsyL4Z31jaEQY2DOrCf2K5jKDYQmwTYesPbLxrD8m3p58cQMQ9xdHL2iajDtnTB6IhQIKQGQv9/Cuu3T1XKQCxajqg2g4VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739888329; c=relaxed/simple;
	bh=Ylh6BzLP55i04wVfiFq0UdGu/ctOqdofDLlmv68+FsI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CBSXobWNBgi3eGVavA+3A6hl1DkAexinrGF7RRTjOswZa21Mv/iygpDc/YRriwnpDgEWmAdDvJF9ebOmAYw6n/5dSNnV5Ofm6k6MZQpyeBGeFnWU/IQkJPd+O5XiClpnvWVcFmE6jhI8+c+D846MgGPhhHKwUKCQugs+AfqN398=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Pid8NLtU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Pid8NLtU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739888326;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DBhsPO91wIOuIx7V5POaYr34tBMgM6YIQ+GqBqORH08=;
	b=Pid8NLtU6XnTb21t/rV5uPw2adRibecR441YSbYtV+TdVuXr80Ye6/wTJsRwNoHBCtM9uR
	mXXp409Uu+1U+fpmrqoLegCf4LSOCX/vbF3zLJZEKodPxksITxSwRp6AcQA4NWIIhW03rw
	3J9s+LBRwClns745pZqplBpLS5ZKrJg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-85-fOtW3AqmP-SkHC5MbskTMw-1; Tue, 18 Feb 2025 09:18:43 -0500
X-MC-Unique: fOtW3AqmP-SkHC5MbskTMw-1
X-Mimecast-MFC-AGG-ID: fOtW3AqmP-SkHC5MbskTMw_1739888322
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-438da39bb69so48630085e9.0
        for <linux-tegra@vger.kernel.org>; Tue, 18 Feb 2025 06:18:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739888322; x=1740493122;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DBhsPO91wIOuIx7V5POaYr34tBMgM6YIQ+GqBqORH08=;
        b=JMvhoiiIHIgIEFCax1UzlXWuvlKt0tyxf3KytygS+PLIcU1qZOq5G10+Lwxek8gdr3
         LgIs2Ur6SFKxIPdLLYHz9TfpSapdM6gKP5Yh5WldzE5nCVY+xJ4gECcyQ9p1IZE04FJb
         CvCjYmlPvZZve7btUA4DB3RbSD1S4et7f+YxU+GPncgjUBGnA/sWpKnM+aKYdsRcrPrS
         lQL7Fy5Puq97NitJHHMj+xC5XxyPc6dVwsOnN3W1wTv8Qkp/SFQU4hWgxrfNYAIEvBbw
         mXJER3keCqq7npWds19nEyR92OGPJXd0U6RKpM6i2nkf+zOe4Ayzk8VxKrEAYEqzOOoS
         H6XA==
X-Forwarded-Encrypted: i=1; AJvYcCWNG1YToGSDYtAqTfD3nWV7J+T/V4HNJwW+EEAUDRIw7EUuJ32ixOIdgrk9h7BRrJ3jYwTnEr11PiZSsA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYua/D4bow+vnnIXBXYBv5TPnZZxpMjOAfSapMYtEYjlpjpiIa
	S3ISM9f2r74ETmaHg+fas8zcauGxz12ap6xgmHmac64Y6UEqt8sVD6IZ94Drl1J6ofrXvPxaxk6
	jnIUmYKL2+gf+KgE2Xa4j+mlRdgMVaITPIAUIrb/RjrnIYVBvErzofLssvg9k
X-Gm-Gg: ASbGncsVSj4dgA/ad6XUBzapWZGvI/6QP1/7DY3wnqr+kjaCf90tqwkqINjn6mzvxGO
	eizZO9BWvSphkvKkJw4k6mt8x8dQXBLQz+2TvNo6dumIJix7gB1+jKgwT0rxs+P87KHwpwDsdXV
	cuJFwzXl+S8bO8FKFWt3cad5DPgJDtNbXPnEt2TQTPIRyjNw7uvcYYUimSpRPmU5SZNI29fHJVb
	oPJ7km/FG+l8gR1+i+p2wTKrLGzvOByOi8K/nMzWsMkKj6W8u10bQij16sAadHe2Z6DInVspD9I
	tM3gAZDCkYhCVATCtr9URsj23xl7+ET6JQ==
X-Received: by 2002:a05:600c:4f03:b0:438:a240:c63 with SMTP id 5b1f17b1804b1-4396e6978f1mr108096845e9.2.1739888321827;
        Tue, 18 Feb 2025 06:18:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHz+8srgi2drXTmMyM1NYHrwhlKtyRHpPGxtjZL4L3zCFR0eLaPU7DhmwvLMH2MoF6LIUl/tw==
X-Received: by 2002:a05:600c:4f03:b0:438:a240:c63 with SMTP id 5b1f17b1804b1-4396e6978f1mr108096425e9.2.1739888321363;
        Tue, 18 Feb 2025 06:18:41 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.34.42])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a1b8471sm185070475e9.37.2025.02.18.06.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 06:18:40 -0800 (PST)
Date: Tue, 18 Feb 2025 15:18:38 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	Christian Loehle <christian.loehle@arm.com>,
	Thierry Reding <treding@nvidia.com>,
	Waiman Long <longman@redhat.com>, Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Michal Koutny <mkoutny@suse.com>, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Phil Auld <pauld@redhat.com>, Qais Yousef <qyousef@layalina.io>,
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
Message-ID: <Z7SWvr86RXlBbJlw@jlelli-thinkpadt14gen4.remote.csb>
References: <Z6oysfyRKM_eUHlj@jlelli-thinkpadt14gen4.remote.csb>
 <dbd2af63-e9ac-44c8-8bbf-84358e30bf0b@arm.com>
 <Z6spnwykg6YSXBX_@jlelli-thinkpadt14gen4.remote.csb>
 <78f627fe-dd1e-4816-bbf3-58137fdceda6@nvidia.com>
 <Z62ONLX4OLisCLKw@jlelli-thinkpadt14gen4.remote.csb>
 <30a8cda5-0fd0-4e47-bafe-5deefc561f0c@nvidia.com>
 <151884eb-ad6d-458e-a325-92cbe5b8b33f@nvidia.com>
 <Z7Ne49MSXS2I06jW@jlelli-thinkpadt14gen4.remote.csb>
 <Z7RZ4141H-FnoQPW@jlelli-thinkpadt14gen4.remote.csb>
 <d7cc3a3c-155e-4872-a426-cbd239d79cac@arm.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d7cc3a3c-155e-4872-a426-cbd239d79cac@arm.com>

On 18/02/25 15:12, Dietmar Eggemann wrote:
> On 18/02/2025 10:58, Juri Lelli wrote:
> > Hi!
> > 
> > On 17/02/25 17:08, Juri Lelli wrote:
> >> On 14/02/25 10:05, Jon Hunter wrote:
> > 
> > ...
> > 
> >> At this point I believe you triggered suspend.
> >>
> >>> [   57.290150] Freezing remaining freezable tasks completed (elapsed 0.001 seconds)
> >>> [   57.335619] tegra-xusb 3530000.usb: Firmware timestamp: 2020-07-06 13:39:28 UTC
> >>> [   57.353364] dwc-eth-dwmac 2490000.ethernet eth0: Link is Down
> >>> [   57.397022] Disabling non-boot CPUs ...
> >>
> >> Offlining CPU5.
> >>
> >>> [   57.400904] dl_bw_manage: cpu=5 cap=3072 fair_server_bw=52428 total_bw=209712 dl_bw_cpus=4 type=DYN span=0,3-5
> >>> [   57.400949] CPU0 attaching NULL sched-domain.
> >>> [   57.415298] span=1-2
> >>> [   57.417483] __dl_sub: cpus=3 tsk_bw=52428 total_bw=157284 span=0,3-5 type=DYN
> >>> [   57.417487] __dl_server_detach_root: cpu=0 rd_span=0,3-5 total_bw=157284
> >>> [   57.417496] rq_attach_root: cpu=0 old_span=NULL new_span=1-2
> >>> [   57.417501] __dl_add: cpus=3 tsk_bw=52428 total_bw=157284 span=0-2 type=DEF
> >>> [   57.417504] __dl_server_attach_root: cpu=0 rd_span=0-2 total_bw=157284
> >>> [   57.417507] CPU3 attaching NULL sched-domain.
> >>> [   57.454804] span=0-2
> >>> [   57.456987] __dl_sub: cpus=2 tsk_bw=52428 total_bw=104856 span=3-5 type=DYN
> >>> [   57.456990] __dl_server_detach_root: cpu=3 rd_span=3-5 total_bw=104856
> >>> [   57.456998] rq_attach_root: cpu=3 old_span=NULL new_span=0-2
> >>> [   57.457000] __dl_add: cpus=4 tsk_bw=52428 total_bw=209712 span=0-3 type=DEF
> >>> [   57.457003] __dl_server_attach_root: cpu=3 rd_span=0-3 total_bw=209712
> >>> [   57.457006] CPU4 attaching NULL sched-domain.
> >>> [   57.493964] span=0-3
> >>> [   57.496152] __dl_sub: cpus=1 tsk_bw=52428 total_bw=52428 span=4-5 type=DYN
> >>> [   57.496156] __dl_server_detach_root: cpu=4 rd_span=4-5 total_bw=52428
> >>> [   57.496162] rq_attach_root: cpu=4 old_span=NULL new_span=0-3
> >>> [   57.496165] __dl_add: cpus=5 tsk_bw=52428 total_bw=262140 span=0-4 type=DEF
> >>> [   57.496168] __dl_server_attach_root: cpu=4 rd_span=0-4 total_bw=262140
> >>> [   57.496171] CPU5 attaching NULL sched-domain.
> >>> [   57.532952] span=0-4
> >>> [   57.535143] rq_attach_root: cpu=5 old_span= new_span=0-4
> >>> [   57.535147] __dl_add: cpus=5 tsk_bw=52428 total_bw=314568 span=0-5 type=DEF
> >>
> >> Maybe we shouldn't add the dl_server contribution of a CPU that is going
> >> to be offline.
> > 
> > I tried to implement this idea and ended up with the following. As usual
> > also pushed it to the branch on github. Could you please update and
> > re-test?
> > 
> > Another thing that I noticed is that in my case an hotplug operation
> > generating a sched/root domain rebuild ends up calling dl_rebuild_
> > rd_accounting() (from partition_and_rebuild_sched_domains()) which
> > resets accounting for def and dyn domains. In your case (looking again
> > at the last dmesg you shared) I don't see this call, so I wonder if for
> > some reason related to your setup we do the rebuild by calling partition_
> > sched_domains() (instead of partition_and_rebuild_) and this doesn't
> > call dl_rebuild_rd_accounting() after partition_sched_domains_locked() -
> > maybe it should? Dietmar, Christian, Peter, what do you think?
> 
> Yeah, looks like suspend/resume behaves differently compared to CPU hotplug.
> 
> On my Juno [L b b L L L]
>                 ^^^
>                 isolcpus=[2,3]
> 
> # ps2 | grep DLN
>    98    98 S 140      0   - DLN sugov:0
>    99    99 S 140      0   - DLN sugov:1
> 
> # taskset -p 98; taskset -p 99
> pid 98's current affinity mask: 39
> pid 99's current affinity mask: 6
> 
> 
> [   87.679282] partition_sched_domains() called
> ...
> [   87.684013] partition_sched_domains() called
> ...
> [   87.687961] partition_sched_domains() called
> ...
> [   87.689419] psci: CPU3 killed (polled 0 ms)
> [   87.689715] __dl_bw_capacity() mask=2-5 cap=1024
> [   87.689739] dl_bw_cpus() cpu=6 rd->span=2-5 cpu_active_mask=0-2 cpus=1
> [   87.689757] dl_bw_manage: cpu=2 cap=0 fair_server_bw=52428
> total_bw=209712 dl_bw_cpus=1 type=DEF span=2-5
> [   87.689775] dl_bw_cpus() cpu=6 rd->span=2-5 cpu_active_mask=0-2 cpus=1
> [   87.689789] dl_bw_manage() cpu=2 cap=0 overflow=1 return=-16
> [   87.689864] Error taking CPU2 down: -16                       <-- !!!
> ...
> [   87.690674] partition_sched_domains() called
> ...
> [   87.691496] partition_sched_domains() called
> ...
> [   87.693702] partition_sched_domains() called
> ...
> [   87.695819] partition_and_rebuild_sched_domains() called
> 

Ah, OK. Did you try with my last proposed change?

