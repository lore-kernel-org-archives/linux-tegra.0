Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF601990A7;
	Tue,  9 Sep 2025 12:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757419522; cv=none; b=XLuz1+oy9WK4l2H+jewIvJvHQmqgWfWx8KXu59utbSHbBOQjNjgEel0RrerZ59QMSgzn91uWkpvBdpDdrwpaalm71xFBIgZzksDCyJK3vhSJj821rKDa9bzt/LV9/9FeQyd0pm2XTqM0NrjzTsUpXYTwzHYPnalOm10mDumFl5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757419522; c=relaxed/simple;
	bh=TJJaPEleZITaeSOtKLMBvC0bgAajGB4pctihAlmgOU0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jxTf03Zn8zzhoiTLf6q7k3O/Il/Vx6RO8cNnCHGHm1mSW2/YPv3mmlVxhP77touX7LIYcTnYwRHsJP40EymeqNH0NnFl8G0zaYh2w6l9qmwa8JrBdUfGW7uufCX+xvQNLTtCWKJrZGlkfvulaJLKhsd2P/c+jEkmIEqIU6QeYRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bRwjzayH; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bRwjzayH"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45dd7b15a64so36467045e9.0;
        Tue, 09 Sep 2025 05:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757419519; x=1758024319; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TJJaPEleZITaeSOtKLMBvC0bgAajGB4pctihAlmgOU0=;
        b=bRwjzayHCKA++1jQRutfKyCSgk6h8kJMvudMHjD8l+v76Uy5NDAaUM88M0Nm6w7ADD
         P6HnCb6noJaDcLmkiQb4uAPMycu7bDF+DlKaCcEq7aSJFQBpRXplymO4NihyMAZ+dsZM
         cgNJ7XHfwV5QGnclpwr6pnSEadal/Z7gVrvIyyQFGYzgN3Ahg80hpaGi/3HxSz86A6bF
         3alK/T0fIlkz+Igu4mHHU92jAywhd0RfcL6ZEwSlQsy75eRWwpZP0i5M1KfMGYmBp47b
         wy9zCGilpprD3hhN8S339NejxPghUah0BA2t0rcB3uiOAl2Fmx5kob0U9j/tAEHsZwiC
         rAWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757419519; x=1758024319;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TJJaPEleZITaeSOtKLMBvC0bgAajGB4pctihAlmgOU0=;
        b=JhL3uxDnlzndwLsrAYd/YZWik5ATFflCYeBVXqv7u6Ey5NuuD8Vd4X+3546wnVVWt8
         ag/z2WyoO9zGkojmKveMMSIYC20IPq50a2OKF2hqrGi848tcHlbiqltxnAKC8YhrEGjp
         U1PZp96VtYiRs5H5leh+iOyrzm2+3oli/R3+e7mtb2jpd29zKwyOjOBZL80yrGM6Elen
         akrla5tnHGgbBIZWoKQiS3AHUrpvuHhDM+Hj0NPSl6SolIDnYJCB4oxXUdkb+w2l+Zhv
         fQG6QUGjEv+29THQrzQYuzaHSkW0l+KmidjH5GiR/ShN2ct+Ijsoyz0Bd/GFvwLtD8Mo
         oAxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAxV7IiWs+1Ywpi5vqVDmzhbh99PFF3WGTcaHxYfCLpCwdAJ9zb4ES6CP67YWI54Boq4YcyQjlNvwoMiY=@vger.kernel.org, AJvYcCXtLXhJ2Vn/X6C3GmZnn7r4jULlPG51LTIXCkxyFR6ERsXJ5uwW+HF0vgVAZQAQ/CrD3zbiG+VgVqJTpwQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YynEJ8vOHRAjne1p6WcAfiSc0hO7XN+AlnhNZugZIzTnVlKwInF
	uB2zSc2IxTJvwuQGROZ9GXeEGRZto22refDt4jUy48fFP+kIdFQbMAk3
X-Gm-Gg: ASbGncshaj4mLeCQe01wSiEXCR3RqYOk1Sg3HbWufVkc+Q6QWVveCSPKiTEilSUjPsg
	FZesMpG+PetgGo23bgEBNuR3DtdRjUEzh8rHr7jjK2Fpz01Yhdgljee4Ch42zcsUWcWaCpx1kUm
	JqUnkErXpPwCSfLWgCtyn7LhOjiaLaA72kjJICyO/zJ7IAdXXO0mq+el6ws0mquf270eajK8BGR
	BsScdgGcMXtYq9O8ngE1gYDUp/4Kxt3Ej1xvT8LENp7+33VNzhrKRJGXbs7/sAN0myYJwYV88yB
	fyIpuFhbulLcY80lLYPfTWMWcThSGBfa4/80dqeLk6QYhAjjgL2X9ZBtXZ8pVBlN5ewXLoqPuZF
	CWShap68g+NFH2zspwYyro2UI+1PSsu93z5E6+BksEWldA5vKgmJRaZWj1og7XPEIwMYeOOMz2U
	oT+z3a7eJm3VsX42h2d1U=
