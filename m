From: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH RESEND] ARM: tegra114: correctly output clk_32k
Date: Fri, 31 May 2013 12:26:23 -0700
Message-ID: <20130531192623.21525.89041@quantum>
References: <1369536991-6111-1-git-send-email-acourbot@nvidia.com>
 <51A4CAF9.4000305@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <51A4CAF9.4000305-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Quoting Stephen Warren (2013-05-28 08:19:21)
> On 05/25/2013 08:56 PM, Alexandre Courbot wrote:
> > Tegra has a blink timer register that allows to modulate the
> > clk_32k clock before outputting it. Since clk_32k is presented to the
> > kernel as a fixed clock, make sure this register does not tamper with
> > the clock frequency and that clk_32k is outputted as-is, similarly to
> > what is done on t20 and t30.
> 
> The patch subject here should be "clk: tegra:" rather than "ARM:
> tegra114". I assume Mike can fix this up when applying it.

I fixed it up.  Been fixing up lots of s/ARM/clk/ lately.

Regards,
Mike
