Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C221CAA90;
	Mon,  3 Mar 2025 15:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741017176; cv=none; b=Wwf4iC3WoM5qSLWJcAab6wltGHTASQsDpuUahAjFCU9AtjAw81N0cNmwrkcRW0kS4mRwrtXpXqPkScYGkW1NbD5KzfO9LixJ3vifrnjf54Nvxp7lfPmNOc9ZTEmyI+ECxJQ7GWdr30muYOMteJh+3R+l0410xMn3SAq5siA1suk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741017176; c=relaxed/simple;
	bh=mjz4h19jyMH107PphGU0JfrHKMYkIEbfLn6txtw2ln8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VENDx9+TSwJvOjm+xNNh7IGUo9+lGB36Uw6aV5ClInDJxO/FwOIQZ9fyFYuLHMn8Z4W3WrsIAqe8vN/KXGicOuLl/oLWT/P3Dw2BTO0wI6TPEuSm6O8R0W8RDATlbg4TYnq/WW84BSXR/i189t3phqpgbgv0fYnr8PiwIa8y/+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CSyEg9D2; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CSyEg9D2"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4399d14334aso42612195e9.0;
        Mon, 03 Mar 2025 07:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741017173; x=1741621973; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8hC/RxYU3KwzwvbgtK4H7ivPdxTht/h9afEVgECKFcQ=;
        b=CSyEg9D2WM96lgmkomw31sZxBvF+BIGdE3zVlOR1+EyE40rQedoWBomEqsKBZr02DQ
         GEuaycWb9EUZKScwjjzqcXpOrq+u2tr6FCl7RWXK8/4g0QBJ7oNISpxMULYLp3isoUEA
         sgjCUeGscEvTFJS8bRq0uEOzVxGfWB4T6vjdyhxhz97iTSQhfMiCWi/ggzPIiYvNxWnN
         BDvdfbNKV1BgRMMh3Q6NEud6et5mGQo3C1dmjsmxJ2dcLPw7EJhhUM/OysDG58RIz6/q
         +0mIbjeU/paT9HxThloI/a63ee7bqoZE0rIwob3mEJX0L7KeSddlG6YaQ88X5YoCFMP7
         zBfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741017173; x=1741621973;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8hC/RxYU3KwzwvbgtK4H7ivPdxTht/h9afEVgECKFcQ=;
        b=uJpUBXNn2q43m+siTQGB43uhLn4yJXPasHQW+1Jj5+mBGftOb8Qw4T0PBwJIf38FlT
         yANJRvFL/FDUScdTHePPuS1hE+p6Gpv3Fxn/fOeLfdKX+rlYTfysyhtNTVzWGpoc0U4B
         79AQWw82dLqmfuzkAGrhpkUYN7Fd5jMLD70O8sskybOotooHNucfH43A8xBLjzgeBwXF
         2wy63KGwaVhJAUQQLvXP7PpPFDRv7uJFRpNJvVKk6e65I26X+HS4b/vRHuDdjgbEHhkS
         V7KsNXFQU33aBhLX/ByMKFdJ7Ay34lJxk+TIrQVcV8jUNyIuYf3cnHbFmfGwJ6im2/l+
         FYtw==
X-Forwarded-Encrypted: i=1; AJvYcCVd+NfTDspzhHsLwdjs8PKs1ocAYcQKk+aOX350S509NCZmd30HHf9NcoY3YAjHsIUgF8+EK/GIIbKq2RY=@vger.kernel.org, AJvYcCXZpz5ovQgvlsd3ioS6yfkiJXT1JRRlVtKQsqBaf77vkXIyJLeibtdklqZfh3ZlxCJLSzWec/Fmm1MDlqU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2gQfV0Ksw+rCAQZK+t4JLUGbwY5a65Livoa3NONk/l4QBiK5D
	5LJqQEr3ItSDPGfjdTecw8+Drz/iTGH9NU7UfHDw0sJ+JnYvPyO51IlyCg==
X-Gm-Gg: ASbGncuzsdXkCrApyqzB+SROxcw7aaAl6jgts+o/g9LUYVXgt+fu1oDcDtA2cxQQegg
	FlqCxuPWgPlnykSPYdOQsWQl2M0I6rVvMrz4RLdcp2ADS8BqtIlbBRrxKWvJnDdElEpHd52zNbu
	3Td1SSvE/OVYfQ4VrfP3iL0Am4RNioxjjUU+hc+lP6KSUa2sDsEMilTyUKdc118Fr8+Ul2cChpK
	/RanBjUsHAgf6VvHINcgajeUPk4/3uuL+9VOgpRHC/6h0J3UBb9xNE6BEeMsUQ/ItWBJbamMHER
	aoIy6oH7ICwdOJa8SjdwKAxYfs/xIUvJeV/lqf5APYp9VR26mOnCKkVHFfw0362gHY/So2ne2gp
	HqrMPOgIej2p982sxgI/RiMnPsJEiNH0=
