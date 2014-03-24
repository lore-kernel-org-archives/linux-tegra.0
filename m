From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 11/12] drm/nouveau: support GK20A in nouveau_accel_init()
Date: Tue, 25 Mar 2014 00:10:16 +0100
Message-ID: <20140324231014.GI17218@mithrandir>
References: <1395650554-31925-1-git-send-email-acourbot@nvidia.com>
 <1395650554-31925-12-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nEsDIrWrg+hrB7l1"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1395650554-31925-12-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--nEsDIrWrg+hrB7l1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 24, 2014 at 05:42:33PM +0900, Alexandre Courbot wrote:
> GK20A does not embed a dedicated COPY engine and thus cannot allocate
> the copy channel that nouveau_accel_init() attempts to create. It also
> lacks any display hardware, so the creation of a software channel does
> not apply neither.

Perhaps this should be two separate patches?

> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
[...]
> +	if (device->chipset == 0xea) {
> +		/* gk20a does not have CE0/CE1 */

This would be another good candidate for a feature flag.

> +		arg0 = NVE0_CHANNEL_IND_ENGINE_GR;
> +		arg1 = 1;
> +	} else
>  	if (device->card_type >= NV_E0) {

The formatting here is somewhat weird. From a brief look I couldn't find
any indication that nouveau deviates from the standard coding style, so
this should be:

	} else if (...) {

> +	/* Need to figure out how to handle sw for gk20a */
> +	if (device->chipset == 0xea)
> +		goto skip_sw_init;

The commit message makes it sound like SW isn't needed since gk20a
"lacks any display hardware". In that case the comment here doesn't make
much sense.

Thierry

--nEsDIrWrg+hrB7l1
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTMLtWAAoJEN0jrNd/PrOh5esP/jQiprOIFwci3I5jV7qXx8QC
Ihf2f6MxeDPnmods1fSaWBk9Cy4IKiyEeRh5HUk5nsNV3WSs1x1D+o56h9HfpUU5
z6g4OcZ9GEOO3vzjD0L3N/+rnHBz2jlEbHPcC0Oj3PhD06v7PPMMNGEcbCO5PUqi
C0H02miAuBaw4QXIu8Soabzo1A6/dvSN6OlUw8B4GYSer59yZwAVrQE41adpyK9h
G9IhjvBascMggXx3i/NNTURJUIkGHYizerAwg63YIxMjuHVwKeyLjgkjaSNTzg31
s+k2zw5sKWwGnG0ZeY3JhPCOl9FVYPlE/JBdJGPlRqqQgUxXvVwJAywRz15QsBCg
E+/bGzpx7//5kDuLxynkH7HLJ1QsTi+lxWiNbVYN8ojW12WyN8Gt5MOG53VHY4BG
4NMGM4CPljEO7AZXFIhGl1MQDNavijyTTbHcjcz71TaDeZs9uZ1cl1j8voK3mYjc
cn8HtCbXQw5G0s4llK3G52DzVBENOBJv6MLPNcnLxTlmXoKRNjph69RvGIQ644QL
T5RjQPwXrIWpUSv+ps9hioqWAG6poOlfCAZEv0nUDxxh0CwOOBXFRUAtTw0MaOG6
Gz6XxUmVGeFLyp+pNR6pACgchMdoVFQNKjX9pdays7ecz5XLSr/hNmyUZmqpfPTK
C0BBW/ksjrQY+TNW14YW
=+eEU
-----END PGP SIGNATURE-----

--nEsDIrWrg+hrB7l1--
