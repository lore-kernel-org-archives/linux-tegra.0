Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4D7301486;
	Tue, 22 Sep 2026 10:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790073457; cv=none; b=Fp9Wix0kMcUWU75byg3IfzHN0DcuL8NzwO+8b5fy5juJrxvUSIGZ95n2aLphXzTejDlYNA3Nf21+fy+EVJwDvuoI+MAwsQq8Io39z8cykyCALlsGSH4dS3JxFygYK2WW64HrT7YG+yp0ZvTdeymGp23kng5DElpk0HcfrIEmVa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790073457; c=relaxed/simple;
	bh=3M0t5RQc7p6GSqzyWpqv1TMpTMmM5rotd0cQdLq206s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mvRHkV+GZtwQ+0tmIMyzDW1FWVnQvthT0g6r7+VUibGDsWBBAJRFAB3Io0rz6OWu1u7x9HBIRfDwm9F1lIn9znOQm+BgBz3cwgVN8FVRrc0NTDbFYHCK5Tf4bC+7+GV5B9wNAdtYbCv5r6ZpLoQvI+mGbbu/yKhrFE7te5TJz2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=djaZMueK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="djaZMueK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B04F1F000FF;
	Tue, 22 Sep 2026 10:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790073456;
	bh=9qYhdBx6eI0bqS87UCdoGz031hpcyXo1bBQGVLMDSAw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=djaZMueKojttjm0JZjB3g1xxCKno0468HX+L7NRlMDTudSKjVBg4MVErWxjeBypVn
	 VOS7znUpfcI3yA3yUMXBsbf5Hjg2EMTb1xCNw70ria7iCkwqYQFoolVWGPGCnHw5z/
	 N3u8zBLWV9oxLS9nd0RF2fl0m2ZWMnL3/i0UdTSv4JR9kAUVxTAPxhrzyT2oqdrRql
	 0OQfaqB831us/2nHqpJo4DyuXKIV327sJcGEuMZqdltVUWSGh13wypxrsZeY62tbLN
	 yJAdNmrTHPaiU+Fy898aPljqvIgDoLrsWk8JGas8aySL2RbJ3H7FbAm0QjQ/4SbUxV
	 nDCcHjRQZBcBg==
Date: Tue, 22 Sep 2026 12:37:33 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: jaidevshastri@vt.edu
Cc: Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: tegra: cbb: walk cbb_list under cbb_lock in the
 debugfs path
Message-ID: <arJU0GNEZaDa7HrU@orome>
References: <20260921-mb-tegra-cbb-v1-1-67aa3712aa4b@vt.edu>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lp4xtx4ddvooot6s"
Content-Disposition: inline
In-Reply-To: <20260921-mb-tegra-cbb-v1-1-67aa3712aa4b@vt.edu>


--lp4xtx4ddvooot6s
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] soc: tegra: cbb: walk cbb_list under cbb_lock in the
 debugfs path
MIME-Version: 1.0

