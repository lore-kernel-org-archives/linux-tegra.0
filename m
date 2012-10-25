From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V2] ARM: dt: tegra: ventana: define pinmux for ddc
Date: Thu, 25 Oct 2012 14:41:25 -0600
Message-ID: <5089A3F5.40005@wwwdotorg.org>
References: <1351147951-19706-1-git-send-email-markz@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1351147951-19706-1-git-send-email-markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/25/2012 12:52 AM, Mark Zhang wrote:
> Tegra 2's I2C2 controller can be routed to either the PTA
> or DDC pin group on Ventana. So:
> - Remove the HDMI function definition of pta pingroup
> - Define child i2c adapters(ddc & pta) for I2C2 controller

Thanks, this looks good now.

I've applied it to Tegra's for-3.8/dt branch for now, although I may
have to shuffle things around (or just rename that branch) depending on
exactly what patches we end up with to enable tegradrm.
