From: Anthony Eden <aeden-EfZU8u+QLuPpgkiH4x7ZXw@public.gmane.org>
Subject: Re: Tegra DRM driver is not probing with 4.12 on tegra124
Date: Thu, 6 Jul 2017 12:58:49 -0400
Message-ID: <CAHMsQjULfQw2umuMZOAO4=9Aihb_kTUz5E3EY5eBBMJ4+u0H8Q@mail.gmail.com>
References: <1499357745.1309.0.camel@paulk.fr> <70a14883-ce5e-a1bc-dbd7-8742634b5970@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <70a14883-ce5e-a1bc-dbd7-8742634b5970-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

I'm seeing the same on nyan-big and jetson-tk1 with ArchlinuxARM
(linux-armv7 4.12 kernel). I sent an email to linux-tegra yesterday
about it.

Thank's for investigating and let me know if there's anything I can do to aid.

My nyan-big chromebook otherwise works very well with the ArchlinuxARM
4.11 kernel. Maybe I'll try to get the u-boot reading the eMMC so I
don't have to boot the kernel off of a USB drive...

-Anthony

On Thu, Jul 6, 2017 at 12:21 PM, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> Hi Paul
>
> On 06/07/17 17:15, Paul Kocialkowski wrote:
>> * PGP Signed by an unknown key
>>
>> As I was investigating why my nyan_big's screen was staying dark when testing
>> 4.12, it appeared that the tegra drm driver does not get probed at all on my
>> setup (read: host1x_drm_probe never gets called). I have also tested on jetson-
>> tk1, with the same result.
>>
>> I am using a finely-tuned out-of-tree config[0], but it appears (from looking at
>> the lack of drm line in the logs) that the same is happening with the tegra and
>> multi_v7 defconfigs hooked to kernelci.
>>
>> First, I am wondering whether the tegra drm driver is probing for anyone
>> following this list on any tegra124 device with 4.12. If so, feel free to raise
>> your voice so we can find out what is wrong with my setup.
>>
>> I initially thought that it was caused by missing firmwares (that are now needed
>> for falcon/vic support), but disabling that (by removing the &tegra_vic_driver
>> entry and associated compatible string in drm.c) does not help.
>>
>> Hopefully, I will have time to run a bisect this week-end and identify the
>> commit that introduced the regression. It would be quite important to get this
>> fixed for the 4.13 release.
>
> I have bisected this to ...
>
> commit 700ea5e0e0dd70420a04e703ff264cc133834cba
> Merge: 3dc2046ca78b c1ae3cfa0e89
> Author: Mauro Carvalho Chehab <mchehab-JsYNTwtnfakRB7SZvlqPiA@public.gmane.org>
> Date:   Mon Mar 6 06:49:34 2017 -0300
>
>     Merge tag 'v4.11-rc1' into patchwork
>
> I am not sure if something went wrong with the above merge, but it
> definitely seems to be coming from the media tree [0].
>
> Cheers
> Jon
>
> [0] https://git.linuxtv.org/media_tree.git/
>
> --
> nvpublic
> --
> To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
