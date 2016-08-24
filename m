From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 6/7] arm64: tegra: Add the various audio devices for
 Tegra210 Smaug
Date: Wed, 24 Aug 2016 16:56:30 +0200
Message-ID: <20160824145630.GG6887@ulmo.ba.sec>
References: <1470756082-19099-1-git-send-email-jonathanh@nvidia.com>
 <1470756082-19099-7-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="vJguvTgX93MxBIIe"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1470756082-19099-7-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--vJguvTgX93MxBIIe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 09, 2016 at 04:21:21PM +0100, Jon Hunter wrote:
> The Tegra210 Smaug includes the Realtek RT5677 audio codec, Nuvoton
> NAU8825 headset codec and the Maxim MAX98357a audio amplifier. Add
> the nodes for these devices for the Tegra210 Smaug.
>=20
> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 44 +++++++++++++++++++++=
++++++
>  1 file changed, 44 insertions(+)

Applied with the interrupts-extended property turned into a pair of
interrupt-parent and interrupts properties.

Thanks,
Thierry

--vJguvTgX93MxBIIe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXvbWeAAoJEN0jrNd/PrOhy7UP/3yg0hvUqPXZT8TTlYUv9or+
uZPFqyFamMJUHOjx8TRrABkl/8M/gjG64D2ttj79j7pIm2LZjqAUFUOxBAbMOfXJ
y0LcGTztu2Pdja+0I+W5+nBEFIYbcjPrAX9ecezcNsdqFroGgJXxv6a1xbo94unE
NMcsgaTerL+uupc5qCZTp+Yjw7xTLVvecn7aU/pCx24kJhrqd6iZlND3L4EuO8MG
M2JDpcnpjg2LqnpUAshALZVy5CQywlpxMXL+mcic1AtOjgdgxa6x35AiMvb4FDVr
NP46crLCs4qHIsECzfFXR1AkLJ7sD03i+2EMzuro3i8Bm3OXGlrkUstYDRJg2YAl
hxQUNQLVLfOy8lBpQs3GiiIuD2cTskaEJOjL3Ddhl6eaZPY6jjAF5nszAxUtRMxd
5ActwFxAk8S/6OIYW7jGr9w98r4KJN97Dl2LxqLqXV6Db/o8pxlZhdqX0or80cx2
vhTXOLjIA/miPQ8pL8gp+aHc4rnNkZ234Ut8baAhqbRY4EVjrKXSyU2mw5q0/R7u
MYQKeNX/5QEOY/VzgYF3r3/LJbjgxWpE3s3rCDGx0FJ1pf9c4PxSE00wMAKkND5O
eoXZrH5Mw53g6DwW/F5nXzHB4ivlSb5GTeBxQ2KypSV0T6C5s+wJ6CHE+CsqWSzs
hCVh1hWNfRljGbbWpOZW
=z6+8
-----END PGP SIGNATURE-----

--vJguvTgX93MxBIIe--
