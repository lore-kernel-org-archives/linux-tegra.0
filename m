Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D8D326D6A
	for <linux-tegra@vger.kernel.org>; Mon, 17 Nov 2025 10:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763374786; cv=none; b=NNFmRtcFEgBqHSOWA1J2k7M6gEuLNQcJjNvu3NQCWYJ2EWX13lj0i5EsDxVdpJ3mSFo+pk6WtHTnIsLQzfC3TyzhJFkvQEv3rGzGAVDcOtyR/2FUHRfHqMZBr3Onw6ewstNppDNJwinO2jOFjhsLB4vLCEJIX4dzXGvJ3VCvtqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763374786; c=relaxed/simple;
	bh=L4oSZxGBXivJMe2ukmEHRiFwNHU+FBC0lpsrXgRdbkc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=VQg21zHr91HsE+dGjPIF9kgDvd/we/+S57XDLqW9kigX/AJ5a6Dbe2kHGdIL3dFP2IHTgvSlRhqyDCDdQ1/c4nE1s14BUhNugGuYSw4/UdP+d7qfL9NvObwL6J01O9mq4pISkAE+bkzc+gseaouCEK7v0ZeF/wjyg41/KIG5vqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Qv0xn7XT; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=h1+z4cZp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Qv0xn7XT";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="h1+z4cZp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763374783;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8Sj1yzB+yodW9emJVWyrm3VZBnBWrcQvlOUnMxJLYhU=;
	b=Qv0xn7XT351EP4000yIc+/f+dIjGouHejtUFBzsPi173Fdp2O5Fh4TjCZejbabcero3sYq
	JNBrMnog8mer21geky3YxCi8SWwGJVjpCnc08bOJ/iLehE27+cGW4KsvKfjtF+KBUvJn/T
	K1Xqr7QFyHCWITcABElN0fnvCdRwvzI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-368-5kuqKQNPNliGVu8AW4-4sA-1; Mon, 17 Nov 2025 05:19:42 -0500
X-MC-Unique: 5kuqKQNPNliGVu8AW4-4sA-1
X-Mimecast-MFC-AGG-ID: 5kuqKQNPNliGVu8AW4-4sA_1763374781
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-429c5f1e9faso3423725f8f.3
        for <linux-tegra@vger.kernel.org>; Mon, 17 Nov 2025 02:19:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1763374781; x=1763979581; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=8Sj1yzB+yodW9emJVWyrm3VZBnBWrcQvlOUnMxJLYhU=;
        b=h1+z4cZpZtbZ3GxsH9ESnqDfZiFLB1q+ey7xuSJZVoC++YjAtqZ2NgjwBSvOB6GaG2
         0cdxeGl6Hdhj2XZiVVs30KryJ5iCqZqzDWskcHjpuLoxLQJWhqk30VzYFQ9bPe0B2aL+
         2x7tylaOl72B48i+MflBvP8yYJGQhCipahCinRLK85MU+3aDTtQLnfyMM8Uf+T7GQ//+
         cPVRG3z7e81PBaXoziii0Hw1ymmS8uMI0ruln/jc7QajQoB/Yox4ouDAx6GicLYqB8bU
         t593D8goHww9excW2cHkpVxCPINfUVooTXjchCRYvupElq0XT0Qzij/Dk/3pLYgpib7f
         /RMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763374781; x=1763979581;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Sj1yzB+yodW9emJVWyrm3VZBnBWrcQvlOUnMxJLYhU=;
        b=MTSHCLzo5mNqYfV4QP1pztatsbp5Y6djCfERvCcMpcACVFnlUXGdIFFgLXrJFtfbUt
         AAESxgD/OLRyAjBl+GL0qS4kh7Pe6ydDUEV0Jmhub/6ixMrxhpnV2URDUrgea2XTlVFN
         l798/TtpF/onvrM1117hMBHDhZfX1zGJ1p1f6sg2+KxQaZpzPBRRs21/Mm3H57ILff2K
         NcFXxrKlRhsQJpYhEVfNtqj0WyentZUC2Tj5nqWnxTA8CWI/nhfavvBgw/8tG8cKpmGK
         v2qJCZH+WxenRaA7OSUu+DqajLhSb8z7CgKjejA6pVLa2mSBfdUsJAdchuol6s01u1E8
         vNTg==
