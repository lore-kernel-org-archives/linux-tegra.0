Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C7436B934
	for <linux-tegra@vger.kernel.org>; Mon, 28 Sep 2026 18:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790619036; cv=none; b=aUHMq3s4oJ/+Ra+RGTTiZ4c9UX5UR66FcjRu66neeZj1XmWk+eGZBHNj5EY5lfU6l8MRXOcV2L16JAaSynBVuukPHh20FpgEBEgGw4rcgexz5q47fDasKMJHG/E79gU5rnid038a56fR3/TIVmHXtKfr+opm1i+Uw5VELKo/+C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790619036; c=relaxed/simple;
	bh=bbVVcjiD4ES+ov/wPnX+0XE+Qh3pApdn+aRpLrnrl9I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=O5lMDCvHQ303ZOOG34bz3FQh6bxjTMO6ROOBWV/HbBITP7jUYfI2C/xb7eZT3NcDJZFL1YQFit6fEen8f4yqnUlh7MhI5C25H8cTDj8yoLzX0mK1YP0X9DUzVi+hvPDwUITTCZggSz6PIGnCJ503BZb/kB62nwYns0L5sfmSdgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hANFZopc; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=D1tLpPXA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hANFZopc";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="D1tLpPXA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790619032;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OFTht72VGYwnHy4rRuIiS5N5orHNND6LgvZVdS8G2Q0=;
	b=hANFZopcyLedUQhKEQkdBlYiherp/C3nUQ747CxrT374lOZGGIv2QoZiZHPUNYOm+PIToz
	7dnnCCpihtUy32qnGza1WpDmtSh+RO8rPj1CFTfdg80p4y/4/N5n2pTYm2LF4gxQr0eT/D
	mPT76c9OZAGILFsF8fORK692OatNQRw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-688--QPByWn-OWad8YdQjhqZkw-1; Mon, 28 Sep 2026 14:10:31 -0400
X-MC-Unique: -QPByWn-OWad8YdQjhqZkw-1
X-Mimecast-MFC-AGG-ID: -QPByWn-OWad8YdQjhqZkw_1790619030
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-49e635a6002so39972335e9.0
        for <linux-tegra@vger.kernel.org>; Mon, 28 Sep 2026 11:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790619030; x=1791223830; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OFTht72VGYwnHy4rRuIiS5N5orHNND6LgvZVdS8G2Q0=;
        b=D1tLpPXARoZeAxaY6gpJ4I6Z0XRTb/LUXa5vh7I7KUJljAWxkpapD6YT1dUx+MqZoM
         DVe6SE1HEgdqm+1yicmQXJdKwkUm3MtRhGJKPJ+VmcbSIRkAgIKpcdqkPQ3fSBhTm40+
         46YpSNVSWaqXntaypYSgyT+sW8vm3USKA/dCVPW8PUw/oOQ0iKFl5DeOq5yWzrT1jMQ4
         IslWHxjrNLEA3ZqlfaPuUI9hvEEPOfuzaOqYIO8LJKLnl/iXsRy7clIXOWK4OpiWQwSf
         4XbF7nn9D5okP9XdN1tU214fMzw59uLOozIH4akkodMExCpmlelTJYDjeu668N2ACuhJ
         hE0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790619030; x=1791223830;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OFTht72VGYwnHy4rRuIiS5N5orHNND6LgvZVdS8G2Q0=;
        b=JeF+Xi1XRj3Ngj/3Wbp7/NzPHL0Ya+8KQSezocfdUKu33lBzeZOJYmO2jL4iu3WVGe
         IEAp+4xbSSEw2b22wkvU+bszC3/rQ8nc6iKZMXiQ+z9nOExe+0fcOhJMgJ0O6ogufOMV
         isWXm6m0UGZHVFXM9xmR3X9KLG+gPgzm1H3c1K2qEnoOxD5Y+p7zDnOhZWZ0EZGlGwpN
         4eEGZVO3fxKhPblZza9xWd0iNy+KzdQ7Rdw1FP3r9qBDXfaZiKuoVRKBDnxCBHeCrH4K
         GYoo9uRP12K1NrLn/AmLEXp63qMTW6Lks9RbEIvU3SKIle2eAz4Lh4sPoKJnJFhIragh
         mXog==
