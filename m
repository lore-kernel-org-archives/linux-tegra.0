From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: Support reboot modes
Date: Wed, 07 May 2014 09:58:33 -0600
Message-ID: <536A5829.5030702@wwwdotorg.org>
References: <1399388651-12819-1-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1399388651-12819-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 05/06/2014 09:04 AM, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> The boot ROM on Tegra SoCs supports booting into forced recovery mode
> (RCM) by setting a bit in the PMC scratch register 0. Similarily, the
> Android bootloader examines some of the bits in this register to disable
> autoboot or enter recovery mode.
> 
> Support these modes by setting the corresponding bits depending on the
> specified reboot command (forced-recovery, bootloader, recovery). Recent
> systemd-based distributions allow this to be specified using an optional
> argument to the reboot command.

Applied to Tegra's for-3.16/soc branch.
