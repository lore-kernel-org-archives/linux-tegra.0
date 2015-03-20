From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: trusted_foundations: Maintain CPU endianness
Date: Fri, 20 Mar 2015 19:41:37 +0300
Message-ID: <550C4DC1.3090909@gmail.com>
References: <1426865807-22981-1-git-send-email-digetx@gmail.com> <550C45AB.3070703@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <550C45AB.3070703-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

20.03.2015 19:07, Stephen Warren =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> On 03/20/2015 09:36 AM, Dmitry Osipenko wrote:
>> Convert CPU reset vector address to LE to support big-endian kernel.
>
> Naively this sounds a little odd; the value here is in a CPU register=
 all the
> time, not in memory, so I'm not sure why endianness is relevant? Pres=
umably the
> CPU doesn't end up byte-swapping values in registers when running in =
BE mode or
> it takes an SMC? If it does, why don't we need
> cpu_to_le32(TF_SET_CPU_BOOT_ADDR_SMC) too?
>
> Sorry if this is a silly question; I haven't followed any of the BE k=
ernel patches.

You absolutely right. I goofed it by replacing 'smc' with 'str' without=
 adding=20
reg reverse for BE when was testing and then blindly made patch. Please=
 ignore=20
it and sorry for the noise.

--=20
Dmitry
