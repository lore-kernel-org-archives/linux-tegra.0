From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 01/31] ARM: tegra: add missing clock documentation to DT
 bindings
Date: Fri, 29 Nov 2013 12:49:01 +0100
Message-ID: <20131129114900.GN22771@ulmo.nvidia.com>
References: <1384548866-13141-1-git-send-email-swarren@wwwdotorg.org>
 <1384548866-13141-2-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kUBUi7JBpjcBtem/"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1384548866-13141-2-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--kUBUi7JBpjcBtem/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 15, 2013 at 01:53:56PM -0700, Stephen Warren wrote:
[...]
> @@ -60,6 +81,12 @@ of the following host1x client modules:
>    - compatible: "nvidia,tegra<chip>-dc"
>    - reg: Physical base address and length of the controller's registers.
>    - interrupts: The interrupt outputs from the controller.
> +  - clocks : Must contain an entry for each entry in clock-names.
> +    See ../clocks/clock-bindings.txt for details.
> +  - clock-names : Must include the following entries:
> +    - disp1 or disp2 (depending on the controller instance)

I'm not sure if this makes sense. The name could be the same independent
of which controller uses it. If it isn't then the driver would need
additional code to find out which instance it is and construct a dynamic
string.

Any objection to just make this entry "disp", or "dc"?

>  - dsi: display serial interface
> =20
>    Required properties:
>    - compatible: "nvidia,tegra<chip>-dsi"
>    - reg: Physical base address and length of the controller's registers.
> +  - clocks : Must contain one entry, for the module clock.
> +    See ../clocks/clock-bindings.txt for details.
> +  - clocks : Must contain an entry for each entry in clock-names.
> +    See ../clocks/clock-bindings.txt for details.

There's another duplicate clocks entry here, although perhaps Marc
already caught that.

> +  - clock-names : Must include the following entries:

One other thing I noticed here is that you use a space between the
property name and the :. None of the other properties have that, so it
looks somewhat out of place. The same is true for other bindings, but
there seem to be inconsistencies in some places anyway, so perhaps we
don't care? Well, I do care, don't know about you. =3D)

> diff --git a/Documentation/devicetree/bindings/spi/nvidia,tegra114-spi.tx=
t b/Documentation/devicetree/bindings/spi/nvidia,tegra114-spi.txt
> index 91ff771c7e77..d4f2d534934b 100644
> --- a/Documentation/devicetree/bindings/spi/nvidia,tegra114-spi.txt
> +++ b/Documentation/devicetree/bindings/spi/nvidia,tegra114-spi.txt
> @@ -6,8 +6,10 @@ Required properties:
>  - interrupts: Should contain SPI interrupts.
>  - nvidia,dma-request-selector : The Tegra DMA controller's phandle and
>    request selector for this SPI controller.
> -- This is also require clock named "spi" as per binding document
> -  Documentation/devicetree/bindings/clock/clock-bindings.txt
> +- clocks : Must contain an entry for each entry in clock-names.
> +  See ../clocks/clock-bindings.txt for details.
> +- clock-names : Must include the following entries:
> +  - spi

This is inconsistent with other bindings that require only a single
clock entry. I suppose that this is required because of the driver
requesting a specifically named clock, in which case that's fine.

Thierry

--kUBUi7JBpjcBtem/
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSmH8sAAoJEN0jrNd/PrOhrcsP+QF4Kaeqj8sbZ8Aerc9ncK/K
/+a7qjBUvmKnpjaPKo8ZL1Xw38g4jv5qZ0QCOPnfDz5hN/Zv03BaR51+YyKgMCNh
AeVRdA68IrQ7t286V4WyPWrzXK3vReWu+QeFxAVB/l7Ir/C8BexhZWqSqmFX+IJy
jtlKIBe7+HOT+ZZFm8Gqd6rGkjjUEHU1Y/5Xi7MNZTT15snZeqQo4XfK9p7F73GQ
X5oXDUWUvG37UOxkiVN2/6o6StN5412FiYWTUaS1VqBL+Kd9E4jc6vkqCHmGZB5X
b3xxfoytkOlRL6fpQ90B0nGvOI/yjaKAzdsBVlr+jqEdbuSOHn9b+ZD3eqvmMQoz
EzbQlJEUWanBreWGYBCpfQAeXHkPY9GVmYYav+PkUMk6yDHHKXwzHyiBHLCjYuQw
HvJbxGhIjcaS6FhkDnj9nTP2BruIfaZWOSmOqBH3a9EYquUX13JzZMRlcAM6rBAW
6ygP7VLt7BgInFFUhZnvlzhAfMj38d8OHj41jZzvmd72JQXtE+3HbRhXaUUykihE
KhLyMT0ZZRtgvYJuGOQNtSxTNrin+7wMkhj5Qg36pdBB/OQ6YdT5O/yPaBVEJrnF
elRmGDA7I5YxtDK41Bi4IGSYDJjNqW81LKVYmE04+L3MDJJI/7LEZIBTojiCjuZh
z5hg0Bs7oXit1+ZThpXU
=3Caa
-----END PGP SIGNATURE-----

--kUBUi7JBpjcBtem/--
