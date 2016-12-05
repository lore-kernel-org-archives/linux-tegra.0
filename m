From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/8] drm/tegra: Allocate BOs from lower 4G when without
 IOMMU
Date: Mon, 5 Dec 2016 19:39:55 +0100
Message-ID: <20161205183955.GB22918@ulmo.ba.sec>
References: <20161110182345.31777-1-mperttunen@nvidia.com>
 <20161110182345.31777-3-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="uQr8t48UFsdbeI+V"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161110182345.31777-3-mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--uQr8t48UFsdbeI+V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 10, 2016 at 08:23:39PM +0200, Mikko Perttunen wrote:
> On 64-bit Tegras, buffer object memory allocation may
> return memory above 4G that units behind Host1x cannot
> access. Add the GFP_DMA flag to these allocation when
> IOMMU is not enabled to ensure units can always access
> BO memory.

I don't think that's entirely true. The display controller can address
more than 32 bits. It's perhaps slightly different from other units that
are behind host1x, but maybe we need a special case here to allow frame-
buffers to reside in higher memory?

Thierry

--uQr8t48UFsdbeI+V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJYRbR7AAoJEN0jrNd/PrOhJZoP/1BlLbg0RDePE06OfbnCB+lf
cDMbAfpXZ8ddb0NxKtc68BySd8IVxWHTavot3LA3zA7HUfhuD3cWhF5YrcH3b6ZR
vJbGGNguC+/Mh/IY1g/Xr0+v8qTy/cwLWGMGSRa3IveczVVydBZXjicsmOg8OkQL
6K7xqoMnypleBBrwK6YupkgE4tsOJVncV2n/0Tlz4T+/TvQWo2WwoaJQW2jXi88A
qYoBH1exlcjHepTrSpsMv6qJOMQoe8yoOICAl/sIDtpLvRlI7MejrKbZLh9xwW0G
qv6M5SmoDd8l06QV0kPQ1W+6ITGQk+Nv9jmefDQyS/1qdx2LNm0Nn01Tg2yCck8V
7yl8GVX3+jMa+BTJpFRSDVYmH0yDwSFwnBxtLkVOur4MIdPxj2rDlLPSX9Cq46wY
VmTNllyhM0FDuCYQ1iin+/EbewQSD3qzJRkUUypithWHnGqDdvEX/dMIKEbZkN9R
ric3eO3cC6302lN9G0Wf/i5YiwMUlwV9Vwbv/K66O7BwBhyijHVWcCQZYzENvaFX
dm1i+DzS6lR/l6LHd8rV3jSOGAW9nQgMB3U1VjwQOvFz5RFnIczZC6NZhx5wPR+D
Wk2MSgtPGFGKUsLIQAC5WXIwBxYbU5Xr8KYAqRdMnQsgwU3KtghcoDmxwjfZtu8q
c/SfiAxCTN4FCUvYAdTf
=Gpvu
-----END PGP SIGNATURE-----

--uQr8t48UFsdbeI+V--
