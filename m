Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267FA25A2CD
	for <linux-tegra@vger.kernel.org>; Tue, 25 Feb 2025 09:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740476912; cv=none; b=B7EVkqD+LyZmQxwL0sDbetLiaoWYt5cQEFNM6WTkjddjMIuqyZIjADdV2xBag+sx3AkIIgDNV0myNU6FwyKhdEi4bvIn0BJI+M+6ealOvbQbN/nKun1JQMdiS/8ORdWU/6knYLSsqdf/Brem/95rVlUoCFVOVqAiFq2Ojj/GLoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740476912; c=relaxed/simple;
	bh=nGlvMoyzBTZDRXMl3c+sUlUWlnh5FHc2EHGicv360qo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HHWl1adUHc0eSe5j5dYSp938F+yrdxJwKerqN+PQ2ph7bRNy1gjtQwOT9691wZ4JeahXor2KtDlncKiV7/ZXRV8LIm2dM69MvIt8dvw+lMcJDnINvXJ3XtsQxYEzUEWInNeuKEmKPnMWhFqxxYUZOztslmdiaQTEBnKtUlxKD3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PZg5V0lo; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PZg5V0lo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740476910;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0682VwDrfrWl0p9aic376RslWqpGKhFnq7HFGON2EH0=;
	b=PZg5V0loYNIW+qM6MUp8tsWqs7GDfWJFSEyACoG5MkOKqrd+8wctfS8UzSVIU3lm5ZLOBg
	79nT///+yMEZR5qQ+yJGwzojUWbb9Xb7bAEFhxMoSt6xysJW8yMnjx3i726vYpZvVjOKrX
	y2F8taLG33WAwKSs5XuKpcRSCfX1XZc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-263-Tp3Gdcu0MvW6Lmj0kxjzvA-1; Tue, 25 Feb 2025 04:48:28 -0500
X-MC-Unique: Tp3Gdcu0MvW6Lmj0kxjzvA-1
X-Mimecast-MFC-AGG-ID: Tp3Gdcu0MvW6Lmj0kxjzvA_1740476907
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43ab5baf62cso1859975e9.0
        for <linux-tegra@vger.kernel.org>; Tue, 25 Feb 2025 01:48:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740476907; x=1741081707;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0682VwDrfrWl0p9aic376RslWqpGKhFnq7HFGON2EH0=;
        b=IOYr4HdMjl+1c6yAS2Wm8/y1XbY5tNrQJ0BLjuAcM3bdSWRE/V6QQoW4C44rcIzr8o
         CF55d+VnJyJXfeymWJhtsHBN1esUIRs+hKFERLyg7hcf7tXqF9nQQ9Jn6aPKsPHR1YOv
         2AVN0jmGDjin6GoLn/wk0LgAYt9Go+aEkhuw+3zqgWb2ON2p8ccSDwcianp1JSYyfu9v
         GkWMxc7jQThPrtIYWI5jUxDvzoZFcpUdP4MCibmyv5WkwDbiVLZi2w52Rz4PIx1x90hq
         Kie59fjxoSxMgp0ib72NTOanb/f+SKfgSzynL2k4gv4ABPkhU8nUcS0kiniHLB5GivC+
         f6uw==
X-Forwarded-Encrypted: i=1; AJvYcCVmEgwvVsepFAnDmcFrOuNl0vQe84AFDw5w7rL6OVIHrgfPSt7sFKDiYceNPiKm+pbfnF+C76UKsYbttQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2G/yVXvrjciOiz2rDUQDIll5M1jgAdgkjjrX/k9cvrIn5GpOB
	4OCCSfxWEUoHXlgc0agwxrR5L5TNHMSWwIMt0YU58rvIvFEOYpght1jP4eYUvSMLCZJ4hjrx91u
	i92aAPAXs2LdZtn7kewJxDU+4VCo4mnfjXeNrFPt3Tnns4Oe1ckRCjENtdTSW
X-Gm-Gg: ASbGnctbgMpUADp1ObK6sXcaduTjE7D4if2cssS0KS0wv2Mblk0nBqvgKOLNspWoTZG
	MbetVOc93ds6Lr/QDfL0O6ZDCIBvlORHGoOLqCvnkk5FZk3gt7SG4w9HNcGLDYf09PuuJqx+8M1
	ElWH7owx7mvqqoSbcapMhE6Tzf9wf7xubnSEliPJ3KgCNz3LipH05StpB86D+LQ8BQgCWIFcRlT
	6G/jUqQ5vpUTSsw7lR7iYgK0AJjN0Q9aKMHnBWyvnSZzcJYQ1IHYQ4g//VQigkw9NU4O8qx21yU
	Wz5n0izZ6O6DEFAd0FIErczZk120bnFmBQ3XhxMS65hI
X-Received: by 2002:a05:600c:4686:b0:439:8c6d:7ad9 with SMTP id 5b1f17b1804b1-439ae225a53mr147040035e9.31.1740476906809;
        Tue, 25 Feb 2025 01:48:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH6KgXf9mu9XV5XIx/bzsC4rdve5WG9ngEo3WrqVFcizZhbRqC2DByd0rmzNqluKUQCmvTvDA==
X-Received: by 2002:a05:600c:4686:b0:439:8c6d:7ad9 with SMTP id 5b1f17b1804b1-439ae225a53mr147039685e9.31.1740476906457;
        Tue, 25 Feb 2025 01:48:26 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([176.206.7.30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439b01346d1sm136419845e9.0.2025.02.25.01.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 01:48:25 -0800 (PST)
Date: Tue, 25 Feb 2025 10:48:23 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>,
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
Message-ID: <Z72R5-I91l5FOJK6@jlelli-thinkpadt14gen4.remote.csb>
References: <Z7WsRvsVCWu_By1c@jlelli-thinkpadt14gen4.remote.csb>
 <4c045707-6f5a-44fd-b2d1-3ad13c2b11ba@arm.com>
 <537f2207-b46b-4a5e-884c-d6b42f56cb02@arm.com>
 <Z7cGrlXp97y_OOfY@jlelli-thinkpadt14gen4.remote.csb>
 <Z7dJe7XfG0e6ECwr@jlelli-thinkpadt14gen4.remote.csb>
 <1c75682e-a720-4bd0-8bcc-5443b598457f@nvidia.com>
 <d5162d16-e9fd-408f-9bc5-68748e4b1f87@arm.com>
 <9db07657-0d87-43fc-a927-702ae7fd14c7@arm.com>
 <Z7x8Jnb4eMrnlOa8@jlelli-thinkpadt14gen4.remote.csb>
 <4aa1de5c-4817-4117-b944-4b4c8f09ac40@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4aa1de5c-4817-4117-b944-4b4c8f09ac40@nvidia.com>

Hi Jon,

On 24/02/25 23:39, Jon Hunter wrote:
> Hi Juri,
> 
> On 24/02/2025 14:03, Juri Lelli wrote:
> > On 24/02/25 14:53, Dietmar Eggemann wrote:

...

> > > So DL accounting in partition_and_rebuild_sched_domains() and
> > > partition_sched_domains()!
> > 
> > Yeah that's the gist of it. Wait for domains to be stable and recompute
> > everything.
> > 
> > Thanks for testing. Let's see if Jon can also report good news.
> 
> 
> Sorry for the delay. Yes this is working for me too! If you have an official
> patch to fix this, then I can give it a test on my side.

Good! Thanks for testing and confirming it works for you now.

I will be cleaning up the changes and send them out separately.

Best,
Juri

