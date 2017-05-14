From: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>
Subject: Re: [PATCH v2] drm/tegra: Check size of a submitted command buffer
Date: Sun, 14 May 2017 15:56:41 +0300
Message-ID: <3eca952f-7c39-d701-15c1-1e243ba864b4@kapsi.fi>
References: <20170512192903.25491-1-digetx@gmail.com>
 <5874d720-c911-b2bc-dc69-be2155505280@kapsi.fi>
 <2eca9200-727a-5e6f-efa8-da0a7706c7a8@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2eca9200-727a-5e6f-efa8-da0a7706c7a8-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org



On 05/14/2017 03:45 PM, Dmitry Osipenko wrote:
> On 14.05.2017 15:27, Mikko Perttunen wrote:
>> On 05/12/2017 10:29 PM, Dmitry Osipenko wrote:
>>> If command buffer claims a number of words that is higher than its BO can
>>> fit and a relocation lays past the BO, a kernel OOPS will be fired on that
>>> relocation address patching. This was triggered by an opentegra Xorg driver
>>> that erroneously pushed too many commands to the pushbuf.
>>>
>>> [   46.829393] Unable to handle kernel paging request at virtual address f09b2000
>>> ...
>>> [<c04a3ba4>] (host1x_job_pin) from [<c04dfcd0>] (tegra_drm_submit+0x474/0x510)
>>> [<c04dfcd0>] (tegra_drm_submit) from [<c04deea0>] (tegra_submit+0x50/0x6c)
>>> [<c04deea0>] (tegra_submit) from [<c04c07c0>] (drm_ioctl+0x1e4/0x3ec)
>>> [<c04c07c0>] (drm_ioctl) from [<c02541a0>] (do_vfs_ioctl+0x9c/0x8e4)
>>> [<c02541a0>] (do_vfs_ioctl) from [<c0254a1c>] (SyS_ioctl+0x34/0x5c)
>>> [<c0254a1c>] (SyS_ioctl) from [<c0107640>] (ret_fast_syscall+0x0/0x3c)
>>>
>>> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>> ---
>>>
>>> v2: Take into account the cmdbuf.offset
>>>
>>>  drivers/gpu/drm/tegra/drm.c | 18 ++++++++++++++----
>>>  1 file changed, 14 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
>>> index 732c8d98044f..9ad4ac7c08d1 100644
>>> --- a/drivers/gpu/drm/tegra/drm.c
>>> +++ b/drivers/gpu/drm/tegra/drm.c
>>> @@ -361,20 +361,30 @@ int tegra_drm_submit(struct tegra_drm_context *context,
>>>
>>>      while (num_cmdbufs) {
>>>          struct drm_tegra_cmdbuf cmdbuf;
>>> -        struct host1x_bo *bo;
>>> +        struct drm_gem_object *gem;
>>> +        struct tegra_bo *bo;
>>>
>>>          if (copy_from_user(&cmdbuf, cmdbufs, sizeof(cmdbuf))) {
>>>              err = -EFAULT;
>>>              goto fail;
>>>          }
>>>
>>> -        bo = host1x_bo_lookup(file, cmdbuf.handle);
>>> -        if (!bo) {
>>> +        gem = drm_gem_object_lookup(file, cmdbuf.handle);
>>> +        if (!gem) {
>>>              err = -ENOENT;
>>>              goto fail;
>>>          }
>>>
>>> -        host1x_job_add_gather(job, bo, cmdbuf.words, cmdbuf.offset);
>>> +        drm_gem_object_unreference_unlocked(gem);
>>> +
>>> +        if (cmdbuf.offset + cmdbuf.words * 4 > gem->size) {
>>> +            err = -EINVAL;
>>> +            goto fail;
>>> +        }
>>
>> Nasty bug! Well found. Two points: the arithmetic here could overflow, so
>> userspace could supply some large values for offset/words and this check would
>> not catch it. A fix would be to do the arithmetic in 64-bit. Also, looking at
>> the code closer, I can't see any bounds checking for relocs either.. That code
>> (host1x_reloc_copy_from_user) is the other place using host1x_bo_lookup, so we
>> could e.g. change host1x_bo_lookup to take offset and words parameters and
>> verify those at the same time.
>>
> Good point, unfortunately there are a lot of ways to abuse the staging API on
> the IOMMU-less Tegra20 right now.
>

Indeed, though I think the relocation issue would be a problem on 
IOMMU-enabled systems as well. The Tegra20 and firewall have always been 
in a bit a bad position, as I'm not sure if the firewall was ever used 
in production during Tegra20's prime time, and of course it was quickly 
abandoned in downstream when we got IOMMUs on later chips.

Thanks for contributing :)

Mikko
