From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Nouveau] [PATCH] drm: merge nouveau_platform.ko into nouveau.ko
Date: Thu, 15 Jan 2015 15:43:08 +0900
Message-ID: <CAAVeFu+=-FQSGiL0Wqt2of1nYHd8qnXBw2jFUB6Z8+_p3kOr4w@mail.gmail.com>
References: <1421303396-11867-1-git-send-email-acourbot@nvidia.com> <CACAvsv6zHMizeA-r2qnngUaMXnorNfOXg6+998UWA4GzfFBOSA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACAvsv6zHMizeA-r2qnngUaMXnorNfOXg6+998UWA4GzfFBOSA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Jan 15, 2015 at 3:39 PM, Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Thu, Jan 15, 2015 at 4:29 PM, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>> Having the two modules separated causes various unneeded complications,
>> including having to export symbols accessed between the modules. Make
>> things simpler by compiling platform device support into nouveau.ko.
>> Platform device support remains optional and is only compiled on Tegra.
>>
>> Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>> Vince, with this you won't have to export new functions for PM. I ended
>> up writing it myself because I hit the same issue (nv_device() would now
>> need to be exported on Ben's master branch).
>>
>> Be careful that when compiling against a kernel, CONFIG_NOUVEAU_PLATFORM_DRIVER
>> now *must* be equal to 'y'. It is 'm' currently, so you will need to change it
>> from tristate to bool in the kernel's Kconfig. For this reason it might be good
>> to get this patch into -next quickly.
> I've got a huge chunk of churn (finally finished the "rename to nvidia
> names for stuff" thing) pending too which I want to get to Dave (ASAP,
> separately from my other pending work) to avoid having to keep fixing
> conflicts in the meantime :)
>
> So, if you guys both agree on the patch, I'll send it along early with those.

That would be just perfect.

Vince, do you have anything against this patch?
