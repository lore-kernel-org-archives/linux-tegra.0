Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9C51990D6
	for <linux-tegra@vger.kernel.org>; Thu, 25 Jul 2024 11:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721906724; cv=none; b=Vl0GTQCG64EP0XCPXBWmWjI7VEAlHgGK3McnHlqI9FKW6kG6g2hOrs3vQy8EBSHDUOPkIUoKKQbCBO6AJZX1k/XiKQrqj3XLK884RWm2Qh7GTWMMDiFa8y4rkNpeSYLVUvncNsKXPraE9CZyoAkhvt+lOsg0mdjQVzlAnGRi0tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721906724; c=relaxed/simple;
	bh=JsK7yJjBr07hesTWuuOd0Olz1bm2HQodZpRdnFA5cgc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kv9NExnWg7ZIsEll4VqA5wXRj2SWhm8W/Pxf/4nH3pQcwXz4lLjefhuY0/a8oYeGOln6cmeSpuDpOPJ/pc9PDVthnjaFEiRmXKGjPhwd04SjANaEmM30vcOWSlmtaqzTJ5uY9kHmezbT82EN9Dp8JNmMAYlyXMvYXy/NKSR4pTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HJSumhwg; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HJSumhwg"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-708adad61f8so421902a34.1
        for <linux-tegra@vger.kernel.org>; Thu, 25 Jul 2024 04:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721906722; x=1722511522; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pB5alhK3P/rWHh7+6LRvYSZnbMJZGnDqL1m2WfhmM9Q=;
        b=HJSumhwgmCZaXodmOfg9ocbC3JhI/zX3ZkZKQpY8n7OmYpBJQaCFWdKtCbqGheR0lj
         wk9rAZTfmsWYHGAB2HSKqndQpPWohjTi4ATfVsBpp4nxGYYGSG8TiH414rB5URn744rt
         jchQGsCf3hNbbqxUhEJmNCaRbsbICuv1smWBhpVyQlhlmcjfmW5UF8Xmzzu7MLLb9oKR
         e9RFiSPPil4Y38xgvFxYs05KHV7UoPQUkkd+zQiOaNt8lkGOjSwPOU7xnwJvjItrFhRp
         1j3dyzCoaKZFahyeSVpjcy3LGgcwI08hIBxIesIVAYETq7zEjEqkpNf9R6LG/mLzFAFH
         Dp+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721906722; x=1722511522;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pB5alhK3P/rWHh7+6LRvYSZnbMJZGnDqL1m2WfhmM9Q=;
        b=eZPp19euFfF+FH3NW85muXwp8m//ApVmtIRXcsiGHq19TJ02bboelD5ITnrPRD/vVm
         1AxwvuV5c6fQMmfND8z9aaf2we4v1bDma1snzEdFT04/Iri+xYrnOXogEvwAeiDqenJE
         +wARsnV0RXwQKxrjvmM7KKIY5yNsjJQ42sCSQ4iaQkBmJopkprkgT0B4njS3vKPEtrnR
         n7po1bfUChwCYhz/891XFqtokenj7mI6GVJ5GE4XpsKY4NcCB64srmXiAC1fMjtS7cwd
         pOuYxcomW3YXilCyL0hcksDOkT4+1vUMWzaNoLgoAcNw9BS+Tkq3rE0+sIRCA7b5pE3G
         KL+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUi43MGfiyhUvus4wS6v7hOnjqI3PiI0dqyfW69uYNpz6CSbWpLIX9F/5z/lnOVkC4UrHLHCL/XcppjfUxc3UBT+A8tQ/1g2ifn+k0=
X-Gm-Message-State: AOJu0YzEtxe02MI9K7VeNK+wW1XmNhfaWcWCw/hXYsV0vSPQZIwEAro4
	5UbQo/AHu+przhWQKstJ1f+RA+JHUvTULkCyBzf9COJrKlC3FdD1PjBnfXxnwVg=
