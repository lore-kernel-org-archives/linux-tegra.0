Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49CB5914C
	for <linux-tegra@vger.kernel.org>; Sun, 28 Jul 2024 20:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722197157; cv=none; b=nRHcR4EHEL1MefoaTncTVyPPS5WGR2hAueeFXiMaets5TwmMBN1JYqn2v3q50IiwjXanLO6FoqDcMJb068L7C7GA0zXOA9rdB5nu2+UUDld0MsAQ0rwBW9Iu+dw2UBOrqIggZq2myxATe15AtzHhjXnAMYFBoglSgADn7FNmzPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722197157; c=relaxed/simple;
	bh=8qeNIwj16ieiaUyi224RZB9BZqdEjEHvR9Is2j0uLPw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ihBut/nkB3KiYh8su0m0B+CZ9ZQlO3k2Cjwss+vkeBWyaPPVtrrP1lXKYexx35yuTkkRW3vx4lZ6bi69sl1j8nfIoK9R++ZRsFtQ9/cRxnAKFlwuyqS20GaS6XKOh+TGVPKdvZWYKFUT0SpNBv2twUpa7MxG/imIyEMMf22soB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NbtExgpU; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NbtExgpU"
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dfdb6122992so938353276.3
        for <linux-tegra@vger.kernel.org>; Sun, 28 Jul 2024 13:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722197155; x=1722801955; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8qeNIwj16ieiaUyi224RZB9BZqdEjEHvR9Is2j0uLPw=;
        b=NbtExgpUkz1knVd9HWgufMYvshbWKWPal27eBL46FSpycKb/nYTdeTxh0TohtQJ36A
         2AzZiXpmrNGD+X4EESNIFxsVXWNVeOPyXbBRV/8OZSD1brZnQeRm9lYH1TocdKejFOYS
         YfXHNQUm8xDD64zQ6Zin5zq1NT2620JufHCCk7eejxbQaoqTByeoqsVxbqDojqMT9J1g
         C0OF9FWHTtpO2lklrRZLFemD7oO6VsUW9p08PlBG3Yca8DPRRiEb4dqUXsVoFsEa7bUf
         KFIWRJn3qNMtVe/gLKct9WR6HKAWd4Q0L/HDI2h9TMC29+hdZkkIr2QvrEAi5yI5RORv
         uKMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722197155; x=1722801955;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8qeNIwj16ieiaUyi224RZB9BZqdEjEHvR9Is2j0uLPw=;
        b=pdOzMGITA0UqqvyMohpd8rr7980wyKofA8VpSIrdKx/YzhzhsmC9eKxy4RbITeeVfp
         XXeehbhV7t5+/W+Xa0oJ33ZF0KaR5uLXS5o95tkJbfkDexGVuswIAcflGWcCcmsm++qp
         2uvIgPwYP2aLGrkC3Hi/I0V2tp1fDHufc4o2FGGSrO0uUsKtQKPrmPlFJLqw3/6kG4o8
         0K9U2TQ+KgBsjE2W7rbBHxrDURYVywjEx2Fi0OssThtqnGA31YDJtW27gyAL5LA8YAhb
         tUytcmirlw9gK+LouxbuS1oi1lyqjZ0v31GUY6k27w4EFE90sZ8UdL2D+JAEfQiCdm79
         o0LQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsNoX5JBAcGiuTxDCebL1r9N4+uJ/HT52s/UtYA8+qA05+bqbUCBr5Jik5phZqCnqQZ8BSxBgr7R1xPrPzhPMfSWHTjUrCpLQ6VHo=
X-Gm-Message-State: AOJu0YwSNaSl6Ib/StnhJ+ePyriT6QbmiT1TQtje2MYy7hkO87j1HCxR
	LQEk/ipFXLqYjO125HRjkMQZca2ubm/7f5i7qsAVgq3ppWTlDwCghRf0xTwAy0muLTWJwu2g0BR
	R6/uNyLKV4TrCALqc4pdlN3yeyPyVoPO/0tn/oA==
