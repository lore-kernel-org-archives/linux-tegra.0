From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v4 01/14] dmaengine: tegra-apb: Fix use-after-free
Date: Tue, 14 Jan 2020 15:09:51 +0000
Message-ID: <4c1b9e48-5468-0c03-2108-158ee814eea8@nvidia.com>
References: <20200112173006.29863-1-digetx@gmail.com>
 <20200112173006.29863-2-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200112173006.29863-2-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vinod Koul <vkoul-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 12/01/2020 17:29, Dmitry Osipenko wrote:
> I was doing some experiments with I2C and noticed that Tegra APB DMA
> driver crashes sometime after I2C DMA transfer termination. The crash
> happens because tegra_dma_terminate_all() bails out immediately if pending
> list is empty, thus it doesn't release the half-completed descriptors
> which are getting re-used before ISR tasklet kicks-in.

Can you elaborate a bit more on how these are getting re-used? What is
the sequence of events which results in the panic? I believe that this
was also reported in the past [0] and so I don't doubt there is an issue
here, but would like to completely understand this.

Thanks!
Jon

[0] https://lore.kernel.org/patchwork/patch/675349/

-- 
nvpublic