X-Google-Smtp-Source: AGHT+IGB/C7i53ZMxQDVG7er3qrj96VmG0v9dXH1VLSTmcs7GQ7h6A9jCwiBR5/hKLh7wLBNc8M2NA==
X-Received: by 2002:a05:6870:b020:b0:229:f022:ef83 with SMTP id 586e51a60fabf-266ede9b2f8mr1951899fac.43.1721906722263;
        Thu, 25 Jul 2024 04:25:22 -0700 (PDT)
Received: from localhost ([122.172.84.129])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70ead8af074sm937252b3a.218.2024.07.25.04.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 04:25:21 -0700 (PDT)
Date: Thu, 25 Jul 2024 16:55:19 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>, Nikunj Kela <nkela@quicinc.com>,
	Prasad Sodagudi <psodagud@quicinc.com>, linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] OPP: Fix support for required OPPs for multiple PM
 domains
Message-ID: <20240725112519.d6ec7obtclsf3ace@vireshk-i7>
References: <CAPDyKFoA9O5a6xZ+948QOzYqsRjk_0jJaSxeYRwx=76YsLHzXQ@mail.gmail.com>
 <20240711031356.rl2j6fqxrykmqfoy@vireshk-i7>
 <CAPDyKFocjOt+JyzcAqOfCnmTxBMZmPjMerSh6RZ-hSMajRhzEA@mail.gmail.com>
 <CAPDyKFoWgX=r1QtrcpEF-Y4BkiOtVnz4jaztL9zggo-=uiKsUg@mail.gmail.com>
 <20240711131637.opzrayksfadimgq4@vireshk-i7>
 <CAPDyKFqczrJzHApBOYRSg=MXzzd1_nSgQQ3QwKYLWzgZ+XY32A@mail.gmail.com>
 <20240718030556.dmgzs24d2bk3hmpb@vireshk-i7>
 <CAPDyKFqCqDqSz2AGrNvkoWzn8-oYnS2fT1dyiMC8ZP1yqYvLKg@mail.gmail.com>
 <20240725060211.e5pnfk46c6lxedpg@vireshk-i7>
 <CAPDyKFpSmZgxtmCtiTrFOwgj7ZpNpkDMhxsK0KnuGsWi1a9U5g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPDyKFpSmZgxtmCtiTrFOwgj7ZpNpkDMhxsK0KnuGsWi1a9U5g@mail.gmail.com>

On 25-07-24, 11:21, Ulf Hansson wrote:
> Right.
> 
> The main issue in regards to the above, is that we may end up trying
> to vote for different devices, which votes correspond to the same
> OPP/OPP-table. The one that comes first will request the OPP, the
> other ones will be ignored as the OPP core thinks there is no reason
> to already set the current OPP.

Right, but that won't happen with the diff I shared earlier where we set
"forced" to true. Isn't it ?

> > I think that design is rather correct, just like other frameworks. Just that we
> > need to do only set-level for genpds and nothing else. That will have exactly
> > the same behavior that you want.
> 
> I don't quite understand what you are proposing. Do you want to add a
> separate path for opp-levels?

Not separate paths, but ignore clk/regulator changes if the table belongs to a
genpd.

> The problem with that would be that platforms (Tegra at least) are
> already using a combination of opp-level and clocks.

If they are using both for a genpd's OPP table (and changes are made for both
opp-level and clock by the OPP core), then it should already be wrong, isn't it?
Two simultaneous calls to dev_pm_opp_set_opp() would set the level correctly (as
aggregation happens in the genpd core), but clock setting would always reflect
the second caller. This should be fixed too, isn't it ?

> To be able to call dev_pm_opp_set_opp() on the required-dev (which
> would be the real device in this case), we need to add it to genpd's
> OPP table by calling _add_opp_dev() on it. See _opp_attach_genpd().
> 
> The problem with this, is that the real device already has its own OPP
> table (with the required-OPPs pointing to genpd's OPP table), which
> means that we would end up adding the device to two different OPP
> tables.

I was terrified for a minute after reading this and the current code, as I also
thought there is an issue there. But I was confident that we used to take care
of this case separately earlier. A short dive into git logs got me to this:

commit 6d366d0e5446 ("OPP: Use _set_opp_level() for single genpd case")

This should be working just fine I guess.

-- 
viresh
