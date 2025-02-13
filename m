Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748B2204F85
	for <linux-tegra@vger.kernel.org>; Thu, 13 Feb 2025 06:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739427390; cv=none; b=BLRm0cuIi45c6qeww02sgR7yIulZrwiTu6xfNIWFb+ozxhYnTOHcofEK7Ux5t6vyLrx58zxwBA4IeOxBp24M0mqZzrJ9Tl7g9/LVXvRFhlon6IZA1DBlYCBAbpKFVDvPweLK+yKk/q0WtbR51Dr+C32kvbwvAlTXuXBidZu0HR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739427390; c=relaxed/simple;
	bh=l3J5xQ3WAS+AG7XbNQgsUgKdPzuTMrGLFTcUYVCNNJY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eP6DAyS+XtMDlFV00vDPU4sYhv7TK8hTs8nw5GfXUvG0/8K4qj1x7ZRrIMfLigQ8DXILa1k4EhoGTlKhLqZG61z4Y4bfbuNXuONCWeO2d3YZ3Wc+Mv5I4Itk1bBvrXlHsjpU5xsnsPlWd20TOxCWqA3KFzHN7bAZhBlli4XueH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=i/dMn+l3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="i/dMn+l3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739427387;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Soif7C2aJynGEhg+D1h5RoXmJGd9fkc2utjkUojZ+0U=;
	b=i/dMn+l3U4nhTKG9x+PsAw/RrJUuhgI2OnswSs0zMkI3/1w+xMaK8KM/MRKnJKxT8XUd8A
	xbhF6uoQjpbz9XD53QlehBbeVBzdQHDOVJ7QtXGeS0zihL2dfKFhvr3U3V0cgJu1KL9UzL
	ed9afUg1ZAc3Kh0EKr9N6OqQIeGdQcw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-463-jj9N_jwvMp-B0QYsSZ1eUQ-1; Thu, 13 Feb 2025 01:16:25 -0500
X-MC-Unique: jj9N_jwvMp-B0QYsSZ1eUQ-1
X-Mimecast-MFC-AGG-ID: jj9N_jwvMp-B0QYsSZ1eUQ
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4393b6763a3so2353375e9.2
        for <linux-tegra@vger.kernel.org>; Wed, 12 Feb 2025 22:16:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739427384; x=1740032184;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Soif7C2aJynGEhg+D1h5RoXmJGd9fkc2utjkUojZ+0U=;
        b=uCSfv3SUlgN35PsqgswWLB7ywq1sgMumKePvh2cRPWqo4Y3b+gmKUreyMzVib24l3V
         57ggo1WucWS2EBGE2vA6q1xn4FvRDSWn6ALybJjUa7/drb5d+vKsiF4DBawCs2TdS982
         SGPrCPTmfson65017AD99aKHA7NDg9MatKz7dNtHCiMDh2pGVBswM7ZTYt+JgLCw87B7
         5q3dyrxG45Yoth6TFI9Z3YMqf2QTqxvjHZZsi4kbo316sLPB+MoXZ9nH+QIg+dxYqHOe
         R31A1fxsa9p9Cr9BV/hNHI1jUbGkbmSaFI3pQIBjNyvXqz0/+b5/saLLpXG/gWCIRUSr
         ZtFA==
X-Forwarded-Encrypted: i=1; AJvYcCWt4WJSvyNFSdjgKblg5nVM74yCG/W/qxX+bXoZoZdEBQU7AsWzqo08t7QCfhFjDan2NqJrMouKgkpQ6w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFly4AXdIcaEnWaI3hxzJbr7Zo8GfwGSzzAAOtt6QVwXLFj+p2
	BQOSZW1K65bprth97aLkhLMpSET2iEB7bem26yl+5GcjFG4XXwX2B4I0Ln9HMt/1OQiNzyOxyOm
	txykkYvdihbw6LE936w7DNOPcCMi3qjijiqpaaUo9Bj5QWgVm4eS+I3TyTSxX
