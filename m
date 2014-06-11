From: Mikko Perttunen <mperttunen@nvidia.com>
Subject: Re: [PATCH v7 3/5] misc: fuse: Add efuse driver for Tegra
Date: Wed, 11 Jun 2014 15:47:31 +0300
Message-ID: <53984FE3.6010509@nvidia.com>
References: <1401973754-19701-1-git-send-email-pdeschrijver@nvidia.com> <1401973754-19701-4-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1401973754-19701-4-git-send-email-pdeschrijver@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Russell King <linux@arm.linux.org.uk>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Linus Walleij <linus.walleij@linaro.org>, Wolfram Sang <wsa@the-dreams.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On 05/06/14 16:09, Peter De Schrijver wrote:
...
> +int tegra_fuse_readl(u32 offset, u32 *val)
> +{
> +       if (!fuse_readl)
> +               return -ENXIO;
> +
> +       *val = fuse_readl(offset);
> +
> +       return 0;
> +}
> +

-EPROBE_DEFER would be a better error value, so that drivers can work 
even if they are initially probed before the fuse driver. Of course, if 
the fuse initialization is moved into machine init then this is a non-issue.
