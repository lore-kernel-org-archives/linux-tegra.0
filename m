From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH] arm/dt: Add SoC detection macros
Date: Fri, 9 Sep 2011 09:45:48 -0700
Message-ID: <CAOesGMj7cwJ-B9cc0DbJ=ePMWeQtp6UiMQT7HCBdOxsmyJReZg@mail.gmail.com>
References: <1315555339-12685-1-git-send-email-amartin@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1315555339-12685-1-git-send-email-amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Sep 9, 2011 at 1:02 AM, Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote=
:
> These macros allow runtime query of SoC family and version via
> soc_is_*() =A0If the corresponding SoC is not configured the macro wi=
ll
> evaluate to 0. =A0If the corresponding SoC is the only architecure
> configured, the macro will evaluate to 1. =A0If multiple architecures
> are configured the macro will evaluate to a runtime call to
> soc_get_version().

> +void soc_init_version(void)
> +{
> + =A0 =A0 =A0 if (of_machine_is_compatible("nvidia,tegra20"))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 soc_version =3D TEGRA_T20;
> + =A0 =A0 =A0 else if (of_machine_is_compatible("nvidia,tegra30"))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 soc_version =3D TEGRA_T30;
> + =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 panic("Unknown SoC");
> +}


The above should be enough for your local code, no need to wrap it in
layers of indirection.

Sure, doing the of_machine_is...() calls are slow, but you shouldn't
be doing runtime decisions about what SoC you are on during critical
path anyway -- it should be done at setup/probe time, much of the rest
should be possible to handle with setting appropriate function
pointers, etc.

Also, panic:ing is unacceptable.


-Olof
