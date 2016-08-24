From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/7] arm64: tegra: Add AGIC node for Tegra210
Date: Wed, 24 Aug 2016 16:48:17 +0200
Message-ID: <20160824144817.GB6887@ulmo.ba.sec>
References: <1470756082-19099-1-git-send-email-jonathanh@nvidia.com>
 <1470756082-19099-2-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="l76fUT7nc3MelDdI"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1470756082-19099-2-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--l76fUT7nc3MelDdI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 09, 2016 at 04:21:16PM +0100, Jon Hunter wrote:
> Populate the Audio GIC (AGIC) node for Tegra210. This interrupt
> controller is used by the Audio Processing Engine to route interrupts
> to the main CPU interrupt controller. The AGIC is based on the ARM
> GIC400 and so uses the clock name "clk" as specified by the GIC binding
> document for GIC400 devices.
>=20
> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm64/boot/dts/nvidia/tegra210.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

Applied, though I removed the tegra_ prefix from the label and replaced
the literals by symbolic names in the interrupts property.

Thanks,
Thierry

--l76fUT7nc3MelDdI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXvbOvAAoJEN0jrNd/PrOhdxYQAJdohqms+kdAcRH7kG4V1kAU
edRHEiGcfUIpvTXNSzTRMy8y1PsP4qQmCIn5bB4ngp9pDYMyjtGMM7eX3R8RKe5W
YQD5SZ+TazV7KSlrYosWXkugDtbVNMbLX+g73Fo2OouSqJUrV0lR67urMA9xI4fp
gJBC9wmEnP5LQN4BhsZCEoAoj8V7GmIEV/q3e7kuPI5aOpydcHZ9btkXCxbmeaYM
lILux7F/vNRsT5Amh0R3DF5gaeB5+z/djzqhnDoE/ZjyKZvgoSEj+ICvqeGsya9T
ZJPhTT1gyW403n9aUiMrmmgHRErWAPHCcGQk/ACRpAr5Dm/kuci4H3K6VTSvSU/3
UV4Y0ebIAWlJditp30enrSK+0YfEcRoLPCH8W0M5DiST18O0S2yaPNBSHEmEl7pq
/b8H8UwMKYficX6oGXFJe3O5xmw/81miwX+KQ+FESVJlTfaB8PGsEo3GV5/PUlyz
4dFj6v+gJpS1QRu3mEFx2j9W6Ax4X+xZCsUJsKpDAy8oh6n/Z1ElqKEhSDm/t6WL
FOQ+B6TosR7mnyEH5KLC7vrR6foQX03OTn7FMNGfhkoool9ThujPnxSVjc4UUd2b
6VcCpjb1dBvRUp3MfV+axosBHbM2TPfT46FjRBinWDAZMvkE+3uRoupAC8fd6ftn
olfsKX1aGBXUT+Bv6jpj
=tiGO
-----END PGP SIGNATURE-----

--l76fUT7nc3MelDdI--
