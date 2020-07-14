From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 2/2] usb: tegra: Fix zero length memory allocation
Date: Tue, 14 Jul 2020 11:32:56 +0200
Message-ID: <20200714093256.GG141356@ulmo>
References: <20200712102837.24340-1-jonathanh@nvidia.com>
 <20200712102837.24340-2-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="DNUSDXU7R7AVVM8C"
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200712102837.24340-2-jonathanh@nvidia.com>
Sender: stable-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--DNUSDXU7R7AVVM8C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 12, 2020 at 11:28:37AM +0100, Jon Hunter wrote:
> After commit cad064f1bd52 ("devres: handle zero size in devm_kmalloc()")
> was added system suspend started failing on Tegra186. The kernel log
> showed that the Tegra XHCI driver was crashing on entry to suspend when
> attemptin the save the USB context. The problem is caused because we
> are trying to allocate a zero length array for the IPFS context on
> Tegra186 and following commit cad064f1bd52 ("devres: handle zero size
> in devm_kmalloc()") this now causes a NULL pointer deference crash
> when we try to access the memory. Fix this by only allocating memory
> for both the IPFS and FPCI contexts when required.
>=20
> Cc: stable@vger.kernel.org
>=20
> Fixes: 5c4e8d3781bc ("usb: host: xhci-tegra: Add support for XUSB context=
 save/restore")
>=20
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  drivers/usb/host/xhci-tegra.c | 22 ++++++++++++++--------
>  1 file changed, 14 insertions(+), 8 deletions(-)

Actually it would seem to me that this is no longer a bug after your fix
in patch 1. We only ever access tegra->context.ipfs if
tegra->soc->ipfs.num_offsets > 0, so the special ZERO_SIZE_PTR case will
not actually cause an issue anymore.

The reason why this was crashing was because tegra->context.fpci was
allocated with a zero size (because of the bug that you fixed in patch
1) and then that zero-size pointer was dereferenced because the code was
correctly checking for tegra->soc->fpci.num_offsets > 0 in the context
save and restore.

So I don't think there's a bug here. It's not wrong to allocate a zero-
size buffer. It's only a bug to then go and dereference it. Are you
still seeing the issue if you leave out this patch and only apply patch
1?

Thierry

--DNUSDXU7R7AVVM8C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl8Ne8YACgkQ3SOs138+
s6FDDg/8CEz3TwFQZ66rzYhrJ454N+7L/iQDGUFwOVWDItvRGvKT/b6mGVa/CA1g
mAm1dcSUr15ALz9ktJVS1kYlzUQ3XV8gLDtTQz3DPL3IULc75ykyWb6l5P0VMvQH
s0kPu6SLZE/tLhApcoO3jzoq/m0aj0U1oBm4iDRlh9EbCZip8l4Er6Lcd0j4cRdY
skYD09DG3v+WW2TVc97nfaWrf+J4e00a+96K/0tuw3WDFMO9CPuHOkAJ+RLVbVbF
Ct3GDkQcrSeZ2J+ajbwXMPnRED493BJXLBAGfPGCvXh+r3gPCOVWWzFfnaXjs1mt
m558IaWk5LRlxcKgzVY0L+vXDqBNa4oR5t9KszRosbUXqlg3sbJfIcAT4thelP9x
1GHPrRmAlb9/Mw0zNsFaJK+O4WqLPMyms0nDHuY8Tcxhckr+vFuqZCdGW3GNI+ON
fAL+UIr8BHjJ/pBInLe5fwAJImtLpI6o2G7sRlMtOYgnURCZAT/5ZFxlhGH/ShWL
VVVYvf/M1oExnK4Y8kODARu9cgy1bCzvAMPFYT+Gec+TEECd2YWsPJYmFw91LiDO
o3TnsA6g2LZmLzDsFfpp/TB+Bn0GcBz2znyncuZJltshMtVPbI4Ai/HXUIfXUMn7
Ktl/q2KzH5cOrfyVAcn/4cNyOlNt/d9Fq7hU0kJzcooZCLxAgzs=
=qqmM
-----END PGP SIGNATURE-----

--DNUSDXU7R7AVVM8C--
