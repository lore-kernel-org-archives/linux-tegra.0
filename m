From: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH V2 3/3] get_maintainer: prevent keywords from matching
 filenames
Date: Wed, 06 Mar 2013 16:40:10 -0800
Message-ID: <1362616810.2093.40.camel@joe-AO722>
References: <1362616141-13947-1-git-send-email-swarren@wwwdotorg.org>
	 <1362616141-13947-3-git-send-email-swarren@wwwdotorg.org>
	 <1362616252.2093.37.camel@joe-AO722> <5137E09E.1060006@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5137E09E.1060006-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>, Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, 2013-03-06 at 17:34 -0700, Stephen Warren wrote:
> On 03/06/2013 05:30 PM, Joe Perches wrote:
> > On Wed, 2013-03-06 at 17:29 -0700, Stephen Warren wrote:
> >> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >>
> >> This reverts most of eb90d08 "get_maintainer: allow keywords to match
> >> filenames"; all except the parts that are required to implement the new
> >> N: entry type.
> > 
> > Just combine patches 1 and 3 into a single patch.
> 
> That would break bisectability; using MAINTAINERS after applying a
> squashed 1+3 but without patch 2 applied would not operate as desired.

<smile>

Which is why I showed the whole thing in a single patch.
No worries if it's simply to increase the patch count...

cheers, Joe
