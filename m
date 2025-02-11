Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D0B1F4E30
	for <linux-tegra@vger.kernel.org>; Tue, 11 Feb 2025 10:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739270575; cv=none; b=ciHk8EEAJXcvF7M9SbyaY4/OUdg2/uyjZ0xdSO1Y7JcyaKjCGqljXxgjLsuSvi8FZt3vqsYa1RmNgaVtGUXZLu8mbJTlRPcjPrZPELyCe2D0ePM1Sq9+jb67nGmMAFaluxB0nqBG+vd8IgAoJwoVkNgwsidCmLLAN5rt/VUgKU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739270575; c=relaxed/simple;
	bh=E+sxrL1yANaEdJKT0z+BGlqsjvtvKEsGiY76jvUa0OE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ptYwKfWPMxyTfBsXpbKDmPyLnxdbLKyeayf+Bx8Cnu5XCtYue2tMehdxlZYwnbpozASUJ+k15UaPuvtcyBDto7ohqYTNHsGq66WZGTKQJ8qXBnw4AkRb02O1pBWtg5Jwqssh/ZZgAnnG8FaAllYRpylPuDwV3EIbdwF1bVwl2gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Z4f+qoev; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Z4f+qoev"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739270564;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tS4uDfWcuvYQmGwBRTPugY/bH8znvZA+Tt+Mk7Qa6b0=;
	b=Z4f+qoevn0ayyp/xF3ZTkGdR462bjVn+KQLSfwUF020MIZMwUwSwhvPdZfi3Hsqxa0FLIm
	XYDMcIxWI0/YQPJZYDPPdgFLp2UbViW8yUeo03vcPkqY6Rr0FPnZMn+tHIExfS8LdZACp8
	XPA+iRd1qRa5KrESnAWLlBwUfBvMcg0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-631-U3bxnvLeNB6Esldtk16OGg-1; Tue, 11 Feb 2025 05:42:43 -0500
X-MC-Unique: U3bxnvLeNB6Esldtk16OGg-1
X-Mimecast-MFC-AGG-ID: U3bxnvLeNB6Esldtk16OGg
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-38ddf370932so1101887f8f.0
        for <linux-tegra@vger.kernel.org>; Tue, 11 Feb 2025 02:42:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739270562; x=1739875362;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tS4uDfWcuvYQmGwBRTPugY/bH8znvZA+Tt+Mk7Qa6b0=;
        b=FeLoepkGr5q10CvGa9CqHBeGxcgTmfFgtKpEMvBkra6Obn7La3KM3U172yWy5C5GZr
         hlrDmoMbBXpmBLB8pYMVpemvebsy0tP0awmYN1LKnRBbi+8oJKI2QqOfzFB3Ypjt3JHO
         9YEC1QojFhQbX797HG7CvMBI2KrFub4CUSzpxqMpN0rXH6OzIY9yAE/UokW4rB1+GbZ7
         kSWxMoOa3kz8d6pfXtwQ/sbqIAPmRUslEyZsWogKgH/l1RmA0R/jh2O3Knbo8aC0S2Rn
         k3xnrnAaN1nGUftZ09PIEHdNNwCytugTCqt8TMO0akDR1EhOUo8ttTCznD+8uJ5pzHAj
         lH7w==
X-Forwarded-Encrypted: i=1; AJvYcCX9by2UpeI6DbrGsCzu9UqWdA6lBoIez7Z+bq8IusE6V5OnQqYPM1wcCI/5wfBAVgVKjYRTNLhSEyJGjA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYaggW9HvKhMsZNh4l5wqaYwsf2OX/He2jPnPaH8Z1ov2X59WF
	UycGE5uV38BfrTuXoNlL4MPU3ZYAHaeSRTLtEezSCNUU3iHvprZoXfz1HZDViOmxaN3UVQ4RV5u
	d96d61YiEpwUESIgQUGyF31/YO3pGZrHSG+4pJOJIRqXzQrTd8pIAkxG3bMQs
