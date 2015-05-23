From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Nouveau] [PATCH v2] nouveau: add coherent BO attribute
Date: Sat, 23 May 2015 15:45:57 +0900
Message-ID: <CAAVeFuJHL664jbsEBUYFp0atnuF3gisbwhJhR-R=cy+iB8gUCg@mail.gmail.com>
References: <1432188508-650-1-git-send-email-acourbot@nvidia.com>
 <CACAvsv5qW74Lp5pYke-4GKi2BYgXot2SM93T_aZX=rztWwGJHA@mail.gmail.com> <555E228B.9090400@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <555E228B.9090400-GANU6spQydw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Cc: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Maarten Lankhorst <maarten-FcfepWsj2zOByvU0x3ry2g@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, May 22, 2015 at 3:23 AM, Martin Peres <martin.peres-GANU6spQydw@public.gmane.org> wrote:
> On 21/05/2015 11:47, Ben Skeggs wrote:
>>
>> On 21 May 2015 at 16:08, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>>>
>>> Add a flag allowing Nouveau to specify that an object should be coherent
>>> at allocation time. This is required for some class of objects like
>>> fences which are randomly-accessed by both the CPU and GPU. This flag
>>> instructs the kernel driver to make sure the object remains coherent
>>> even on architectures for which coherency is not guaranteed by the bus.
>>>
>>> Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> Reviewed-by: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>
>
> Pushed!

Thanks! Should we also bump the ABI version or something?
