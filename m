Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB7B21CFF4
	for <linux-tegra@vger.kernel.org>; Fri,  7 Mar 2025 15:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741360590; cv=none; b=gVMISqi9Gr/s1uvq+g91IMFoWsicKIfHLy/olRzT+tspmSloPkFJIIM9G5HjNVLgI6wO+9qJVeL8gRv0TKBD1oSEmvB2ZaqJWjOeaag//fT1bzS0i16vg2IOtB8mWg2WQGRIkSG6GQF9aK2ruEZ6EXjlLAPdZiYb2iT7HTdFggA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741360590; c=relaxed/simple;
	bh=bBxbz03qAUVHviMss484CFNq9Oq7Zp1E6pkNgNBfDkY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=meq7MiWmcWXTRFUQSvSkClWNnh5m+DJvwLaO1vyowx4earfKp0yjvC+1r6xC3xuFpXktFlclPcndV78u+SwoKlGsB/eMHzpSUOH4VGfFVktjoN08FiUHA0i5J36q+W6BlfzRcEX/I0ocCs1C0SY3m8biIWVsdhEB2HqVWs4SttA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H6V8k7bu; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H6V8k7bu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741360587;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8UPoCF2TV9wNGlnVaBCwxXKKLjXm2csIIhfyrHtuFdo=;
	b=H6V8k7buZ5Ax9BnQnQlRNr/c/5bxgP2/nUBH8YiPWQN8ml2E/a9RL6DkGUsWu81u3O7H7N
	F5ntakkA37WmggU+FcvOJaYW4LhWPTJj+xSwanJNUZM8A4QwLmcfNcyrsPVkTP+eBiaNS2
	47Ampnh05iVsnSDRK4lRVHgT0GTPLqI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-681-elaF82DgNUKjxVxk8eDs5A-1; Fri, 07 Mar 2025 10:16:26 -0500
X-MC-Unique: elaF82DgNUKjxVxk8eDs5A-1
X-Mimecast-MFC-AGG-ID: elaF82DgNUKjxVxk8eDs5A_1741360585
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43941ad86d4so9381885e9.2
        for <linux-tegra@vger.kernel.org>; Fri, 07 Mar 2025 07:16:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741360585; x=1741965385;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8UPoCF2TV9wNGlnVaBCwxXKKLjXm2csIIhfyrHtuFdo=;
        b=s3pzTg4kcXLd9VNdvdsfWMBYbElnaClncO5oSheA4kIh0ysaMoVCOVi1UcpGdQYhHb
         x5qDtnEAzjpcFgpKMKOeYk0rEszcJjK77HKpHQR9z+oxuOsOGoGYJlb034bFRBnwB3Nd
         +yly1ArDeA4lvHzEZFWj9kfhQYRyiof4iMRUaIIaIOI8zRVBBL/Gknc3Ooc4U9kmtj16
         Zk1ibMoIJeo2RYsX2JqsDgA/yzu294VQ6pfC4KBGWLx2/A57DaX8a4oAiXG9M/Twmd1c
         dIpjavLebFvjYY0P+csnsiBOW0NZScQNq4FXPcUHyJF9ChGpmQWtTsIyekSdjc6/0zkH
         RljQ==
X-Forwarded-Encrypted: i=1; AJvYcCVu8MaolGXWpMs32FKUqvZj/+/aKpK0AZlbpQjn4OGasa5mpVwxdsj8aYeFoM/SjekcWyB1JB3q7MgIrg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc+TjYvkp4pasJ6l1Eb6XB1USosJZDM9b+YtL5mvHL1HlKZK5z
	r/zLw5LZ7hm1Fe7iPJe+Z0c188nzKlsXDyfpMsSozMCQGDiEEo3qutS5M5MhxawOEvjCj72NBk4
	uvsKxT/OyHTpv+nF6otMIiJWpx7onOBMdSKhYekQ3WF0la+C+1Z/flm+nivjo
