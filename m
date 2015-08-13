From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/3] pinctrl: tegra: Only set the gpio range if needed
Date: Thu, 13 Aug 2015 14:55:37 +0200
Message-ID: <CACRpkdYLos-10EjuHJnWdVh2eUzfaCYxPe9-5qdh3yzvcE=a_g@mail.gmail.com>
References: <1436862596-27730-1-git-send-email-tomeu.vizoso@collabora.com>
	<1436862596-27730-3-git-send-email-tomeu.vizoso@collabora.com>
	<CAAObsKBk54ZAhGVmpONeBtX1AJv0woq7sp3cCGZ1FeDtTst_DA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAAObsKBk54ZAhGVmpONeBtX1AJv0woq7sp3cCGZ1FeDtTst_DA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>
List-Id: linux-tegra@vger.kernel.org

On Thu, Aug 6, 2015 at 3:40 PM, Tomeu Vizoso <tomeu.vizoso@collabora.com> wrote:
> On 14 July 2015 at 10:29, Tomeu Vizoso <tomeu.vizoso@collabora.com> wrote:
>> If the gpio DT node has the gpio-ranges property, the range will be
>> added by the gpio core and doesn't need to be added by the pinctrl
>> driver.
>>
>> By having the gpio-ranges property, we have an explicit dependency from
>> the gpio node to the pinctrl node and we can stop using the deprecated
>> pinctrl_add_gpio_range() function.
>>
>> Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
>> Acked-by: Stephen Warren <swarren@nvidia.com>
>
> Hi Linus,
>
> do you mind if this goes through the Tegra tree? It would be best if
> it went together with 3/3 ("ARM: tegra: Add gpio-ranges property"), to
> avoid duplicated GPIO ranges.

It's cool, go ahead:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
