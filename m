Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3E8222590
	for <linux-tegra@vger.kernel.org>; Mon, 13 Jan 2025 08:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736756716; cv=none; b=hL7YBlnfqNNhn8KqRl3GsUPISrW+UNdzj1WUTlNnDhzrEpJvV/k9vqp6HBM943fyQ3eyCZ2Tldhqd0bjef6+u0jMgiDaJQEOV74x4tkXkR5wwzesAtxBUYDucFBNb8xmZ0GJoh3VhTz4Tcos0DimCZXEpB6RxKC6lmY7D7HsZK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736756716; c=relaxed/simple;
	bh=5t/TrcuXNWNUZTuS5pgxHTJQKuHzmhw4UrOTlIJ4BOg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QcVsB5JsE7iPBpnOdMJcmqcF0FOC+755+oUTtM8YE4vxQ+JXnzRnZQ/cTwGVcvuHSR0xO+gfTfe0B1kR4KzT1SzOwCfGmjsQQAL3QGS4KtwwaDM4QTsJ4nV83ycZWT0rlnXvg1gkgSj6Z8L/HReRm4tnCZaNiba0q8MjTnEmpZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VKuIxveU; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VKuIxveU"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53e3778bffdso4126232e87.0
        for <linux-tegra@vger.kernel.org>; Mon, 13 Jan 2025 00:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736756713; x=1737361513; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HsOOejTFjVwFwvDCfWyTG69OVT7YoO10LJVJy5N++GA=;
        b=VKuIxveUwLt3RwsqOf2zdz43fjhwd0REq9TdceAA/AAgp+Mdq4Xba5PE9k0BGFuQYC
         os/xvPD2AjzWp+rKOF0LSlfm/D+H3qhAoETVYKVRvm0fXYE6AH3nNGSzfVN0WPORmacE
         JC3gAoqoXA9b8wBsoqzvLU7QtqIueS449tgcs1PLWEBQbV3Dnh/KR0RJnJU6AG66vLri
         cp6PF9f8RLLKT2F6gEng47/DpBkELHIAYTSNM4pJZ58RB2bj79hAMp6A1DfZhXsdRqxf
         u0jeUEuMvigo4bzKtMTApw4aMEQkPQmFClP7E1Yz2/Vfu45v5qrDCtsXDcscFEaw+Tr6
         6Ctw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736756713; x=1737361513;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HsOOejTFjVwFwvDCfWyTG69OVT7YoO10LJVJy5N++GA=;
        b=Fm78YvVxkjkvvaI4PgioPfnFKk9dp9A0i9p36isym2NrEeB8jzQoh7bEP+xExKVVvY
         /LqD7tV/Kxj7bJBfnkCiF1Nn9s6JSRKw4T7sXm3KYpot+pT8rZReU4dPoKxtCLXodyzV
         lPdgDTX1gDsYO+0g9JhkrGrEla+Td4ZMVKFU9JzCYKTkgESa8DKV16+AdZ0UT+JM1r/g
         Nezkl0X78v50597DyJdwlUV5O/i0hKbJAcGlACPZo8m097T6U8iB/ud60sN/W76YGccC
         mFLIoOsqjdYRXSWOrOXG2YJPVbjrob9hTqSqH1tXyzGeuQaaF0VyIdvKKFMbD2bL5+Wf
         z9Kg==
X-Forwarded-Encrypted: i=1; AJvYcCVsVGpLPPMRsriiT7T2aQrO+T/qHdA9FPbojQpZtgR3mANJD0nKTZxwhMtOqDe98xpmH0kLVzL/WTnhuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQa69Rw3MdlfeUgnNHhyWu9KcrJv096mZ+PjF3ML/8Fg378ArH
	f04ZHJy6xBuWSkr8gaEYxMJomwk2hLm4Zbr8lvGE7H3ogYwKat2TwA+SnVAgJO8=
X-Gm-Gg: ASbGncugKvTHRQpAprdUgNzpPND6E3fDlEJ29TweXlpCms5U+WBUPPQTfxabsjc4ThJ
	q52Xhn2Mc/6laKYwp7oAJ0/9uzJbTqVMKmEEqdLJZ3PiuMUMvLL4JcdHykP+5BIxGKsJ9bHjeiU
	63dy5YhXcs3Fgx/amUUa90IB+eVLjyyO1iglx2vLpxSuZNrtQt0SvQdnSverd704jJ1vWtNL4EY
	svRCbK+as85dkkI6KjOltdDKoVloYdVnLxn9e1MF1C3sFR3FgfMiDGZLHxdKft+VBI/HXrIJ2M1
	JzJ96S+upIcb2H8PB3rvRb8ZWulfCsSTvttW
X-Google-Smtp-Source: AGHT+IERZWZtkZrsbkHThnFiBHKfz//tsYW/urMLTgJODZNi9Tp473Grr1NqQ4M0NySCRCOoV5n3Rw==
X-Received: by 2002:a05:6512:138c:b0:540:2188:763c with SMTP id 2adb3069b0e04-542845b0b55mr6338144e87.37.1736756712614;
        Mon, 13 Jan 2025 00:25:12 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428bec0659sm1286326e87.185.2025.01.13.00.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 00:25:11 -0800 (PST)
Date: Mon, 13 Jan 2025 10:25:09 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org, nouveau@lists.freedesktop.org, 
	virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org, 
	intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>
Subject: Re: [PATCH v2 13/25] drm/msm: Compute dumb-buffer sizes with
 drm_mode_size_dumb()
Message-ID: <bbw2n4ccn5jlq7q7lsw3xdnbieazgexkwkycrqvk5aoiq5q3wx@nz6gd3unwkg4>
References: <20250109150310.219442-1-tzimmermann@suse.de>
 <20250109150310.219442-14-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109150310.219442-14-tzimmermann@suse.de>

On Thu, Jan 09, 2025 at 03:57:07PM +0100, Thomas Zimmermann wrote:
> Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch and
> buffer size. The hardware requires the scnaline pitch to be a multiple
> of 32 pixels. Therefore compute the byte size of 32 pixels in the given
> color mode and align the pitch accordingly.

- scanline, not scnaline
- the statement about 32-pixel alignment needs an explanation that it is
  being currently handled by align_pitch().

With that in mind:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  drivers/gpu/drm/msm/msm_gem.c | 27 +++++++++++++++++++++++++--
>  1 file changed, 25 insertions(+), 2 deletions(-)
> 

-- 
With best wishes
Dmitry
