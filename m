From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v1] clocksource: tegra: Add nvidia,tegra30-timer compat
Date: Mon, 03 Feb 2014 14:07:24 -0700
Message-ID: <52F0050C.6040108@wwwdotorg.org>
References: <1391203779-5676-1-git-send-email-achew@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1391203779-5676-1-git-send-email-achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, katierh-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 01/31/2014 02:29 PM, Andrew Chew wrote:
> There are some differences between tegra20's timer registers and tegra30's
> (and later).  For one thing, the watchdogs don't seem to be present in
> tegra20.  Add this compatibility string in order to be able to distinguish
> whether the watchdogs are there or not.

Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
