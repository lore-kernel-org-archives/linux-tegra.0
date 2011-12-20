From: Shubhrajyoti Datta <omaplinuxkernel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V2 1/4] i2c: tegra: Add __devinit/exit to probe/remove
Date: Tue, 20 Dec 2011 11:45:08 +0530
Message-ID: <CAM=Q2cs8K4vraWPNqervcmxEqUGiAbng+44+L9OhD3ijPw9tAA@mail.gmail.com>
References: <1324189772-26914-1-git-send-email-swarren@nvidia.com>
	<20111220015634.GA27789@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20111220015634.GA27789-O5ziIzlqnXUVNXGz7ipsyg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Dec 20, 2011 at 7:26 AM, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wrote:
> On Sat, Dec 17, 2011 at 11:29:29PM -0700, Stephen Warren wrote:
>> This fixes some section mismatch build warnings.
>>
>> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> Ben, since the patch is trivial, I've picked it up in tegra
> for-3.3/drivers and will merge that way. Let me know if you disagree.
>
>
Hi Stephen ,
could you check this one also
thanks.

=46rom: Shubhrajyoti D <shubhrajyoti-l0cyMroinI0@public.gmane.org>
Date: Tue, 20 Dec 2011 11:40:51 +0530
Subject: [PATCH] I2C : tegra : devexit in remove

Adding I2C __devexxit in remove

Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Shubhrajyoti D <shubhrajyoti-l0cyMroinI0@public.gmane.org>
---
Untested

 drivers/i2c/busses/i2c-tegra.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-te=
gra.c
index 46b6500..b25f78b 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -751,7 +751,7 @@ MODULE_DEVICE_TABLE(of, tegra_i2c_of_match);

 static struct platform_driver tegra_i2c_driver =3D {
        .probe   =3D tegra_i2c_probe,
-       .remove  =3D tegra_i2c_remove,
+       .remove  =3D__devexit_p(tegra_i2c_remove),
 #ifdef CONFIG_PM
        .suspend =3D tegra_i2c_suspend,
        .resume  =3D tegra_i2c_resume,
--=20
1.7.1

> Thanks,
>
> -Olof
> --
> To unsubscribe from this list: send the line "unsubscribe linux-i2c" =
in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
