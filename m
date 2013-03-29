From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/2] clk: tegra: Export peripheral reset functions
Date: Fri, 29 Mar 2013 09:34:35 -0600
Message-ID: <5155B48B.8010905@wwwdotorg.org>
References: <1364502688-5135-1-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1364502688-5135-1-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/28/2013 02:31 PM, Thierry Reding wrote:
> The tegra_periph_reset_assert() and tegra_periph_reset_deassert()
> functions can be used by drivers to reset peripherals. In order to allow
> such drivers to be built as modules, export the functions.
> 
> Note that this restores the status quo as the functions were exported
> before the move to the drivers/clk tree.

Mike,

Since I'm taking the Tegra CCF changes through the Tegra tree for this
kernel cycle, do you want me to wait for your ack on these small fixes,
or just go ahead and apply them?

Similarly, I assume you want to review/ack the Tegra114 clock driver
that Peter posted? If not, do let me know, since I'm currently waiting
for that. (Although I know Peter will post a V9 with minor fixes, but
99% of any review should still be applicable)

Thanks.
