From: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [GIT PULL 2/3] ARM: tegra: move fuse code out of arch/arm
Date: Mon, 21 Jul 2014 17:14:06 +0100
Message-ID: <1405959246.5204.68.camel@hornet>
References: <1403558626-13422-1-git-send-email-swarren@wwwdotorg.org>
	 <1403558626-13422-2-git-send-email-swarren@wwwdotorg.org>
	 <20140707004417.GE8469@quad.lixom.net>
	 <20140708134359.GA23218@tbergstrom-lnx.Nvidia.com>
	 <CAOesGMhoqvqf-dktp-OfUNTPLahPwkyAPiTeDngr4QjH=VfOGA@mail.gmail.com>
	 <53C88A4C.3070304@wwwdotorg.org>
	 <CAOesGMh+zLV781wzdR5=_Bpzh+XMwJfWL-5XMDP6DwG_Hg80kw@mail.gmail.com>
	 <53CD2C58.6060601@wwwdotorg.org> <20140721155451.GF32578@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140721155451.GF32578-5wv7dgnIgG8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org" <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, 2014-07-21 at 16:54 +0100, Catalin Marinas wrote:
> We have a similar issue with arm64 vexpress (well, just on the model)
> where vexpress_sysreg_init() is a core_initcall (should be fine as
> arch_initcall) as it needs to be done before of_platform_populate().
> Pawel on cc should know more of the history here.

In case of vexpress the trick was to squeeze everything into the device
model. Once this was done, there was enough initcall levels to get all
dependencies sorted. The device model is good. We seemed to have learne=
d
to abuse it claiming that "things must be initialised early", while in =
9
out of 10 cases they don't have to be "that early"...

> I recall there were also some discussions about a SoC driver model wh=
ich
> hangs off the top compatible string in the DT (e.g. "arm,vexpress") a=
nd
> allow (minimal) code to be run slightly earlier, though still not
> earlier than arch_initcall.

This was just a loose idea:

http://thread.gmane.org/gmane.linux.ports.arm.kernel/204361/focus=3D204=
843

I still like it, and it seems logical to me. We've got a platform. It's
got a compatible string. We can write a driver for this platform that
does all magic at appropriate initcall level.

Pawe=C5=82
