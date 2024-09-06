Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397F71C9853
	for <linux-tegra@vger.kernel.org>; Fri,  6 Sep 2024 09:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725616597; cv=none; b=YvCPXB0t3Cvp8EWYD39AkzUNLw/ofXRs7nfB7WVi/VRHWqIOoc5t+UqgML8IcLNnk7q8SfJF5QCHbIb1VeAAAvSZuawHO7Li3lBhRNH7zUveJ6R7InNu3yK5Z+G2Fq1bqGbEV/kn1RU2UG5W9Scb9MJwJ23jv214xgPs3Ko7zhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725616597; c=relaxed/simple;
	bh=CWG5M//CcpbxjWAbYqhipng8zW0m8WVrV/G90iI9XIs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UAFEaFHgb375CH3TugVbaVgz/MOMogaokPdCvYh3UxX/R0ut4ywH20MMAOB9EoztxCIJ7YS6rcn3ewDSZxwiVEKmqhgpKFjHZuxMwVdx5mHdemVHcsA+GZIBvOxBVYvirgvON4rWRcWQOB9iGfwaGAFVOrB48phl8ooXzaKm8x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kObCcCaH; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kObCcCaH"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-53659867cbdso653381e87.3
        for <linux-tegra@vger.kernel.org>; Fri, 06 Sep 2024 02:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725616594; x=1726221394; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v9FCxUIgBt78ivuRYf8E0aPqYHoOPKfCvJFGhphZooY=;
        b=kObCcCaHY/uMN41q+oeQhS/yUVDOJCbThnO9dgm2cLFxOWM92vimxeO2rddsUrh2Bd
         4G6y+c6VX4PZIsZwUFHKhfQJBYGj/hbd3twiy3Jzg7pg3QwdPDtAmFbJKcrx1jYUlYqh
         yQu2sDq3yTYVikpRhIn9eooVlozpHmrn+kS2/B1YFFqm18eqBiqpLis61pMr3WfowTif
         M1OUS58k5RiR1b1EphFjdkAEc8Qb+jym0whBwPO81gXY2l0XedmPEa11ivCr/x4erDoA
         OZ6w8av1s0MnVZ6RbKmAdnJrHRewgaYVVimSitUq6MA4dhE2Y1GUOcA7xsl7C32uu6fn
         l2jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725616594; x=1726221394;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v9FCxUIgBt78ivuRYf8E0aPqYHoOPKfCvJFGhphZooY=;
        b=uGrrZYNaaMuuZ8ChA76bNFNJNKzJS9LY7v1EeHaYZzBju2oRiv3pzPsRX1wQdE4r89
         vuo01i3zTm93neVB6tNrZenZFLTOtSWsFt8kstMvcTeT75HRvFOMcQJsOBXyIrA8MYPk
         P5uopys9hO7QMi0Hhyu0HDEnFsoURpuH4Np8hgfBXW+I7e7kAretWh+ieGAdGKfYYkcz
         ouScu6OO1Ph7H+pNqB+u/vMJ6UNajvjvoBMHYd/irq/4gEolXY1Hhv242/iM1PRj//qw
         8Rs8mO+1xldloNp2S/6Iw3K/hIexttc8xMH1vbsh125UV75Cd6VIG0lQuIKb6O38ZmEs
         R66A==
X-Forwarded-Encrypted: i=1; AJvYcCWPN2rS4ZVV9/L0Ds4dzvNCvDS0hxOu9Hn+DuQ2Nw79x6c+soNq72yKUJ3H0VH4HXA2B3VXNW/jTG0DQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4seNj+wVP9jOw+mVy3pEkyn+eofeFVAoaE27PGTqKGiTw3iCW
	Ib7BzxNkzo/I1LaJjQbYXop40b3Ppy9hxvI3MGfdi4+wBgq3ayt3AahaGNBHIz0=
X-Google-Smtp-Source: AGHT+IG4NjSKk9CJsxL7X661oGVWb4dJGK9kAqeeKA2OE5R1RdOgN5Xic7eEYM/SdgbXf1sQD+KCfA==
X-Received: by 2002:a05:6512:3ca2:b0:533:45c9:67fe with SMTP id 2adb3069b0e04-5365880bbbemr1607806e87.48.1725616593689;
        Fri, 06 Sep 2024 02:56:33 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5354084edc5sm2826881e87.279.2024.09.06.02.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 02:56:33 -0700 (PDT)
Date: Fri, 6 Sep 2024 12:56:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: laurentiu.palcu@oss.nxp.com, l.stach@pengutronix.de, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, 
	daniel@ffwll.ch, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, p.zabel@pengutronix.de, robdclark@gmail.com, 
	sean@poorly.run, konradybcio@kernel.org, quic_abhinavk@quicinc.com, 
	marijn.suijten@somainline.org, thierry.reding@gmail.com, mperttunen@nvidia.com, 
	jonathanh@nvidia.com, agx@sigxcpu.org, gregkh@linuxfoundation.org, 
	jordan@cosmicpenguin.net, dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, freedreno@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/5] drm/imx/dcss: Use IRQF_NO_AUTOEN flag in
 request_irq()
Message-ID: <dgrmcsmqjqukta226byebvbdopcxqapq6kaf62nmttbbgcb4vk@ptkkp3672v5k>
References: <20240906082325.2677621-1-ruanjinjie@huawei.com>
 <20240906082325.2677621-3-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240906082325.2677621-3-ruanjinjie@huawei.com>

On Fri, Sep 06, 2024 at 04:23:22PM GMT, Jinjie Ruan wrote:
> disable_irq() after request_irq() still has a time gap in which
> interrupts can come. request_irq() with IRQF_NO_AUTOEN flag will
> disable IRQ auto-enable when request IRQ.
> 
> Fixes: 9021c317b770 ("drm/imx: Add initial support for DCSS on iMX8MQ")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  drivers/gpu/drm/imx/dcss/dcss-dtg.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