X-Gm-Gg: ASbGncu+JFtnhMzfRHY09Q9rkQsLanv21u52K7o9fm+Nj4uCeZHRyZNVl5uhNPNLkpy
	RbFBwmm6wj7RgUZC5itGxCmXOAwlqniYxuzEqfUboS3frgy9z3W9wn51WfNu005wrgUKPe0qFgQ
	YF2+1tm0y0BmMXDuTo7u1LJs7eFXFr7XKuhTNMVfc5rL2TIvYbIUznMZlwnXzJW0xnnjnFI6TcC
	HVabP93hKp/1dsP4i0kiu0u4/UptLiG9m5hEc1c19qyaXAXEoBLYAmB3z2Lbk21Kqb1DL1yuenA
	kEIKdc6NbvaLo8b0d4oBbUB/l3CEQ5pXBQ==
X-Received: by 2002:a05:600c:4314:b0:439:5ea4:c1e8 with SMTP id 5b1f17b1804b1-4395ea4c253mr30390505e9.26.1739427384362;
        Wed, 12 Feb 2025 22:16:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH3qd6gNE08Qoznu6eYstSCD8IbCNOJYZXpKVv/3uEyMT3OV+NSSm0rQ2gWeAKMHrXzAWZ1cA==
X-Received: by 2002:a05:600c:4314:b0:439:5ea4:c1e8 with SMTP id 5b1f17b1804b1-4395ea4c253mr30390015e9.26.1739427383991;
        Wed, 12 Feb 2025 22:16:23 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.34.42])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439617fdad3sm7733905e9.10.2025.02.12.22.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 22:16:23 -0800 (PST)
Date: Thu, 13 Feb 2025 07:16:20 +0100
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
Message-ID: <Z62ONLX4OLisCLKw@jlelli-thinkpadt14gen4.remote.csb>
References: <8572b3bc-46ec-4180-ba55-aa6b9ab7502b@nvidia.com>
 <Z6SA-1Eyr1zDTZDZ@jlelli-thinkpadt14gen4.remote.csb>
 <a305f53d-44d4-4d7a-8909-6a63ec18a04b@nvidia.com>
 <5a36a2e8-bd78-4875-9b9e-814468ca6692@arm.com>
 <db800694-84f7-443c-979f-3097caaa1982@nvidia.com>
 <8ff19556-a656-4f11-a10c-6f9b92ec9cea@arm.com>
 <Z6oysfyRKM_eUHlj@jlelli-thinkpadt14gen4.remote.csb>
 <dbd2af63-e9ac-44c8-8bbf-84358e30bf0b@arm.com>
 <Z6spnwykg6YSXBX_@jlelli-thinkpadt14gen4.remote.csb>
 <78f627fe-dd1e-4816-bbf3-58137fdceda6@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <78f627fe-dd1e-4816-bbf3-58137fdceda6@nvidia.com>

