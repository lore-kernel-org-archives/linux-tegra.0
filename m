From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH v2] ARM: regulator: tps6586x: add PFM/PWM options on SMs
Date: Thu, 21 Apr 2011 10:58:18 +0100
Message-ID: <20110421095817.GA11788@opensource.wolfsonmicro.com>
References: <1303334725-5519-1-git-send-email-yelin@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1303334725-5519-1-git-send-email-yelin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yen Lin <yelin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org, lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, xxie-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Apr 20, 2011 at 02:25:25PM -0700, Yen Lin wrote:
> TPS6586x SM0, SM1 and SM2 port have 2 power switching modes:
>     - PWM only, or
>     - PMW-PFM auto mode
> 
> Some of TPS6586x have voltage spike in PFM-to-FWM transition which
> can lockup the CPU if PWM-PFM auto mode is chosen.

Acked-by: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
