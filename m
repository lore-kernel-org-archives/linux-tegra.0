From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: Enable clock debugfs support
Date: Tue, 17 Sep 2013 14:06:26 -0600
Message-ID: <5238B642.8090505@wwwdotorg.org>
References: <1378195515-28807-1-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1378195515-28807-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 09/03/2013 02:05 AM, Thierry Reding wrote:
> It's sometimes useful to look at the clock tree to verify that clocks
> for the various devices have been properly setup. The clock subsystem's
> debugfs support provides a neat set of files for that purpose.

I have squashed this patch into Tegra's for-3.13/defconfig branch.
