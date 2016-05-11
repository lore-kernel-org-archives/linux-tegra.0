From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 6/6] pinctrl: tegra: Add driver to configure voltage and
 power state of io pads
Date: Wed, 11 May 2016 10:07:04 -0600
Message-ID: <573358A8.2060509@wwwdotorg.org>
References: <1462191434-28933-1-git-send-email-ldewangan@nvidia.com>
 <1462191434-28933-7-git-send-email-ldewangan@nvidia.com>
 <CACRpkdbvCQr11hjCBoeOO+8-MLUbwXAjv9xW=jKR=Y9hZO5sjA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdbvCQr11hjCBoeOO+8-MLUbwXAjv9xW=jKR=Y9hZO5sjA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 05/11/2016 03:19 AM, Linus Walleij wrote:
> On Mon, May 2, 2016 at 2:17 PM, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>
>> NVIDIA Tegra210 supports the IO pads which can operate at 1.8V
>> or 3.3V I/O voltage levels. Also the IO pads can be configured
>> for power down state if it is not used. SW needs to configure the
>> voltage level of IO pads based on IO rail voltage and its power
>> state based on platform usage.
>>
>> The voltage and power state configurations of pads are provided
>> through pin control frameworks. Add pin control driver for Tegra's
>> IO pads' voltage and power state configurations.
>>
>> Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> ---
>> Changes from V1:
>> - Use the generic pincontrol property for low power enable/disable.
>> - sync with latest and remove all MODULE* macros
>> - Use renamed APIs form PMC
>
> Looks OK to me, need Stephen's ACK though!

This driver is for HW that's separate from the main Tegra pinmux module. 
Thierry Reding and Jon Hunter are more appropriate reviewers for this one.