X-Forwarded-Encrypted: i=1; AKwUvByHOIrGkjqaIRhQ2WRYzBeFtGKf9mnktHmSbz4mjGFH2ai7VYfNi54pS7r2hiqSvKYn8JY6ont4WRMfKQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kaoWjPTOttB+c+B9g5cuiTbXwoA/rY/YqlVlP1JQ7AgX1Q/7un
	zrSz08iDLsYnpNKCSUF9pnN3dKlF+BZApR7cuq6fsvmpvxbTSATFuGJo/HuiawlZUvds+LbSWxq
	b2uO35Uh16XcOb0++tZ4DUvkr7keL21w/0PF+2rB3FrWXgc4Lw8bN/SyNLPZI6Gus
X-Gm-Gg: AYBFou1D8A81IlWZ6IxdtQN0ffnwheRlF3KON6oRcBOgtwwgCy6dEh8LVKrk/xAZYzO
	KsnJQdql9FdoMmD3zh+NvjFb7gJJiX0isHYCVfnesNrc0+o3D7sFtateM7i44iJeB7jWJvUs8V3
	yxTJf8QzNBACYjNWQF+b4aSlI8VbAhZ62pTc6R4sDSwWhl4Ib/h+BuvY9HpxSz2s3JlXuo88i4/
	fYJdd04pBDdTiVdtb/7FBD2wpBDa9QCLmb/Mm/6pJJEsLbDVoujMqBNLTHb6BHUCU+F0fxo0mDc
	FzP0JTc+ms0ZgFxf7ccT8k7CUe4ePlCDAdhFkkb5QmU2t2Qp37The6HDadWyyoC2cSRj6eYtPFS
	QUUC4eHx1Mt2g7TjWS7Fd3oXOfMeTHefR8vuVmQDmmdkuxQDR5IifdaWyxXWdYoWssQ==
X-Received: by 2002:a05:600c:4f44:b0:4a0:23f:8b0d with SMTP id 5b1f17b1804b1-4a0023f8d93mr91712365e9.2.1790619030017;
        Mon, 28 Sep 2026 11:10:30 -0700 (PDT)
X-Received: by 2002:a05:600c:4f44:b0:4a0:23f:8b0d with SMTP id 5b1f17b1804b1-4a0023f8d93mr91712165e9.2.1790619029624;
        Mon, 28 Sep 2026 11:10:29 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfe16a2sm9652415e9.4.2026.09.28.11.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 11:10:28 -0700 (PDT)
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
 Zimmermann <tzimmermann@suse.de>, Alex Deucher
 <alexander.deucher@amd.com>, Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v4 2/2] drm/fbdev: Move fbdev helpers into client library
In-Reply-To: <20260928080323.23909-3-tzimmermann@suse.de>
References: <20260928080323.23909-1-tzimmermann@suse.de>
 <20260928080323.23909-3-tzimmermann@suse.de>
Date: Mon, 28 Sep 2026 20:10:27 +0200
Message-ID: <xlv1zex1dz70.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Thomas Zimmermann <tzimmermann@suse.de> writes:

> DRM's fbdev helpers are for the fbdev-emulation clients. Move them
> into the client-library module. Fix include statements throughout
> DRM drivers.
>
> While at it, rename the files from drm_fb_helper to drm_fbdev_helper.
> The old name was too reminiscent of DRM's framebuffer code.
>
> The GEM support code for fbdev remains part of DRM's memory managers.
>
> v4:
> - fix the depedendencies from v3
> v3:
> - remove obsolete dependencies from Kconfig
> v2:
> - update armada und docs
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

