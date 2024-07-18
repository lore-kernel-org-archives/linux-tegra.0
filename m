Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BCF20DE8
	for <linux-tegra@vger.kernel.org>; Thu, 18 Jul 2024 03:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721271962; cv=none; b=VFdAadZUYaA1VCj5Gt6tSmdW6ziYspvfNIvniAgttkEvcX+YkWFEGyKadm4Knm8/R91+s4QCgU45ph/d/sf4My7aWCzU3nAUZlDEeLYt1KEd7IK/c0HvLS5GqxYS7iaXAkXta135fGvVezkVsjiINz78p/B9Fg2YciA6iuSU4w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721271962; c=relaxed/simple;
	bh=3p1nHlyFmbd2Mqt/h3ECuwH02UH1qFkMjptXlGRXakM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EgjnWwEhyIKxoY/rk89ATnVdXujHk/2kbH2nBRvweVcODAgzQseFTRrgGwrgt7aHRaLyZe1rmX7UR2SGbLp/eRYM5It1LBj+fuhmtgUhRXvWMMJ5JRxzqC22jm7TxBe/Ytycxl+kaGkftqkHWytRLe8UoORlIaLttNrXEQUT3d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nf7ruRec; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nf7ruRec"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-79110d8e459so206665a12.0
        for <linux-tegra@vger.kernel.org>; Wed, 17 Jul 2024 20:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721271960; x=1721876760; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yeW6dMBKtWe8oDZj4BcQTEdzzbJoa7udjbLAE+AJzpw=;
        b=nf7ruRecmH17OyG5D6e3NRbhVcNXggf0gG9iOHljGVqvloxoQIPcHQKHUhmwsQoyga
         GSwfGqPA7JfQZbRLuo4RSmzBpMZWVXRE9Z5Gz14ZILTJRHrlYB9efcWlRTekLfvXC7Bq
         CXZuwjBf9zeisNKcMLGscV1niHTmykwIALM8MAJFtjjm4jjWy6eTOG1+XNOXyrnVHIaN
         yB8Zr7tDbSAs1h1QA3NWOOXBHWdew9ePme1Q7neATnw7s6hF1hPklM462Gbq4tW4bbja
         k7YiaLYo+3tDZGsXzGAm5lAfzG2oJEoe84Pmy6uXiKM13O74D8q8dZCEj46mOUEZkb3O
         VQig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721271960; x=1721876760;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yeW6dMBKtWe8oDZj4BcQTEdzzbJoa7udjbLAE+AJzpw=;
        b=FVxLLvash6+pG/QhCiSvbazPPRcKweo9/pBISVZwZKFDTm8NNpacqAGfI9rcMkglNy
         LspX7blaiAdZzku6ClYzU5OQAt/c9HAxOM+pWZRKFYB421VFf8CnzTs14/1YFkmGWG9f
         h2sI7AYMDnqu9AeHwI3d9BHfNah9qBam4EgN5nedsU0IlO6GJDz39ViCVz7l2wnUJoKA
         K/oKWrepUFft3hOD3uP++HuHM4KKNwM7jnyO6MCFlp8h+U5O8abCDjvWfA2/H1NKtXKG
         U47LmciDbZi809H0bSxIk5c6NKVS5NN3PTsBe05o8ak59FHlnJmY/hAJlN6n50cIWkIq
         vikQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkXAtvwNfAsad0cy3GGHAT/17pcS0KVmgmFuMGib6LFJWX24VwurXFk7oWeTLii8gyzB2HtHZqIQLSByob2kLDCnSh4WB0i7DGf2M=
X-Gm-Message-State: AOJu0Yxovmb+0ea3/NJ/T9SiF2Vpc8zY6nTPZgDjbEJ+ukwOsH2PZmrW
	hdSeTxoqoCvoLMmXtpb/3/N9qFCdUvOIOn6x4LvGUY/0h/0ZjLxZNDqhcA+NrMI=
X-Google-Smtp-Source: AGHT+IGZQrMHKumtV17odbuMLApq0aWGZDMpuPSD6YxnkxMLKUzBluzrVqhDLqn9KpZgTHq+5klwjQ==
X-Received: by 2002:a05:6a20:a11e:b0:1bd:253e:28e with SMTP id adf61e73a8af0-1c3fdc962c8mr4939585637.16.1721271960004;
        Wed, 17 Jul 2024 20:06:00 -0700 (PDT)
Received: from localhost ([122.172.84.129])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc4bcab736sm18649325ad.233.2024.07.17.20.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 20:05:59 -0700 (PDT)
Date: Thu, 18 Jul 2024 08:35:56 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>, Nikunj Kela <nkela@quicinc.com>,
	Prasad Sodagudi <psodagud@quicinc.com>, linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] OPP: Fix support for required OPPs for multiple PM
 domains
Message-ID: <20240718030556.dmgzs24d2bk3hmpb@vireshk-i7>
References: <20240625105425.pkociumt4biv4j36@vireshk-i7>
 <CAPDyKFpLfBjozpcOzKp4jngkYenqSdpmejvCK37XvE1-WbBY2g@mail.gmail.com>
 <20240701114748.hodf6pngk7opx373@vireshk-i7>
 <20240702051526.hyqhvmxnywofsjp2@vireshk-i7>
 <CAPDyKFoA9O5a6xZ+948QOzYqsRjk_0jJaSxeYRwx=76YsLHzXQ@mail.gmail.com>
 <20240711031356.rl2j6fqxrykmqfoy@vireshk-i7>
 <CAPDyKFocjOt+JyzcAqOfCnmTxBMZmPjMerSh6RZ-hSMajRhzEA@mail.gmail.com>
 <CAPDyKFoWgX=r1QtrcpEF-Y4BkiOtVnz4jaztL9zggo-=uiKsUg@mail.gmail.com>
 <20240711131637.opzrayksfadimgq4@vireshk-i7>
 <CAPDyKFqczrJzHApBOYRSg=MXzzd1_nSgQQ3QwKYLWzgZ+XY32A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPDyKFqczrJzHApBOYRSg=MXzzd1_nSgQQ3QwKYLWzgZ+XY32A@mail.gmail.com>

On 11-07-24, 17:25, Ulf Hansson wrote:
> Right, I get your point.
> 
> Although, it seems to me that just limiting required-opps to
> performance-levels, could avoid us from having to enforce the OPPs for
> genpd. In other words, doing something along the lines of $subject
> patch should work fine.

I really don't want to design the code that way. Required OPPs don't
have anything to do with a genpd. Genpd is just one of the possible
use cases and I would like the code to reflect it, even if we don't
have any other users for this kind of stuff for now, but we surely
can. Just that those problems are solved differently for now. For
example, cache DVFS along with CPUs, etc.

And as I said earlier, it is entirely possible that the genpd OPP
table wants to configure few more things apart from just level, and
hence a full fledged set-opp is a better design choice.

> In fact, it looks to me that the required-opps handling for the
> *single* PM domain case, is already limited to solely
> performance-levels (opp-level), as there are no required_devs being
> assigned for it. Or did I get that wrong?

That's why the API for setting required-opps was introduced, to make
it a central point of entry for all use cases where we want to attach
a device.

-- 
viresh
