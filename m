From: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] soc/tegra: pmc: Don't allocate struct tegra_powergate on
 stack
Date: Mon, 17 Apr 2017 11:20:35 +0530
Message-ID: <20170417055035.GI28191@vireshk-i7>
References: <3fe40fcd427e49cbeac31e14721fea569d230b6e.1490073884.git.viresh.kumar@linaro.org>
 <7d0425c1-de9a-cb1a-fde7-71e903579562@nvidia.com>
 <20170321103950.GS25659@vireshk-i7>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170321103950.GS25659@vireshk-i7>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 21-03-17, 16:09, Viresh Kumar wrote:
> On 21-03-17, 10:37, Jon Hunter wrote:
> > 
> > On 21/03/17 05:24, Viresh Kumar wrote:
> > > The size of the struct tegra_powergate is quite big and if any more
> > > fields are added to the internal genpd structure, following warnings are
> > > thrown:
> > > 
> > > drivers/soc/tegra/pmc.c:577:1: warning: the frame size of 1176 bytes is larger than 1024 bytes [-Wframe-larger-than=]
> > 
> > Hmmm ... AFAICT the size of the tegra_powergate struct is 312 bytes
> > (based upon next-20170321) and so it looks like something massive needs
> > to be added to the genpd struct to blow this up to over 1024 bytes. Are
> > there some genpd changes in-flight that are causing this?
> 
> https://marc.info/?l=linux-kernel&m=149000247329743&w=2
> 
> This is up for discussion right now though and we don't know if it
> will surely get merged or not.

@Jon: Regardless of the above series, do you want this patch to be merged as it
will still be better to avoid keeping large structures on stack.

Else I would be required to keep this in my above series from now on.

-- 
viresh