X-Gm-Gg: ASbGncv1ONYFuUu0tH8/GUXOGuV1Y5Unq2QWvtSITxJAWNNOHxOA8HaD6/3Ad2NAM19
	Jz+E0ADn0RxjZiC4zeYp5yHIywYsW06nwttBvM4o5WuEoGD4BldZUx1DABW/2/fl8EUhUuNat7f
	Sgq/MobxU/Z7UN5yKPapq4yW3eiZN0zlsfGpOP4u7UzJg1VXwyCM6r35VdabECh854bIa4HaBS7
	WPelveIKqnvo0LbHLIIpGfP6Rz9S9eKtMJbHAaU8q9IiAjHHLHYFaZfCmeBoyyzlEcCiswaP8Ul
	ELPG4lKie3XCit5IQzMhU/QxMTH1dve75A3lz/WziNb8kAAliiQcQ0B/xmgG2OjpMK+7eM64GSz
	UhtAB
X-Received: by 2002:a05:600c:154a:b0:43b:d040:3e08 with SMTP id 5b1f17b1804b1-43c601d888emr26836155e9.8.1741360585518;
        Fri, 07 Mar 2025 07:16:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGbqdZopBPMKZX+Hcxaxbbjod5fJk6RsUqCj4tqlz0tE6ncD07MAJKcZmWETr1ADUNAGiMoKw==
X-Received: by 2002:a05:600c:154a:b0:43b:d040:3e08 with SMTP id 5b1f17b1804b1-43c601d888emr26835525e9.8.1741360585038;
        Fri, 07 Mar 2025 07:16:25 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb (host-89-240-117-139.as13285.net. [89.240.117.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c0195bfsm5574660f8f.48.2025.03.07.07.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 07:16:24 -0800 (PST)
Date: Fri, 7 Mar 2025 15:16:22 +0000
From: Juri Lelli <juri.lelli@redhat.com>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: linux-kernel@vger.kernel.org, cgroups@vger.kernel.org,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Waiman Long <longman@redhat.com>, Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Qais Yousef <qyousef@layalina.io>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Swapnil Sapkal <swapnil.sapkal@amd.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Phil Auld <pauld@redhat.com>, luca.abeni@santannapisa.it,
	tommaso.cucinotta@santannapisa.it,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH v2 0/8] Fix SCHED_DEADLINE bandwidth accounting during
 suspend
Message-ID: <Z8sNxll-9_VZptWB@jlelli-thinkpadt14gen4.remote.csb>
References: <20250306141016.268313-1-juri.lelli@redhat.com>
 <5cffdf8b-2670-4b46-9434-8024e18e4750@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5cffdf8b-2670-4b46-9434-8024e18e4750@nvidia.com>

Hi Jon,

On 07/03/25 11:40, Jon Hunter wrote:
> Hi Juri,
> 
> On 06/03/2025 14:10, Juri Lelli wrote:
> > Hello!
> > 
> > Jon reported [1] a suspend regression on a Tegra board configured to
> > boot with isolcpus and bisected it to commit 53916d5fd3c0
> > ("sched/deadline: Check bandwidth overflow earlier for hotplug").
> > 
> > Root cause analysis pointed out that we are currently failing to
> > correctly clear and restore bandwidth accounting on root domains after
> > changes that initiate from partition_sched_domains(), as it is the case
> > for suspend operations on that board.
> > 
> > This is v2 [2] of the proposed approach to fix the issue. With respect
> > to v1, the following implements the approach by:
> > 
> > - 01: filter out DEADLINE special tasks
> > - 02: preparatory wrappers to be able to grab sched_domains_mutex on
> >        UP (remove !SMP wrappers - Waiman)
> > - 03: generalize unique visiting of root domains so that we can
> >        re-use the mechanism elsewhere
> > - 04: the bulk of the approach, clean and rebuild after changes
> > - 05: clean up a now redundant call
> > - 06: remove partition_and_rebuild_sched_domains() (Waiman)
> > - 07: stop exposing partition_sched_domains_locked (Waiman)
> > 
> > Please test and review. The set is also available at
> 
> 
> Tested-by: Jon Hunter <jonathanh@nvidia.com>

Thanks!

Best,
Juri