X-Forwarded-Encrypted: i=1; AJvYcCU9V58FpOv3v/Ckb86tdUt5MryBJe0hl6teAFjQTzh/pRYIKGXXn6G6UDQzKwvEVkeRvdWKCWt8KhH9vA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb6Zv05ukv+sQu8jYxNMyl/jylJu80f3Smt1QYPJ1bwphbgx5C
	UoOVswUpWbDWzTeZKQVQQamXgDouis2xY9lv5T0FQR16yCoVhh1nPxEmcLTp/5g8qTYvtgKZDST
	0Uja2WaqtFNG0EPIaBZf32h0ef0/SrD4xzBqdcieRWOmnynBOk9XXJmaKTZx39jgH
X-Gm-Gg: ASbGnculC+epg660dGt2JFZFuPc/p9nRfeJPgNSO8RuZKfhMLSUqDnjdvVe5Z7chw6v
	3pacfDvsm03cMPDh+qp2q/y4HMHN6Alz00bMElv0Q1bKtFWUOzdS3py4ouAoi294/H8C9DeD8Te
	zb1pxQHiTWKdo/gCRDP72e6KV9+p9m3wNgdqzV5B5e3jkFNO1HQbm5ln3FeHf7QZMt77ar4//xv
	PAzU7Le2CryNHJOyHCNQJcBLl8Tcsg+og4TNqs9PSp12ADJHpB1vXWgNYvgAXW1c0ygZAfVzz0T
	uV3snqQfEa3T8087A8UDrcD0W1cQG+Elj7iRs4uSZJKclQAy0w5x2wEfqqllnHIGXvDJD9uoXIG
	te6Cr3r5LeQa8XgVZux5NA4RGN53UHtqJBWWr5atH
X-Received: by 2002:a5d:5f47:0:b0:427:9e6:3a64 with SMTP id ffacd0b85a97d-42b593847f2mr10779170f8f.47.1763374780936;
        Mon, 17 Nov 2025 02:19:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHuLJzRkeZwRTSmYiDMNFB5b9Y04M5/X3K0AsCLwjmRlR2lS/HTXuIsn1n38y2t71o3SspdXw==
X-Received: by 2002:a5d:5f47:0:b0:427:9e6:3a64 with SMTP id ffacd0b85a97d-42b593847f2mr10779119f8f.47.1763374780429;
        Mon, 17 Nov 2025 02:19:40 -0800 (PST)
Received: from localhost ([195.166.127.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f0b8d6sm26377484f8f.28.2025.11.17.02.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 02:19:39 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@gmail.com,
 simona@ffwll.ch, linux@armlinux.org.uk, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, inki.dae@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, patrik.r.jakobsson@gmail.com,
 jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
 robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 sean@poorly.run, marijn.suijten@somainline.org,
 tomi.valkeinen@ideasonboard.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, thierry.reding@gmail.com, mperttunen@nvidia.com,
 jonathanh@nvidia.com
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2] drm/fb-helper: Allocate and release fb_info in
 single place
In-Reply-To: <20251027081245.80262-1-tzimmermann@suse.de>
References: <20251027081245.80262-1-tzimmermann@suse.de>
Date: Mon, 17 Nov 2025 11:19:38 +0100
Message-ID: <87ikf9kll1.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

> Move the calls to drm_fb_helper_alloc_info() from drivers into a
> single place in fbdev helpers. Allocates struct fb_info for a new
> framebuffer device. Then call drm_fb_helper_single_fb_probe() to
> create an fbdev screen buffer. Also release the instance on errors
> by calling drm_fb_helper_release_info().
>
> Simplifies the code and fixes the error cleanup for some of the
> drivers.
>
> Regular release of the struct fb_info instance still happens in
> drm_fb_helper_fini() as before.
>
> v2:
> - remove error rollback in driver implementations (kernel test robot)
> - initialize info in TTM implementation (kernel test robot)
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

It simplifies the drivers' code indeed.

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

