From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH V5 2/2] regmap: add regmap_bulk_write() for register write
Date: Tue, 14 Feb 2012 14:13:14 -0800
Message-ID: <20120214221313.GB4035@opensource.wolfsonmicro.com>
References: <1329056383-20312-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5/uDoXvLw7AC5HRs"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1329056383-20312-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--5/uDoXvLw7AC5HRs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Feb 12, 2012 at 07:49:43PM +0530, Laxman Dewangan wrote:
> The bulk_write() supports the data transfer to multi
> register which takes the data into cpu_endianness format
> and does formatting of data to device format before
> sending to device.
> The transfer can be completed in single transfer or multiple
> transfer based on data formatting.

Applied, thanks.  When posting patches you should only number things for
the patch series you're currently posting - this isn't patch 2/2, this
is a single isolated patch.  The numbering is only there to help people
and tools figure out which order to apply things in.

--5/uDoXvLw7AC5HRs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPOtxTAAoJEBus8iNuMP3dZCwQAIFEp5dbX290LiXUYEHefOCd
Afbwm1g/6ir5S0EaleILmxyQd6RqpjJ5QSW2ynYe6AqLWBdO9sAS1IaSNk6DQH/w
+WrqdIrCJz9H4RsavhQ9SgNOHRgCsWCki1EYeJ1JQdVhbudhVWH3CfpIrrNpL+Hq
uE7Y1mmo9BVDU8EpUDoA/aZOeJYcKRDdp/yvg2dAaAqU8yMGZ/ecoKbzHY5SloRp
EJu2ucSKsn2uijMF9alEOoOMjfSjvDK+0zWLiVnBhGIg9kUSKVuYFCve0L7KuuVP
hYhssdf1Q6EtSXkKqy82fr08axp8g4VtUqZzYesJ6iNW6qAsVKGQk37wiBnyWYdA
FI10WWgy5fGoCYinwVvJAiRWdo4kTpipQKYMqWJnMEjdHXhRcevsKy6xDA+xjdtH
SXm74YmyhX+k++s8p+K+hFOCg4c4FYvEFt19rFYTUMEVIkJlKdSqheDjM11Oomj2
75r3LQJ0GCOvqBI9bFss7l67RbWou8ey4JTyIesoMb+UuieLkCsBgDAFESKdD8xv
qTgcSWwMYy3VGY9AEdG5CiQsILBv+qsOayQF0x0jyPZlplvpwndNV5G0sK17MWQe
C5DfdiPR+5fOAHZcalNcJ3mIbyEsGSlTXjlXtL7ukeGXuBRBVHO0SQaYu1b6p9iR
T0fEe/IRoxwvJfyLwFy6
=+2a/
-----END PGP SIGNATURE-----

--5/uDoXvLw7AC5HRs--
