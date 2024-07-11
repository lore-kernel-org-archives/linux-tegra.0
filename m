Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF9514A4E5
	for <linux-tegra@vger.kernel.org>; Thu, 11 Jul 2024 10:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720693920; cv=none; b=enRS029csQuoa++9vrXZvBhcN4sZ/MYbh/9xkoaeE9FexraONDpUj38bzWWKkt5sIAdo3CeaXMRsNJR1PeYxUY7RC0TGtXcyB/x6jKNw3Q1ZsCDA9RzMP8c7HaLkWs7+/rdtZSNiS9GBD5fB3oAyBXTqcDT6+icGFSZNh8kboOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720693920; c=relaxed/simple;
	bh=sLYnoBKzs5dKdL37heI92uqtdcf3VywRSOkfVafIoUg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aXOA4EMcgkYxcare6xievtkI8jz+Vu9racLW1y4J3pssQWe3dqwjxntQOGqEHcDnClfQ3huecvGIP5BzBV3x4cvSZKxlvm5+2rGQtp7l+VPSVPjCHAvvUFwnqMUePN+VJeq1BtnmHC5xUx5IUJ6DYlh36A/FrqnFEapez3cOrHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MQVm8x0+; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MQVm8x0+"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e02b79c6f21so722935276.2
        for <linux-tegra@vger.kernel.org>; Thu, 11 Jul 2024 03:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720693918; x=1721298718; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sLYnoBKzs5dKdL37heI92uqtdcf3VywRSOkfVafIoUg=;
        b=MQVm8x0+TMKwmt++HVPt45k2fo3FtB9lJ9egjEUJisOEsZx5ry7ThEGfqyX9mJ79dr
         B2MyoD73ntBCkxSlQ+VgliSGBRjyWPFiF7ZA+gLjBy5GJaARDoiCDWjoL8ICDaSZlogM
         nrl6KI3zkJ0tUCBbxIrKam1OOHL2CU7MmSSrozeJ+Syfmv6+4Gm+FQWJzMTtoWWuzl3z
         FxpVHuMq5cPdTp9FzkdUqxdr35kQKBQGoX5vGkuvEZPOq4TrRtwMgkiGdTuqdO5DtBWT
         5FA7m36mL4M/UqrWMxu9wry2+/O4eIRLmd3JY8hEaa6aeYTHxSZppdJ/qUl+/NlmHiR5
         N70g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720693918; x=1721298718;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sLYnoBKzs5dKdL37heI92uqtdcf3VywRSOkfVafIoUg=;
        b=ZKvxgxJyXFuP4DRPRKWkyXECloIQTxYkirA2UozkSg4gkrX1aQHyQ8zgW9D/y/u/Hn
         WfGE/k6Z5KRzkyag97B0Chacn/kyE7vdjcBDVrbAbK/SyHtuzvnF9tkHGqxiyFGc3rz1
         7olZMKzlPIpGQ/okEg29ZWksVFY4+xOysK2F0BBi4YHc3RXRLBxHmZIMHE5LLMe9LuPU
         XOarklvzFjuMWP92JncZpkGwMDzGTFHhMCSGh2pIi6tN1QcUsbwPY/eaIYbFBYNhOT0r
         v1/8THu9ac9D/2QHbUIHuBg6JCHuK7+OhQNs2C5tsO4Og4nCGKfNa4SSLIYY6gSzwgNM
         PJBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwlYPU115GjWacxCV/FW2VTnNUmGtX0qkman0Ez8rh2+7MGwgZzmq59ae6CTgdYLMi5ADzVHHxeRKv+q20XCy1uYWbnhSdR58em3g=
X-Gm-Message-State: AOJu0YwX5caXMIUxM0OQ2r4Up23xAMaeqUeNHRaTzRP00UqLsPKVtMK+
	oddFp+2Ju3Z52evHZyiLsWFl3AvhYL5VJrhXyODMoX0IeXG5dCuLezDPFXUCayHbjvJO0GRk7XJ
	tFe7R96M6mSrkJaXPJIzzwbHgcZupEsiO+mO5yP1hwtkGihdYbyQ=
X-Google-Smtp-Source: AGHT+IEquy5Mfj+z2Qe+lRxpTPwm+FEGo5nmwpVJMvyZKcggTgoJuc5Z1qMdFrX2t9QzHPAMZntBHC16c2/koorP8a8=
X-Received: by 2002:a25:6801:0:b0:e05:6d47:57a4 with SMTP id
 3f1490d57ef6-e056d475973mr3751249276.10.1720693918146; Thu, 11 Jul 2024
 03:31:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240618155013.323322-1-ulf.hansson@linaro.org>
 <20240625105425.pkociumt4biv4j36@vireshk-i7> <CAPDyKFpLfBjozpcOzKp4jngkYenqSdpmejvCK37XvE1-WbBY2g@mail.gmail.com>
 <20240701114748.hodf6pngk7opx373@vireshk-i7> <20240702051526.hyqhvmxnywofsjp2@vireshk-i7>
 <CAPDyKFoA9O5a6xZ+948QOzYqsRjk_0jJaSxeYRwx=76YsLHzXQ@mail.gmail.com> <20240711031356.rl2j6fqxrykmqfoy@vireshk-i7>
In-Reply-To: <20240711031356.rl2j6fqxrykmqfoy@vireshk-i7>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 11 Jul 2024 12:31:22 +0200
Message-ID: <CAPDyKFocjOt+JyzcAqOfCnmTxBMZmPjMerSh6RZ-hSMajRhzEA@mail.gmail.com>
Subject: Re: [PATCH] OPP: Fix support for required OPPs for multiple PM domains
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, 
	Nikunj Kela <nkela@quicinc.com>, Prasad Sodagudi <psodagud@quicinc.com>, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 11 Jul 2024 at 05:13, Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 10-07-24, 15:51, Ulf Hansson wrote:
> > I think this should work, but in this case we seem to need a similar
> > thing for dev_pm_opp_set_rate().
>
> We don't go to that path for genpd's I recall. Do we ? For genpd's,
> since there is no freq, we always call _set_opp().

You are right! Although, maybe it's still preferred to do it in
_set_opp() as it looks like the code would be more consistent? No?

Kind regards
Uffe
