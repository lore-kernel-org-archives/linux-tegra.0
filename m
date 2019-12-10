From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 0/9] drm/nouveau: Various fixes for GP10B
Date: Tue, 10 Dec 2019 14:12:19 +0100
Message-ID: <20191210131219.GE2703785@ulmo>
References: <20191209120005.2254786-1-thierry.reding@gmail.com>
 <CACAvsv4NX7jvZb5_X5auU4-KKk9PfmtJvmnQNjY7ihqgXaRS6A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0096471076=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CACAvsv4NX7jvZb5_X5auU4-KKk9PfmtJvmnQNjY7ihqgXaRS6A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ML nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Joerg Roedel <joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, ML dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--===============0096471076==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vv4Sf/kQfcwinyKX"
Content-Disposition: inline


--vv4Sf/kQfcwinyKX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 10, 2019 at 06:15:30PM +1000, Ben Skeggs wrote:
> On Mon, 9 Dec 2019 at 22:00, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >
> > Hi Ben,
> >
> > here's a revised subset of the patches I had sent out a couple of weeks
> > ago. I've reworked the BAR2 accesses in the way that you had suggested,
> > which at least for GP10B turned out to be fairly trivial to do. I have
> > not looked in detail at this for GV11B yet, but a cursory look showed
> > that BAR2 is accessed in more places, so the equivalent for GV11B might
> > be a bit more involved.
> >
> > Other than that, not a lot has changed since then. I've added a couple
> > of precursory patches to add IOMMU helper dummies for the case where
> > IOMMU is disabled (as suggested by Ben Dooks).
> >
> > Joerg has given an Acked-by on the first two patches, so I think it'd be
> > easiest if you picked those up into the Nouveau tree because of the
> > build dependency of subsequent patches on them.
> I've merged all the patches in my tree, after fixing a small build
> issue on !TEGRA in the WPR config readout patch.

Thanks for taking care of that. I'm going to need to add a non-Tegra
configuration to my build scripts and make sure I run those.

On a related note: have you ever considered submitting the Nouveau tree
for linux-next? That'd be very convenient for people like me working on
multiple patch series at the same time. In fact I've got another set of
patches against Nouveau that I want to send out after you've merged
these. Technically I would need to rebase them on your tree (since there
may be dependencies on this set), but that means I need to pull in both
your tree and linux-next if I want to keep up to date on all fronts and
test all patches in my local tree at the same time.

I'm not sure how well that would fit into your workflow. It's typically
not more effort than setting up a permanent branch that you can push to
whenever there's something that's ready for broader consumption. Beyond
the initial setup (which is really not more complicated than sending
Stephen an email with a URL and the branch name), it's really quite
simple and goes a long way to get broad testing early on. And it's
especially handy to catch potential conflicts with cross-subsystem
changes like the IOMMU patches in this series.

Thierry

> > Thierry Reding (9):
> >   iommu: Document iommu_fwspec::flags field
> >   iommu: Add dummy dev_iommu_fwspec_get() helper
> >   drm/nouveau: fault: Add support for GP10B
> >   drm/nouveau: tegra: Do not try to disable PCI device
> >   drm/nouveau: tegra: Avoid pulsing reset twice
> >   drm/nouveau: tegra: Set clock rate if not set
> >   drm/nouveau: secboot: Read WPR configuration from GPU registers
> >   drm/nouveau: gp10b: Add custom L2 cache implementation
> >   drm/nouveau: gp10b: Use correct copy engine
> >
> >  .../drm/nouveau/include/nvkm/subdev/fault.h   |  1 +
> >  .../gpu/drm/nouveau/include/nvkm/subdev/ltc.h |  1 +
> >  drivers/gpu/drm/nouveau/nouveau_drm.c         |  3 +-
> >  .../gpu/drm/nouveau/nvkm/engine/device/base.c |  6 +-
> >  .../drm/nouveau/nvkm/engine/device/tegra.c    | 24 ++++--
> >  .../gpu/drm/nouveau/nvkm/subdev/fault/Kbuild  |  1 +
> >  .../gpu/drm/nouveau/nvkm/subdev/fault/base.c  |  2 +-
> >  .../gpu/drm/nouveau/nvkm/subdev/fault/gp100.c | 17 ++--
> >  .../gpu/drm/nouveau/nvkm/subdev/fault/gp10b.c | 53 ++++++++++++
> >  .../gpu/drm/nouveau/nvkm/subdev/fault/gv100.c |  1 +
> >  .../gpu/drm/nouveau/nvkm/subdev/fault/priv.h  | 10 +++
> >  .../gpu/drm/nouveau/nvkm/subdev/ltc/Kbuild    |  1 +
> >  .../gpu/drm/nouveau/nvkm/subdev/ltc/gp10b.c   | 65 +++++++++++++++
> >  .../gpu/drm/nouveau/nvkm/subdev/ltc/priv.h    |  2 +
> >  .../drm/nouveau/nvkm/subdev/secboot/gm200.h   |  2 +-
> >  .../drm/nouveau/nvkm/subdev/secboot/gm20b.c   | 81 ++++++++++++-------
> >  .../drm/nouveau/nvkm/subdev/secboot/gp10b.c   |  4 +-
> >  include/linux/iommu.h                         | 47 ++++++-----
> >  18 files changed, 249 insertions(+), 72 deletions(-)
> >  create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/fault/gp10b.c
> >  create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gp10b.c
> >
> > --
> > 2.23.0
> >
> > _______________________________________________
> > Nouveau mailing list
> > Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> > https://lists.freedesktop.org/mailman/listinfo/nouveau

--vv4Sf/kQfcwinyKX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3vma8ACgkQ3SOs138+
s6EMoA/+KLTq/6mdV+MZhJOaFxvM/cAMMf7P7ygfKhZGSjR+G5tdp4tpTr0xmTUM
FaVQbs+u6SAIynt09/muATo/CDBFZPncLliZoquTY/KASlMRNqMGmp5i4EbZgAas
Rtjb4DwmULvJqJGx4/ilzs0xBwMypaR1voLNfNHSWWN+oay3qQk+UKkxj09M7bXY
r3r9uEM6CH3w2HH5dVclioH29+bszQahRAjzBMQA4Pan+RxYkcdbD2EldmB2sr8F
JQsB9M/+9ESKuI8Gc4xoiOVx8tfEA4KTHOHlivnwiZmz2fqQayPB/huSFTswNmOK
06dpwYW+4nYD31hKFR9bgaw3OMTSYyp8l2pAjePTIFP02MYBD9WzfcssORJPf4h0
qV4BMtL2vUZxC09bmbxpLZX2/jrmJ7IC9yf+24I9c9RZ25cnsYqUmsbSwxToUkBX
4Td9CPjOPqFaZs2eqZc0kI46e8dk7AD/H6nVnJmIecQJm+CzvUMukV3UsbZb5Gvj
KNA+91ZvT+si9wnEGHVvyaRg9FNwN00b7PG2BH9Loa+yglBDaFOWziXRZWtnusXR
AL5BhsMEQgKGIT5VcBu1FvXNkUmCnULl/88R9JAfBtHAneWvKtI1x/KcZFJPje57
FeJPDY1CSKH7NOT2E8oKlJrgxdw6GjzB6hNGjlNk7RaFmupKoCA=
=bn4W
-----END PGP SIGNATURE-----

--vv4Sf/kQfcwinyKX--

--===============0096471076==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0096471076==--
