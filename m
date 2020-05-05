From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v7 0/6] Support NVIDIA Tegra-based Acer A500 and Nexus 7
 devices
Date: Tue, 5 May 2020 18:33:03 +0300
Message-ID: <c34c3bc7-73f7-730c-1581-2e12f3e1d913@gmail.com>
References: <20200505022517.30523-1-digetx@gmail.com>
 <20200505151136.GA26776@qmqm.qmqm.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200505151136.GA26776-cHozx32mtrEEUmgCuDUIdw@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, David Heidelberg <david-W22tF5X+A20@public.gmane.org>, Peter Geis <pgwipeout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?Q?Pedro_=c3=82ngelo?= <pangelo-yxaQD43p5Qo@public.gmane.org>, Matt Merhar <mattmerhar-g/b1ySJe57IN+BqQ9rBEUg@public.gmane.org>, Zack Pearsall <zpearsall-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

05.05.2020 18:11, Michał Mirosław пишет:
> On Tue, May 05, 2020 at 05:25:11AM +0300, Dmitry Osipenko wrote:
>> Hello,
>>
>> This series introduces upstream kernel support for Acer Iconia Tab A500
>> and ASUS Google Nexus 7 tablet devices. Please review and apply, thanks
>> in advance.
>>
>> Changelog:
>>
>> v7: - This version brings support for a Nexus 7 variant that uses Ti PMIC
>>       instead of the Maxim PMIC. Previously we assumed that variant with
>>       the Ti PMIC doesn't exist in a wild, but turned out that it was a
>>       wrong assumption. In a result the device-trees are separated into
>>       more DTSI pieces, which combined together form the final device-tree.
>>       Thanks to Zack Pearsall for testing the Ti version!
> [...]
> 
> Hi Dmitry!
> 
> This Ti-based (PM269) version might be very similar to Asus TF300T I have.
> I'll have a look on your DT during the weekend.

Will be great, thank you!
