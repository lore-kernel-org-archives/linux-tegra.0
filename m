From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v3] pinctrl: tegra20: Provide CDEV1/2 clock muxes
Date: Sat, 19 May 2018 18:46:23 +0300
Message-ID: <5c1e76fe-3ef5-fe31-6b89-edcb8b8c0582@gmail.com>
References: <20180508162607.3500-1-digetx@gmail.com>
 <20180508162607.3500-3-digetx@gmail.com> <20180518103908.GF5312@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180518103908.GF5312@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, Marcel Ziswiler <marcel@ziswiler.com>, Marc Dietrich <marvin24@gmx.de>, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 18.05.2018 13:39, Thierry Reding wrote:
> On Tue, May 08, 2018 at 07:26:04PM +0300, Dmitry Osipenko wrote:
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
>> Changelog:
>>
>> v3:
>> 	- No change.
>>
>> v2:
>> 	- See changelog of "Restore ULPI USB on Tegra20" v2 series.
>>
>>  drivers/pinctrl/tegra/pinctrl-tegra.c   | 11 ---------
>>  drivers/pinctrl/tegra/pinctrl-tegra.h   | 11 +++++++++
>>  drivers/pinctrl/tegra/pinctrl-tegra20.c | 30 ++++++++++++++++++++++++-
>>  3 files changed, 40 insertions(+), 12 deletions(-)
> 
> Linus,
> 
> were you going to pick this up for v4.18? There's a runtime dependency
> on this from some clock patches that I'd like to get into v4.18.
> 
> I see I never gave my Acked-by on this particular patch, so here goes:
> 
> Acked-by: Thierry Reding <treding@nvidia.com>

Linus applied the v2 of the patch [0]. Thanks for caring about it.

[0] https://www.spinics.net/lists/linux-tegra/msg33331.html
