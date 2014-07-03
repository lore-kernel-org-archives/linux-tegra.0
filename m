From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 0/2] drm: nouveau: memory coherency for ARM
Date: Thu, 3 Jul 2014 19:05:05 +0900
Message-ID: <CAAVeFuLWpfjqWFRyGqROdxw7qP2OkXFZTPkCHCtwzwE=VjjRgQ@mail.gmail.com>
References: <1403868134-31741-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1403868134-31741-1-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

While this series is more correct from the DMA API point of view, it
is also much heavier as it strictly disables the use of any cache on
all user-space mapped BOs, and is also much more restricted in terms
of which memory it can use.

I have a v4 in the works that lets us use TTM for user-mapped objects
and only falls back to using the DMA API for kernel-only objects
(fences & PBs basically). Will push it shortly but wanted to signal
this revision as deprecated in the meantime.

On Fri, Jun 27, 2014 at 8:22 PM, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> v2 was doing some pretty nasty things with the DMA API, so I took a different
> approach for this v3.
>
> As suggested, this version uses ttm_dma_populate() to populate BOs. The reason
> for doing this was that it would entitle us to using the DMA sync functions,
> but since the memory returned is already coherent anyway, we do not even
> need to call these functions anymore.
>
> So this series has turned into 2 small patches:
>
> - The first attempts to make it more obvious that Nouveau can use different
> ways to populate TTs, and make it possible to choose which method to use from
> a single place.
> - The second leverages this work to select the DMA allocator to populate TTs
> on ARM.
>
> Doing this solves all our coherency problems with Nouveau on Tegra, and
> hopefully makes the code easier to read in the process.
>
> Alexandre Courbot (2):
>   drm/nouveau: cleanup TTM population logic
>   drm/nouveau: use DMA TT population method on ARM
>
>  drivers/gpu/drm/nouveau/nouveau_bo.c  | 63 ++++++++++++++++++-----------------
>  drivers/gpu/drm/nouveau/nouveau_drm.h | 11 ++++++
>  drivers/gpu/drm/nouveau/nouveau_ttm.c | 17 ++++++++++
>  3 files changed, 61 insertions(+), 30 deletions(-)
>
> --
> 2.0.0
>
