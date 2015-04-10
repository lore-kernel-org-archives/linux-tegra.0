From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V2] pmu/gk20a: PMU boot support.
Date: Fri, 10 Apr 2015 16:10:01 +0900
Message-ID: <CAAVeFu+Z+H46CFYbWfZ8ngZr6fjx2Lato0dYw50HgVOxh_QgjQ@mail.gmail.com>
References: <1428468144-13988-1-git-send-email-dgoyal@nvidia.com> <CAAVeFuLB8oiiB-Zu+bBpB_4=pi6c+9aNvVWm6NrKPgiLjPOa+w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAAVeFuLB8oiiB-Zu+bBpB_4=pi6c+9aNvVWm6NrKPgiLjPOa+w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Deepak Goyal <dgoyal-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

>> +
>> +       ucode_image = (u32 *)((u8 *)desc + desc->descriptor_size);
>> +       for (i = 0; i < (desc->app_start_offset + desc->app_size); i += 4)
>> +               nv_wo32(pmu->ucode.obj, i, ucode_image[i/4]);
>> +
>> +       /* map allocated memory into GMMU */
>> +       ret = nvkm_gpuobj_map_vm(nv_gpuobj(pmu->ucode.obj), vm,
>> +                                   NV_MEM_ACCESS_RW, &pmu->ucode.vma);
>> +       if (ret)
>> +               goto map_err;
>> +
>> +       nv_debug(ppmu, "%s function end\n", __func__);
>> +       return ret;
>> +map_err:
>> +       nvkm_gpuobj_destroy(pmu->ucode.obj);
>> +fw_alloc_err:
>> +       nvkm_gpuobj_destroy(ppmuvm->pgd);
>> +pgd_alloc_err:
>> +       nvkm_gpuobj_destroy(ppmuvm->mem);
>
> Use nvkm_gpuobj_ref(NULL, &ptr) to delete GPU objects to follow the
> conventions established by Nouveau.
>
>> +instblk_alloc_err:
>> +       return ret;
>> +}
>
> So in this function you have allocated plenty of nice GPU objects, but
> they are never deleted. Your fini function should call nvkm_gpuobj_ref
> and nvkm_vm_ref in order to remove them properly.
>
> And actually, thanks to Nouveau's object-oriented nature, I don't even
> think you need these error-handling labels at all. If your init
> function fails, the fini function will be called. So all you need to
> do is to have this in your fini function (probably only if !suspend):

Oops, what I said here is simply not true. Resource allocation needs
to be moved to the ctor function for the desired behavior to occur. It
should be done there to begin with anyway.

Deepak, keep in mind that in that case your dtor function can be
called on an incomplete object, so be sure to take that into account.
