From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 5/5] ARM: Tegra: Enable Harmony audio support
Date: Wed, 23 Feb 2011 13:16:50 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF03112A5D7D@HQMAIL01.nvidia.com>
References: <1298487532-5000-1-git-send-email-swarren@nvidia.com>
	<1298487532-5000-6-git-send-email-swarren@nvidia.com>
 <AANLkTi=Nxh8YKBSDhVVAW4Sqzd6yKj=D6X=R+9KT+UBK@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTi=Nxh8YKBSDhVVAW4Sqzd6yKj=D6X=R+9KT+UBK-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Colin Cross wrote at Wednesday, February 23, 2011 2:08 PM:
>=20
> On Wed, Feb 23, 2011 at 10:58 AM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>=
 wrote:
> > * Set up platform data required by I2C, and ASoC machine & codec dr=
ivers.
> > * Enable required GPIO pins as GPIOs.
> > * Initialize audio-related clocks.
> > * Correctly configure pinmux for audio-related GPIOs.
> >
> > Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > diff --git a/arch/arm/mach-tegra/board-harmony.h b/arch/arm/mach-te=
gra/board-harmony.h
> > ...
> > +#define GPIO_WM8903(_x_) =A0 =A0 =A0 =A0 =A0 =A0 =A0 (TEGRA_NR_GPI=
OS + (_x_))
> Can you name this HARMONY_GPIO_WM8903?

Sure. But then, wouldn't it make sense to also rename all the TEGRA_GPI=
O_*
below too?

> > +
> > =A0#define TEGRA_GPIO_SD2_CD =A0 =A0 =A0 =A0 =A0 =A0 =A0TEGRA_GPIO_=
PI5
> > =A0#define TEGRA_GPIO_SD2_WP =A0 =A0 =A0 =A0 =A0 =A0 =A0TEGRA_GPIO_=
PH1
> > =A0#define TEGRA_GPIO_SD2_POWER =A0 =A0 =A0 =A0 =A0 TEGRA_GPIO_PT3
> > =A0#define TEGRA_GPIO_SD4_CD =A0 =A0 =A0 =A0 =A0 =A0 =A0TEGRA_GPIO_=
PH2
> > =A0#define TEGRA_GPIO_SD4_WP =A0 =A0 =A0 =A0 =A0 =A0 =A0TEGRA_GPIO_=
PH3
> > =A0#define TEGRA_GPIO_SD4_POWER =A0 =A0 =A0 =A0 =A0 TEGRA_GPIO_PI6
> > +#define TEGRA_GPIO_CDC_IRQ =A0 =A0 =A0 =A0 =A0 =A0 TEGRA_GPIO_PX3
> > +#define TEGRA_GPIO_SPKR_EN =A0 =A0 =A0 =A0 =A0 =A0 GPIO_WM8903(2)
> > +#define TEGRA_GPIO_HP_DET =A0 =A0 =A0 =A0 =A0 =A0 =A0TEGRA_GPIO_PW=
2
> > +#define TEGRA_GPIO_INT_MIC_EN =A0 =A0 =A0 =A0 =A0TEGRA_GPIO_PX0
> > +#define TEGRA_GPIO_EXT_MIC_EN =A0 =A0 =A0 =A0 =A0TEGRA_GPIO_PX1

--=20
nvpublic

--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" =
in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
