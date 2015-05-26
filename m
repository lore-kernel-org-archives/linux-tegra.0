From: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Subject: Re: [Nouveau] [PATCH v2] nouveau: add coherent BO attribute
Date: Tue, 26 May 2015 22:06:24 +0300
Message-ID: <5564C430.7000900@free.fr>
References: <1432188508-650-1-git-send-email-acourbot@nvidia.com> <CACAvsv5qW74Lp5pYke-4GKi2BYgXot2SM93T_aZX=rztWwGJHA@mail.gmail.com> <555E228B.9090400@free.fr> <CAAVeFuJHL664jbsEBUYFp0atnuF3gisbwhJhR-R=cy+iB8gUCg@mail.gmail.com> <55616F1E.7020602@mblankhorst.nl> <CAAVeFuJ4oNi-_ALd3NRNeje7wNntcJ5QME2TWHKTBVWzE0yG1w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAAVeFuJ4oNi-_ALd3NRNeje7wNntcJ5QME2TWHKTBVWzE0yG1w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maarten Lankhorst <maarten-FcfepWsj2zOByvU0x3ry2g@public.gmane.org>
Cc: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 26/05/2015 16:23, Alexandre Courbot wrote:
> On Sun, May 24, 2015 at 3:26 PM, Maarten Lankhorst
> <maarten-FcfepWsj2zOByvU0x3ry2g@public.gmane.org> wrote:
>> Op 23-05-15 om 08:45 schreef Alexandre Courbot:
>>> On Fri, May 22, 2015 at 3:23 AM, Martin Peres <martin.peres-GANU6spQydw@public.gmane.org> wrote:
>>>> On 21/05/2015 11:47, Ben Skeggs wrote:
>>>>> On 21 May 2015 at 16:08, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>>>>>> Add a flag allowing Nouveau to specify that an object should be coherent
>>>>>> at allocation time. This is required for some class of objects like
>>>>>> fences which are randomly-accessed by both the CPU and GPU. This flag
>>>>>> instructs the kernel driver to make sure the object remains coherent
>>>>>> even on architectures for which coherency is not guaranteed by the bus.
>>>>>>
>>>>>> Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>>> Reviewed-by: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>>>> Pushed!
>>> Thanks! Should we also bump the ABI version or something?
>> If you mean changing libdrm_nouveau.so.2 to .so.3 no! If you mean having something that pkg-config can pick up that's done automatically on every drm release.
> Sorry for not having been clear. I was talking about checking against
> the driver version to ensure it supports all the features that libdrm
> can throw at it. We increased the modules's version to 1.2.2 when
> adding the coherent flag:
>
> drm/nouveau/nouveau_drm.h:
>   * 1.2.2:
>   *      - add NOUVEAU_GEM_DOMAIN_COHERENT flag

That will be the job of mesa to check the DRM version, I would guess.
