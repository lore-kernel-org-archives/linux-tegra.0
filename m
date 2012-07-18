From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] ASoC: tegra: use dmaengine based dma driver
Date: Wed, 18 Jul 2012 14:29:19 +0530
Message-ID: <50067AE7.5090501@nvidia.com>
References: <1340969673-7776-1-git-send-email-ldewangan@nvidia.com> <1340969673-7776-2-git-send-email-ldewangan@nvidia.com> <4FEDDF89.1050907@wwwdotorg.org> <4FEF166D.2010705@nvidia.com> <4FF15B16.9020903@nvidia.com> <4FF1D00D.6040402@wwwdotorg.org> <20120702164717.GH25093@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120702164717.GH25093-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "tiwai-l3A5Bk7waGM@public.gmane.org" <tiwai-l3A5Bk7waGM@public.gmane.org>, "perex-/Fr2/VpizcU@public.gmane.org" <perex-/Fr2/VpizcU@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "lrg-l0cyMroinI0@public.gmane.org" <lrg-l0cyMroinI0@public.gmane.org>, "alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org" <alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Monday 02 July 2012 10:17 PM, Mark Brown wrote:
> * PGP Signed by an unknown key
>
> On Mon, Jul 02, 2012 at 10:45:01AM -0600, Stephen Warren wrote:
>
>> to work. No audio is heard, and aplay eventually exits with the
>> following error message:
> For values of eventually that will be about 10s by default.
>
>> aplay: pcm_write:1603: write error: Input/output error
>> I believe this means that the DMA simply isn't operating.
> Yes, normally.

Just for record and update on this mail, the issue was in dma driver 
where it was not enabling the dma clock.
By luck, it was working on Tegra30 because it was getting enabled in 
somewhere may be in uboot or default power-on ON.
Fixed the issue with patch
[PATCH] dma: tegra: enable/disable dma clock
