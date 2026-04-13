Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E401396B76
	for <linux-tegra@vger.kernel.org>; Mon, 13 Apr 2026 07:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776065863; cv=none; b=fks3buCLTH/EOthlXwsmXuORSm5r56T+VbKgjROwpWd37fDSTsDPWh8XMYdUh6zW9kelK6Vra+M9vmET8t32xMo+vR4kSKjPxPmMjLiF+zZPZuMAf5rhiDENXi0015LzaA9aFAy4VjTozcS2FzDIp0++t3+943F5O89zKzVDIkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776065863; c=relaxed/simple;
	bh=SC3qj+zSPrXC7x148ssSlAOSsrLh6sGlRiQ6lldj1q8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i122ThhTFgGrCSB1gYyoaxa0eptTYOmZn8NqRKOBRQdn4HBVMB9RVC1HD4OzkTJ9CTAYv7KWzF3Pgr8FzHOcsltZS7d39ZhUuFVnR/QfuijNAhX1eBKpJFg4gibmCemiYSot6qG1uk+UhlO/YD13SPMjZPu7xcCSQF3VhDUxHkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y2wJYjxW; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y2wJYjxW"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43d75312379so550482f8f.1
        for <linux-tegra@vger.kernel.org>; Mon, 13 Apr 2026 00:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776065861; x=1776670661; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i0t7dfofWTApgTDHYz2jvCuOmi04UnlECznc19h2Ol4=;
        b=Y2wJYjxW8dF+sxGCY6h6//xdFZjIdrWhDcMuhZ2OLcmpVZud991/hGeZvd0KEDilSC
         CKE6kNNf6+xtyExxaCtoO4kfeN5I0ZB75iguSubit4OR9WSADV/gg2O1wxAjTWiubyvI
         W5zR50ospipf1Wzs3JDGfQGjGyFFgWCSWqWFdqKRVoH2hmUQzBcJvQ7mXd6RFUJtYjeQ
         pfrjDA6APBLF9GF1wwcel2uJQXOXLXIttCybTEEQ/geYoOXgbBV1xztvvFtrdEX4pa6N
         EZKsBIizix5uvE2dG9Mdp2Cq3QmiRaUBeiO4bRwXHkX0t2mbcmgL3pka9RMTiYk66xkO
         1vdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776065861; x=1776670661;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i0t7dfofWTApgTDHYz2jvCuOmi04UnlECznc19h2Ol4=;
        b=PXER3BMkKH3LyCCFqJLS2pia3SnEO0qfOv+3Yr2Owh87f0ECFQCkgiZWxmCJXgPdap
         aBATcYvcvjN2mqY2MtcsjppVpaHllMmvZOmCpct0ZSp6A/F8r0rAvIA/oDbuq7zBHLXN
         bSK4NwdSoiO+oYDAmd5XyWy4y3xLqhmvhu4hnnT3p1/AsICH2zJJ49Fp3HpQ1vhCpaQz
         vLxY4XLGTRaG53eEjIVLj7yvp+Jooy8wBSiZsl3Eec88BXbosl3mcf2uklKnUW3JibS/
         EZSScD54D177sPDM0v2tEh+KKbgTXTdgx5U5Q7mBigwggHBp0O81PXmdyDo9x4Ti2pyn
         z4FQ==
X-Forwarded-Encrypted: i=1; AFNElJ8rCMiql2qPLDp6Ovj/TZVwhlddDPNX/R0L3O20uS3sgHIUDiN75uA8KJpQYrZZzBmm/TLzZ5FksN9JYw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwlLbp89DhnJBVWkbsWAh6H0uDb6U9RzEHAqprjGtI3G6619RzI
	OT1s940TH7LAvj4sWJfBqlIMWzUkDuzkhnbT+CaP4zR4DOKtxD2eLcyny+QUcTAb
