From: Aapo Vienamo <avienamo@nvidia.com>
Subject: Re: [PATCH 1/3] clk: tegra: refactor 7.1 div calculation
Date: Wed, 4 Jul 2018 10:51:48 +0300
Message-ID: <20180704105148.1e32d307@dhcp-10-21-25-168>
References: <1530617721-5767-1-git-send-email-avienamo@nvidia.com>
        <46bc7178-f8a4-cc4e-ebe3-507671ffb735@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <46bc7178-f8a4-cc4e-ebe3-507671ffb735@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Geis <pgwipeout@gmail.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Tue, 3 Jul 2018 11:10:21 -0400
Peter Geis <pgwipeout@gmail.com> wrote:

> Good Morning,
> 
> Just a heads up.
> During compilation with your patches, I get the following warning:
> 
> In file included from ./arch/arm/include/asm/div64.h:127:0,
>                   from ./include/linux/kernel.h:174,
>                   from drivers/clk/tegra/div71.c:17:
> drivers/clk/tegra/div71.c: In function ‘div71_get’:
> ./include/asm-generic/div64.h:222:28: warning: comparison of distinct 
> pointer types lacks a cast
>    (void)(((typeof((n)) *)0) == ((uint64_t *)0)); \
>                              ^
> drivers/clk/tegra/div71.c:40:2: note: in expansion of macro ‘do_div’
>    do_div(divider_ux1, rate);
>    ^~~~~~
> 
> Very Respectfully,
> Peter Geis
> 
 
That's indeed true. Looks like this warning is produced only on 32-bit
arm as it uses a different variant of the do_div macro than arm64.

Thanks,
 -Aapo
