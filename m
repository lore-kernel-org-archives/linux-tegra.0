Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F19547046
	for <linux-tegra@vger.kernel.org>; Mon, 28 Sep 2026 18:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790618972; cv=none; b=QNM5xNJK5D8XM0ATcLnrwFQJ5uos9NGB+TOYhX0i8B8cgTBw79+YEkQLjzhHT/U0k882ON1gwYDsmBgnJcdQvsKOeJ7vGz3sfnKKaDoiR8CnM6x52dtvPz3aJd/pgMglQtbUtyzjnYoJ6h+C2hUUb/B947/pgLcb6+A7vp/UmP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790618972; c=relaxed/simple;
	bh=IJl8ZLVeSLK/3tm4qT2HpxIpgkaGExTUeW/aig9VFu8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=plXADwQ5E+/qN1cL0dedGKedfcr7Fi+D2RbZgYMA6QPqwpu6LtQ5FYZsVVSmcSWmT1ZLsSHOyTsKIf5adi+/YtDV33IoE+KOyDmB6nMSJW1JvzPd04CFsX+8in5orWTy3eOjlBQBlKZ/ZnWrhRBVe78iHruzG12dyGU+hG7Q3RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Cl4bJVb2; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=PYFbVzmm; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Cl4bJVb2";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="PYFbVzmm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790618970;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WblzAY3JRV9CtwzNMKeAP2oGeUzXJbmdjxKWRmzPjT0=;
	b=Cl4bJVb2yGMg418R/dWWSytlOLD4xTru66dMwgPYhwOdvR7JQ7aMGnWSaJHOrm1dqN4aWm
	1qmnhlqCykCul0iw/1urYyg7q44LptyqaR+Y3rBBQ/p0rPqgKAfF1P1FTiLkZcXALxNQqa
	XYi876v3i+nNO+RJLoq8ofQSnS94KGc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-YOB-oGYLODe13Qj89vllNQ-1; Mon, 28 Sep 2026 14:09:28 -0400
X-MC-Unique: YOB-oGYLODe13Qj89vllNQ-1
X-Mimecast-MFC-AGG-ID: YOB-oGYLODe13Qj89vllNQ_1790618967
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-49e745d5dabso32644575e9.0
        for <linux-tegra@vger.kernel.org>; Mon, 28 Sep 2026 11:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790618967; x=1791223767; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WblzAY3JRV9CtwzNMKeAP2oGeUzXJbmdjxKWRmzPjT0=;
        b=PYFbVzmmvZVGu/BkEygo6A2l/I0inpwH16sicqv/jgL8kEyBqZBILrYckSlQswYwiE
         n9DSKJordvyihg7YUPiR1aJO3+eGeSnXZxDznkw2o+4URA1bUudncN4zynoFiI4GOVbJ
         oLUsXRR2HEb7FP+KWcWE/PdX9WOmclUFC/ANinFByD720twiuaFqh3/h4qU5YRmMqh7z
         dq3IUVcB0BkeEzksBsvq+Ki8x4sYpZdNfvWGGyGp/t+VFT1/0xGo8ptIqcCxt7PJl9Be
         YipQYntnPiPoVuD89Ed+vGA76K6FyG1v8Mxo4z/ZGWT+MPUWoiB7fPvEJlczVqMA84Zi
         Kc0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790618967; x=1791223767;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WblzAY3JRV9CtwzNMKeAP2oGeUzXJbmdjxKWRmzPjT0=;
        b=LmCSdHRavwSpVqtmy+vyrv3B0N7n4zLSuGVmKzp8LOahT1KTEghrFJcI6gjb2p6ZME
         laldl/0Ip67/Yxk1E4ILXcMRRLPi3f8MXk2F6qqGVC5ziJfq6B7gdU8xv+qBboiEB3fT
         FkjXw+Pfh4GW7fIExM7KHwNxM+dZzLgXUtrmneqsUcGSzU7ughuAPrAzHyk8uMhXJfXm
         gVQzTLqDLP2QNevlhfET/FX9B98ofC35P0iMbc9PqyA6n9Htdcyi6ePBxz0P8Nntw8Iy
         jA5miIzVsQJ05kJxnIdvdkrgym1/PdxWIclGiL5XAk/75w7lPnySrrZGsgeiMRy4lxPZ
         vV5Q==
