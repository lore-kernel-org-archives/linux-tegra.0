From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] PCI: tegra: Use generic accessors where possible
Date: Wed, 27 Sep 2017 11:33:03 +0200
Message-ID: <20170927093303.GA26713@ulmo>
References: <20170923061841.6123-1-treding@nvidia.com>
 <CAN7O0+LZFJJJmw8gXXEkHjuUhtCJeynjxitqDiLS902NJSr7dw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="CE+1k2dSO48ffgeK"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAN7O0+LZFJJJmw8gXXEkHjuUhtCJeynjxitqDiLS902NJSr7dw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: vidya sagar <sagar.tv-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--CE+1k2dSO48ffgeK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 27, 2017 at 02:26:04PM +0530, vidya sagar wrote:
> On Sat, Sep 23, 2017 at 11:48 AM, Thierry Reding
> <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > The Tegra PCI host controller can generate configuration space accesses
> > with byte, word and dword granularity for devices. Only root ports can't
> > have their configuration space accessed in this way.
> >
> > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> >  drivers/pci/host/pci-tegra.c | 24 ++++++++++++++++++++++--
> >  1 file changed, 22 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/pci/host/pci-tegra.c b/drivers/pci/host/pci-tegra.c
> > index 9c40da54f88a..e8e1ddbaabc9 100644
> > --- a/drivers/pci/host/pci-tegra.c
> > +++ b/drivers/pci/host/pci-tegra.c
> > @@ -491,12 +491,32 @@ static void __iomem *tegra_pcie_map_bus(struct pc=
i_bus *bus,
> >         return addr;
> >  }
> >
> > +static int tegra_pcie_config_read(struct pci_bus *bus, unsigned int de=
vfn,
> > +                                 int where, int size, u32 *value)
> > +{
> > +       if (bus->number =3D=3D 0)
> > +               return pci_generic_config_read32(bus, devfn, where, siz=
e,
> > +                                                value);
> > +
> > +       return pci_generic_config_read(bus, devfn, where, size, value);
>=20
> Since T20, T30 and T124 had issues with 8-bit and 16-bit end point
> config accesses, generic accessors should be used only for T210

I thought that 8-bit and 16-bit configuration space accesses were only
ever problematic for the root ports. I've certainly not seen 8-bit and
16-bit accesses fail on any of the devices I tested on. That is, this
patch was tested on TrimSlice (Tegra20), Beaver (Tegra30), Jetson TK1
(Tegra124) and Jetson TX1 (Tegra210) without any issues.

Thierry

--CE+1k2dSO48ffgeK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlnLcEsACgkQ3SOs138+
s6Ed/xAAic0rBakN0PnUVJwFI4VRCxTo0dX+54mVSkhC+GN2tmwCTUZDXHYDi7eU
1NIpQEhUvcyMsQs8+X+9wMqfEhw4LXstVXCL0/IVc0UIKjDhgm85y28UY2amPNu+
957mYMt1DpYVqsIzjQ14S0xIdKoE1+XMddTvlWJhB0LsBLPGOS7FYIAyt5ffE9qa
COFyCpbnZ9JxHzFczAPYm2GlJ4T59ShNmvRK49u3u+j6ZIIGQZTXTxUgADE75cX9
w8n2a7+RoulDycOlX/8eUBX4EZNqy78XmglrBXxKLzK3Wp7cLQ/01pv886L1NAXP
Hc0LCGCEqh060O32oVNT6k3jilChVqxZYHPsscSmw+Xr3/DYLH14JybLl1XVK1s+
wwBchFrsaYLfMM7CTuSh6SZc5oRm+gJ5dMp58FIEXfYzaco3DusK8h9F4yjTvzp/
p8cBtcKICZmhoISbh5ygkwWVOBAHcZpe1ZynMOp6DQn7vsh5lFk2BzCEUenQ851F
aia0XJmmN0EXKivZuHh1JKaUNvGytJzEGfpvcbRJveWcFpb9eZSdVzkKS2oLOqXw
j0mqgm1vxDpVyqiUDahrYWJurqjwdXXMFPAhKsno7ptZRab/rwdpOuFl3bKkrTbN
SehRJxnO4PM4two3ExYLdXJVyZwqQhDwM4AqPTHfZelifeJqCjM=
=nq6n
-----END PGP SIGNATURE-----

--CE+1k2dSO48ffgeK--
