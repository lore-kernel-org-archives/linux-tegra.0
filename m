From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] clk: add table lookup to mux
Date: Tue, 12 Mar 2013 12:53:46 -0600
Message-ID: <513F79BA.7000608@wwwdotorg.org>
References: <1363113747-6572-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1363113747-6572-1-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/12/2013 12:42 PM, Peter De Schrijver wrote:
> Add a table lookup feature to the mux clock. Also allow arbitrary masks
> instead of the width. This will be used by some clocks on Tegra114. Also
> adapt the tegra periph clk because it uses struct clk_mux directly.
> 
> Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> --
> Mike,
> 
> This is the same patch I posted before which implements a table lookup
> feature for the mux clock. I squashed both the changes to clk-mux.c and
> tegra/clk.h together in order to make the patch bisectable.

For the record in this thread, this is a dependency of the Tegra114
clock driver. Can this patch be added to a stable branch in the clk or
arm-soc trees, which I can merge before applying the Tegra114 clock
driver? Thanks.
