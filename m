Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0678B421233
	for <linux-tegra@vger.kernel.org>; Mon, 27 Jul 2026 16:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785169290; cv=none; b=b6KoOFDONGMCwvLT1/PxLQrSFqp5yAWLDYvV9d/Yo/OkEUKVu+dOmls224x2Ni8MH7kr4wqC9y3Lq/LIq/lTMuyWHE1RUo6MieIyhzL2JspVHs959wOYRVdQpf2s224apLhH+yQYUg3JQwTTB1g1EamnZHaXNWELcGoW/T0U904=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785169290; c=relaxed/simple;
	bh=67jqyCE7oL3eqXdhotlmpsBj9Y+xbMo5HHGjgwiAFho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sqrdarilmna2WRlyNfmusunY5AS7/kXFoy9pqJPLuktTS8TQ3O0xaVAAnAAOEPA7rk1UlirsP9pUc4hXN5DT227ukCd2/181ECmO8M80DmJYwqADPX5WU8+8NnsyVIiHwonI31gRTFJTFlC1y5UbdCdtZqaN37cvkQvlJKV4gq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rkq2KPkr; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rkq2KPkr"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3811f512167so2729897a91.3
        for <linux-tegra@vger.kernel.org>; Mon, 27 Jul 2026 09:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785169288; x=1785774088; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xFPCWJYmCtzG5hz6wV+lDFiaJ61fxXl+OCahuMFw6j4=;
        b=rkq2KPkrVFNqV0BAg1k5qBJeiZhSbUGtRLY0rPAFy2M0sEy1QMZv6wPsJ81FPlvnTO
         GP5tKse2t5L1yaWQQrwEESDHdKpISVozvgbz2vqjDzyr8ri0V7kGKzU37o76nl5hYKaH
         2xQHnpYBXkNXpoz1kMBIksfKDMzdlhXt1Q6T8aqqreMBGcW3gV2PUt9+49gSa3AC8mFv
         L9d+tlDsSUz7qMb+HK6XtM9QF4xtCnzhsqLr1D+5K4rEblco/1PwDivoWMA6SBHSvzRU
         vcC2c/WignQgp8A5XkJckX4eNG1I1bi1E2W14G/Ft1lFgG577iWOt5BYn8W1zd+G9ehS
         2hkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785169288; x=1785774088;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xFPCWJYmCtzG5hz6wV+lDFiaJ61fxXl+OCahuMFw6j4=;
        b=IDjtpsBzks+kNMwBvLO1TafsCDYzaX24OMDy1Pddl/i6pyaD8662ZzMRjG22KV6h9I
         5kFH4bMVHnZIOVqmYPs0rceJCdQ205LH2YyBeAjwRC8eUgsHGJFIdc/Ma1gCF8ztzQj7
         3AJYXoNKkg6J391alkZ2czeFNzHMMp0AbbtXMYqBVL2ndUQEC2WtZ8zvZT0+CsDb3m+5
         EJtOrUqqUzM99vI6J/loWd9jVqYk0jXCpdoARVUOxpqn6HIePSPQ+InNBrjgvl2nWSI7
         G5S4KdBuaRucKCs7OY9M6r6PzhKVGSxOAF7prdBwVnS7W8JXMr3ou8kDYvJRBt9VKFGR
         7JDw==
X-Forwarded-Encrypted: i=1; AHgh+Ro1SQSkouGR/G+1R2QCPd0wR7P+m28sR77mTLMPYYoqvvvJda9wzBtTIXBUzSgA+VjJzmS9L2bfJqcQqA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0lpqa1d+u+GS9UTuOXyuAl+N0AMkjrPJb0b0gNza+9woF1/8+
	kiWdw89rMmmAH/XnmTle3EMm86KLL6LHNvDhQbctflsDErzmVgL0JwTf
X-Gm-Gg: AR+sD12EDId2kgK9PusrpVoLFXSJJ+Uj/hcboNlc3lrwmMHIKInO8eoI2flE6W7RARU
	L82MMpvyGkIjxLAfZr23KznbqrMR9O4TFM1TfxPkuU8djAEXptdUlQ+VS1iT7yZtZWst1zNvGIm
	jNYgzbmBJiLmqoClVPAlN/8AqMScu/71Qd3nemv7Tos4Oizysi82nPhMn7JatFlLTbJCZ1kTZrI
	5qO+KJlc1aWqnIexEDdtubp+SeX9Vj5F/ZPYcPtyvv3ZVLkR4esKbia1eaZXom/TZeACpKuUs/G
	KV8F0kddt9NE5ITGf1+q7IKiDOxn9Aw9rd/PFm7PkgSvFHFfc6653tfOhbkw2nKVtsUrJx1MmCO
	egacUTGVTuKFCXywDbRZtHFZVskjoNwOOWdaGrnqo34SbGyLddz2qlmz9MTAcMOPCxrG+sxIa
X-Received: by 2002:a17:90b:184e:b0:38d:ecfe:41aa with SMTP id 98e67ed59e1d1-38f2978138amr7093404a91.43.1785169288178;
        Mon, 27 Jul 2026 09:21:28 -0700 (PDT)
Received: from localhost ([172.216.252.23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f6411be37sm80682a91.7.2026.07.27.09.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 09:21:27 -0700 (PDT)
Date: Mon, 27 Jul 2026 19:21:21 +0300
From: Dan Carpenter <error27@gmail.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Hao-Qun Huang <alvinhuang0603@gmail.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: tegra-video: vi: fix probe failure on
 skipped last port
Message-ID: <ameFgX4p_UvO0DiD@stanley.mountain>
References: <20260707152425.571254-1-alvinhuang0603@gmail.com>
 <DK9B2RGTKZE4.BHXZNRMJ4PWK@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DK9B2RGTKZE4.BHXZNRMJ4PWK@bootlin.com>

On Mon, Jul 27, 2026 at 01:10:07PM +0200, Luca Ceresoli wrote:
> Hello,
> 
> On Tue Jul 7, 2026 at 5:24 PM CEST, Hao-Qun Huang wrote:
> > tegra_vi_channels_alloc() iterates over port nodes and skips those
> > whose reg property cannot be read or whose remote endpoint fails
> > v4l2_fwnode_endpoint_parse(), leaving the negative result of the
> > failed call in ret. If that happens on the last port node, the loop
> > ends with ret still negative and tegra_vi_init() fails the whole VI
> > probe.
> >
> > The same defective port earlier in the ports node is skipped silently,
> > so probing succeeds or fails depending on the order of the port nodes.
> > The CSI equivalent, tegra_csi_channels_alloc(), returns 0
> > unconditionally after its loop and does not have this problem.
> >
> > Use a separate variable for the per-port checks so that only fatal
> > errors end up in ret.
> >
> > Fixes: 1ebaeb09830f ("media: tegra-video: Add support for external sensor capture")
> > Fixes: 2ac4035a78c9 ("media: tegra-video: Add support for x8 captures with gang ports")
> > Assisted-by: Claude:claude-fable-5
> > Signed-off-by: Hao-Qun Huang <alvinhuang0603@gmail.com>
> 
> Do you have a real use case where ths failure happens?
> 
> Also, mixing two different return values may solve a bug but makes for more
> intricated. I'd rather second a fix based on moving the whole foreach loop
> body into a subfunction, and make the foreach loop body as simple as
> calling the subfunction and handling returned errors. This would fix the
> code making it more readbale.

My instinct is that the continues should just be exits...  Why are we
accepting broken device trees?

regards,
dan carpenter

