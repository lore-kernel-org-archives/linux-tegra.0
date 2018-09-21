From: Mikko Perttunen <cyndis@kapsi.fi>
Subject: Re: [PATCH 3/9] soc/tegra: pmc: Add wake event support
Date: Fri, 21 Sep 2018 19:35:59 +0900
Message-ID: <62b40f71-a731-24d5-14c9-c3bdb4305695@kapsi.fi>
References: <20180921102546.12745-1-thierry.reding@gmail.com>
 <20180921102546.12745-4-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180921102546.12745-4-thierry.reding@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 21/09/2018 19.25, Thierry Reding wrote:
> ...
> +	/* route wake to tier 2 (XXX conditionally enable this) */
> +	value = readl(pmc->wake + WAKE_AOWAKE_TIER2_CTRL);
> +	writel(0x1, pmc->wake + WAKE_AOWAKE_TIER2_CTRL);

This doesn't seem right

Cheers,
Mikko
