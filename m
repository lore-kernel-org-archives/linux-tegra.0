Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD64249B5A4
	for <linux-tegra@vger.kernel.org>; Mon, 21 Sep 2026 14:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790001256; cv=none; b=VYv+8B8RV/aUmecp3e8D+PDBLMV8FJq31ja/+PFKOcgnH15Qh0cF5FF4HvSdsQcUjVo8qsIQLNdwWbuqnHAbVgyP/6A1uGI7jt7a8jlD0akra9LEgGS+/+d4V1cFQHDLcUuZb5ZaWASW7z4SJZ+KcULR8G8bDtLrAiiLFO5x03c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790001256; c=relaxed/simple;
	bh=D9Vab6YewTt0n3E1niNGSKa8OTVyAOJ6oGZjYfA0Rs0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MhwJ7TyU1meBlZ0JDIxxPGwtzEB/tBrpjqSIKBR69YGZDc3zx9/SUsJeEwRiqslXPaR0B8eSFjrDpmiloN73139DOuoHdXRbO6c9WxNE3/uaYjXXt8j14stRjCal8hAuYl/DStyvA/CYMgxyIwScbjmYlBG4mGLgs3cJQie/eiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=VXk4svAO; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="VXk4svAO"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f63546c5so2413197f8f.2
        for <linux-tegra@vger.kernel.org>; Mon, 21 Sep 2026 07:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790001251; x=1790606051; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BJWLyPCPDzqtriJspq8HbiIMLt/gcLXJPMvywI+s16A=;
        b=VXk4svAOaEk91HcHgxHGrBMHHR7XXag6OYuRh5BOq6lWPZaVkgVJxkJTeplm3M2p5j
         q9SlPEkqfMtpmtA5h2LF6tcHtodQYcHm9zIMQbmdY6lIqunaBGQiOKwaDFFJB45KsEcX
         H0N4mkZNsrCel16Jki0cNlNstHZxKf75KoWigqHzkRvZoU3Tfs8Is5YsWyy56Vcqvm/v
         +HAB5aHKSLTsv87FBttxqBT04C06TDfzP51Q2SB4Bd54aKKySCig9T4sFVIJERQxJpvp
         RYRuw+8lkSR929lEQG1dlelJAEXmdlexLr3ZzzLc7qDhOaoNz+c1XPtVYBoWWf7XbWz3
         BUZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790001251; x=1790606051;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BJWLyPCPDzqtriJspq8HbiIMLt/gcLXJPMvywI+s16A=;
        b=Cg7SHGGFHXJTdnphzOkH0Ko6x6ckz1LbK4ZGJmspnAvFwn+lQlIg9+lhnlFVWRGbPR
         Vx/7RVEKOG39WJGC677vrZ5UN2KUAZEkzkFzUlGWu+c1NCwuwTY4412wrRGaE14IWb7B
         So9dLg93Wkj6DR2TxUDCwKhq2ybmfC085dfwvww0cs1VbubV3WjktXhp2fVScsEBDzSn
         ZlDPUmF3Ln2RWTcyKFaH1OIkC7uwRXi8aGLdasn5LA0VR/6ghgG/+kq3qDR8rsEvkg0P
         ZC+/4WwhYJ2v+AnI4M7unZSgqs/c8yQidJDaFdk982J1vBSI2H2Kyj7HKCvr+8JBUHD2
         fjDw==
X-Forwarded-Encrypted: i=1; AKwUvBy099XhD6Qjus4w3F11vSQ7a8Qz2UGxt8LV1HozXBvNJzWJT9XDRyqNweyJgSLRgou+R/gTB5p6+r7R1Q==@vger.kernel.org
X-Gm-Message-State: AFuF++kWeYfZxmq9/jvGpoqprRTANse+VNUybvKJ0byIME0OgKOq8U74
	N4bIXox3bT58q1bLCP3q36yRWokgA8Z7QlJBgmV23n9ms4c/9oLemKKKtjyR7D1jbGE=
X-Gm-Gg: AYBFou2rdqxcFKxaWMZOaQheb4ZyMof19gNkKsV15IeuEJ+uq3po+OX4Yk/RpFw5pT7
	3x1YBcvNFHeyfycjhmGIztP5DX7HpsAAU/3H1+Q9Rdpdyukyky5g346XtQ3D7i6FjpBnavsuJXs
	yZUZXIrHH2C8gpghp2tOc3MrCI7zMfPC93l6XubahpSK5bsfonZao0cLOX9iOJdmnxkwT44LNxl
	PVnwtjUV2otxWPunjOxaAbUZUAakT+S6oiCBd7285yeRZSAKaPTeCYAIVDq+Fyb4FrRFYLkwIG6
	jQfyoBtzG553mJcBhPmsocAptp6zlVeDbxLr43otjflSbU2xR6aj7wgV7n5apHYklJRYoeQ3N5G
	u/FdMSuegt+Ij7rDK9eYaj6gKqpu1Y5bL4KeA7CZdNhVFdIdeMULhRQiVe2ZBcWvpbuxWN8VT64
	7G3EjhxYEtwlV5aXwwXViAn6YAa6Qkbqa5DLtTxJ4jhE4BTlePqnaxpgxVF/70DJUm6yDPdepim
	u8eFkVEluOMqVJ+vJsjAoyqBHHAB+ZliYUhr2upVZ4vpitcqow6KHMUOAnOfA==
