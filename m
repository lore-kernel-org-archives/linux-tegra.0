From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v3 0/6] Port Tegra to generic clk framework
Date: Thu, 05 Jul 2012 12:49:39 -0600
Message-ID: <4FF5E1C3.6070309@wwwdotorg.org>
References: <1341482120-3317-1-git-send-email-pgaikwad@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1341482120-3317-1-git-send-email-pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: mturquette-l0cyMroinI0@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 07/05/2012 03:55 AM, Prashant Gaikwad wrote:
> This patch set ports Tegra clock code to generic clock framework.

Unfortunately, this series causes some regressions, so I can't apply it
now. Given that, it won't make 3.6 since I won't be around to apply it.

I tested both Tegra's for-next, and next-20120705, both plus this
series, next-20120705 plus the fix for the common clock code
__clk_set_parent() issue.

The following all appeared to work OK:

Cardhu DT
Ventana DT
Seaboard DT
Springbank DT
Harmony DT
Harmony non-DT

However, the following failed, all(?) in ways that prevented the system
getting to the login prompt:

Whistler DT
AC100 DT
AC100 non-DT
Trimslice DT
Trimslice non-DT

(The one slight difference between the 2 branches I tested is that AC100
and Trimslice booted using DT passed in next-20120705 but failed only in
Tegra's for-next. Otherwise, all results were identical)

I'll try to investigate what the issues are since I imagine you don't
have access to these boards. But, I probably won't be able to fix this
until I return from vacation.
