From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Tegra 2 T20 NAND Flash Support
Date: Wed, 4 Jun 2014 16:41:35 +0200
Message-ID: <20140604144134.GH28484@ulmo>
References: <538E6FB5.5020806@ziswiler.com>
 <1401866283.2173.3.camel@tellur>
 <538EC96A.4050702@ziswiler.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Hlh2aiwFLCZwGcpw"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <538EC96A.4050702-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marcel Ziswiler <marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org>
Cc: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--Hlh2aiwFLCZwGcpw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 04, 2014 at 09:23:22AM +0200, Marcel Ziswiler wrote:
> On 06/04/2014 09:18 AM, Lucas Stach wrote:
> >I took the Linux Tegra NAND driver from Thierry and cleaned it up quite
> >a bit. It now works with both ONFI and non-ONFI NAND, at least for
> >reading. Writing doesn't quite work yet and I've got side-tracked with
> >other stuff.
> >
> >If you are interested in moving this forward I can put up my WIP patches
> >to some public location.
>=20
> Sounds great, yes. That would be perfect, thanks.
>=20
> We even once got an universal NAND test infrastructure from Micron based =
on
> a re-worked Colibri T20 which we could use to validate it with various NA=
ND
> flash parts.

Excellent, I would've had a hard time digging up those patches. It's
really been quite a while.

Thierry

--Hlh2aiwFLCZwGcpw
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTjzAeAAoJEN0jrNd/PrOhtCgQAIhnoZ5dZoDz68B9F9Ezq4Yj
PA/InMPo16m9G6VYBfgnMoMJm0hq8Yj/6lMSpp3GuEyEHro9sOfKZOfaUgMVM0QP
ONs0jbye//V5Ztd51PTYM9ipFkKo8U1Ng4ox9ZTdk6VwoM+ah3kB/yAYZWzbAnH8
oQ344iN6lLhwcxJxCov+ElNH+4fH+JRnIMnYAx8mU8w7tTkcPDdPvprsSrR8fMz5
FRcPgWoJDsrKbwfALkKDRtm7PJAIgRUKZ6YgsZAH6GJlpkj/bbPDRLay3wDZDIkd
e731e/2p3K41SYqIKAa3U9/g1nFOA7Mtp2yKrLMzd5AEQd3gwZorw7KFxPYGroX0
vMjMNENLMiT84mU8Gabqc6wSmMriazMvZ+esDzDMJ/H8qtz7X0M2B0zQg+I1/M4z
V4dM6h4XCMsQVX0RMosgp6MzQAWE7dPVidv9R/x56D5xVoyBjRHR/mSjhZWqWLKZ
IKEhwBnbVs78bhakM0Q66pfcfHYN9aybSdL33NcI+BgLr2xhT2fz+R6FfE+IHPcY
Cypw9dM2e3NfSe6CyqhcD2agCeaM3js20mvO0oAubq2WeChkVh2Xezi7MwjGiwWp
tdhcGMAukRn77nzNG9QAolaTG3kl6GavXyEB2ARzSfx8a7/WBa19OFDWjrA6n/n/
bvZNdy+cEP01uCGeGQFr
=G4/m
-----END PGP SIGNATURE-----

--Hlh2aiwFLCZwGcpw--
