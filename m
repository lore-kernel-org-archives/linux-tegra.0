From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: harmony: fix ldo7 regulator-name
Date: Thu, 20 Sep 2012 19:55:09 -0700
Message-ID: <20120921025509.GA19276@quad.lixom.net>
References: <1348176039-6094-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1348176039-6094-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Sep 20, 2012 at 03:20:39PM -0600, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> On Harmony, LDO7 does not feed vdd_fuse. Correct the regulator name.
> This issue was probably the result of copying Ventana's regulator setup
> when creating the Harmony .dts file. No other naming issues appear to
> exist.
> 
> Reported-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Arnd, Olof, any chance you could roll this into arm-soc directly rather than
> my sending another pull request? Or, I can re-do my today's dt2 pull request
> with this added if it makes it easier. Thanks.
> 
> I don't expect any more patches to show up for Tegra for 3.7, unless they're
> bug-fixes for issues I haven't noticed yet.

Sure, applied to next/cleanup, since that's where the regulator code was added
(through board-removal).


-Olof
