From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v2] arm/tegra: use APB DMA for accessing APB devices
Date: Thu, 5 Jan 2012 14:07:32 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF17761F1812@HQMAIL01.nvidia.com>
References: <1324599468-12845-3-git-send-email-olof@lixom.net>
 <1325742554-32735-1-git-send-email-olof@lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1325742554-32735-1-git-send-email-olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: "ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Olof Johansson wrote at Wednesday, January 04, 2012 10:49 PM:
> Tegra2 hangs if APB registers are accessed from the cpu during an
> apb dma operation. The workaround is to use apb dma to read/write the
> registers instead.
...
> diff --git a/arch/arm/mach-tegra/apbio.c b/arch/arm/mach-tegra/apbio.c
...
> +u32 tegra_apb_readl(unsigned long offset)
...
> +	INIT_COMPLETION(tegra_apb_wait);
> +
> +	tegra_dma_enqueue_req(tegra_apb_dma, &req);
> +
> +	ret = wait_for_completion_timeout(&tegra_apb_wait,
> +		msecs_to_jiffies(50));
> +
> +	if (WARN(ret == 0, "apb read dma timed out")) {
> +		*(u32 *)tegra_apb_bb = 0;
> +		tegra_dma_dequeue_req(tegra_apb_dma, &req);

I think you need to swap those last two lines to make absolutely sure
that the timeout handling doesn't race with an actual DMA completion.

Otherwise,

Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

-- 
nvpublic
