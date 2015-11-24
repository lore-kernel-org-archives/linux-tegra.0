From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] clk: tegra: Fix bypassing of PLLs
Date: Tue, 24 Nov 2015 15:25:41 +0000
Message-ID: <56548175.2050104@nvidia.com>
References: <1448032264-29622-1-git-send-email-jonathanh@nvidia.com>
 <CANMBJr7vYb+kuUBzsC8i4b=b6DRVsbqnf5OrVtj6kVS2RMNgfQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CANMBJr7vYb+kuUBzsC8i4b=b6DRVsbqnf5OrVtj6kVS2RMNgfQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tyler Baker <tyler.baker@linaro.org>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rhyland Klein <rklein@nvidia.com>, Kevin's boot bot <khilman@kernel.org>
List-Id: linux-tegra@vger.kernel.org

Hi Tyler,

On 23/11/15 23:18, Tyler Baker wrote:
> Hi Jon,
> 
> On 20 November 2015 at 07:11, Jon Hunter <jonathanh@nvidia.com> wrote:
>> The _clk_disable_pll() function will attempt to place a PLL into bypass
>> if the TEGRA_PLL_BYPASS is specified for the PLL and then disable the PLL
>> by clearing the enable bit. To place the PLL into bypass, the bypass bit
>> needs to be set and not cleared. Fix this by setting the bypass bit and
>> not clearing it.
>>
>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> 
> The kernelci.org bot recently detected a jetson-tk1 boot failure[1][2]
> in the tegra tree. This boot failure has only been observed when
> booting with a multi_v7_defconfig kernel variant. The bot bisected[3]
> this boot failure to this commit, and I confirmed reverting it on top
> of the tegra for-next branch resolves the issue. The ramdisk[4] used
> for booting is loaded with the modules from the build. It appears to
> me that as the modules are being loaded in userspace by eudev the
> jetson-tk1 locks up. I've sifted through the console logs a bit, and
> found this splat to be most interesting[5].  Can you confirm this
> issue on your end?

It appears that the crash is occurring when the tegra-devfreq driver is
loaded and I have been able to narrow it down to the pllm pll that is
causing the problem. If I remove the bypass flag for pllm then I no
longer see the problem (see below). However, the bypass bit is valid for
this pll and so I need to see if there is another bug lurking in the
management of this pll. The pllm has an additional override feature and
I see another enable bit. I need to check this code.

Cheers
Jon

commit 1e4a77f9f08b34f63fc1d4768a31edd5070321a7
Author: Jon Hunter <jonathanh@nvidia.com>
Date:   Tue Nov 24 15:13:58 2015 +0000

    clk: tegra: Don't bypass pllm (TESTING ONLY)

diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index c7b5f039d283..bf809086c1e6 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -1788,7 +1788,6 @@ struct clk *tegra_clk_register_pllm(const char
*name, const char *parent_name,
                pll_params->vco_min = pll_params->adjust_vco(pll_params,
                                                             parent_rate);

-       pll_params->flags |= TEGRA_PLL_BYPASS;
        pll_params->flags |= TEGRA_PLLM;
        pll = _tegra_init_pll(clk_base, pmc, pll_params, lock);
        if (IS_ERR(pll))
