From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH V3] ARM: tegra: Define Tegra20 CAR binding
Date: Wed, 15 Feb 2012 13:42:31 -0800
Message-ID: <CAPnjgZ1Qoiv09qX7bgQRgfchTNafrxF=-NM9590abAx64a5z+g@mail.gmail.com>
References: <1329329667-26725-1-git-send-email-swarren@nvidia.com>
	<CAPnjgZ32TD_P4Pa650Y1MpxryxSOMtJHdJB28ZNFxv4hxqGMRA@mail.gmail.com>
	<74CDBE0F657A3D45AFBB94109FB122FF178FACB8D6@HQMAIL01.nvidia.com>
	<CAPnjgZ0VGt4+aY4ck9kjRycY+k_UyzRBxAbDD1V_O=MTyOpiCQ@mail.gmail.com>
	<74CDBE0F657A3D45AFBB94109FB122FF178FACB957@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF178FACB957-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Stephen,

On Wed, Feb 15, 2012 at 1:30 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> Simon Glass wrote at Wednesday, February 15, 2012 1:25 PM:
>> On Wed, Feb 15, 2012 at 11:14 AM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>> > Simon Glass wrote at Wednesday, February 15, 2012 11:45 AM:
>> >> On Wed, Feb 15, 2012 at 10:14 AM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>> >> > The Tegra20 CAR (Clock And Reset) Controller controls most aspects of
>> >> > most clocks within Tegra20. The device tree binding models this as a
>> >> > single monolithic clock provider, which exports ~130 clocks. This reduces
>> >> > the number of nodes needed in device tree to represent these clocks.
>> >> >
>> >> > This binding is only useful for Tegra20; the set of clocks that exists on
>> >> > Tegra30 is sufficiently different to merit its own binding.
>> >>
>> >> It seems there is a large common element - they are almost backwards
>> >> compatible. Should we not at least look at this now?
>> >
>> > I don't believe there's any need for the clock IDs for the two chips to
>> > align in any way. These are two different chips, with different sets of
>> > clocks, different tegra*.dtsi files, different clock "drivers" that define
>> > the available clocks, etc.
>> >
>> > And while as you say, there are a lot of similarities, there are also a
>> > number of differences within these first 96 clocks which make having
>> > things completely aligned impractical. I imagine you'd rather that
>> > Tegra30's binding follow Tegra30's CLK_OUT_ENB register layouts exactly,
>> > rather than attempting to align with Tegra20 even in the face of
>> > differences in HW.
>>
>> OK my question was really more about how you deal with multi-arch in
>> Linux / U-Boot. Does it make sense to ignore the commonality. Perhaps
>> instead the range from 96 to 160 should be reserved?
>
> I'm having a hard time seeing the problem here; the correct mapping from
> device tree clock ID values to clock objects will be selected based on
> the SoC version you're running on; there's no need to try and tie the
> clock IDs for the two SoCs together, and there's always a way to know
> which SoC version's numbering you should be dealing with at runtime.

At present in U-Boot we have exactly the same clock code for T20 and
T30, and the header file differences are in the reserved bits. I am
pointing this out in case it is of interest. But I think you are aware
of it, so please go ahead with the binding as you have it. So:

Acked-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>


diff -u ./arch/arm/include/asm/arch-tegra2/clock-tables.h
./arch/arm/include/asm/arch-tegra3/clock-tables.h
 /* The clocks supported by the hardware */
 enum periph_id {
 	PERIPH_ID_FIRST,
 	PERIPH_ID_CPU = PERIPH_ID_FIRST,
-	PERIPH_ID_RESERVED1,
-	PERIPH_ID_RESERVED2,
-	PERIPH_ID_AC97,
-	PERIPH_ID_RTC,
+	PERIPH_ID_COP,
+	PERIPH_ID_TRIGSYS,
+	PERIPH_ID_RESERVED3,
+	PERIPH_ID_RESERVED4,
 	PERIPH_ID_TMR,
 	PERIPH_ID_UART1,
 	PERIPH_ID_UART2,
@@ -50,7 +53,7 @@
 	PERIPH_ID_SDMMC4,

 	/* 16 */
-	PERIPH_ID_TWC,
+	PERIPH_ID_RESERVED16,
 	PERIPH_ID_PWM,
 	PERIPH_ID_I2S2,
 	PERIPH_ID_EPP,
@@ -61,12 +64,12 @@

 	/* 24 */
 	PERIPH_ID_3D,
-	PERIPH_ID_IDE,
+	PERIPH_ID_RESERVED24,
 	PERIPH_ID_DISP2,
 	PERIPH_ID_DISP1,
 	PERIPH_ID_HOST1X,
 	PERIPH_ID_VCP,
-	PERIPH_ID_RESERVED30,
+	PERIPH_ID_I2S0,
 	PERIPH_ID_CACHE2,

 	/* Middle word: 63:32 */
@@ -83,9 +86,9 @@
 	PERIPH_ID_KFUSE,
 	PERIPH_ID_SBC1,
 	PERIPH_ID_SNOR,
-	PERIPH_ID_SPI1,
+	PERIPH_ID_RESERVED43,
 	PERIPH_ID_SBC2,
-	PERIPH_ID_XIO,
+	PERIPH_ID_RESERVED45,
 	PERIPH_ID_SBC3,
 	PERIPH_ID_DVC_I2C,

@@ -122,17 +125,17 @@
 	/* 72 */
 	PERIPH_ID_AFI,
 	PERIPH_ID_CORESIGHT,
-	PERIPH_ID_RESERVED74,
+	PERIPH_ID_PCIEXCLK,
 	PERIPH_ID_AVPUCQ,
 	PERIPH_ID_RESERVED76,
 	PERIPH_ID_RESERVED77,
 	PERIPH_ID_RESERVED78,
-	PERIPH_ID_RESERVED79,
+	PERIPH_ID_DTV,

 	/* 80 */
-	PERIPH_ID_RESERVED80,
-	PERIPH_ID_RESERVED81,
-	PERIPH_ID_RESERVED82,
+	PERIPH_ID_NANDSPEED,
+	PERIPH_ID_I2CSLOW,
+	PERIPH_ID_DSIB,
 	PERIPH_ID_RESERVED83,
 	PERIPH_ID_IRAMA,
 	PERIPH_ID_IRAMB,
@@ -141,7 +144,76 @@

 	/* 88 */
 	PERIPH_ID_CRAM2,
...extra T30 things

Regards,
Simon

>
> --
> nvpublic
>
