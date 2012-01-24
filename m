From: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: Define Tegra20 CAR binding
Date: Tue, 24 Jan 2012 14:32:32 -0800
Message-ID: <CAMbhsRQYt7RoXTDDPxCgGG2UX5_T86saOyns_0f_Sz-p7-gMTw@mail.gmail.com>
References: <1326342789-5781-12-git-send-email-sjg@chromium.org>
	<1326932212-30346-1-git-send-email-swarren@nvidia.com>
	<20120124095241.GO10446@tbergstrom-lnx.Nvidia.com>
	<74CDBE0F657A3D45AFBB94109FB122FF178CB81EC4@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF178CB81EC4-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Jan 24, 2012 at 2:08 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wr=
ote:
> Peter De Schrijver wrote at Tuesday, January 24, 2012 2:53 AM:
>> What about the peripheral resets which are also handled by CAR? Peri=
pheral
>> clock nodes also offer assert and deassert methods for the reset sig=
nal
>> associated with them. Those methods are used when powergating domain=
s for
>> example. Should we model this in the same binding?
>
> In most cases, I think the resets are handled purely within clock ena=
ble
> and disable, so there's no need to explicitly manage them or represen=
t
> them in the device tree. Do you agree here?

clk_enable could force a deasserted reset, but clk_disable cannot
imply asserting reset.  The clocks need to be turned off for power
management without resetting the registers.

> I recall that you mentioned some power-management code might need to
> manage reset separately though. Can you explain why a module would be
> reset separately from disabling the clocks though?

The TRM lists a very specific sequence of clocks, resets, clamps, and
power for power domain gating.  Other than that, I think the only use
for directly calling reset that ended up in the Android Tegra2 tree
was for error recovery on HW blocks that could get locked up, probably
I2C.

> If we do need this, I think we can just add a property to the node of
> each device that needs such explicit management. Something like:
>
> tegra_car: clock@60006000 {
> =A0 =A0compatible =3D "nvidia,tegra20-car";
> =A0 =A0....
> };
>
> foo@70007000 {
> =A0 =A0compatible =3D "nvidia,tegra20-foo";
> =A0 =A0regs =3D <...>;
> =A0 =A0nvidia,car-reset-id =3D <&tegra_car 30>;
> };
>
> And the driver for "foo" can ignore cell 0, and extract the cell 1 an=
d
> pass the value to tegra_periph_reset_assert().
>
> I'd expect to put the CAR phandle into the property in case we ever g=
et
> a more generalized reset subsystem, and need more general code to
> interpret the property. I did the same for the Tegra APB DMA controll=
er
> client binding where clients need to know the "DMA select" value.
>
> Does that all seem reasonable?
>
> --
> nvpublic
>
