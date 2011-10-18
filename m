From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH] [3.3] ARM: tegra: use APB DMA for accessing APB devices
Date: Tue, 18 Oct 2011 11:55:04 -0700
Message-ID: <CAOesGMhN-h5P0mmYmCnRWrHw9qsUeSioj6X35r0CL=VnM3TNwQ@mail.gmail.com>
References: <1318961898-21254-1-git-send-email-olof@lixom.net>
	<CAMbhsRRPmd7jAMkbB_HBw-UeQi1W2-+n_qkhsfHfP6rSd01naw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMbhsRRPmd7jAMkbB_HBw-UeQi1W2-+n_qkhsfHfP6rSd01naw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jon Mayo <jmayo-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Oct 18, 2011 at 11:37 AM, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org> wrot=
e:
> On Tue, Oct 18, 2011 at 11:18 AM, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wro=
te:
>> From: Jon Mayo <jmayo-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> Tegra2 hangs if APB registers are accessed from the cpu during an
>> apb dma operation. The workaround is to use apb dma to read/write th=
e
>> registers instead.
>>
>> There is a dependency loop between fuses, clocks, and APBDMA. =A0If =
dma
>> is enabled, fuse reads must go through APBDMA to avoid corruption du=
e
>> to a hw bug. =A0APBDMA requires a clock to be enabled. =A0Clocks mus=
t read
>> a fuse to determine allowable cpu frequencies.
>>
>> Separate out the fuse DMA initialization, and allow the fuse read
>> and write functions to be called without using DMA before the DMA
>> initialization has been completed. =A0Access to the fuses before APB=
DMA
>> is initialized won't hit the hardware bug because nothing else can b=
e
>> using DMA.
>>
>> Original fuse registar access code from Varun Wadekar
>> <vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, improved by Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
>> and later moved to separate driver by Jon Mayo <jmayo-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>.
>>
>> Signed-off-by: Jon Mayo <jmayo-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> [olof: hooked up init calls to dma init, minor cleanups]
>> Signed-off-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
>> ---
>> =A0arch/arm/mach-tegra/Makefile | =A0 =A01 +
>> =A0arch/arm/mach-tegra/apbio.c =A0| =A0149 +++++++++++++++++++++++++=
+++++++++++++++++
>> =A0arch/arm/mach-tegra/apbio.h =A0| =A0 22 ++++++
>> =A0arch/arm/mach-tegra/dma.c =A0 =A0| =A0 =A04 +
>> =A04 files changed, 176 insertions(+), 0 deletions(-)
>> =A0create mode 100644 arch/arm/mach-tegra/apbio.c
>> =A0create mode 100644 arch/arm/mach-tegra/apbio.h
>>
> <snip>
>
>> diff --git a/arch/arm/mach-tegra/dma.c b/arch/arm/mach-tegra/dma.c
>> index c0cf967..b7b6957 100644
>> --- a/arch/arm/mach-tegra/dma.c
>> +++ b/arch/arm/mach-tegra/dma.c
>> @@ -33,6 +33,8 @@
>> =A0#include <mach/iomap.h>
>> =A0#include <mach/suspend.h>
>>
>> +#include "apbio.h"
>> +
>> =A0#define APB_DMA_GEN =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A00x000
>> =A0#define GEN_ENABLE =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 (1<<31)
>>
>> @@ -735,6 +737,8 @@ int __init tegra_dma_init(void)
>>
>> =A0 =A0 =A0 =A0tegra_dma_initialized =3D true;
>>
>> + =A0 =A0 =A0 tegra_init_apb_dma();
>> +
> It seems wrong for the dma api init to call init on one of the users
> of the dma api. =A0For explicit ordering dependencies like this, mayb=
e
> postcore_initcall is not the right way to trigger tegra_dma_init.

Yeah, it's not ideal but moving dma init to an explicit call isn't a
great solution either. Pick your poison. :)

Driver probe deferral should help here since it'll make it possible to
describe the dependencies.

Until that's merged, how about a big ugly comment saying:

/* FIXME: move apb_dma init to deferred driver probe model instead */



-Olof
