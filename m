Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A084C3A6B67
	for <linux-tegra@vger.kernel.org>; Mon, 13 Apr 2026 08:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776068509; cv=none; b=EDnwLbkiBD5hK2we7yY9Rtj82bJnYpOeF06vZ7ZpLokmzrNMt+m8vkFHTU8wer0LCQZdeO0PvdP66qe0YCX1N1UbkZCHHN/KA5cBFWOJH9jXy0h514sEg78wZkpI6uLvFoOpFqs2g+Yag9w+7/2LpCf6rt2YURnmAli3D/b9aHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776068509; c=relaxed/simple;
	bh=quZVGeXcNSTruvSPIgy79uCUxaqv3oB1d3yNl9q1uts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oKulHtjQJ5HFxUn/+e+yjgLwJMq5sN411bOa+BsTuaTgSIrZDg/bGbFrWTfvgBJJjHfx71+OpMTx+pynPZMIsT0sEcnAts3jg77YqN56V1jp/sw0i1M1S5sp4TTZjMiJUU21U+jiOZLy7dbvUWUxD1HW8Di1EEkITYF4ppQGh4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WsQWyFya; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WsQWyFya"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488b0046078so40297275e9.1
        for <linux-tegra@vger.kernel.org>; Mon, 13 Apr 2026 01:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776068506; x=1776673306; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VxL7NBpm6fOiY9vFikulF9wM2xEFgsGl8u5ELNG6Df8=;
        b=WsQWyFyadxdk+p8rSmCTaGlmmDtC2juXjHGMQbik8AhB/DcqWigBmMITpWsjl+vpVp
         OY35HPgyq0I6IZ7l9L7aKSQ0kBDjRCcT6icuA3bNVevn4L3NC4m8wlyU1SvCuorn6aRK
         P9PCoW/fbFf8NV7njSlyFZaVj/6CKMH+s9j8dNUQv92nBzBf1ubqwVcRBMdRE8RyJGks
         vspn2ZsIRP98NFAx69PC+5arXDNvh1QcJpmIPxtNZfJX+G9zKOJdnbUtoV1GWTQgZDFF
         JzCMbrXEC7STgJXaifAsEAahvFXLemwM+GHX9K6tjh309GrEGQ2IvEZOaXo8TiSv02It
         GFaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776068506; x=1776673306;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VxL7NBpm6fOiY9vFikulF9wM2xEFgsGl8u5ELNG6Df8=;
        b=lfDt1gJUY3s0HchKjHGWa72pZizEIIvknkYRvl97xDg+JTAM5hWxp/yMCWyGgP4X/V
         qeVR+mrwvmehLOxxnyUuRfEEVqo2xwr45BDrz+osYsDXygPx4u6mN+l01tqoQjIzyBgI
         vd4xrufJwIeYmpVk6wX8Gw4Iu7wgddV3Blpp0esYsPyTz+wnvYvKkkLcCkByQz4h5iyL
         rDRCrKg30leYLmu6vSb0R8CIP1++B0gWRPkarPCB7btgc+7lcyWxVvr/EUEC9YEmCu0+
         LebKNVETrpl7xnlAezv8peL+2gJ6D1cUtCXS98Y/Pz4MZJjcaPciJVwNxtlVfzgBO3DP
         LZMg==
X-Gm-Message-State: AOJu0YyBjQPAGnzfbcq1ePwyDHL261IT6l4/pOcNy8FExMm/ut7t6hDG
	kOjB0KGzGox5rhH7a08Kv2SvkRB9P1C/3RTbvhkOMxKaKnuK2L43bsa3
X-Gm-Gg: AeBDiesKTHZ30qjC5N7NGmYAXnjpVbE1sty4Lb3Npky1cLqHAc0uvj4veIuKE3vcuWI
	RTWLFaRPQCNECVFCDcinCaAv2QjNKpzwYWI0foN/DntU3VrjR4yO0stUgXvnQpuoT10SqlrsDp7
	TdQ6+05D15VzfZfyf0etRcWcS30kS+MXcL9VFGAvvJlVXNEh0sywcyegqPavY39mMkA9eDFvlYk
	JUa04wWvAED7iCkv2alWeRuLlzQwJhn1fC+ewlyvHDlyxNElI//D0g3KXUa9goQzFM0rqev+grH
	QJ/s3Yw4iEtUR1aWjDsLghBu/gt3kSfbPqrTjod9DkGvce6Ge23iOc46abytQ0yfO9Lt985yJV6
	ToEfedOfl8Ts05AQ9rrEN/psgqjnnKXrtrHemKdtBG132UMRPIQdWbTdigdoRNctIRHyAN4LXyy
	uYmhPRQQRzcgcBuc6U4S0=
X-Received: by 2002:a05:600c:8b30:b0:485:2f4a:6ae6 with SMTP id 5b1f17b1804b1-488d67bf79emr177041365e9.6.1776068505834;
        Mon, 13 Apr 2026 01:21:45 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5934a6dsm305318865e9.11.2026.04.13.01.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 01:21:43 -0700 (PDT)
Date: Mon, 13 Apr 2026 11:21:40 +0300
From: Dan Carpenter <error27@gmail.com>
To: Alexandru Hossu <hossu.alexandru@gmail.com>
Cc: linux-tegra@vger.kernel.org, marvin24@gmx.de,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] staging: nvec: fix pm_power_off teardown in
 tegra_nvec_remove()
Message-ID: <adynlKves3yAAcCA@stanley.mountain>
References: <20260412205117.387125-1-hossu.alexandru@gmail.com>
 <20260412205117.387125-2-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260412205117.387125-2-hossu.alexandru@gmail.com>

On Sun, Apr 12, 2026 at 10:51:17PM +0200, Alexandru Hossu wrote:
> The remove() function unconditionally sets pm_power_off to NULL regardless
> of whether this driver instance was the one that set it. There is even a
> FIXME comment acknowledging this. Additionally, nvec_power_handle is never
> cleared on removal, leaving a dangling pointer to freed device data.
> 
> Fix both issues: check that pm_power_off still points to nvec_power_off
> before clearing it, and also clear nvec_power_handle at the same time.
> 
> Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
> ---
>  drivers/staging/nvec/nvec.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
> index 75877038847f..9fe9b7a3491d 100644
> --- a/drivers/staging/nvec/nvec.c
> +++ b/drivers/staging/nvec/nvec.c
> @@ -907,8 +907,10 @@ static void tegra_nvec_remove(struct platform_device *pdev)
>  	nvec_unregister_notifier(nvec, &nvec->nvec_status_notifier);
>  	cancel_work_sync(&nvec->rx_work);
>  	cancel_work_sync(&nvec->tx_work);
> -	/* FIXME: needs check whether nvec is responsible for power off */
> -	pm_power_off = NULL;
> +	if (pm_power_off == nvec_power_off) {
> +		pm_power_off = NULL;
> +		nvec_power_handle = NULL;
> +	}

Linux power off handling is a known mess...

I wonder why the original added a comment instead of a test?  To me
checking for if if (pm_power_off == nvec_power_off) makes sense and I
can't see how it would hurt anything.

At this point, we're unloading the driver so nvec_power_handle is
about to be freed.  Is there any benefit to setting it to NULL?

regards,
dan carpenter

