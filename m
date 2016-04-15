From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 7/7] pinctrl: tegra: Add driver to configure voltage and
 power state of io pads
Date: Fri, 15 Apr 2016 13:15:16 +0200
Message-ID: <CACRpkdbr-9Z1JKMVmwNFyMq+Pg+3hT5c9rKZ1y4wZecnidW9Cg@mail.gmail.com>
References: <1460473007-11535-1-git-send-email-ldewangan@nvidia.com>
	<1460473007-11535-8-git-send-email-ldewangan@nvidia.com>
	<CACRpkdZyYiNJfuiTPeivvgVTZwdwh64nkf=f8JczSAVvnT7QeA@mail.gmail.com>
	<5710A8A4.90309@nvidia.com>
	<CACRpkdZLEozAmv6REcb7ubCNSLxGsYj1whZEKUkdiodZoS=vzg@mail.gmail.com>
	<5710BA75.2010503@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5710BA75.2010503@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jon Hunter <jonathanh@nvidia.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Apr 15, 2016 at 11:55 AM, Laxman Dewangan <ldewangan@nvidia.com> wrote:
> On Friday 15 April 2016 02:55 PM, Linus Walleij wrote:

>> If the pin could actually set a voltage level it would have a regulator.
>> I don't believe that. I think it is selecting one of two rails which
>> could theoretically hold two totally different voltages.
>>
>> And that is what power-source is about.
>
> The IO rails connected to PMIC rail and connection does not get change.
> We change the voltage of PMIC rails via regulator calls. And then configure
> pads for the new voltage.

Aha I get it! So you adjust something in the I/O-cell so that it is adapted
for the new voltage.

OK that seems to be something new. I suspect
power-voltage-select = <n>; where N i in uV would solve this?
(We should use uV since regulators use this.)

But to be sure we would like to know what is actually happening,
electronically speaking, when you set this up. Do you have any
idea?

Yours,
Linus Walleij
