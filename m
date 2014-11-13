From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 3/3] gk20a: use NOUVEAU_BO_GART as VRAM domain
Date: Thu, 13 Nov 2014 19:23:06 +0900
Message-ID: <5464868A.6050009@nvidia.com>
References: <1414406099-21129-1-git-send-email-acourbot@nvidia.com>	<1414406099-21129-4-git-send-email-acourbot@nvidia.com> <CAKb7UvhMw9pfDsvoGae2A+n9qJNBV5Vnxm4bn5tbK09GDcP_Dw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKb7UvhMw9pfDsvoGae2A+n9qJNBV5Vnxm4bn5tbK09GDcP_Dw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 10/30/2014 12:29 AM, Ilia Mirkin wrote:
> On Mon, Oct 27, 2014 at 6:34 AM, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>> GK20A does not have dedicated VRAM, therefore allocating in VRAM can be
>> sub-optimal and sometimes even harmful. Set its VRAM domain to
>> NOUVEAU_BO_GART so all objects are allocated in system memory.
>>
>> Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>   src/gallium/drivers/nouveau/nvc0/nvc0_screen.c | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/src/gallium/drivers/nouveau/nvc0/nvc0_screen.c b/src/gallium/drivers/nouveau/nvc0/nvc0_screen.c
>> index ac5823e4a8d5..ad143cd9a140 100644
>> --- a/src/gallium/drivers/nouveau/nvc0/nvc0_screen.c
>> +++ b/src/gallium/drivers/nouveau/nvc0/nvc0_screen.c
>> @@ -620,6 +620,16 @@ nvc0_screen_create(struct nouveau_device *dev)
>>         return NULL;
>>      pscreen = &screen->base.base;
>>
>> +   /* Recognize chipsets with no VRAM */
>> +   switch (dev->chipset) {
>> +   /* GK20A */
>> +   case 0xea:
>> +      screen->base.vram_domain = NOUVEAU_BO_GART;
>
> I think you also want to set vidmem_bindings = 0... although
> potentially after the |= that's done below. Although I guess that
> constbuf + command args buf need to be |='d into the sysmem_bindings
> for this to work out well. That said, we don't really handle explicit
> migration well right now, and those PIPE_BIND_* are *incredibly*
> misleading and don't actually necessarily reflect the current usage.
> [I have some patches to improve the situation, but you don't really
> have to worry about that.]

In the light of that it could be that the vram_domain member I am 
introducing is completely useless - if we set NV_VRAM_DOMAIN to be the 
following:

#define NV_VRAM_DOMAIN(screen) ((screen)->vidmem_bindings == 0 ? 
NOUVEAU_BO_GART : NOUVEAU_BO_VRAM)

then I suspect we can just live without it. I tested quickly and it 
seems to work. Ilia, do you agree? Or could we imagine having GPUs with 
VRAM for which none of the PIPE_BIND_* targets should reside in VRAM?

Also thinking, prior to setting vidmem_bindings to 0, shouldn't we also 
do a "sysmem_bindings |= vidmem_bindings" to make sure all the set 
bindings are tracked somewhere?
