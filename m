Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA84A182B4
	for <linux-tegra@vger.kernel.org>; Thu, 13 Feb 2025 06:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739427654; cv=none; b=CM6LvqvSc07WrKqaZ5TlP9KdWMNofdjj+Rmh6H4ddipmndIqxd74NHSxNT3QvVPo9e384Yoaf5BphJOoXAvA1SYL4/tMb5UzA4d/S1GBKHCmMi9rgwaX5w09bn6gdnV9ioJufBP6zuvMuBvjeQo6cy534MO6U97Wk9KGteNh1Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739427654; c=relaxed/simple;
	bh=ujajjJF3gxYdA1DcNCIqKS9o38/7j0hv1rZ6wwtwKUY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MQ36R7gpm+pJCzIClDnoIet0JXFy3KEpUYMrpifwUUaeChH2kHHF+Ly8HTyQ59c5IaffxAx+bDJAwYJ1uI/GvBeAR/7o2U+aL6xpsQFkV5ffl/SfhOwV8RYEeiSiIunusldr0RO+eZ11rsoqk585AMVcBqUujFa6RYX70il8HlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LruLTUyn; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LruLTUyn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739427651;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CPPPQaWJNVckUPtigjDkhfhBpenPmQjuRXN55oSVE/w=;
	b=LruLTUynvdgvYeMAtPo9tiqthxwf4y8WosBYj7W6iSP2KN/r/IauJvyIU1LYGZWVWyRyCW
	p6AV9ALpYGI/tx4JGl9byO+f7zJJauP61ISa3CvvUDvUEu/y4V6I41L3FhfgzV8ASNTydF
	1mc1tCu0TqmW97Z4UDLdjeBooaeINHA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-250-LEL7M035Mnuj9irpCE4UKA-1; Thu, 13 Feb 2025 01:20:50 -0500
X-MC-Unique: LEL7M035Mnuj9irpCE4UKA-1
X-Mimecast-MFC-AGG-ID: LEL7M035Mnuj9irpCE4UKA_1739427649
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4395ff90167so2237665e9.2
        for <linux-tegra@vger.kernel.org>; Wed, 12 Feb 2025 22:20:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739427649; x=1740032449;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CPPPQaWJNVckUPtigjDkhfhBpenPmQjuRXN55oSVE/w=;
        b=nqGAWVm9BqcVE+HnP4D/h78SPgOWhUDpm1AsHuyYFZnbZVlX6cp7qy9Ls18e9peNvg
         E+TPOwWC6rmqqDM4DuaN7zVuY856Mul7t7+ALb8p14JiPo+tjPSJKpVpi7YOUwwJ7ah2
         SJHru0q1CZZKRIPVhXm6vG9/sTIceTGKPtwwJYeWhJoEkPCuhWCPnedN47gVWBM7R3tw
         80Z9LFgQRkKNYtjYkjfaw6Y5mPXUnaI0zZlXtVhcB5ClePjzHh9Gjef05gedFURcMEPv
         ADkVr/nojJ122xhZQjDykh50H2ho2naL72LYiUr8Adx4/ycq7mfeYtZC8u0pLgz1YSI/
         iExQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5D5/QLPp+Zz7I7uR3hHzcTQnLVbV5DbhO3/uaMOFCatRfeWxuW5eO21I5oKEzZ7PAScVzrkmOAApoqA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8myg54MYeLJzPoYFsYq46jQmr6ukQ6xJEyLIqGy7q5ewQtdjM
	I77zZd2GLn+D7OvE5Gw43GloLavFvm6U9imFvWt90/KgScxboHyrrKwXd0OreyNq1gLLwZFtRMS
	A2ymCfokAiVSXVgGTXPfqT4NsVXP59y1RiQoA+cEClm1MzszBvKZrhrrLF5my
