From: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2] i2c: tegra: Add i2c support
Date: Wed, 23 Feb 2011 11:26:42 -0800
Message-ID: <AANLkTi=wtxzKGHXgtoUsV8J4O3NUYdz9PGHi-sdd-Osy@mail.gmail.com>
References: <AANLkTim0X=gUwYJmR+EAYjGamiJb7tgiVEjwqCEF0-L0@mail.gmail.com>
	<1298250861-27094-1-git-send-email-ccross@android.com>
	<20110223002059.GV15795@trinity.fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110223002059.GV15795-SMNkleLxa3Z6Wcw2j4pizdi2O/JbrIOy@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Dooks <ben-i2c-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
Cc: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Feb 22, 2011 at 4:20 PM, Ben Dooks <ben-i2c-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org> wrote:
> On Sun, Feb 20, 2011 at 05:14:21PM -0800, Colin Cross wrote:
>> Adds I2C bus driver for nVidia Tegra SoCs. =A0Tegra includes 4 I2C
>> controllers, one of which is inside the Dynamic Voltage Controller
>> and has a slightly different register map.
>>
>> Signed-off-by: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
>
> Would have been helpful to start a new thread, missed this the first =
time
> around.
>
>> + =A0 =A0 i2c_dev =3D kzalloc(sizeof(struct tegra_i2c_dev), GFP_KERN=
EL);
>> + =A0 =A0 if (!i2c_dev) {
>
> no error print here.
>
>> + =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -ENOMEM;
>> + =A0 =A0 =A0 =A0 =A0 =A0 goto err_i2c_clk_put;
>> + =A0 =A0 }
>
>> + =A0 =A0 if (pdev->id =3D=3D 3)
>> + =A0 =A0 =A0 =A0 =A0 =A0 i2c_dev->is_dvc =3D 1;
>> + =A0 =A0 init_completion(&i2c_dev->msg_complete);
>
> you might want to think about having a seperate platform bus name for
> this case, and switching the is_dvc field on that. It'll make life mu=
ch
> easier if someone decides that what the next tegra i2c needs is 5 i2c
> controllers.
>
> I'll consider putting this (as is) into the -next tree, but would lik=
e
> to see the issues with readsl/writesl sorted out and any other review
> comments sorted.
>
Thanks for merging it.  Can I merge your i2c-tegra tree into the tegra
for-next tree to allow some board changes that depend on the header to
go on top?
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" =
in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
