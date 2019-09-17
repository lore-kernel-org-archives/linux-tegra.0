From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 03/11] drm/nouveau: secboot: Read WPR
 configuration from GPU registers
Date: Tue, 17 Sep 2019 10:40:41 +0200
Message-ID: <20190917084041.GB17854@ulmo>
References: <20190916150412.10025-1-thierry.reding@gmail.com>
 <20190916150412.10025-4-thierry.reding@gmail.com>
 <CACAvsv6AcwWW542AJNkyR-q+aQ0GLFc0C3Sior_bYPTEjBV4LA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1903858813=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CACAvsv6AcwWW542AJNkyR-q+aQ0GLFc0C3Sior_bYPTEjBV4LA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ML nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, ML dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--===============1903858813==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1UWUbFP1cBYEclgG"
Content-Disposition: inline


--1UWUbFP1cBYEclgG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 17, 2019 at 01:49:57PM +1000, Ben Skeggs wrote:
> On Tue, 17 Sep 2019 at 01:04, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> w=
rote:
> >
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >
> > The GPUs found on Tegra SoCs have registers that can be used to read the
> > WPR configuration. Use these registers instead of reaching into the
> > memory controller's register space to read the same information.
> >
> > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> >  .../drm/nouveau/nvkm/subdev/secboot/gm200.h   |  2 +-
> >  .../drm/nouveau/nvkm/subdev/secboot/gm20b.c   | 81 ++++++++++++-------
> >  .../drm/nouveau/nvkm/subdev/secboot/gp10b.c   |  4 +-
> >  3 files changed, 53 insertions(+), 34 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gm200.h b/driv=
ers/gpu/drm/nouveau/nvkm/subdev/secboot/gm200.h
> > index 62c5e162099a..280b1448df88 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gm200.h
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gm200.h
> > @@ -41,6 +41,6 @@ int gm200_secboot_run_blob(struct nvkm_secboot *, str=
uct nvkm_gpuobj *,
> >                            struct nvkm_falcon *);
> >
> >  /* Tegra-only */
> > -int gm20b_secboot_tegra_read_wpr(struct gm200_secboot *, u32);
> > +int gm20b_secboot_tegra_read_wpr(struct gm200_secboot *);
> >
> >  #endif
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gm20b.c b/driv=
ers/gpu/drm/nouveau/nvkm/subdev/secboot/gm20b.c
> > index df8b919dcf09..f8a543122219 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gm20b.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gm20b.c
> > @@ -23,39 +23,65 @@
> >  #include "acr.h"
> >  #include "gm200.h"
> >
> > -#define TEGRA210_MC_BASE                       0x70019000
> > -
> >  #ifdef CONFIG_ARCH_TEGRA
> > -#define MC_SECURITY_CARVEOUT2_CFG0             0xc58
> > -#define MC_SECURITY_CARVEOUT2_BOM_0            0xc5c
> > -#define MC_SECURITY_CARVEOUT2_BOM_HI_0         0xc60
> > -#define MC_SECURITY_CARVEOUT2_SIZE_128K                0xc64
> > -#define TEGRA_MC_SECURITY_CARVEOUT_CFG_LOCKED  (1 << 1)
> >  /**
> >   * gm20b_secboot_tegra_read_wpr() - read the WPR registers on Tegra
> >   *
> > - * On dGPU, we can manage the WPR region ourselves, but on Tegra the W=
PR region
> > - * is reserved from system memory by the bootloader and irreversibly l=
ocked.
> > - * This function reads the address and size of the pre-configured WPR =
region.
> > + * On dGPU, we can manage the WPR region ourselves, but on Tegra this =
region
> > + * is allocated from system memory by the secure firmware. The region =
is then
> > + * marked as a "secure carveout" and irreversibly locked. Furthermore,=
 the WPR
> > + * secure carveout is also configured to be sent to the GPU via a dedi=
cated
> > + * serial bus between the memory controller and the GPU. The GPU reque=
sts this
> > + * information upon leaving reset and exposes it through a FIFO regist=
er at
> > + * offset 0x100cd4.
> > + *
> > + * The FIFO register's lower 4 bits can be used to set the read index =
into the
> > + * FIFO. After each read of the FIFO register, the read index is incre=
mented.
> > + *
> > + * Indices 2 and 3 contain the lower and upper addresses of the WPR. T=
hese are
> > + * stored in units of 256 B. The WPR is inclusive of both addresses.
> > + *
> > + * Unfortunately, for some reason the WPR info register doesn't contai=
n the
> > + * correct values for the secure carveout. It seems like the upper add=
ress is
> > + * always too small by 128 KiB - 1. Given that the secure carvout size=
 in the
> > + * memory controller configuration is specified in units of 128 KiB, i=
t's
> > + * possible that the computation of the upper address of the WPR is wr=
ong and
> > + * causes this difference.
> >   */
> >  int
> > -gm20b_secboot_tegra_read_wpr(struct gm200_secboot *gsb, u32 mc_base)
> > +gm20b_secboot_tegra_read_wpr(struct gm200_secboot *gsb)
> >  {
> > +       struct nvkm_device *device =3D gsb->base.subdev.device;
> >         struct nvkm_secboot *sb =3D &gsb->base;
> > -       void __iomem *mc;
> > -       u32 cfg;
> > +       u64 base, limit;
> > +       u32 value;
> >
> > -       mc =3D ioremap(mc_base, 0xd00);
> > -       if (!mc) {
> > -               nvkm_error(&sb->subdev, "Cannot map Tegra MC registers\=
n");
> > -               return -ENOMEM;
> > -       }
> > -       sb->wpr_addr =3D ioread32_native(mc + MC_SECURITY_CARVEOUT2_BOM=
_0) |
> > -             ((u64)ioread32_native(mc + MC_SECURITY_CARVEOUT2_BOM_HI_0=
) << 32);
> > -       sb->wpr_size =3D ioread32_native(mc + MC_SECURITY_CARVEOUT2_SIZ=
E_128K)
> > -               << 17;
> > -       cfg =3D ioread32_native(mc + MC_SECURITY_CARVEOUT2_CFG0);
> > -       iounmap(mc);
> > +       /* set WPR info register to point at WPR base address register =
*/
> > +       value =3D nvkm_rd32(device, 0x100cd4);
> > +       value &=3D ~0xf;
> > +       value |=3D 0x2;
> > +       nvkm_wr32(device, 0x100cd4, value);
> > +
> > +       /* read base address */
> > +       value =3D nvkm_rd32(device, 0x100cd4);
> > +       base =3D (u64)(value >> 4) << 12;
> > +
> > +       /* read limit */
> > +       value =3D nvkm_rd32(device, 0x100cd4);
> > +       limit =3D (u64)(value >> 4) << 12;
> acr_r352_wpr_is_set() does a similar readout to confirm the HS
> firmware did its job on dGPU, perhaps this part of it could be
> factored out into a function that could be used in both places?

I hadn't seen that function. It looks to me like these are now both
doing exactly the same thing. The acr_r352_wpr_is_set() also seems to
serve only to check that what's read from these WPR info registers
matches what was configured as the WPR region previously. This is now
rather pointless because, unless the computations differ, the result
must be true.

Honestly, I'm not sure we really need to check this. My understanding is
that these WPR info registers are the canonical way of obtaining the WPR
region base and limit. The way that this works is that the GPU has a
dedicated bus to the memory controller and it fetches these parameters
=66rom the MC when it leaves reset.

One oddity here, though, is that the code in acr_r352_wpr_is_set() does
not account for the strange way that the limit is encoded in these
registers. I suspect that this is some weird hardware bug that happens
during the transfer of the WPR information to the GPU. I came across
some documentation that specifically defines the limit register to
contain the upper limit of the WPR in units of 256 B with the WPR being
inclusive of both the base and the limit. I'm not exactly sure why this
has gone unnoticed, but I think nvgpu doesn't actually test for the WPR
size when it loads the firmware. I only ran into this when implementing
the WPR info register readout because Nouveau would refuse to load the
firmware because it didn't fit into what it thought was the WPR.

Anyway, I've tested this on all of gm20b, gp10b and gv11b and the above
computations give me the same values that the (SoC) firmware claims that
it configured the WPR with.

Given the above, do you see any further use for acr_r352_wpr_is_set()?
Should I follow up with a patch removing it?

Thierry

>=20
> > +
> > +       /*
> > +        * The upper address of the WPR seems to be computed wrongly an=
d is
> > +        * actually SZ_128K - 1 bytes lower than it should be. Adjust t=
he
> > +        * value accordingly.
> > +        */
> > +       limit +=3D SZ_128K - 1;
> > +
> > +       sb->wpr_size =3D limit - base + 1;
> > +       sb->wpr_addr =3D base;
> > +
> > +       nvkm_info(&sb->subdev, "WPR: %016llx-%016llx\n", sb->wpr_addr,
> > +                 sb->wpr_addr + sb->wpr_size - 1);
> >
> >         /* Check that WPR settings are valid */
> >         if (sb->wpr_size =3D=3D 0) {
> > @@ -63,11 +89,6 @@ gm20b_secboot_tegra_read_wpr(struct gm200_secboot *g=
sb, u32 mc_base)
> >                 return -EINVAL;
> >         }
> >
> > -       if (!(cfg & TEGRA_MC_SECURITY_CARVEOUT_CFG_LOCKED)) {
> > -               nvkm_error(&sb->subdev, "WPR region not locked\n");
> > -               return -EINVAL;
> > -       }
> > -
> >         return 0;
> >  }
> >  #else
> > @@ -85,7 +106,7 @@ gm20b_secboot_oneinit(struct nvkm_secboot *sb)
> >         struct gm200_secboot *gsb =3D gm200_secboot(sb);
> >         int ret;
> >
> > -       ret =3D gm20b_secboot_tegra_read_wpr(gsb, TEGRA210_MC_BASE);
> > +       ret =3D gm20b_secboot_tegra_read_wpr(gsb);
> >         if (ret)
> >                 return ret;
> >
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gp10b.c b/driv=
ers/gpu/drm/nouveau/nvkm/subdev/secboot/gp10b.c
> > index 28ca29d0eeee..d84e85825995 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gp10b.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gp10b.c
> > @@ -23,15 +23,13 @@
> >  #include "acr.h"
> >  #include "gm200.h"
> >
> > -#define TEGRA186_MC_BASE                       0x02c10000
> > -
> >  static int
> >  gp10b_secboot_oneinit(struct nvkm_secboot *sb)
> >  {
> >         struct gm200_secboot *gsb =3D gm200_secboot(sb);
> >         int ret;
> >
> > -       ret =3D gm20b_secboot_tegra_read_wpr(gsb, TEGRA186_MC_BASE);
> > +       ret =3D gm20b_secboot_tegra_read_wpr(gsb);
> >         if (ret)
> >                 return ret;
> >
> > --
> > 2.23.0
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel

--1UWUbFP1cBYEclgG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2AnAYACgkQ3SOs138+
s6G4EQ//W+7nrgwOka0kREfhnDOeKFM+h4ElazaIUv/0KnTvaAKfcBaBC+kVlcJI
QzVIy/Fwsf9eXvCUzNH6Hz8o9A9RJYx6zemj7J/DSpCU1I1P35Jsj0KC2xsuDjL+
EhfwmQ4ccP2xdn1S1U3BsK6SDJh7KiPLLA6IPQrdkpQTsJtdXiUr8oNYdb8V5giX
pjZNo/CLlvkAnE2pWeS7WJvr/Vgqm9DOVWEOyT3IYGkUHfQSKWEDutkcc0BWy/zG
ApxTZeeeLI4Z19CszAE9qjwACVO/zcKAk/PTMv7MTlDiONgTumGbk2P/AFZLfIs2
yXClFqnxH5Ul5m4OrSTyO/emOUgbbov49HFOB6pKUCrwmBGQ74pc7H/TKTxB9gtb
YfLmErlayVYA+eypJ1myfvpKZZibpSivhyw91+uH8E29oSY41Ctb74fAmoEfwOka
I92ICTwqxQVt1OBSg+AFDGtsVabJbCsQOyxDjeTNKqbByNxOcSMUQgtK/74oh3kv
Jo9QsGluXmRBOT88rCou/9GrIs+R1ufGzy1Dtmn9sbiGZmzb2gr/6tj5YSnRFR63
tgGmA91vIyhPluBAhM6tpm5+ziTx2kTj+ZzQKNFLWMwplDLtHfeI27stYVi7FsHh
swnuUIoLUWEy1DSCQfCu+NqlKtOnZw4BPLV4AvBzDc57k593N0Q=
=kmci
-----END PGP SIGNATURE-----

--1UWUbFP1cBYEclgG--

--===============1903858813==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1903858813==--