X-Gm-Gg: AeBDievRvR6u4i0Oy6WzpMOMCz412b07XR8MIDwLyRq2PMHY6UCmn/7qtc074MgLUZR
	dm4JSP/Dt272a9+ZNvjkiaeYziUinNkj1HYJXkQ3S/K1yWSS9E1YXJ8zBY0hJDw2Mb6+a4zxQJE
	SDP+nAfM1CqYmeRNtndV5kKfWJ9IlZEnSWDPW53pzLG0c2MyvcO/4z+ALpj0SYMitk6e0R6vA6y
	pJfsZAAL+j43hdbEcZtqhNOAj2ySXNV1viYeqB/hKMuvS9SX+4jvKh21tw98ntmr3QZlR5mE6hI
	NR6seM2/TpVy8jWmv0dOvPLUk2JSFL49Am0qIpMOLHzYgV9NOgzvLBCH3wAsLYKPLH0OZ/qgsg8
	gdG9hLgwr2N25ZjLicn12sAlmcnBOEg4s/Smcqmp8VxLxz4goCy9pZ+wikwgUim79tNOYRtBaze
	opkH/E9UOL4kIOx2bbDAA=
X-Received: by 2002:a05:6000:25ca:b0:43b:5091:39db with SMTP id ffacd0b85a97d-43d649740c0mr18904434f8f.13.1776065860668;
        Mon, 13 Apr 2026 00:37:40 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d6f4bf2b4sm15213667f8f.20.2026.04.13.00.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 00:37:40 -0700 (PDT)
Date: Mon, 13 Apr 2026 10:37:37 +0300
From: Dan Carpenter <error27@gmail.com>
To: Alexandru Hossu <hossu.alexandru@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] staging: media: tegra-video: add missing error
 checks in vi_tpg_fmts_bitmap_init()
Message-ID: <adydQWbkY7X68yVy@stanley.mountain>
References: <20260412045245.GA2019381@kroah.com>
 <20260412084808.232010-1-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260412084808.232010-1-hossu.alexandru@gmail.com>

On Sun, Apr 12, 2026 at 10:48:08AM +0200, Alexandru Hossu wrote:
> tegra_get_format_idx_by_code() returns -1 when the requested format is
> not found in the SoC format table. vi_tpg_fmts_bitmap_init() does not
> check this return value before passing it to bitmap_set(). A negative
> index converted to unsigned would result in an out-of-bounds memory
> access, corrupting adjacent kernel memory.
> 
> Add WARN_ON() guards so that any future SoC addition or Kconfig change
> that exposes this path fails loudly rather than silently corrupting memory.
> 
> Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
> ---

patch 1 is missing.  Also the little change log under the --- is missing.
https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/
And I want you do change the commit message to say that it's not a real
life bugfix.

>  drivers/staging/media/tegra-video/vi.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
> index afc7327ef318..d1d934e361f7 100644
> --- a/drivers/staging/media/tegra-video/vi.c
> +++ b/drivers/staging/media/tegra-video/vi.c
> @@ -1017,7 +1017,7 @@ static int tegra_channel_setup_ctrl_handler(struct tegra_vi_channel *chan)
>  }
>  
>  /* VI only support 2 formats in TPG mode */
> -static void vi_tpg_fmts_bitmap_init(struct tegra_vi_channel *chan)
> +static int vi_tpg_fmts_bitmap_init(struct tegra_vi_channel *chan)
>  {
>  	int index;
>  
> @@ -1025,12 +1025,22 @@ static void vi_tpg_fmts_bitmap_init(struct tegra_vi_channel *chan)
>  
>  	index = tegra_get_format_idx_by_code(chan->vi,
>  					     MEDIA_BUS_FMT_SRGGB10_1X10, 0);
> +	if (index < 0) {
> +		dev_err(chan->vi->dev, "format SRGGB10_1X10 not found\n");
> +		return -EINVAL;

Change tegra_get_format_idx_by_code() to return -EINVAL instead.

regards,
dan carpenter

