From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: Re: [PATCH v7 01/20] pinctrl: tegra: Add suspend and resume support
Date: Tue, 6 Aug 2019 14:51:23 -0700
Message-ID: <a2fb3795-5ec1-1d03-f496-f151d1270e90@nvidia.com>
References: <1564607463-28802-1-git-send-email-skomatineni@nvidia.com>
 <1564607463-28802-2-git-send-email-skomatineni@nvidia.com>
 <CACRpkdZVR-i1c5eATL2hSPbLXcX1sR8NgXwa4j259XXUi57xug@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdZVR-i1c5eATL2hSPbLXcX1sR8NgXwa4j259XXUi57xug@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Stefan Agner <stefan@agner.ch>, Mark Rutland <mark.rutland@arm.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk <linux-clk@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, jckuo@nvidia.com, Joseph Lo <josephl@nvidia.com>, talho@nvidia.com, linux-tegra@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>, spatra@nvidia.com, Rob Herring <robh+dt@kernel.org>, Dmitry
List-Id: linux-tegra@vger.kernel.org


On 8/5/19 2:20 AM, Linus Walleij wrote:
> On Wed, Jul 31, 2019 at 11:11 PM Sowjanya Komatineni
> <skomatineni@nvidia.com> wrote:
>
>> This patch adds support for Tegra pinctrl driver suspend and resume.
>>
>> During suspend, context of all pinctrl registers are stored and
>> on resume they are all restored to have all the pinmux and pad
>> configuration for normal operation.
>>
>> Acked-by: Thierry Reding <treding@nvidia.com>
>> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> Patch applied to the pinctrl tree.
>
> This patch seems finished.
>
> Also if the rest don't get merged for v5.4 then at least this is so
> your patch stack gets more shallow.
>
> I hope it's fine to merge this separately, else tell me and I'll
> pull it out.
>
> Yours,
> Linus Walleij

Yes, this patch can be merged separately. But, there's latest feedback 
from Dmitry to add barrier after writes to make sure pinmux register 
writes happen.

So will update this patch to add barrier in v8. So, need to wait for v8.

Thanks

Sowjanya
