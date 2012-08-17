From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: dt: tegra: harmony: add regulators
Date: Fri, 17 Aug 2012 13:27:05 -0600
Message-ID: <502E9B09.3080800@wwwdotorg.org>
References: <1345186799-18229-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1345186799-18229-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 08/17/2012 12:59 AM, Laxman Dewangan wrote:
> Harmony uses a TPS6586x regulator. Instantiate this, and hook up a
> couple of fixed GPIO-controlled regulators too.
> 
> Based on Ventana regulator patch by Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> and converted to Harmony.

Thanks, applied to Tegra's for-3.7/dt branch.
