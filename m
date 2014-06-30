From: Rabin Vincent <rabin-66gdRtMMWGc@public.gmane.org>
Subject: Re: [RFC 4/5] clk: per-user clock accounting for debug
Date: Mon, 30 Jun 2014 21:49:49 +0200
Message-ID: <20140630194949.GB5167@dator>
References: <1403855872-14749-1-git-send-email-tomeu.vizoso@collabora.com>
 <1403855872-14749-5-git-send-email-tomeu.vizoso@collabora.com>
 <53ADF3C8.2060702@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <53ADF3C8.2060702-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Jun 27, 2014 at 04:44:24PM -0600, Stephen Warren wrote:
> On 06/27/2014 01:57 AM, Tomeu Vizoso wrote:
> >  struct clk {
> > -	struct clk_core clk;
> > +	struct clk_core	*core;
> > +	unsigned int	enable_count;
> > +	const char	*dev_id;
> > +	const char	*con_id;
> 
> Why not just store the "struct device *" there instead of pulling the
> name out of it, so ...

Probably because not all of the [of_]clk_get[_sys]() variants supply a
struct device *.
