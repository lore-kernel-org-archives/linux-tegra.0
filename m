From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v3 1/2] pinctrl: tegra: Add MIPI pad control
Date: Wed, 10 Sep 2014 10:08:16 -0600
Message-ID: <54107770.708@wwwdotorg.org>
References: <54088B53.6040802@wwwdotorg.org> <1410292726-9179-1-git-send-email-seanpaul@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1410292726-9179-1-git-send-email-seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, davidriley-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 09/09/2014 01:58 PM, Sean Paul wrote:
> This patch adds MIPI CSI/DSIB pad control mux register
> from the APB misc block to tegra pinctrl.
>
> Without writing to this register, the dsib pads are
> muxed as csi, and cannot be used.
>
> The register is not yet documented in the TRM, here is
> the description:
>
> 70000820: APB_MISC_GP_MIPI_PAD_CTRL_0
> 	[31:02] RESERVED
> 	[01:01] DSIB_MODE       [CSI=0,DSIB=1]
> 	[00:00] RESERVED

These two patches look good to me.

I think we need to take both patches through the Tegra tree, since if 
the Tegra DTs start referencing the new pingroup, the driver must 
already know about it or it'll error out. So, I hope for an ack from Linus.

Of course, this only applies if you're sending patches to board .dts 
files to use the new feature for 3.18; if not, we can apply the pinctrl 
driver through the pinctrl tree instead, and wait until 3.19 to use the 
new pingroup. I assume you'll want to use the new feature soon though:-)
