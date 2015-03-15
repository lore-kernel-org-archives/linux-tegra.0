From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] nouveau: add coherent BO attribute
Date: Sun, 15 Mar 2015 17:41:08 +0900
Message-ID: <550545A4.6060106@nvidia.com>
References: <1426228051-20298-1-git-send-email-acourbot@nvidia.com> <55033B99.4040300@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55033B99.4040300-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/14/2015 04:33 AM, Maarten Lankhorst wrote:
> Hey,
>
> Op 13-03-15 om 07:27 schreef Alexandre Courbot:
>> Add a flag allowing Nouveau to specify that an object should be coherent
>> at allocation time. This is required for some class of objects like
>> fences which are randomly-accessed by both the CPU and GPU. This flag
>> instructs the kernel driver to make sure the object remains coherent
>> even on architectures for which coherency is not guaranteed by the bus.
>>
>> Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> I don't see a problem with this patch, but similar patches to intel to libdrm have been shot down when the changes weren't in an official kernel yet, so I think this should wait until the change is at least in drm-next. ;-)

Sounds good. I will ping you again once the kernel change reaches -next.
