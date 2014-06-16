From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 0/3] Use Tegra's microsecond counter for udelay()
Date: Mon, 16 Jun 2014 12:52:10 -0600
Message-ID: <539F3CDA.407@wwwdotorg.org>
References: <1402588713-18766-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1402588713-18766-1-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Paul Gortmaker <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 06/12/2014 09:58 AM, Peter De Schrijver wrote:
> This patchset introduces support for Tegra's microsecond counter as the
> udelay() timer. This is useful on Tegra SoCs which do not have an arch timer
> such as Tegra20 and Tegra30. Using the microsecond counter instead of a delay
> based loop avoids potential problems during cpu frequency changes.
> 
> The set consists of 3 patches:
> 
> Patch 1 introduces a new call which is used by the ARM architecture delay
> timer code to prevent changing the delay timer after calibration is finished
> and thus can be in use.
> 
> Patch 2 adds logic to choose the delay timer with the highest resolution. This
> allows the same registration code to be used on all Tegra SoCs and yet use the
> higher resolution arch timer when available (eg on Tegra114 or Tegra124).
> 
> Patch 3 adds the actual delay timer code.
> 
> Patch set has been verified on ventana (Tegra20), beaver (Tegra30),
> dalmore (Tegra114) and jetson TK1 (Tegra124).

I've applied this series to Tegra's for-3.17/delay-timer branch.
