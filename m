From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V2 3/4] ARM: tegra: convert device tree files to use GPIO
 defines
Date: Mon, 20 May 2013 11:47:21 -0600
Message-ID: <519A61A9.2040407@wwwdotorg.org>
References: <1369069845-7601-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1369069845-7601-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 05/20/2013 11:10 AM, Stephen Warren wrote:
> Use TEGRA_GPIO() macro to name all GPIOs referenced by GPIO properties,
> and some interrupts properties. Use standard GPIO flag defines too.

Applied (along with the reset of the series) to Tegra's for-3.11/dt branch.
