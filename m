From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v7] regulator: fixed: Convert to use GPIO descriptor only
Date: Fri, 12 Oct 2018 11:39:15 +0100
Message-ID: <c1722bee-230a-d0ad-d2de-790ab1ce9fcf@nvidia.com>
References: <CGME20181011090112eucas1p286d8c1edfc1a2a207d8a11c5ad7eb20e@eucas1p2.samsung.com>
 <20180906122436.25610-1-linus.walleij@linaro.org>
 <20181011090112eucas1p286d8c1edfc1a2a207d8a11c5ad7eb20e~cglSx9qcr2394623946eucas1p2y@eucas1p2.samsung.com>
 <CACRpkdbTdmQQTg1D9jbcHGcT4kZermwVA+QEnUJGf+VYqoKRkg@mail.gmail.com>
 <c2726f18-f0cd-0d3d-c950-3e7212efd34d@nvidia.com>
 <1539272073.18645.12.camel@toradex.com>
 <CACRpkdYDoFhBJy484Hvf0e+zv51w23hqtBYLFxXsiLmWs63CWw@mail.gmail.com>
 <1539337415.30485.21.camel@toradex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1539337415.30485.21.camel@toradex.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Marcel Ziswiler <marcel.ziswiler@toradex.com>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robert.jarzmik@free.fr" <robert.jarzmik@free.fr>, "aaro.koskinen@iki.fi" <aaro.koskinen@iki.fi>, "jacopo@jmondi.org" <jacopo@jmondi.org>, "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>, "rmk+kernel@armlinux.org.uk" <rmk+kernel@armlinux.org.uk>, "broonie@kernel.org" <broonie@kernel.org>, "shc_work@mail.ru" <shc_work@mail.ru>, "haojian.zhuang@gmail.com" <haojian.zhuang@gmail.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "rppt@linux.vnet.ibm.com" <rppt@linux.vnet.ibm.com>, "zonque@gmail.com" <zonque@gmail.com>, "marc.zyngier@arm.com" <marc.zyngier@arm.com>, "philipp.zabel@gmail.com" <philipp.zabel@gmail.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>"jmkrzyszt@gmail.com" <jm>
List-Id: linux-tegra@vger.kernel.org


On 12/10/18 10:43, Marcel Ziswiler wrote:
> On Thu, 2018-10-11 at 19:47 +0200, Linus Walleij wrote:
>> On Thu, Oct 11, 2018 at 5:34 PM Marcel Ziswiler
>> <marcel.ziswiler@toradex.com> wrote:
>>
>>> I guess that is also what broke HDMI on Apalis/Colibri T30 causing
>>> me
>>> to submit a fix [1]. I may also help testing.
>>
>> I see there are many ways to skin this cat.
> 
> Yes, as a matter of fact I screened the kernel concerning this multi
> gpio stuff but could not quite find many examples and no mentioning
> anywhere whether or not this is actually allowed. So I kind of assumed
> that this may just not really be allowed and cooked up my patch which
> is anyway kind of a cleaner solution. I mean explicitly modelling the
> GPIO into some intermediate regulator supplying the others.

See the function 'regulator_ena_gpio_request()', it states that the same
GPIO pin can be shared among regulators.

We had the same situation for Tegra124 Jetson TK1 but I don't think that
adding a pseudo intermediate regulator is cleaner. If the GPIO controls
more than one regulator, I don't see why is it necessary to change the
DT. There are several other people reporting the same problem with
various different boards. So this does seem to be a common usage.

Cheers
Jon

-- 
nvpublic
