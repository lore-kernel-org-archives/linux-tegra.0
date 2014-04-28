From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 04/10] drm/nouveau/fb: add GK20A support
Date: Mon, 28 Apr 2014 13:44:38 +0200
Message-ID: <20140428114437.GK19455@ulmo>
References: <1398060142-7937-1-git-send-email-acourbot@nvidia.com>
 <1398060142-7937-5-git-send-email-acourbot@nvidia.com>
 <20140422104052.GB22426@ulmo> <53572077.6090305@nvidia.com>
 <CAAVeFuKscuN-=HJOarbzFkG1ARq6-Nfc2pf1ibam9b61Cjbs6Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1854744908=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAAVeFuKscuN-=HJOarbzFkG1ARq6-Nfc2pf1ibam9b61Cjbs6Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--===============1854744908==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FCF9ydJxlAJsfRTu"
Content-Disposition: inline


--FCF9ydJxlAJsfRTu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 23, 2014 at 03:11:01PM +0900, Alexandre Courbot wrote:
> On Wed, Apr 23, 2014 at 11:07 AM, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>=
 wrote:
> > On 04/22/2014 07:40 PM, Thierry Reding wrote:
> >>
> >> * PGP Signed by an unknown key
> >>
> >>
> >> On Mon, Apr 21, 2014 at 03:02:16PM +0900, Alexandre Courbot wrote:
> >> [...]
> >>>
> >>> diff --git a/drivers/gpu/drm/nouveau/core/subdev/fb/ramgk20a.c
> >>> b/drivers/gpu/drm/nouveau/core/subdev/fb/ramgk20a.c
> >>
> >> [...]
> >>>
> >>> +               pages =3D dma_alloc_from_contiguous(dev, ncmin, order=
);
> >>> +               if (!pages) {
> >>> +                       gk20a_ram_put(pfb, &mem);
> >>> +                       return -ENOMEM;
> >>> +               }
> >>> +
> >>> +               dma_addr =3D pfn_to_dma(nv_device_base(nv_device(pfb)=
),
> >>> +                                     page_to_pfn(pages));
> >>
> >>
> >> This breaks compilation on x86 because neither pfn_to_dma() nor
> >> dma_to_pfn() are available. Is there some other way this can be
> >> allocated so that these functions don't need to be called?
> >
> >
> > Mmm, this is bad. There is probably another more portable way to do thi=
s.
> > Let me look for it.
>=20
> page_to_phys()/phys_to_page() can be used by drivers and will work
> just fine here since the CPU and GPU use the same physical addresses
> to access memory.

I'm wondering how this is going to pan out when we try adding IOMMU
support. But I guess we can cross that bridge when we come to it.

Thierry

--FCF9ydJxlAJsfRTu
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTXj8lAAoJEN0jrNd/PrOhvQkQAJDpYwiR9+o4Ee5VgXDSMPOn
5YQJOiSu6X7msoUjxPo7ioExDlhD3x/Yuz2bXs2HwTaEbrs766vTQFJrpjh6JPCI
LtTXKBS+EXHcvoVZlghUDDY6Q4MxJFGipxTTkpvcbQ6KsBNGHrSXur0hdwAqzcas
c20BUPl18GtWQdp2Kv/c6TBQJKLsDLPC1odFCwEBpza0wosOOeMPF9UnbBxtg0oo
Mp9RUmsm/NgmYZJHrG94QmNrECdO0NH7HSUB2QzsTGIsetJv528Zdp+dRSKEvK6T
FRYhJ1UezqU7m0NeaKAuLWG9M7MIC3pMs4GFJCAcPoGOsbPKG/fT3R7Hj5/kYmd2
7cgkTzxq/DIudCW9m4tPmwDRSzOhgG7EKAQyUwLkzPnWBKtfln8aDpGRBJC7od0n
zBvlwiqqx3GZC1A69zwvVn2h1si2a4GdCL41L53lzrY5L68DC+bnBp9/2ua18Ir+
ei6S7FiMLtN7eTE2lJ92TLV6R3ANRgN74ykbUka4HsHnlc7tZdKqslIDHGlibzyx
DWZrzqShCWk/G5r8bUtJf5pKv9HO0YlBgf/2yMZYWR5nfXHjbYT9tJTV9x15T4zH
3qDg8Xww/5yWnnD5jBzjKMqWnCy0ztnWQEdbRF6pVP0dZORk5huGR+fbW/99scCZ
2bA1j4EjCfIFEcOW12gH
=BD+k
-----END PGP SIGNATURE-----

--FCF9ydJxlAJsfRTu--

--===============1854744908==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1854744908==--
