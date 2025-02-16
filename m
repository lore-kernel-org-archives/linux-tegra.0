Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A6018DB21
	for <linux-tegra@vger.kernel.org>; Sun, 16 Feb 2025 16:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739723626; cv=none; b=I5jfIV3qXPmcnvtoqdj2L3RZjIXByeXtf34Drm9brgPbtF0fY9pmQ78IC2+KtH+9a22SEyZHqaaSo26PTm3se0d3LoE3dHWjLOCISCpm41jP7Az86gJUQkeAKeH1RSoCa3DrnYlyt7C4OUvMxe1KEeIXDoAZCr494EzVALwDDXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739723626; c=relaxed/simple;
	bh=BICul6GUdFbuU5tzJRFrpq8T0hra/dZQaGyO/rn8I6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RKsCJK0ks+lpbQKaOil7JIR5Q/6JaUXvzMEK94ZbYAomLIES7ai/Xv0xc7rhi+cQT9dhEL7hMoNXC1QMtKCq1XTXFrYSOBuhozVD3BfWTXuCxb5A5S7QMzDYjO7uTa657KRSeCHzkVT2GdBRxAxDq3cnxzL6ahbB92y5ym9G4k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io; spf=pass smtp.mailfrom=layalina.io; dkim=pass (2048-bit key) header.d=layalina-io.20230601.gappssmtp.com header.i=@layalina-io.20230601.gappssmtp.com header.b=hQe5evxT; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=layalina.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=layalina-io.20230601.gappssmtp.com header.i=@layalina-io.20230601.gappssmtp.com header.b="hQe5evxT"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-438a39e659cso24465315e9.2
        for <linux-tegra@vger.kernel.org>; Sun, 16 Feb 2025 08:33:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=layalina-io.20230601.gappssmtp.com; s=20230601; t=1739723623; x=1740328423; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lUMfqS3dZBd43tbBbndbhZ/u2f+U8HCOLG9lUIdc1Xk=;
        b=hQe5evxT+0D7PSbChtzPQKbTiyUIiiu7l2aK66kgJeYjF374OOaElthMytJrcyagA5
         WwQBI+JNBdPAyWfOh6eVB5grz1sPeiBNgMbT8XDOlzYhhwSUcTnxlg4WDoF+Zxf0PDGL
         oVha5iJpYwO8zKx/C0P+BokFcqleYmYITWPcQCPbCuEaWNurgvvJBngdlVgF+IYwugYg
         w4GYjSl0nKNNuYHbsEy8AzyR3FjCJ3PRsCA7eXAGXsiCFiWAp+BuE9/1C/InSTA4wPfR
         elniRGqo2vJGpiYK+KbGy3Xwyf2kI0Mefw8XiJZ5wFT5ZQ00cezj1v331aWRLYS4ccNH
         rzgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739723623; x=1740328423;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lUMfqS3dZBd43tbBbndbhZ/u2f+U8HCOLG9lUIdc1Xk=;
        b=e3sHaFNjjWzKHgYVsu9StzoCJlShpoyMC8pJoT6aupkeCjmlnpicO23qhdK5SGsFO5
         Jhx7W/6R5SmtCgCh7cBNN6TatHmBddhvVTlg2lH8005W+mLw/yzazOXGib2S0qq0Z6Yt
         JSPUWnlcF2sjtwWa/SI4bQlhj8ggpInlfW6gvOs5XdtRP9vj3/MivnfGiNE5Coeo8ik3
         0HJuR7U8ukGASDFqMaNh2+i82ex23HgYGM+eh4bLWHCH/9eOx/c8q5afUU0MRRJXLRpY
         PhiLlFO0edq3DCNZboSVREkM2FfyUGwvasULT06nKZuCoF6I2x4okg3euRCkiTWatifp
         Ksqw==
X-Forwarded-Encrypted: i=1; AJvYcCXykhny2ErG5NKWPx1SWTxRKSM3SQFm7sgO5G8/bbiAURLQgakxSHxRlqqA2xx1BN/lTx8G0gNhs060oQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu4g5FHv8X9gqRdA+YWtcEtIWx86Vtx1j05SHgpeVR28Fg7atC
	wIfFZVoEOTkg9nR1uqJCD1cMkkah/uTw2uEcyM2xP+WFu+nrTX5Git6ZdghKsj4=
