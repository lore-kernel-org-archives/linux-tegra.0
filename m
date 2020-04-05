From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/4] of: reserved-memory: Various improvements
Date: Sat, 4 Apr 2020 19:24:25 -0600
Message-ID: <CAL_JsqLsCHJOuYBdh33eouu3VhwYzv5XR5wop8QAAi4jXP2xcQ@mail.gmail.com>
References: <20200403185640.118569-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200403185640.118569-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Apr 3, 2020 at 12:56 PM Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> Hi Rob, all,
>
> this is a set of patches that I've been working on to allow me to use
> reserved memory regions more flexibly. One of the use-cases that I have
> is an external memory controller driver that gets passed one or two
> tables from firmware containing a set of EMC frequencies and the
> corresponding register values to program for these frequencies.
>
> One of these tables is the "nominal" table and an optional second table
> is "derated" and is used when the DRAM chips are overheating. I want to
> be able to pass these tables as separate memory-region entries.
>
> So what this small patchset does is make the reserved-memory code adapt
> to this situation better. On one hand, while the DT bindings currently
> support multiple regions per device tree node, it's slightly unintuitive
> to specify them. The first patch adds a memory-region-names property
> that allows the DT to specify a "consumer" name for these regions much
> like we do for things like clocks, resets or the reg property. At the
> same time, a new alias for memory-region, named memory-regions, is
> introduced to make this more consistent with other bindings.

It's just not worth supporting both flavors (forever). I don't want to
repeat gpio vs. gpios. Let's just stick with 'memory-region' and allow
that to be more than one entry.

I'm not a fan of *-names, but fine.

Rob
