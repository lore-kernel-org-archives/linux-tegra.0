From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 2/2] clk: tegra: Make gr2d and gr3d clocks children of
 pll_c
Date: Fri, 29 Mar 2013 15:46:44 -0600
Message-ID: <51560BC4.8020400@wwwdotorg.org>
References: <1364502688-5135-1-git-send-email-thierry.reding@avionic-design.de> <1364502688-5135-2-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1364502688-5135-2-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, =?ISO-8859-1?Q?Terje_Bergstr=F6?= =?ISO-8859-1?Q?m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 03/28/2013 02:31 PM, Thierry Reding wrote:
> By default these clocks are children of pll_m, but in downstream kernels
> they are reparented to pll_c. While at it, decrease their frequencies to
> 300 MHz because the defaults aren't in the specified range.
> 
> gr2d can reportedly run at much higher frequencies, but 300 MHz works
> and is a more conservative default.

Questions on this patch:

Do we need to do the same thing for Tegra30 and/or Tegra114?

Is 300MHz the right value?

I'm hoping that Peter, Prashant, and/or Terje can provide guidance here.