X-Gm-Gg: ASbGncttvX2GwVdNtws1JgT5eTtjGNWsIpcy2RNIyHGVxkgST/XjMcxB0K0cMP+/lH5
	TRigy6HC5xAR+e7CPeyMYp56s120GFs45QX4I0g81lSTAy6f9Ok0ZBQ0Ux2pCL2fjeYQXz9mSCU
	Vp8u0eipJ8SRT2xBOafhjTJXGEvdvocxIkzgGpryxN1CPiYDWc+S2DAD1O06vMRRY4hVvvzLgTW
	TcqkqacZpehtAwhLrDYPfm1e/pFbJ3hOAwoA0R1OJ74sSEkzSxjhLRDuDw3mKF9+B58tAqfog4h
	DBA0EQT00OIiAxwuo2cK/oNxGzW+22Gq8Q==
X-Received: by 2002:a05:600c:34cf:b0:431:3bf9:3ebb with SMTP id 5b1f17b1804b1-439581b2618mr55155295e9.24.1739427649057;
        Wed, 12 Feb 2025 22:20:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IER6/42+eVDeZwjdE+jxN4B0+qhxJwM/n+zSdf4mIKkK9A70FFseUlVSNAfLLV/nC108HkX3g==
X-Received: by 2002:a05:600c:34cf:b0:431:3bf9:3ebb with SMTP id 5b1f17b1804b1-439581b2618mr55154855e9.24.1739427648614;
        Wed, 12 Feb 2025 22:20:48 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.34.42])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a1aa779sm38582615e9.30.2025.02.12.22.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 22:20:48 -0800 (PST)
Date: Thu, 13 Feb 2025 07:20:45 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: Christian Loehle <christian.loehle@arm.com>,
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
Message-ID: <Z62PPUOY5DClYo1A@jlelli-thinkpadt14gen4.remote.csb>
References: <8572b3bc-46ec-4180-ba55-aa6b9ab7502b@nvidia.com>
 <Z6SA-1Eyr1zDTZDZ@jlelli-thinkpadt14gen4.remote.csb>
 <a305f53d-44d4-4d7a-8909-6a63ec18a04b@nvidia.com>
 <5a36a2e8-bd78-4875-9b9e-814468ca6692@arm.com>
 <db800694-84f7-443c-979f-3097caaa1982@nvidia.com>
 <8ff19556-a656-4f11-a10c-6f9b92ec9cea@arm.com>
 <Z6oysfyRKM_eUHlj@jlelli-thinkpadt14gen4.remote.csb>
 <dbd2af63-e9ac-44c8-8bbf-84358e30bf0b@arm.com>
 <Z6spnwykg6YSXBX_@jlelli-thinkpadt14gen4.remote.csb>
 <285a43db-c36d-400e-8041-0566f089a482@arm.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <285a43db-c36d-400e-8041-0566f089a482@arm.com>

On 12/02/25 19:22, Dietmar Eggemann wrote:
> On 11/02/2025 11:42, Juri Lelli wrote:

...

> > What about we actually ignore them consistently? We already do that for
> > admission control, so maybe we can do that when rebuilding domains as
> > well (until we find maybe a better way to deal with them).
> > 
> > Does the following make any difference?
> 
> It at least seems to solve the issue. And like you mentioned on irc, we
> don't know the bw req of sugov anyway.
> 
> So with this change we start with 'dl_bw->total_bw = 0' even w/ sugov tasks.
> 
> dl_rq[0]:
>   .dl_nr_running                 : 0
>   .dl_bw->bw                     : 996147
>   .dl_bw->total_bw               : 0       <-- !
> 
> IMHO, people who want to run serious DL can always check whether there
> are already these infrastructural DL tasks or even avoid schedutil.

It definitely not ideal and admittedly gross, but not worse than what we
are doing already considering we ignore sugovs at AC and the current
bandwidth allocation its there only to help with PI. So, duck tape. :/

A more proper way to work with this would entail coming up with sensible
bandwidth allocation for sugovs, but that's most probably hardware
specific, so I am not sure how we can make that general enough.

Anyway, looks like Jon was still seeing the issue. I asked him to verify
he is using all the proposed changes. Let's see what he reports.

Best,
Juri

