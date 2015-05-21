From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] drm/nouveau: add staging module option
Date: Thu, 21 May 2015 14:49:28 +0900
Message-ID: <CAAVeFu+N6VvPHispeXBTGykncfnOQkJ-J1PxxVa42-ahX2YDsA@mail.gmail.com>
References: <1432101379-9515-1-git-send-email-acourbot@nvidia.com>
 <1432101379-9515-2-git-send-email-acourbot@nvidia.com> <CACAvsv4vW4bBddq2s9eWMzbYcG_F5j+KCkZAfivxKW9AWDBXQQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACAvsv4vW4bBddq2s9eWMzbYcG_F5j+KCkZAfivxKW9AWDBXQQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, May 21, 2015 at 1:48 PM, Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 20 May 2015 at 15:56, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>> Add a module option allowing to enable staging/unstable APIs. This will
>> allow us to experiment freely with experimental APIs for a while before
>> setting them in stone.
>>
>> Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>  drm/nouveau/nouveau_drm.c          | 18 ++++++++++++++++++
>>  drm/nouveau/uapi/drm/nouveau_drm.h |  3 +++
>>  2 files changed, 21 insertions(+)
>>
>> diff --git a/drm/nouveau/nouveau_drm.c b/drm/nouveau/nouveau_drm.c
>> index 89049335b738..e4bd6ed51e73 100644
>> --- a/drm/nouveau/nouveau_drm.c
>> +++ b/drm/nouveau/nouveau_drm.c
>> @@ -75,6 +75,10 @@ MODULE_PARM_DESC(runpm, "disable (0), force enable (1), optimus only default (-1
>>  int nouveau_runtime_pm = -1;
>>  module_param_named(runpm, nouveau_runtime_pm, int, 0400);
>>
>> +MODULE_PARM_DESC(staging, "enable staging APIs");
>> +int nouveau_staging = 0;
>> +module_param_named(staging, nouveau_staging, int, 0400);
>> +
>>  static struct drm_driver driver_stub;
>>  static struct drm_driver driver_pci;
>>  static struct drm_driver driver_platform;
>> @@ -895,6 +899,7 @@ nouveau_ioctls[] = {
>>         DRM_IOCTL_DEF_DRV(NOUVEAU_GEM_CPU_PREP, nouveau_gem_ioctl_cpu_prep, DRM_UNLOCKED|DRM_AUTH|DRM_RENDER_ALLOW),
>>         DRM_IOCTL_DEF_DRV(NOUVEAU_GEM_CPU_FINI, nouveau_gem_ioctl_cpu_fini, DRM_UNLOCKED|DRM_AUTH|DRM_RENDER_ALLOW),
>>         DRM_IOCTL_DEF_DRV(NOUVEAU_GEM_INFO, nouveau_gem_ioctl_info, DRM_UNLOCKED|DRM_AUTH|DRM_RENDER_ALLOW),
>> +       /* Staging ioctls */
>>  };
>>
>>  long
>> @@ -1027,6 +1032,7 @@ static void nouveau_display_options(void)
>>         DRM_DEBUG_DRIVER("... runpm        : %d\n", nouveau_runtime_pm);
>>         DRM_DEBUG_DRIVER("... vram_pushbuf : %d\n", nouveau_vram_pushbuf);
>>         DRM_DEBUG_DRIVER("... pstate       : %d\n", nouveau_pstate);
>> +       DRM_DEBUG_DRIVER("... staging      : %d\n", nouveau_staging);
>>  }
>>
>>  static const struct dev_pm_ops nouveau_pm_ops = {
>> @@ -1088,6 +1094,18 @@ err_free:
>>  static int __init
>>  nouveau_drm_init(void)
>>  {
>> +       /* Do not register staging ioctsl if option not specified */
>> +       if (!nouveau_staging) {
>> +               unsigned i;
>> +
>> +               /* This keeps us safe is no staging ioctls are defined */
>> +               i = min(driver_stub.num_ioctls, DRM_NOUVEAU_STAGING_IOCTL);
>> +               while (!nouveau_ioctls[i - 1].func)
>> +                       i--;
>> +
>> +               driver_stub.num_ioctls = i;
>> +       }
> Hey Alex,
>
> I've got no specific objection.  But I'm curious as to why you took
> this approach as opposed to just adding "if (!nouveau_staging) return
> -EINVAL;" directly in the experimental ioctls?

Mainly because we will likely forget to add this check (or to remove
it) in some of the staging ioctls. The current solution doesn't
require us to think about that - and the less things to think about,
the better.

> I think, in line with
> what's been done in other places, having module options per-api is
> perhaps a better choice too.

Do you mean that each experimental ioctl should have its own enable
option? I don't mind going that way if you think it is preferable. And
in that case my comment above is void.

But actually I wonder if having these experimental ioctls enabled as
compile options (either individually or as a whole) would not be
better. Some experimental ioctls may require code in staging (like the
PUSHBUF_2 ioctl that I would like to submit next), and I don't think
it is desirable to force extra code or kernel options (in this case,
CONFIG_STAGING) to Nouveau users who will not make use of them. I
remember that we concluded in favor or module options on IRC, but in
the light of this, wouldn't a config option be a less intrusive
choice?
