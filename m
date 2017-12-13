From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 0/3] NVIDIA Tegra AHB DMA controller driver
Date: Wed, 13 Dec 2017 06:41:31 +0300
Message-ID: <46cae715-ca15-05ba-93b5-2705c9e48d42@gmail.com>
References: <cover.1507073384.git.digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1507073384.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 04.10.2017 02:58, Dmitry Osipenko wrote:
> NVIDIA Tegra20/30 SoC's have AHB DMA controller. It has 4 DMA channels,
> supports AHB <-> Memory and Memory <-> Memory transfers, slave / master
> modes. This driver is primarily supposed to be used by gpu/host1x in a
> master mode, performing 3D HW context stores.

A brief update.. it looks like that we won't need to store 3D HW context, turned
out that context uploading is by an order of magnitude faster than the storing.
So it means that there is no user for the DMA driver and I'm pausing the work on
it. I've made v3 that I think is in a very good shape and may come handy later,
but for now I'll keep it conserved. Thanks to everyone for the awesome reviews!
