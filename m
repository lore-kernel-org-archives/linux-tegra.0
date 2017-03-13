From: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>
Subject: Re: [PATCH 0/3] Tegra Host1x dma_fence/sync_file support
Date: Mon, 13 Mar 2017 10:55:01 +0200
Message-ID: <fcca70a0-8bfe-d1b6-329f-ded53fd98a72@kapsi.fi>
References: <20170309175718.14843-1-mperttunen@nvidia.com>
 <CAKMK7uH=_9wXDS+yN4e60878j7kDSo+isrePOeDBP5HnHu-tjw@mail.gmail.com>
 <cf797fd2-f4f2-f7e5-bb48-6486d7930e11@kapsi.fi>
 <20170310124334.6v4tmmn5vxqvhs2w@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170310124334.6v4tmmn5vxqvhs2w-dv86pmgwkMBes7Z6vYuT8azUEOm+Xw19@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Cc: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org



On 10.03.2017 14:43, Daniel Vetter wrote:
> On Thu, Mar 09, 2017 at 09:09:52PM +0200, Mikko Perttunen wrote:
>> On 03/09/2017 08:58 PM, Daniel Vetter wrote:
>>> On Thu, Mar 9, 2017 at 6:57 PM, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>>>> Hi everyone,
>>>>
>>>> this series adds support for using sync fences as prefences and
>>>> postfences for host1x job submissions. The patches are available
>>>> as a git repository at
>>>>
>>>>   https://github.com/cyndis/linux/tree/host1x-fence-1
>>>>
>>>> and testing code is available at
>>>>
>>>>   https://github.com/cyndis/host1x_test
>>>>
>>>> though you may want to edit the main function to disable the
>>>> timeout tests for now as they cause a deadlock (not caused
>>>> by this series; fix upcoming).
>>>>
>>>> Verified on a Jetson TX1; should go on top of the earlier
>>>> VIC series.
>>>>
>>>> Some additional points:
>>>> * I noticed that the waitchk_mask field in the submit UAPI is completely
>>>>   useless, and has never had any effect in the upstream kernel.
>>>>   It has also not existed in the downstream kernel for many years.
>>>>   We could replace it with the flags field if that is deemed
>>>>   acceptable, though of course it is possible there exists some
>>>>   application that fills it with some non-zero value.
>>>
>>> If open source userspace (nouveau_dri.so) never used it, then you can
>>> freely change it. Backwards compat guarantee in drm is only for open
>>> source userspace (and by implication ofc anything that uses the ioctl
>>> the same way). See:
>>>
>>> https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#open-source-userspace-requirements
>>
>> nouveau doesn't have any host1x related code - so no, there is no
>> pre-existing open-source userspace that uses this :)
>>
>>>
>>> On that topic, do we have the nouveau patches to enable the
>>> egl_android extension for this already published?
>>
>> I assume you are referring to EGL_ANDROID_native_fence_sync; I don't know
>> what nouveau's status is regarding that. With this series, the host1x driver
>> does not yet allow other drivers access to the raw syncpoint values behind
>> host1x fences but that can be fixed pretty easily if/when nouveau wants to
>> support native syncpoint waits on Tegra.
>> Host1x jobs do use native waits already with this series, though.
>
> Well you're adding new uapi to the tegra drm driver, and
> EGL_ANDROID_native_fence_sync for nouveau seems like the real use-case for
> this. Which means we need that, before we can merge these patches.
>
> At least I assume that this was done for the nv blob tegra gl driver? Of
> course if there's some other reasonable use-case, we can use that as open
> source demonstration thing too.
> -Daniel
>

The downstream driver doesn't actually support this UAPI; the work was 
done against the testcases linked to above. My goal was to have 
userspace clients use fence fds instead of raw syncpoints, which would 
be cleaner and less error-prone; and allow future extensibility. I 
suppose this might not be enough of a use-case though.

Now, quickly grepping through mesa and the nouveau kernel driver, it 
looks like there is currently no implementation of 
EGL_ANDROID_native_fence_sync, and no support for SYNC_FILE in nouveau. 
Regrettably, I currently don't have the time to learn these codebases 
and implement these features, so we might have to drop at least patches 
2 and 3 and revisit them later.

Thanks,
Mikko.
