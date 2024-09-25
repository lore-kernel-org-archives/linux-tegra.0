Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7061EEE9
	for <linux-tegra@vger.kernel.org>; Wed, 25 Sep 2024 19:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727292408; cv=none; b=DlwEX6DLIWxjTcXA7jB8utZjNSa9BY9aKykXqIgWNf3VevJzrXqTft4/O81QXCbpD+CmJqzXG7gnCalUguKaOtl2wjJT65LgiqUVXTFXbQUE9l4H0PuXyjfbEphHGRM6/Qm1e3iFxKlIDqqUp8OtTqk8Si2Q8sX0QK+MDeN5nSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727292408; c=relaxed/simple;
	bh=ERB7K3M/2dsCSTSprUWnnVy7UKWGvubvI4RfZ+OV2+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=irhHGw4FQx4DcCyHXMwUD+7qeCyn6QMJkCa4lUPHcARXjgYX0RloDOq/HC9PQs3xJoTZQXGrFZmn9GSpg0KDupfqsZXTDpOSpOce6rvdiJVtIXUA7uiWDbmPTqDG6gxrPrbBdqSmXGWHvq9owmIj8QErkB5ZgQ8ZGJU/wMd6Y6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LbW2hQm4; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LbW2hQm4"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-42e5e1e6d37so1163665e9.3
        for <linux-tegra@vger.kernel.org>; Wed, 25 Sep 2024 12:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727292404; x=1727897204; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wavNrkur48GeN+h9wVwnw640hllK1gsxWZL2GdQHIt4=;
        b=LbW2hQm448IQY3FYslZlvmwen1KEboRQu2Vz6eRxNmhR+oxz27FBvo10PMA+sU/8ec
         WYlxaiHQuTG+f96Zw30Q2WiekZ2sB8XK23ZvFyFjVF7QGGFo6IYXEvHOiLUUbX1v/KFj
         EqiPlOSFMqhqXeAsGXNm1lPnUYehAVxjQ+Kp735Q9vMbAbrUTonzIgm1flKBo9pWEM/+
         d6yPQxmWlQxOFHf9jo83UpmSKAU33oA5BaYHItzUWCeRTwOFHnieUwFZgRmy2UavYTSO
         Wq2XfB+o1JJJEtFKiyx3jQGRCD8ZREmDWtF8UQzHaRCZ17Dm+XU1lgSqBFm64u9Urg9L
         1hlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727292404; x=1727897204;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wavNrkur48GeN+h9wVwnw640hllK1gsxWZL2GdQHIt4=;
        b=mSUPAh+8FMbrkCYZjjl944Euz72/buYBWxcCtgBNPWwbqqBIAUvy74w+wcfImlJBxE
         5Hlv6OiOLPopP9NnSrK37KLk8kvfLUo+LdwD9s+YqxsT9UxRyFtqs4czDW73SnIgHfXX
         1D6s2m5tpyngJ5weby1/LeB1ph/WsIs3/iRsaydPn2rljzfaQkxLTaoaEXiNeZ0Rfd2a
         xJd96BkcAmOYYkwV1p0Xk3SBnhKt5ta+ycGlVgCzyFuYOBHbkvket/0DliRbxrt+a/CM
         RX6vsoZxGKEz2oINuO4f74WoyBjKbs/ZwH8Zr7WhHl2ML5fSoGwET4HO83wx5H+PBnD6
         QsWg==
X-Forwarded-Encrypted: i=1; AJvYcCX/dA+eSzer0aHSGOUT342reyvJ1B/RVrVfKJdUMsRyJC2Y0ILLNCFAYF/Gz8quJy+Fokj+ZUu/suhfeg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy6v592vLdQgl5w4D+Tg5GFKQghyNSjk6SknJpwd0qCFqecnC2
	3JhBK5GXysE418zk1sIVEDthmQfHL6qN8n1P7OOa/vt+uJwZi8yt
