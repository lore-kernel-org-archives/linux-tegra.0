Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B972376FD
	for <linux-tegra@vger.kernel.org>; Tue, 18 Feb 2025 09:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739872750; cv=none; b=lNcBvfI6CqDjssUASSlGFIPUplVZWE4nr9UXuf7fmm+p9Xxhn1za6s96NvZPmBfXdEwE5uxRrI3M5uWUOwsx763LukL4iY7JDmwTsX0pan5eYQjI82HtZHAtXFTBuRvHsKwTewmwBK2daOrr6X+uZXoTAITlIic9zfM6SUfVK9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739872750; c=relaxed/simple;
	bh=xS5fRlzqO9+4hWTNOQeoD8COZX0VM/0CekcU+kRzcIs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NRVFOTJ+Yz9I3zapjN51XKfDBjbhGHQ/DiTjroWjes9iKqnqzidF8TQPCsd0MOpJQeC1f0qLOaxuRN8OFdnz5EcygcTUEm3Ul/Bp5/qnwtKAO5QWeMQGFHKXlZJXDFPMY1LPRoF/O68C7ImYZGyGkBJE4gllVcvQ1TIRqmzKnFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cLPtLHdk; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cLPtLHdk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739872747;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HnxN+9zQDHC4kX76DKiHSrj1mZvMK6o4KSuBiUtHt0o=;
	b=cLPtLHdk4TxuuO5XxKJzGzyL3+4/gFy3RexDEI+STyTuRxuFTAtivcgYkBd9g8UF2ADkaq
	B3ekNbTeHgxP2YU8X+v9/RDbCBhuca++Qh52nIIEF2aIRgSyhwZxvUrXqsjsX0PzYgDIiI
	GGKdX2svP8AmI+BA1J2/AMYRp44sVUY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-505-etOM_1ZNPWCC_qdA54s6CQ-1; Tue, 18 Feb 2025 04:59:04 -0500
X-MC-Unique: etOM_1ZNPWCC_qdA54s6CQ-1
X-Mimecast-MFC-AGG-ID: etOM_1ZNPWCC_qdA54s6CQ_1739872743
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4393e89e910so28159235e9.0
        for <linux-tegra@vger.kernel.org>; Tue, 18 Feb 2025 01:59:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739872743; x=1740477543;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HnxN+9zQDHC4kX76DKiHSrj1mZvMK6o4KSuBiUtHt0o=;
        b=Gv1lyKyz65IqFH+8BFEF3ySvFYQxDuBbU25BzMvaNyJgNUcli+r8DqJjQ0MmrOj6/C
         EjxNqaBaA+S3ztYt5U+9ZPIK2GMHxQEVP5bQDo8G6vxtxjxzs5knfZuiW4Y2mv/KAEI/
         QeykT6AfDgNW23zK4cYw4L8EWVDXqFLN6c83je7PpF75MV/z42KqzmQ3eHiX2kNGRDsx
         UWeCj6bBfgGmk9N+zCXwkShpJ/WxXEVyhqNmS0Hr4aQKoo6Qomrsh8xLCZwDmmS8Bo7C
         Jhkmlu2MGtZjry/9sBdmnATScv9TBGWXGcMc0/LIEQ1q56YhCPNy5SVkd6cPhIESJ0zb
         S70A==
X-Forwarded-Encrypted: i=1; AJvYcCWebsaBz5WQ+wwyweyRgPwqz8QeP/TJ9359cmPD6wd2TI1R7SQLFEvwRB58oT98X58AC3mpd0zRdNlBhQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/TNSho+PraM4soK/FuTWiWor+PDAFSEZxxaljOmZ6y1wg2R14
	UFUUGiX9vgfRgHAgyBvrPDA358SoiYPWXg005+5zkBwn9rSdr7LFUUJBo8VDs/qjyVC/dHHMexB
	08a+snY3BIJ4VWhkLWB/6gVOZpeoYmTDFNUGIbN03EHOPegK8aYK7KYx5DzIF
X-Gm-Gg: ASbGncvxWgsBctscPEaMcYoUjsWtJIjRFEqRiLqSOOIkPKoy9RkRCLxkYlxisv0RGfz
	z9YnilSMgFRY+G5nuod4BbaRTN6bSmmqKw3Rw+en62JWnelNAq3VyEjZg10LSxXJMZ5LbLuQStG
	/aZeR3ug3aYDmNe6m9YdlVR2tYwOBv8m19GIS4OO8u4ZRomFBEObf16/zA25AIW2xvzAku+1FzB
	gXK0r8/sq1mRtmPL9SDEdHINg8wldYMyk9/GTm0JIo4GtK0qF11ArpVZu5gOzTeSod4a+jp1Jl/
	cwzF9xR+meYayOl76SNcGaPZQKvAd1CeXw==
X-Received: by 2002:a05:600c:4fce:b0:439:56f3:d40f with SMTP id 5b1f17b1804b1-4396e739ea3mr99807855e9.21.1739872742851;
        Tue, 18 Feb 2025 01:59:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF2VK4+rzq0k+t4nLHdtSG+G7+DDI4+o/B6t86VLFcmyvesV7g1iJIaxNNhNcprgd5qG658SA==
X-Received: by 2002:a05:600c:4fce:b0:439:56f3:d40f with SMTP id 5b1f17b1804b1-4396e739ea3mr99807575e9.21.1739872742459;
        Tue, 18 Feb 2025 01:59:02 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.34.42])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4398a64febasm38488205e9.1.2025.02.18.01.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 01:59:01 -0800 (PST)
