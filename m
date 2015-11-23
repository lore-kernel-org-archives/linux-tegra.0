From: Tyler Baker <tyler.baker@linaro.org>
Subject: Re: [PATCH] clk: tegra: Fix bypassing of PLLs
Date: Mon, 23 Nov 2015 15:18:59 -0800
Message-ID: <CANMBJr7vYb+kuUBzsC8i4b=b6DRVsbqnf5OrVtj6kVS2RMNgfQ@mail.gmail.com>
References: <1448032264-29622-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1448032264-29622-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-clk-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rhyland Klein <rklein@nvidia.com>, Kevin's boot bot <khilman@kernel.org>
List-Id: linux-tegra@vger.kernel.org

Hi Jon,

On 20 November 2015 at 07:11, Jon Hunter <jonathanh@nvidia.com> wrote:
> The _clk_disable_pll() function will attempt to place a PLL into bypass
> if the TEGRA_PLL_BYPASS is specified for the PLL and then disable the PLL
> by clearing the enable bit. To place the PLL into bypass, the bypass bit
> needs to be set and not cleared. Fix this by setting the bypass bit and
> not clearing it.
>
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>

The kernelci.org bot recently detected a jetson-tk1 boot failure[1][2]
in the tegra tree. This boot failure has only been observed when
booting with a multi_v7_defconfig kernel variant. The bot bisected[3]
this boot failure to this commit, and I confirmed reverting it on top
of the tegra for-next branch resolves the issue. The ramdisk[4] used
for booting is loaded with the modules from the build. It appears to
me that as the modules are being loaded in userspace by eudev the
jetson-tk1 locks up. I've sifted through the console logs a bit, and
found this splat to be most interesting[5].  Can you confirm this
issue on your end?

Cheers,

Tyler

[1] http://kernelci.org/soc/tegra/job/tegra/kernel/v4.4-rc1-60-gb924f95da320/
[2] http://kernelci.org/soc/tegra/job/tegra/
[3] http://hastebin.com/sekozibilo.lua
[4] http://storage.kernelci.org/images/rootfs/buildroot/armel/base/rootfs.cpio.gz
[5] http://hastebin.com/jomigahiro.coffee
