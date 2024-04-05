Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A115016F827
	for <linux-tegra@vger.kernel.org>; Fri,  5 Apr 2024 15:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712330519; cv=none; b=dbLjOV8k26Uaxgj6AjzFQqpKFoEGlq6gIVFGp/LnkeVLDlnl0ksfOFAbghxmFptnkqaSLkm2uA0C00YR3BZ4fBzj56qiB9aI5Tk5474RzmLo+stWIXA9SLBEVyQxZZCYnb2D+YoEC6X9gb9DIVTQIJEtswT15ONOFZv/B2SKz2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712330519; c=relaxed/simple;
	bh=M+C6kB8COCugWtBVJQ9w3j4a/ALFlSRuRh2dv+HgEXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rJAZmmBM4e68JcrbJiWGqbAUVfHWiHt1lRM6K9fhwcc3ToRJ3kiCzfLrRzqRF2MGlyawCU20Dy/c9p0b7SwZZ3MZDQw5aqAFS6dglOArqFf1mHcEQwg85iUjL0NYhAbrq8/yaw+5/MIXDOVqKUObvM/wzTa0rZ6trCxPJdOAn38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lj80CzYU; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lj80CzYU"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a51a7dc45easo86627566b.2
        for <linux-tegra@vger.kernel.org>; Fri, 05 Apr 2024 08:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712330516; x=1712935316; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wk3aJOuT9jJjnBQJ7S21VBi6MvBUeayUBXb/L6EPJ1g=;
        b=lj80CzYUDzVCB7tO93u7rBl/WbmxYIJHi0iKlBlSlHtqNwa7WONT39n+Jtm6jQw3cy
         RcLpQDoFDQOoOcWljC3ARvfTP6ZGyIm3YRTsYWU4mcawSbXtHVk9S24A/pEwx6i+QD64
         SPpJkxMFsCqAwtFR2d4bC3WzlV32E2Yyis8M+5wGEzGZ/ZQvNhVH5Yfz7aa2JaF1TNUX
         wdirAd5EEgh6jno9weLyJmfTkf54yydQs7IqrNgqnmgOfWKChGGDfxxfB6Oo44jDwuM+
         JhU5FJCvXV4qnLTuYUzyqlcLZOCruJbNHTVcf7UN85VRXZM7GI5f5zB54ftloEE4l4o1
         iSww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712330516; x=1712935316;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wk3aJOuT9jJjnBQJ7S21VBi6MvBUeayUBXb/L6EPJ1g=;
        b=DHORYQCgbW2tdmA05lKh175v/vzeNDGrCGDtV8yBwdstKf1hmvIpyW61STo+c19wVV
         PFMZMaJ1N2hUwzCYH8U5ZTN2pvFD2AXRtYHKBQHidx0IyRfE0HMpYKE8g2v8DH6uRqmk
         4XflkIs/rp0R4am/RVz0UYfL2BYC27GMj0MQEYPf3u4TY2Kro0zPNXNsKU7AY12psrnH
         Re75SJ4ZJJT8qBu8V5n2jb4ypELwWD9U+utaafsjMBxU+cIzX8zlzHt06J3cgIe2GoZ8
         pBF+rgQqmXXe+C5/lwJGqW2VNJXERI8r1EG9WpESYeGDzrIv1sJHV5sZauxkNbgMBtNC
         7V+w==
X-Forwarded-Encrypted: i=1; AJvYcCUFyJQ5CbzWYinQklipKZR0uU9U/XD/KFWJSUCR0h67bAYYySclsSR1pnQe10J/j/B0Pdg0OFQA0ghRtkFXnZNdwTFb/vH645Rh71s=
X-Gm-Message-State: AOJu0YzTGmJEZabwI/cOXN4mo1gWreA/Au6agLNQZNSt63eSV9PUDkd6
	aknOjL884onrH5ZwqmXZQ2qAaNM8sqfknH1TeYEgBoJif04Dtauiuec6titdSCs=
X-Google-Smtp-Source: AGHT+IFeW8SGAccDZXSiMG8bevZ2189mZMzmoSGN1nz4sPYc1a2++KWM7JhjHkLHCa1sSWe+qrbKmQ==
X-Received: by 2002:a17:907:7ea2:b0:a47:16d1:113f with SMTP id qb34-20020a1709077ea200b00a4716d1113fmr1785649ejc.47.1712330515736;
        Fri, 05 Apr 2024 08:21:55 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id j23-20020a170906411700b00a51a676c596sm804886ejk.121.2024.04.05.08.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 08:21:55 -0700 (PDT)
Date: Fri, 5 Apr 2024 18:21:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Marc Dietrich <marvin24@gmx.de>
Cc: linux-staging@lists.linux.dev, linux-tegra@vger.kernel.org,
	gregkh@linuxfoundation.org
Subject: Re: [PATCH 3/4] staging: nvec: make i2c controller register writes
 robust
Message-ID: <f213c5a3-6a6a-461b-a4e6-a8e768e8ea4d@moroto.mountain>
References: <20240405140906.77831-1-marvin24@gmx.de>
 <20240405140906.77831-4-marvin24@gmx.de>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240405140906.77831-4-marvin24@gmx.de>

On Fri, Apr 05, 2024 at 04:09:05PM +0200, Marc Dietrich wrote:
> The i2c controller needs to read back the data written to its registers.
> This way we can avoid the long delay in the interrupt handler.
> 
> Signed-off-by: Marc Dietrich <marvin24@gmx.de>
> ---
>  drivers/staging/nvec/nvec.c | 39 +++++++++++++++++++++----------------
>  1 file changed, 22 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
> index 282a664c9176..9914c30b6933 100644
> --- a/drivers/staging/nvec/nvec.c
> +++ b/drivers/staging/nvec/nvec.c
> @@ -565,6 +565,20 @@ static void nvec_tx_set(struct nvec_chip *nvec)
>  		(uint)nvec->tx->size, nvec->tx->data[1]);
>  }
> 
> +/**
> + * i2c_writel - savely write to an i2c client controller register
> + @ val: value to be written
> + @ reg: register to write to
> + */
> +
> +static void i2c_writel(u32 val, void *reg)

I'm not a expert at kernel doc or whatever, but this comment isn't in
the right format.  And delete the blank line between the comment and the
function.

/**
 * i2c_writel - savely write to an i2c client controller register
 * @ val: value to be written
 * @ reg: register to write to
 */
static void i2c_writel(u32 val, void *reg)

regards,
dan carpenter