On 12/02/25 23:01, Jon Hunter wrote:
> 
> On 11/02/2025 10:42, Juri Lelli wrote:
> > On 11/02/25 10:15, Christian Loehle wrote:
> > > On 2/10/25 17:09, Juri Lelli wrote:
> > > > Hi Christian,
> > > > 
> > > > Thanks for taking a look as well.
> > > > 
> > > > On 07/02/25 15:55, Christian Loehle wrote:
> > > > > On 2/7/25 14:04, Jon Hunter wrote:
> > > > > > 
> > > > > > 
> > > > > > On 07/02/2025 13:38, Dietmar Eggemann wrote:
> > > > > > > On 07/02/2025 11:38, Jon Hunter wrote:
> > > > > > > > 
> > > > > > > > On 06/02/2025 09:29, Juri Lelli wrote:
> > > > > > > > > On 05/02/25 16:56, Jon Hunter wrote:
> > > > > > > > > 
> > > > > > > > > ...
> > > > > > > > > 
> > > > > > > > > > Thanks! That did make it easier :-)
> > > > > > > > > > 
> > > > > > > > > > Here is what I see ...
> > > > > > > > > 
> > > > > > > > > Thanks!
> > > > > > > > > 
> > > > > > > > > Still different from what I can repro over here, so, unfortunately, I
> > > > > > > > > had to add additional debug printks. Pushed to the same branch/repo.
> > > > > > > > > 
> > > > > > > > > Could I ask for another run with it? Please also share the complete
> > > > > > > > > dmesg from boot, as I would need to check debug output when CPUs are
> > > > > > > > > first onlined.
> > > > > > > 
> > > > > > > So you have a system with 2 big and 4 LITTLE CPUs (Denver0 Denver1 A57_0
> > > > > > > A57_1 A57_2 A57_3) in one MC sched domain and (Denver1 and A57_0) are
> > > > > > > isol CPUs?
> > > > > > 
> > > > > > I believe that 1-2 are the denvers (even thought they are listed as 0-1 in device-tree).
> > > > > 
> > > > > Interesting, I have yet to reproduce this with equal capacities in isolcpus.
> > > > > Maybe I didn't try hard enough yet.
> > > > > 
> > > > > > 
> > > > > > > This should be easy to set up for me on my Juno-r0 [A53 A57 A57 A53 A53 A53]
> > > > > > 
> > > > > > Yes I think it is similar to this.
> > > > > > 
> > > > > > Thanks!
> > > > > > Jon
> > > > > > 
> > > > > 
> > > > > I could reproduce that on a different LLLLbb with isolcpus=3,4 (Lb) and
> > > > > the offlining order:
> > > > > echo 0 > /sys/devices/system/cpu/cpu5/online
> > > > > echo 0 > /sys/devices/system/cpu/cpu1/online
> > > > > echo 0 > /sys/devices/system/cpu/cpu3/online
> > > > > echo 0 > /sys/devices/system/cpu/cpu2/online
> > > > > echo 0 > /sys/devices/system/cpu/cpu4/online
> > > > > 
> > > > > while the following offlining order succeeds:
> > > > > echo 0 > /sys/devices/system/cpu/cpu5/online
> > > > > echo 0 > /sys/devices/system/cpu/cpu4/online
> > > > > echo 0 > /sys/devices/system/cpu/cpu1/online
> > > > > echo 0 > /sys/devices/system/cpu/cpu2/online
> > > > > echo 0 > /sys/devices/system/cpu/cpu3/online
> > > > > (Both offline an isolcpus last, both have CPU0 online)
> > > > > 
> > > > > The issue only triggers with sugov DL threads (I guess that's obvious, but
> > > > > just to mention it).
> > > > 
> > > > It wasn't obvious to me at first :). So thanks for confirming.
> > > > 
> > > > > I'll investigate some more later but wanted to share for now.
> > > > 
> > > > So, problem actually is that I am not yet sure what we should do with
> > > > sugovs' bandwidth wrt root domain accounting. W/o isolation it's all
> > > > good, as it gets accounted for correctly on the dynamic domains sugov
> > > > tasks can run on. But with isolation and sugov affected_cpus that cross
> > > > isolation domains (e.g., one BIG one little), we can get into troubles
> > > > not knowing if sugov contribution should fall on the DEF or DYN domain.
> > > > 
> > > > Hummm, need to think more about it.
> > > 
> > > That is indeed tricky.
> > > I would've found it super appealing to always just have sugov DL tasks activate
> > > on this_cpu and not have to worry about all this, but then you have contention
> > > amongst CPUs of a cluster and there are energy improvements from always
> > > having little cores handle all sugov DL tasks, even for the big CPUs,
> > > that's why I introduced
> > > commit 93940fbdc468 ("cpufreq/schedutil: Only bind threads if needed")
> > > but that really doesn't make this any easier.
> > 
> > What about we actually ignore them consistently? We already do that for
> > admission control, so maybe we can do that when rebuilding domains as
> > well (until we find maybe a better way to deal with them).
> > 
> > Does the following make any difference?
> > 
> > ---
> >   kernel/sched/deadline.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
> > index b254d878789d..8f7420e0c9d6 100644
> > --- a/kernel/sched/deadline.c
> > +++ b/kernel/sched/deadline.c
> > @@ -2995,7 +2995,7 @@ void dl_add_task_root_domain(struct task_struct *p)
> >   	struct dl_bw *dl_b;
> >   	raw_spin_lock_irqsave(&p->pi_lock, rf.flags);
> > -	if (!dl_task(p)) {
> > +	if (!dl_task(p) || dl_entity_is_special(&p->dl)) {
> >   		raw_spin_unlock_irqrestore(&p->pi_lock, rf.flags);
> >   		return;
> >   	}
> > 
> 
> I have tested this on top of v6.14-rc2, but this is still not resolving the
> issue for me :-(

Thanks for testing.

Was the testing using the full stack of changes I proposed so far? I
believe we still have to fix the accounting of dl_servers for def
root domain (there is a patch that should do that).

I updated the branch with the full set. In case it still fails, could
you please collect dmesg and tracing output as I suggested and share?

Best,
Juri

