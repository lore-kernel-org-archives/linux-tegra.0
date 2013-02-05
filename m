From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [GIT PULL 8/8] ARM: tegra: defconfig update
Date: Tue, 5 Feb 2013 13:26:04 -0800
Message-ID: <20130205212604.GA30719@quad.lixom.net>
References: <1359582159-28816-1-git-send-email-swarren@wwwdotorg.org>
 <1359582159-28816-8-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1359582159-28816-8-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Jan 30, 2013 at 02:42:39PM -0700, Stephen Warren wrote:
> Various new features are enabled on Tegra:
> * RTC_DRV_TPS6586X to enable the RTC on many boards, such as Harmony
>   and Ventana.
> * POWER_RESET_GPIO to provide a power off driver for TrimSlice.
> * Tegra KBC controller support, for Seaboard, Harmony, and Whistler.
> * Tegra high-speed UART driver, for Cardhu Bluetooth.
> * kexec support.
> 
> This pull request is based on v3.8-rc3.
> 
> ----------------------------------------------------------------
> 
> The following changes since commit 9931faca02c604c22335f5a935a501bb2ace6e20:
> 
>   Linux 3.8-rc3
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-tegra.git tegra-for-3.9-defconfig

Pulled in 1-4,6-8 (since 6 contains 5 and saved some conflicts).

There were a handful of conflicts during merge, please sanity-check the
contents in arm-soc.

Thanks!


-Olof
