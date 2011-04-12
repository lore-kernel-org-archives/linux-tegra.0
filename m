From: Sergei Shtylyov <sshtylyov-Igf4POYTYCDQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] ARM: Tegra: Harmony: Fix conflicting GPIO numbering
Date: Tue, 12 Apr 2011 15:12:43 +0400
Message-ID: <4DA433AB.4040508@ru.mvista.com>
References: <1302558541-19841-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1302558541-19841-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: ccross-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, konkers-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hello.

On 12-04-2011 1:49, Stephen Warren wrote:

> Currently, both the WM8903 and TPS6586x chips attempt to register with
> gpiolib using the same GPIO numbers. This causes the audio driver to
> fail to initialize.

> To solve this, add a define to board-harmony.h for the TPS6586x, and make
> oard-harmony-power.c use this define, instead of directly referencing
> TEGRA_NR_GPIOS.

> This fixes a regression introduced by commit
> 6f168f2fa60f87e85e0df25e87e2372f22f5eb7c.

    Please specify the commit's summary in parens -- for the human readers.

> Signed-off-by: Stephen Warren<swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

WBR, Sergei
