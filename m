From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH] [3.3] ARM: tegra: use APB DMA for accessing APB devices
Date: Tue, 18 Oct 2011 13:15:40 -0700
Message-ID: <CAOesGMiVSRG+GhgPMKB99OFg7XyWwOxCOpvq0TU-gjRVo+Vgfg@mail.gmail.com>
References: <1318961898-21254-1-git-send-email-olof@lixom.net>
	<74CDBE0F657A3D45AFBB94109FB122FF173CA2CC0C@HQMAIL01.nvidia.com>
	<CAOesGMh8mFTkOgHwT-1HTA+XMdo36husYzwWOymL1CBz-mGiiA@mail.gmail.com>
	<74CDBE0F657A3D45AFBB94109FB122FF173CA2CC41@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF173CA2CC41-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Jon Mayo <jmayo-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Oct 18, 2011 at 12:28 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> Olof Johansson wrote at Tuesday, October 18, 2011 1:12 PM:
>>...
>> Also, I can't imagine a case where CONFIG_TEGRA_SYSTEM_DMA makes sense
>> to keep off. Can you? If so, I'm tempted to just kill it (in a
>> separate patch).
>
> I wondered about that too when I first saw that config option.
>
> Still, I don't think it's impossible to have a system where the DMA driver
> isn't useful; looking across a few kernels, I see it being used for:
>
> * Audio; I2S and SPDIF, not HD-audio
> * SPI (master and slave)
> * The tegra_hsuart driver (not sure what benefit that has over 8250.c...)

8250 generally can't handle the baud rates needed for bluetooth, etc.
The hsuart drivers have dma offload for that purpose (most arm
platforms tend to have similar setups).

> * This APB/fuse/DMA workaround
>
> All of which seem optional given the fourth one isn't required if DMA
> isn't used.

I guess it depends on what kind of granularity is worth it. But let's
keep it as an option for now.

-Olof
