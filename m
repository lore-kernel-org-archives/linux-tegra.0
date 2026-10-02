Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46524446F3;
	Fri,  2 Oct 2026 08:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790930454; cv=none; b=nDT+bs2MsaZMolLRM/a0hgO5tnxyNrXIpSJqiEAWDTEIMDYZFXo0V/XWSkVQb0S1FIloB/WKeL9ppuMiiWx28AB8cfJPbDTOy6hWw9aHemv2GnNBif5E/RjMUJw4gjkpG1RaMf8IfBAnrzW99ZAxgTMzc/NnGZDMTdlbl2yxpuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790930454; c=relaxed/simple;
	bh=HRVQh0PSjdezzHrirlbiJHmEIHs8Wj0NJANWsH4SpWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uZNfaK/isCVUG5+IUFjUiJw7gbESOxwQHatwz9sI0uQ1hIzfJai3si3zh34h3M23G5wXUknFt1KXiH9krQ8HbI/wpM5wbKGP72fImEnPtYlv7npH1601Ecz+TqsNgBOltWp6Rk/fUqAu+SDRWmpunNRRETq0075f62dusw9DR6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l5MEdZa7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l5MEdZa7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 880731F000FF;
	Fri,  2 Oct 2026 08:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790930453;
	bh=zrYzwm+U6B7vnp7EzUH666hKcyMOTE8Ld6euHirNAs8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=l5MEdZa7d/SQvBv4tJKS1opy6zrwTgELwOLW1dldiQ+MaMIWK3uLRS/Q5ejzutv7O
	 meLj8MEE0/QKd5xvLAKR1EaydZXt89x5kEn3ThRLRgExMwdeJtxDTQ0nj9iTLQncvB
	 Zx0fM0boXw6iA4DzR9cZqz1Xe7A+CmKLrM7JhBDx9PVKXzisrDW79b3zOjriSUJqT/
	 eGOBq0eI38IVXyuM3jtXO1f+lnPMbXQJ9UEGfuHjXfy5bX24Cg1ZnCvi8lLBveZv0u
	 fZr3ePdlx70LokY4mVRt2yBAGU8dUbveMGIeDg2FQCaWQRCso9aClnvIMTvHOjot+2
	 xuxp0w6gj9qTQ==
Date: Fri, 2 Oct 2026 10:40:50 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: fix typos in comments
Message-ID: <ar9qxmyIZEP2IlMp@orome>
References: <20260907062107.6859-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oheurlbmnxaftnrs"
Content-Disposition: inline
In-Reply-To: <20260907062107.6859-1-hemanth.selam@gmail.com>


--oheurlbmnxaftnrs
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] soc: fix typos in comments
MIME-Version: 1.0

On Mon, Sep 07, 2026 at 11:51:07AM +0530, Hemanth Selam wrote:
> Fix typos in comments, reported by scripts/checkpatch.pl using the
> misspelling list in scripts/spelling.txt.  Only touches comments, no code
> changes.
>=20
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> ---
>  include/soc/tegra/bpmp-abi.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks. Though honestly this seems like a waste of LLM tokens.
Spell checking is one of those problems that has been solved for a long
time, though obviously we don't consistently run it on the source code,
otherwise we wouldn't still have these typos. Maybe a better use of LLM
tokens would be to have it write a script that can be merged and that
will automatically run a spellcheck on the tree.

For some reason I can't seem to get checkpatch.pl report these spelling
mistakes, so maybe that's part of the reason why these are not flagged
before they get merged?

Thierry

--oheurlbmnxaftnrs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmq/bg4ACgkQ3SOs138+
s6FZURAAuJ1QBW2q6LbsTK+7GEkWQydlrbvlV4ZSbOba5neyXP5DwAk6muuAzrOu
1vxsRcknIuzIxOQLUCbgFUu5GSpkcloUoK9knN0zhA5Wg1loAnJXZ0KdHyoWGAEC
im8Khw/8anYkxc8QknWCtX70FSijIOEmO1jZRmRPRfCKQ29TAT5dOrshqjl4XNPF
Q/HbN+jTYevHZeyosywTwPJsYPXQL2eGdBTZ/PB8ZgKr+ZH2bEAwCcSx7sOqFWEi
f3m6/khUOa4J2Osdm6WU8GLy+tDrVteL3xuVRU8Dr5SzROrfcEYuT5QZDy6j+jci
5zOgV1xqmom2nhEDTHlNyLaKllZVZPvBm4iucXsXU1WEhG9jkoFi5sZFNtXfsnRp
fKrUJevwcrvtBBbrcOcm1f56q3ewjwg7HXyx02ODWadEs1f+SXWfz98Z7zaVdSvL
/PeFQPeEOWCX1dXYDjukedr62Pf7+j2eRTKkQx/ADGLo2ySh1WuLgu4ugUlD5HqD
cIEj6ZaRZYet2pONt/4ik5PaKAmb3hORn+6YQGo0fMp7tcSxTDd/ixqslwGBBi41
PBEk2wjNmstVcDyDqpQhKesOtcBGnuW15wGes3yaR/EYBZ6MKEMQBZJGQLO/ojdi
VdwJs6GfsD3WeRmWb+JKXwdUwjQh0w/36se25vEnGsmJC6xSxYI=
=noT/
-----END PGP SIGNATURE-----

--oheurlbmnxaftnrs--
