Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F5818A6AD
	for <linux-tegra@vger.kernel.org>; Mon, 24 Feb 2025 14:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740405811; cv=none; b=IzKnuJPcSKB1mJKEHCihb8E5RS39Hyr7MT5WOjrFVrOJYxN6iCZdVriJ8/gW/GyqGc8TEV2ExTfqeXlrey1Ddpt6jPNbToKBxaV5mXetQMjPqeLV+NQfvETrmG7MP1+G8taaE64rT5sipLlFsbqxUReOOhT5HvC2cuOuONUYnQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740405811; c=relaxed/simple;
	bh=1JALSei35oMhZvTDfxvtjv7epCXM5mRcWouOYjswpr0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sxHRoA2BwlmMqN4LET2olpnPAlr6Tmj5C6dbbsI513aooQlBf2ih0jjrdPaRolv3HiErwQg4isY5JRkPG3V8DWnplG5WESy4PbcpVGOAwGf74w/Ll4UiYFycQNv6kuwGEZfDFZOQnhGc/q47z7a88S+OkBG4kSyn0cD7bks+/Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GOYeEfrZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GOYeEfrZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740405806;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6kPlEDzMoCiaFPBFpTObksOw/FBcJf2EMjwPGt2p/nQ=;
	b=GOYeEfrZD0juf8/EMVpSeBhB3Uw65/t8pl9OtLoRjfJEnvY3PtI6G2r9/WR6Z6J3wPpTHt
	2uMDA/C6HIwAtkFGgfbVwCKp+aX/RyfyJGNLwWyspO1/WrCfVfxZMoSASo2Y7Vf5Lvf4jK
	Z5Ig2/eMf9xOrvelwXFqdNZFEU5JZF8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-118-ZzxELg7NMDi1PTx1uIDT3w-1; Mon, 24 Feb 2025 09:03:25 -0500
X-MC-Unique: ZzxELg7NMDi1PTx1uIDT3w-1
X-Mimecast-MFC-AGG-ID: ZzxELg7NMDi1PTx1uIDT3w_1740405804
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4398ed35b10so23182955e9.1
        for <linux-tegra@vger.kernel.org>; Mon, 24 Feb 2025 06:03:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740405804; x=1741010604;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6kPlEDzMoCiaFPBFpTObksOw/FBcJf2EMjwPGt2p/nQ=;
        b=Ajr6Rhvn4p9H9QOdLVXZ8r1wMT1+TniEIobLM2ptB2S/BsMqAg/2O+jxiiTohvjW0z
         yU8W0Y8BbCNbeM2tNWUnaA1TXeI62l9wwF4mYoRsZs9V2dtNNw7KvmU7PMGz/v1MIX0D
         Kj1L6AI9POWlB3XoBh8UkpK4hF7A88JZCYuWzwfwies4XZftEWfmUpYDGXS/z02Fop7z
         Zdl7obljOrakU8TSUdRkz2hijPthgDt5dgUhTSqaal+gCceR+vOI76WxcRTUgYurXjGl
         rbENPnRO81UPB+DI5hab4BRfmG+sl60dfVc+Pom8RmxkSc+C8u6x5KoS89CcNYF4oykc
         6blg==
X-Forwarded-Encrypted: i=1; AJvYcCUTAZv25dJlHyizqDxXCS3jH9nF3PHIg3H0PKgG0/Zsx8aeTnQ71QPjH/PwXBV3NAAmqUhfJJJAKdA9Bw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzK7fLow5BwujHNq6wTdHTsDHBAnzGtKeyHz7rgxowVB5W96jIc
	j9CEq1hRkbOYs7WbysBkYmBTX9vaog9uPuEgXZnnlw0dBxGIPZJmpx2kGA2FgmIEvajHO/tpLM8
	DNb4EonfR4tmDoOk2KJD5Wu9JwYraoferD/6tE3m2ZW3i3mqDy7ID/QRX9Pvt
X-Gm-Gg: ASbGncuzJ6OGEC+Ac0bFOPNOkjOjX1KXN+uYJfZIyxb/CKowxqxAWAxMLL0ZtSCL5hA
	kj8LQSys3F/YTBM1V91E9qYcujMHxhJYIDW8++wBSGNDDBZM7C418Q56XVsBEP18TzLYzkD5FiB
	DM0E1koxyBYIWYAT9rR2gHi4DMrs6kjVltad5jUCmot1+rhfZXhc0zOwwv1YpXic3PqV4yCPdVB
	WdBvNhupNjBYgRinH5vIEKB3hkycqDoj8DBW1tOcr/1hy/gSgqfzW7DOo+wicRK2NMNyaEc5zcE
	DTAagGY6/XqzF6Bgwy5VpG+gwJh+KYZ5kPoU+s0PghQ2
