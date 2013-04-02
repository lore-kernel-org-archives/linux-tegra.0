From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/2] clk: tegra: Export peripheral reset functions
Date: Tue, 2 Apr 2013 12:34:26 +0300
Message-ID: <20130402093426.GZ18519@tbergstrom-lnx.Nvidia.com>
References: <1364502688-5135-1-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1364502688-5135-1-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Mar 28, 2013 at 09:31:27PM +0100, Thierry Reding wrote:
> The tegra_periph_reset_assert() and tegra_periph_reset_deassert()
> functions can be used by drivers to reset peripherals. In order to allow
> such drivers to be built as modules, export the functions.
> 
> Note that this restores the status quo as the functions were exported
> before the move to the drivers/clk tree.
> 

I guess we should move to the 'reset framework' at some point in the future?

Otherwise:

Acked-By: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>


Cheers,

Peter.
