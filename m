From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 5/8] gpu: host1x: Add IOMMU support
Date: Mon, 5 Dec 2016 20:49:24 +0100
Message-ID: <20161205194924.GE22918@ulmo.ba.sec>
References: <20161110182345.31777-1-mperttunen@nvidia.com>
 <20161110182345.31777-6-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0418038654=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20161110182345.31777-6-mperttunen@nvidia.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org


--===============0418038654==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="19uQFt6ulqmgNgg1"
Content-Disposition: inline


--19uQFt6ulqmgNgg1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 10, 2016 at 08:23:42PM +0200, Mikko Perttunen wrote:
> Add support for the Host1x unit to be located behind
> an IOMMU. This is required when gather buffers may be
> allocated non-contiguously in physical memory, as can
> be the case when TegraDRM is also using the IOMMU.
>=20
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  drivers/gpu/host1x/cdma.c       | 65 +++++++++++++++++++++++++++++------
>  drivers/gpu/host1x/cdma.h       |  4 ++-
>  drivers/gpu/host1x/dev.c        | 39 +++++++++++++++++++--
>  drivers/gpu/host1x/dev.h        |  5 +++
>  drivers/gpu/host1x/hw/cdma_hw.c | 10 +++---
>  drivers/gpu/host1x/job.c        | 76 +++++++++++++++++++++++++++++++++++=
------
>  drivers/gpu/host1x/job.h        |  1 +
>  7 files changed, 171 insertions(+), 29 deletions(-)
>=20
> diff --git a/drivers/gpu/host1x/cdma.c b/drivers/gpu/host1x/cdma.c
> index c5d82a8..14692446e 100644
> --- a/drivers/gpu/host1x/cdma.c
> +++ b/drivers/gpu/host1x/cdma.c
> @@ -51,9 +51,15 @@ static void host1x_pushbuffer_destroy(struct push_buff=
er *pb)
>  	struct host1x_cdma *cdma =3D pb_to_cdma(pb);
>  	struct host1x *host1x =3D cdma_to_host1x(cdma);
> =20
> -	if (pb->phys !=3D 0)
> -		dma_free_wc(host1x->dev, pb->size_bytes + 4, pb->mapped,
> -			    pb->phys);
> +	if (!pb->phys)
> +		return;
> +
> +	if (host1x->domain) {
> +		iommu_unmap(host1x->domain, pb->dma, pb->alloc_size_bytes);
> +		free_iova(&host1x->iova, iova_pfn(&host1x->iova, pb->dma));
> +	}
> +
> +	dma_free_wc(host1x->dev, pb->alloc_size_bytes, pb->mapped, pb->phys);
> =20
>  	pb->mapped =3D NULL;
>  	pb->phys =3D 0;
> @@ -66,28 +72,65 @@ static int host1x_pushbuffer_init(struct push_buffer =
*pb)
>  {
>  	struct host1x_cdma *cdma =3D pb_to_cdma(pb);
>  	struct host1x *host1x =3D cdma_to_host1x(cdma);
> +	struct iova *alloc;
> +	int err;
> =20
>  	pb->mapped =3D NULL;
>  	pb->phys =3D 0;
>  	pb->size_bytes =3D HOST1X_PUSHBUFFER_SLOTS * 8;
> +	pb->alloc_size_bytes =3D pb->size_bytes + 4;
> =20
>  	/* initialize buffer pointers */
>  	pb->fence =3D pb->size_bytes - 8;
>  	pb->pos =3D 0;
> =20
> -	/* allocate and map pushbuffer memory */
> -	pb->mapped =3D dma_alloc_wc(host1x->dev, pb->size_bytes + 4, &pb->phys,
> -				  GFP_KERNEL);
> -	if (!pb->mapped)
> -		goto fail;
> +	if (host1x->domain) {
> +		unsigned long shift;
> +
> +		pb->alloc_size_bytes =3D iova_align(&host1x->iova,
> +						  pb->alloc_size_bytes);
> +
> +		pb->mapped =3D dma_alloc_wc(host1x->dev, pb->alloc_size_bytes,
> +					  &pb->phys, GFP_KERNEL);
> +		if (!pb->mapped)
> +			return -ENOMEM;
> +
> +		shift =3D iova_shift(&host1x->iova);
> +		alloc =3D alloc_iova(
> +			&host1x->iova, pb->alloc_size_bytes >> shift,
> +			host1x->domain->geometry.aperture_end >> shift, true);

Let's precompute some of these values to make this expression more
compact. For example pb->alloc_size_bytes is used a couple of times, so
it could be stored temporarily in a local variable with a nice and short
name such as "size".

If you store the aperture end, or limit_pfn, as I commented in an
earlier patch, then this also becomes much more compact.

> +		if (!alloc) {
> +			err =3D -ENOMEM;
> +			goto iommu_free_mem;
> +		}
> +
> +		err =3D iommu_map(host1x->domain,
> +				iova_dma_addr(&host1x->iova, alloc),
> +				pb->phys, pb->alloc_size_bytes,
> +				IOMMU_READ);

Same here.

> +		if (err)
> +			goto iommu_free_iova;
> +
> +		pb->dma =3D iova_dma_addr(&host1x->iova, alloc);
> +	} else {
> +		pb->mapped =3D dma_alloc_wc(host1x->dev, pb->alloc_size_bytes,
> +					  &pb->phys, GFP_KERNEL);
> +		if (!pb->mapped)
> +			return -ENOMEM;
> +
> +		pb->dma =3D pb->phys;
> +	}
> =20
>  	host1x_hw_pushbuffer_init(host1x, pb);
> =20
>  	return 0;
> =20
> -fail:
> -	host1x_pushbuffer_destroy(pb);
> -	return -ENOMEM;
> +iommu_free_iova:
> +	__free_iova(&host1x->iova, alloc);
> +iommu_free_mem:
> +	dma_free_wc(host1x->dev, pb->alloc_size_bytes, pb->mapped, pb->phys);
> +
> +	return err;
>  }
> =20
>  /*
> diff --git a/drivers/gpu/host1x/cdma.h b/drivers/gpu/host1x/cdma.h
> index 470087a..4b3645f 100644
> --- a/drivers/gpu/host1x/cdma.h
> +++ b/drivers/gpu/host1x/cdma.h
> @@ -43,10 +43,12 @@ struct host1x_job;
> =20
>  struct push_buffer {
>  	void *mapped;			/* mapped pushbuffer memory */
> -	dma_addr_t phys;		/* physical address of pushbuffer */
> +	dma_addr_t dma;			/* device address of pushbuffer */
> +	phys_addr_t phys;		/* physical address of pushbuffer */
>  	u32 fence;			/* index we've written */
>  	u32 pos;			/* index to write to */
>  	u32 size_bytes;
> +	u32 alloc_size_bytes;

