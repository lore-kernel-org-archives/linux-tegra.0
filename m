Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121441DB546
	for <linux-tegra@vger.kernel.org>; Wed, 19 Feb 2025 10:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739959375; cv=none; b=VUVtL5Jwkqw2Zk9yMP79Yx4waZQv4UblNk15ViYhaIsyGvcmH3pzJboHLi8HR22jumWC5QtbndT7SBOEZQ5MYCSgq/QiUEM7PlRWpFtrMsjGtzuyFU3WCOJC4/l0m2CKv/5hw4JihO0Kedof6gpX12/JYuBSJKfjRX1Kza+wRXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739959375; c=relaxed/simple;
	bh=pG3ehQ8ELvoaHuUfcRGNZ+bIa/1pT9JXhzOPZ5ksmPU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JR9Rq6E/CBKnqpsYMCEbYKLiC65Sfic8zagl4iO0GEnaEq/QgCB/Tyvnh9d5cKpj31DRCmzj0Ms7Gj9tBecJ7+0LpetDzRwchX5Xqzl+mlbBYwQqZGZ+bprX1Eto/B3MUridd22FMYFJRJCQp9kfBpPy7NPqifRkUF7DBnAeIpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XKtWicPO; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XKtWicPO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739959372;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=H6zefS7lKlcewOYQ7mQ6LJ7/0/Vzj6dzTA0TGrsliN8=;
	b=XKtWicPO7NGFaC4+0DdUuYF/1Ga0f9O/beTDmS4TieQpjh74pdxaqKblJr3Wv2QpNrc97V
	8lqe/pxBoS5JM8OP3nvtOll4OVVX1qnDQTfhXFJBIE/AwnIEdCfEHySKXuOa9a29eLzVnW
	8F6WgoKd58ozBz9AFl2N1hoM1hX2oU4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-447-LgZffgpXPvOS6CX221TUVw-1; Wed, 19 Feb 2025 05:02:51 -0500
X-MC-Unique: LgZffgpXPvOS6CX221TUVw-1
X-Mimecast-MFC-AGG-ID: LgZffgpXPvOS6CX221TUVw_1739959370
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43942e82719so54289655e9.2
        for <linux-tegra@vger.kernel.org>; Wed, 19 Feb 2025 02:02:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739959370; x=1740564170;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H6zefS7lKlcewOYQ7mQ6LJ7/0/Vzj6dzTA0TGrsliN8=;
        b=ZcLIgodyQ7tUAJ+tnNEeO1kRTHCvtZLtzqSnw1VliYliaqMDqVoeUOxuUMSZwVWfzC
         YLOhwwvh/3EX8ty39g92Ta2/Q+zWoCPpYV3Sp8lD+2EkjwkkQD1SnBeBNM26kEsZqIe5
         4am450aP+oqj9XzF20N/yRDVDGlaKTVK9VyUo87n8vpzQ+3Cqx1vh+g3sHs6ZflHdbEl
         3F97zKi9Wn9Y3ARn0qgFX1Wb1h+dLa/BsJyhuk+Ypk5U7cegemqudInmb8ouk3pmwCAs
         4MzaLV53vnfU62opf4Ivnh7QRo1750gKrGyi9cj9TpogNEWQWV1Q5+FRJll0wcZW45YJ
         WA+w==
X-Forwarded-Encrypted: i=1; AJvYcCV+kpBudcG0h0uXTn++IOyAB5yGfH76Yiu2vok0r9jM6nC8O5RDg12PQnxfIBRm5B3IlqXl6kTcHhW/vA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNpD4qdZ5sK2vGeIXNjbVU4onEzyxJ0M1zoZw5aTwowLdRkiiG
	dN085lmCOKhDeELgO8w+kkD8U7PSCzDEhtku/45whJP7u34VYULE/OIHsX3eaiCZOnWOxg8yXVH
	oAa7SFGAv9ocdqmniF9IW9M0y3YgoZqdQzhjqvXdR9gZS5G5ayQoDCrzC/vkj
X-Gm-Gg: ASbGnctLNZyMhsLYRrGo1Ln5fm3zBY1zxBWJbapY4nToZJ/rF2o++wYvXNtMSfsTz2z
	5QzaxxQn3U2XQeWfW2UeZVrX0x5CnhqPZigEauYjVAalk2aOvvW2PQuOJ9zwYG9r93WrKZCdT3U
	h0BricEUKmcaPoQhdU/PWZVrqKaXuuzJrSX1j9HzU4R3hST96Jl0XLdECcm6hWxHRGS0KyYO3W+
	ZkuR5Zc24NXdy3TZNdApk7WI87hwlMj/RNg7kKuOfNrg1CoZzjYaSuk4GpqA+qttnAFh+C0sL9/
	A6MCZao6Cl95FHttt3M7MYZtVAo9B3tbLw==
