From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: dt: tegra: add Whistler device tree file
Date: Mon, 04 Jun 2012 11:55:39 -0600
Message-ID: <4FCCF69B.2050609@wwwdotorg.org>
References: <1337295233-14575-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1337295233-14575-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 05/17/2012 04:53 PM, Stephen Warren wrote:
> Whistler is a highly configurable Tegra evaluation and development board.
> This change adds support for the following specific configuration:
> 
> E1120 motherboard
> E1108 CPU board
> E1116 PMU board
> 
> The motherboard configuration switches are set as follows:
> SW1=0 SW2=0 SW3=5
> S1/S2/S3/S4 all on, except S3 7/8 are off.
> 
> Other combinations of daugher boards may work to varying degrees, but will
> likely require some SW adjustment.

Applied for 3.6.
