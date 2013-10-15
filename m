From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 02/13] ARM: tegra: Enable LVDS and HDMI on Cardhu
Date: Tue, 15 Oct 2013 14:39:35 -0600
Message-ID: <525DA807.4010500@wwwdotorg.org>
References: <1381850883-12722-1-git-send-email-treding@nvidia.com> <1381850883-12722-3-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381850883-12722-3-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/15/2013 09:27 AM, Thierry Reding wrote:
> Add backlight and panel nodes for the Cardhu 10.1" WXGA TFT LCD panel
> and enable the HDMI output and hotplug detection.
> 
> Note that HDMI doesn't work for some reason and I haven't found out why
> yet. I remember someone reporting that it worked at some point in time
> using this set of nodes but that no longer seems to be the case. Running
> the same kernel on Beaver has working HDMI, though.

I'm hesitant to apply this, since we know HDMI doesn't work. Wouldn't it
be better to just enable the panel, and hold off on HDMI until we've
located the problem?

On the panel side, have the DT bindings been acked by both DT
maintainers and both bindings and driver by someone involved in CDF. I
worry that since the simple panel framework overlaps with CDF's goals,
that people will be upset if we create some alternative to it. Still,
there's a lot to be said for code that exists and works right now, so I
hope there won't be any issue here, but it'd be good to be sure.
