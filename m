From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 2/6] drm/nouveau: map pages using DMA API
 on platform devices
Date: Fri, 11 Jul 2014 12:50:09 +1000
Message-ID: <CACAvsv7eER4VmbR81Ym=YE7fQZ9cNuJsb5372SAuSX+PQfYyrQ@mail.gmail.com>
References: <1404807961-30530-1-git-send-email-acourbot@nvidia.com>
 <1404807961-30530-3-git-send-email-acourbot@nvidia.com>
 <20140710125849.GF17271@phenom.ffwll.local>
 <53BF4D6B.70904@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <53BF4D6B.70904-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
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
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Jul 11, 2014 at 12:35 PM, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> On 07/10/2014 09:58 PM, Daniel Vetter wrote:
>>
>> On Tue, Jul 08, 2014 at 05:25:57PM +0900, Alexandre Courbot wrote:
>>>
>>> page_to_phys() is not the correct way to obtain the DMA address of a
>>> buffer on a non-PCI system. Use the DMA API functions for this, which
>>> are portable and will allow us to use other DMA API functions for
>>> buffer synchronization.
>>>
>>> Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>> ---
>>>   drivers/gpu/drm/nouveau/core/engine/device/base.c | 8 +++++++-
>>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/nouveau/core/engine/device/base.c
>>> b/drivers/gpu/drm/nouveau/core/engine/device/base.c
>>> index 18c8c7245b73..e4e9e64988fe 100644
>>> --- a/drivers/gpu/drm/nouveau/core/engine/device/base.c
>>> +++ b/drivers/gpu/drm/nouveau/core/engine/device/base.c
>>> @@ -489,7 +489,10 @@ nv_device_map_page(struct nouveau_device *device,
>>> struct page *page)
>>>                 if (pci_dma_mapping_error(device->pdev, ret))
>>>                         ret = 0;
>>>         } else {
>>> -               ret = page_to_phys(page);
>>> +               ret = dma_map_page(&device->platformdev->dev, page, 0,
>>> +                                  PAGE_SIZE, DMA_BIDIRECTIONAL);
>>> +               if (dma_mapping_error(&device->platformdev->dev, ret))
>>> +                       ret = 0;
>>>         }
>>>
>>>         return ret;
>>> @@ -501,6 +504,9 @@ nv_device_unmap_page(struct nouveau_device *device,
>>> dma_addr_t addr)
>>>         if (nv_device_is_pci(device))
>>>                 pci_unmap_page(device->pdev, addr, PAGE_SIZE,
>>>                                PCI_DMA_BIDIRECTIONAL);
>>
>>
>> pci_map/unmap alias to dma_unmap/map when called on the underlying struct
>> device embedded in pci_device (like for platform drivers). Dunno whether
>> it's worth to track a pointer to the struct device directly and always
>> call dma_unmap/map.
>
>
> Isn't it (theoretically) possible to have a platform that does not use the
> DMA API for its PCI implementation and thus requires the pci_* functions to
> be called? I could not find such a case in -next, which suggests that all
> PCI platforms have been converted to the DMA API already and that we could
> indeed refactor this to always use the DMA functions.
>
> But at the same time the way we use APIs should not be directed by their
> implementation, but by their intent - and unless the PCI API has been
> deprecated in some way (something I am not aware of), the rule is still that
> you should use it on a PCI device.
>
>
>>
>> Just drive-by comment since I'm interested in how you solve this - i915
>> has similar fun with buffer sharing and coherent and non-coherent
>> platforms. Although we don't have fun with pci and non-pci based
>> platforms.
>
>
> Yeah, I am not familiar with i915 but it seems like we are on a similar boat
> here (excepted ARM is more constrained as to its memory mappings). The
> strategy in this series is, map buffers used by user-space cached and
> explicitly synchronize them (since the ownership transition from user to GPU
> is always clearly performed by syscalls), and use coherent mappings for
> buffers used by the kernel which are accessed more randomly. This has solved
> all our coherency issues and resulted in the best performance so far.
I wonder if we might want to use unsnooped cached mappings of pages on
non-ARM platforms also, to avoid the overhead of the cache snooping?

>
>
> _______________________________________________
> dri-devel mailing list
> dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
