Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD0C3603C9;
	Wed, 29 Jul 2026 10:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785320157; cv=none; b=pk/TGnmagd18gbMnEW+84SrDZZgX0V7u4UTav7qSgfz1iUkICCi2MQibCfiJ9djxEfdgZCDcC7my8fif1uT5aFjZ+Xs2FOgqHbHFN0DVYoG6F4OXA0l/dHGiXWPxNfuHSWZGqLmYHObJBcqnKydMzC6HnAEAAD2lizofI2Se6eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785320157; c=relaxed/simple;
	bh=R0itJK00LSUlbdsRKfkBmvn63ZPA+PnWm1a7Be7lgiM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZI18LlS1ci1bEjw05oztjZ1QE3DZPJWO/1brj1okixlcZegFhQU8Q3/Q7XIJdGsbh1m2+Pbo2Q+s+vp5hlqocyc0oa2ELDk0jmt1E0u7gplXi0Jf6kNOJngZozWXuN3fH1VL/XwDBvXEnx4Ga6nFGOOKHQv4WMO7LfOgtcIPOW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VfhOsJsm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VfhOsJsm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F3281F000E9;
	Wed, 29 Jul 2026 10:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785320155;
	bh=pRSHFW5y9uxO9c/P3jPBwDtJyXYexZDegWCvYiCZFvs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VfhOsJsmW5qQWQ8xTf1khK6x8YbHrzcmV/BsKISuMMh7nVDN3is2ws4GezxziKtLc
	 rRfh6A/KN6XGbpaI8pZpBM+jqQ2c+7pyWULMD4vp7tvanzQllIaIET2868KcnPmNvC
	 j0zssnoA9Y5rN6iQ8Y86wrNTowwz7BfWtFC0MQkpUjGU0FBbv3y3GhKD06S+3oR8sw
	 da3fUGRyBd3NlJZVgZBd9sLSEJuntdXo+3W5sSohGd6QWU3UQtr7mZfgR3hSXdqDsl
	 Azy3eRSipOny7AV7oc9m8vNL1q0VqfJfXET4eW2GeW0Xcjko7oQzKDEtLhGAx+nnJk
	 YPWHyBNnkcZmA==
Date: Wed, 29 Jul 2026 12:15:53 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Dan Carpenter <error27@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, 
	Artem Lytkin <iprintercanon@gmail.com>, linux-staging@lists.linux.dev, marvin24@gmx.de, 
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH RESEND] staging: nvec: use strcmp() instead of strncmp()
 with magic length
Message-ID: <amnPL9LvsNgWW0HA@orome>
References: <20260723161823.23921-1-iprintercanon@gmail.com>
 <2026072836-swerve-splotchy-bf8d@gregkh>
 <amjKwgaQc0sM4UW8@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ojp6wdg7qyvwg6nq"
Content-Disposition: inline
In-Reply-To: <amjKwgaQc0sM4UW8@stanley.mountain>


--ojp6wdg7qyvwg6nq
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RESEND] staging: nvec: use strcmp() instead of strncmp()
 with magic length
MIME-Version: 1.0

On Tue, Jul 28, 2026 at 06:29:06PM +0300, Dan Carpenter wrote:
> On Tue, Jul 28, 2026 at 09:09:23AM +0200, Greg KH wrote:
> > On Thu, Jul 23, 2026 at 07:18:23PM +0300, Artem Lytkin wrote:
> > > Replace strncmp() with a hardcoded length of 30 with strcmp().
> >=20
> > I thought we were trying to get rid of strcmp() usage?  Why add it
> > back?
>=20
> I don't think we're trying to get rid of strcmp().
>=20
> strncmp() is for prefixes and and strcmp() is for whole words.
> They're not the same.  strncmp() with a fixed string always
> seemed like nonsense to me and it causes a static checker in
> unpublished Smatch checks because we've seen that bug where
> people wanted to check the prefix but used the wrong number of
> characters.

Maybe the commit message should be updated. It makes the argument that
bat_type is NUL-terminated and that that is the reason why changing this
to strcmp() is safe. But it's not. There doesn't seem to be any sanity
checking on the EC data that serves as input to this, so the length of
the string that is copied could be any arbitrary value for all we know,
meaning we may already be writing past the end of bat_type and insert
the NUL some place invalid to begin with (we should probably fix that at
some point).

The real reason the conversion is safe is because strcmp() stops
searching the haystack if the needle is exhausted. Since the needle is
only 2 characters in this case, *that's* why we don't have to worry
about the limiting the search.

Thierry

--ojp6wdg7qyvwg6nq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmpp0tQACgkQ3SOs138+
s6GhJg//SLWlLDA0U7aX3DzUW6YR2GmeIn/r3wr9R7fXgXxx/dpPVh2N6Vfo4Zxp
hb8dhVS5/FjPSD0QtT9sfO7tsTzwcim4FFKM8J+KfnKP4u+s0LNMKrUmp7GZUMow
x/Wofbhq4opHEixqMJEyQcUd428CYYe9JFZB/uA+2iyTjBW5vQxamO+FXdSwYL47
W4YcFlU5Ycl1HeZTxvlnDPctHJbuIzoNvkm0i6d02p/OfMib7eUH5J7zBBsHq8if
dTVZ67y9fd62dPO0D8MJl4BdPHTSJNBGGffik+6tIRL+6teM5UHfC17jmwhmC3je
UxQrDhprVdj+Pcti2u9LbmF65JGQmMYjgQShumBwglLsYsnblosgVfvO+Ey3zHk0
3tpCIwHV2cz2iKFcCsvGswCBTCcfX2VR7c79EkmHPS2X/KmhH8ZoSMqSjvPOMXxx
QP8CfrSd4Bu7ZzJd/xVSgkEosDNlLwFQHIgNR3zgRQ58iOYy2Uz2ce+Ih2GExmhP
3CiiR3hlpdcqyqP+/PDxVD03NnrHolJtaIfsc5eM6bXkJqR7d85xD8Ht4oG7q1sH
fN/46k451eiH6dwvSMFsNl/oPrIO8O0BxXGWibKGk+QH+FXdssOLxEisLAou91Q8
rUancrvWrde4TUSA6EhUV/DsO0LBcE+ThEo7BqOtS738lP79dsA=
=b+P8
-----END PGP SIGNATURE-----

--ojp6wdg7qyvwg6nq--
