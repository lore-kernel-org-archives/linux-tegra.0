From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 26/27] drm/tegra: Add DSI support
Date: Wed, 16 Oct 2013 10:58:44 -0600
Message-ID: <525EC5C4.7010809@wwwdotorg.org>
References: <1381134884-5816-1-git-send-email-treding@nvidia.com> <1381134884-5816-27-git-send-email-treding@nvidia.com> <52587F17.7060104@wwwdotorg.org> <20131014135548.GB16302@ulmo.nvidia.com> <525C3510.60802@wwwdotorg.org> <20131015083342.GH7856@ulmo.nvidia.com> <525D7983.6010001@wwwdotorg.org> <20131016084031.GB21963@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131016084031.GB21963-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/16/2013 02:40 AM, Thierry Reding wrote:
...
> Just to follow up with what we've discussed on IRC: I'll take a
> stab at refactoring the debugfs file output into something more
> generic that can possibly be leveraged by regmap as well. That
> should provide a somewhat more lightweight alternative to regmap
> for implementations that don't need regmap for anything else while
> at the same time providing something so not every driver has to
> come up with something custom.
> 
> Does that sum it up correctly?

Yes.
