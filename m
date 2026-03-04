Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7F738C2C3
	for <linux-tegra@vger.kernel.org>; Wed,  4 Mar 2026 08:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772611653; cv=none; b=WwCRuWVDZ/r7MmVi2IEh30dED+acYkqfMsGuT1LpxhBxRmeq+dVe9VO+ZbYMERrWD7mcrq4KCoEDZLgn7y/VFgMY7H4VtAnDIn3+KjzFsOz4CeZHxKa00UBLCFGWC9TNfNH37uKs47ZY70guBRu8NGQ9uC+1xPsTcwpyrKyUV8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772611653; c=relaxed/simple;
	bh=4ZI+SD3jD+IY3XcMnXZ2Lccr40hmpqlA1lS3Z42+WWo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aQEDmF+uKGeyFJHVmBiFvJ/TzZiqa+5VWhx+hkHuxLKQ6S/hEVFQrtGgauNEJpomxK/zqfk7ClmIL7vkEFBJmu7JNY5gWZqhqcjmnKC5ZX5R6J6xqQa+OUgZjgLIxKpgqGLTZmzqdAhF2129A/w69aiBUZLghiQnTF9/sqJsZF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hPQNryTQ; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hPQNryTQ"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-439b78b638eso3106338f8f.2
        for <linux-tegra@vger.kernel.org>; Wed, 04 Mar 2026 00:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772611651; x=1773216451; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cVXPpCyp/KjyhGEHsF5inZ+ZQgDHJ+B5qlUBdv6NHDw=;
        b=hPQNryTQCLUWSFiutXaD3gzjLU3pYaN+Dke8RJ84xLGSIMPN53p81sxoFWzCTcA8ba
         le6M24LW8XIcQyspMhWpL+7iAKH5CIejPYdeVlaZk4avvz5QE1WbkG/sUjR+xHLyGQko
         YX6Id3n1KOOTGKMN+OCkxjOrC+xzVoWJ3zuUGBVefJRrYx5CIwmwQiR1cv6JD6IhT3Ir
         UGXbZcrJnsELZ32BdyFIsWMtjjY4kHDtDn5XXHY2A54QqxTtJdxG9YO+vyxcXYMK74IP
         JrLUug6ueD/9UqtB/xr65MPwWQLhlz04Ucif3SAiZcUZ1HQPjPU5pZ9QY06sbiox1FnZ
         JLlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772611651; x=1773216451;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cVXPpCyp/KjyhGEHsF5inZ+ZQgDHJ+B5qlUBdv6NHDw=;
        b=TtLqJt9hylJwFAARdrhqmv3rVZqKf1eCxJ7lAIh7D0Cn2yg+REf0o9VeyD19oARooX
         Oi5iGxEEny42IV9LV92fB75Nq3xtlBWOGjY2WdgSyRmFpk4AY4QcV8N6abciuChxC+p7
         H6HeBkr+aIFIt0f40XVZ4N2H3po8bUbJLZ8Culn+EmfooJZzsjyGyhRb0WR8OnQGND0q
         q1IxY7A/+GFYqgVzh2FKeRHpR5enqIr4F/cCLBohBK7f4v/P6dHS6X5Y1wFOy49uMjsa
         O/lpOJXxFtKg516eth6sHDz5Y9NygWca06C+TBcsrZF/+3+uQvkI2K+KVoJDSLJxcoVu
         kQiw==
X-Forwarded-Encrypted: i=1; AJvYcCVRUM+RTLi3JT4BptIIx0rg1MMNnp4aNJcTzc1cNDUbkH5n+gMXFukAG6+JMbpTw1VJLayfJh3iBsySCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzzMulwVtGoB+6NQRqppHsCK9b21ssmWZBGRPpHOhRGcuEtRtO7
	82p3vLxC2EuLNvm/5BMcIfUhIt1AGIeVmT4yLSM2HH0AMaaF2JtzX4fe4XopzyJZtuY=
X-Gm-Gg: ATEYQzwUgkI2ig41KOen0BZCUGoqUlhUB95dZ2gZJUxs85TeANOwxWMDpe532BUXE18
	gXaGOb4CVuIT1vv1yEVpkYzjV1G+QvOlRK25sKCTiAiUrqnS/G7uMIuQ5bybexelzdgXhf3OtAg
	tKvEveY/miKieGlFvUFegrc7bWGWR4TkAMhbUdG4tsDF6Lktx/nGXcVUUx0ZxYXDCsPQC2LimCj
	bGJys2FGRD/kATcSmkEDlCWuczbQmO2Qxe4wt/x1R9qDHUeMV5cXoO0Hb33ghFOpzn4z9eLhtGt
	0fBZz5taW3eFWNb7hhnGJfMeRfLlPTA3HHoFk3jkQh/bOzESfcCF4w7iUPc3FzWSYqCvLUphRUq
	Sgs9cfxPhZJtkrHywrj71KX8JPtRWUVcKGIU8+M2dyWj+/TMDMa8JQhXa+1opRKiPPAzicbTExS
	kYIKJUGVqRvIeDRKawauPPCc7oBXij
X-Received: by 2002:a05:6000:1842:b0:439:b55d:b0eb with SMTP id ffacd0b85a97d-439c7fd3a59mr2271566f8f.38.1772611650336;
        Wed, 04 Mar 2026 00:07:30 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439c1fc577bsm9446052f8f.19.2026.03.04.00.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 00:07:29 -0800 (PST)
Date: Wed, 4 Mar 2026 11:07:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Soham Kute <officialsohamkute@gmail.com>
Cc: marvin24@gmx.de, gregkh@linuxfoundation.org, ac100@lists.launchpad.net,
	linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: nvec: kbd: use -EINVAL instead of -1
Message-ID: <aafoPlld7S2Nq76W@stanley.mountain>
References: <20260228202008.40063-1-officialsohamkute@gmail.com>
 <aaVXtbHMfUFJW_Tu@stanley.mountain>
 <CAFxoRw0yZM8opXig2vgnFZR6mTPFgj0JFxKYx4vtv2VyqUWSJw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFxoRw0yZM8opXig2vgnFZR6mTPFgj0JFxKYx4vtv2VyqUWSJw@mail.gmail.com>

On Wed, Mar 04, 2026 at 01:13:05PM +0530, Soham Kute wrote:
> Hi Dan,
> 
> Thanks for pointing me to smatch. I built the DB and ran the queries.
> 
> >From what I can see, dev->event() is called in input_handle_event()
> but the return value is not propagated back up. The smatch caller_info
> table shows type INTERNAL for that call which I understand means the
> return value stays internal and never reaches the caller of
> input_event().
> 
> So yes, this patch has no runtime effect. The reason I sent it was
> that pcspkr.c uses -EINVAL in the same type of event callback, so I
> thought nvec_kbd should be consistent with that.

Put that kind of thing in the commit message.

"This patch has no effect on runtime but returning proper error codes
is the correct thing and it makes it more consistent with other functions
that implement it such whatever_function() in pcspkr.c"

> 
> Also noticed atkbd.c has the same -1 in its event callback. Should I
> send a fix for that too?

If you want to do that, then sure, absolutely.

regards,
dan carpenter

