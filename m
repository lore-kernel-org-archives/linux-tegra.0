From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH v1 0/3] Add support for LP3
Date: Tue, 31 Jan 2012 23:35:23 -0800
Message-ID: <20120201073523.GF7399@quad.lixom.net>
References: <1327594923-21822-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1327594923-21822-1-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Jan 26, 2012 at 06:22:00PM +0200, Peter De Schrijver wrote:
> Introduce support for LP3 (CPU core clockgating) for Tegra20 and Tegra30.
> 
> Peter De Schrijver (3):
>   ARM: tegra: definitions for flow controller
>   ARM: tegra: assembler code for LP3
>   ARM: tegra: cpuidle driver for tegra
> 
>  arch/arm/mach-tegra/Makefile   |    2 +
>  arch/arm/mach-tegra/cpuidle.c  |  107 ++++++++++++++++++++++++++++++++++++++++
>  arch/arm/mach-tegra/flowctrl.h |   37 ++++++++++++++
>  arch/arm/mach-tegra/sleep.S    |   91 ++++++++++++++++++++++++++++++++++
>  4 files changed, 237 insertions(+), 0 deletions(-)
>  create mode 100644 arch/arm/mach-tegra/cpuidle.c
>  create mode 100644 arch/arm/mach-tegra/flowctrl.h
>  create mode 100644 arch/arm/mach-tegra/sleep.S

Thanks, applied.
