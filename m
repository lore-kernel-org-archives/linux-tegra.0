From: Liam Girdwood <lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>
Subject: Re: [alsa-devel] [PATCH 1/7] ASoC: WM8903: Fix mic detection
 register definitions
Date: Sun, 13 Feb 2011 16:21:47 +0000
Message-ID: <1297614107.3436.23.camel@odin>
References: <1297377439-27382-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1297377439-27382-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, 2011-02-10 at 15:37 -0700, Stephen Warren wrote:
> * There is no hysteresis enable field in the current datasheet.
> * Mic detection threshold field is only 2 bits wide.
> 
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---

All

Acked-by: Liam Girdwood <lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>
-- 
Freelance Developer, SlimLogic Ltd
ASoC and Voltage Regulator Maintainer.
http://www.slimlogic.co.uk

--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
