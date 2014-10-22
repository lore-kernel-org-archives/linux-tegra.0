From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v1 1/5] mfd: tps65910: Convert ti,system-power-controller
 DT property to poweroff-source
Date: Wed, 22 Oct 2014 16:50:58 +0100
Message-ID: <20141022155058.GN4939@x1>
References: <1413991587-11110-1-git-send-email-romain.perier@gmail.com>
 <CABgxDoKus_D=ooCz3TqyXP9CTJUgbZVxQSsw4ZgBx1oYaTefbw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CABgxDoKus_D=ooCz3TqyXP9CTJUgbZVxQSsw4ZgBx1oYaTefbw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: PERIER Romain <romain.perier@gmail.com>
Cc: "sameo@linux.intel.com" <sameo@linux.intel.com>, robh+dt@kernel.org, "pawel.moll" <pawel.moll@arm.com>, mark.rutland@arm.com, ijc+devicetree <ijc+devicetree@hellion.org.uk>, galak <galak@codeaurora.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>, swarren <swarren@wwwdotorg.org>, "thierry.reding" <thierry.reding@gmail.com>, gnurou <gnurou@gmail.com>, Grant Likely <grant.likely@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Mark Brown <broonie@kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, 22 Oct 2014, PERIER Romain wrote:

> This is related to the following subject "[RFC v3 PATCH 1/5] of: Add
> standard property for poweroff capability" and depends on the
> corresponding patch.

Then it should be sent in the same patch-set.

There's nothing I can do with this patch as is.

> 2014-10-22 17:26 GMT+02:00 Romain Perier <romain.perier@gmail.com>:
> > No longer use custom property to define poweroff capability, use th=
e standard
> > DT property instead.
> >
> > Signed-off-by: Romain Perier <romain.perier@gmail.com>
> > ---
> >  drivers/mfd/tps65910.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/drivers/mfd/tps65910.c b/drivers/mfd/tps65910.c
> > index 7612d89..b8dca8a 100644
> > --- a/drivers/mfd/tps65910.c
> > +++ b/drivers/mfd/tps65910.c
> > @@ -423,8 +423,7 @@ static struct tps65910_board *tps65910_parse_dt=
(struct i2c_client *client,
> >
> >         board_info->irq =3D client->irq;
> >         board_info->irq_base =3D -1;
> > -       board_info->pm_off =3D of_property_read_bool(np,
> > -                       "ti,system-power-controller");
> > +       board_info->pm_off =3D of_system_has_poweroff_source(np);
> >
> >         return board_info;
> >  }
> >

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