X-Gm-Gg: ASbGncv5VptVXc/2O5L7xmc9VjFpbUJ2g4ZKDGN2Lptfkkf8mUkNTPl3xj9fyx+7hO7
	uihEyjKIbChOvYj1VMxNgBxJUPmPTszT7PIQmnbhftpmcp/quWsWCXO5uHFPyxWYsWq4KXJw1Uf
	q7meYWx/glbYZEi/fB/EppDpwYOnholIIF+cEjuwn2tjC+6HVo215BwRjbahATJaYG0GE7gQALE
	g+q6EVQlomh14kSvSO0EPUoXfeI0TI3Zgv3Y1DBfk/IrCW7pYfEsjDwjSfkjvpJE4ZAUsQkcdMA
	2aeP9Q4ATJHFMo3KAMyuqx1rcpLli7hSnZ1LItlY8575kIbqjL3VQBe0Sh/K4TnP1A7r
X-Google-Smtp-Source: AGHT+IEeNlCzVzCebfog7rtjgazJvr3JIatphpj/eDAtE93/JEe47lhOf70TFBDtpeDDgQbB0eiCOg==
X-Received: by 2002:a05:600c:3c9d:b0:439:5a37:8157 with SMTP id 5b1f17b1804b1-4396e7674c6mr66151195e9.30.1739723622005;
        Sun, 16 Feb 2025 08:33:42 -0800 (PST)
Received: from airbuntu (host109-154-33-115.range109-154.btcentralplus.com. [109.154.33.115])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d8dd6sm10107550f8f.62.2025.02.16.08.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 08:33:41 -0800 (PST)
Date: Sun, 16 Feb 2025 16:33:40 +0000
From: Qais Yousef <qyousef@layalina.io>
To: Juri Lelli <juri.lelli@redhat.com>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Christian Loehle <christian.loehle@arm.com>,
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
	Phil Auld <pauld@redhat.com>,
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
Message-ID: <20250216163340.ttwddti5pzuynsj5@airbuntu>
References: <Z6SA-1Eyr1zDTZDZ@jlelli-thinkpadt14gen4.remote.csb>
 <a305f53d-44d4-4d7a-8909-6a63ec18a04b@nvidia.com>
 <5a36a2e8-bd78-4875-9b9e-814468ca6692@arm.com>
 <db800694-84f7-443c-979f-3097caaa1982@nvidia.com>
 <8ff19556-a656-4f11-a10c-6f9b92ec9cea@arm.com>
 <Z6oysfyRKM_eUHlj@jlelli-thinkpadt14gen4.remote.csb>
 <dbd2af63-e9ac-44c8-8bbf-84358e30bf0b@arm.com>
 <Z6spnwykg6YSXBX_@jlelli-thinkpadt14gen4.remote.csb>
 <285a43db-c36d-400e-8041-0566f089a482@arm.com>
 <Z62PPUOY5DClYo1A@jlelli-thinkpadt14gen4.remote.csb>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Z62PPUOY5DClYo1A@jlelli-thinkpadt14gen4.remote.csb>

On 02/13/25 07:20, Juri Lelli wrote:
> On 12/02/25 19:22, Dietmar Eggemann wrote:
> > On 11/02/2025 11:42, Juri Lelli wrote:
> 
> ...
> 
> > > What about we actually ignore them consistently? We already do that for
> > > admission control, so maybe we can do that when rebuilding domains as
> > > well (until we find maybe a better way to deal with them).
> > > 
> > > Does the following make any difference?
> > 
> > It at least seems to solve the issue. And like you mentioned on irc, we
> > don't know the bw req of sugov anyway.
> > 
> > So with this change we start with 'dl_bw->total_bw = 0' even w/ sugov tasks.
> > 
> > dl_rq[0]:
> >   .dl_nr_running                 : 0
> >   .dl_bw->bw                     : 996147
> >   .dl_bw->total_bw               : 0       <-- !
> > 
> > IMHO, people who want to run serious DL can always check whether there
> > are already these infrastructural DL tasks or even avoid schedutil.
> 
> It definitely not ideal and admittedly gross, but not worse than what we
> are doing already considering we ignore sugovs at AC and the current
> bandwidth allocation its there only to help with PI. So, duck tape. :/
> 
> A more proper way to work with this would entail coming up with sensible
> bandwidth allocation for sugovs, but that's most probably hardware
> specific, so I am not sure how we can make that general enough.

I haven't been following the problem closely, but one thing I was considering
and I don't know if it makes sense to you and could help with this problem too.
Shall we lump sugov with stopper class or create a new sched_class (seems
unnecessary, I think stopper should do)? With the consolidate cpufreq update
patch I've been working on Vincent raised issues with potential new ctx switch
and to improve that I needed to look at improving sugov wakeup path. If we
decouple it from DL I think that might fix your problem here and could allow us
to special case it for other problems like the ones I faced more easily without
missing up with DL.

Has the time come to consider retire the simple solution of making sugov a fake
DL task?

> 
> Anyway, looks like Jon was still seeing the issue. I asked him to verify
> he is using all the proposed changes. Let's see what he reports.
> 
> Best,
> Juri
> 
