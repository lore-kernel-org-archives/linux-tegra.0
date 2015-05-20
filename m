From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] nouveau: add coherent BO attribute
Date: Wed, 20 May 2015 14:11:33 +0900
Message-ID: <CAAVeFuLKeEsf=at_gahCw9qzRWhrxtCVZ==H26y2xUx8-K75eA@mail.gmail.com>
References: <1426228051-20298-1-git-send-email-acourbot@nvidia.com>
 <55033B99.4040300@canonical.com> <550545A4.6060106@nvidia.com>
 <CAAVeFuKoryrWPcDkcFuk+OwJjaUn6C-he+xxphkZ7iMBa=Qdkg@mail.gmail.com>
 <CAAVeFu+kRcWT2zxbduA6MU9v1cTVb8HU3GEDdaviUAkYa6SbSQ@mail.gmail.com> <5555DAF6.4030309@mblankhorst.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5555DAF6.4030309-FcfepWsj2zOByvU0x3ry2g@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maarten Lankhorst <maarten-FcfepWsj2zOByvU0x3ry2g@public.gmane.org>
Cc: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, May 15, 2015 at 8:39 PM, Maarten Lankhorst
<maarten-FcfepWsj2zOByvU0x3ry2g@public.gmane.org> wrote:
> Op 15-05-15 om 09:11 schreef Alexandre Courbot:
>> Re-pinging Marteen on an email address that still exists :P
>>
>> On Wed, Apr 22, 2015 at 6:08 PM, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>> On Sun, Mar 15, 2015 at 5:41 PM, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>>>> On 03/14/2015 04:33 AM, Maarten Lankhorst wrote:
>>>>> Hey,
>>>>>
>>>>> Op 13-03-15 om 07:27 schreef Alexandre Courbot:
>>>>>> Add a flag allowing Nouveau to specify that an object should be coherent
>>>>>> at allocation time. This is required for some class of objects like
>>>>>> fences which are randomly-accessed by both the CPU and GPU. This flag
>>>>>> instructs the kernel driver to make sure the object remains coherent
>>>>>> even on architectures for which coherency is not guaranteed by the bus.
>>>>>>
>>>>>> Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>>> I don't see a problem with this patch, but similar patches to intel to
>>>>> libdrm have been shot down when the changes weren't in an official kernel
>>>>> yet, so I think this should wait until the change is at least in drm-next.
>>>>> ;-)
>>>>
>>>> Sounds good. I will ping you again once the kernel change reaches -next.
>>> Hi Marteen,
>>>
>>> The kernel change required for this patch is now in -next. Do you
>>> think we can merge it now?
> I think it would be ok to merge now.

Great - who could do this? :P
