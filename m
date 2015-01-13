From: Bob Mottram <bob.mottram-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Subject: Re: [Linux-kernel] [PATCH 3/4] ARM: tegra: enable big-endian support
Date: Tue, 13 Jan 2015 09:05:32 +0000
Message-ID: <54B4DFDC.6000705@codethink.co.uk>
References: <1420817231-8346-1-git-send-email-bob.mottram@codethink.co.uk> <1420817231-8346-4-git-send-email-bob.mottram@codethink.co.uk> <54AFF7E6.9030308@gmail.com> <54B0017E.2060509@codethink.co.uk> <54B0028C.8050802@gmail.com> <54B00C58.3070303@codethink.co.uk> <54B40C99.4020907@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="NAqKGmpQvxIgH7p7V2ChlNwjitJvdrBto"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54B40C99.4020907-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-kernel-81qHHgoATdFT9dQujB1mzip2UmYkHbXO@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--NAqKGmpQvxIgH7p7V2ChlNwjitJvdrBto
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 12/01/15 18:04, Dmitry Osipenko wrote:
> I fixed cpuidle and suspend for tegra2, it involved fixing reset
> handler, sleep and l2 cache resume asm code. Also fixed tegra timer and=

> i2c drivers in order to get booting. Unfortunately I don't have tegra3
> hw nor support for it in QEMU, however cpuidle should work I suppose.
> I'll post patches later.
>=20
> https://dl.dropboxusercontent.com/u/3913472/IMG_20150112_202034.jpg


Well done.


--NAqKGmpQvxIgH7p7V2ChlNwjitJvdrBto
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUtN/pAAoJELpo8mEI3J+HLCAP/2b4oHgQluVLwxeAhV7ACheq
aqLrTcUTR8pCOdeMU+IahOv7Yl0lrpv2rklMPtGSaNfXJSPuZ9gMj/n7+UNXgDpi
dIp3AVTEu4iq9Jy6e6Ap2eqTxBNH+wrpoTqS5Yj83hwkYl4DNkdazSxs9w4n5Rqt
rs923eLDDrLyOoSZUJNNtO2RsiZVxf7F+3wb47pYePd9tCj+RrbIXjEfjU1Wwm82
ShybMxbaiPOoDpkwVXY6jxdv+cndpYrpK1MC3/ApDtBv2WmKus9w2qQJpIWi30Oh
9tLhWwkK1/90P2qOyzWQjDG0cKvwlg91U+IZ+zQf6KbgLBiXn7vCTf+eeJAGJogR
mzQybrWRly+7sKYyEEDXjznuldQ+DbddHi7XhH9S4v2foyBG0HV7c+7tcIsgJdXq
Gqnc56HBMWlYwvzBr/e+gycYWl948kjfzqbKOsJRuEiv1irQ2H34hG7pTWN7mY/r
YXUuZ+t+JZcXAHhAS35Xw7FJbERubfTCaTQ5171xGU5abFS4g6uTB9t9mOTI/tra
W9+zSLtp+1GcrtSP5LHsy366mBrKMPgS7v60N8ogo6seB7EM+VHh2vQd1gZddo/m
Z3HlzgXZnuegB6cmVXe36HqQ2iPMsqFUfOwwi0j6g0LGA7gSd1c+k1QK7+3AIKlV
8GPzHvMurjzcy9UVnUHX
=mCtF
-----END PGP SIGNATURE-----

--NAqKGmpQvxIgH7p7V2ChlNwjitJvdrBto--
