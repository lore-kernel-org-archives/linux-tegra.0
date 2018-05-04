From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 4/4] ARM: dts: tegra20: Revert "Fix ULPI regression on
 Tegra20"
Date: Fri, 4 May 2018 14:21:30 +0300
Message-ID: <5013e8c6-a56a-38ad-2a25-d18bf0a1e014@gmail.com>
References: <20180503225537.20748-1-digetx@gmail.com>
 <20180503225537.20748-6-digetx@gmail.com> <20180504104051.GL13459@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180504104051.GL13459@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, Marcel Ziswiler <marcel@ziswiler.com>, Marc Dietrich <marvin24@gmx.de>, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 04.05.2018 13:40, Thierry Reding wrote:
> On Fri, May 04, 2018 at 01:55:37AM +0300, Dmitry Osipenko wrote:
>> Commit 4c9a27a6c66d ("ARM: tegra: Fix ULPI regression on Tegra20") changed
>> "ulpi-link" clock from CDEV2 to PLL_P_OUT4. Turned out that PLL_P_OUT4 is
>> the parent of CDEV2 clock and original clock setup of "ulpi-link" was
>> correct. The reverted patch was fixing USB for one board and broke the
>> other, now Tegra's clk driver correctly sets parent for the CDEV2 clock
>> and hence patch could be reverted safely, restoring USB for all of the
>> boards.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> Reviewed-by: Marcel Ziswiler <marcel@ziswiler.com>
>> Tested-by: Marcel Ziswiler <marcel@ziswiler.com>
>> Tested-by: Marc Dietrich <marvin24@gmx.de>
>> ---
>>  arch/arm/boot/dts/tegra20.dtsi | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Is it still true that this patch alone fixes the known regression? I'm
> just asking because the remainder of the series, even though it sounds
> to be the right thing to do, is fairly big for a fix against v4.17.

Yes, Marcel says that reverting just this patch works for him now.

> So if this alone fixes the regression I think it'd be best to queue it
> up for v4.17 and get the rest of the patches into v4.18.

Sounds good.