X-Google-Smtp-Source: AGHT+IGupNswiH9OnCz/yDPQ93Xgrgvw5NMKWdT5Bh184jiMos9iZ9C4gBN23WflUpKx6RF4aCSIkw==
X-Received: by 2002:a05:600c:4e8c:b0:43b:c9c5:da2d with SMTP id 5b1f17b1804b1-43bc9c5dc60mr10273795e9.5.1741017172641;
        Mon, 03 Mar 2025 07:52:52 -0800 (PST)
Received: from orome (p200300e41f187700f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f18:7700:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43b737043aasm162534765e9.14.2025.03.03.07.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 07:52:51 -0800 (PST)
Date: Mon, 3 Mar 2025 16:52:50 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Kartik Rajput <kkartik@nvidia.com>, jonathanh@nvidia.com, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mailbox: tegra-hsp: Define dimensioning masks in soc data
Message-ID: <whorlitgzzhhq7yj3q5rkklvwha3327xou5rzznu7orhzlyej2@dauspmdwhjhl>
References: <20250123124632.9061-1-kkartik@nvidia.com>
 <hgvxugls732nt5yfoqygvxn52x73ioh4qpbbmu6swwmafsrmm7@w2gcbjinmujj>
 <CABb+yY1Dygm=v-2aRc_uwKoEC6EFX1njo8E1dzHqTQqfLnUniA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kcmcuopp7spugaqd"
Content-Disposition: inline
In-Reply-To: <CABb+yY1Dygm=v-2aRc_uwKoEC6EFX1njo8E1dzHqTQqfLnUniA@mail.gmail.com>


--kcmcuopp7spugaqd
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] mailbox: tegra-hsp: Define dimensioning masks in soc data
MIME-Version: 1.0

On Sat, Mar 01, 2025 at 10:42:21AM -0600, Jassi Brar wrote:
> On Thu, Feb 27, 2025 at 4:35=E2=80=AFAM Thierry Reding <thierry.reding@gm=
ail.com> wrote:
> >
> > On Thu, Jan 23, 2025 at 06:16:32PM +0530, Kartik Rajput wrote:
> > > Tegra264 has updated HSP_INT_DIMENSIONING register as follows:
> > >       * nSI is now BIT17:BIT21.
> > >       * nDB is now BIT12:BIT16.
> > >
> > > Currently, we are using a static macro HSP_nINT_MASK to get the values
> > > from HSP_INT_DIMENSIONING register. This results in wrong values for =
nSI
> > > for HSP instances that supports 16 shared interrupts.
> > >
> > > Define dimensioning masks in soc data and use them to parse nSI, nDB,
> > > nAS, nSS & nSM values.
> > >
> > > Fixes: 602dbbacc3ef ("mailbox: tegra: add support for Tegra264")
> > > Cc: stable@vger.kernel.org
> > >
> > > Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
> >
> > Maybe remove the blank line between the Cc: and S-o-b: tags. Also, "soc"
> > -> "SoC" in the subject and commit message. With that:
> >
> > Acked-by: Thierry Reding <treding@nvidia.com>
>=20
> Fixed myself and picked with the acks.
> thanks

Thanks!

Thierry

--kcmcuopp7spugaqd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmfF0FEACgkQ3SOs138+
s6Fjaw//aRaLRVwjsD8IiGHg9c6Kgl8nYrxmoYpvVws3Kqmd06eKIHn8ERH07PEe
tOi/xMRtHrYKhOV9Rpq59H+9CLNTnmrVwP35xhGPjkUKVJqAQaKuPQiusBGyZpJT
ydzr0IyTxJMF8H21P34ijZWfUw3tzHb3biLyrwpOoXWRV35hiWpHStPvAqVnrAGy
3xrlYDHXDWYWJJ1Nez35DjOg38bt/8BQPPBMZz/F00zYttnm4umQfi9QREslsYCl
vpBG3H8maz0I9j0uOgSMVl/6OEZay80bEg8dvQQaEI0cbQvEeCkhFDr+RZZthPax
RUryrvDZZJkjXu43ctCWndpNh09MjLiMywCbqqx6l2f5A6QusPYjMi2we/PgZWB/
gC7OT4QxUKMzLpp+2LrnjX/FfrEOCVcDqlNE2nBThYt7Fo3MHQ+kSrJlOkaMi4fP
BNQVMF07ihOW6gkSVHYkinJTNx3FamcTvY2W+Z9kFBfHhHcgjlY1Kff2fr+Pd0fS
naoSnYjRDijOb0zTUZt1wW0PN2mpDpiiN/g9N3/GshBt8leTaVcHhK+ZJKg4tOka
Daho+MmJgcIkXyvmNOREWuy3M2rk8X5qkW27/2a048Y1oFlqvATW7rGNrRfPrhJl
e3wDG4rMQYWKDdc/D+ko8nezWvEkk8d/U7vAOl9KQQ9bKBffjwc=
=+3kc
-----END PGP SIGNATURE-----

--kcmcuopp7spugaqd--
