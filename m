From: Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: Fix typo in conversion of ARCH_NR_GPIOS to Kconfig
Date: Fri, 13 Jan 2012 18:55:43 +0900
Message-ID: <CANqRtoRnLZewfcQ-ZNd0yGodq0-xia3ND4E9gQminU=fkyh0Mg@mail.gmail.com>
References: <1325795370-21576-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1325795370-21576-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Jan 6, 2012 at 5:29 AM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> Commit 44986ab "ARM: 7240/1: Make ARCH_NR_GPIO a Kconfig variable"
> spelled ARCH_NR_GPIOS as ARCH_NR_GPIO, hence making the change
> ineffective. This change fixes that.
>
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> This should probably go into 3.3 since the patch it fixes is there. I
> don't think this issue affects any Tegra platform, but I didn't investigate
> the other platforms that set CONFIG_ARCH_NR_GPIO by default now.

Thanks for this! We would like to see this included in 3.3 to fix
regressions on most ARM shmobile SoCs.

Acked-by: Magnus Damm <damm-yzvPICuk2ACczHhG9Qg4qA@public.gmane.org>
