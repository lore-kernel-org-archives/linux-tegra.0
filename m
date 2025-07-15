Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0425192D8A
	for <linux-tegra@vger.kernel.org>; Tue, 15 Jul 2025 13:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752585421; cv=none; b=nRQhFQbZUf3SCp+oNOjr1ukA0BuqajJ94mHjRNiR8Pw9dHTmxp+Baco4D+PoxSUmmZhkdlUe/hHsqsf+6AgLBwXCsEfmmqD4GEnqxU2yUVrt8jrG9sKF/4FITugGQHmomiNLhiPfjw/86IPDOcLsWcmkL7tK/hwpsn9HL6BUKEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752585421; c=relaxed/simple;
	bh=dFmrbwT1IuJaq2eM843QLMLaN8X2ByqM2Iz2JBnmOAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EX0Z3K088ugiKzjAHXYd/g3DT1HhqQObefmosSFbx7DjpDH37RMwVCcU3DyDsZ7pb4zLr6fEER8XvFd0SYOvu9ysnKhe3TP63mI35AAy0FweQ7TOKNyFMbF/IavEvAQbx+TlRsxQH0JiwdqOuQgjrhqvhH5EQtxHDqDU0++Pqdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=fTpF4ECL; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="fTpF4ECL"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-455e6fb8057so41650135e9.3
        for <linux-tegra@vger.kernel.org>; Tue, 15 Jul 2025 06:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1752585418; x=1753190218; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7oxcnIHUFGM9XgAtLrDfZFgv0IUYHjLuIAuAxAwmdIU=;
        b=fTpF4ECLdLhE0wD3lXcRZ4KTrWzqmS2nk/co3W/69JNgtY3n/JcPC9Yw/jNkex+g6X
         uJYeSgx80XvoKQI+pqaYqi2+IoyoRy6jMDLMYaqjPQhk2/R5pme0nwlS0IvuqnJkd7ng
         d017O5HHtgghu5jtdnnZtZwfUCtDNmMaa6dBo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752585418; x=1753190218;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7oxcnIHUFGM9XgAtLrDfZFgv0IUYHjLuIAuAxAwmdIU=;
        b=YSOyZQwVeoLhRZSZZQXfmKrmHpKUUc76qAfFCqECxvJxU5wfi2ZZUkpBcwJ2iIEzIR
         pOEPFBTSwxdWH7/B9MFIR2iyhPeZXpU5X+41ACa6ICnXdIP43+7pXRfUjSTN/bHRO/VD
         EWJSc25JNV+mcQTQXBZCLeaQqd6bFkLKKhSGYqpU4WobHjFbcQ2c1RefLr6iqKlbKJG8
         h/DFfbLgFa8LbAvByJA5aOKuYfKEdX44CWubE+qin6x0Z5WgR3aNmpDmNiF9kJ3ZSXP0
         R8+Yp1JStPZ56KjJfPxak3rqGq8ptZ+9zFYKWzxWdjLKbvywOLK5NkoSLP8pR5LuYipm
         9DHg==
X-Forwarded-Encrypted: i=1; AJvYcCWedfpWusPe/2Ok351gMYdjr8WlmT1saU1Lq+Gh/TzdJYyzhUcufPfxKDgUb5aMDHMpBuM+/u2oJps2zg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1zNWJL6SKRe09cirq+uF7gIgjx+6LIT5fCJ91hQw+v5Yot5wI
	ccyQ4jnhWlbvQK5gDyIKep/MptYqdSEhX+Ewm05yuHf1SeaseKe473VdXLdYFXZNzlo=
X-Gm-Gg: ASbGncu9pwY4Zyon5R4zWlY2mMDrAHxjuzvK9shTvzGWYbOmCFGUYOBw4OymNUWy1LM
	n/wI5qmHSzY6Xrbsp2K9tjnsYWEdiM3KEgUroqwMxKqTS5tb7oShRj0XcSGQkGPzQR8jplnrFwH
	91thILEplDu+s/kXjbEuKUHgyTJcY/Jo8RPOcSW4SKzCo34Thd2pm+rJJIeiVlPTvwr6kfop2WZ
	gSSDwPV78AoD1Dw9+GpEjeID/gAxqXuD1MzoGRCJttfZ9fUS4jOv+eem+7cHPGutd5vnCrN/Ca3
	0jX3qEGSLXPs6vfmuZCqb2ZsPA1CihFpvajBD+eyKO2fs+HbMXzhVlB3UHB5EWBtA/zuxVfDZSl
	5PuuTzPSr/3tuI/1nH/UUWpTKv+qXfze5BQ==
X-Google-Smtp-Source: AGHT+IF6/YjsEXq6Q2lwzXNbCW3+FTVujjcrP9eO/s3mZxOODp1c3RGVgSacc6YHmi98kBgi2QH/KA==
X-Received: by 2002:a05:6000:2f81:b0:3a3:7baf:f06a with SMTP id ffacd0b85a97d-3b5f2dfdd45mr13263647f8f.37.1752585418009;
        Tue, 15 Jul 2025 06:16:58 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4561752340esm71577095e9.38.2025.07.15.06.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 06:16:57 -0700 (PDT)
Date: Tue, 15 Jul 2025 15:16:55 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: thierry.reding@gmail.com, mperttunen@nvidia.com, airlied@gmail.com,
	simona@ffwll.ch, jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] Revert "drm/tegra: Use dma_buf from GEM object instance"
Message-ID: <aHZUx4dJw1WtetyQ@phenom.ffwll.local>
References: <20250715084549.41473-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715084549.41473-1-tzimmermann@suse.de>
X-Operating-System: Linux phenom 6.12.30-amd64 

On Tue, Jul 15, 2025 at 10:45:39AM +0200, Thomas Zimmermann wrote:
> This reverts commit 482c7e296edc0f594e8869a789a40be53c49bd6a.
> 
> The dma_buf field in struct drm_gem_object is not stable over the
> object instance's lifetime. The field becomes NULL when user space
> releases the final GEM handle on the buffer object. This resulted
> in a NULL-pointer deref.
> 
> Workarounds in commit 5307dce878d4 ("drm/gem: Acquire references on
> GEM handles for framebuffers") and commit f6bfc9afc751 ("drm/framebuffer:
> Acquire internal references on GEM handles") only solved the problem
> partially. They especially don't work for buffer objects without a DRM
> framebuffer associated.
> 
> Hence, this revert to going back to using .import_attach->dmabuf.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/tegra/gem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
> index 41a285ec889f..8ede07fb7a21 100644
> --- a/drivers/gpu/drm/tegra/gem.c
> +++ b/drivers/gpu/drm/tegra/gem.c
> @@ -526,7 +526,7 @@ void tegra_bo_free_object(struct drm_gem_object *gem)
>  		if (drm_gem_is_imported(gem)) {
>  			dma_buf_unmap_attachment_unlocked(gem->import_attach, bo->sgt,
>  							  DMA_TO_DEVICE);
> -			dma_buf_detach(gem->dma_buf, gem->import_attach);
> +			dma_buf_detach(gem->import_attach->dmabuf, gem->import_attach);
>  		}
>  	}
>  
> -- 
> 2.50.0
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
