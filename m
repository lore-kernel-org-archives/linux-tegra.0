Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBA721517A
	for <linux-tegra@vger.kernel.org>; Wed,  5 Feb 2025 06:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738738442; cv=none; b=Vls5KkF+0autEypiiO3hexx4lxfrx/QQTHu7u4yUTHFAd/h2O19z0WUqhLNXoW0wDvJSvJKh3nAXCmB+dQ3vbhgogbXvoWP+NFYpXXizwLp62vMOKO5BJcVATyVwG9KAgL0kXIYI0Ad+0u1UhnwQK+/AqwvJCzLsc/8voIKax18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738738442; c=relaxed/simple;
	bh=cWbO8HKmw8z2ZMTH0xbgQo1v4JbWKY6SdNB1Q44Twjg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M+Ftij29eshHkcwiUUoy2f2Ib7f2H9k1IL1PCcgsEqsKw4zo/AKNb1R65TVcmi1/AdbA7RMeGSNVYgQ4sTfOfAIA/mF5f2PmG9DV1BqpcB5Itka+li6wO9cnSom0QddpYjm4wb2fyGoC1mobDhG1u+gHUNZsPnLHA4reVxA9GnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RzY6xChu; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RzY6xChu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738738439;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ig+/O8/8C9meWS9i5E5x4FYET8uunPEIglzfgflUkxo=;
	b=RzY6xChuH6q/VV7dD4utLI0KXM2klkIElhFvQowXetRlDG3RklkHXAo493RFLl6wTh59yx
	m8+0mTG+hd6AdO66jOaZRtbTHluGz67MFCUp75usxf9OhddXEPDdshfcuSZ5yaXZMKRzI4
	RwqFKHrpUa6Zuid+UcAdZflr5/YvMb4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-218-MWFVKyXqO8K2KN9mSdvkdw-1; Wed, 05 Feb 2025 01:53:58 -0500
X-MC-Unique: MWFVKyXqO8K2KN9mSdvkdw-1
X-Mimecast-MFC-AGG-ID: MWFVKyXqO8K2KN9mSdvkdw
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-38db50e6bd3so152552f8f.1
        for <linux-tegra@vger.kernel.org>; Tue, 04 Feb 2025 22:53:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738738437; x=1739343237;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ig+/O8/8C9meWS9i5E5x4FYET8uunPEIglzfgflUkxo=;
        b=arbc10BUt5BYWKL8kpctiPAVj2mbRD9tYEphwjO4NEWhcykGsatPKJDc52ARaS9CBA
         PeGw4HBtmYygGLDk017cHvZslQopg8tSBtWg3su5ElA9/OkAeZNqaq+Az8xJzY89itfE
         5ePyHLKnMwor2ItCa8zNZGIXZNjYLeZcxCHk2sNqgViONiGc3Dkiwjv0ohpYliQ2Vjq0
         kP3h11JrsxBE3r3TH0IttkZyh5jP+dj0ECXonWPNsScr0O6GimLgoFL838z6N+Ml8jfd
         ESfsk8TRGvTgHCY+k65FsrkDexnVzXfZFsPQsmYsAyZ6UxSnZy8oTo6nGEnuYADg5+/8
         PQTw==
X-Forwarded-Encrypted: i=1; AJvYcCVwQodkvEe12wAgPsYeMJ4scH2hAVb2Pb+IFciCq27GAOSStgg/bKR+Gqq1q+g+23a4kdGXc2eF43IBFA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZpjQUbdhfUtm+9AHbTK0Kw2UlWcaOS3334HMcXORz4UCGEZ3W
	OXQIXjKv8yoz0nfVvZDsvPDCXsIEVqpiAbMbzdxWsX20Pl7bSyzD4ZfFQmwWyr3cyA48ymSqpQa
	/gVfjcUbhBdsZfdXgIh4KnHz4CoMKHjZ68Di5n4gnV7O6uzNh+t5lOhogcEWu
X-Gm-Gg: ASbGnctgnHMdcKj8KZ41G+X7vSneJiWzsjBkWaUbhBz9GQCuw76smZZuj5ugzbqPuTX
	686MW+5hrzM0yzCe0XYbx4akHSbgApuieAnDnjpmQrFNqL/xlRqfYFAYkzgv6WIQzqpWh2h/jJB
	Z8y6MNXOf70pxIykPfvUvTqBNYwh2sC11wRFukB6+bWVO8K9V6Ty43/alttRzgiQ97VUQpVhbFA
	IMzqIt4bws6ln2XtIPTcxHN4WbOJ1vw7ZZjE0R2A6GkeSqJAgSnCo/bbG/LXTkisS8FFvRFl3+p
	b4H4RUp0xTDw8TuLKWMu5iyS/AuakEnptgAf
