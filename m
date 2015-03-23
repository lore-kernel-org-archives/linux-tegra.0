From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [tegrarcm PATCH v1 3/8] tegrarcm: Get platform info
Date: Mon, 23 Mar 2015 10:27:42 +0100
Message-ID: <20150323092741.GD11268@ulmo>
References: <1426639141-12060-1-git-send-email-jimmzhang@nvidia.com>
 <1426639141-12060-5-git-send-email-jimmzhang@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6WlEvdN9Dv0WHSBl"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1426639141-12060-5-git-send-email-jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--6WlEvdN9Dv0WHSBl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 17, 2015 at 05:38:56PM -0700, Jimmy Zhang wrote:
> From: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> Add two newly added platform info fields for t132.
>=20
> 	uint32_t warranty_fuse;
> 	uint8_t skip_auto_detect;
>=20
> Signed-off-by: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  src/main.c | 30 +++++++++++++++++++++++-------
>  src/nv3p.c |  6 +++++-
>  src/nv3p.h |  9 +++++++++
>  src/rcm.h  |  1 +
>  4 files changed, 38 insertions(+), 8 deletions(-)

I'd prefer if we didn't apply this. As far as I can tell this was an
incompatible change introduced in some version of the miniloader and was
subsequently reverted because Allen complained about it. So if we merge
this change we're going to be in a bad place where we potentially need
to support two different versions of this command on Tegra132.

Rather than go that route I think we should stop supporting the blob
miniloaders post Tegra124 and rather switch to a different model for
newer chips. The miniloader for Tegra210 doesn't support nv3p v1, so
we'll need to come up with a different plan anyway.

Thierry

--6WlEvdN9Dv0WHSBl
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVD9yNAAoJEN0jrNd/PrOhMlYP/2T+a7/foeyBAaCZpUNi3iuP
LGXNA4ljkDIEqZuEcUF/4LOzojQyW5iIEL/8w3VjjOjXf+C2+5NHcEp5sgI8Zgll
ZBNODELJPgOEP4Bl8ifoTV2wTnYkUlK3kU7ORqnULcmJluDHgWPmjQxfUoQviQTh
FakMYJB0rYoupMTirR3q+hZYPxZXmGorCzBxJbHLdNeHuPaUImreadKV59NJ3jS9
4qLAnsnqKocdNdYHrZgOSfa4s1g4o8O/zaLn6I4xg6BPXGJ4nMcX7+wf1sLJvmuj
GH/csSE4fp1EAA49V7TwE0dbq1zRy9RJaMkBKLeQ/z2Zjj3n+MiaZ5O5vVnn5JBA
xIHex+MLT+1NxZOQKyl5hCm0z3RJXPNqrZQanf/hlanlDxZSgyWs8nkcNpzaU231
GA2GWlW477GnrQw0QGFZUCpv1j5Uq+IO/0dl9eDDYzEkM3S/NTyzP+ID0XbYEO9J
byMjVl4nC5E1PnQKZfxgydjUyo3tUdPNzJzm9dq8kU9fwoahgYKc85kfaNwo3eDu
Yak/GNFyehkTC6yw05npkeMcxo0SdX/A2p2Jw+o6hkNynK07em7zS8xpOSvgx0Zv
IAlhQ9XWaYjI8issw4WW9Y9YeSLAsRyGS4Y6wnl6OhKjVoDY4zoG+jBpL593aKWN
bclrulJm3kN4breM3sGh
=CYdq
-----END PGP SIGNATURE-----

--6WlEvdN9Dv0WHSBl--
