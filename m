From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH v1 3/3] ARM: tegra: cpuidle driver for tegra
Date: Tue, 31 Jan 2012 23:35:10 -0800
Message-ID: <20120201073510.GE7399@quad.lixom.net>
References: <1327594923-21822-1-git-send-email-pdeschrijver@nvidia.com>
 <1327594923-21822-4-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1327594923-21822-4-git-send-email-pdeschrijver@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Colin Cross <ccross@android.com>, Stephen Warren <swarren@nvidia.com>, Russell King <linux@arm.linux.org.uk>, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Jan 26, 2012 at 06:22:03PM +0200, Peter De Schrijver wrote:
> CPUidle driver for tegra. In this version only LP3 (clockgating) is supported.
> 
> Based on work by:
> 
> Colin Cross <ccross@android.com>
> Gary King <gking@nvidia.com>
> 
> Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> ---
>  arch/arm/mach-tegra/Makefile  |    2 +
>  arch/arm/mach-tegra/cpuidle.c |  107 +++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 109 insertions(+), 0 deletions(-)
>  create mode 100644 arch/arm/mach-tegra/cpuidle.c
> 
> diff --git a/arch/arm/mach-tegra/Makefile b/arch/arm/mach-tegra/Makefile
> index b78bda8..c06c280 100644
> --- a/arch/arm/mach-tegra/Makefile
> +++ b/arch/arm/mach-tegra/Makefile
> @@ -6,6 +6,8 @@ obj-y                                   += irq.o
>  obj-y                                   += clock.o
>  obj-y                                   += timer.o
>  obj-y					+= fuse.o
> +obj-y					+= cpuidle.o
> +obj-y					+= sleep.o

Nit: Not much use in building this if CONFIG_CPU_IDLE is off. Feel free to fix
that up in a new patch.


-Olof
