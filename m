From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/8] ARM: tegra: support LP1 suspend mode
Date: Sat, 27 Jul 2013 22:29:23 +0400
Message-ID: <51F41183.5070305@gmail.com>
References: <1374830110-30685-1-git-send-email-josephl@nvidia.com> <2389689.JgQlW00RdN@ax5200p> <51F3F356.8080709@gmail.com> <4555938.6N2HxzJnNO@ax5200p> <51F410BE.3000904@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <51F410BE.3000904-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Cc: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

27.07.2013 22:26, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> It might be a known problem only for those who faced with it. Since i=
t's on
> their internal irc, it wasn't a known issue.
>=20
> It also would be interesting to know if suspend with thumb2 works cor=
rectly. On
> 3.8 I've ported lp0 suspend and it works fine with arm compiled kerne=
l, thumb2
> also works but only for about 5-10 hours (resuming on each 5-30 minut=
es, default
> android behavior) and after I'm getting pmd corruption. I have no ide=
a from
> where that corruption comes from without ability for hw debugging.
s/irc/bug tracker/ :)
