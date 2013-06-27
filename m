From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] ARM: tegra: Add basic support for carma devkit
Date: Thu, 27 Jun 2013 20:23:55 +0200
Message-ID: <20130627182354.GA15734@mithrandir>
References: <1371994685-4997-1-git-send-email-chris.desjardins@amscins.com>
 <51CC6F83.2010606@nvidia.com>
 <51CC7B98.5090103@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LZvS9be/3tNcYl/X"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <51CC7B98.5090103-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Eric Brower <ebrower-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Chris Desjardins <chris.desjardins-8HJrC8Or5ylBDgjK7y7TUQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--LZvS9be/3tNcYl/X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 27, 2013 at 11:51:20AM -0600, Stephen Warren wrote:
> On 06/27/2013 10:59 AM, Eric Brower wrote:
> > On 06/23/2013 06:38 AM, Chris Desjardins wrote:
> >>
> >> Signed-off-by: Chris Desjardins <chris.desjardins-8HJrC8Or5ylBDgjK7y7TUQ@public.gmane.org>
> >> ---
> >>   arch/arm/boot/dts/tegra30-carma.dts |  461
> >> +++++++++++++++++++++++++++++++++++
> >>   1 file changed, 461 insertions(+)
> >>   create mode 100644 arch/arm/boot/dts/tegra30-carma.dts
> >>
> >> diff --git a/arch/arm/boot/dts/tegra30-carma.dts
> >> b/arch/arm/boot/dts/tegra30-carma.dts
> >> new file mode 100644
> >> index 0000000..e88134e
> >> --- /dev/null
> >> +++ b/arch/arm/boot/dts/tegra30-carma.dts
> >> @@ -0,0 +1,461 @@
> >> +/dts-v1/;
> >> +#include "tegra30.dtsi"
> >> +
> >> +/**
> >> + * This file contains common DT entry for Carma
> >> + */
> >> +
> >> +/ {
> >> +       model =3D "NVIDIA Tegra30 Carma evaluation board";
> >> +       compatible =3D "nvidia,carma", "nvidia,tegra30";
> >=20
> > Chris,
> >=20
> > This is not an NVIDIA board, it's a Seco board.  I'd suggest:
> >=20
> > model =3D "Seco Tegra30 Carma development board";
> > compatible =3D "seco,carma", "nvidia,tegra30";
> >=20
> > But you might want to check with Seco regarding preference of prefix for
> > "seco,carma" above.  I see no precedent for it after a quick check.
>=20
> That's a good point. The seco prefix should be added to
> Documentation/devicetree/bindings/vendor-prefixes.txt. I believe the
> rule for vendor prefixes is to use the company's stock ticker symbol if
> there is one and it makes sense, else fall back to name. "seco" is short
> enough it's probably fine either way.

Seco is a privately held company so there's no stock ticker symbol. Also
the canonical spelling seems to be "SECO" and their website lists the
device as "CARMA DevKit" or "CUDA on ARM DevKit", so perhaps model
should be something like:

	model =3D "SECO CARMA DevKit";

or

	model =3D "SECO CUDA on ARM DevKit";

The fact that it's based on Tegra30 becomes clear by looking at the
compatible and doesn't necessarily need to go into the model string.

Thierry

--LZvS9be/3tNcYl/X
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJRzIM6AAoJEN0jrNd/PrOhVnwQAJGFIiN197OGYPAfBiYmcCLe
BpVaQNPJmZRkK1gtoMQWw356yQQsZwYuFyiUpr6hmot8RYfoTZhozNsqAksZ0Nk3
dOch9NLFk0zYUJ4JFK3CyJP+H4SamVfB1VBOPypAN5gTKrzN9QCprXGscbXRm9iG
z47jioNNMXPiZmiPLIIXLwLGtLseU5jKD1XE4mHZKNZ4jgUm3bPqOc/+r2fHnIoj
eIPFj3R1ejd2CwuFXy34ZkSkdZs7b4oO17WpFibbXZ/xou/LDfb4j72Zs/8e6P4V
O43fPyylmNp0p00QLD4UoTU+VgwnL+h8vR2/GK+ayg8cbCptfeThhvgt6KMt/E6h
+HR/k7l0ZzWUVLRNRG/y30G53wWniHQjl33kxSEVDJ3CqRyvczVPxRid8R60NAyR
RClo7db5G0PrmzQOezK14/mjNzzeIk7i/SxL06H1NM3nxmSbFXybC06K1QVO2xi/
xdoelpWCUp6CdbX6ut4qpbyZ6ffEsh54p9B6n/6/fnFstEr39qgOtczuBh76EtMM
nNp9zo3Zfz6ASHqvPjX539OK42kQKmxoCU2T2KD5Nelv7PRVWCcWPSGPUxhwiHgl
fFsAqeHFY5jBBA/9oByjtWQPTdblZ5dWwKdJ7GCPjZ9pgDnzhOntZNM5fzFJzG4r
dSStZJ7P03CH/UxDZHvM
=WqMu
-----END PGP SIGNATURE-----

--LZvS9be/3tNcYl/X--