Date: Tue, 18 Feb 2025 10:58:59 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Christian Loehle <christian.loehle@arm.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
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
Message-ID: <Z7RZ4141H-FnoQPW@jlelli-thinkpadt14gen4.remote.csb>
References: <db800694-84f7-443c-979f-3097caaa1982@nvidia.com>
 <8ff19556-a656-4f11-a10c-6f9b92ec9cea@arm.com>
 <Z6oysfyRKM_eUHlj@jlelli-thinkpadt14gen4.remote.csb>
 <dbd2af63-e9ac-44c8-8bbf-84358e30bf0b@arm.com>
 <Z6spnwykg6YSXBX_@jlelli-thinkpadt14gen4.remote.csb>
 <78f627fe-dd1e-4816-bbf3-58137fdceda6@nvidia.com>
 <Z62ONLX4OLisCLKw@jlelli-thinkpadt14gen4.remote.csb>
 <30a8cda5-0fd0-4e47-bafe-5deefc561f0c@nvidia.com>
 <151884eb-ad6d-458e-a325-92cbe5b8b33f@nvidia.com>
 <Z7Ne49MSXS2I06jW@jlelli-thinkpadt14gen4.remote.csb>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7Ne49MSXS2I06jW@jlelli-thinkpadt14gen4.remote.csb>

Hi!

On 17/02/25 17:08, Juri Lelli wrote:
> On 14/02/25 10:05, Jon Hunter wrote:

...

> At this point I believe you triggered suspend.
> 
> > [   57.290150] Freezing remaining freezable tasks completed (elapsed 0.001 seconds)
> > [   57.335619] tegra-xusb 3530000.usb: Firmware timestamp: 2020-07-06 13:39:28 UTC
> > [   57.353364] dwc-eth-dwmac 2490000.ethernet eth0: Link is Down
> > [   57.397022] Disabling non-boot CPUs ...
> 
> Offlining CPU5.
> 
> > [   57.400904] dl_bw_manage: cpu=5 cap=3072 fair_server_bw=52428 total_bw=209712 dl_bw_cpus=4 type=DYN span=0,3-5
> > [   57.400949] CPU0 attaching NULL sched-domain.
> > [   57.415298] span=1-2
> > [   57.417483] __dl_sub: cpus=3 tsk_bw=52428 total_bw=157284 span=0,3-5 type=DYN
> > [   57.417487] __dl_server_detach_root: cpu=0 rd_span=0,3-5 total_bw=157284
> > [   57.417496] rq_attach_root: cpu=0 old_span=NULL new_span=1-2
> > [   57.417501] __dl_add: cpus=3 tsk_bw=52428 total_bw=157284 span=0-2 type=DEF
> > [   57.417504] __dl_server_attach_root: cpu=0 rd_span=0-2 total_bw=157284
> > [   57.417507] CPU3 attaching NULL sched-domain.
> > [   57.454804] span=0-2
> > [   57.456987] __dl_sub: cpus=2 tsk_bw=52428 total_bw=104856 span=3-5 type=DYN
> > [   57.456990] __dl_server_detach_root: cpu=3 rd_span=3-5 total_bw=104856
> > [   57.456998] rq_attach_root: cpu=3 old_span=NULL new_span=0-2
> > [   57.457000] __dl_add: cpus=4 tsk_bw=52428 total_bw=209712 span=0-3 type=DEF
> > [   57.457003] __dl_server_attach_root: cpu=3 rd_span=0-3 total_bw=209712
> > [   57.457006] CPU4 attaching NULL sched-domain.
> > [   57.493964] span=0-3
> > [   57.496152] __dl_sub: cpus=1 tsk_bw=52428 total_bw=52428 span=4-5 type=DYN
> > [   57.496156] __dl_server_detach_root: cpu=4 rd_span=4-5 total_bw=52428
> > [   57.496162] rq_attach_root: cpu=4 old_span=NULL new_span=0-3
> > [   57.496165] __dl_add: cpus=5 tsk_bw=52428 total_bw=262140 span=0-4 type=DEF
> > [   57.496168] __dl_server_attach_root: cpu=4 rd_span=0-4 total_bw=262140
> > [   57.496171] CPU5 attaching NULL sched-domain.
> > [   57.532952] span=0-4
> > [   57.535143] rq_attach_root: cpu=5 old_span= new_span=0-4
> > [   57.535147] __dl_add: cpus=5 tsk_bw=52428 total_bw=314568 span=0-5 type=DEF
> 
> Maybe we shouldn't add the dl_server contribution of a CPU that is going
> to be offline.

I tried to implement this idea and ended up with the following. As usual
also pushed it to the branch on github. Could you please update and
re-test?

Another thing that I noticed is that in my case an hotplug operation
generating a sched/root domain rebuild ends up calling dl_rebuild_
rd_accounting() (from partition_and_rebuild_sched_domains()) which
resets accounting for def and dyn domains. In your case (looking again
at the last dmesg you shared) I don't see this call, so I wonder if for
some reason related to your setup we do the rebuild by calling partition_
sched_domains() (instead of partition_and_rebuild_) and this doesn't
call dl_rebuild_rd_accounting() after partition_sched_domains_locked() -
maybe it should? Dietmar, Christian, Peter, what do you think?

Thanks,
Juri

