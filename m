From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: Re: Tegra board file deprecation schedule
Date: Sat, 28 Apr 2012 23:26:21 +0200
Message-ID: <1335648381.13148.4.camel@antimon>
References: <4F9B0E7C.1060408@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4F9B0E7C.1060408-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, ARM kernel mailing list <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Am Freitag, den 27.04.2012, 15:24 -0600 schrieb Stephen Warren:
> Eventually, Tegra support will become device tree only in the mainline
> kernel; arch/arm/mach-tegra/board* will be deleted.
> 
> I propose the following policy towards this goal: I'd like to maintain
> the board files until the relevant device tree file has the same level
> of functionality. Once that is achieved, and a Linus kernel is release
> with full support for the board via device tree, the board files can be
> deleted from the next kernel release.
> 
> Does anyone have any issues with this?

Do we have any way to describe the clocks in the device tree? I'm
planning to add support for the Toradex Colibri T20 processor module,
which uses a 13MHz external OSC, so the generic clock init in the
current dt code definitely won't work for this board.

Thanks,
Lucas
