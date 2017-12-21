From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [bug report] null ptr deref in nouveau_platform_probe
 (tegra186-p2771-0000)
Date: Thu, 21 Dec 2017 19:11:41 +0100
Message-ID: <20171221181141.GA31262@ulmo>
References: <CAHMsQjWKhgm5BnngHtH6QeWumNrbSS=LaTRD=XCSy5+iovg7mA@mail.gmail.com>
 <20171220190405.GD9687@ulmo>
 <CAHMsQjXAXj-0gctfkpi+f8cuPrxF67BWNnG0ZsnTHL3u307vOA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2061834636=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAHMsQjXAXj-0gctfkpi+f8cuPrxF67BWNnG0ZsnTHL3u307vOA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Anthony Eden <aeden-EfZU8u+QLuPpgkiH4x7ZXw@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--===============2061834636==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="huq684BweRXVnRxX"
Content-Disposition: inline


--huq684BweRXVnRxX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 21, 2017 at 12:32:39PM -0500, Anthony Eden wrote:
> Hi Thierry,
>=20
> Thanks for the patch. I applied on top of linux-next-2017-12-14.
> Different output this time.
>=20
> [   11.862495] WARNING: CPU: 1 PID: 254 at
> drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgf100.c:391

This looks like something that could potentially be fixed by this:

	https://github.com/skeggsb/nouveau/commit/305d38cb1d20bf909e2daf6989bba4b2=
7c3a3688

That said, it's probably worth looking at Ben's branch here:

	https://github.com/skeggsb/nouveau/commits/master

The top three patches fix various issues that might be relevant.

Note that the above is Ben's nouveau repository (as opposed ot a Linux
kernel tree) and the patches won't apply as-is to the kernel tree. I've
had some success adding the repository as a remote to my kernel tree,
fetching it and cherry-picking patches. git is very good at finding the
right files to apply the patch to, even if they are in different
directories. One exception where it doesn't work is when files are added
(presumable because git doesn't have a hash yet to use for guessing the
right file).

Worst case you could try applying the changes manually, they're fairly
small.

Thierry

--huq684BweRXVnRxX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlo7+VkACgkQ3SOs138+
s6HmrQ/+Mx6foZzheSzGWFyrCZSbR7a7DbzKIyLyjReu7D/L//8hqBU7lAo4S0zh
s3BcHj6JIX4k4cYUlgYWUmoUWXVSQ3a2QDgG9k68DtAAOsss/8M1pQqqgb2en19B
bbKNA5ux2/WQJmPHROsoYQlzSqQ3S2wfL4vNfuF4TepxqQHw7Eu/jjDhVD6apCk7
JpRaJgbNDfNXTnNqGZlHept82JYZcYahpTzyMkMuD6HugSk3YaaDR5BcWGKHCdMG
Updz+SCE2kZKHApRQhe62NdXocboJM3HG2RZEckoOSWc8Ojo7bUqayFAWJ1MXyYj
lzy9/52gEAw7VJtm5JaKGWaDWEkbx2du/iZHZvfLOP7pGc7nkNnwqpocPsRXYB3m
fthy3Sk6DLGb0mJvtCNLoABExg4C+KEcVPaN0pKtK9h+iL7JAaBQ4BxRrXgcaFKG
nxJ0armfitR9I0ZWPpV0iKD9X+Np4PPzlp3SQefoCC2MFDxJsYV5p5hMi96/TiaI
RN30VrfGa5gagOTEwr7nfePP3MmtbjDxj4fYcgNDq0BBxigquaN/u6Aj4SH0Eq/E
p+JLO3CXLEOifh727y11Rl6prjTPa68LO6zM8TjHgr+B+uDkqbS0kqVzvkUmdW9S
lZrYt1RqPKXrbbiUeVwzLCpqIkQWzK8BA7Cp2tU4x7+18I73el4=
=sDJg
-----END PGP SIGNATURE-----

--huq684BweRXVnRxX--

--===============2061834636==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2061834636==--
