From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] drm/nouveau/tegra: Fix error handling
Date: Wed, 2 Nov 2016 13:59:41 +0900
Message-ID: <CAAVeFuLp5YcsMAGYGpyGQ88LVE=UUt2obUVKPj2qFfQL_6nVKQ@mail.gmail.com>
References: <20161031063550.2567-1-christophe.jaillet@wanadoo.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <kernel-janitors-owner@vger.kernel.org>
In-Reply-To: <20161031063550.2567-1-christophe.jaillet@wanadoo.fr>
Sender: kernel-janitors-owner@vger.kernel.org
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Oct 31, 2016 at 3:35 PM, Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
> 'iommu_domain_alloc()' returns NULL in case of error, not an error pointer.
> So test it accordingly.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

Indeed. Thanks for the fix!
