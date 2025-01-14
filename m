Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB7E382
	for <linux-tegra@vger.kernel.org>; Tue, 14 Jan 2025 14:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736863348; cv=none; b=Za9VBq+smvJxoyK3soLG/+f5rfL6jgLKkVjmZwzyaopQtE2ZkesecMBrMK/T4VmnpKkYdbB8fqrqPPoCVywDHK2VvTpqofAJI6vWa8STApVe7g6iC9CUD78vSkSz0klr24aoYictmpSpc/tv3WluA2IGw8xsWmZOgAPHij7gvFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736863348; c=relaxed/simple;
	bh=Wwaqhu3BS83hIwdm2jCNfJB9XVk8B4R5hwS28BYn3kU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HLxndfWb/16mZCK1SQn8UA0chunfgL4HcjjhrhM3nwOnVuxzltNm17HRV80ZWgLvfxfR0bU+Icro9ungr+GFWQlbxxlaUJOhuUHet35tWbzYYvOvdR5cnNb/D83KdkNDk55ZXw1Qm4HXNn3BO2qJCzslH4xiko8JJOqYBRJwQ7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=L2/8TLzA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="L2/8TLzA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736863345;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XZ2stY1d0j5tFV9hzbqgrrllt/9ieviJhnDGzEJo1Rw=;
	b=L2/8TLzA6VqLsYOKgHCPBtf7Jykmtr5LTHusyTgK0xMzpddzFx2EFXyP1lFUnCQkzGxmFr
	MR8T0+yCu9cPuxnc5uGfrbpfDIgXkxMjXcarFoxdQeC7cQAlJ9pLWeBPRo3oQcA+pQi162
	JMGICt9t8krNb4F1Wrc8K5qFRIaQ4Yg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-682-UFA7r7jSOJ64T__Rj3I9xw-1; Tue, 14 Jan 2025 09:02:23 -0500
X-MC-Unique: UFA7r7jSOJ64T__Rj3I9xw-1
X-Mimecast-MFC-AGG-ID: UFA7r7jSOJ64T__Rj3I9xw
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-436723db6c4so37833165e9.3
        for <linux-tegra@vger.kernel.org>; Tue, 14 Jan 2025 06:02:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736863342; x=1737468142;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XZ2stY1d0j5tFV9hzbqgrrllt/9ieviJhnDGzEJo1Rw=;
        b=nYv/ikd///aryfW9jHOOulQEt4lsHT4obgk9UlNqjfW4ynmDse0LYh1pT3K54bVr6F
         Qoxval2QWo97hFhWgaeWGh59Su7N8ek0iCovkmUtID9WFlUW7UzZXUqLZ3GLoDl9uzj4
         4AQOu0icHbQJ3B8Ja7TsOIr6FRvsp8HoZFQBEmcO12CggZgqCiUJ3J3sVgzTSUZ3l4uF
         lBw3cXR3M9f0+KbG29bUe4WrmLHIsAwzslHSUqE6yBELbv1GYID9PjxIamCZCZ3puWDE
         bGziccyBTYJBHiIn3G5nvxFWHQVUMeGlGHXdR45TmR41rqPjWZ0aiyR2b5emcCMAZ6Vj
         97rA==
X-Forwarded-Encrypted: i=1; AJvYcCUDfId4SoG2LGzCMCIG/v4GV5oWrkcD92B0ZCaONk2ybdaq2asA4cWBBCDWcTjnHNnTabU1YxFgnBoRVg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYzTIe9NgMOPGXjoqEh0Prhg2InzbFXtFo/Y2O1bQ1+T5vc4w5
	6q38YQFITBNxySlWiDF9P8Zldc4YJ7sX4a1sg2p2rQDGH4p0m1vHPfuQBLI6L8ZEl8Gfl/XaSKa
	K/WRgLb3ow34AtcqRUmSqxeu+LvybBlj7OuWEuWlwq9WYjKM+55FMTmmLnwBh
X-Gm-Gg: ASbGnct+eLWD1xqRqJSx1/+DYhdd7Xlpuia4njI4j5Mpm4/XRybXH6MeIhPbp0sX57o
	WCcrtaSWdYY5POxCXb60IFFsM9GjzOM+yMgjb7KFDTeNSNpvm5g8N3XC3/lFlXAO6LiwBdQeejL
	0413CFKtdfScLwfTz9zPBmmALpEnxoOTbAQQvZ8J17VsuTQLDVPiheSRmakkz3cQhUlwuDfoiqq
	DGQ/ljwY+FGsJYNGoL9lYAftcHro0ANnzXSvOnvhyB0ZGrHvGHT9qEslQKtWU/fGezHxX1cr0pp
	ikgi0iG1mQ==
