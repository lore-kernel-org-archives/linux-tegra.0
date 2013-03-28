From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/2] clk: tegra: Export peripheral reset functions
Date: Thu, 28 Mar 2013 17:23:10 -0600
Message-ID: <5154D0DE.8050600@wwwdotorg.org>
References: <1364502688-5135-1-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1364502688-5135-1-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 03/28/2013 02:31 PM, Thierry Reding wrote:
> The tegra_periph_reset_assert() and tegra_periph_reset_deassert()
> functions can be used by drivers to reset peripherals. In order to allow
> such drivers to be built as modules, export the functions.
> 
> Note that this restores the status quo as the functions were exported
> before the move to the drivers/clk tree.

Hopefully soon we can replace these with the new module reset API that's
being cooked up. But this should do for now.

Peter, Prashant, can you please review this series too?
