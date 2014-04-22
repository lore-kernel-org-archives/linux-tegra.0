From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 04/10] drm/nouveau/fb: add GK20A support
Date: Tue, 22 Apr 2014 12:40:53 +0200
Message-ID: <20140422104052.GB22426@ulmo>
References: <1398060142-7937-1-git-send-email-acourbot@nvidia.com>
 <1398060142-7937-5-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1796363716=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1398060142-7937-5-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--===============1796363716==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qcHopEYAB45HaUaB"
Content-Disposition: inline


--qcHopEYAB45HaUaB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 21, 2014 at 03:02:16PM +0900, Alexandre Courbot wrote:
[...]
> diff --git a/drivers/gpu/drm/nouveau/core/subdev/fb/ramgk20a.c b/drivers/gpu/drm/nouveau/core/subdev/fb/ramgk20a.c
[...]
> +		pages = dma_alloc_from_contiguous(dev, ncmin, order);
> +		if (!pages) {
> +			gk20a_ram_put(pfb, &mem);
> +			return -ENOMEM;
> +		}
> +
> +		dma_addr = pfn_to_dma(nv_device_base(nv_device(pfb)),
> +				      page_to_pfn(pages));

This breaks compilation on x86 because neither pfn_to_dma() nor
dma_to_pfn() are available. Is there some other way this can be
allocated so that these functions don't need to be called?

Thierry

--qcHopEYAB45HaUaB
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTVkc0AAoJEN0jrNd/PrOh7HkP/iCMWEHuOBSMvawVbmp9nVLI
CC1prTVr9Q6oT/eyCNGY47Hb23XuZO7AiDouF3hE3okswxsyRDqY1GBwI5xW6zsK
sP7/b79Lwzr+kpZrnRpx2ZWazKA0/vdvlH0jY6VYAJUwVdyEpR9ndqLe7yw7Ff3G
fHWGzSsWXA0obbqjp8j3T8ECY9YQg5GWH/PufNpGwMb5f/rKB0M01Ay/0gavoa3X
+5x5kQZZk3idOLt45LJ1HhnAw9sOEuBDmUn3mU/8GvwXkCTggl9dgDPHIMqIR4/4
FZpeSJ8wgWGVKC2UjO/mbpDAB70+ntgOji/RsOdEGB3y7rY+xVDJ4JOnd8mRLKJb
ooukR+8D0WgxZrrNlwOOUcID5h/2CUSrIJce+MdtidoTM7FnQPp7CvNTrBhq92VU
VwYku2KCyCppd5N9N7x2gcDs1uE1KOWckHyhZsf8rOQ1exGPzZbciZJV+BLLg7xR
cDFoY3bNMY/jUKUXfyNlpjaQ+/TA2HrcDSEjxgYfth90xhxoq7kpgUPYvh2lj+2X
YJB+GeWdku+tuR+cHZIBbS5SX740Q1omR677q74j6l9dQsv7LL0CXVwSnge/fDVb
lpkWuTP7nUVaOgqZ2RNCpXMA5CKwptr4a+FvkIqnTcKvqBT75H2KUuA1yzgZvaoh
040PDibi26IjzlTOsRSG
=Yvc9
-----END PGP SIGNATURE-----

--qcHopEYAB45HaUaB--

--===============1796363716==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1796363716==--
