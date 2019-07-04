From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V5 02/18] pinctrl: tegra: Add suspend and resume support
Date: Thu, 4 Jul 2019 13:40:30 +0300
Message-ID: <66b5e81b-d468-e2aa-7336-3d4854c234ab@gmail.com>
References: <1561687972-19319-1-git-send-email-skomatineni@nvidia.com>
 <1561687972-19319-3-git-send-email-skomatineni@nvidia.com>
 <a262cbb3-845c-3ad1-16cc-375a24b9f7e9@gmail.com>
 <822867d6-4a4d-5f68-9b21-84a20d73c589@gmail.com>
 <CACRpkdYdCmT0ErTuewYbv7bPkjoFLrK9KSVuKVMkAXNQYAGV7g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYdCmT0ErTuewYbv7bPkjoFLrK9KSVuKVMkAXNQYAGV7g@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Sowjanya Komatineni <skomatineni@nvidia.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Stefan Agner <stefan@agner.ch>, Mark Rutland <mark.rutland@arm.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk <linux-clk@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, jckuo@nvidia.com, Joseph Lo <josephl@nvidia.com>, talho@nvidia.com, linux-tegra@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>, spatra@nvidia.com, Rob
List-Id: linux-tegra@vger.kernel.org

04.07.2019 10:31, Linus Walleij пишет:
> On Sat, Jun 29, 2019 at 5:58 PM Dmitry Osipenko <digetx@gmail.com> wrote:
> 
>> Oh, also what about GPIO-pinctrl suspend resume ordering .. is it okay that pinctrl
>> will be resumed after GPIO? Shouldn't a proper pin-muxing be selected at first?
> 
> Thierry sent some initial patches about this I think. We need to use
> device links for this to work properly so he adds support for
> linking the pinctrl and GPIO devices through the ranges.
> 
> For links between pin control handles and their consumers, see also:
> 036f394dd77f pinctrl: Enable device link creation for pin control
> c6045b4e3cad pinctrl: stmfx: enable links creations
> 489b64d66325 pinctrl: stm32: Add links to consumers
> 
> I am using STM32 as guinea pig for this, consider adding links also
> from the Tegra pinctrl. I might simply make these pinctrl consumer
> to producer links default because I think it makes a lot sense.

IIUC, currently the plan is to resume pinctrl *after* GPIO for Tegra210 [1]. But this
contradicts to what was traditionally done for older Tegras where pinctrl was always
resumed first and apparently it won't work well for the GPIO ranges as well. I think this
and the other patchsets related to suspend-resume still need some more thought.

[1] https://patchwork.kernel.org/patch/11012077/
