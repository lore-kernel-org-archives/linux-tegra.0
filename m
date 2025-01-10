Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EAF4211A18
	for <linux-tegra@vger.kernel.org>; Fri, 10 Jan 2025 15:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736523920; cv=none; b=gLvK8QVTo4nlXH+Fe9Y4XLBdC6SnwY+x/p82jzS6EeAhA1W7QiWUFnzLd/qPecrhPdbpkOtvcHKGoKHq7sfLd3cC+5LN7QWrOLvxxOMnWeoSLy3kOwq7pnr4Ri4M2ALacDPgjuNTSQNWTiCqaaiopB1MOU8aCGYOwLVBes07cGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736523920; c=relaxed/simple;
	bh=Cvzf6PuulWAVQx4MERWU4qNpmFpzckKnUbUUjm7tSuU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YITRFQ/f354Hj7CG/AbmYm7pM0irjtTA75Sb09aC3MpKjAEuqBeedip+jx3E8/EBX22RXWvNoLRZHhE3DribafNvIWs+QnOrePOGIQv2gZf1RthozOv2e0IXqjeAb1gbd1Vs8GRecJsMyeQu2pG/KQAzKAj0GdFTff/c1Ml+WIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hrcIVFT0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hrcIVFT0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736523917;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5z9OBzc9iSRfWm9qMeZ19ILH/+scSAfJCQBDndG0wl8=;
	b=hrcIVFT0iVOZuWFejCNz8DHlEp0WkLgCSZwzHTCQ84cyabaw3dVgYDROwOAotYP5toj0Oo
	6l5JZePK1oTQad9JrwK46FK5t/G+io0dcE2LjZmRhAu9JcE8LcfnEYeNLRuipwBbYFXSkR
	TKY7giHPvJv/gQIrYuu6hlLBQj10+bo=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-262-6AQn_ofTNO-ps038xvvb-w-1; Fri, 10 Jan 2025 10:45:16 -0500
X-MC-Unique: 6AQn_ofTNO-ps038xvvb-w-1
X-Mimecast-MFC-AGG-ID: 6AQn_ofTNO-ps038xvvb-w
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7b6faab8334so366566085a.2
        for <linux-tegra@vger.kernel.org>; Fri, 10 Jan 2025 07:45:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736523915; x=1737128715;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5z9OBzc9iSRfWm9qMeZ19ILH/+scSAfJCQBDndG0wl8=;
        b=MY8o9f1eu8bAvsr2IVTXGpmun7pvq3BIofklhBFPlkh/584EO9mndKXCokBjNA9ZpE
         pEiLMsjM3fP7daUyWosc4PSJadEBcuu5SO1gI0V9uGXPwk5kT9FkdnQde8/Psa+2XJpN
         0VXPik3lFhHV0Tx3i31ZdXZqIh+0lOmAnPnKdLft/Tdg++bZjPhirrbEJHQKg8oE0cRx
         0STknZ/T7JdNlpQVcrIN7JNEblVlpZkD9ajnteAdm+m88GCtTDKbiP5ICyfOmJS6UU5x
         bRmU0jGSJz36MDgYKHU18Z2U16HL2p41RuSuPKPUqdkEsDkOD4bGaxPPis/iGRGIBWOV
         O8MQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNXeEgLNKHKeUHNsNzjx0s76twOam45K9lle/7trNrkcKifRl4MZczvFtQxVdXBfAH1WFwptYzOkaJHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKUvbluJAhSxXr5kxih2mgAM3tqStqgRx/YqZPBIYbc50HY2Jh
	apMbZUq8cG1koBcKU6qRKpnKqVtXBM1odVFCk2AiWLvLtQW6e3bYXA6eMaSFnIlzI9PXhRFH4or
	jwKqVNjW9EfBNnMlY5UwmZV6rTQqXCY8b4JuAWKFCk0xl9ZBCnlyRMyo1FMoY
X-Gm-Gg: ASbGncuj5HHmcRvonFr38VyXqr3r3KMAlnU5sjdAXFHyQFX7piuYVez2Si24/3ZJy3u
	DHwsz/IHEhSBB9dSRvOdtJOGQ/payuGZ2QtpporGbU+5RJQqX5ADWRFm2hd09aSbEk32YkIy1BS
	Fac0g913Qp90BwWLcyvDVg6tFWIwXqpm8YUmxn6ZvV5lEePzqZuZ3hAEdoYaIeaMYGoN1QtdLjb
	nOx8B14+a+NJ0FQZrrOntwuHBpShvnPoz++0EgiIzNcGzJUdV0xMv89IxsvTXTEsE0werT8QpmB
	PJ/9Kr2h8A==
X-Received: by 2002:a05:620a:7207:b0:7bc:db11:4951 with SMTP id af79cd13be357-7bcdb114dd5mr1416503885a.48.1736523915526;
        Fri, 10 Jan 2025 07:45:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHPzD8fYBKzXAbtv3fhWySvLFCusA2JljqcdQCmxxJLeMLNNBsjLqbbmB0FFit/UgirxU5aDg==
X-Received: by 2002:a05:620a:7207:b0:7bc:db11:4951 with SMTP id af79cd13be357-7bcdb114dd5mr1416499885a.48.1736523915202;
        Fri, 10 Jan 2025 07:45:15 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.92.51])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7bce324828esm183203985a.45.2025.01.10.07.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 07:45:14 -0800 (PST)
Date: Fri, 10 Jan 2025 16:45:08 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Waiman Long <longman@redhat.com>, Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
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
Message-ID: <Z4FAhF5Nvx2N_Zu6@jlelli-thinkpadt14gen4.remote.csb>
References: <20241114142810.794657-1-juri.lelli@redhat.com>
 <ZzYhyOQh3OAsrPo9@jlelli-thinkpadt14gen4.remote.csb>
 <Zzc1DfPhbvqDDIJR@jlelli-thinkpadt14gen4.remote.csb>
 <ba51a43f-796d-4b79-808a-b8185905638a@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ba51a43f-796d-4b79-808a-b8185905638a@nvidia.com>

Hi Jon,

On 10/01/25 11:52, Jon Hunter wrote:
> Hi Juri,
> 

...

> I have noticed a suspend regression on one of our Tegra boards and bisect is
> pointing to this commit. If I revert this on top of -next then I don't see
> the issue.
> 
> The only messages I see when suspend fails are ...
> 
> [   53.905976] Error taking CPU1 down: -16
> [   53.909887] Non-boot CPUs are not disabled
> 
> So far this is only happening on Tegra186 (ARM64). Let me know if you have
> any thoughts.

Are you running any DEADLINE task in your configuration?

In any case, could you please repro with the following (as a start)?
It should print additional debugging info on the console.

Thanks!
Juri

---
 kernel/sched/deadline.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index 62192ac79c30..77736bab1992 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -3530,6 +3530,7 @@ static int dl_bw_manage(enum dl_bw_request req, int cpu, u64 dl_bw)
 		 * dl_servers we can discount, as tasks will be moved out the
 		 * offlined CPUs anyway.
 		 */
+		printk_deferred("%s: cpu=%d cap=%lu fair_server_bw=%llu total_bw=%llu dl_bw_cpus=%d\n", __func__, cpu, cap, fair_server_bw, dl_b->total_bw, dl_bw_cpus(cpu));
 		if (dl_b->total_bw - fair_server_bw > 0) {
 			/*
 			 * Leaving at least one CPU for DEADLINE tasks seems a

