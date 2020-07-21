From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 4.9 00/86] 4.9.231-rc1 review
Date: Tue, 21 Jul 2020 15:15:17 +0200
Message-ID: <20200721131517.GF44604@ulmo>
References: <20200720152753.138974850@linuxfoundation.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="kR3zbvD4cgoYnS/6"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200720152753.138974850-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, patches-ssFOTAMYnuFg9hUCZPvPmw@public.gmane.org, ben.hutchings-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org, lkft-triage-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--kR3zbvD4cgoYnS/6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 20, 2020 at 05:35:56PM +0200, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 4.9.231 release.
> There are 86 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>=20
> Responses should be made by Wed, 22 Jul 2020 15:27:31 +0000.
> Anything received after that time might be too late.
>=20
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v4.x/stable-review/patch-4.9.231=
-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git=
 linux-4.9.y
> and the diffstat can be found below.
>=20
> thanks,
>=20
> greg k-h

All tests passing for Tegra ...

Test results for stable-v4.9:
    8 builds:   8 pass, 0 fail
    16 boots:   16 pass, 0 fail
    30 tests:   30 pass, 0 fail

Linux version:  4.9.231-rc1-g8c3f33eeb0cc
Boards tested:  tegra124-jetson-tk1, tegra20-ventana,
                tegra210-p2371-2180, tegra30-cardhu-a04

Cheers,
Thierry

--kR3zbvD4cgoYnS/6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl8W6mUACgkQ3SOs138+
s6Hzbg/8Db7TRvvS6mFdcVCqgRLT+5AsqsXXDPsFfye6bobj8gzQF22cXYglYbDd
6MZ8qAuh3d+XmQOJ//Nzg7oRk2L64XHv1Z7wwnKe6394JMDD4ww3cDSdbs/XMyoU
nsXxpTFOmrXaDIOQkMdyvRji3oAzXfBTsQ/pjAEWImQGThYnsCBPp3e7oClBUL+Y
qElTtaKcE5vq1dBiT9p9wX/fnEurOJxPmsH4RwUSxyfnTzZGo17sR1Rr4X6BUd1s
yguxysNH9XnYqIknpYVGnFAjMkoFRQjlqE8Z+AXjQtuig7RuVF862+4wU5YK49tj
vAK2LYKEGE5LKgyejTGx+0V4Cx5eUUmX4nkl++ERg0ZT2Jyrf8skx6xTmoaKIJmC
FGRvkR6Fo1aJ4nANb4N/vK8f/Pws/0t08x9hiT6TdEw0cqmSyt+467V2loMPvr7H
MIiL77yllmLYHk/dUnHMN3ZmjAsCByyt2sxpnGRYIoyfZcqbDnajlKbocJgO7gMK
KZtFHNsY+NQjfKNznDVPFnxM8vZhnDMdxbpVc7kksLyER0jgVQDGQQvf0Oua1rdO
Za9pMoaPNdLNS+ViWlHVeqw7xI4+wklPz/vVK1UKTeH+PJ0ctlVTiFnCnBcaXjRl
BAtg0Dssh9eeXwGC2B8rzY6kPF3thm2J0Kff6VJgdNIMop4Ahk0=
=HyEW
-----END PGP SIGNATURE-----

--kR3zbvD4cgoYnS/6--
