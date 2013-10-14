From: =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 15/27] gpu: host1x: Add support for Tegra114
Date: Mon, 14 Oct 2013 08:30:28 +0300
Message-ID: <525B8174.4000907@nvidia.com>
References: <1381134884-5816-1-git-send-email-treding@nvidia.com> <1381134884-5816-16-git-send-email-treding@nvidia.com> <525877F3.9070004@wwwdotorg.org> <20131012112443.GC22284@mithrandir>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131012112443.GC22284@mithrandir>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 12.10.2013 14:24, Thierry Reding wrote:
> Yeah, I don't like very much how this is currently done. I mean about
> half of this is actually duplicate code because of the static inline
> functions used for register defines. As discussed elsewhere this was
> originally meant to be used for coverage testing, but nobody's done
> anything like that as far as I know. I'm also not convinced that these
> would be very useful in coverage testing, but adding Terje on Cc and
> unless he or anyone else has any (strong) objections I'll go and remove
> the duplicate definitions and while at it see if I can come up with a
> way to share more code/definitions between versions of host1x.
> 
> Do you see this as a blocker for 3.13 or can I do the cleanup after
> that? As far as I know Tegra124 has a more heavily modified version of
> host1x so implementing Tegra124 support might be a good opportunity to
> clean this up anyway.

For Tegra114 the register level changes are small (one channel added,
wait bases, expanded fifo, etc) but for Tegra124 they're bigger. So
let's keep the long term in mind.

I'm ok with removing the inlines. Just the energy spent in discussing it
over and over again is more than the benefits that a proper compiler
gives over the preprocessor (type checking, real syntax checking,
coverage, gdb breakpoints, etc). For some reason (which escapes me)
preprocessor magic seems to be the norm in Linux kernel.

Parameterized code gets easily really ugly, difficult to debug and
difficult to port to new chips. There's much less work and opportunity
of mistake in maintaining data in a couple of files than subtle
algorithms all over the driver. If we don't have inlines in hw headers,
the headers become tiny and any benefits of parameterized code versus
per-hw version headers vanish.

Terje