X-Google-Smtp-Source: AGHT+IGJt/kHoOhyd1R5FYpboV58myFjIQXREXQETTfojzheEATLY8DvoxHcNcE3VmNhRHGpbLliLQ==
X-Received: by 2002:a05:600c:a41c:b0:459:e002:8b1e with SMTP id 5b1f17b1804b1-45dd5b79577mr81027595e9.13.1757419519123;
        Tue, 09 Sep 2025 05:05:19 -0700 (PDT)
Received: from orome (p200300e41f1c4d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:4d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45deab47e5dsm60831755e9.2.2025.09.09.05.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 05:05:17 -0700 (PDT)
Date: Tue, 9 Sep 2025 14:05:15 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	nouveau@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] drm/nouveau: Support devfreq for Tegra
Message-ID: <rvfjkkpsqvk3uedaahzhwrao7bgnxvbn7hdm6goa2bn6co7ctk@2hbiwwvn6y2j>
References: <20250831-gk20a-devfreq-v1-1-c25a8f1169a8@gmail.com>
 <4f3d9122f3fe552f94827b83a7dce5d3bbdc23e2.camel@redhat.com>
 <CALHNRZ-h2ee5pyOx2YDDBDQzFnXxDFX5EzhjX5+DT25UbKj1MQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cdjsce2jvxkluvvg"
Content-Disposition: inline
In-Reply-To: <CALHNRZ-h2ee5pyOx2YDDBDQzFnXxDFX5EzhjX5+DT25UbKj1MQ@mail.gmail.com>


--cdjsce2jvxkluvvg
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH] drm/nouveau: Support devfreq for Tegra
MIME-Version: 1.0

On Sat, Sep 06, 2025 at 08:01:27PM -0500, Aaron Kling wrote:
[...]
> I should note that I have only actively tested this on gm20b and
> gp10b. I am currently unable to get nouveau running on any gk20a
> device I own. I am trying to target consumer devices such as the
> shield tablet, which use the android bootloader. I can boot the kernel
> just fine and tegra-drm works as well, however when nouveau tries to
> probe, it hangs the first time it tries to access a register. I have
> not yet been able to figure out why.

These types of hangs typically indicate that the hardware is not powered
on, not clocked or in reset. It's odd that it would hang during register
access on gk20a because nothing significant has changed in any of the
related drivers, as far as I know.

One thing that you could try is passing the clk_ignore_unused and
pd_ignore_unused command-line parameters when booting the kernel. If it
works with those, try finding out which one of them is causing things to
break to narrow down what we need to fix.

Thierry

--cdjsce2jvxkluvvg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmjAF/sACgkQ3SOs138+
s6FTGw/9EoD51gi3P/LrfowkOW2gN53NQoOq+eqYt6MV3CQCUoHAzyl/Q2IwhZ/W
ArhKDqjc/8ssSziWctieThin9SnhkG01Qh79MAMO3L7lFH69vlb/9lBKsn85kwjV
N37+MzOKjnb45j/sjE9KuTeQ0pzKi29FwULMy219cprbpX00AePRKMRoDvRS7frd
IHzk+g/9ZsVKaJ4SW7+LceIouaRyvzeKRLI3y8J8M4OBWbFx+DrGmGRGXKPWkKS2
2I1wJVvB9d+Lm7c/jPki/w3AvIM6JiHvG6ADEKZT8t5W5ud/cHTDXG5jE6dvSsVi
/uBUqMVoVjRjKB1LC864WECYp1w8of6cKXIn9sGSFslyWr5NIdHGollgLxpJnsso
jEPmWQM8Od3JStic3kOxrbPebBQpHhsFOCvkM1W8RqURSW2ociYYih3xquP39WIp
xNU1IDlAmJVk/mfbuO+/lJnRGYog6XJdTaUHEe26hm3CAAdngFa/+uhMRFQJtrUH
PPdho5Ulvz3FRJcy6bpaq9hNbv2JD9gmug9z+eH+RBL+vjf746/86a22jlAbuEa2
txcQag50dQ74ajcU/5SeLip/4tAQgf+ZCMID0ya7zLE6aufRZ6GGqw9jMljaieql
2IPVywytpMpGUXjaJUgI495vF1XJ1S1lnaCCxO3zqD+C27oaR8M=
=4aBF
-----END PGP SIGNATURE-----

--cdjsce2jvxkluvvg--
