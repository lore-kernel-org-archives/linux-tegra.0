From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: Tegra: Add smp_twd clock for Tegra20
Date: Thu, 13 Sep 2012 09:57:51 -0600
Message-ID: <5052027F.1000404@wwwdotorg.org>
References: <1347528873-3799-1-git-send-email-pgaikwad@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1347528873-3799-1-git-send-email-pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 09/13/2012 03:34 AM, Prashant Gaikwad wrote:
> Clockevent's frequency is changed upon cpufreq change
> notification. It fetches local timer's rate to update the
> clockevent frequency. This patch adds local timer clock
> for Tegra20.

Hmm. Off-list, I'd asked you to check whether this patch, and Mike's
twd/clk-notifier changes were OK for Tegra, and part of your reponse was:

Tegra20 (Ventana)
        Tegra's for-next (common clock) + smp_twd : Panic

Is that true? If so, I can't apply this patch...
