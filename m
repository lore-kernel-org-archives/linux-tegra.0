From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH v2] ARM: tegra: ventana: enable internal display
Date: Fri, 16 Nov 2012 21:49:09 +0100
Message-ID: <20121116204908.GA27317@avionic-0098.mockup.avionic-design.de>
References: <1353051891-26725-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WIyZ46R2i8wDzkSu"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1353051891-26725-1-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--WIyZ46R2i8wDzkSu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 16, 2012 at 04:44:51PM +0900, Alexandre Courbot wrote:
[...]
> +	host1x {
> +		dc@54200000 {
> +			rgb {
> +				status = "okay";
> +				nvidia,edid = /incbin/("tegra20-ventana.edid");
> +				backlight = <&backlight>;

Note that the backlight property is actually named nvidia,backlight and
needs to go into the rgb's display subnode. Also, to make this work a
patch is required to hook up the backlight with tegra-drm, which hasn't
gone into 3.8 yet, I think.

Thierry

--WIyZ46R2i8wDzkSu
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQpqbEAAoJEN0jrNd/PrOhk94P/0dcfG+lh6Hzz2IosUN8DSiG
0kiBVuap6szFhnnC5O57lhUcJ1m2Tv57Dqqd3n2V8u1USofslyDy0tiez1rknhX/
DBLddYfPJ4Oq/kkUITem2fdlTAYDCrjAxacrE8gjVIvnVXxd9wAsgyvRJVUSD1NX
tTJMC2hR+haskZ+u3WihFS41KCL6s9FR7K7OWybfnwuazN0+tnbSr1lxz0xnJAnr
5bqXqK+9FZZjGpgMEZDv2JkyWp3mJSedeLKzMeGwCFhHepBd7zjXWUUtGOtrm6Mn
5XLzgU8qh5Njl5Sb2OclCb+ORBVdF2QayRRaZI15zTCbEk4f8ycpDEImGQV4Qi0T
q6bFKnw6GL/xOdsx2OyJTG48+e8LqXx58jTFBKVpz3MDb6+1EbpChuxf8ywq7SSK
6cEDdMprHbLfVXh25+yLHKYe96V2L3DnJAVk8D28McTh/5lGU2oEvuII+1jl3w0F
04FpF/19bGVTJGywZ2UOAQ3sCsDLuI3dwpHVzBgzyp4W8sR0pg7xNrVmJoZKNfDs
eu6GSGDnq2M7EK+QUV2GhX8GGf6ydLgynyEkm8lKZwfhuFvSr9bVpO6at6u62ASl
AieahoQGfTYMN8FVCublrlrazCRakeDLF9VHzU+9iwCYHRD8PzQxSY1v0TlC30ws
MUxKtDTr0u3rV3HnZ6tU
=Vb0T
-----END PGP SIGNATURE-----

--WIyZ46R2i8wDzkSu--
