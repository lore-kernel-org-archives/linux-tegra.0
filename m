From: Rabin Vincent <rabin-66gdRtMMWGc@public.gmane.org>
Subject: Re: [RFC 3/5] clk: use struct clk only for external API
Date: Mon, 30 Jun 2014 21:43:46 +0200
Message-ID: <20140630194311.GA5167@dator>
References: <1403855872-14749-1-git-send-email-tomeu.vizoso@collabora.com>
 <1403855872-14749-4-git-send-email-tomeu.vizoso@collabora.com>
 <53ADF239.9050008@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <53ADF239.9050008-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Jun 27, 2014 at 04:37:45PM -0600, Stephen Warren wrote:
> On 06/27/2014 01:57 AM, Tomeu Vizoso wrote:
> > +struct clk {
> > +	struct clk_core clk;
> > +};
> 
> I'm confused why that field isn't a pointer instead.

It becomes a pointer in the following patch.

It's been a while since I created these patches, but IIRC I split it
this way because this patch was large and touching several drivers and
thus I wanted to make it do just the rename and keep core changes to a
minimum.  Such as step may not be needed with Tomeu's series since it's
organized differently.
