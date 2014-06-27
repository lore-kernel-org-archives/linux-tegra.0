From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [RFC 0/5] Per-user clock constraints
Date: Fri, 27 Jun 2014 16:30:08 -0600
Message-ID: <53ADF070.8050002@wwwdotorg.org>
References: <1403855872-14749-1-git-send-email-tomeu.vizoso@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1403855872-14749-1-git-send-email-tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rabin Vincent <rabin.vincent-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 06/27/2014 01:57 AM, Tomeu Vizoso wrote:
> Hi,
> 
> I'm retaking Rabin's patches [0] for splitting the clk API in two: one API for
> clk consumers and another for providers. The consumer API uses a clk structure
> that just keeps track of the consumer and has a reference to the actual
> clk_core struct, which is used internally.
> 
> I have kept a patch from Rabin that aims to aid in debugging nested
> enable/disable calls, though my personal aim is to allow more than one consumer
> to influence the final, effective rate. For now this is limited to setting
> floor and ceiling constraints.
> 
> For those functions in the consumer clk API that were called from providers, I
> have added variants to clk-provider.h that are the same only that accept a
> clk_core instead. In this first version of the patchset, these functions are
> prepended with two underscores and have the _internal suffix at the end. Mike
> has stated his preference of not prefixing with underscores any public API and
> I agree with him, but we still need a way to distinguish e.g. clk_set_parent()
> in the provider API from that in the consumer API (and from the lock-less
> variant in clk-provider.h!).

The name clk_provider_set_rate would be a good hint that it's an API for
clock providers not consumers.

The name clk_core_set_rate would be a good hint that the function takes
a clk_core object rather than the clk (client) object.

Neither names see too unwieldy to me.

Anyway, that's the color of my bikeshed:-)
