From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH V5 0/4] gpio: tegra: Cleanups and support for debounce
Date: Mon, 2 May 2016 10:12:32 -0600
Message-ID: <57277C70.5080204@wwwdotorg.org>
References: <1461580714-22479-1-git-send-email-ldewangan@nvidia.com>
 <CACRpkda7HqPLSRLzaSdO-7chjUBL9C2VAMB0nyVZUw=PSGL3VQ@mail.gmail.com>
 <5723274B.3050209@nvidia.com>
 <CACRpkdZ-muOGvtKbKNP66Bv5FSPeMeYvmArC5GAM92EcKp+kgQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdZ-muOGvtKbKNP66Bv5FSPeMeYvmArC5GAM92EcKp+kgQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Laxman Dewangan <ldewangan@nvidia.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On 04/30/2016 05:07 AM, Linus Walleij wrote:
> On Fri, Apr 29, 2016 at 11:20 AM, Laxman Dewangan <ldewangan@nvidia.com> wrote:
>> On Friday 29 April 2016 02:37 PM, Linus Walleij wrote:
>>> On Mon, Apr 25, 2016 at 12:38 PM, Laxman Dewangan <ldewangan@nvidia.com>
>>> wrote:
>>>
>>>> Add support for the debounce as Tegra210 support debounce in HW.
>>>> Also do the clenaups to remove all global variables.
>>>
>>> OK this v5 is applied.
>>>
>>> Laxman does this GPIO also have open drain and/or open source
>>> handling?
>>
>>
>> Some of the pins support the open drain and these are part of pinmux
>> register set.
>> For that we have property for setting open drain.

IIRC, Tegra has open-drain control in both the GPIO controller for all 
pins (OE bit) and in the pinmux controller for a small subset of pins. 
For GPIOs, why wouldn't we just use the control bit in the GPIO 
controller for all GPIOs. This would avoid any special-cases, and 
minimize coupling between the GPIO and pinctrl drivers.
