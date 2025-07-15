Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7179A8633F
	for <linux-tegra@vger.kernel.org>; Tue, 15 Jul 2025 11:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752577913; cv=none; b=parvQKpUI8Vfdr4S432uh59EDFfgH4yqrk7ZnB78WC5pXfoDhitoclNWMSD2lEeMhxw+iyEIDNtG/CcwuP5JTahr/rwmrC8RYkWkOA7oJqNTFsrZUm0xjtkL+D7DMmaLoo6VOhXYlzr1FK6Iy9hnXr9tAcFkQKdLlMxp+1sTLko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752577913; c=relaxed/simple;
	bh=l/yFbP2fCrLeH3hUtfWbaL0u1ry82Ak/7nDAOpJkQzg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oj2iimTYmBSGThlwxpPBBFZnxXbSvno9Ygo/kj/rnK30AOxxFIQeIF6/4/Su9Xx8Gg+EtQ4yjOdcvU7z2K3LbDu7PS2ynYILaFA9UMeCG3DsMRVst8hFu3Tj5c16i+A7YKV7QImL0HGobzAygYBlGOZ769wS9VMKUAmFO3CjLKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gbh1VMSf; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gbh1VMSf"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-451d41e1ad1so37687295e9.1
        for <linux-tegra@vger.kernel.org>; Tue, 15 Jul 2025 04:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752577910; x=1753182710; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tOD2KdkDf2g2ZTL9DBAls4gcrEUjzzhQIBup1CEYFgk=;
        b=gbh1VMSfqgYIhmcr9rxFKuUTFIo9UHl/UqVYPdhIgb9eqQ3h3ZNr6LA+CFR7fa+fd/
         XOcP2fcXBEqC6d1ftq9WWCnStiosrbbi5CwYpEXwg3vij4k6NqnNKyF6YfGMyOufg2R2
         Cc4+TSlgU+T/QPZw8wEihCsZTRrrXZ2w1ovICV9oDtCClcTARAIik5XkVZF42HnPqGrj
         l32D093PMcF8ExYSbd0EIQ3tzyrlnTVlmHS6GZKYP+CtJgBfKt/QPNVb9RBqt9Cisl/3
         jD0XQVZhWrQ3pfgRA0348IO5naGZn+wycbKMnw5AmBX1JBKLrhH6d4XRXmcyJIk2Syn3
         mu0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752577910; x=1753182710;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tOD2KdkDf2g2ZTL9DBAls4gcrEUjzzhQIBup1CEYFgk=;
        b=IIFBFJvtq5aHYH1vyrdvu96Xoydxatq8SYF4pEUwfOIu4NfS/zODGXpE/pL230qY5q
         hjIu3kcjyK4FsgLqqE2/ToK0ujkxujAgsiFbSJr9xfpqpVNlqdSdkklTwrYXMTuZHZKg
         vZyOD3Zzmw2DaPwhyHHoTgAjPEXvc9wGLOZdxEetuIzprPfKlidsz/bu4xt7AitnHNmF
         eN9df3JA1IL1aXdWaSgvVER98HTeZH/T4auVAVSQacL17PTLn15kdOaJY6jyaUGu2cW2
         fgzpZ++zWy9PUdAbNzatAovfY4SiCCVc/PsvAy60ZnbsBuz6qgxdaIIOcq5mLARFs6A0
         lcpw==
X-Forwarded-Encrypted: i=1; AJvYcCUVfvN3dpRzZZOaQxD7IUWC9uHOmOEN4g9oZXZtSFDa6uJ0kAVOTjCBYdsfn9YKCnQJRItlo3RWaQ0lpQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxtDxpJGxEw7tXLBgUycjUWV9vHBP5LwgaDMCwQlxTWuehB69wn
	grIxn0oCp7yQjjGRQ/qlx8PE0be1OXJ7lTMpjdd2c4vl24fGV6arbFkFYNQHSxiR5Dw=
X-Gm-Gg: ASbGncskoI3DoRTKOBt7Y9zegNo8znO1AdEMQv7700/KXbNUjAZSnmCFel1GYBWQpWx
	oMmTBqbqqvoqrdW9QZQCU0aVacBQzeek9tUmDLhkxontTWkbsA7QRNIMCbE4/2TbmdXYwrmvEg4
	4eiQj7ouYCgzofhySkBOvoV49qWUIPzQlNBiE5gVxNwlpQNDKx1v0T+VLAdyKVvFPs8bDbUI6lZ
	ZzKGCHKl1FwRp1mITqLkOpVclhe9EnK8y3w1/sMj7fXhmI0YLTvr3Ir0Vv7l03nyyI7g1uySf8s
	R7PRirPRvOuuZNgACLthiCtQ/Uhc/4UuONnWHOIghLpWqv5pYn7QkNOPusHKBwfFzSZ86QJQzZt
	2+HIvV5pnpT+XGHkH0UO/b7lITARWhqV1B7VUU9Fsq5sjNagvZL+prHLc1nTJ
X-Google-Smtp-Source: AGHT+IGJ8sAMfpJnZWaTVJ0W+e/q7g1M9AZrjsO4AxgHJf+hW740JklhqJ+pVd4Pz969wiFCOlmfiQ==
X-Received: by 2002:a05:600c:4709:b0:456:1904:27f3 with SMTP id 5b1f17b1804b1-45619042aa7mr79771555e9.18.1752577909564;
        Tue, 15 Jul 2025 04:11:49 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc22a8sm15196012f8f.34.2025.07.15.04.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 04:11:49 -0700 (PDT)
Date: Tue, 15 Jul 2025 13:11:47 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
	Pohsun Su <pohsuns@nvidia.com>, Robert Lin <robelin@nvidia.com>
Subject: Re: [PATCH 1/2] clocksource/drivers/timer-tegra186: Avoid 64-bit
 divide operation
Message-ID: <aHY3c1bAdUmxoN6_@mai.linaro.org>
References: <20250614175556.922159-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250614175556.922159-1-linux@roeck-us.net>

On Sat, Jun 14, 2025 at 10:55:55AM -0700, Guenter Roeck wrote:
> Building the driver on xtensa fails with
> 
> tensa-linux-ld: drivers/clocksource/timer-tegra186.o:
> 	in function `tegra186_timer_remove':
> timer-tegra186.c:(.text+0x350):
> 	undefined reference to `__udivdi3'
> 
> Avoid the problem by rearranging the offending code to avoid the 64-bit
> divide operation.
> 
> Fixes: 28c842c8b0f5 ("clocksource/drivers/timer-tegra186: Add WDIOC_GETTIMELEFT support")
> Cc: Pohsun Su <pohsuns@nvidia.com>
> Cc: Robert Lin <robelin@nvidia.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---

Applied, thanks

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