X-Received: by 2002:a05:6000:184c:b0:38d:b7dc:30b8 with SMTP id ffacd0b85a97d-38db7dc3509mr21330f8f.18.1738738436798;
        Tue, 04 Feb 2025 22:53:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFGpckBtgHNmxTU7R59xIWWBoy3feR6+6IjsVYrKHmwkhizPVL0uHMyp9QXQa1ReNMzYO5Zcg==
X-Received: by 2002:a05:6000:184c:b0:38d:b7dc:30b8 with SMTP id ffacd0b85a97d-38db7dc3509mr21291f8f.18.1738738436348;
        Tue, 04 Feb 2025 22:53:56 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.128.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d96536asm11146655e9.18.2025.02.04.22.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 22:53:55 -0800 (PST)
Date: Wed, 5 Feb 2025 07:53:53 +0100
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
Message-ID: <Z6MLAX_TKowbmdS1@jlelli-thinkpadt14gen4.remote.csb>
References: <ba51a43f-796d-4b79-808a-b8185905638a@nvidia.com>
 <Z4FAhF5Nvx2N_Zu6@jlelli-thinkpadt14gen4.remote.csb>
 <5d7e5c02-00ee-4891-a8cf-09abe3e089e1@nvidia.com>
 <Z4TdofljoDdyq9Vb@jlelli-thinkpadt14gen4.remote.csb>
 <e9f527c0-4530-42ad-8cc9-cb04aa3d94b7@nvidia.com>
 <Z4ZuaeGssJ-9RQA2@jlelli-thinkpadt14gen4.remote.csb>
 <Z4fd_6M2vhSMSR0i@jlelli-thinkpadt14gen4.remote.csb>
 <aebb2c29-2224-4d14-94e0-7a495923b401@nvidia.com>
 <Z4kr7xq7tysrKGoR@jlelli-thinkpadt14gen4.remote.csb>
 <cfcea236-5b4c-4037-a6f5-267c4c04ad3c@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cfcea236-5b4c-4037-a6f5-267c4c04ad3c@nvidia.com>

On 03/02/25 11:01, Jon Hunter wrote:
> Hi Juri,
> 
> On 16/01/2025 15:55, Juri Lelli wrote:
> > On 16/01/25 13:14, Jon Hunter wrote:

...

> > > [  210.595431] dl_bw_manage: cpu=5 cap=3072 fair_server_bw=52428 total_bw=209712 dl_bw_cpus=4
> > > [  210.606269] dl_bw_manage: cpu=4 cap=2048 fair_server_bw=52428 total_bw=157284 dl_bw_cpus=3
> > > [  210.617281] dl_bw_manage: cpu=3 cap=1024 fair_server_bw=52428 total_bw=104856 dl_bw_cpus=2
> > > [  210.627205] dl_bw_manage: cpu=2 cap=1024 fair_server_bw=52428 total_bw=262140 dl_bw_cpus=2
> > > [  210.637752] dl_bw_manage: cpu=1 cap=0 fair_server_bw=52428 total_bw=262140 dl_bw_cpus=1
> >                                                                            ^
> > Different than before but still not what I expected. Looks like there
> > are conditions/path I currently cannot replicate on my setup, so more
> > thinking. Unfortunately I will be out traveling next week, so this
> > might required a bit of time.
> 
> 
> I see that this is now in the mainline and our board is still failing to
> suspend. Let me know if there is anything else you need me to test.

Ah, can you actually add 'sched_verbose' and to your kernel cmdline? It
should print our additional debug info on the console when domains get
reconfigured by hotplug/suspends, e.g.

 dl_bw_manage: cpu=3 cap=3072 fair_server_bw=52428 total_bw=209712 dl_bw_cpus=4
 CPU0 attaching NULL sched-domain.
 CPU3 attaching NULL sched-domain.
 CPU4 attaching NULL sched-domain.
 CPU5 attaching NULL sched-domain.
 CPU0 attaching sched-domain(s):
  domain-0: span=0,4-5 level=MC
   groups: 0:{ span=0 cap=766 }, 4:{ span=4 cap=908 }, 5:{ span=5 cap=989 }
 CPU4 attaching sched-domain(s):
  domain-0: span=0,4-5 level=MC
   groups: 4:{ span=4 cap=908 }, 5:{ span=5 cap=989 }, 0:{ span=0 cap=766 }
 CPU5 attaching sched-domain(s):
  domain-0: span=0,4-5 level=MC
   groups: 5:{ span=5 cap=989 }, 0:{ span=0 cap=766 }, 4:{ span=4 cap=908 }
 root domain span: 0,4-5
 rd 0,4-5: Checking EAS, CPUs do not have asymmetric capacities
 psci: CPU3 killed (polled 0 ms)

Can you please share this information as well if you are able to collect
it (while still running with my last proposed fix)?

Thanks!
Juri

