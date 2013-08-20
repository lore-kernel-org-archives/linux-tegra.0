From: Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: configure power off for Dalmore
Date: Tue, 20 Aug 2013 16:57:40 -0700
Message-ID: <87r4dnj4p7.fsf@kernel.org>
References: <1376930650-6078-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1376930650-6078-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> (Stephen
	Warren's message of "Mon, 19 Aug 2013 10:44:10 -0600")
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bill Huang <bilhuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> writes:

> From: Bill Huang <bilhuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> Add DT property to tell the regulator to register pm_power_off to make
> "shutdown" work.
>
> Signed-off-by: Bill Huang <bilhuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> arm-soc folk,
>
> This patch showed up a little late to include in the Tegra pull requests,
> but it's simple and useful enough I'd like to see it included in v3.12 if
> possible. Could you possibly apply it to whichever branch you have/will
> apply Tegra's tegra-for-3.12-dt pull request to, after the pull request
> is applied? Thanks.

Applied to next/dt just after the Tegra DT pull request.

Thanks for the detailed explanaton.

Kevin
