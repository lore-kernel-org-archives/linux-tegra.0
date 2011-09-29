From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH v5 2/3] arm/tegra: add support for ventana pinmuxing
Date: Thu, 29 Sep 2011 08:47:10 -0700
Message-ID: <CAOesGMhyV3tDUn=mErN-Yq79wy_01wM9S-9Aw7FVJtrqtGXJLw@mail.gmail.com>
References: <1317248978-10829-1-git-send-email-pdeschrijver@nvidia.com>
	<1317248978-10829-3-git-send-email-pdeschrijver@nvidia.com>
	<20110929092951.GE23944@n2100.arm.linux.org.uk>
	<20110929152752.GO21166@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110929152752.GO21166-Rysk9IDjsxmJz7etNGeUX8VPkgjIgRvpAL8bYrjMMd8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Sep 29, 2011 at 8:27 AM, Peter De Schrijver
<pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> On Thu, Sep 29, 2011 at 11:29:51AM +0200, Russell King - ARM Linux wr=
ote:
>> On Thu, Sep 29, 2011 at 01:29:35AM +0300, Peter De Schrijver wrote:
>> > diff --git a/arch/arm/mach-tegra/Makefile b/arch/arm/mach-tegra/Ma=
kefile
>> > index f11b910..91a07e1 100644
>> > --- a/arch/arm/mach-tegra/Makefile
>> > +++ b/arch/arm/mach-tegra/Makefile
>> > @@ -31,6 +31,7 @@ obj-${CONFIG_MACH_SEABOARD} =A0 =A0 =A0 =A0 =A0 =
=A0 +=3D board-seaboard-pinmux.o
>> >
>> > =A0obj-${CONFIG_MACH_TEGRA_DT} =A0 =A0 =A0 =A0 =A0 =A0 +=3D board-=
dt.o
>> > =A0obj-${CONFIG_MACH_TEGRA_DT} =A0 =A0 =A0 =A0 =A0 =A0 +=3D board-=
harmony-pinmux.o
>> > +obj-${CONFIG_MACH_TEGRA_DT} =A0 =A0 =A0 =A0 =A0 =A0 +=3D board-se=
aboard-pinmux.o
>>
>> Since when did Tegra start using braces instead of parens in its Mak=
efile?
>> I note some of Tegra's makefile is using braces and some of it paren=
s.
>> What's the reason for this alternative style to the rest of kbuild?
>
> I have no idea. I just followed the style used for the other CONFIG_M=
ACH_TEGRA_DT entries. Colin or Olof, any idea?


=46rom git logs, it looks like the first harmony board file that came
from Colin used braces, and from there it's likely that everyone just
copied and pasted -- I know that's what I did.

Thanks for catching it, Russell, it had obviously completely gone
unnoticed by me and others.

I'll fix up the rest of the file. Peter -- no need to respin, I'll fix
up when I apply.


-Olof
