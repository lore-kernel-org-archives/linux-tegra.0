From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/2] dma: tegra20-apbdma: channel freeing correction
Date: Wed, 31 Oct 2012 20:18:31 +0530
Message-ID: <50913A3F.7080001@nvidia.com>
References: <1351433873-14082-1-git-send-email-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1351433873-14082-1-git-send-email-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org" <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Sunday 28 October 2012 07:47 PM, Dmitry Osipenko wrote:
> Fixed channel "lock" after free.
>
> Example: Channel 1 was allocated and prepared as slave_sg, used and freed. Now preparation of cyclic dma on channel 1 will fail with err "DMA
> configuration conflict" because tdc->isr_handler still selected to handle_once_dma_done.
>
> This happens because tegra_dma_abort_all() won't be called on channel freeing if pending list is empty.
>
> Signed-off-by: Dmitry Osipenko<digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Both patches looks good to me.

Acked-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
