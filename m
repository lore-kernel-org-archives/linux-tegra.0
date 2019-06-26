From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: Re: [PATCH V4 03/18] gpio: tegra: use resume_noirq for tegra gpio
 resume
Date: Wed, 26 Jun 2019 10:06:33 -0700
Message-ID: <7b97ec08-212e-76fb-ad12-6d1be5ab6149@nvidia.com>
References: <1561345379-2429-1-git-send-email-skomatineni@nvidia.com>
 <1561345379-2429-4-git-send-email-skomatineni@nvidia.com>
 <CACRpkda0=HeRco8kExdf6TmiLOnCec3Ek06s-MdjNJvVGw3ZNQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkda0=HeRco8kExdf6TmiLOnCec3Ek06s-MdjNJvVGw3ZNQ@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Stefan Agner <stefan@agner.ch>, Mark Rutland <mark.rutland@arm.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk <linux-clk@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, jckuo@nvidia.com, Joseph Lo <josephl@nvidia.com>, talho@nvidia.com, linux-tegra@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>, spatra@nvidia.com, Rob Herring <robh+dt@kernel.org>, Dmitry
List-Id: linux-tegra@vger.kernel.org


On 6/25/19 6:38 AM, Linus Walleij wrote:
> On Mon, Jun 24, 2019 at 5:03 AM Sowjanya Komatineni
> <skomatineni@nvidia.com> wrote:
>
>> During SC7 resume, PARKED bit clear from the pinmux registers may
>> cause a glitch on the GPIO lines.
>>
>> So, Tegra GPIOs restore should happen prior to restoring Tegra pinmux
>> to keep the GPIO lines in a known good state prior to clearing PARKED
>> bit.
>>
>> This patch has fix for this by moving Tegra GPIOs restore to happen
>> very early than pinctrl resume.
>>
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> Can this patch be applied in isolation from the other patches?
>
> WOuld be nice to have at least Thierry's ACK on it before I
> apply it.
>
> Yours,
> Linus Walleij

Just to confirm, Will not include this in V5 as you are planning to 
apply this patch separately.

Thanks

Sowjanya
