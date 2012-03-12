From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 2/2] arm/tegra: add timeout to PCIe PLL lock detection
 loop
Date: Mon, 12 Mar 2012 12:09:43 -0600
Message-ID: <4F5E3BE7.4080207@wwwdotorg.org>
References: <20120306201538.GA14350@rainbow> <1331287760-10546-1-git-send-email-mad_soft@inbox.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1331287760-10546-1-git-send-email-mad_soft-aPYA7nAdAYY@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Artamonow <mad_soft-aPYA7nAdAYY@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andi <andi.shyti-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/09/2012 03:09 AM, Dmitry Artamonow wrote:
> Tegra PCIe driver waits for PLL to lock using busy loop.
> If PLL fails to lock for some reason, this leads to silent lockup
> while booting (PCIe code is not modular).
> 
> Fix by adding timeout, so if PLL doesn't lock in a couple
> of seconds, just PCIe driver fails and machine continues to boot.
> 
> Signed-off-by: Dmitry Artamonow <mad_soft-aPYA7nAdAYY@public.gmane.org>

> diff --git a/arch/arm/mach-tegra/pcie.c b/arch/arm/mach-tegra/pcie.c

>  	/* Wait for the PLL to lock */
> +	timeout = 2000;
>  	do {
>  		val = pads_readl(PADS_PLL_CTL);
> +		usleep_range(1000, 1000);
> +		if (--timeout == 0) {
> +			pr_err("Tegra PCIe error: timeout waiting for PLL\n");
> +			return -EBUSY;
> +		}
>  	} while (!(val & PADS_PLL_CTL_LOCKDET));

Thierry pointed out that one of NVIDIA's downstream kernels uses a
timeout of 300 here, rather than 2000 above. Do you see a specific need
for this timeout for be 2000 rather than 300? It might be nice to be
consistent.

Olof, I notice you've already applied V1 of this, which has the return
statement issue. Can you replace it with this, or should Dmitry send an
incremental patch?
