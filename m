From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 09/10] drm/nouveau: support GK20A in
	nouveau_accel_init()
Date: Tue, 22 Apr 2014 11:31:33 +0900
Message-ID: <5355D485.6030301@nvidia.com>
References: <1398060142-7937-1-git-send-email-acourbot@nvidia.com>	<1398060142-7937-10-git-send-email-acourbot@nvidia.com>
 <CAKb7Uvg4kOfsE0gd4zLcwjShc4eVgVKA7zQM2r1aeatOybm8NQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7Uvg4kOfsE0gd4zLcwjShc4eVgVKA7zQM2r1aeatOybm8NQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 04/22/2014 03:07 AM, Ilia Mirkin wrote:
> On Mon, Apr 21, 2014 at 2:02 AM, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>> Skip the creation of a software channel for GK20A as software methods
>> are not yet supported.
>
> How is GK20A different from a nvc0+ card that lacks PDISPLAY (like all
> the 3D Controller ones, and I guess even some that come up as VGA
> controller in PCI but don't have any outputs in their VBIOS)? i.e.
> what's wrong with just doing the same thing that GK1xx does? Note that
> there are sw methods that don't deal with display as well.

Well, as it turns out... I have tried reverting this patch and enabling 
nvc0_software_oclass for GK20A and things worked like a charm. 0_o

This is definitely different from when I first drafted this patch 
series, where a software class could not be used on GK20A due to hard 
dependencies on display. But it seems like today's code can accommodate 
much better with that situation.

That's great - this will allow us to get rid of this ungraceful patch. 
Thanks for making me check it again.

Probably a v3 will be necessary to enable the software class in patch 10 
(and fix the byte/word typo in patch 7). I will just wait a bit to see 
if this v2 gets more comments before sending it.

>
>    -ilia
>
>>
>> Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>   drivers/gpu/drm/nouveau/nouveau_drm.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
>> index ddd83756b9a2..5b46148ffd32 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
>> @@ -208,6 +208,10 @@ nouveau_accel_init(struct nouveau_drm *drm)
>>                  return;
>>          }
>>
>> +       /* Need to figure out how to handle sw for gk20a */
>> +       if (device->chipset == 0xea)
>> +               goto skip_sw_init;
>> +
>>          ret = nouveau_object_new(nv_object(drm), NVDRM_CHAN, NVDRM_NVSW,
>>                                   nouveau_abi16_swclass(drm), NULL, 0, &object);
>>          if (ret == 0) {
>> @@ -234,6 +238,7 @@ nouveau_accel_init(struct nouveau_drm *drm)
>>                  return;
>>          }
>>
>> +skip_sw_init:
>>          if (device->card_type < NV_C0) {
>>                  ret = nouveau_gpuobj_new(drm->device, NULL, 32, 0, 0,
>>                                          &drm->notify);
>> --
>> 1.9.2
>>
>> _______________________________________________
>> Nouveau mailing list
>> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>> http://lists.freedesktop.org/mailman/listinfo/nouveau
