From: Bob Mottram <bob.mottram-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Subject: Re: [PATCH 3/4] ARM: tegra: enable big-endian support
Date: Fri, 09 Jan 2015 16:27:42 +0000
Message-ID: <54B0017E.2060509@codethink.co.uk>
References: <1420817231-8346-1-git-send-email-bob.mottram@codethink.co.uk> <1420817231-8346-4-git-send-email-bob.mottram@codethink.co.uk> <54AFF7E6.9030308@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="PTaB3HPSgXophbnXMGNGdvfVjk7QsQsnq"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54AFF7E6.9030308-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-kernel-81qHHgoATdFT9dQujB1mzip2UmYkHbXO@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--PTaB3HPSgXophbnXMGNGdvfVjk7QsQsnq
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 09/01/15 15:46, Dmitry Osipenko wrote:
> What about suspend/cpuidle? Won't it make sense to set BE mode in reset=
 handler?

I did try adding:

    ARM_BE8(setend    be)

to the entry point within reset-handler.S, but to no avail. There are
definitely problems with suspend, which currently I can work around by
turning off ARCH_SUSPEND_POSSIBLE. More investigation is going to be
needed to get the sleep/suspend working.


--PTaB3HPSgXophbnXMGNGdvfVjk7QsQsnq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUsAF+AAoJELpo8mEI3J+Hk2oQALjHdEddLe1UzIKUoy2CSOZk
LOUzzBunXlIFVH7+W1bg5B7j4g+PWoI3GBCDQVbI7ApmnLARBBNfkK46Y0sQRFed
SjcSaW3mVwzHQX1ChvR2hJ/P65r9zymmB85dmj78lcMegI/6KAX3/5+y9z57eDtT
prHZUJaJj9ia4+nPUHl2xoBDoWBpVibj1CcpjuEi2o1p9a+x39wLCy4RNKCDH7PV
v90ASN24rAYfyWa7sMoSLPinRpzyb1rtbrGXOuo+JctLMuL9ju1SfH1W+l1FAQ56
U1Wn7QoTw+JpTBQZljyqK6npGyog1UxOSD2vYDQ+bO5pjzSvn5/Y+qKgQKpPH+d8
EKpKiHACZ3vp8WDAh/xioEzBL9Br7S6A94G6K7m1QY03xAUyz6kSn+tRGcvXaIN1
Bf3xG0neTfCgi7OrU9ZRA/7PxUeg+QgxnRQuVoLPE+OT7b5ZnTKm+Ia0ytQYbm+K
GI8603U/d5vMhtFPUmk83UOZuNFLZ1h0QmPmrcRxNcJGI+jTQ/jJOnAuVpeRdaO0
3GoDkNuMdxBYZRpdFvzZWoJTNOo9t72oz+1GTFotbSRDNhHX0Qji4P0PX54/Rn9g
UdPLI1//+yBH9WVbUXz3Q4VVBLDEsQpcHE45PYXfvVXUeYtuCJF//8Eq5h00pH9O
/bhrXXsOMKD90X8iaxCm
=dgJK
-----END PGP SIGNATURE-----

--PTaB3HPSgXophbnXMGNGdvfVjk7QsQsnq--
