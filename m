From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 02/31] ARM: tegra: document reset properties in DT
 bindings
Date: Fri, 29 Nov 2013 13:23:48 +0100
Message-ID: <20131129122348.GO22771@ulmo.nvidia.com>
References: <1384548866-13141-1-git-send-email-swarren@wwwdotorg.org>
 <1384548866-13141-3-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MmQIYbZiCoQ2kDro"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1384548866-13141-3-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--MmQIYbZiCoQ2kDro
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 15, 2013 at 01:53:57PM -0700, Stephen Warren wrote:
[...]
> diff --git a/Documentation/devicetree/bindings/gpu/nvidia,tegra20-host1x.txt b/Documentation/devicetree/bindings/gpu/nvidia,tegra20-host1x.txt
[...]
> +  - resets : Must contain an entry for each entry in reset-names.
> +    See ../reset/reset.txt for details.
> +  - reset-names : Must include the following entries:
> +    - dc

For consistency with this, the clock-names entry for the first clock in
this node should then be "dc" as well.

> diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra30-ahub.txt b/Documentation/devicetree/bindings/sound/nvidia,tegra30-ahub.txt
[...]
> -  - spdif_in
> +  - spdif

Why is this renamed?

Thierry

--MmQIYbZiCoQ2kDro
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSmIdUAAoJEN0jrNd/PrOhpnoP/iThUePfKuly0/gkMi471eiz
YjlyddEukDvxxo9bQ1zKeDh8EdUnKXmMDVj2CfypWLAFhJ2gM+8GEwdDSkrdha3g
cP0Nmks2AKEODX8KCrZplPI87RB99EYVhZOuEaEu02ww4+MrrCUVbCohhD0XtC9L
JQPoJg1UEMXv/SsW0jGVvlzd0aVL/vgMOeEzpGZxI+dK1e/Kk/K3toIYkqAEQdnq
37RPS4QSav/xGNBc0+z9Oy/Ix8LKuSDYOjvurALxQ8MnI6PRdbdEnzJFrow4g9Ft
EiFGObtaGwvcR2sinHAnlIgl4HsHRTUMYSF48UVcvll+uaNSSrJKiboZu+KPKOFq
O7lpwRAsZPgrLOQUa+51iTwcqkAouK7Dalpo7Qrq/uUPX2P072J7NLA+/f11rtQO
Gq/gKXJUFab2cz9eLr90wNN18iD4ewnnVNU9BQrBen5Rejql+oa4mmCa0Et7znR/
oGr1Ze8IrHEPn4AWi/umZ05CKfJz12qAZHMxVViXjLzSBtYElVx8a260DUN4BA2S
MrB+nYc33koFFTgWjFtzewmcp8Cpk1lXbxyoJd/uABvXfqqGkqFc/x0GoDnW432b
8khnVlwMVCYBF6EW/aLAfeue+dvA3+Dvc4CndS/8IGDLafcXVThaY/CMWcBq+vHC
3KB7GPovs4PAha+pArg0
=X8UQ
-----END PGP SIGNATURE-----

--MmQIYbZiCoQ2kDro--
