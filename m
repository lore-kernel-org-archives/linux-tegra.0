From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 2/9] arm/tegra: use APB DMA for accessing APB devices
Date: Wed, 4 Jan 2012 15:39:20 -0800
Message-ID: <CAOesGMjWAMsUtCxwAkaVp24jRMgYREJd_C6figuB4NW1aerd3Q@mail.gmail.com>
References: <1324599468-12845-1-git-send-email-olof@lixom.net>
	<1324599468-12845-3-git-send-email-olof@lixom.net>
	<74CDBE0F657A3D45AFBB94109FB122FF17761F14F6@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF17761F14F6-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Jan 4, 2012 at 2:08 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wro=
te:
> Olof Johansson wrote at Thursday, December 22, 2011 5:18 PM:
>> Tegra2 hangs if APB registers are accessed from the cpu during an
>> apb dma operation. The workaround is to use apb dma to read/write th=
e
>> registers instead.
> ...
>> diff --git a/arch/arm/mach-tegra/apbio.c b/arch/arm/mach-tegra/apbio=
=2Ec
> ...
>> +bool tegra_apb_init(void)
>> +{
> ...
>> +out:
>> + =A0 =A0 mutex_unlock(&tegra_apb_dma_lock);
>> + =A0 =A0 return true;
>> +
>> +out_fail:
>> + =A0 =A0 mutex_unlock(&tegra_apb_dma_lock);
>> + =A0 =A0 return true;
>
> Presumably that should be "return false".

Yes, my bad. There's an accidental chunk in a later patch that swaps
it back to false that got squashed with the wrong patch.

>
>> +u32 tegra_apb_readl(unsigned long offset)
>> +{
>> + =A0 =A0 struct tegra_dma_req req;
>> + =A0 =A0 int ret;
>> +
>> + =A0 =A0 if (!tegra_apb_dma && !tegra_apb_init())
>> + =A0 =A0 =A0 =A0 =A0 =A0 return readl(IO_TO_VIRT(offset));
>> +
>> + =A0 =A0 mutex_lock(&tegra_apb_dma_lock);
>> + =A0 =A0 req.complete =3D apb_dma_complete;
>> + =A0 =A0 req.to_memory =3D 1;
>> + =A0 =A0 req.dest_addr =3D tegra_apb_bb_phys;
>> + =A0 =A0 req.dest_bus_width =3D 32;
>> + =A0 =A0 req.dest_wrap =3D 1;
>> + =A0 =A0 req.source_addr =3D offset;
>> + =A0 =A0 req.source_bus_width =3D 32;
>> + =A0 =A0 req.source_wrap =3D 4;
>> + =A0 =A0 req.req_sel =3D 0;
>
> Should that be TEGRA_DMA_REQ_SEL_CNTR instead of 0? Although I'm not
> sure what "CNTR" means, and the documentation doesn't seem to say.

Sure, will update.

>> + =A0 =A0 req.size =3D 4;
>> +
>> + =A0 =A0 INIT_COMPLETION(tegra_apb_wait);
>> +
>> + =A0 =A0 tegra_dma_enqueue_req(tegra_apb_dma, &req);
>> +
>> + =A0 =A0 ret =3D wait_for_completion_timeout(&tegra_apb_wait,
>> + =A0 =A0 =A0 =A0 =A0 =A0 msecs_to_jiffies(50));
>> +
>> + =A0 =A0 if (WARN(ret =3D=3D 0, "apb read dma timed out"))
>> + =A0 =A0 =A0 =A0 =A0 =A0 *(u32 *)tegra_apb_bb =3D 0;
>
> On failure, you should probably call tegra_dma_dequeue_req() to cance=
l
> the DMA request, otherwise (a) it'll wake up and trash some future
> transfer, or (b) it'll be in the queue forever, and prevent any futur=
e
> DMA requests from being programmed into HW.
>
> Those two comments repeated from tegra_apb_writel().

Good point, will update.


-Olof
