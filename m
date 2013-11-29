From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 08/31] pci: tegra: use reset framework
Date: Fri, 29 Nov 2013 14:29:58 +0100
Message-ID: <20131129132957.GU22771@ulmo.nvidia.com>
References: <1384548866-13141-1-git-send-email-swarren@wwwdotorg.org>
 <1384548866-13141-9-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ULJ2Z7kCM1hyNsWd"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1384548866-13141-9-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--ULJ2Z7kCM1hyNsWd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 15, 2013 at 01:54:03PM -0700, Stephen Warren wrote:
[...]
> diff --git a/drivers/pci/host/pci-tegra.c b/drivers/pci/host/pci-tegra.c
> index 0afbbbc55c81..174a5bc2d993 100644
> --- a/drivers/pci/host/pci-tegra.c
> +++ b/drivers/pci/host/pci-tegra.c
> @@ -39,6 +39,7 @@
>  #include <linux/of_platform.h>
>  #include <linux/pci.h>
>  #include <linux/platform_device.h>
> +#include <linux/reset.h>

Can't you also remove the linux/clk/tegra.h include now that none of the
functions it declares are used anymore?

Otherwise looks good to me:

Reviewed-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--ULJ2Z7kCM1hyNsWd
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSmJbVAAoJEN0jrNd/PrOhDHwQAIc9/Y/paQQ8HQ1EvLTwh6jr
ZEjpYkzQzXhkO65mU1PWY5JXyB7D3WmCAhBXDnoHmXSnj1qmhQdlC+RXFcAIsMJQ
wXPlo+aeXHEnw+RehQvevJPSAIuXTXbcQeHfmRFqoh1EBqC+ccXzvVmy2+zV6+jq
T7wPPBiT5/ld3IxvZiGtZeM/MCH27iAb0KYkhcFUaY96Z2s9gbzOwzQebjM6Fgcn
gmX6mpVW/M1/cvlwWcEwoJ4pum5D2uqX2ys1uGfQ+HPGMub0cIpsi/uXrLMiJ+O+
exAwjj3Y2RRME9RgvX+tr8g+QBJLURkfH23Fw9wFjBkgXezMFcJNALk2Wy9qs5/N
98Lly/Y+YAXiUIJyfmZQkte4JH253JBtIZWYoGbnF41EVOyxrVJ65ZlnieP08aGb
LEtmELZyT7yNh6N6nrDhm7saT1WhsXGT4QLAiMOJfflvIMI/T2T/ZO90uDfaa7HO
b5vRyUfoKZBElYjwqqFQNWdydpeFO/BssWgH8OMAbrjEChT2GnSPQFAExddDOrCi
PkXv0Df9RsIcBPjHNnfC3UB2v6hd5WAQjWYitih0iSpRQLp1NlkkXI6pe68qVlZG
cT9UVnsh18TL5MmAflzSknTDstQmoTgBVj4tF+anEc1Ijl0/CdRkyWUsAhNNkx9H
Y9ChG/vPwoY2gxp2k6M+
=3mjw
-----END PGP SIGNATURE-----

--ULJ2Z7kCM1hyNsWd--
