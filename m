Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4660B604D6
	for <linux-tegra@vger.kernel.org>; Wed, 14 Feb 2024 17:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707931204; cv=none; b=ipYTJEg5bYbwzSOfsBmhi52XRgtx8x4lMQcZ+ZTVErhRSwrhWGgpNm3eBpQ4vBjrBjcx+Ht9Aw3N8wXEAbWnqNL4sQEYAVyiKYqV5DEStMkSvi2yEaF9toq2T2xZPaBApr/PDhtxeq9x2L6lQIBexqa6hWeSsOMZrULsdW2Gsbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707931204; c=relaxed/simple;
	bh=zJ9UnsbBVQk+7CK64IucZXo37BDgEgF/64+egIlJnYc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tg/dX7BKg74TteCkgTpYxrVVVIztWcX0hi5b6QPP4uodQ3gDBeLxWD+ZKcoilpWPRld/O4fGnJ9pDGxCW5/VtwMu1dewur6wo/BbLFUlRj9XW19B9cS9A1g/A2jstIqZWMryEYRevmaRk9zrZ80eIX7nx2vaCdGBvO4GYrMfX/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=GI5OsJ1w; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="GI5OsJ1w"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-561f8b8c058so2042385a12.0
        for <linux-tegra@vger.kernel.org>; Wed, 14 Feb 2024 09:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1707931200; x=1708536000; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=236lqzUHLILRkjMonxzcy3On2gm7C9J5rPgBDfLu9uc=;
        b=GI5OsJ1wz5H57Sg4mAXsqobe1T4cnGXVVvPIZYy9/pYyPNM7H7qlJanQEFrYmi6fw0
         5AunEgggKy9cS5hSKY5UfCfii2Sw2D1XK+mC6FBEuZ1c3KrX7G+6O/OGKMvZPYjNoSwK
         sUt+1NPmOynEM9Mc6gCnvzntgqXkRcHQGhm4k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707931200; x=1708536000;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=236lqzUHLILRkjMonxzcy3On2gm7C9J5rPgBDfLu9uc=;
        b=fJNzr8cvyUOO4aLS5hw3LXrYTN/icvoDJoeA6q3r8ALHV3++QDWTN23q2pGrRR+YrZ
         isQ52wwg7jPhPPaO7m+JWgAix8gwyuWW3peazB2Jde4dSHUkUuK1mF+YcTD5nJVKOIcp
         zbv45vJA5l24rBGCcDyRt1vqu3/zwzX8f+O+WjWY9ghRWsCXpgfG5KSX3xhtoCfPMTWR
         p46lNRyEYETWZeKll4G7IHESVcr+s5oMdt80iqCmjsA4KbRPa40wP5o4CQk3+BZw1XYW
         WHEUZDext4f4VxVARLwpvXbpcUz43ZPTrl7YmXo5oA3n46latVYfTGaykXo/KabgKpUv
         il0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXVmZKva5IbRPwm33lwaUj2cAbyAZhNmXwUgRd0PtEgDnmOFw3E1gYP+2uRzTsaoGSgy8VMb6Scup7ivEgDbqyKSpDrGRGUx1aUtOE=
X-Gm-Message-State: AOJu0YyJlzKMySUOoCXrCKpgI9PqbUKUbTf6OqVRrig6imHCu2g34FMO
	9IWHPLIop+wdzxygkLtJFdlMGvrN52ZNOpwW7G4xWaE9Rv3SSvDDZFHSzwI5VasdSRbQTcUltdk
	YL3o=
X-Google-Smtp-Source: AGHT+IHIK+SOGUqccjzXMe6YRZPuB5kN9Vjv6oJxEslyyh5NofGGwJbWrZ7GKL70k+sP9Ep2T9aTWw==
X-Received: by 2002:a05:6402:5410:b0:561:5e21:8b89 with SMTP id ev16-20020a056402541000b005615e218b89mr2620839edb.13.1707931200052;
        Wed, 14 Feb 2024 09:20:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVUnhA+5ZZzyEFDbDCeIPGMiLlvJHaK1hZHXB8eEmTGFSTtJS0/B21s35rEwLR+gnSwJEK3TMVYwf3c1XO7AkV3SM1Ps0NeF7W2pf8=
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id j2-20020aa7de82000000b005621b45daffsm993692edv.28.2024.02.14.09.19.59
        for <linux-tegra@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Feb 2024 09:19:59 -0800 (PST)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5638ae09ec1so11455a12.0
        for <linux-tegra@vger.kernel.org>; Wed, 14 Feb 2024 09:19:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXGDO+LPZkgY4BQaRJ2QWqWJbFPQxsyAPBTOBJgpP2iDBQ/P547QoOW9EJ96XChhOfDUMruGYWvoQpL4Qc8vjziT3FEaIbarlXnfME=
