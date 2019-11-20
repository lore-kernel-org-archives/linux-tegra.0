From: Guillaume Tucker <guillaume.tucker@collabora.com>
Subject: Re: clk/clk-next bisection: boot on tegra124-nyan-big
Date: Wed, 20 Nov 2019 08:17:28 +0000
Message-ID: <53eda2aa-35d0-8776-e2cb-b6c4e8c1ff7f@collabora.com>
References: <5dd4ce40.1c69fb81.548f8.e723@mx.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5dd4ce40.1c69fb81.548f8.e723@mx.google.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>, Thierry Reding <treding@nvidia.com>
Cc: tomeu.vizoso@collabora.com, mgalka@collabora.com, broonie@kernel.org, matthew.hart@linaro.org, khilman@baylibre.com, enric.balletbo@collabora.com, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org, Prashant Gaikwad <pgaikwad@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, linux-tegra@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 20/11/2019 05:25, kernelci.org bot wrote:
> * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
> * This automated bisection report was sent to you on the basis  *
> * that you may be involved with the breaking commit it has      *
> * found.  No manual investigation has been done to verify it,   *
> * and the root cause of the problem may be somewhere else.      *
> *                                                               *
> * If you do send a fix, please include this trailer:            *
> *   Reported-by: "kernelci.org bot" <bot@kernelci.org>          *
> *                                                               *
> * Hope this helps!                                              *
> * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
> 
> clk/clk-next bisection: boot on tegra124-nyan-big
> 
> Summary:
>   Start:      cd89054e321a Merge branch 'clk-init-leak' into clk-next
>   Details:    https://kernelci.org/boot/id/5dd486b059b514415acf54bd
>   Plain log:  https://storage.kernelci.org//clk/clk-next/clk-fixes-for-linus-196-gcd89054e321a/arm/tegra_defconfig/gcc-8/lab-collabora/boot-tegra124-nyan-big.txt
>   HTML log:   https://storage.kernelci.org//clk/clk-next/clk-fixes-for-linus-196-gcd89054e321a/arm/tegra_defconfig/gcc-8/lab-collabora/boot-tegra124-nyan-big.html
>   Result:     25175c806a68 clk: tegra: Reimplement SOR clock on Tegra124
> 
> Checks:
>   revert:     PASS
>   verify:     PASS
> 
> Parameters:
>   Tree:       clk
>   URL:        https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git
>   Branch:     clk-next
>   Target:     tegra124-nyan-big
>   CPU arch:   arm
>   Lab:        lab-collabora
>   Compiler:   gcc-8
>   Config:     tegra_defconfig
>   Test suite: boot
> 
> Breaking commit found:
> 
> -------------------------------------------------------------------------------
> commit 25175c806a6841149abe46168e0af12593141612
> Author: Thierry Reding <treding@nvidia.com>
> Date:   Thu Jul 25 18:19:00 2019 +0200
> 
>     clk: tegra: Reimplement SOR clock on Tegra124
>     
>     In order to allow the display driver to deal uniformly with all SOR
>     generations, implement the SOR clocks in a way that is compatible with
>     Tegra186 and later.
>     
>     Acked-by: Stephen Boyd <sboyd@kernel.org>
>     Signed-off-by: Thierry Reding <treding@nvidia.com>

There was already a bisection last Thursday which found this
commit, and Thierry explained that it works in linux-next thanks
to other patches.  I guess those patches are not going to be
cherry-picked onto the clk-next branch, so this will keep failing
until it's rebased.  Is that right?

If so, I can turn off bisections on clk-next for now.  We need to
have a way in KernelCI to tell that a commit has been fixed to
cope with this kind of situation in general.

Thanks,
Guillaume
