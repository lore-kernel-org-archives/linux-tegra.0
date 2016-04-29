From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH V5 0/4] gpio: tegra: Cleanups and support for debounce
Date: Fri, 29 Apr 2016 14:50:11 +0530
Message-ID: <5723274B.3050209@nvidia.com>
References: <1461580714-22479-1-git-send-email-ldewangan@nvidia.com> <CACRpkda7HqPLSRLzaSdO-7chjUBL9C2VAMB0nyVZUw=PSGL3VQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkda7HqPLSRLzaSdO-7chjUBL9C2VAMB0nyVZUw=PSGL3VQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


On Friday 29 April 2016 02:37 PM, Linus Walleij wrote:
> On Mon, Apr 25, 2016 at 12:38 PM, Laxman Dewangan <ldewangan@nvidia.com> wrote:
>
>> Add support for the debounce as Tegra210 support debounce in HW.
>> Also do the clenaups to remove all global variables.
> OK this v5 is applied.
>
> Laxman does this GPIO also have open drain and/or open source
> handling?

Some of the pins support the open drain and these are part of pinmux 
register set.
For that we have property for setting open drain.

Is it possible to link the gpio APIs to pincontrol for setting that pin?


> Then you might want to look into supporting that too as I just added
> support for native single-endedness to gpiolib, c.f.:
> http://marc.info/?l=linux-gpio&m=146011780301280&w=2

Yaah, Some of PMIC's (which I am handling) gpios support open drain and 
I think I can have changes for the PMIC gpio driver.

>
> It would be nice if you also implement .get_direction() which
> makes debugfs and initial reading of the state of the lines
> more accurate.

Sure, this can be implemented.
Will post the patch on top of the series soon.



