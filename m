From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] mfd: max77620: Fix FPS switch statements
Date: Tue, 31 May 2016 08:30:22 +0100
Message-ID: <20160531073022.GA1729@dell>
References: <1463075104-26924-1-git-send-email-rklein@nvidia.com>
 <5734C2C2.2060207@nvidia.com>
 <9716c1c8-dd2b-8444-6ec9-567d07fe8971@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <9716c1c8-dd2b-8444-6ec9-567d07fe8971-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, 27 May 2016, Rhyland Klein wrote:

> On 5/12/2016 1:52 PM, Laxman Dewangan wrote:
> >=20
> > On Thursday 12 May 2016 11:15 PM, Rhyland Klein wrote:
> >> When configuring FPS during probe, assuming a DT node is present f=
or
> >> FPS, the code can run into a problem with the switch statements in
> >> max77620_config_fps() and max77620_get_fps_period_reg_value(). Nam=
ely,
> >> in the case of chip->chip_id =3D=3D MAX77620, it will set
> >> fps_[mix|max]_period but then fall through to the default switch c=
ase
> >> and return -EINVAL. Returning this from max77620_config_fps() will
> >> cause probe to fail.
> >>
> >=20
> > Thanks for fixes.
> > Missed when converting if-else to switch.
> >=20
> > Reviewed-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >=20
>=20
> Lee, I noticed this hasn't been merged yet, but without it platforms
> using the max77620 can easily (if it has FPS nodes) fail to probe. Is
> there anything blocking it?

Yes, it was sent too late in the cycle.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
