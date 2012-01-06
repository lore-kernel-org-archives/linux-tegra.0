From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH v2] arm/tegra: use APB DMA for accessing APB devices
Date: Thu, 5 Jan 2012 17:22:27 -0800
Message-ID: <CAOesGMg7GbEeMXAsftq+eZuqEOTLgeufePSC3h4mKn1cVnuEWQ@mail.gmail.com>
References: <1324599468-12845-3-git-send-email-olof@lixom.net>
	<1325742554-32735-1-git-send-email-olof@lixom.net>
	<74CDBE0F657A3D45AFBB94109FB122FF17761F1812@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF17761F1812-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Jan 5, 2012 at 2:07 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wro=
te:
> Olof Johansson wrote at Wednesday, January 04, 2012 10:49 PM:
>> Tegra2 hangs if APB registers are accessed from the cpu during an
>> apb dma operation. The workaround is to use apb dma to read/write th=
e
>> registers instead.
> ...
>> diff --git a/arch/arm/mach-tegra/apbio.c b/arch/arm/mach-tegra/apbio=
=2Ec
> ...
>> +u32 tegra_apb_readl(unsigned long offset)
> ...
>> + =A0 =A0 INIT_COMPLETION(tegra_apb_wait);
>> +
>> + =A0 =A0 tegra_dma_enqueue_req(tegra_apb_dma, &req);
>> +
>> + =A0 =A0 ret =3D wait_for_completion_timeout(&tegra_apb_wait,
>> + =A0 =A0 =A0 =A0 =A0 =A0 msecs_to_jiffies(50));
>> +
>> + =A0 =A0 if (WARN(ret =3D=3D 0, "apb read dma timed out")) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 *(u32 *)tegra_apb_bb =3D 0;
>> + =A0 =A0 =A0 =A0 =A0 =A0 tegra_dma_dequeue_req(tegra_apb_dma, &req)=
;
>
> I think you need to swap those last two lines to make absolutely sure
> that the timeout handling doesn't race with an actual DMA completion.

Ah, of course. Fixing that without reposting.


> Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Thanks!

-Olof
