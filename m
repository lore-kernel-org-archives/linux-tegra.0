From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: defconfig updates
Date: Wed, 15 Aug 2012 11:48:34 -0600
Message-ID: <502BE0F2.7080903@wwwdotorg.org>
References: <1345052375-13374-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1345052375-13374-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 08/15/2012 11:39 AM, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Removed:
> 
> * MACH_HARMONY
> * MACH_PAZ00
> * MACH_TRIMSLICE
> 
>   These used to enable board support for individual boards. Now that we
>   only support device tree, these options have been removed.
> 
> Added:
> 
> * TEGRA_PCI
> 
>   This used to be selected by the board options above. Select this
>   explicitly now that the board options have been removed.
> 
> * TEGRA_DEBUG_UART_AUTO_ODMDATA
> 
>   This makes the kernel automatically pick a UART for earlyprintk. It's
>   likely to be a useful option for everyone.
> 
> * PWM
> * PWM_TEGRA
> 
>   Enable the new PWM subsystem, and the Tegra driver within it.
> 
> * GPIO_PCA953X
> * GPIO_PCA953X_IRQ
> * MFD_MAX8907
> * REGULATOR_MAX8907
> * RTC_DRV_MAX8907
> 
>   Various drivers required for the Whistler board.

I went ahead and applied this immediately to Tegra's for-3.7/defconfig.
If anyone objects, I can easily pull it out or rework it.
