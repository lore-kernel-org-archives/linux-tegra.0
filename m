From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 01/15] drm/tegra: Map cmdbuf once for reloc
 processing
Date: Mon, 25 Nov 2019 11:47:47 +0100
Message-ID: <20191125104747.GG1409040@ulmo>
References: <20191118103536.17675-1-daniel.vetter@ffwll.ch>
 <20191118103536.17675-2-daniel.vetter@ffwll.ch>
 <20191125095856.GL29965@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0631008427=="
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
In-Reply-To: <20191125095856.GL29965@phenom.ffwll.local>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: linux-tegra@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics Development <intel-gfx@lists.freedesktop.org>, DRI Development <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel.vetter@intel.com>
List-Id: linux-tegra@vger.kernel.org


--===============0631008427==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Fnm8lRGFTVS/3GuM"
Content-Disposition: inline


--Fnm8lRGFTVS/3GuM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 25, 2019 at 10:58:56AM +0100, Daniel Vetter wrote:
> On Mon, Nov 18, 2019 at 11:35:22AM +0100, Daniel Vetter wrote:
> > A few reasons to drop kmap:
> >=20
> > - For native objects all we do is look at obj->vaddr anyway, so might
> >   as well not call functions for every page.
> >=20
> > - Reloc-processing on dma-buf is ... questionable.
> >=20
> > - Plus most dma-buf that bother kernel cpu mmaps give you at least
> >   vmap, much less kmaps. And all the ones relevant for arm-soc are
> >   again doing a obj->vaddr game anyway, there's no real kmap going on
> >   on arm it seems.
> >=20
> > Plus this seems to be the only real in-tree user of dma_buf_kmap, and
> > I'd like to get rid of that.
> >=20
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Thierry Reding <thierry.reding@gmail.com>
> > Cc: linux-tegra@vger.kernel.org
>=20
> Ping for testing/review on these first 2 tegra patches. They're holding up
> the entire series, and I got acks for all the other bits surprisingly
> fast. So would like to land this rather sooner than later. I'm also
> working on a lot more dma-buf patches ...

Right, I had forgotten about this series. Let me go test it right away.

Thierry

> > ---
> >  drivers/gpu/host1x/job.c | 21 +++++++--------------
> >  1 file changed, 7 insertions(+), 14 deletions(-)
> >=20
> > diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
> > index 25ca54de8fc5..60b2fedd0061 100644
> > --- a/drivers/gpu/host1x/job.c
> > +++ b/drivers/gpu/host1x/job.c
> > @@ -244,8 +244,7 @@ static unsigned int pin_job(struct host1x *host, st=
ruct host1x_job *job)
> > =20
> >  static int do_relocs(struct host1x_job *job, struct host1x_job_gather =
*g)
> >  {
> > -	u32 last_page =3D ~0;
> > -	void *cmdbuf_page_addr =3D NULL;
> > +	void *cmdbuf_addr =3D NULL;
> >  	struct host1x_bo *cmdbuf =3D g->bo;
> >  	unsigned int i;
> > =20
> > @@ -267,28 +266,22 @@ static int do_relocs(struct host1x_job *job, stru=
ct host1x_job_gather *g)
> >  			goto patch_reloc;
> >  		}
> > =20
> > -		if (last_page !=3D reloc->cmdbuf.offset >> PAGE_SHIFT) {
> > -			if (cmdbuf_page_addr)
> > -				host1x_bo_kunmap(cmdbuf, last_page,
> > -						 cmdbuf_page_addr);
> > +		if (!cmdbuf_addr) {
> > +			cmdbuf_addr =3D host1x_bo_mmap(cmdbuf);
> > =20
> > -			cmdbuf_page_addr =3D host1x_bo_kmap(cmdbuf,
> > -					reloc->cmdbuf.offset >> PAGE_SHIFT);
> > -			last_page =3D reloc->cmdbuf.offset >> PAGE_SHIFT;
> > -
> > -			if (unlikely(!cmdbuf_page_addr)) {
> > +			if (unlikely(!cmdbuf_addr)) {
> >  				pr_err("Could not map cmdbuf for relocation\n");
> >  				return -ENOMEM;
> >  			}
> >  		}
> > =20
> > -		target =3D cmdbuf_page_addr + (reloc->cmdbuf.offset & ~PAGE_MASK);
> > +		target =3D cmdbuf_addr + reloc->cmdbuf.offset;
> >  patch_reloc:
> >  		*target =3D reloc_addr;
> >  	}
> > =20
> > -	if (cmdbuf_page_addr)
> > -		host1x_bo_kunmap(cmdbuf, last_page, cmdbuf_page_addr);
> > +	if (cmdbuf_addr)
> > +		host1x_bo_munmap(cmdbuf, cmdbuf_addr);
> > =20
> >  	return 0;
> >  }
> > --=20
> > 2.24.0
> >=20
>=20
> --=20
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

--Fnm8lRGFTVS/3GuM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3bsVMACgkQ3SOs138+
s6HCZg/9FGm4sPPaTlmxdmeXe0jAJa+u6ysFQtoln955fM3lJMaa9uzCHFRYYxpl
6123F+2BuuCYDoizz2LzlmSUYTXuyuYnWBxaGRUdHtAHBmvcndLrULELXAnWp4zg
jWk8Xhf3aieUFgDfXBrb89E3NqFj4VXblnmdKXHzq4WA9nQKZROFy3ATSdYWS2D/
WHQNYuD10jqVyGRScXePVD2PKTCJnbSDYIg67fWBxWBSuU8Go/nW8NhALCLysgXT
A6p6Kysr7jA5FME8ZRu6lkrRQ063lvlNFzAG4e/iRFh74GhhLxsnwzvdV7YZQDWF
h9t70vSLIO/9B5fTHEJ81XnfRus5yb2qkp2eYF9PWVf5tcobXykP/2OpQCR1ymr6
iFm/QNmDgRwmKsu5/7aGOFUn198qPdmapYIGf6rTJ4mGOnJgLltXkTK+Kd4SKJ/T
nDroWWc2oA/75/3yCxG/7jvQb/59p/F7YcOXp4DODRRSMOOj1aBNemNtpeoqyLVQ
+9j4S26wvcyRSlzrIjmnYmzMNOvvmHr7e3MUzm+ANEssvUZ6fiLpK69CnsUDc7y3
YOxmfk2k22CECJYkL1rCSD2dKGQBWKC8XFg2cf2+NdHBoLI4DnQdyU/iWhEc3LI7
cKcd9EJvtIK5Aw0dnZC3Smi24KokOnfR4gvNJs2cGj/HKDGMk1U=
=7zGa
-----END PGP SIGNATURE-----

--Fnm8lRGFTVS/3GuM--

--===============0631008427==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4
IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4

--===============0631008427==--
