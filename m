From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] soc: tegra: pmc: restrict compilation of suspend-related
 support to ARM
Date: Thu, 08 Jan 2015 12:42:47 +0300
Message-ID: <54AE5117.5020905@gmail.com>
References: <alpine.DEB.2.02.1412092224050.31750@utopia.booyaka.com> <20150107143354.GD1621@ulmo> <54AD4FB7.20600@gmail.com> <20150108084929.GA1987@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150108084929.GA1987-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

08.01.2015 11:49, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> I don't like changing this back to syscore_ops since it makes things
> less easier to follow. I also don't think that using PMC_SCRATCH41 fo=
r
> two different purposes is a good thing. There are a couple of
> suggestions in my reply to your original patch. Could you investigate
> whether any of those can be used to fix this instead?
>=20
> Thierry
>=20

I haven't received your reply. Double checked gmail inbox and mailing l=
ists -
nothing. It may just not propagated yet if you sent it today, otherwise=
 can you
please re-send it?

--=20
Dmitry