On Mon, Sep 21, 2026 at 09:08:41PM -0400, Jaidev Shastri via B4 Relay wrote:
> From: Jaidev Shastri <jaidevshastri@vt.edu>
>=20
> tegra194_cbb_probe() and tegra194_cbb_remove() add and remove cbb_list
> entries under cbb_lock, and the error interrupt handler walks the list
> under the same lock. tegra194_cbb_debugfs_show() walks it holding only
> cbb_err_mutex, which the writers never take.
>=20
> A debugfs read of one CBB instance can therefore run while another
> instance is probed or removed. list_add() publishes the node with a
> plain store, so the walker can see a node before its links and private
> data are visible, or step onto a node that remove is freeing.
>=20
> Take cbb_lock around the walk. cbb_err_mutex keeps its existing job of
> serialising the error log output.
>=20
> Found with MBCheck, a static herd7-based memory consistency checker.
>=20
> Signed-off-by: Jaidev Shastri <jaidevshastri@vt.edu>
> ---
>  drivers/soc/tegra/cbb/tegra194-cbb.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/drivers/soc/tegra/cbb/tegra194-cbb.c b/drivers/soc/tegra/cbb=
/tegra194-cbb.c
> index 69ef929e0..d1a80b0b5 100644
> --- a/drivers/soc/tegra/cbb/tegra194-cbb.c
> +++ b/drivers/soc/tegra/cbb/tegra194-cbb.c
> @@ -1990,9 +1990,16 @@ static DEFINE_MUTEX(cbb_err_mutex);
>  static int tegra194_cbb_debugfs_show(struct tegra_cbb *cbb, struct seq_f=
ile *file, void *data)
>  {
>  	struct tegra_cbb *noc;
> +	unsigned long flags;
> =20
>  	mutex_lock(&cbb_err_mutex);
> =20
> +	/*
> +	 * cbb_list is modified under cbb_lock by the probe and remove paths of
> +	 * the other CBB instances; cbb_err_mutex alone does not exclude them.
> +	 */
> +	spin_lock_irqsave(&cbb_lock, flags);
> +
>  	list_for_each_entry(noc, &cbb_list, node) {
>  		struct tegra194_cbb *priv =3D to_tegra194_cbb(noc);
>  		u32 status;
> @@ -2002,6 +2009,8 @@ static int tegra194_cbb_debugfs_show(struct tegra_c=
bb *cbb, struct seq_file *fil
>  			print_errlog(file, priv, status);
>  	}
> =20
> +	spin_unlock_irqrestore(&cbb_lock, flags);
> +
>  	mutex_unlock(&cbb_err_mutex);

cbb_err_mutex no longer serves any purpose (though, honestly, it never
really did), so it can be removed entirely.

There's a slight issue with this patch, though it also previously
existed already (partially). print_errlog() ends up calling the
tegra_cbb_print_err(), which in turn is quite slow when it goes out to
the debug serial. On the other hand, we can't use a mutex for the dumps
during the interrupt handling.

Probably best to get rid of the mutex for now since it's obviously not
needed and maybe revisit this at some point to get rid of the spin lock
around the slow UART operations.

Thierry

--lp4xtx4ddvooot6s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmqyWmkACgkQ3SOs138+
s6EvgA//dColuYvMY+3wyF4LECwq19QZi9hh10Pp/7Sy8zXDcbJPRZWwN0utFW6F
VP0ZPdYmiMZOeuEHLxpuKJOE4JxRPVnwxSG2r4YCfW2ashcxyWgHxQ9vI8QrmYoF
VSRUIiCvwx+9L1R5DAe7WYubyF9XgeT9B2ms584tZ/KSijAWJV1KeGIguysE2ShQ
9mRB8GW/E3vk5IKjr3cJvfLvcSF32pHcr0YAokHvEUs8IpRGkMKzGJSl/fAesJhe
QyjGDNjJ5tspWoAd4r0JEAc1QjPIjOs3RI2d5l0gu0frG/OSTjcZ+vb3foSSMMbW
r0b7+GINNqF3/eFleX3Pltmy4Zk2VNyuBk6ETdCnCsVlqaywtUtLwGSVDSrWEhhi
gkXhhlxKTlXSimiKybl5hpA26wzyV4QD7MaoQj7JvgTB7qGboijiqkBV16KPqhsv
yuEB+UqGxLWXy00hsCx9RWlu7OIz2Pcownxvmu4DZ3BIIuYMLvTefrB3wj223Lh1
TbbsOCzCo9Eo7IAonTg51kastP5mMgdzABA+LojfFrSmcI1LOUPLc/79eEJobF4q
1T+mg19u/qaJQiyp4nQGZI3Os09FN8kdhq3en+x++BInD180GbClkSZEt1Y5lPHS
fru0puEIFWmfiXKBipCd+LbmGYyEs52T+ne9vGQofJw6IGOEVow=
=ziWv
-----END PGP SIGNATURE-----

--lp4xtx4ddvooot6s--