X-Received: by 2002:a5d:5f05:0:b0:487:88b:55d8 with SMTP id ffacd0b85a97d-4871e212471mr14686456f8f.1.1790001251100;
        Mon, 21 Sep 2026 07:34:11 -0700 (PDT)
Received: from localhost (p200300f65f19a904d4f76eed31f2ef79.dip0.t-ipconnect.de. [2003:f6:5f19:a904:d4f7:6eed:31f2:ef79])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48724593bbfsm20917731f8f.27.2026.09.21.07.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 07:34:10 -0700 (PDT)
Date: Mon, 21 Sep 2026 16:34:09 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-pwm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] pwm: tegra: Check for match_data being NULL
Message-ID: <arE-s0zbTUn14aIr@monoceros>
References: <cover.1789741839.git.u.kleine-koenig@baylibre.com>
 <ed943d9be3b785514e0f65a5b8c13a78aba7a090.1789741839.git.u.kleine-koenig@baylibre.com>
 <arD7N6A6ncBNR1Jk@orome>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="memipl5lotfudpqg"
Content-Disposition: inline
In-Reply-To: <arD7N6A6ncBNR1Jk@orome>


--memipl5lotfudpqg
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 2/3] pwm: tegra: Check for match_data being NULL
MIME-Version: 1.0

Hello Thierry,

On Mon, Sep 21, 2026 at 11:47:17AM +0200, Thierry Reding wrote:
> On Fri, Sep 18, 2026 at 04:33:46PM +0200, Uwe Kleine-K=F6nig wrote:
> > It's unlikely but not impossible that of_device_get_match_data() returns
> > NULL. Handle this case instead of triggering a NULL pointer exception.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
> > ---
> >  drivers/pwm/pwm-tegra.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >=20
> > diff --git a/drivers/pwm/pwm-tegra.c b/drivers/pwm/pwm-tegra.c
> > index efb7ab60f602..b461d3877f43 100644
> > --- a/drivers/pwm/pwm-tegra.c
> > +++ b/drivers/pwm/pwm-tegra.c
> > @@ -323,6 +323,14 @@ static int tegra_pwm_probe(struct platform_device =
*pdev)
> >  	int ret;
> > =20
> >  	soc =3D of_device_get_match_data(dev);
> > +	if (!soc) {
> > +		/*
> > +		 * This can only happen if pdev was matched via pdev->name
> > +		 * (which should not happen today) or in combination with a
> > +		 * driver override.
> > +		 */
> > +		return dev_err_probe(dev, -ENODEV, "Unsupported device\n");
> > +	}
>=20
> We don't usually do this. Matching via anything other than OF device ID
> tables (or ACPI, I suppose) is a programming error and you deserve the
> crash which forces you to fix things rather than continue with an error
> that is easy to miss.

I don't agree to "you deserve the crash". IMHO even root should be
unable to make the kernel crash. I don't understand what you think
should be fixed if I hit that crash. My userspace interactions in /sys?
Which error is easy to miss?

> Driver overrides aren't going to work with these devices anyway, so I'm
> beginning to think it might be worth looking into opting out of the
> override behaviour for select drivers.

I think there are much more drivers that don't expect to be forced on a
device, so opting in for override would be a more sensible result. Of
course the path to there is more painful ...

Best regards
Uwe

--memipl5lotfudpqg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqxQF8ACgkQj4D7WH0S
/k7hBgf+Mv8A2J1CZsUSz8kkwCc8mTKkzF+KGU0UIG8cYdZlqbXQXAm7I6YA5zNb
Av6KwxLiASsheHlwQUjLwhC/5M81KkXopIKlp0try3ziTWVal3/IyXhRlX/k1/iu
fJgbYhBbwchPHXFTjiDhpCm+kO87nLt4wX3w4diTUAKaoNfXpKkwsCvbAHRQ15Jn
zV5rF2IVIXI3U5rrK4bGtwxcoUIf3Acx4Oru49yfg7KuqR3lFhg5tT3PawPoajrq
6Q+WP0gwSde/L/yXNof4LTXm8KcVj1caPTlPmEDJQHOQVo1N4sHPQ8VeBqoOW1DB
Y7wT32+k4l2PgwYk+jCXvqhycLt+EQ==
=0J1h
-----END PGP SIGNATURE-----

--memipl5lotfudpqg--
