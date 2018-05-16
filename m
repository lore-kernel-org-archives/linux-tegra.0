From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2] pinctrl: tegra20: Provide CDEV1/2 clock muxes
Date: Wed, 16 May 2018 17:05:30 +0300
Message-ID: <a5015143-ef1d-4eb1-5651-346dae82d42e@gmail.com>
References: <20180503225537.20748-1-digetx@gmail.com>
 <20180503225537.20748-3-digetx@gmail.com>
 <CACRpkdbykxwHvQgfFnihOHy1hsM7ZWHtCYGCNb49MbNkKWz6Hg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdbykxwHvQgfFnihOHy1hsM7ZWHtCYGCNb49MbNkKWz6Hg@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Marcel Ziswiler <marcel@ziswiler.com>, Marc Dietrich <marvin24@gmx.de>, linux-clk <linux-clk@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-tegra@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On 16.05.2018 15:23, Linus Walleij wrote:
> On Fri, May 4, 2018 at 12:55 AM, Dmitry Osipenko <digetx@gmail.com> wrote:
> 
>> Muxing of pins MCLK1/2 determine the muxing of the corresponding clocks.
>> Make pinctrl driver to provide clock muxes for the CDEV1/2 pingroups, so
>> that main clk-controller driver could get an actual parent clock for the
>> CDEV1/2 clocks.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> Reviewed-by: Marcel Ziswiler <marcel@ziswiler.com>
>> Tested-by: Marcel Ziswiler <marcel@ziswiler.com>
>> Tested-by: Marc Dietrich <marvin24@gmx.de>
>> Acked-by: Peter De Schrijver <pdeschrijver@nvidia.com>
>> ---
>>
>> v2: This patch is factored out from the v1 clk/DT series so that it could be
>>     applied separately.
> 
> Patch applied unless Stephen W protests.
> Please include swarren on future patches to this driver.

I think previously get_maintainer script suggested driver authors, probably it
changed sometime ago. I'm pretty sure that Stephen follows the linux-tegra ML
(Stephen, are you?) and would have jumped into the thread if there was anything
wrong in the patch, though indeed won't hurt to ping him for this patch explicitly.

Stephen, please let me know if you disagree with anything in this patch.