X-Gm-Gg: ASbGncu9wO9BvNjY6afNxeWjz3GirJV1WuGx9LW3ftXhH4AZrqfBpSSVvcv1eb71X5K
	wHZ7A9aGKkuzkUlQux8Gti/qE2DM305Mcx256qT6MIFP22EDe+sjUqaXGIb6BChK3pzFmS+iCYG
	sIMZ18MVOMvfWnRyckT/i/x8IhrAEU58XceTmCqD8eNIqX6Wsr/cCARP9rVhJVCGsTJZ9gMRQyD
	WWgiXbPE3fNAWLfkXFc9fAQOYLZSI9BCFGX9KWmMS8SlZ3eKgPd1BKXwFCv+GcoiXXP/9aw29ry
	6SRX2abeiVeSiOTFgCzpR06YsvCRxMw6oA==
X-Received: by 2002:a5d:64e4:0:b0:38d:d2ea:9579 with SMTP id ffacd0b85a97d-38dd2ea96fbmr10470503f8f.46.1739270562248;
        Tue, 11 Feb 2025 02:42:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE0oXoqkT03z4wD6sPrQ0LX9Ru2emhr5eBpgbRtVoEkFV4H0QONGEpLDzcnBm1oq86T69xrlw==
X-Received: by 2002:a5d:64e4:0:b0:38d:d2ea:9579 with SMTP id ffacd0b85a97d-38dd2ea96fbmr10470469f8f.46.1739270561863;
        Tue, 11 Feb 2025 02:42:41 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.34.42])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc5c8c37esm12705014f8f.2.2025.02.11.02.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 02:42:41 -0800 (PST)
Date: Tue, 11 Feb 2025 11:42:39 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Christian Loehle <christian.loehle@arm.com>
Cc: Jon Hunter <jonathanh@nvidia.com>,
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
Message-ID: <Z6spnwykg6YSXBX_@jlelli-thinkpadt14gen4.remote.csb>
References: <Z6MLAX_TKowbmdS1@jlelli-thinkpadt14gen4.remote.csb>
 <Z6M5fQB9P1_bDF7A@jlelli-thinkpadt14gen4.remote.csb>
 <8572b3bc-46ec-4180-ba55-aa6b9ab7502b@nvidia.com>
 <Z6SA-1Eyr1zDTZDZ@jlelli-thinkpadt14gen4.remote.csb>
 <a305f53d-44d4-4d7a-8909-6a63ec18a04b@nvidia.com>
 <5a36a2e8-bd78-4875-9b9e-814468ca6692@arm.com>
 <db800694-84f7-443c-979f-3097caaa1982@nvidia.com>
 <8ff19556-a656-4f11-a10c-6f9b92ec9cea@arm.com>
 <Z6oysfyRKM_eUHlj@jlelli-thinkpadt14gen4.remote.csb>
 <dbd2af63-e9ac-44c8-8bbf-84358e30bf0b@arm.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dbd2af63-e9ac-44c8-8bbf-84358e30bf0b@arm.com>

