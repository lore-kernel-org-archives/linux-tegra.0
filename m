From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] i2c: tegra: Use engineering names in DT compatible property
Date: Thu, 14 Jul 2011 08:33:38 +0900
Message-ID: <CACxGe6tojgLSmHTxzGn3hZZVqiR_z6xbWrazYekm0TwQoWK5eA@mail.gmail.com>
References: <1309897306-22953-1-git-send-email-swarren@nvidia.com>
 <20110706053941.GE9978@ponder.secretlab.ca> <74CDBE0F657A3D45AFBB94109FB122FF049E834757@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF049E834757-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org" <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, "khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org" <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Jul 14, 2011 at 2:59 AM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wr=
ote:
> Grant Likely wrote at Tuesday, July 05, 2011 11:40 PM:
>> On Tue, Jul 05, 2011 at 02:21:46PM -0600, Stephen Warren wrote:
>> > Engineering names are more stable than marketing names. Hence, use=
 them
>> > for Device Tree compatible properties instead.
>> >
>> > Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> > ---
>> > Grant, this is against devicetree/arm and also makes sense for
>> > devicetree/test.
>>
>> Acked-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
>>
>> Ben is the one to pick up this patch.
>
> I don't believe anyone ever sent a patch to Ben to add tegra_i2c_of_m=
atch
> to the driver; the OF support patch didn't include that part of the c=
ode.
> As such, Ben can't yet apply this to his tree. (Although I note this =
patch
> is in Grant's /arm and /test trees, which is probably good enough for=
 now).

Hmmm, I thought it had been done.  It certainly is ready to go in.  Do
you want to put together a roll-up patch that includes all the
required changes and post it again? (although double check linux-next
first).

g.

>
>> > =A0drivers/i2c/busses/i2c-tegra.c | =A0 =A02 +-
>> > =A01 files changed, 1 insertions(+), 1 deletions(-)
>> >
>> > diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i=
2c-tegra.c
>> > index 8914bd1..99b1b6d 100644
>> > --- a/drivers/i2c/busses/i2c-tegra.c
>> > +++ b/drivers/i2c/busses/i2c-tegra.c
>> > @@ -716,7 +716,7 @@ static int tegra_i2c_resume(struct platform_de=
vice *pdev)
>> > =A0#if defined(CONFIG_OF)
>> > =A0/* Match table for of_platform binding */
>> > =A0static const struct of_device_id tegra_i2c_of_match[] __devinit=
const =3D {
>> > - =A0 { .compatible =3D "nvidia,tegra250-i2c", },
>> > + =A0 { .compatible =3D "nvidia,tegra20-i2c", },
>> > =A0 =A0 {},
>> > =A0};
>> > =A0MODULE_DEVICE_TABLE(of, tegra_i2c_of_match);
>> > --
>> > 1.7.0.4
>> >
>
> --
> nvpublic
>
>



--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