X-Received: by 2002:a05:6402:5410:b0:561:5e21:8b89 with SMTP id
 ev16-20020a056402541000b005615e218b89mr2620799edb.13.1707931198880; Wed, 14
 Feb 2024 09:19:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240114183600.135316-1-vincent.guittot@linaro.org> <6ec54a8f-a602-4f33-96ce-0204f07046e1@nvidia.com>
In-Reply-To: <6ec54a8f-a602-4f33-96ce-0204f07046e1@nvidia.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 14 Feb 2024 09:19:42 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgjiVanO4ZS1hy2sfAFTN_pYtQqVQb_g+dbrP34M6xTDw@mail.gmail.com>
Message-ID: <CAHk-=wgjiVanO4ZS1hy2sfAFTN_pYtQqVQb_g+dbrP34M6xTDw@mail.gmail.com>
Subject: Re: [PATCH] sched/fair: Fix frequency selection for non invariant case
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>, mingo@redhat.com, peterz@infradead.org, 
	juri.lelli@redhat.com, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, mgorman@suse.de, bristot@redhat.com, vschneid@redhat.com, 
	wkarny@gmail.com, qyousef@layalina.io, tglx@linutronix.de, rafael@kernel.org, 
	viresh.kumar@linaro.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, 
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Thierry Reding <treding@nvidia.com>, 
	Sasha Levin <sashal@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, 
	Shardar Mohammed <smohammed@nvidia.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 Feb 2024 at 09:12, Jon Hunter <jonathanh@nvidia.com> wrote:
>
> We have also observed a performance degradation on our Tegra platforms
> with v6.8-rc1. Unfortunately, the above change does not fix the problem
> for us and we are still seeing a performance issue with v6.8-rc4. For
> example, running Dhrystone on Tegra234 I am seeing the following ...
>
> Linux v6.7:
> [ 2216.301949] CPU0: Dhrystones per Second: 31976326 (18199 DMIPS)
> [ 2220.993877] CPU1: Dhrystones per Second: 49568123 (28211 DMIPS)
> [ 2225.685280] CPU2: Dhrystones per Second: 49568123 (28211 DMIPS)
> [ 2230.364423] CPU3: Dhrystones per Second: 49632220 (28248 DMIPS)
>
> Linux v6.8-rc4:
> [   44.661686] CPU0: Dhrystones per Second: 16068483 (9145 DMIPS)
> [   51.895107] CPU1: Dhrystones per Second: 16077457 (9150 DMIPS)
> [   59.105410] CPU2: Dhrystones per Second: 16095436 (9160 DMIPS)
> [   66.333297] CPU3: Dhrystones per Second: 16064000 (9142 DMIPS)
>
> If I revert this change and the following ...
>
>   b3edde44e5d4 ("cpufreq/schedutil: Use a fixed reference frequency")
>   f12560779f9d ("sched/cpufreq: Rework iowait boost")
>   9c0b4bb7f630 ("sched/cpufreq: Rework schedutil governor
>
> ... then the perf is similar to where it was ...

Ok, guys, this whole scheduler / cpufreq rewrite seems to have been
completely buggered.

Please tell me why we shouldn't just revert things as per above?

Sure, the problem _I_ experienced is fixed, but apparently there are
others just lurking, and they are even bigger degradations than the
one I saw.

We're now at rc4, we're not releasing a 6.8 with the above kinds of
numbers. So either there's another obvious one-liner fix, or we need
to revert this whole thing.

Yes, dhrystones is a truly crappy benchmark, but partly _because_ it's
such a horribly bad benchmark it's also a very simple case. It's pure
CPU load with absolutely nothing interesting going on. Regressing on
that by a factor of three is a sign of complete failure.

                  Linus
