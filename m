From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 5.7 000/243] 5.7.10-rc2 review
Date: Tue, 21 Jul 2020 15:17:08 +0200
Message-ID: <20200721131708.GH44604@ulmo>
References: <20200720191523.845282610@linuxfoundation.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="mYYhpFXgKVw71fwr"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200720191523.845282610-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, patches-ssFOTAMYnuFg9hUCZPvPmw@public.gmane.org, ben.hutchings-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org, lkft-triage-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--mYYhpFXgKVw71fwr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 20, 2020 at 09:16:26PM +0200, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 5.7.10 release.
> There are 243 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>=20
> Responses should be made by Wed, 22 Jul 2020 19:14:36 +0000.
> Anything received after that time might be too late.
>=20
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.7.10-=
rc2.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git=
 linux-5.7.y
> and the diffstat can be found below.
>=20
> thanks,
>=20
> greg k-h

All tests passing for Tegra ...

Test results for stable-v5.7:
    11 builds:  11 pass, 0 fail
    26 boots:   26 pass, 0 fail
    56 tests:   56 pass, 0 fail

Linux version:  5.7.10-rc2-g7d2e5723ce4a
Boards tested:  tegra124-jetson-tk1, tegra186-p2771-0000,
                tegra194-p2972-0000, tegra20-ventana,
                tegra210-p2371-2180, tegra210-p3450-0000,
                tegra30-cardhu-a04

Cheers,
Thierry

--mYYhpFXgKVw71fwr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl8W6tMACgkQ3SOs138+
s6F21A/+OmjoI5u3XrXQaGIJYUcB0XPSU30JDeTdhaLVPnZyB9zbz9tQYGc97UU/
QUHrKBPPqg9VEImgYK3xCb70uW2KGHSn9ug5Oyk33LccgrttQVdkviNoZBoIt5ZD
K/jLAGXO1tHc2tbzQiV+bEeyB+/n+2HMOIpbdhKAeaXPUMUEAkMiS8djZlyiZYTw
6b+2Y7Q93qKiswfwWswX3BJzPTEfR4ijQQSv5wEne6MztDrU5Q+CoQj9EKJRgKYD
y1AX5w7OSiwysGK8c3CUmEf80cIKm+dQOabuiUUmrNKbfrqcg632t6Fj14Ihd4M8
7vQZpmlMJko4088u2vU5HQk1eieJFVOp7vsgvtk1G/Dngx9BN8DzYkPw62Xp5kvk
zgtpjNGB7jd31RJzLEfb7gA6F/xw6Zltgw72UNX4yzB0wDtsvNKrGCGTjyeTwJdm
f/F23r3EjyFionvJrQY0uXlrB4jQhdkweI2r8LIfL2kn/yWKqHGeu3yuf1UQYccn
EZuDYRIjvhu1NIOfjHPVSW9pNeLh5JZWY6sS+QR6vk47kYDtW5UnwgS8NQ3OkMqf
BGKjpoyZdZHcnqdZNduX8hdMm707Jx0F6I+Tc8QDnhtitHg/5aNHu3uPR3CCZ0VK
clcLflckiOMCD48VFiIN8IznbcBwa2Hbv2iYwOiYAFKGkudI6D4=
=tCj0
-----END PGP SIGNATURE-----

--mYYhpFXgKVw71fwr--
