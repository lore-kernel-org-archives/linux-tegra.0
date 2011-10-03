From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH] ARM: tegra: Make earlyprintk choose a UART at runtime.
Date: Mon, 3 Oct 2011 13:03:00 -0700
Message-ID: <CAD=FV=WxqKX62vM4r=qtQKVmNKbNP2u4jXd35iF4raveOudUqA@mail.gmail.com>
References: <1317061425-1030-1-git-send-email-dianders@chromium.org>
	<74CDBE0F657A3D45AFBB94109FB122FF173A2C6B44@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF173A2C6B44@HQMAIL01.nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@nvidia.com>
Cc: Olof Johansson <olof@lixom.net>, Colin Cross <ccross@android.com>, Erik Gilling <konkers@android.com>, Russell King <linux@arm.linux.org.uk>, Tony Lindgren <tony@atomide.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Jeremy Kerr <jeremy.kerr@canonical.com>, Simon Glass <sjg@chromium.org>, Allen Martin <AMartin@nvidia.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

Stephen,

OK, thanks for testing!  I will rev the patch and resend in a little bi=
t.

-Doug

---

On Fri, Sep 30, 2011 at 3:11 PM, Stephen Warren <swarren@nvidia.com> wr=
ote:
> Doug Anderson wrote at Monday, September 26, 2011 12:24 PM:
>> With this change we automatically detect which UART to use for
>> earlyprintk (and for printing during decompression). =A0The
>> detection involves coordination with the bootloader: it's expected
>> that the bootloader will leave a 'D' (for [D]ebug) in the UART
>> scratchpad register for whichever UART we should use for debugging.
>
> This works fine on Tegra20; there, even if the UART clock is off and/=
or
> the UART is in reset, you can still read the UART_SCR register (and g=
et
> a bogus value) without the system hanging.
>
> However, I just tested on Tegra30, and the behavior has changed; if e=
ither
> a UART is in reset /or/ the UART clock is stopped, then the system ha=
ngs
> when UART_SCR is read.
>
> As such, this change will cause Tegra30 to fail to boot. I'd rather i=
t
> was augmented to check the clock enable and module reset bits as well
> as the scratch register value in all cases.
>
> Yes, I know mainline doesn't support Tegra30 yet, but we're very clos=
e
> to posting the first few patches to start enabling it, and I wouldn't
> want to break it right before that!
>
> --
> nvpublic
>
>
