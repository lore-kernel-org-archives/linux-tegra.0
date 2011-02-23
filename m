From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH v2] ARM: Tegra: Make tegra_dma_init a postcore_initcall
Date: Wed, 23 Feb 2011 11:26:33 -0800
Message-ID: <AANLkTikan_3pEcVO082+-fh7BdZK2PzFB5M=bAAE_iQ8@mail.gmail.com>
References: <1298482889-21841-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1298482889-21841-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Feb 23, 2011 at 9:41 AM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> The following commit makes the Tegra APB DMA engine fail to initialize
> correctly: 0cf6230af909a86f81907455eca2a5c9b8f68fe6
> ARM: tegra: Move tegra_common_init to tegra_init_early
>
> The reason is that tegra_init_early_ calls tegra_dma_init which calls
> request_threaded_irq, which fails since the IRQ hasn't yet been marked
> valid; that only happens in tegra_init_irq, which gets called after
> tegra_init_early.
>
> This used to work OK, since tegra_init_early was tegra_common_init, which
> got called after tegra_init_irq, basically from the beginning of
> tegra_harmony_init.
>
> Solve this by converting tegra_dma_init to a postcore_initcall. This makes
> it execute late enough that IRQs are marked valid, and avoids having to
> add it back to every machine's init function.
>
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Acked-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
