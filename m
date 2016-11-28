From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V4 2/2] pinctrl: tegra: Add driver to configure voltage
 and power of io pads
Date: Mon, 28 Nov 2016 14:52:07 +0530
Message-ID: <583BF73F.7010407@nvidia.com>
References: <1479976734-30498-1-git-send-email-ldewangan@nvidia.com> <1479976734-30498-3-git-send-email-ldewangan@nvidia.com> <20161125095744.GB11512@ulmo.ba.sec> <583828D5.5060507@nvidia.com> <da7b815c-149c-6baf-6691-a038d3fe54bf@nvidia.com> <583879A8.7020401@nvidia.com> <4d255a3e-0816-498c-a280-6d29ca880e13@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4d255a3e-0816-498c-a280-6d29ca880e13-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org, yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On Monday 28 November 2016 02:56 PM, Jon Hunter wrote:
> On 25/11/16 17:49, Laxman Dewangan wrote:
>>
>> In the above dpaux driver,  you used the pinctrl framework and its core
>> functionality for the device tree interfacing and client interfacing.
>>
>> The same thing I am saying here, we should not avoid the pinctrl
>> framework. The client driver will use the pinctrl framework for the IO
>> pad configurations, not direct PMC APIs.
> Exactly, so why are you saying that by moving the code into the PMC
> driver this will "need lots of DT processing for getting information
> from DT"? By moving the code, we are not suggesting we don't use the
> pinctrl framework, we are just suggesting we move the code. That's all.
>
>
OK, got it. My understanding  from suggestion was that to implement 
everything without using the pinctrl framework.

I dont see much issue to just move this to  drivers/soc/tegra folder
I hope rest of stuff will be same, registering it as subdev of the pmc 
and this io pad driver will be the platform driver.
