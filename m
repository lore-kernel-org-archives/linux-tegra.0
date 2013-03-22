From: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] clk: tegra: Allow PLLE training to succeed
Date: Fri, 22 Mar 2013 13:48:22 -0700
Message-ID: <20130322204822.834.98314@quantum>
References: <1363274825-2439-1-git-send-email-thierry.reding@avionic-design.de>
 <51437655.1030008@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <51437655.1030008-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Quoting Stephen Warren (2013-03-15 12:28:21)
> On 03/14/2013 09:27 AM, Thierry Reding wrote:
> > Under some circumstances the PLLE needs to be retrained, in which case
> > access to the PMC registers is required. Fix this by passing a pointer
> > to the PMC registers instead of NULL when registering the PLLE clock.
> 
> Mike, I believe this patch is appropriate as a fix for v3.9. I assume
> you'll take it through the clock tree? Thanks.

Does this patch fix a crash or a documented failure?  Linus is being
more strict about taking fixes in the -rc cycles these days and knowing
exactly what behavior this fixes would be beneficial.

Thanks,
Mike
