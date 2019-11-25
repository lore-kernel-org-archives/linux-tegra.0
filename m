From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 01/15] drm/tegra: Map cmdbuf once for reloc
 processing
Date: Mon, 25 Nov 2019 12:02:40 +0100
Message-ID: <20191125110240.GH1409040@ulmo>
References: <20191118103536.17675-1-daniel.vetter@ffwll.ch>
 <20191118103536.17675-2-daniel.vetter@ffwll.ch>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0676264224=="
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
In-Reply-To: <20191118103536.17675-2-daniel.vetter@ffwll.ch>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: linux-tegra@vger.kernel.org, Daniel Vetter <daniel.vetter@intel.com>, Intel Graphics Development <intel-gfx@lists.freedesktop.org>, DRI Development <dri-devel@lists.freedesktop.org>
List-Id: linux-tegra@vger.kernel.org


--===============0676264224==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Hlh2aiwFLCZwGcpw"
Content-Disposition: inline


--Hlh2aiwFLCZwGcpw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 18, 2019 at 11:35:22AM +0100, Daniel Vetter wrote:
> A few reasons to drop kmap:
>=20
> - For native objects all we do is look at obj->vaddr anyway, so might
>   as well not call functions for every page.
>=20
> - Reloc-processing on dma-buf is ... questionable.
>=20
> - Plus most dma-buf that bother kernel cpu mmaps give you at least
>   vmap, much less kmaps. And all the ones relevant for arm-soc are
>   again doing a obj->vaddr game anyway, there's no real kmap going on
>   on arm it seems.
>=20
> Plus this seems to be the only real in-tree user of dma_buf_kmap, and
> I'd like to get rid of that.
>=20
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: linux-tegra@vger.kernel.org
> ---
>  drivers/gpu/host1x/job.c | 21 +++++++--------------
>  1 file changed, 7 insertions(+), 14 deletions(-)

This looks correct to me, and running some of the grate project's tests
against this works just fine, so:

Reviewed-by: Thierry Reding <treding@nvidia.com>
Tested-by: Thierry Reding <treding@nvidia.com>

> diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
> index 25ca54de8fc5..60b2fedd0061 100644
> --- a/drivers/gpu/host1x/job.c
> +++ b/drivers/gpu/host1x/job.c
> @@ -244,8 +244,7 @@ static unsigned int pin_job(struct host1x *host, stru=
ct host1x_job *job)
> =20
>  static int do_relocs(struct host1x_job *job, struct host1x_job_gather *g)
>  {
> -	u32 last_page =3D ~0;
> -	void *cmdbuf_page_addr =3D NULL;
> +	void *cmdbuf_addr =3D NULL;
>  	struct host1x_bo *cmdbuf =3D g->bo;
>  	unsigned int i;
> =20
> @@ -267,28 +266,22 @@ static int do_relocs(struct host1x_job *job, struct=
 host1x_job_gather *g)
>  			goto patch_reloc;
>  		}
> =20
> -		if (last_page !=3D reloc->cmdbuf.offset >> PAGE_SHIFT) {
> -			if (cmdbuf_page_addr)
> -				host1x_bo_kunmap(cmdbuf, last_page,
> -						 cmdbuf_page_addr);
> +		if (!cmdbuf_addr) {
> +			cmdbuf_addr =3D host1x_bo_mmap(cmdbuf);
> =20
> -			cmdbuf_page_addr =3D host1x_bo_kmap(cmdbuf,
> -					reloc->cmdbuf.offset >> PAGE_SHIFT);
> -			last_page =3D reloc->cmdbuf.offset >> PAGE_SHIFT;
> -
> -			if (unlikely(!cmdbuf_page_addr)) {
> +			if (unlikely(!cmdbuf_addr)) {
>  				pr_err("Could not map cmdbuf for relocation\n");
>  				return -ENOMEM;
>  			}
>  		}
> =20
> -		target =3D cmdbuf_page_addr + (reloc->cmdbuf.offset & ~PAGE_MASK);
> +		target =3D cmdbuf_addr + reloc->cmdbuf.offset;
>  patch_reloc:
>  		*target =3D reloc_addr;
>  	}
> =20
> -	if (cmdbuf_page_addr)
> -		host1x_bo_kunmap(cmdbuf, last_page, cmdbuf_page_addr);
> +	if (cmdbuf_addr)
> +		host1x_bo_munmap(cmdbuf, cmdbuf_addr);
> =20
>  	return 0;
>  }
> --=20
> 2.24.0
>=20

--Hlh2aiwFLCZwGcpw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3btM0ACgkQ3SOs138+
s6E8Ug/6AxtIN3gdIMNRpWS1/fxfs4LDI3xY6p8jCgdVzy3VihBMrjUfRhGhCJ4h
zZYzNCHcVhbwo+kg2L0C+q2APAn+N8f+Azqg7zSL8SrDEyC6M8QpcQX6x9vS5FFw
fmFb25YyIOG6yIU+HvA68XbqbbznoZ3pDTKGo/UqrkAo7xN/a8+DqucUj+2jW0L4
zLjsDxHwwSODQJjty3wLj6ICKIT9Uq8SXJFBwekDBhHBKIWnhwUWT1cyOL3+MX0U
YavybeVMfPErj6Wqm9ksu6t6ytQZZjUYU/uhBpQwpFzhuCtXEOYJ6nlPAvvsgF7h
VaFyu5mEY8I1YXWaj/Yulok6ggez1zwdokQkS0jE+lyFwvQBCeAIAziMIBMCaVO1
NS3XK3DnboolU8JS17WOkNalLLZ77AC1P172gLFQHRdYz3eaUR3HujD5bmMIhni1
EqdWdxA/a3hzxEYzacz9Xpo06MuZqiiYly2Au5xwrxAvD5WVyfz9Cg4ulniNjPdX
Qk6ydj+709/EoZux1OHBioPDII4/wLu5lmfy5kg8sopXsgp+wmfWtaWzGeBPF/Ii
QCebUiqNeTCMdUcEI/n75beEfVQm3UVOK6UDsIq9ksU1HaSFyz6RdpIDZPqPUUah
htfjCOT9ffDWoqvObNXLkY2jI5j4oppPHSE19Gr8Z4gUxSSpFgY=
=w4PM
-----END PGP SIGNATURE-----

--Hlh2aiwFLCZwGcpw--

--===============0676264224==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4
IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4

--===============0676264224==--
