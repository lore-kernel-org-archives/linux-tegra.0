From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: [PATCH 1/2] nvc0: add GK20A 3D class
Date: Tue, 27 May 2014 11:48:34 -0400
Message-ID: <CAKb7Uvj=MSm0Sc+acwOUc9MfGz=GZ0+KfpXtXpzEOMCdK9OjZQ@mail.gmail.com>
References: <1401166783-24086-1-git-send-email-acourbot@nvidia.com>
	<1401166783-24086-2-git-send-email-acourbot@nvidia.com>
	<CAKb7Uvjvo=9u-mSH01AHidOBS_6cE88kpy+H=QoJQprtLekvKg@mail.gmail.com>
	<53843236.4030508@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53843236.4030508-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, May 27, 2014 at 2:35 AM, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> On 05/27/2014 02:29 PM, Ilia Mirkin wrote:
>>
>> On Tue, May 27, 2014 at 12:59 AM, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> wrote:
>>>
>>> GK20A is mostly compatible with GK104, but features a new 3D
>>> class. Add it to the relevant header and use it when GK20A is
>>> detected.
>>>
>>> Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>> ---
>>>   src/gallium/drivers/nouveau/nv_object.xml.h    | 1 +
>>>   src/gallium/drivers/nouveau/nvc0/nvc0_screen.c | 9 ++++++++-
>>>   2 files changed, 9 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/src/gallium/drivers/nouveau/nv_object.xml.h
>>> b/src/gallium/drivers/nouveau/nv_object.xml.h
>>> index 4c93e6564838..0a0e187dc028 100644
>>> --- a/src/gallium/drivers/nouveau/nv_object.xml.h
>>> +++ b/src/gallium/drivers/nouveau/nv_object.xml.h
>>> @@ -190,6 +190,7 @@ WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
>>> SOFTWARE.
>>>   #define NVC8_3D_CLASS
>>> 0x00009297
>>>   #define NVE4_3D_CLASS
>>> 0x0000a097
>>>   #define NVF0_3D_CLASS
>>> 0x0000a197
>>> +#define NVEA_3D_CLASS
>>> 0x0000a297
>>>   #define GM107_3D_CLASS
>>> 0x0000b097
>>>   #define NV50_2D_CLASS
>>> 0x0000502d
>>>   #define NVC0_2D_CLASS
>>> 0x0000902d
>>> diff --git a/src/gallium/drivers/nouveau/nvc0/nvc0_screen.c
>>> b/src/gallium/drivers/nouveau/nvc0/nvc0_screen.c
>>> index cccfe2bba23d..95e5ef81cd79 100644
>>> --- a/src/gallium/drivers/nouveau/nvc0/nvc0_screen.c
>>> +++ b/src/gallium/drivers/nouveau/nvc0/nvc0_screen.c
>>> @@ -702,7 +702,14 @@ nvc0_screen_create(struct nouveau_device *dev)
>>>         obj_class = NVF0_3D_CLASS;
>>>         break;
>>>      case 0xe0:
>>> -      obj_class = NVE4_3D_CLASS;
>>> +      switch (dev->chipset) {
>>> +      case 0xea:
>>> +         obj_class = NVEA_3D_CLASS;
>>
>>
>> Again, would be nice to be consistent with the way you set the ISA...
>> perhaps change this to a >= as well? But I guess the two could be
>> disconnected. Up to you, just thought I'd bring it up.
>
>
> Right below we have the following being done:
>
>      switch (dev->chipset) {
>       case 0xc8:
>          obj_class = NVC8_3D_CLASS;
>          break;
>       case 0xc1:
>          obj_class = NVC1_3D_CLASS;
>          break;
>       default:
>          obj_class = NVC0_3D_CLASS;
>          break;
>       }
>
> Shouldn't we try to be consistent with this more local example instead?

Which is why I didn't insist. The situation with nvcx is a little
different -- nvc8 (GF110) and nvc1 (GF108) are special, but e.g. nvce
(GF114) and nvcf (GF116) want the nvc0 class. OTOH you're using >=
0xea as the metric for selecting SM35, so I was just pointing out the
inconsistency. Of course there needn't be a 1:1 mapping between these
things, and the likelihood of another 0xex chipset being released is
fairly low. So:

Reviewed-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