Maybe just "alloc_size"?

>  };
> =20
>  struct buffer_timeout {
> diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
> index a62317a..ca4527e 100644
> --- a/drivers/gpu/host1x/dev.c
> +++ b/drivers/gpu/host1x/dev.c
> @@ -168,16 +168,36 @@ static int host1x_probe(struct platform_device *pde=
v)
>  		return err;
>  	}
> =20
> +	if (iommu_present(&platform_bus_type)) {
> +		struct iommu_domain_geometry *geometry;
> +		unsigned long order;
> +
> +		host->domain =3D iommu_domain_alloc(&platform_bus_type);
> +		if (!host->domain)
> +			return -ENOMEM;
> +
> +		err =3D iommu_attach_device(host->domain, &pdev->dev);
> +		if (err)
> +			goto fail_free_domain;
> +
> +		geometry =3D &host->domain->geometry;
> +
> +		order =3D __ffs(host->domain->pgsize_bitmap);
> +		init_iova_domain(&host->iova, 1UL << order,
> +				 geometry->aperture_start >> order,
> +				 geometry->aperture_end >> order);
> +	}
> +
>  	err =3D host1x_channel_list_init(host);
>  	if (err) {
>  		dev_err(&pdev->dev, "failed to initialize channel list\n");
> -		return err;
> +		goto fail_detach_device;
>  	}
> =20
>  	err =3D clk_prepare_enable(host->clk);
>  	if (err < 0) {
>  		dev_err(&pdev->dev, "failed to enable clock\n");
> -		return err;
> +		goto fail_detach_device;
>  	}
> =20
>  	err =3D host1x_syncpt_init(host);
> @@ -206,6 +226,15 @@ static int host1x_probe(struct platform_device *pdev)
>  	host1x_syncpt_deinit(host);
>  fail_unprepare_disable:
>  	clk_disable_unprepare(host->clk);
> +fail_detach_device:
> +	if (host->domain) {
> +		put_iova_domain(&host->iova);
> +		iommu_detach_device(host->domain, &pdev->dev);
> +	}
> +fail_free_domain:
> +	if (host->domain)
> +		iommu_domain_free(host->domain);
> +
>  	return err;
>  }
> =20
> @@ -218,6 +247,12 @@ static int host1x_remove(struct platform_device *pde=
v)
>  	host1x_syncpt_deinit(host);
>  	clk_disable_unprepare(host->clk);
> =20
> +	if (host->domain) {
> +		put_iova_domain(&host->iova);
> +		iommu_detach_device(host->domain, &pdev->dev);
> +		iommu_domain_free(host->domain);
> +	}
> +
>  	return 0;
>  }
> =20
> diff --git a/drivers/gpu/host1x/dev.h b/drivers/gpu/host1x/dev.h
> index 5220510..6189825 100644
> --- a/drivers/gpu/host1x/dev.h
> +++ b/drivers/gpu/host1x/dev.h
> @@ -19,6 +19,8 @@
> =20
>  #include <linux/platform_device.h>
>  #include <linux/device.h>
> +#include <linux/iommu.h>
> +#include <linux/iova.h>
> =20
>  #include "channel.h"
>  #include "syncpt.h"
> @@ -108,6 +110,9 @@ struct host1x {
>  	struct device *dev;
>  	struct clk *clk;
> =20
> +	struct iommu_domain *domain;
> +	struct iova_domain iova;
> +
>  	struct mutex intr_mutex;
>  	int intr_syncpt_irq;
> =20
> diff --git a/drivers/gpu/host1x/hw/cdma_hw.c b/drivers/gpu/host1x/hw/cdma=
_hw.c
> index 659c1bb..b8c0348 100644
> --- a/drivers/gpu/host1x/hw/cdma_hw.c
> +++ b/drivers/gpu/host1x/hw/cdma_hw.c
> @@ -55,7 +55,7 @@ static void cdma_timeout_cpu_incr(struct host1x_cdma *c=
dma, u32 getptr,
>  		*(p++) =3D HOST1X_OPCODE_NOP;
>  		*(p++) =3D HOST1X_OPCODE_NOP;
>  		dev_dbg(host1x->dev, "%s: NOP at %pad+%#x\n", __func__,
> -			&pb->phys, getptr);
> +			&pb->dma, getptr);
>  		getptr =3D (getptr + 8) & (pb->size_bytes - 1);
>  	}
> =20
> @@ -78,9 +78,9 @@ static void cdma_start(struct host1x_cdma *cdma)
>  			 HOST1X_CHANNEL_DMACTRL);
> =20
>  	/* set base, put and end pointer */
> -	host1x_ch_writel(ch, cdma->push_buffer.phys, HOST1X_CHANNEL_DMASTART);
> +	host1x_ch_writel(ch, cdma->push_buffer.dma, HOST1X_CHANNEL_DMASTART);
>  	host1x_ch_writel(ch, cdma->push_buffer.pos, HOST1X_CHANNEL_DMAPUT);
> -	host1x_ch_writel(ch, cdma->push_buffer.phys +
> +	host1x_ch_writel(ch, cdma->push_buffer.dma +
>  			 cdma->push_buffer.size_bytes + 4,
>  			 HOST1X_CHANNEL_DMAEND);
> =20
> @@ -115,8 +115,8 @@ static void cdma_timeout_restart(struct host1x_cdma *=
cdma, u32 getptr)
>  			 HOST1X_CHANNEL_DMACTRL);
> =20
>  	/* set base, end pointer (all of memory) */
> -	host1x_ch_writel(ch, cdma->push_buffer.phys, HOST1X_CHANNEL_DMASTART);
> -	host1x_ch_writel(ch, cdma->push_buffer.phys +
> +	host1x_ch_writel(ch, cdma->push_buffer.dma, HOST1X_CHANNEL_DMASTART);
> +	host1x_ch_writel(ch, cdma->push_buffer.dma +
>  			 cdma->push_buffer.size_bytes,
>  			 HOST1X_CHANNEL_DMAEND);
> =20
> diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
> index a91b7c4..222d930 100644
> --- a/drivers/gpu/host1x/job.c
> +++ b/drivers/gpu/host1x/job.c
> @@ -174,8 +174,9 @@ static int do_waitchks(struct host1x_job *job, struct=
 host1x *host,
>  	return 0;
>  }
> =20
> -static unsigned int pin_job(struct host1x_job *job)
> +static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
>  {
> +	int err;
>  	unsigned int i;

Maybe use an inverse christmas tree for variables as in other parts of
this driver? That is, add the new int err belowe the existing unsined
int i.

> =20
>  	job->num_unpins =3D 0;
> @@ -186,12 +187,16 @@ static unsigned int pin_job(struct host1x_job *job)
>  		dma_addr_t phys_addr;
> =20
>  		reloc->target.bo =3D host1x_bo_get(reloc->target.bo);
> -		if (!reloc->target.bo)
> +		if (!reloc->target.bo) {
> +			err =3D -EINVAL;
>  			goto unpin;
> +		}
> =20
>  		phys_addr =3D host1x_bo_pin(reloc->target.bo, &sgt);
> -		if (!phys_addr)
> +		if (!phys_addr) {
> +			err =3D -EINVAL;
>  			goto unpin;
> +		}
> =20
>  		job->addr_phys[job->num_unpins] =3D phys_addr;
>  		job->unpins[job->num_unpins].bo =3D reloc->target.bo;
> @@ -204,25 +209,68 @@ static unsigned int pin_job(struct host1x_job *job)
>  		struct sg_table *sgt;
>  		dma_addr_t phys_addr;
> =20
> +		size_t gather_size =3D 0;
> +		struct scatterlist *sg;
> +		struct iova *alloc;
> +		unsigned long shift;
> +		int j;

There should be no blank line between blocks of variable declarations.
Also, make j an unsigned int.

> +
>  		g->bo =3D host1x_bo_get(g->bo);
> -		if (!g->bo)
> +		if (!g->bo) {
> +			err =3D -EINVAL;
>  			goto unpin;
> +		}
> =20
>  		phys_addr =3D host1x_bo_pin(g->bo, &sgt);
> -		if (!phys_addr)
> +		if (!phys_addr) {
> +			err =3D -EINVAL;
>  			goto unpin;
> +		}
> +
> +		if (!IS_ENABLED(CONFIG_TEGRA_HOST1X_FIREWALL) && host->domain) {
> +			for_each_sg(sgt->sgl, sg, sgt->nents, j) {
> +				gather_size +=3D sg->length;
> +			}

No need for curly brackets here.

> +			gather_size =3D iova_align(&host->iova, gather_size);
> +
> +			shift =3D iova_shift(&host->iova);
> +			alloc =3D alloc_iova(
> +				&host->iova, gather_size >> shift,
> +				host->domain->geometry.aperture_end >> shift,
> +				true);

This could be made a little more compact as well.

Thierry

--19uQFt6ulqmgNgg1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJYRcTBAAoJEN0jrNd/PrOhk4UP/20HkmNCyulRD9dYsPRpaO/l
bwgZfFO22z+HpE++do1V4JMqRNS9uzssg+CEw33LQsNI3flx1tTAQxz7q002wSlo
Vdr8zwLg7gSeRHFb8vwh1pTf5d7WMEQctfDYS75kKz/zYpgUWygkap7sNRoWxCD8
gTVezAtA03lYoxuV5K3W27LMvTF9p4NA4gUQs9HGflAaphfaDlK84VtAj/kFUtVn
5VX4FvCY5UY5+2JZWQzu1jAkEaYSVXl2wMHMIMXglBHBZjFWpIAhh/3/Y6fnDGZa
Y3uEk31ls4zwsWLAmJWp6pEUlKd0QhcbD9M7eBKYDYRkFbuxT8JPKplrgkf5LELr
pPiHYkEnREDYqCe6s5pzHV7mY+Unmkqif+Q+KD6VBHxc+bigdcvwEkqQC1p3eVgF
TbCgFMxFmNowILZ/X6n7JT7is47WgbSl/lGgteySG5frRJh443HBzQTIJErQ85m7
DseOwE53sBQYPrPixVkuPzVDcsMkIjXZm9i8j+pf0KIKnt6l/LXYrFAisjP8RDGN
37M1bV73a+olNRL7avIwfCSww9D0QDFx51/9IkJ6m0vJDN1a8LpCVqJbQ3oWYym3
Tq/S9B5abl/MtNPBxbyyvHYkEVvt+ocgn+thb5LqwY+tYJiRadwFILzjACWraokm
niXW6qrN6MtRB/zHbgM4
=4l7K
-----END PGP SIGNATURE-----

--19uQFt6ulqmgNgg1--

--===============0418038654==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0418038654==--