X-Google-Smtp-Source: AGHT+IH2GQjEErpqGA3vuE2aHV1lN+9RT8c67GKpvFPKReLg90CONS+giBuHrULBq7AYuJyGChnS2w==
X-Received: by 2002:a05:6000:c4b:b0:374:c454:dbb3 with SMTP id ffacd0b85a97d-37cc24c5bfdmr2097949f8f.55.1727292404298;
        Wed, 25 Sep 2024 12:26:44 -0700 (PDT)
Received: from orome (p200300e41f147300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f14:7300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cbc2a8ac3sm4734392f8f.8.2024.09.25.12.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 12:26:43 -0700 (PDT)
Date: Wed, 25 Sep 2024 21:26:42 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH] gpu: host1x: Fix boot regression for Tegra
Message-ID: <xbcu6weg4qxz6qpkz5dqooigchzvtwvwjz7cbgrpcjii2x4imp@ubkdea27kgi6>
References: <20240925160504.60221-1-jonathanh@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wsmwafovgoia3637"
Content-Disposition: inline
In-Reply-To: <20240925160504.60221-1-jonathanh@nvidia.com>


--wsmwafovgoia3637
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 25, 2024 at 05:05:04PM GMT, Jon Hunter wrote:
> Commit 4c27ac45e622 ("gpu: host1x: Request syncpoint IRQs only during
> probe") caused a boot regression for the Tegra186 device. Following this
> update the function host1x_intr_init() now calls
> host1x_hw_intr_disable_all_syncpt_intrs() during probe. However,
> host1x_intr_init() is called before runtime power-management is enabled
> for Host1x and the function host1x_hw_intr_disable_all_syncpt_intrs() is
> accessing hardware registers. So if the Host1x hardware is not enabled
> prior to probing then the device will now hang on attempting to access
> the registers. So far this is only observed on Tegra186, but potentially
> could be seen on other devices.
>=20
> Fix this by moving the call to the function host1x_intr_init() in probe
> to after enabling the runtime power-management in the probe and update
> the failure path in probe as necessary.
>=20
> Fixes: 4c27ac45e622 ("gpu: host1x: Request syncpoint IRQs only during pro=
be")
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  drivers/gpu/host1x/dev.c | 18 ++++++++----------
>  1 file changed, 8 insertions(+), 10 deletions(-)

Applied, thanks.

Thierry

--wsmwafovgoia3637
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmb0Y/IACgkQ3SOs138+
s6Fwcw/+I3XPvWL9o2XLHonsUzrHkOYbO1kJQi4IvNOA+8GF6wN3rg/PBlfasKpp
5TATwOAJnl6GbEKHOZSnhN8GeGiL6Xor7mm6+mi5A6WKbd6MPh+tY6bheAFP+Qtl
lGq6Rq14yjJCoCoP3CHbEtVFfbzSEBXYysNF2zuis8KNk7GfXx+6lN66aGaX/CES
+be13pAA3/Mid2KwD2kCoVaObdHuNMroffab8vJy1PkHYVPsKoT9jUj0GIcCCpcA
BXOsC/J42F8Ga22tCXNuQkP5JGw0QexX8Tad0qnQfw1JK1FvrWYusPDH2BQRdjUp
3/ru37KM1S/CyrZIHIum4ksEPM7dIPu5Wx4opl9tyBozc9L8Xfo5SLhFS9iIFKFy
0Y1Xgc+wpA+CDvTbNp0Kr6xvjFyjgoBLA1YPLWwEuk7hnUzPsZ9WAiyA1dPH0prd
Ca5y/kRLCheAA0IOa+iU1bywHXSjKy+g9lvi5Hg4u5RpKwesnCZsO0fUaxxlwgG/
aQYDoh/kqHH44UD8F+Jc0MYB+83SW3iFZyypKF4Nk0JkH7zHkPRpBeBklZRAobBE
hex37SmYHE2p4az0bT0F+DsH3wncPzNvLwvPXZrmih/elCaQY9HStbJlrvBRnxU3
f1dObDr+IgEYttzWRZVyA8oNBfZZuMdAxribfAomCcAMbk6O+Bk=
=h3i4
-----END PGP SIGNATURE-----

--wsmwafovgoia3637--
