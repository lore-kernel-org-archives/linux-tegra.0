Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CDC723A9AB
	for <linux-tegra@vger.kernel.org>; Thu, 13 Feb 2025 14:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739458314; cv=none; b=c0AGGroKOTX/GkgHQBzBzWnhEPu5dfr5q/NYt6AbcrVXIyD7xoo4Yu1zoIHiCmlryeBUBCGaLIJWOVzNQ0UK7emWDMGIMtn2X8PyMVkyN56g03r0UUQiiNOS8KlRIQ81dXxfp7teXTGZiLHsFY3bzXtbSCPE7XNTUVOq+0Q6dss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739458314; c=relaxed/simple;
	bh=B1z2sR69wDiofUV84ZSOpgKNuRtWcJLfrcwnnKTulKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dvto5WGtq+aS5MF/0p6TkYdSJ+VX1Vio8OwmrJoHSqfRo9YKXvmZfbnBl2XcG2gB5fqvt7PMTkr2ZHj/Khja56JFIh4+G/2gxZCoKNnREgz1VrboGcdtZVHDOQK28bi59KpA+bbUObtFcnFlpgTav51SeybbAGHZNhPuOr05Cu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QQ4qa4LO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QQ4qa4LO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739458311;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6lhS8iVQB+96sJToCHUOQOlC5WCDphVwPzl2IuwUXiI=;
	b=QQ4qa4LOHdb7a4Z/wQh7+oQyOqdhoBTFL7jqSzIShYSW++0fPAbm4a25cpcyeMwiPHe1hD
	73bL+2L7w/3UrBYito6jqIzJhVgrdbdk56eBIOQqeZcZoFv5kw1ymrJTdX9SSAR9bGm7hf
	s/QSlIorDwdND5wyYl/pBvBPQ2YQO+4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-36-yVnvUU6BMdqHDiIUU7r0xA-1; Thu, 13 Feb 2025 09:51:50 -0500
X-MC-Unique: yVnvUU6BMdqHDiIUU7r0xA-1
X-Mimecast-MFC-AGG-ID: yVnvUU6BMdqHDiIUU7r0xA_1739458309
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4394b8bd4e1so7944485e9.0
        for <linux-tegra@vger.kernel.org>; Thu, 13 Feb 2025 06:51:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739458309; x=1740063109;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6lhS8iVQB+96sJToCHUOQOlC5WCDphVwPzl2IuwUXiI=;
        b=VWgo9fUmkHC2v5XNG6trKsdrvH32CIFkQyfLYevcC2lU0whPzg9kGUj1gJQOVwAjVL
         e0vEihyS5g9wQ+wfuNHj3uYxZnlCZ4EjEUbKXJEPLyAOdlacryUJXPonyktV38/TCXmL
         r9phr1Eyin9yIf4BFTAPWimuaGOyzSrec/76aBSbzYzvf5fwQd8nyDTe1mwsXAMI41s5
         DvX4V+SCesCPV1VnBU0X7ro9dbjSBBSqC+YgGGnF4Lywiexc5zRe752VOU3TViV4WTww
         VWFndt/HcJ0ROeQm5DZPdlDQ25wQPDSqYyEYy40HkzInxnhEXx/xOszmwWMvLwvqwCdH
         bnsA==
X-Forwarded-Encrypted: i=1; AJvYcCV1ZgJOgY2F0rYeSapMs5o3IUZdWclYNwRHgE5JXBXbuHJEAgeol7fDYYHGkuA68LEYfVDp3W22VLSqLw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWGIi6X0gK3R54c9fURhLKXcxYCtaAIPp1VlJuN7oVecMc7TcY
	qUUD2x48mrYVgAfRIYpdDDbTd9ffzNmOCykyE0EouzeyI8f8fBBMkPtlmYS6kgRnt0qzNUbUxwI
	26a2rKrU0kTmzNPSrjaYoZ1V15dRImnrnHjfEL8tH7dL7KEN3Si7cbO36JBzU
