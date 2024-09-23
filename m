Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0121010F9
	for <linux-tegra@vger.kernel.org>; Mon, 23 Sep 2024 04:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727065289; cv=none; b=lTmgxuDn28NRq4+E41ZudsasWMpmysIVJWyXHBY+J254VG7XgM1ofOSawbh/9Dh85fnSXaEdfSil+Wo/+sxChm4hC8DLTEfyFHtj+6Zlp7eHoIVxbcUZmtN6lXReidWvaBGTHzShZZH03pxeCDaLFauSbzEJ1B6rBKeEYnCpzpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727065289; c=relaxed/simple;
	bh=L+Glh8hWjbOoHsZKdJ3/1RNtLIEeyClz1ZCDMzjs6ao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=btgC7LJ+x7t6ibzMrNwy3Xge+rS4pzzBALDzxB7mChlFmzMouo/ITrs839qO0lLZYzjuNsQm5Ya3dEOT+nZJjpg0c6h63iezA268nJPPp4jct+SiCe8aduJbaUxWIVkXFOONyovqdqP81hvq6rGYxSIjOW4TmWFVB2uIxHRUkws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LstNfCVb; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LstNfCVb"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-537a399e06dso139184e87.1
        for <linux-tegra@vger.kernel.org>; Sun, 22 Sep 2024 21:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727065285; x=1727670085; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9UX30i2zA4yW1Ql73C0KW0/A+BlKe7ZYSoQVaMBiTug=;
        b=LstNfCVbMWdPhNDi/USfJ8lxNkFB+sld8PhrPImYEpfwjYIuY8cjWF1JctDj5UV2gB
         Tgv4zOovMyQPtJfm9q+6Q0YlD8gdMqvaEMS+UfWQK8KNkxeeezGrO+y6dAVr6mUxoJvt
         9VAMEDOBHMakWbRF6ZpaFJQKRHy3kn28sjHip7XOb0lTlYRcGIp84vgWkHAncCDFP4UQ
         JzRT1ZfPMQDg1ZrXk0V3XPj80NRNhNxI2fONsr7WSqUJe2AZ5RzToWQMK4KwwROGGshq
         REL18TTORBEiDEKGoA371vw3MBS6HFqiSpyjup8s0R6KXfnWBSRby2W0QK5JZwv4aksY
         LHSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727065285; x=1727670085;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9UX30i2zA4yW1Ql73C0KW0/A+BlKe7ZYSoQVaMBiTug=;
        b=Ntkc1R1zEMFq5uNPK6YRbWKFtNXdoipevv8UZCFUPZT9Xnaa696b554gDN07RnbO2I
         +mzrFqGfO4pztuCcEFveTeBl2RvNE75ja41mRKL4TizHRMy+LYjCsRq/L8tb9VjfREL5
         4pWl8ynJ5vALWOf2gyP5Ky6lmc2VKZ8Qob7E73fMJ3reduZD7IW7rouZw4qyvJ9RCwjR
         ezVHb0t7hjlildwR7ogfeyd2Q9bCUW3sesb4igAzIxN2Ot4sgqAQLFW71nj/mR+5uU45
         q9n0b1qi4S7GKprqH0TCJjj1voM2mm0YyOAx7WpEQj/9L3FyoIkOQaLAorWpf1DWIJHY
         TpEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWs+zbF1R6tTIaxvRDjZcxvd3uslYWrmicYi0t21wMm9dGUH6Nx6vfGZS1weoD6raSvbet1WTNdzelvEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLUya3z2Ea/j5SaoMSvJzixyXoWKzLWDN6mMQ07uP85TZINlmq
	1Uc4yHbt8UYidb4PFFcOpyR/XlK+gzRUJeT4vJNAXWgEBwbbowYowjJ4et2JrPw=
X-Google-Smtp-Source: AGHT+IFmiYTH3GZizsvWgDordIgmbGnH+InAibsj8y6AC510eeUrKn0wOi5xlapFZC+j7h0tvVCVfQ==
X-Received: by 2002:a05:6512:ac9:b0:536:53b2:1d0d with SMTP id 2adb3069b0e04-536ac2d03b0mr5038212e87.9.1727065284533;
        Sun, 22 Sep 2024 21:21:24 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-536870a4647sm3137008e87.194.2024.09.22.21.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Sep 2024 21:21:22 -0700 (PDT)
Date: Mon, 23 Sep 2024 07:21:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Liao Chen <liaochen4@huawei.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
	rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, 
	jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, linus.walleij@linaro.org, 
	thierry.reding@gmail.com, mperttunen@nvidia.com, jonathanh@nvidia.com
Subject: Re: [PATCH -next 2/3] drm/tegra: Enable module autoloading
Message-ID: <3ttycjomydslmaqtwnhjehrj7pa7m2i2daqd46kwd2tsxynr2t@jo24br66tz7b>
References: <20240902113320.903147-1-liaochen4@huawei.com>
 <20240902113320.903147-3-liaochen4@huawei.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240902113320.903147-3-liaochen4@huawei.com>

On Mon, Sep 02, 2024 at 11:33:19AM GMT, Liao Chen wrote:
> Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded based
> on the alias from of_device_id table.
> 
> Signed-off-by: Liao Chen <liaochen4@huawei.com>
> ---
>  drivers/gpu/drm/tegra/drm.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
> index 03d1c76aec2d..1a12f2eaad86 100644
> --- a/drivers/gpu/drm/tegra/drm.c
> +++ b/drivers/gpu/drm/tegra/drm.c
> @@ -1390,6 +1390,7 @@ static const struct of_device_id host1x_drm_subdevs[] = {
>  	{ .compatible = "nvidia,tegra234-nvdec", },
>  	{ /* sentinel */ }
>  };
> +MODULE_DEVICE_TABLE(of, host1x_drm_subdevs);

I don't think it is correct. See how subdevs are handled in
host1x_device_parse_dt(). I'll pick up two other patches though.

>  
>  static struct host1x_driver host1x_drm_driver = {
>  	.driver = {
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
