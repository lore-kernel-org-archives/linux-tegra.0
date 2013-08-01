From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V3] ARM: dts: tegra114: dalmore: fix the irq trigger type
 of Palmas MFD device
Date: Thu, 01 Aug 2013 12:17:57 -0600
Message-ID: <51FAA655.7090409@wwwdotorg.org>
References: <1375349865-29816-1-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1375349865-29816-1-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 08/01/2013 03:37 AM, Joseph Lo wrote:
> The IRQ trigger type of Palmas MFD device (tps65913) is designed as
> low-level sensitive on Dalmore. The wrong configuration would cause an
> interrupt storm when booting the system. Fixing it in DT with appropriate
> interrupt type.

I have applied this to Tegra's for-3.12/dt branch.
