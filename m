From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 4/5] dt-bindings: tegra: Update compatible strings for
 Tegra flowctrl
Date: Mon, 20 Mar 2017 15:32:00 +0100
Message-ID: <20170320143200.GA17169@ulmo.ba.sec>
References: <1489584715-23138-1-git-send-email-jonathanh@nvidia.com>
 <1489584715-23138-5-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4126863085864124480=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1489584715-23138-5-git-send-email-jonathanh@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


--===============4126863085864124480==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vtzGhvizbBRQ85DL"
Content-Disposition: inline


--vtzGhvizbBRQ85DL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 15, 2017 at 01:31:54PM +0000, Jon Hunter wrote:
> Update the compatible strings for Tegra Flow Control driver to match
> the device-tree source files for Tegra.
>=20
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  .../devicetree/bindings/arm/tegra/nvidia,tegra20-flowctrl.txt     | 8 ++=
+++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-f=
lowctrl.txt b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-fl=
owctrl.txt
> index ccf0adddc820..d92bf782985f 100644
> --- a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-flowctrl=
=2Etxt
> +++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-flowctrl=
=2Etxt
> @@ -1,7 +1,13 @@
>  NVIDIA Tegra Flow Controller
> =20
>  Required properties:
> -- compatible: Should be "nvidia,tegra<chip>-flowctrl"
> +- compatible: Should contain one of the following:
> +	For Tegra20 must contain "nvidia,tegra20-flowctrl".
> +	For Tegra30 must contain "nvidia,tegra30-flowctrl".
> +	For Tegra114 must contain "nvidia,tegra114-flowctrl"
> +	For Tegra124 must contain "nvidia,tegra124-flowctrl"
> +	For Tegra132 must contain "nvidia,tegra124-flowctrl"
> +	For Tegra210 must contain "nvidia,tegra210-flowctrl"

I have a slight preference for the format:

	"nvidia,tegraXXX-flowctrl...": for TegraXXX

since that's what we've used in other bindings and is also closer to
what is, I think, planned for the longer term (i.e. DT bindings with
YAML(-like) syntax).

Thierry

--vtzGhvizbBRQ85DL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAljP594ACgkQ3SOs138+
s6EnMxAAqKRnYEjPrIU8QuZZt0Okl4tl1pron3bNGckwdxkqrnAss8+b+NXyrU9c
rYsw8v6M/NhxcN+koG7GYmWWKzRZ72+EBavBevGT5BgacSqGx7jyEqh2RLAgDWMb
IzHKDoSV95sRajFTXmkoOJ55yTqizAwUtRuhwQfSB85b2nmzdO57VOkqd27Ol2+I
A1HYPoT6T38wg8wEcGKlPPFyfXgayoYix9mGlkZd8zVuifyC5WkNDCj6BM0VWf9P
C/PPXh9copRyOxnHihjrNASELCnTwUdBKpJKYlHa62he9ncyq3sd7QbVTarL0PCT
//2VBLJmI8YCF9F4l8YIsx9ScKlhc9rEjIQpHzwC1sAFTvpvuD8ajaesR6H0nBOg
bYEXKGttfL74yUDQNk2OLD83ymQ3WKpaUEzoWsQjcwzrz/gtaHtPXxJaJXhFkkBT
ZiDhzTlfCORnENOby/o6GpxhLrHvQK9AjdHEbseRu9rcc9BeISBor8rKYoy+bXC4
KVg9e8WC9zbyzm5DMi2X6MV2jlINjwZ3Fy0uUDYuvcd33W7HAdZ/h1rSnaEQFnmE
9Aio0Ww8DghD/nC7u1GiRvI88LWnbatgDDRyhX7ojHGrQ30qBG2yJNwgXxK6N0Ku
Y5IGkgUshoQ9Vb/EN3hjHZCbe5hAD49lGzOZQ7MwASPENI47Ark=
=ctA/
-----END PGP SIGNATURE-----

--vtzGhvizbBRQ85DL--


--===============4126863085864124480==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============4126863085864124480==--
