From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 4.4 00/58] 4.4.231-rc1 review
Date: Tue, 21 Jul 2020 15:16:27 +0200
Message-ID: <20200721131627.GG44604@ulmo>
References: <20200720152747.127988571@linuxfoundation.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="kadn00tgSopKmJ1H"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200720152747.127988571-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, patches-ssFOTAMYnuFg9hUCZPvPmw@public.gmane.org, ben.hutchings-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org, lkft-triage-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--kadn00tgSopKmJ1H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 20, 2020 at 05:36:16PM +0200, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 4.4.231 release.
> There are 58 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>=20
> Responses should be made by Wed, 22 Jul 2020 15:27:31 +0000.
> Anything received after that time might be too late.
>=20
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v4.x/stable-review/patch-4.4.231=
-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git=
 linux-4.4.y
> and the diffstat can be found below.
>=20
> thanks,
>=20
> greg k-h

All tests passing for Tegra ...

Test results for stable-v4.4:
    6 builds:   6 pass, 0 fail
    12 boots:   12 pass, 0 fail
    25 tests:   25 pass, 0 fail

Linux version:  4.4.231-rc1-gecea46f88646
Boards tested:  tegra124-jetson-tk1, tegra20-ventana,
                tegra30-cardhu-a04


Cheers,
Thierry

--kadn00tgSopKmJ1H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl8W6qoACgkQ3SOs138+
s6Gudw//R5Dde4AlZJtDzRiLDKG4R2BLWgxHmBiCohxv+4FUHF/4e77Y4cRgGoMi
uldQPQkSW9KgV46PoC4tNCoyLpNtGrhkfp2qZrByUudLE+Yxs9H8C9E9nZImlTcK
G2so7z96daZQ9u1SUrqX9yzW5J2p4qXzcyJLB2TQgJmPV4ixC5LXW1i/wg/HF2Qz
gRWdX5SsOmr4U9DKH6/+rs+Mxi4EZrRL9bLOzaVlYYlbbQgQ9W24hfvAD0JT6FQv
1atiFRnwz6laEDouViPKVU29EqOCD9jrdHu+ngBvqltUCHRRRgfTphTaz+E8Usx9
VKeBACuX6e4YlCFQX/Mi5WQctwUt/5D1CWtYdsWDYYOS3qpgyBxXCw1zs8yTyX1o
Dfxch1+SchXtfFyute8SDyut3WX4YhzVBqYkwdkKag3PNUQAvdgciRMTIjZF28kr
Trrz1VcNm+5Sc3cNuh5vGmHr3EYT5Fq4B29fnaVR4Az+wSgznW1I1qxz32dUYhDP
x3Wn+LGkpRVQszWlx2hVXrGCSrqh8i5QV3wroSThP3TY1gESvnjEWv13Jb6f/Nt2
ze50Y3hKLRmbfOvFlrXH6A1jedfh/ZChv6jgwyI8VehVnzUtc7/QOTBlTNG0EXKB
5lXe8S7ya+r5+hY4eU184NDUiNTnqwMEdpfMlqhaq8BBCZxdNxM=
=EfOB
-----END PGP SIGNATURE-----

--kadn00tgSopKmJ1H--