X-Received: by 2002:a05:600c:3152:b0:434:f9e1:5cf8 with SMTP id 5b1f17b1804b1-436e271d3a2mr232038265e9.31.1736863342140;
        Tue, 14 Jan 2025 06:02:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF6SqwrvvdK2Vn+2bLJW+Tuv+cb4ueUK0LuboeZtC3lmAh3e45fHn6HxH0eXGu0MJCRfRdu2g==
X-Received: by 2002:a05:600c:3152:b0:434:f9e1:5cf8 with SMTP id 5b1f17b1804b1-436e271d3a2mr232037215e9.31.1736863341385;
        Tue, 14 Jan 2025 06:02:21 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.92.51])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9e37d46sm175300585e9.25.2025.01.14.06.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 06:02:20 -0800 (PST)
Date: Tue, 14 Jan 2025 15:02:17 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Thierry Reding <treding@nvidia.com>, Waiman Long <longman@redhat.com>,
	Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
	Michal Koutny <mkoutny@suse.com>, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
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
Message-ID: <Z4ZuaeGssJ-9RQA2@jlelli-thinkpadt14gen4.remote.csb>
References: <20241114142810.794657-1-juri.lelli@redhat.com>
 <ZzYhyOQh3OAsrPo9@jlelli-thinkpadt14gen4.remote.csb>
 <Zzc1DfPhbvqDDIJR@jlelli-thinkpadt14gen4.remote.csb>
 <ba51a43f-796d-4b79-808a-b8185905638a@nvidia.com>
 <Z4FAhF5Nvx2N_Zu6@jlelli-thinkpadt14gen4.remote.csb>
 <5d7e5c02-00ee-4891-a8cf-09abe3e089e1@nvidia.com>
 <Z4TdofljoDdyq9Vb@jlelli-thinkpadt14gen4.remote.csb>
 <e9f527c0-4530-42ad-8cc9-cb04aa3d94b7@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e9f527c0-4530-42ad-8cc9-cb04aa3d94b7@nvidia.com>

On 14/01/25 13:52, Jon Hunter wrote:
> 
> On 13/01/2025 09:32, Juri Lelli wrote:
> > On 10/01/25 18:40, Jon Hunter wrote:
> > 
> > ...
> > 
> > > With the above I see the following ...
> > > 
> > > [   53.919672] dl_bw_manage: cpu=5 cap=3072 fair_server_bw=52428 total_bw=209712 dl_bw_cpus=4
> > > [   53.930608] dl_bw_manage: cpu=4 cap=2048 fair_server_bw=52428 total_bw=157284 dl_bw_cpus=3
> > > [   53.941601] dl_bw_manage: cpu=3 cap=1024 fair_server_bw=52428 total_bw=104856 dl_bw_cpus=2
> > 
> > So far so good.
> > 
> > > [   53.952186] dl_bw_manage: cpu=2 cap=1024 fair_server_bw=52428 total_bw=576708 dl_bw_cpus=2
> > 
> > But, this above doesn't sound right.
> > 
> > > [   53.962938] dl_bw_manage: cpu=1 cap=0 fair_server_bw=52428 total_bw=576708 dl_bw_cpus=1
> > > [   53.971068] Error taking CPU1 down: -16
> > > [   53.974912] Non-boot CPUs are not disabled
> > 
> > What is the topology of your board?
> > 
> > Are you using any cpuset configuration for partitioning CPUs?
> 
> 
> I just noticed that by default we do boot this board with 'isolcpus=1-2'. I
> see that this is a deprecated cmdline argument now and I must admit I don't
> know the history of this for this specific board. It is quite old now.
> 
> Thierry, I am curious if you have this set for Tegra186 or not? Looks like
> our BSP (r35 based) sets this by default.
> 
> I did try removing this and that does appear to fix it.

OK, good.

> Juri, let me know your thoughts.

Thanks for the additional info. I guess I could now try to repro using
isolcpus at boot on systems I have access to (to possibly understand
what the underlying problem is).

Best,
Juri