On 11/02/25 10:15, Christian Loehle wrote:
> On 2/10/25 17:09, Juri Lelli wrote:
> > Hi Christian,
> > 
> > Thanks for taking a look as well.
> > 
> > On 07/02/25 15:55, Christian Loehle wrote:
> >> On 2/7/25 14:04, Jon Hunter wrote:
> >>>
> >>>
> >>> On 07/02/2025 13:38, Dietmar Eggemann wrote:
> >>>> On 07/02/2025 11:38, Jon Hunter wrote:
> >>>>>
> >>>>> On 06/02/2025 09:29, Juri Lelli wrote:
> >>>>>> On 05/02/25 16:56, Jon Hunter wrote:
> >>>>>>
> >>>>>> ...
> >>>>>>
> >>>>>>> Thanks! That did make it easier :-)
> >>>>>>>
> >>>>>>> Here is what I see ...
> >>>>>>
> >>>>>> Thanks!
> >>>>>>
> >>>>>> Still different from what I can repro over here, so, unfortunately, I
> >>>>>> had to add additional debug printks. Pushed to the same branch/repo.
> >>>>>>
> >>>>>> Could I ask for another run with it? Please also share the complete
> >>>>>> dmesg from boot, as I would need to check debug output when CPUs are
> >>>>>> first onlined.
> >>>>
> >>>> So you have a system with 2 big and 4 LITTLE CPUs (Denver0 Denver1 A57_0
> >>>> A57_1 A57_2 A57_3) in one MC sched domain and (Denver1 and A57_0) are
> >>>> isol CPUs?
> >>>
> >>> I believe that 1-2 are the denvers (even thought they are listed as 0-1 in device-tree).
> >>
> >> Interesting, I have yet to reproduce this with equal capacities in isolcpus.
> >> Maybe I didn't try hard enough yet.
> >>
> >>>
> >>>> This should be easy to set up for me on my Juno-r0 [A53 A57 A57 A53 A53 A53]
> >>>
> >>> Yes I think it is similar to this.
> >>>
> >>> Thanks!
> >>> Jon
> >>>
> >>
> >> I could reproduce that on a different LLLLbb with isolcpus=3,4 (Lb) and
> >> the offlining order:
> >> echo 0 > /sys/devices/system/cpu/cpu5/online
> >> echo 0 > /sys/devices/system/cpu/cpu1/online
> >> echo 0 > /sys/devices/system/cpu/cpu3/online
> >> echo 0 > /sys/devices/system/cpu/cpu2/online
> >> echo 0 > /sys/devices/system/cpu/cpu4/online
> >>
> >> while the following offlining order succeeds:
> >> echo 0 > /sys/devices/system/cpu/cpu5/online
> >> echo 0 > /sys/devices/system/cpu/cpu4/online
> >> echo 0 > /sys/devices/system/cpu/cpu1/online
> >> echo 0 > /sys/devices/system/cpu/cpu2/online
> >> echo 0 > /sys/devices/system/cpu/cpu3/online
> >> (Both offline an isolcpus last, both have CPU0 online)
> >>
> >> The issue only triggers with sugov DL threads (I guess that's obvious, but
> >> just to mention it).
> > 
> > It wasn't obvious to me at first :). So thanks for confirming.
> > 
> >> I'll investigate some more later but wanted to share for now.
> > 
> > So, problem actually is that I am not yet sure what we should do with
> > sugovs' bandwidth wrt root domain accounting. W/o isolation it's all
> > good, as it gets accounted for correctly on the dynamic domains sugov
> > tasks can run on. But with isolation and sugov affected_cpus that cross
> > isolation domains (e.g., one BIG one little), we can get into troubles
> > not knowing if sugov contribution should fall on the DEF or DYN domain.
> > 
> > Hummm, need to think more about it.
> 
> That is indeed tricky.
> I would've found it super appealing to always just have sugov DL tasks activate
> on this_cpu and not have to worry about all this, but then you have contention
> amongst CPUs of a cluster and there are energy improvements from always
> having little cores handle all sugov DL tasks, even for the big CPUs,
> that's why I introduced
> commit 93940fbdc468 ("cpufreq/schedutil: Only bind threads if needed")
> but that really doesn't make this any easier.

What about we actually ignore them consistently? We already do that for
admission control, so maybe we can do that when rebuilding domains as
well (until we find maybe a better way to deal with them).

Does the following make any difference?

---
 kernel/sched/deadline.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index b254d878789d..8f7420e0c9d6 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -2995,7 +2995,7 @@ void dl_add_task_root_domain(struct task_struct *p)
 	struct dl_bw *dl_b;
 
 	raw_spin_lock_irqsave(&p->pi_lock, rf.flags);
-	if (!dl_task(p)) {
+	if (!dl_task(p) || dl_entity_is_special(&p->dl)) {
 		raw_spin_unlock_irqrestore(&p->pi_lock, rf.flags);
 		return;
 	}

