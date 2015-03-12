From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] soc/tegra: move soc_device_register call out of arch/arm
Date: Thu, 12 Mar 2015 08:35:33 +0800
Message-ID: <5500DF55.3060900@nvidia.com>
References: <1425868301-22767-1-git-send-email-josephl@nvidia.com> <20150311162205.GK952@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150311162205.GK952-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?windows-1252?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Oops, sorry for typo. Thanks, Uwe.

On 03/12/2015 12:22 AM, Uwe Kleine-K=F6nig wrote:
> On Mon, Mar 09, 2015 at 10:31:41AM +0800, Joseph Lo wrote:
>> Expending the usage for both Tegra & Tegra64 SoCs.
> Expanding? Mabe better: Moving this code to drivers/soc/tegra allows =
the
> aarch64 SoCs to use it, too.
>
> Best regards
> Uwe
>