X-Google-Smtp-Source: AGHT+IH4VuGtnxaaMubh5K8LxqivpdTRbAvbqN7TNbbLCLoKj6PCh4Ss6cSMuqSbY7Yz6HIX8oOVeIGVxbVBUgzgnio=
X-Received: by 2002:a05:6902:c08:b0:e08:5f16:813 with SMTP id
 3f1490d57ef6-e0b5464eb88mr5349192276.53.1722197154745; Sun, 28 Jul 2024
 13:05:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAPDyKFoA9O5a6xZ+948QOzYqsRjk_0jJaSxeYRwx=76YsLHzXQ@mail.gmail.com>
 <20240711031356.rl2j6fqxrykmqfoy@vireshk-i7> <CAPDyKFocjOt+JyzcAqOfCnmTxBMZmPjMerSh6RZ-hSMajRhzEA@mail.gmail.com>
 <CAPDyKFoWgX=r1QtrcpEF-Y4BkiOtVnz4jaztL9zggo-=uiKsUg@mail.gmail.com>
 <20240711131637.opzrayksfadimgq4@vireshk-i7> <CAPDyKFqczrJzHApBOYRSg=MXzzd1_nSgQQ3QwKYLWzgZ+XY32A@mail.gmail.com>
 <20240718030556.dmgzs24d2bk3hmpb@vireshk-i7> <CAPDyKFqCqDqSz2AGrNvkoWzn8-oYnS2fT1dyiMC8ZP1yqYvLKg@mail.gmail.com>
 <20240725060211.e5pnfk46c6lxedpg@vireshk-i7> <CAPDyKFpSmZgxtmCtiTrFOwgj7ZpNpkDMhxsK0KnuGsWi1a9U5g@mail.gmail.com>
 <20240725112519.d6ec7obtclsf3ace@vireshk-i7>
In-Reply-To: <20240725112519.d6ec7obtclsf3ace@vireshk-i7>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Sun, 28 Jul 2024 22:05:18 +0200
Message-ID: <CAPDyKFqTtqYEFfaHq-jbxnp5gD7qm9TbLrah=k=VD2TRArvU8A@mail.gmail.com>
Subject: Re: [PATCH] OPP: Fix support for required OPPs for multiple PM domains
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, 
	Nikunj Kela <nkela@quicinc.com>, Prasad Sodagudi <psodagud@quicinc.com>, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 25 Jul 2024 at 13:25, Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 25-07-24, 11:21, Ulf Hansson wrote:
> > Right.
> >
> > The main issue in regards to the above, is that we may end up trying
> > to vote for different devices, which votes correspond to the same
> > OPP/OPP-table. The one that comes first will request the OPP, the
> > other ones will be ignored as the OPP core thinks there is no reason
> > to already set the current OPP.
>
> Right, but that won't happen with the diff I shared earlier where we set
> "forced" to true. Isn't it ?

Correct.

>
> > > I think that design is rather correct, just like other frameworks. Just that we
> > > need to do only set-level for genpds and nothing else. That will have exactly
> > > the same behavior that you want.
> >
> > I don't quite understand what you are proposing. Do you want to add a
> > separate path for opp-levels?
>
> Not separate paths, but ignore clk/regulator changes if the table belongs to a
> genpd.
>
> > The problem with that would be that platforms (Tegra at least) are
> > already using a combination of opp-level and clocks.
>
> If they are using both for a genpd's OPP table (and changes are made for both
> opp-level and clock by the OPP core), then it should already be wrong, isn't it?

They are changing the clock through the device's OPP table and the
level (performance-state) via genpd's table (using required OPPs).
This works fine as of today.

> Two simultaneous calls to dev_pm_opp_set_opp() would set the level correctly (as
> aggregation happens in the genpd core), but clock setting would always reflect
> the second caller. This should be fixed too, isn't it ?

As I said before, I don't see a need for this. The recursive call to
dev_pm_opp_set_opp() is today superfluous.

>
> > To be able to call dev_pm_opp_set_opp() on the required-dev (which
> > would be the real device in this case), we need to add it to genpd's
> > OPP table by calling _add_opp_dev() on it. See _opp_attach_genpd().
> >
> > The problem with this, is that the real device already has its own OPP
> > table (with the required-OPPs pointing to genpd's OPP table), which
> > means that we would end up adding the device to two different OPP
> > tables.
>
> I was terrified for a minute after reading this and the current code, as I also
> thought there is an issue there. But I was confident that we used to take care
> of this case separately earlier. A short dive into git logs got me to this:
>
> commit 6d366d0e5446 ("OPP: Use _set_opp_level() for single genpd case")
>
> This should be working just fine I guess.

It's working today for *opp-level* only, because of the commit above.
That's correct.

My point is that calling dev_pm_opp_set_opp() recursively from
_set_required_opps() doesn't make sense for the single PM domain case,
as we can't assign a required-dev for it. This leads to an
inconsistent behaviour when managing the required-OPPs.

To make the behavior consistent (and to fix the bug), I still think it
would be better to do something along what $subject patch proposes.

Kind regards
Uffe
