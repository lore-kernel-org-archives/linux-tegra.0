From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH 2/2] pinctrl: tegra: Add driver to configure voltage and
 power of io pads
Date: Tue, 8 Nov 2016 21:18:54 +0530
Message-ID: <5821F3E6.6020401@nvidia.com>
References: <1478077742-25437-1-git-send-email-ldewangan@nvidia.com> <1478077742-25437-3-git-send-email-ldewangan@nvidia.com> <CACRpkdb4DQLzQWHxuZi=TDaeigNzVJV8TN1jsQfOHKF7yPLrUg@mail.gmail.com> <58201401.8050805@nvidia.com> <CACRpkdZo+527t4O9gX0U2VOaAYj7fnt7X0wynByBdYN5=2mDsA@mail.gmail.com> <5821A6D3.7010000@nvidia.com> <CACRpkdYO9ZCTGVdnyhVZ4DNLsHq+d-1_xuws2be8yab+MsyyVw@mail.gmail.com> <5821D49E.2070308@nvidia.com> <CACRpkdZWc1jC2QzYq4ffT6YbhfbsEBbKtajMXuexA8MvJEPPEw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdZWc1jC2QzYq4ffT6YbhfbsEBbKtajMXuexA8MvJEPPEw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jon Hunter <jonathanh@nvidia.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


On Tuesday 08 November 2016 09:16 PM, Linus Walleij wrote:
> On Tue, Nov 8, 2016 at 2:35 PM, Laxman Dewangan <ldewangan@nvidia.com> wrote:
>
>> There is two types of configuration in given platform, the IO voltage does
>> not get change (fixed in given platform) and in some of cases, get change
>> dynamically like SDIO3.0 where the voltage switches to 3.3V and 1.8V.
>>
>> Yes, it can be integrated with the regulator handle and then it can call the
>> required configurations through notifier and regulator_get_voltage().
>> But I think it is too much complex for the static configurations. This
>> mandate also to populate the regulator handle and all power tree.
>>
>> The simple way for static configuration (case where voltage does not get
>> change), just take the power tree IO voltage from DT and configure the IO
>> pad control register.
>>
>> For dynamic case, there is some sequence need to be followed based on
>> voltage direction change (towards lower or towards higher) for the voltage
>> change and the IO pad voltage configuration and it is simple to do it from
>> client driver.
> The devicetree should describe the platform.
>
> Adding this custom attribute does not describe the platform very
> well since the dependency to the corresponding regulator is hidden.
>
> The point of device tree is not as much to make things simple as
> to describe the world properly.
>
> So to me it is simple: use regulators and phandles.
>
> It might require a bit of upfront coding but the result will look
> much nicer.

Oops, I asked same clarification when replying the Thierry's comment.

Got answer now.. only via regulator support.


I am going to support the IO pad voltage control with regulator only.
No custom attribute for this.
However, for support for low-power will be same as this patch.


