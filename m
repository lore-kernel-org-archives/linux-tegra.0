From: Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 03/22] drm/tegra: Check whether page belongs to BO in tegra_bo_kmap()
Date: Tue, 23 May 2017 02:21:19 +0200
Message-ID: <CABPQNSZcD=zVxd4ksC_SAbbNhu7Py0WJhXVh+zit=sDgxaZnbg@mail.gmail.com>
References: <cover.1495498184.git.digetx@gmail.com> <04637a55694493bdd8267a7f19798d7968568087.1495498184.git.digetx@gmail.com>
Reply-To: kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <04637a55694493bdd8267a7f19798d7968568087.1495498184.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, May 23, 2017 at 2:14 AM, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> This fixes an OOPS in case of out-of-bounds accessing of a kmap'ed cmdbuf
> (non-IOMMU allocation) while patching the relocations in do_relocs().
>
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/gpu/drm/tegra/gem.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
> index 424569b53e57..ca0d4439e97b 100644
> --- a/drivers/gpu/drm/tegra/gem.c
> +++ b/drivers/gpu/drm/tegra/gem.c
> @@ -74,6 +74,9 @@ static void *tegra_bo_kmap(struct host1x_bo *bo, unsigned int page)
>  {
>         struct tegra_bo *obj = host1x_to_tegra_bo(bo);
>
> +       if (page * PAGE_SIZE >= obj->gem.size)
> +               return NULL;
> +
>         if (obj->vaddr)
>                 return obj->vaddr + page * PAGE_SIZE;
>         else if (obj->gem.import_attach)
> --
> 2.13.0
>

Reviewed-by: Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
