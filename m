From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH 3/6] ASoC: WM8903: Fix mic detection issues
Date: Thu, 3 Feb 2011 22:38:01 +0000
Message-ID: <20110203223800.GB4586@opensource.wolfsonmicro.com>
References: <1296766578-13988-1-git-send-email-swarren@nvidia.com>
 <1296766578-13988-3-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1296766578-13988-3-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Feb 03, 2011 at 01:56:15PM -0700, Stephen Warren wrote:
> wm8903.h:
> * There is no hysteresis enable field in the current datasheet.
> * Mic detection threshold field is only 2 bits wide.
> 
> wm8903.c:
> * Mic detection HW should be enabled if SW wants either mic detection or
>   short detection, rather than only when it wants both.

Please don't combine unrelated changes into a single patch, especially
in cases like this where one is a bug fix and the other is essentially a
cosmetic fixup.
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
