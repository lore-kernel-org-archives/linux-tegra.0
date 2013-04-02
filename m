From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2] clk: tegra: Make gr2d and gr3d clocks children of
 pll_c
Date: Tue, 02 Apr 2013 10:09:39 -0600
Message-ID: <515B02C3.9080309@wwwdotorg.org>
References: <1364912324-5576-1-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1364912324-5576-1-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, =?ISO-8859-1?Q?Terje_Bergst?= =?ISO-8859-1?Q?r=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 04/02/2013 08:18 AM, Thierry Reding wrote:
> By default these clocks are children of pll_m, but in downstream kernels
> they are reparented to pll_c. While at it, decrease their frequencies to
> 300 MHz because the defaults aren't in the specified range.
> 
> gr2d can reportedly run at much higher frequencies, but 300 MHz works
> and is a more conservative default.

Applied to Tegra's for-3.10/clk branch. I assumed that Peter's and
Mike's acks carried over to V2.
