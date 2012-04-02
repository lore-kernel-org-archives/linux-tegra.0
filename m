From: Alok Chauhan <alokc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v2] i2c: tegra: Add delay before reset the controller
Date: Mon, 2 Apr 2012 17:36:45 +0530
Message-ID: <7A0BFCFE3DA5CD47B0FB7984326F201A136BDCC3DB@BGMAIL01.nvidia.com>
References: <1333345982-16595-1-git-send-email-alokc@nvidia.com>
	<7A0BFCFE3DA5CD47B0FB7984326F201A136BDCC35E@BGMAIL01.nvidia.com>
 <CAM=Q2cuN+qAjDsBNp5Sq_Xs9KGcOQJ+PwjSVW-F0QczxMpWZRQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAM=Q2cuN+qAjDsBNp5Sq_Xs9KGcOQJ+PwjSVW-F0QczxMpWZRQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shubhrajyoti Datta <omaplinuxkernel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org" <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>, "ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org" <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, "w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org" <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org" <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Shubhrajyoti,

> Why is it clock cycle dependent?
I think you got me wrong. What I meant to say that delay is calculated =
based on clock period of that bus. So in this way I don't have to hardc=
ode the delay value.

> Is it possible to poll if the stop is sent by controller ?
No, Tegra i2c controller doesn't have any register for STOP condition c=
ompletion status bit. So delay is the only option here.

Thanks
Alok

-----Original Message-----
=46rom: Shubhrajyoti Datta [mailto:omaplinuxkernel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org]=20
Sent: Monday, April 02, 2012 3:49 PM
To: Alok Chauhan
Cc: Stephen Warren; linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org; b=
en-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org; w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org; Stephen Warren; olof@lixom.n=
et; bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org; ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org; Laxman Dewangan; linux-tegr=
a@vger.kernel.org; linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
Subject: Re: [PATCH v2] i2c: tegra: Add delay before reset the controll=
er

Hi Alok,
=46ew / doubts /questions.


On Mon, Apr 2, 2012 at 11:29 AM, Alok Chauhan <alokc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> Stephen,
>
> I've updated the commit message and comment in the code as per your s=
uggestion. Tegra I2C controller doesn't have idle bit so delay is requi=
red before reset the controller in case of NACK error. =A0This delay is=
 calculated purely based on clock period of that particular i2c bus and=
 not passed as hardcoded value. I2C SCL clock-stretching won't affect t=
his calculated delay.

Why is it clock cycle dependent?

Is it possible to poll if the stop is sent by controller ?

>
> Thanks
> Alok
>
>
> -----Original Message-----
> From: Alok Chauhan [mailto:alokc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org]
> Sent: Monday, April 02, 2012 11:23 AM
> To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org; khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org; ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org; w=
=2Esang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org; Stephen Warren; olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org; bones@secretlab=
=2Eca; omaplinuxkernel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org; ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org; Laxman Dewangan; =
linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; dgreid@chromium=
=2Eorg
> Cc: Alok Chauhan; linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Subject: [PATCH v2] i2c: tegra: Add delay before reset the controller
>
> NACK interrupt generated before I2C controller generates the STOP con=
dition on bus. In Software, because of this reset of controller is happ=
ening before I2C controller could complete STOP condition. So wait for =
some time before resetting the controller so that STOP condition has de=
livered properly on bus.
>
> Added delay of 2 clock period
How did you calculate the 2 clock cycles?


before reset the controller in case of NACK error.
>
> Signed-off-by: Alok Chauhan <alokc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Added the more descriptive commit message about issue in case of NACK=
 error condition. Changed the comment in code also
>
> =A0drivers/i2c/busses/i2c-tegra.c | =A0 =A08 ++++++++
> =A01 files changed, 8 insertions(+), 0 deletions(-)
>
