From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 5/7] dt-bindings: Add Tegra PMC pad configuration bindings
Date: Sun, 29 Jul 2018 22:54:41 +0200
Message-ID: <CACRpkdbDjbi5+WAjU2kYLZZONVc9zrTuCAX9BiA86OrWN6vjPw@mail.gmail.com>
References: <1531396813-6581-1-git-send-email-avienamo@nvidia.com>
 <1531396813-6581-6-git-send-email-avienamo@nvidia.com> <20180716154309.GA16477@rob-hp-laptop>
 <20180717152318.3608e3f9@dhcp-10-21-25-168> <CAL_JsqL1F0RF_6=ho0pa7Uh4AUsyvFRDGM50gN4=6_+MwBfGYQ@mail.gmail.com>
 <20180717183020.5ab9bfa6@dhcp-10-21-25-168> <cb67ced4-eef8-abb5-5706-3282a55edbb2@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cb67ced4-eef8-abb5-5706-3282a55edbb2@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: avienamo@nvidia.com, Rob Herring <robh@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-tegra@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Jul 20, 2018 at 1:16 PM Jon Hunter <jonathanh@nvidia.com> wrote:

> Adding Linus ...

OMG this sounds bad.

> >> I don't know offhand. Doesn't look like it if you have custom values.
> >
> > It's listed under "Supported generic properties" in
> > pinctrl-bindings.txt. The convention seems to be not to add a vendor
> > prefix even though such custom macro values are used. The property is
> > currently used by qcom,pmic-gpio, qcom,pmic-mpp, and renesas,pfc-pinctrl.
> > I could not find a bindings document describing it with a vendor prefix.
>
> Looking at other users of the 'power-source' property it is not clear to
> me if the values should/can be vendor specific or not. I see cases where
> some people use definitions and others use actual voltages.
>
> Linus, any recommendations here?

It's a bit of imperfect world here.

I always imagines it was some kind of enumerator
like source A, B or C... so 0, 1 defined in sime include/dt-bindings/*
would make most sense to me.

In general, use SI-units if you can, else use something that makes
sense for the people writing the device tree. These enumerators
seems to make sense.

If nothing makes any sense, maybe a custom property makes it
make sense.

Yours,
Linus Walleij
