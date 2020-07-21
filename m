From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 4.19 000/133] 4.19.134-rc1 review
Date: Tue, 21 Jul 2020 15:14:28 +0200
Message-ID: <20200721131428.GE44604@ulmo>
References: <20200720152803.732195882@linuxfoundation.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="h56sxpGKRmy85csR"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200720152803.732195882-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, patches-ssFOTAMYnuFg9hUCZPvPmw@public.gmane.org, ben.hutchings-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org, lkft-triage-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--h56sxpGKRmy85csR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 20, 2020 at 05:35:47PM +0200, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 4.19.134 release.
> There are 133 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>=20
> Responses should be made by Wed, 22 Jul 2020 15:27:31 +0000.
> Anything received after that time might be too late.
>=20
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v4.x/stable-review/patch-4.19.13=
4-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git=
 linux-4.19.y
> and the diffstat can be found below.
>=20
> thanks,
>=20
> greg k-h

All tests passing for Tegra ...

Test results for stable-v4.19:
    11 builds:  11 pass, 0 fail
    22 boots:   22 pass, 0 fail
    38 tests:   38 pass, 0 fail

Linux version:  4.19.134-rc1-g9d319b54cc24
Boards tested:  tegra124-jetson-tk1, tegra186-p2771-0000,
                tegra194-p2972-0000, tegra20-ventana,
                tegra210-p2371-2180, tegra30-cardhu-a04

Cheers,
Thierry

--h56sxpGKRmy85csR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl8W6jQACgkQ3SOs138+
s6HZuA//YJM+ABgzrc6euDLcUHvP7nC4HSBdh4Yrlv8L3MFMX4ubp95z1hdxG8b0
fWGVrrwykQ6NKtiZdVzbj4DpbSQFw9ek3UJa/25cbAad9mKCup5EwbaQrzvGicvY
Hj4TjhKiij+IOTkUdYzyyJ55nSO2+DB72Lvjb0857aD9OflZpNxQVbtgpn24Tr/X
hqN1MoM+yTOHZnpddiBKVbMz6dPCH/0D3r173h8GliJJtxpCJaKOCfnyCgk85Y6f
DOpbxs/Mycr1uxqJMf0hrz2Jh3Bk1T1azc+5+WLdxypNHAYXuIOATsyaw90fM9Sg
q/ormpZHlWLacFocLMZk+o4uFLnKO7EX630dKc/E1fsWjdCOSaZZnV57p7HTTnvs
+qUGdcf33AiHhweHE07ND3Pj1HAOLLtsElTgcn1spO0WmhYSF5ujrLXVqKUGV1DF
A789Tw68o9AmYFWYXD/ROYjTanC7KOdhKz5gT+lASG6YQJViVK9bhbAuFPFTM/uj
fjlDzrnJy56Sk6GNEYVG6Nfdy/IIzG8MSLzaIZP8xO6qOcQUqxl28DL1gTyWLodZ
v8pWAS3MtOY7+qPpTvVAdFrp9nHvIalUbQjj5ZniQruJTCM3l9ETM5yijjpSo8bj
Y3ooRR5Dp4GJ6QcZKUOFSImi/aT7+DSsOASLrHCifGpUxCpTMSA=
=/sPq
-----END PGP SIGNATURE-----

--h56sxpGKRmy85csR--
