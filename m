From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: tegra: add CPU errata WARs to Tegra reset handler
Date: Wed, 06 Mar 2013 13:29:51 -0700
Message-ID: <5137A73F.7090705@wwwdotorg.org>
References: <1362441957-22050-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1362441957-22050-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Bo Yan <byan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 03/04/2013 05:05 PM, Stephen Warren wrote:
> The CPU cores in Tegra contain some errata. Workarounds must be applied
> for these every time a CPU boots. Implement those workarounds directly
> in the Tegra-specific CPU reset vector.
> 
> Many of these workarounds duplicate code in the core ARM kernel.
> 
> However, the core ARM kernel cannot enable those workarounds when
> building a multi-platform kernel, since they require writing to secure-
> only registers, and a multi-platform kernel often does not run in secure
> mode, and also cannot generically/architecturally detect whether it is
> running in secure mode, and hence cannot either unconditionally or
> conditionally apply these workarounds.
> 
> Instead, the workarounds must be applied in architecture-specific reset
> code, which is able to have more direct knowledge of the secure/normal
> state. On Tegra, we will be able to detect this using a non-architected
> register in the future, although we currently assume the kernel runs only
> in secure mode. Other SoCs may never run the kernel in secure mode, and
> hence always rely on a secure monitor to enable the workarounds, and
> hence never implement them in the kernel.

I have applied this series to Tegra's for-3.10/fixes branch.
