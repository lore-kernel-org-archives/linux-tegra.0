From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] dmaengine: tegra210-adma: fix of_irq_get() error check
Date: Mon, 31 Jul 2017 18:56:16 +0200
Message-ID: <20170731165616.GC27815@ulmo>
References: <20170730181051.733168837@cogentembedded.com>
 <20170731093057.GA26667@ulmo>
 <0102e75c-d1be-e274-808b-f9d3f434924d@cogentembedded.com>
 <49996233-5ccd-58e6-db00-b5d402ff6e74@cogentembedded.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="V88s5gaDVPzZ0KCq"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <49996233-5ccd-58e6-db00-b5d402ff6e74-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--V88s5gaDVPzZ0KCq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 31, 2017 at 03:59:35PM +0300, Sergei Shtylyov wrote:
> On 07/31/2017 12:57 PM, Sergei Shtylyov wrote:
>=20
> > > > of_irq_get() may return 0 as well as negative error number on failu=
re,
> > > > while the driver only checks for the negative values. The driver wo=
uld then
> > > > call request_irq(0, ...) in tegra_adma_alloc_chan_resources() and n=
ever get
> > > > valid channel interrupt.
> > > >=20
> > > > Check for 'tdc->irq <=3D 0' instead and return -ENXIO from the driv=
er's probe
> > > > iff of_irq_get() returned 0.
> > > >=20
> > > > Fixes: f46b195799b5 ("dmaengine: tegra-adma: Add support for Tegra2=
10 ADMA")
> > > > Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
> [...]
>=20
> > > > Index: slave-dma/drivers/dma/tegra210-adma.c
> > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > --- slave-dma.orig/drivers/dma/tegra210-adma.c
> > > > +++ slave-dma/drivers/dma/tegra210-adma.c
> > > > @@ -717,8 +717,8 @@ static int tegra_adma_probe(struct platf
> > > >           tdc->chan_addr =3D tdma->base_addr + ADMA_CH_REG_OFFSET(i=
);
> > > >             tdc->irq =3D of_irq_get(pdev->dev.of_node, i);
> > > > -        if (tdc->irq < 0) {
> > > > -            ret =3D tdc->irq;
> > > > +        if (tdc->irq <=3D 0) {
> > > > +            ret =3D tdc->irq ?: -ENXIO;
> > > >               goto irq_dispose;
> > > >           }
> > > >=20
> > >=20
> > > I think in this particular case it would be better to just call
> > > platform_get_irq(), which already implements the equivalent.
>=20
>    Not that platform_get_irq() was no better (if not worse indeed, as it
> could return 0 both on failure ad success), until I fixed it back in 2016:
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3De330b9a6bb35dc7097a4f02cb1ae7b6f96df92af
>=20
> >=20
> >    OK, I'll try looking into that...
>=20
>    I've looked at the commit history and no, I don't agree to use
> platform_get_irq(): my platform_get_irq() fix landed in mainline later th=
an
> this driver, so fixing this bug in stable kernels would ensue an extra
> dependency...

Well, surely the platform_get_irq() function should also be fixed in
stable kernels, so that all callers can be fixed at the same time.

That said, this does fix a bug, and it fixes it in the least invasive
way, and the damage I'm complaining about is preexisting, so:

Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--V88s5gaDVPzZ0KCq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAll/YS4ACgkQ3SOs138+
s6FCyRAAgKLgjNRBueNV0OmxuZ/LcA3sYVFt3BjIaB6VzqN85p/Ml89TkgPOPXWD
gcp5yC9tv8tma6euF7V0Fr3iFgRXLYZC5AEEELsu7N6JICkDso86nJcIu8JvEEGu
2/Z+glvd6u+VeAm33VDPyWbJQ1+Zo3YlTFXpjGf9WqJRTIeN2BrR4A+VMPB3GNYt
krmYkB14Dk/v4OZsriJfXQxV9Knu3sSDwEvWcujaF0J0OrT9SXpB1iK01lYHN0HK
1sYoOFQCExrF2egQWOywF89ehbTNu7MdgnqvfmnE2a8+EF474byx+41r88g2xt08
02Q7jdXaXrrvDV4DIkMBlZAONgF+2WBiQbkodSGklwqnWNV4+wT3/wkk24ybF6mf
eja/VO5LeFPmMIo0PHrnzcwwJBtpPEzOJYS+JvO4AGzooqKTfspn/Mvv9To4Bg0U
SXhuj+KBFtmYSZyGPQekmwcVRdQYk2jp9Coliw/Lg+ntbjH0eFDaeKWchi4h+F3u
wRQC2QN3wbjqJySbnsAYS1HsZzfZAi/4Qeo7kRiTOW9AidCR0S35VszNXX6hcG00
3vJrW4AX/ymmPv/lJJhFsUYSOR3qKAVE3rQHcNx4wi/JjcCbJW5siX9kLzeXxQS7
4HJ5Z5pjH/kOyT2D1pu3DzQupin3/4kYpnNbXDNcUEyye1o/tX8=
=5N6E
-----END PGP SIGNATURE-----

--V88s5gaDVPzZ0KCq--