X-Forwarded-Encrypted: i=1; AKwUvBw2+ncdZVkKV9/Cdj1sCdYreCzpan41vRIPUHMk3+BV4ioXCwp4y9fxLpfBt/5LA8Y+l/uge0t6ejKYPA==@vger.kernel.org
X-Gm-Message-State: AFuF++knedRivnk46IjiPq4Nw9aRGYTJIrt4Bnte/eeRW9hKBl2fNgQC
	dxG5PI39y9W2u5cl0qu/o9WkSFHkN2TVGAWwBlP8Mrj5cf6I+AEQS6uMiyMRYDoE8dK+4+2Mtv4
	UYjPGaFsNu11le5tiuDpMXZeZLGZsDGk+MD9HSxQ55oDpIMLSeEOzMsZuYBl8h1ua
X-Gm-Gg: AYBFou2+DR9mH2nkCcLXVktxSABDP3uFUlOMlraU9dtsHTuxIl286L38U8uVN1RmKpE
	ZzS+XUV4XP86SSZH5p+rQn/qO/xnFwsnG/WK9GKEdUczmaXOiiBgZmAe2Bqo0AQz9Us+eIOraPB
	8N9tm0zr7qW8i4wPJeYKWBA1jCIHCRxMfCukclmyHOz8UIfHsEhLD/i2R5zxQZzX2MH5zi1xc+g
	V7dAf9INWhCArK9p3zKctalRfeFPPuPGAuBrNQXKkE/06RZnHt+5dOGrKnIt3NxvfSL8/IdMeAZ
	fpbgYLgOw7GmFNCUAsqs0a8pCsDH01tS5SzdR8AfBv4HKU3+S6T3pPZafD0+6S3PbRA2VDPLcaA
	jjvVjT5Pu8iYeFRV07eB4+MHmSAQhetSguRFGJuuHhlMiG6U70tRirTV2iuPh74r0Bg==
X-Received: by 2002:a05:600c:1389:b0:49f:dcc8:c735 with SMTP id 5b1f17b1804b1-49fe66f4c7dmr231739845e9.18.1790618966871;
        Mon, 28 Sep 2026 11:09:26 -0700 (PDT)
X-Received: by 2002:a05:600c:1389:b0:49f:dcc8:c735 with SMTP id 5b1f17b1804b1-49fe66f4c7dmr231739375e9.18.1790618966445;
        Mon, 28 Sep 2026 11:09:26 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00d10cb7dsm3533065e9.0.2026.09.28.11.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 11:09:25 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, jfalempe@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, jani.nikula@linux.intel.com, Alexander.Deucher@amd.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-tegra@vger.kernel.org, sashiko-reviews@lists.linux.dev, Thomas
 Zimmermann <tzimmermann@suse.de>, Alex Deucher <alexander.deucher@amd.com>
Subject: Re: [PATCH v4 1/2] drm/fbdev: Move fbdev module parameters next to
 module init
In-Reply-To: <20260928080323.23909-2-tzimmermann@suse.de>
References: <20260928080323.23909-1-tzimmermann@suse.de>
 <20260928080323.23909-2-tzimmermann@suse.de>
Date: Mon, 28 Sep 2026 20:09:23 +0200
Message-ID: <xlv133utfdt8.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

> Define the parameters for fbdev emulation in the source file with the
> module-initialization and exit code of drm_kms_helper.ko. The parameters
> control some aspects of DRM's fbdev emulation. Common usage looks like
>
>   drm_kms_helper.drm_fbdev_overalloc=200
>
> on the kernel's command line. This has been possible for many years
> and changing it would likely upset users.
>
> The emulation code is supposed to be moved into the module for DRM
> clients. Keeping the parameters in drm_kms_helper.ko avoids breaking
> systems the use them in the way described above.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

