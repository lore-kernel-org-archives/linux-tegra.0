From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: Tegra HDMI audio CTS register settings
Date: Tue, 15 Feb 2011 12:50:06 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF03112A51C4@HQMAIL01.nvidia.com>
References: <74CDBE0F657A3D45AFBB94109FB122FF03112A51BF@HQMAIL01.nvidia.com>
 <AANLkTik32F2Zted-9HaTcZucmLDFEX-p08+2kAZue4pw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTik32F2Zted-9HaTcZucmLDFEX-p08+2kAZue4pw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Erik Gilling <konkers-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Erik Gilling wrote:
> After fixing the programming in the patch you've referenced, I've not
> seen any issues with HDMI audio in either field tests for
> certification.  Those register settings came from the nvidia referenc=
e
> code.

Thanks for the quick response. I'll ask internally then.

> (p.s. I don't know which tree e47469d3fd is from... but it's not in
> any tree I have in my remotes.)

Perhaps that's the commit ID in ChromeOS. It's the following in
android-tegra-2.6.36:

67c58dfc7038e9fd360b148caa63fe31b0a0abc5

> On Tue, Feb 15, 2011 at 12:37 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> wrote:
> > Erik,
> >
> > Can you say how much testing drivers/video/tegra/dc/hdmi.c has had =
re:
> > audio-over-HDMI and in what context? I assume some, due to commits =
such
> as
> > e47469d3fd "video: tegra: fix HDMI audio programming".
> >
> > I ask because of the following code:
> >
> > =A0 =A0 =A0 =A0tegra_hdmi_writel(hdmi, SPARE_HW_CTS | SPARE_FORCE_S=
W_CTS |
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0SPARE_CTS_RESET_=
VAL(1),
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0HDMI_NV_PDISP_HD=
MI_SPARE);
> >
> > I had to remove SPARE_FORCE_SW_CTS from this register write to get
> > audio-over-HDMI working correctly.
> >
> > As I read the specs, HW_CTS tells the HW to calculate the CTS value
> itself.
> > Adding SW_CTS into the mix overrides this request, and requires SW =
to
> both
> > program the selected CTS value into a register *and* program regist=
er
> > HDMI_NV_PDISP_HDMI_ACR_CTRL to tell the HW how to determine the cur=
rent
> audio
> > sample rate, and the latter is not currently done.
> >
> > Can you comment any further?
> >
> > Thanks.
> >
> > --
> > nvpublic
> >
> >
> >
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" =
in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
