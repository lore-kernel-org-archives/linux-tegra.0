From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH V3 2/2] pinctrl: tegra: Add driver to configure voltage
 and power of io pads
Date: Thu, 24 Nov 2016 19:49:54 +0530
Message-ID: <5836F70A.9070109@nvidia.com>
References: <1479810013-29894-1-git-send-email-ldewangan@nvidia.com> <1479810013-29894-3-git-send-email-ldewangan@nvidia.com> <CACRpkdZK34QfbSBJvshfZekk5TJBU5sZog-9uszLSmFPOGJgiw@mail.gmail.com> <583580AD.60803@nvidia.com> <CACRpkdbp8_eR7PLoaX4AJbhcx_tYQjcS5U_hR3EU7b4dar3ckg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdbp8_eR7PLoaX4AJbhcx_tYQjcS5U_hR3EU7b4dar3ckg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Stephen Warren <swarren@wwwdotorg.org>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Joe Perches <joe@perches.com>, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


On Thursday 24 November 2016 07:41 PM, Linus Walleij wrote:
> On Wed, Nov 23, 2016 at 12:42 PM, Laxman Dewangan <ldewangan@nvidia.com> wrote:
>
>> Here, we need the regulator handle which can support the other regulator
>> APIs.
>>
>> In some of platforms, we do not use some of the io-pins and on this case, we
>> do not connect the IO rail supply for these pins. So this is like a hardware
>> optional.
>>
>> If the IO pins are used then it need to have the proper regulator handle.
>> Missing regulator handle on DT will be like that IO pads are not used.
> OK I buy that argument, unless Mark (Brown) has comments.
>

BTW, I resolved this in different way in V4 which I sent today, if 
regulator_get() succeed for dummy then regulator_get_voltage() failed 
and if it failed then assume that it is dummy and just ignore the 
further handling based on regulator.

So when we really need the configuration based on voltage, we must 
supply the regulator handle.
