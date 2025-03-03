Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E4A12D758
	for <linux-tegra@vger.kernel.org>; Mon,  3 Mar 2025 16:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741017615; cv=none; b=gwsikwkn/AHUho1CnPDPEFx0l3p3a1HgMo7prerJaJWjdmgwduwp3cBswZFquY/KHAaayiTnuAGQ9yG+jnaLyowbq9gPiEPLSzljzy7g9H7tYLgajqm8GvSwUmRVgCV9asALd9K0dsks0GqDwX5u0KriEZTsPjG+amUXPG1yMCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741017615; c=relaxed/simple;
	bh=jFOF7k8K0bUwNF3eRcNy8u9EGvWjbUR67H+Rn8NM2ok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LhFo9DReIr0u7b34VGda4qzMl7UYRJy0h1kLgFYuxCKCGAzyrP6CDA1Hs9Ankl26jL3cxE9dqeVsghoVGHsm1PWjDHgae+XPWW2bXMw7HbdxQYxMZdHihkWDY4uiguJTFqSWn1deqzBHkD3EIJjvA1J/10eotJ6CVMJnYWY/zGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PTUaTksp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PTUaTksp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741017612;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DeMgwkEfJ4wko22XhtG7puIWAiqthft7+Cg2qc+WP50=;
	b=PTUaTksptWQtWv/X/3LpwolpEEwo/8LGF7gw+kPl+ZaPr9LMYjjntAncWHPhzwgOj+OJHN
	RtiiYVu4mBq2SoW8ogkiHsp6QZUC9/CO3lz4LN5SAnkeHg6oP/76kbReR3HUJITN6DEMkS
	dq4DhXvmu3gHocH9Nt3wNJx55P6BmJo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-590-S_BSJDIPNc2Mi0SAKxKGOg-1; Mon, 03 Mar 2025 11:00:11 -0500
X-MC-Unique: S_BSJDIPNc2Mi0SAKxKGOg-1
X-Mimecast-MFC-AGG-ID: S_BSJDIPNc2Mi0SAKxKGOg_1741017610
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43bca561111so730995e9.3
        for <linux-tegra@vger.kernel.org>; Mon, 03 Mar 2025 08:00:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741017610; x=1741622410;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DeMgwkEfJ4wko22XhtG7puIWAiqthft7+Cg2qc+WP50=;
        b=glkrWruVHMxJ6PuOqbXoVkn6tKTq5lb229ebZIpSZB32r2xo5bjUvgl/EceRsTTqLw
         0xAAOgRI0uy8+bCOLX5h6bKRQFB/Nrxh9raUc8VeWuyX7jmhMdAhA6iQSWkBIKz1+AB8
         o876rqa3bNPMxbIHOMiCe7dMdWTcCCaX1dz1DPzMIk5L+Kna5P6nCkPIdkCAJaWpNsVv
         6vQbFAx4Kc/eaD6GpIsGyENbLwWbmBh94qD8NKuBQfpuizH1CMBa8ztIxbEBo3TCNhNb
         DxxP4s7RlBNfm5XKHHjvcqbeDPReLsvkbr6GRVdJqlJ4a+he2uboZGlqFkOQijcjBi/3
         RJiw==
X-Forwarded-Encrypted: i=1; AJvYcCVPbatQvVF33z+5DD7I41JdQWknAZV/fuvSZZL/0SQ/s7aMwwGw6Ia1xD5u/G8UcukDmg+rQyIl5TMEEw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyTS0vtQ39eAP1gJF59ZLyigh8UkYvy9WCb024ZKxNf47qT5hhL
	CGx8Jt2E9FtwWo2BUm0T3wUPZxSzJeWWs4WX1iNVOiv3zaB59V1ytR8WK8bfLf97xkAxxuDjHSw
	GCcZSqDFqVvWewrF0WK1HcopTAXKvXdg0TdKd0AE3qX5a5P1q6HzhrwmPNtth
