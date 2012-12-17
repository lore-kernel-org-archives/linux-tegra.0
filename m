From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 2/4] ARM: tegra: add connection name for uart clock table
Date: Mon, 17 Dec 2012 14:44:19 -0700
Message-ID: <50CF9233.3010506@wwwdotorg.org>
References: <1355746101-15291-1-git-send-email-ldewangan@nvidia.com> <1355746101-15291-3-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1355746101-15291-3-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 12/17/2012 05:08 AM, Laxman Dewangan wrote:
> Add connection name "uart-clk" for the uart clock information.

Does the UART receive more than one clock, so that it actually cares
what the clock connection name is? If not, can we just drop this patch?
