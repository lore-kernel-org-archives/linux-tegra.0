From: Rob Clark <robdclark@gmail.com>
Subject: Re: [RFC libdrm] Add NVIDIA Tegra support
Date: Tue, 4 Dec 2012 09:28:25 -0600
Message-ID: <CAF6AEGum=cOxcHN1fBNfpLpm=bC-dXHZ_h2u96Ek4gwQSWSTtw@mail.gmail.com>
References: <1354634032-9986-1-git-send-email-thierry.reding@avionic-design.de>
	<1354634032-9986-2-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <1354634032-9986-2-git-send-email-thierry.reding@avionic-design.de>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Thierry Reding <thierry.reding@avionic-design.de>
Cc: linux-tegra@vger.kernel.org, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Dec 4, 2012 at 9:13 AM, Thierry Reding
<thierry.reding@avionic-design.de> wrote:
> +int drm_tegra_bo_new(struct drm_tegra *device, uint32_t flags, uint32_t size,
> +                    struct drm_tegra_bo **bop)
> +{
> +       struct drm_tegra_gem_create args;
> +       struct drm_tegra_bo *bo;
> +       struct tegra_bo *priv;
> +       int err;
> +
> +       if (!device || size == 0 || !bop)
> +               return -EINVAL;
> +
> +       bo = calloc(1, sizeof(*bo));
> +       if (!bo)
> +               return -ENOMEM;
> +
> +       priv = tegra_bo(bo);
> +
> +       DRMLISTINITHEAD(&priv->list);
> +       atomic_set(&priv->ref, 1);
> +       bo->device = device;
> +       bo->flags = flags;
> +       bo->size = size;
> +
> +       memset(&args, 0, sizeof(args));
> +       args.flags = flags;
> +       args.size = size;
> +
> +       err = drmCommandWriteRead(device->fd, DRM_TEGRA_GEM_CREATE, &args,
> +                                 sizeof(args));
> +       if (err < 0) {
> +               err = -errno;
> +               free(bo);
> +               return err;
> +       }
> +
> +       DRMLISTADD(&priv->list, &device->bo_list);
> +       bo->handle = args.handle;
> +       bo->offset = args.offset;

btw, x11 can rapidly create/destroy temporary pixmaps.. which don't
necessarily need userspace access.  You might prefer to avoid creating
mmap offset on GEM bo creation, and instead do this only if userspace
needs to mmap the bo

BR,
-R

> +
> +       *bop = bo;
> +
> +       return 0;
> +}
