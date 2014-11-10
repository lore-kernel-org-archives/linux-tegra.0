From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] timekeeping: Move persistent clock registration code
 from ARM to kernel
Date: Mon, 10 Nov 2014 10:53:26 +0100
Message-ID: <20141110095325.GC12126@ulmo>
References: <1415388855-35074-1-git-send-email-anatol.pomozov@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LwW0XdcUbUexiWVK"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1415388855-35074-1-git-send-email-anatol.pomozov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Anatol Pomozov <anatol.pomozov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--LwW0XdcUbUexiWVK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 07, 2014 at 11:34:15AM -0800, Anatol Pomozov wrote:
> ARM timekeeping functionality allows to register persistent/boot clock dy=
namically.
> This code is arch-independent and can be useful on other plaforms as well.
>=20
> As a byproduct of this change, tegra20_timer becomes ARM64 compatible.
>=20
> Tested: backported the change to chromeos-3.14 kernel ran on tegra 64bit
> board, made sure high-resolution clock works.

Using this on an upstream kernel doesn't work, though, because 64-bit
ARM doesn't implement struct delay_timer which the driver needs since
v3.17.

But I suppose the delay timer infrastructure could be moved into the
core similar to the persistent and boot clock as this patch does.

Thierry

--LwW0XdcUbUexiWVK
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUYIsVAAoJEN0jrNd/PrOhP2gQAIq3dXzLlzPdAUe5ZqwwaVjw
2bG24nAbEOrSYTFov6xv2/p4PlveZlA5e7dHSohjLWWqwB3OjxLB1GRjmb2felU2
sJ+lViGQZjh0fOuPI++ByrKa38fUrtHf2WgdyOIO2rsAUOKLFMJhxShtEi+i7ISJ
jhvioOZpHd2FZzF22em13jVx0HQX+sSpups5JDb6hFDtJGUr/2hIa/x/DW0nM2oU
4bqNfUddk7OlssL/npjn4X5eTEUun7gyodRrw71JVW249nDj08dnqjlSsA/GBVxJ
gpUsX0vyG0bC+kQZKJg4lHPR2l0YvbgPmLzfMxelUB0siLvetCYIGbHCNBk1MSq1
uAO5uxmI1BupvxSssAPwdZYoqi9YsFVXmhUhEqZaqd1TfJGwXIyS0SVunY/AzebB
fcCDyGJUbWwekRrzIiyDVjZqHVzeqoTxP6N1stE9mVIlkp/kr5Zsae2LabcHDFDf
g2TbkzpcUkNiaQASIRFFcl6AOVLl823LeaqRono7CHBX/9/uczgpOkespsjdPqqR
THtvd5YXodacMfh0N338E12KNjciY6xzCRDEISmfBfqnJTErhPa0gZaawdiOD5K8
TMk5aQjeHlElRgu+AeuYIsKhFnX5PXD3rW/uiwC0mLqPaE8NAfdK6UsdDXejKIJE
2Adhu06JP7uWM+4QOVik
=nFkv
-----END PGP SIGNATURE-----

--LwW0XdcUbUexiWVK--