X-Gm-Gg: ASbGncsSdmXtR7yTt6wlme0IvCnrD5hqu26T6Ogp5lzyJz5mydDwoCa+cScojdCYEZ4
	ihbmpLivhKqHt3inkgQO/X6Cuzd4NmhVJlxFmlk+Yr/i+6dCcE1a3BAeHzFa7p8EebNJwDtrvut
	+NzDXPg9bP7t9wHY3d1HfTayob+Lm7sUI8LAkc0UqDa22OYgfH4KSwAAQ9BZcjZax6+H8Y1ONdz
	YUuO+rPsfsaEXEPGr6kq/osBRoAW2AfCVqE9BouErqmVgedSEKVR/93w7ogbJGCjYMZk81rjTbS
	TcvLD4CPUhpRgCOTVbzhnMlkZWuqNVHQsw==
X-Received: by 2002:a05:600c:6019:b0:439:608f:a37f with SMTP id 5b1f17b1804b1-439608fa43bmr42015675e9.5.1739458308842;
        Thu, 13 Feb 2025 06:51:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFAxIKUIaTswRoefZud2gAVQybC2383WLjWG+1WPkr5JTxOxoGMUsCV4ourXMPYfLZFnt8FrQ==
X-Received: by 2002:a05:600c:6019:b0:439:608f:a37f with SMTP id 5b1f17b1804b1-439608fa43bmr42015405e9.5.1739458308485;
        Thu, 13 Feb 2025 06:51:48 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.34.42])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a1aa7d2sm51597405e9.25.2025.02.13.06.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 06:51:47 -0800 (PST)
Date: Thu, 13 Feb 2025 15:51:45 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Christian Loehle <christian.loehle@arm.com>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>,
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
Message-ID: <Z64HAYoBpu5jUUcb@jlelli-thinkpadt14gen4.remote.csb>
References: <db800694-84f7-443c-979f-3097caaa1982@nvidia.com>
 <8ff19556-a656-4f11-a10c-6f9b92ec9cea@arm.com>
 <Z6oysfyRKM_eUHlj@jlelli-thinkpadt14gen4.remote.csb>
 <dbd2af63-e9ac-44c8-8bbf-84358e30bf0b@arm.com>
 <Z6spnwykg6YSXBX_@jlelli-thinkpadt14gen4.remote.csb>
 <285a43db-c36d-400e-8041-0566f089a482@arm.com>
 <Z62PPUOY5DClYo1A@jlelli-thinkpadt14gen4.remote.csb>
 <c8f626ba-1be4-4c25-b283-d1e11a061aac@arm.com>
 <Z630nGN1IHhyYIYl@jlelli-thinkpadt14gen4.remote.csb>
 <9629f060-28f4-4743-9e60-688cba039f87@arm.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9629f060-28f4-4743-9e60-688cba039f87@arm.com>

On 13/02/25 13:38, Christian Loehle wrote:
> On 2/13/25 13:33, Juri Lelli wrote:

...

> > Not sure I get what your worry is, sorry. In my understanding when the
> > last cpu of a policy/cluster gets offlined the corresponding sugov
> > kthread gets stopped as well (sugov_exit)?
> > 
> 
> The other way round.
> We may have sugov kthread of cluster [6,7] affined to CPU1. Is it
> guaranteed that we cannot offline CPU1 (while CPU6 or CPU7 are still
> online)?

Uhu, is this a sane/desired setup? Anyway, I would say that if CPU1 is
offlined sugov[6,7] will need to be migrated someplace else.

> Or without the affinity:
> cluster [6,7] with isolcpu=6 (i.e. sugov kthread of that cluster can
> only run on CPU7). Is offlining of CPU6 then prevented (as long as
> CPU7 is online)?
> I don't see how.
> Anyway we probably want to change isolcpu and affinity to merely be 
> a suggestion for the sugov DL case. Fundamentally it belongs to what
> is run on that CPU anyway.

I would tend to agree.