X-Received: by 2002:a05:600c:1c01:b0:439:9f42:8652 with SMTP id 5b1f17b1804b1-439ba176db4mr73098425e9.17.1740405802635;
        Mon, 24 Feb 2025 06:03:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHkIfUh6rj4W4zZ1GHJwwLGYv2xuVUgU5uNxKr8b2wUnMTJZBbmIXvQMUKxcjIWDgQJIbI7Zw==
X-Received: by 2002:a05:600c:1c01:b0:439:9f42:8652 with SMTP id 5b1f17b1804b1-439ba176db4mr73097705e9.17.1740405802123;
        Mon, 24 Feb 2025 06:03:22 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.34.42])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d94acsm32198115f8f.75.2025.02.24.06.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 06:03:21 -0800 (PST)
Date: Mon, 24 Feb 2025 15:03:18 +0100
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
Message-ID: <Z7x8Jnb4eMrnlOa8@jlelli-thinkpadt14gen4.remote.csb>
References: <Z7SWvr86RXlBbJlw@jlelli-thinkpadt14gen4.remote.csb>
 <a0f03e3e-bced-4be7-8589-1e65042b39aa@arm.com>
 <Z7WsRvsVCWu_By1c@jlelli-thinkpadt14gen4.remote.csb>
 <4c045707-6f5a-44fd-b2d1-3ad13c2b11ba@arm.com>
 <537f2207-b46b-4a5e-884c-d6b42f56cb02@arm.com>
 <Z7cGrlXp97y_OOfY@jlelli-thinkpadt14gen4.remote.csb>
 <Z7dJe7XfG0e6ECwr@jlelli-thinkpadt14gen4.remote.csb>
 <1c75682e-a720-4bd0-8bcc-5443b598457f@nvidia.com>
 <d5162d16-e9fd-408f-9bc5-68748e4b1f87@arm.com>
 <9db07657-0d87-43fc-a927-702ae7fd14c7@arm.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9db07657-0d87-43fc-a927-702ae7fd14c7@arm.com>

On 24/02/25 14:53, Dietmar Eggemann wrote:
> On 21/02/2025 15:45, Dietmar Eggemann wrote:
> > On 21/02/2025 12:56, Jon Hunter wrote:
> >>
> >> On 20/02/2025 15:25, Juri Lelli wrote:
> >>> On 20/02/25 11:40, Juri Lelli wrote:
> >>>> On 19/02/25 19:14, Dietmar Eggemann wrote:
> > 
> > [...]
> > 
> >> Latest branch is not building for me ...
> >>
> >>   CC      kernel/time/hrtimer.o
> >> In file included from kernel/sched/build_utility.c:88:
> >> kernel/sched/topology.c: In function ‘partition_sched_domains’:
> >> kernel/sched/topology.c:2817:9: error: implicit declaration of function
> >> ‘dl_rebuild_rd_accounting’ [-Werror=implicit-function-declaration]
> >>  2817 |         dl_rebuild_rd_accounting();
> >>       |         ^~~~~~~~~~~~~~~~~~~~~~~~
> > 
> > This should fix it for now:
> > 
> > -->8--
> > 
> > diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
> > index 52243dcc61ab..3484dda93a94 100644
> > --- a/kernel/cgroup/cpuset.c
> > +++ b/kernel/cgroup/cpuset.c
> > @@ -954,7 +954,9 @@ static void dl_update_tasks_root_domain(struct cpuset *cs)
> >         css_task_iter_end(&it);
> >  }
> >  
> > -static void dl_rebuild_rd_accounting(void)
> > +extern void dl_rebuild_rd_accounting(void);
> > +
> > +void dl_rebuild_rd_accounting(void)
> >  {
> >         struct cpuset *cs = NULL;
> >         struct cgroup_subsys_state *pos_css;
> > diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
> > index 9892e6fa3e57..60c9996ccf47 100644
> > --- a/kernel/sched/topology.c
> > +++ b/kernel/sched/topology.c
> > @@ -2806,6 +2806,8 @@ void partition_sched_domains_locked(int ndoms_new, cpumask_var_t doms_new[],
> >         update_sched_domain_debugfs();
> >  }
> >  
> > +extern void dl_rebuild_rd_accounting(void);
> > +
> >  /*
> >   * Call with hotplug lock held
> >   */
> > 
> > 
> 
> Looks OK now for me.
> 
> So DL accounting in partition_and_rebuild_sched_domains() and
> partition_sched_domains()!

Yeah that's the gist of it. Wait for domains to be stable and recompute
everything.

Thanks for testing. Let's see if Jon can also report good news.

Best,
Juri