X-Received: by 2002:a5d:6a0e:0:b0:38d:e190:b713 with SMTP id ffacd0b85a97d-38f587ca520mr2058214f8f.37.1739959370117;
        Wed, 19 Feb 2025 02:02:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF3CX/A5GZaT4XTXRfc/4HEl7SxwEen11NbYXLZ9oXbaY+XlUUSf56BBdLr7G7NBNgkHckUng==
X-Received: by 2002:a5d:6a0e:0:b0:38d:e190:b713 with SMTP id ffacd0b85a97d-38f587ca520mr2058177f8f.37.1739959369680;
        Wed, 19 Feb 2025 02:02:49 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.34.42])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439872b59e9sm76030525e9.31.2025.02.19.02.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 02:02:48 -0800 (PST)
Date: Wed, 19 Feb 2025 11:02:46 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: Jon Hunter <jonathanh@nvidia.com>,
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
Message-ID: <Z7WsRvsVCWu_By1c@jlelli-thinkpadt14gen4.remote.csb>
References: <Z6spnwykg6YSXBX_@jlelli-thinkpadt14gen4.remote.csb>
 <78f627fe-dd1e-4816-bbf3-58137fdceda6@nvidia.com>
 <Z62ONLX4OLisCLKw@jlelli-thinkpadt14gen4.remote.csb>
 <30a8cda5-0fd0-4e47-bafe-5deefc561f0c@nvidia.com>
 <151884eb-ad6d-458e-a325-92cbe5b8b33f@nvidia.com>
 <Z7Ne49MSXS2I06jW@jlelli-thinkpadt14gen4.remote.csb>
 <Z7RZ4141H-FnoQPW@jlelli-thinkpadt14gen4.remote.csb>
 <d7cc3a3c-155e-4872-a426-cbd239d79cac@arm.com>
 <Z7SWvr86RXlBbJlw@jlelli-thinkpadt14gen4.remote.csb>
 <a0f03e3e-bced-4be7-8589-1e65042b39aa@arm.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a0f03e3e-bced-4be7-8589-1e65042b39aa@arm.com>

On 19/02/25 10:29, Dietmar Eggemann wrote:

...

> I did now. 

Thanks!

> Patch-wise I have:
> 
> (1) Putting 'fair_server's __dl_server_[de|at]tach_root() under if  
>     '(cpumask_test_cpu(rq->cpu, [old_rd->online|cpu_active_mask))' in 
>     rq_attach_root()
> 
>     https://lkml.kernel.org/r/Z7RhNmLpOb7SLImW@jlelli-thinkpadt14gen4.remote.csb
> 
> (2) Create __dl_server_detach_root() and call it in rq_attach_root()
> 
>     https://lkml.kernel.org/r/Z4fd_6M2vhSMSR0i@jlelli-thinkpadt14gen4.remote.csb
> 
> plus debug patch:
> 
>     https://lkml.kernel.org/r/Z6M5fQB9P1_bDF7A@jlelli-thinkpadt14gen4.remote.csb
> 
> plus additional debug.

So you don't have the one with which we ignore special tasks while
rebuilding domains?

https://lore.kernel.org/all/Z6spnwykg6YSXBX_@jlelli-thinkpadt14gen4.remote.csb/

Could you please double check again against

git@github.com:jlelli/linux.git experimental/dl-debug

> The suspend issue still persists.
> 
> My hunch is that it's rather an issue with having 0 CPUs left in DEF
> while deactivating the last isol CPU (CPU3) so we set overflow = 1 w/o
> calling __dl_overflow(). We want to account fair_server_bw=52428
> against 0 CPUs. 
> 
> l B B l l l
> 
>       ^^^
>       isolcpus=[3,4]
> 
> 
> cpumask_and(mask, rd->span, cpu_active_mask)
> 
> mask = [3-5] & [0-3] = [3] -> dl_bw_cpus(3) = 1
> 
> ---
> 
> dl_bw_deactivate() called cpu=5
> 
> dl_bw_deactivate() called cpu=4
> 
> dl_bw_deactivate() called cpu=3
> 
> dl_bw_cpus() cpu=6 rd->span=3-5 cpu_active_mask=0-3 cpus=1 type=DEF
>                    ^^^^^^^^^^^^ ^^^^^^^^^^^^^^^^^^^
>   cpumask_subset(rd->span, cpu_active_mask) is false
> 
>   for_each_cpu_and(i, rd->span, cpu_active_mask)
>     cpus++                                       <-- cpus is 1 !!!
> 
> dl_bw_manage: cpu=3 cap=0 fair_server_bw=52428 total_bw=104856 dl_bw_cpus=1 type=DEF span=3-5
                                                          ^^^^^^
This still looks wrong: with a single cpu remaining we should only have
the corresponding dl server bandwidth present (unless there is some
other DL task running.

If you already had the patch ignoring sugovs bandwidth in your set, could
you please share the full dmesg?

Thanks!

