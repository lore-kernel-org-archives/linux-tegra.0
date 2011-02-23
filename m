From: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 5/5] ARM: Tegra: Enable Harmony audio support
Date: Wed, 23 Feb 2011 13:19:06 -0800
Message-ID: <AANLkTinUWy5+-EFVhEJd0pH2VVg=pwVgZnuS-qtOMxhy@mail.gmail.com>
References: <1298487532-5000-1-git-send-email-swarren@nvidia.com>
	<1298487532-5000-6-git-send-email-swarren@nvidia.com>
	<AANLkTi=Nxh8YKBSDhVVAW4Sqzd6yKj=D6X=R+9KT+UBK@mail.gmail.com>
	<74CDBE0F657A3D45AFBB94109FB122FF03112A5D7D@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF03112A5D7D-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Feb 23, 2011 at 1:16 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wr=
ote:
> Colin Cross wrote at Wednesday, February 23, 2011 2:08 PM:
>>
>> On Wed, Feb 23, 2011 at 10:58 AM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org=
> wrote:
>> > * Set up platform data required by I2C, and ASoC machine & codec d=
rivers.
>> > * Enable required GPIO pins as GPIOs.
>> > * Initialize audio-related clocks.
>> > * Correctly configure pinmux for audio-related GPIOs.
>> >
>> > Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> > diff --git a/arch/arm/mach-tegra/board-harmony.h b/arch/arm/mach-t=
egra/board-harmony.h
>> > ...
>> > +#define GPIO_WM8903(_x_) =A0 =A0 =A0 =A0 =A0 =A0 =A0 (TEGRA_NR_GP=
IOS + (_x_))
>> Can you name this HARMONY_GPIO_WM8903?
>
> Sure. But then, wouldn't it make sense to also rename all the TEGRA_G=
PIO_*
> below too?
True, but no point in adding churn.  Those can be cleaned up later.  I
just want it to be clear that the numbering of gpios above
TEGRA_NR_GPIOS is specific to the board, so the next board author
doesn't get it wrong.

>> > +
>> > =A0#define TEGRA_GPIO_SD2_CD =A0 =A0 =A0 =A0 =A0 =A0 =A0TEGRA_GPIO=
_PI5
>> > =A0#define TEGRA_GPIO_SD2_WP =A0 =A0 =A0 =A0 =A0 =A0 =A0TEGRA_GPIO=
_PH1
>> > =A0#define TEGRA_GPIO_SD2_POWER =A0 =A0 =A0 =A0 =A0 TEGRA_GPIO_PT3
>> > =A0#define TEGRA_GPIO_SD4_CD =A0 =A0 =A0 =A0 =A0 =A0 =A0TEGRA_GPIO=
_PH2
>> > =A0#define TEGRA_GPIO_SD4_WP =A0 =A0 =A0 =A0 =A0 =A0 =A0TEGRA_GPIO=
_PH3
>> > =A0#define TEGRA_GPIO_SD4_POWER =A0 =A0 =A0 =A0 =A0 TEGRA_GPIO_PI6
>> > +#define TEGRA_GPIO_CDC_IRQ =A0 =A0 =A0 =A0 =A0 =A0 TEGRA_GPIO_PX3
>> > +#define TEGRA_GPIO_SPKR_EN =A0 =A0 =A0 =A0 =A0 =A0 GPIO_WM8903(2)
>> > +#define TEGRA_GPIO_HP_DET =A0 =A0 =A0 =A0 =A0 =A0 =A0TEGRA_GPIO_P=
W2
>> > +#define TEGRA_GPIO_INT_MIC_EN =A0 =A0 =A0 =A0 =A0TEGRA_GPIO_PX0
>> > +#define TEGRA_GPIO_EXT_MIC_EN =A0 =A0 =A0 =A0 =A0TEGRA_GPIO_PX1
>
> --
> nvpublic
>
>
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" =
in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
