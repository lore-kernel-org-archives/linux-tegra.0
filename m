From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 6/6] ARM: tegra_defconfig: Enable options useful for
 Nexus 7 and Acer A500
Date: Wed, 8 Apr 2020 17:40:01 +0300
Message-ID: <7a12e4bf-43bc-0788-d20c-6681af705137@gmail.com>
References: <20200406194110.21283-1-digetx@gmail.com>
 <20200406194110.21283-7-digetx@gmail.com> <20200407100829.GB1720957@ulmo>
 <70ad6fd6-9603-a114-2d0f-608110b68c0b@gmail.com>
 <CAMdYzYr76GUEEXgKippfCJDTU1L+A0UXTyO_B14vkOxVp_pijw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMdYzYr76GUEEXgKippfCJDTU1L+A0UXTyO_B14vkOxVp_pijw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Geis <pgwipeout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>, David Heidelberg <david-W22tF5X+A20@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?Q?Pedro_=c3=82ngelo?= <pangelo-yxaQD43p5Qo@public.gmane.org>, Matt Merhar <mattmerhar-g/b1ySJe57IN+BqQ9rBEUg@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

08.04.2020 03:37, Peter Geis пишет:
...
>> For example, the T30 Broadcom WiFi doesn't work using stock
>> linux-firmware, it's on my to-do list to try to figure out why.
> 
> I've encountered the same issue on the Ouya, only the original
> firmware that came with it will work with the chip. (AW-NH660)
> I wonder if it's an azurewave quirk.
> 
> I've also noticed the Ouya specific configuration txt file seems a lot
> more involved than the standard brcm configs.

The T20 boards also use Azurewave module and it works fine with the
stock linux-firmware, although that is BCM4329.

It could be that the configuration format differs for the stock
firmware, but we don't really know yet.
