From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Nouveau] [PATCH v3 1/6] make RAM device optional
Date: Wed, 18 Feb 2015 16:08:10 +0900
Message-ID: <CAAVeFuKxzz7cMeaC7wKno17aErLSbqBYGtQLN=pH1qsK5DgFkQ@mail.gmail.com>
References: <1424159284-19920-1-git-send-email-acourbot@nvidia.com>
 <1424159284-19920-2-git-send-email-acourbot@nvidia.com> <CACAvsv5mNb3bPzbkVoSCvXKtX195w3c8OX=543V5JHnM=hsN+w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACAvsv5mNb3bPzbkVoSCvXKtX195w3c8OX=543V5JHnM=hsN+w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Feb 18, 2015 at 8:01 AM, Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Tue, Feb 17, 2015 at 5:47 PM, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>> Having a RAM device does not make sense for chips like GK20A which have
>> no dedicated video memory. The dummy RAM device that we used so far
>> works as a temporary band-aid, but in the long-term it is desirable for
>> the driver to be able to work without any kind of VRAM.
>>
>> This patch adds a few conditionals in places where a RAM device was
>> assumed to be present and allows some more objects to be allocated from
>> the TT domain, allowing Nouveau to handle GPUs for which
>> pfb->ram == NULL.
>>
>> Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>  drm/nouveau/nouveau_display.c         |  8 +++++++-
>>  drm/nouveau/nouveau_ttm.c             |  3 +++
>>  drm/nouveau/nv84_fence.c              | 14 +++++++++++---
>>  drm/nouveau/nvkm/engine/device/base.c |  9 ++++++---
>>  drm/nouveau/nvkm/subdev/clk/base.c    |  2 +-
>>  drm/nouveau/nvkm/subdev/fb/base.c     | 26 ++++++++++++++++++--------
>>  drm/nouveau/nvkm/subdev/ltc/gf100.c   | 10 +++++++++-
>>  7 files changed, 55 insertions(+), 17 deletions(-)
>>
>> diff --git a/drm/nouveau/nouveau_display.c b/drm/nouveau/nouveau_display.c
>> index 860b0e2d4181..68ee0af22eea 100644
>> --- a/drm/nouveau/nouveau_display.c
>> +++ b/drm/nouveau/nouveau_display.c
>> @@ -869,13 +869,19 @@ nouveau_display_dumb_create(struct drm_file *file_priv, struct drm_device *dev,
>>                             struct drm_mode_create_dumb *args)
>>  {
>>         struct nouveau_bo *bo;
>> +       uint32_t domain;
>>         int ret;
>>
>>         args->pitch = roundup(args->width * (args->bpp / 8), 256);
>>         args->size = args->pitch * args->height;
>>         args->size = roundup(args->size, PAGE_SIZE);
>>
>> -       ret = nouveau_gem_new(dev, args->size, 0, NOUVEAU_GEM_DOMAIN_VRAM, 0, 0, &bo);
>> +       if (nvxx_fb(&nouveau_drm(dev)->device)->ram)
> For these checks in the drm, it's probably better to use
> nouveau_drm(dev)->device.info.ram_size.

I wonder - in other places (e.g. clock, ltc) we don't have access to
nouveau_drm, so IIUC we need to rely on pfb->ram there. Wouldn't it be
more confusing to use two different ways to check the presence of VRAM
when we could stick to a single one?
