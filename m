From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/4] drm/ttm: introduce dma cache sync helpers
Date: Fri, 23 May 2014 14:49:40 +0900
Message-ID: <CAAVeFuKCx677Uxcu3XNLkU+er-GBAxqdj_hUDUXHwUN+CS5EsA@mail.gmail.com>
References: <1400483458-9648-1-git-send-email-acourbot@nvidia.com>
 <1400483458-9648-3-git-send-email-acourbot@nvidia.com>
 <20140519083355.GA7138@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20140519083355.GA7138@ulmo>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, May 19, 2014 at 5:33 PM, Thierry Reding
<thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Mon, May 19, 2014 at 04:10:56PM +0900, Alexandre Courbot wrote:
>> From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
>>
>> On arches with non-coherent PCI,
>
> I guess since this applies to gk20a
>
>> we need to flush caches ourselfes at
>
> "ourselves". Or perhaps even reword to something like: "..., caches need
> to be flushed and invalidated explicitly", since dma_sync_for_cpu() does
> invalidate rather than flush.

Rephrased as "On arches for which access to GPU memory is non-coherent, caches
need to be flushed and invalidated explicitly at the appropriate places."

>
>> the appropriate places. Introduce two small helpers to make things easy
>> for TTM based drivers.
>>
>> Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
>> Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>  drivers/gpu/drm/ttm/ttm_tt.c    | 25 +++++++++++++++++++++++++
>>  include/drm/ttm/ttm_bo_driver.h | 28 ++++++++++++++++++++++++++++
>>  2 files changed, 53 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
> [...]
>> +void ttm_dma_tt_cache_sync_for_device(struct ttm_dma_tt *ttm_dma,
>> +                                   struct device *dev)
>> +{
>> +     int i;
>
> This should probably be unsigned long to match the type of
> ttm_dma->ttm.num_pages.

Fixed.

Thanks,
Alex.
