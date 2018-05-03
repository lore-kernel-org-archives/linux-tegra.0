From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 1/4] clk: tegra20: Add DEV1/DEV2 OSC dividers
Date: Thu, 3 May 2018 15:35:12 +0300
Message-ID: <31fab61c-951f-244b-f965-70e034f23e7e@gmail.com>
References: <20180426235818.10018-1-digetx@gmail.com>
 <20180426235818.10018-2-digetx@gmail.com>
 <1524832404.6979.9.camel@ziswiler.com>
 <a8fc30b9-42ce-b29a-abc6-2867ebf4a9ac@gmail.com>
 <1524834018.6979.13.camel@ziswiler.com>
 <7c4e96ea-8bcf-1643-1b0f-29dc85b62b7b@gmail.com>
 <440e71db-cd0b-c4d8-eb24-ac8ebec9ae75@gmail.com>
 <1525350612.5836.6.camel@ziswiler.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1525350612.5836.6.camel@ziswiler.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Marcel Ziswiler <marcel@ziswiler.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, Marc Dietrich <marvin24@gmx.de>
Cc: linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 03.05.2018 15:30, Marcel Ziswiler wrote:
> On Thu, 2018-05-03 at 15:02 +0300, Dmitry Osipenko wrote:
>> ...
>>> Marcel, you previously mentioned that reverting of your DT patch
>>> works for the
>>> Colibri now. Does that reverting also work for the 4.17 kernel? If
>>> yes, I may
>>> add stable tag to the revert-patch to get back paz00 working with
>>> 4.17. If it's
>>> not working, we should figure out why pll_p_out4 is getting
>>> disabled as it
>>> should be a distinct issue.
>>
>> Oh, I just found that Thierry already asked to get this patches
>> included into
>> 4.17. Anyway would be nice to know if a sole DT revert works with
>> 4.17 for you.
> 
> Yes, 4.17.0-rc3 with just 4c9a27a6c66d4427f3cba4019d4ba738fe99fa87
> reverted works fine as well.

Okay, thank you very much. So pll_p_out4 disabling was either an intermediate
issue that got fixed or it is masked by something else now.
