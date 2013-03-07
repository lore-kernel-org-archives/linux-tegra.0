From: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH V2 3/3] get_maintainer: prevent keywords from matching
 filenames
Date: Wed, 06 Mar 2013 22:55:11 -0800
Message-ID: <1362639311.5290.28.camel@joe-AO722>
References: <1362616141-13947-1-git-send-email-swarren@wwwdotorg.org>
	 <1362616141-13947-3-git-send-email-swarren@wwwdotorg.org>
	 <1362616252.2093.37.camel@joe-AO722> <5137E09E.1060006@wwwdotorg.org>
	 <1362616810.2093.40.camel@joe-AO722> <51383800.7000608@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <51383800.7000608-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>, Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, 2013-03-06 at 23:47 -0700, Stephen Warren wrote:
> On 03/06/2013 05:40 PM, Joe Perches wrote:
> > Which is why I showed the whole thing in a single patch.
> > No worries if it's simply to increase the patch count...
> 
> I'm not sure what showed refers to?

The changes I posted with the suggestion
https://lkml.org/lkml/2013/3/6/468

> I guess if I squashed /everything/ into a single commit (i.e. the change
> to the Tegra section in MAINTAINERS too) then there wouldn't be any
> bisect issues. I really don't care about patch count. The reason for >1
> patch is that there's often push-back if doing logically separate things
> (adding N: feature, modifying a MAINTAINERS entry to use it, removing
> part of K: feature) in a single patch...

Not from me anyway.

I think it's a single logical change and
it's trivial too.

No worries whatever happens.
