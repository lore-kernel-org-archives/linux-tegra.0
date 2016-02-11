From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V3] ARM64: tegra: Add support for Google Pixel C
Date: Thu, 11 Feb 2016 20:35:44 +0900
Message-ID: <CAAVeFuKKGW9-0bO6wkCL=i7P0XJ4Mx44BD3A5EvN8G4sS1NyXA@mail.gmail.com>
References: <1454949199-27050-1-git-send-email-jonathanh@nvidia.com>
 <1455020809-17531-1-git-send-email-jonathanh@nvidia.com> <CAAVeFuJt+VdJb4S3PC-RXVFYhLnq7yF+dV_w5or=0ebG+LnnGw@mail.gmail.com>
 <56BC4C91.6070409@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56BC4C91.6070409-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Olof Johansson <olofj-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Feb 11, 2016 at 5:55 PM, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>
> On 11/02/16 08:32, Alexandre Courbot wrote:
>> On Tue, Feb 9, 2016 at 9:26 PM, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>>> Add initial device-tree support for Google Pixel C (a.k.a. Smaug) based
>>> upon Tegra210 SoC with 3 GiB of LPDDR4 RAM.
>>>
>>> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> I need to add "clk_ignore_unused=1" to the bootargs in order to avoid
>> a hang during boot, but otherwise can reach a serial console.
>
> Were you testing on -next? If so, you should not need that. Otherwise,
> please make sure you have this patch [0]. Thierry has included this in a
> clock fixes series that should turn up in main soon.

In one of my moments of stupidity, I was on 4.5-rc3. Adding the patch
you mention makes boot complete without issues.

Thanks,
Alex.
