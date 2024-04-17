Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C444C172BD4
	for <linux-tegra@vger.kernel.org>; Wed, 17 Apr 2024 18:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713377669; cv=none; b=ZOcqDOzuZsekG35wC4i/Q4Yy9UQYlcDa1cOwtarKkcKaCfB5Qu8csjULfG71A2yf4bLJUkvrYUumVyKEjdW5JvHFPd3/9XbkBaKRyZ8yIvdMK4Z0fqpFec7csotDCWMM2pju6gkdtBT+oahdEwkB3HuV5cH6zip1BJuNcI5i7Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713377669; c=relaxed/simple;
	bh=44mvEL9LmE3z4Q74332QHQlaOANjzoJbXCWYBUPZs9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gDdYJjsQpByDb2EwXYE1/+SPjPlaNycesas3Vtpp27EhDoR3dyMBYMlGy7uxT8G9Sr9gLYZyn+tJBnliK81Gx3eSOVAQXjFlsMFCH2bBsYbc/3WYD4ItZYBSE6MJB2QAn3Ag9NrFSk/id74XXWfcV/zYRszicJrq0H/XwfqOYHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E5HHOV49; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E5HHOV49"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a526d0b2349so479158966b.3
        for <linux-tegra@vger.kernel.org>; Wed, 17 Apr 2024 11:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713377666; x=1713982466; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2cWMdZoF58FwMMwIJ1ibz0W/2NPseMAHWyOcDWcJE1U=;
        b=E5HHOV49VwYqXyQPdya6211rwb2iYnz6OgWHDHYELMMdBi0evDTLkZuekzJ3CvCdlq
         3dqJTc8GLvvKGT+e37bDT5xfwp/mQiA4uBNDsPR3Njr8YB14/e2jCKL3acBsPi9WFqVQ
         sWeLs89FdGO8JdyBJkHbc5Bu17B7krgy+DeW16AU9lrDJK3jecJcbVdszecCzf9z+RLf
         ievKjt2t3At+yoPiZtFHKq+ECq6hui7h9slWlTZTz0jx1uvr+qF9/z7TdiI2xstEhkOr
         W3/SzjZ2nDbfAvxg9C6WRMUlolsrJ4CrqEZhXcQOajDFv2EpfLwTmxZ0VYEsUs6ctMse
         tr/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713377666; x=1713982466;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2cWMdZoF58FwMMwIJ1ibz0W/2NPseMAHWyOcDWcJE1U=;
        b=s4rV0gw09noHBAsXA9j5tyjBbXqo8meTSVhCqCxOFfgzcuwkXzHIPEnD0XjE0Rg3X6
         InOnG+LXSrH40z5IKu8qqjn0I9qpPXyEOTueHASZSbj9k80zfWpcLggDVJQL/depe9OK
         PzkJvwP1ESrQ1nO1flHKfSSfaQgMmuZPxBNir7HqQBnED6sP5TMAl8CopyCbryfDrL+d
         4Q2+HNqB5y2lds+Zh7b+e4RAbKvMJVXatPjw/PPS7YFNyTKdna7OgvCbzMkyOv+13+Ga
         g9+NxctNINDEtj9M8cnM73vfLsKsvKGEqFAskjX15cr+w9sW75lIT268tDrLeRpoxxe7
         zYhw==
X-Forwarded-Encrypted: i=1; AJvYcCX8I2peVf1yaTtbPqbdJG+gETrLOAImy1eLU59INa6HOGzeefuldlf87PVGH7WG9CIv5ChjZBD55KoC5lpzRHsrX/x+6US00YiIhFo=
X-Gm-Message-State: AOJu0YyFDH99o0IpA/kcLKl+D1go9yWagfzKZFHczJPZYFNsLMiFxo+e
	X/IQTzE4rbaVvxR/ud3rk3D6QmQF6tGAAsMUG4VjXIN+92i5qHIDa44w1FnNPts=
X-Google-Smtp-Source: AGHT+IFGHPodqd7/R0bXRRNmZ3p2XslIJpfPdkWTwgoxyQDqaldBLvcx7T7XbIu44Zm87knE3cgIgw==
X-Received: by 2002:a17:906:b89a:b0:a53:4cae:e40 with SMTP id hb26-20020a170906b89a00b00a534cae0e40mr183732ejb.25.1713377665887;
        Wed, 17 Apr 2024 11:14:25 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id s13-20020a170906354d00b00a5556cd0fd5sm1073935eja.183.2024.04.17.11.14.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 11:14:25 -0700 (PDT)
Date: Wed, 17 Apr 2024 21:14:21 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-crypto@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 1/2] crypto: tegra - Fix some error codes
Message-ID: <395f8641-0053-4a63-a33e-02e4f1ca79cb@moroto.mountain>
References: <ec425896-49eb-4099-9898-ac9509f6ab8f@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ec425896-49eb-4099-9898-ac9509f6ab8f@moroto.mountain>

On Wed, Apr 17, 2024 at 09:12:32PM +0300, Dan Carpenter wrote:
> Return negative -ENOMEM, instead of positive ENOMEM.
> 
> Fixes: 0880bb3b00c8 ("crypto: tegra - Add Tegra Security Engine driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---

I didn't mean to put 1/2 in the subject...  Sorry about that.

regards,
dan carpenter

