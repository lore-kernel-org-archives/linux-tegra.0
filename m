From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Helping out with Tegra
Date: Sun, 16 Jun 2013 12:37:12 +0200
Message-ID: <20130616103711.GB28222@manwe>
References: <alpine.DEB.2.02.1306050830350.8983@utopia.booyaka.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7iMSBzlTiPOCCT2k"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.02.1306050830350.8983-rwI8Ez+7Ko+d5PgPZx9QOdBPR1lH4CV8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--7iMSBzlTiPOCCT2k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 05, 2013 at 08:31:15AM +0000, Paul Walmsley wrote:
>=20
> Hi folks,
>=20
> Just a quick note to say that I'll be helping out with the Tegra=20
> upstreaming effort.  Hopefully will be able to help more than I harm ;-)
>=20
> Eric Brower has graciously passed along a T33 "Beaver board".  As you've=
=20
> probably seen, will plan to send periodic mainline basic test reports for=
=20
> that board, along with any others I can get my hands on.

It'd be really useful to have something along the same lines for
linux-next. That's a lot more work because it should ideally be done on
a daily basis (or at least every day a linux-next tree is merged), but
it'll allow us to catch such bugs much earlier. Perhaps if you can
provide the scripts that you use we can spread the load.

On the other hand I suppose most people working on Tegra will run
linux-next on a daily basis anyway, so it'll be quite well tested.
Having automated tests on a wide variety of boards might still be useful
given how developers tend to stick to a small subset of devices for
daily work.

Thierry

--7iMSBzlTiPOCCT2k
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJRvZVXAAoJEN0jrNd/PrOh8CcQAKjD+jcQmtaA7EbDH79eAu82
emIJjC25nmLQnpuQP8MR/jenwNeBpcC6W62lcu3132ZO5wooZUVopmGYN9o34YM+
5BUI3qI+wBpdSrXVRlz6M79+jtri1cv5D6ga+/YeE4dAp9pt7L+julwlMzXUoTFk
eYpt6EpRqgCR5t4J2ootaVXVt8eOdvwV1FsztOZm7WKJJbcLaQcRql6QBtd8IxS4
lonex6ayz/Qns/g7iiOsTFDbblXTQZ+gefSYqwgjfyb5Jo8X6BKyv0lLXoIYyeJa
VsQCTKsW8nd8NFGYDo2aVOjgUaX9A0jEN1YQbNyILfUhDGNVaGMJDr/WRS35yXbd
M+9onpjL2R7BTVxLtB2bZ2IZ0I/niBSLdbsJcSD43cbviyKcDjlvEE9+SinVRi0G
oZD2N/SftqJj85YmZNMIZJ/JLZUHKi5cE2Ieu2Ck9WQ3YQ0BvrTrdzcfldGWCWEO
yuMZFVZ+vQIm46iRNqc2Fo8NPkElQz0vqW2KolP2PJSBoEsoOr9CTsRWmZOFeiaA
7QO/0Tbug7WTbCE+RzHntD0dtZKuYCZqrzjO0j9uGWJxfUI7kRS6jUu6Urz3n+Pw
e471N5HLFtv6nLgOxRz7Dep74Idb8JKXe3K26iu1UZUeW5HICWb4tr4VsBQNLaiA
UIoJpybQ8fZ8J3ON6KAS
=wUML
-----END PGP SIGNATURE-----

--7iMSBzlTiPOCCT2k--
