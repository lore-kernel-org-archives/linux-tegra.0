From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: dma: rename driver name for clock to "tegra-apbdma".
Date: Tue, 26 Jun 2012 13:13:30 -0600
Message-ID: <4FEA09DA.7060308@wwwdotorg.org>
References: <1340695112-28270-1-git-send-email-ldewangan@nvidia.com> <1340695112-28270-2-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1340695112-28270-2-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 06/26/2012 01:18 AM, Laxman Dewangan wrote:
> Rename the driver name of the clock entry of Tegra APBDMA to
> tegra-apbdma from of tegra-dma.
> 
> This name is more aligned towards the movement of dmaengine based
> new DMA driver.

Thanks, applied to for-3.6/common-clk.

I removed the trailing period from the patch subject.
