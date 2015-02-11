From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: [Nouveau] [PATCH v2 6/6] instmem/gk20a: add IOMMU support
Date: Wed, 11 Feb 2015 03:03:59 -0500
Message-ID: <CAKb7UvidbJH_Gvv8YaGD45kiA+pt9UL4LBDsJc8p3mCVFTE1jw@mail.gmail.com>
References: <1423639301-27304-1-git-send-email-acourbot@nvidia.com>
	<1423639301-27304-7-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1423639301-27304-7-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Feb 11, 2015 at 2:21 AM, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Let GK20A's instmem take advantage of the IOMMU if it is present. Having
> an IOMMU means that instmem is no longer allocated using the DMA API,
> but instead obtained through page_alloc and made contiguous to the GPU
> by IOMMU mappings.
>
> Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drm/nouveau/nvkm/subdev/instmem/gk20a.c | 272 ++++++++++++++++++++++++++++----
>  1 file changed, 241 insertions(+), 31 deletions(-)
>
> diff --git a/drm/nouveau/nvkm/subdev/instmem/gk20a.c b/drm/nouveau/nvkm/subdev/instmem/gk20a.c
> index 4c8af6e..a20b93c 100644
> --- a/drm/nouveau/nvkm/subdev/instmem/gk20a.c
> +++ b/drm/nouveau/nvkm/subdev/instmem/gk20a.c
> @@ -20,12 +20,32 @@
>   * DEALINGS IN THE SOFTWARE.
>   */
>
> +/*
> + * GK20A does not have dedicated video memory, and to accurately represent this
> + * fact Nouveau will not create a RAM device for it. Therefore its instmem
> + * implementation must be done directly on top of system memory, while providing
> + * coherent read and write operations.
> + *
> + * Instmem can be allocated through two means:
> + * 1) If a IOMMU mapping has been probed, the IOMMU API is used to make memory

an IOMMU mapping

> + *    pages contiguous to the GPU. This is the preferred way.
> + * 2) If no IOMMU mapping is probed, the DMA API is used to allocated physically

to allocate physically

> + *    contiguous memory.
> + *
> + * In both cases CPU read and writes are performed using PRAMIN (i.e. using the
> + * GPU path) to ensure these operations are coherent for the GPU. This allows us
> + * to use more "relaxed" allocation parameters when using the DMA API, since we
> + * never need a kernel mapping.
> + */

Er yeah... obviously ignore my comments about sharing nv50_instmem_priv stuff.

  -ilia
