From: Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1] ARM: tegra: Correct PL310 Auxiliary Control Register initialization
Date: Fri, 13 Mar 2020 11:05:14 +0100
Message-ID: <CABr+WTka7KirNLT=ZptxxZ+L-ZoNKfKwL7RrjZR=ksZh0MAPwg@mail.gmail.com>
References: <20200313090104.20750-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200313090104.20750-1-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Le ven. 13 mars 2020 =C3=A0 10:02, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> a =C3=
=A9crit :
>
> The PL310 Auxiliary Control Register shouldn't have the "Full line of
> zero" optimization bit being set before L2 cache is enabled. The L2X0
> driver takes care of enabling the optimization by itself.
>
> This patch fixes a noisy error message on Tegra20 and Tegra30 telling
> that cache optimization is erroneously enabled without enabling it for
> the CPU:
>
>         L2C-310: enabling full line of zeros but not enabled in Cortex-A9
>
> Cc: <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Tested-by: Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

This was tested on paz00 (tegra20).
Also tested that suspend still works.

Thanks for fixing this long standing issue!

--=20
-

Nicolas (kwizart)
