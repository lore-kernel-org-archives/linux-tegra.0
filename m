From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: tegra: paz00: Add LVDS support to device tree
Date: Mon, 06 Jan 2014 12:38:20 -0700
Message-ID: <52CB062C.50802@wwwdotorg.org>
References: <f03a644deb858f10affb7b039f9982bac81b02c9.1387656959.git.marvin24@gmx.de> <bcf12ecec69ef4e38e74a9be9c45e8bd2bd9ffcc.1387656959.git.marvin24@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bcf12ecec69ef4e38e74a9be9c45e8bd2bd9ffcc.1387656959.git.marvin24-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Cc: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 12/21/2013 01:38 PM, Marc Dietrich wrote:
> Add backlight and panel nodes for the PAZ00 TFT LCD panel.
> 
> Signed-off-by: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
> ---
> This should enable everything needed. Unfortunately, in my tests it only switches on the
> backlight, but the display controller blocks in some infinit loop, so we get no output
> (and no working system). I post it here in case I missed something obvious...

As mentioned later on, this works fine with U-Boot (and tests fine here
too), so I plan to apply this for 3.15, once I can.
