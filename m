From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH v2 2/6] ASoC: Allow the DAPM routes to be stored in
 device tree
Date: Tue, 13 Dec 2011 09:32:55 +0800
Message-ID: <20111213013253.GA15314@opensource.wolfsonmicro.com>
References: <1323291510-22338-1-git-send-email-swarren@nvidia.com>
 <1323291510-22338-2-git-send-email-swarren@nvidia.com>
 <20111208043149.GA31372@opensource.wolfsonmicro.com>
 <74CDBE0F657A3D45AFBB94109FB122FF17518605B1@HQMAIL01.nvidia.com>
 <20111210124921.GA20568@opensource.wolfsonmicro.com>
 <4EE65128.2090209@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4EE65128.2090209-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org" <alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Dec 12, 2011 at 12:08:24PM -0700, Stephen Warren wrote:

> So, does the following sound reasonable:

> Add:

> snd_soc_of_parse_card_name(struct snd_soc_card *card,
> 			   const char *prop);

> .. and have the machine driver call that whenever it decides, rather
> than having e.g. snd_soc_register_card() call it.

Yes, all this sounds good.