X-Gm-Gg: ASbGncuX3qMK3w6ElqwlV8v9vnLkYujL5BiY6BiKYwZxNhrSkJflugcxwC+nGIbW2ri
	9SjZTv7iT4wyyj0HpuLNaiU+9GERCOBGwQuxBcc6EX6Fs+nWxt1YMv1otv45P757zgm+354RsJc
	9kqfwjs+Xo8fzkrG6AFYWGZN7DCxRSa6XM6II04mzImLhrSsLgKJdg3TzQR9F99CFD8uI4m5QrW
	80gQRgL5zHBa6uobR/mFaiFetIjQNhKk3kKrTxGtdFrIad8aA4wD2GJ8bvONTWAe2SNYX+ZmkyM
	pgXD3Pd/6iHn/8W4YOYM/hcEBINpX2CsOAkr5xIfXtMDXTACwpY8I8CPqRZg4UGgjOhGymm4UL8
	pyzt1
X-Received: by 2002:a05:600c:1548:b0:439:685e:d4c8 with SMTP id 5b1f17b1804b1-43ba66fec18mr128239745e9.15.1741017609764;
        Mon, 03 Mar 2025 08:00:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGcAeVlV0x3Lsv/XUbSYCaDoG4BHyq8Ft0JsRryYoUoofcmIq5h1yB/qI8Y+i3wzQ2M9xQFVA==
X-Received: by 2002:a05:600c:1548:b0:439:685e:d4c8 with SMTP id 5b1f17b1804b1-43ba66fec18mr128239335e9.15.1741017609386;
        Mon, 03 Mar 2025 08:00:09 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb (host-89-240-117-139.as13285.net. [89.240.117.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba58713bsm200147315e9.34.2025.03.03.08.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 08:00:08 -0800 (PST)
Date: Mon, 3 Mar 2025 16:00:06 +0000
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
Message-ID: <Z8XSBrCNjPVRJszF@jlelli-thinkpadt14gen4.remote.csb>
References: <537f2207-b46b-4a5e-884c-d6b42f56cb02@arm.com>
 <Z7cGrlXp97y_OOfY@jlelli-thinkpadt14gen4.remote.csb>
 <Z7dJe7XfG0e6ECwr@jlelli-thinkpadt14gen4.remote.csb>
 <1c75682e-a720-4bd0-8bcc-5443b598457f@nvidia.com>
 <d5162d16-e9fd-408f-9bc5-68748e4b1f87@arm.com>
 <9db07657-0d87-43fc-a927-702ae7fd14c7@arm.com>
 <Z7x8Jnb4eMrnlOa8@jlelli-thinkpadt14gen4.remote.csb>
 <4aa1de5c-4817-4117-b944-4b4c8f09ac40@nvidia.com>
 <Z72R5-I91l5FOJK6@jlelli-thinkpadt14gen4.remote.csb>
 <bd9eb72e-5c67-44a7-ba79-1557eaa319e6@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bd9eb72e-5c67-44a7-ba79-1557eaa319e6@nvidia.com>

Hi Jon,

On 03/03/25 14:17, Jon Hunter wrote:
> Hi Juri,
> 
> On 25/02/2025 09:48, Juri Lelli wrote:
> > Hi Jon,
> > 
> > On 24/02/25 23:39, Jon Hunter wrote:
> > > Hi Juri,
> > > 
> > > On 24/02/2025 14:03, Juri Lelli wrote:
> > > > On 24/02/25 14:53, Dietmar Eggemann wrote:
> > 
> > ...
> > 
> > > > > So DL accounting in partition_and_rebuild_sched_domains() and
> > > > > partition_sched_domains()!
> > > > 
> > > > Yeah that's the gist of it. Wait for domains to be stable and recompute
> > > > everything.
> > > > 
> > > > Thanks for testing. Let's see if Jon can also report good news.
> > > 
> > > 
> > > Sorry for the delay. Yes this is working for me too! If you have an official
> > > patch to fix this, then I can give it a test on my side.
> > 
> > Good! Thanks for testing and confirming it works for you now.
> > 
> > I will be cleaning up the changes and send them out separately.
> 
> 
> I just wanted to see if you have posted anything yet? I was not sure if I
> missed it.

You didn't miss anything. I cleaned up and refreshed the set and I am
currently waiting for bots to tell me if it's good to be posted. Should
be able to send it out in the next few days (of course you will be cc-ed
:).

Thanks,
Juri

