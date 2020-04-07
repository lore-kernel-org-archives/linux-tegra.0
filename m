From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 6/6] ARM: tegra_defconfig: Enable options useful for
 Nexus 7 and Acer A500
Date: Tue, 7 Apr 2020 19:38:00 +0300
Message-ID: <70ad6fd6-9603-a114-2d0f-608110b68c0b@gmail.com>
References: <20200406194110.21283-1-digetx@gmail.com>
 <20200406194110.21283-7-digetx@gmail.com> <20200407100829.GB1720957@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200407100829.GB1720957@ulmo>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>, David Heidelberg <david-W22tF5X+A20@public.gmane.org>, Peter Geis <pgwipeout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?Q?Pedro_=c3=82ngelo?= <pangelo-yxaQD43p5Qo@public.gmane.org>, Matt Merhar <mattmerhar-g/b1ySJe57IN+BqQ9rBEUg@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

07.04.2020 13:08, Thierry Reding пишет:
> On Mon, Apr 06, 2020 at 10:41:10PM +0300, Dmitry Osipenko wrote:
>> Enable several drivers for hardware that is found on Nexus 7 and Acer A500
>> tablet devices. Please note that some drivers may require firmware files
>> extracted from original Android image.
>>
>> Link: https://github.com/digetx/linux-firmware
> 
> What's the license for these files?

It's either GPL (like touchscreen config) or something else
redistributeable.

> Can they be made available through the official linux-firmware repository?

Yes, but I don't know yet for sure whether it's really needed for all
firmware files.

For example, the T30 Broadcom WiFi doesn't work using stock
linux-firmware, it's on my to-do list to try to figure out why.

While Bluetooth FW seems to be reusable be many different devices,
although (AFAIK) nobody cared to upstream it to the linux-firmware.
