Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D14D7C76196
	for <linux-tegra@archiver.kernel.org>; Thu,  6 Apr 2023 12:03:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230032AbjDFMDE (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 6 Apr 2023 08:03:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237840AbjDFMCo (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 6 Apr 2023 08:02:44 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A581393E5;
        Thu,  6 Apr 2023 05:00:15 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id lj25so755760ejb.11;
        Thu, 06 Apr 2023 05:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680782413;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SeowhykftdyA92tXKnQVaAheJ9Hb/21md1RK7v9V1do=;
        b=UQQV4CGsVoq+d6lsMlJ5eLRZU1sJH7fnvW0HGpwRzn53coxHOzHO1NCHKtE8f8yMfQ
         zuEqXlupoxXAIBUN/FkistGCtSESYQq8kZtGq7mbrjzwpWUZh12MO45AwJFz6dsRbyv3
         Q0zfPwaAvqSWUifccjJtolTDPCD/QJ4pqcCLK4r/EkoA2V6BxUmqmdLHYciQ2YLoAgcf
         VdtHaVun4RpnDuO9PIJvHErUehY471DTmZfML4w5Yt1AgrAh+p5ZnZtrYusN4uwP9tKD
         7R+mTsp+ew9T/S3eWvaTjeiA0JHLun+1DHfOd2js6mopAsBB+J7exOQd5V9xk1yYu7M3
         OY8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680782413;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SeowhykftdyA92tXKnQVaAheJ9Hb/21md1RK7v9V1do=;
        b=rF+O5vdPCEHOvZO6h0MyLX+NTnzTOVcITaIU1kT1qgVsumhEIDQCaCHv4fK6W2LMg7
         P9VxfuLA8rky8MgJDQM6y0WOjBruEFklOuB7UjSVFXwMg52hn1tgkWvYdGgENHrwEy8y
         bkkxaT61zhUQILrxLw67Kttz2C3hWt8U9Lcsp5YhWS46WB/o34EQeceMGK9C8t12E9AQ
         7h9x64/gRCr9FwiBmsi/BEXFEe4hQH3+5MKr6E5+xXh4CZOzKITApDazOfABgUDShi/6
         RuOjPqfafIJXrSK9Z4DfhTCJM41QSea2TKcBkadqSf/K2MTMJfwFXtVt5HiS42U7D4fS
         XINw==
X-Gm-Message-State: AAQBX9d7U2Pt2wnv6trFGB3UB07UuIvlgfgoDtswaztFhMx4Q/5PQF6k
        aQOSM6iIsQ9Q3OigpCW4kNE=
X-Google-Smtp-Source: AKy350YnRn1gnr3lBbRZk0dRcmIoZyziSeSVBra2UxwqnibxEKMp4nyF3F7waCpH0ok/jIKy3gIJow==
X-Received: by 2002:a17:906:2b49:b0:939:e928:5323 with SMTP id b9-20020a1709062b4900b00939e9285323mr6238849ejg.54.1680782412832;
        Thu, 06 Apr 2023 05:00:12 -0700 (PDT)
Received: from orome (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id tl26-20020a170907c31a00b009222a7192b4sm732221ejc.30.2023.04.06.05.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 05:00:12 -0700 (PDT)
Date:   Thu, 6 Apr 2023 14:00:10 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Nagarjuna Kristam <nkristam@nvidia.com>,
        linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 1/2] usb: gadget: tegra-xudc: Fix crash in vbus_draw
Message-ID: <ZC60SvlnC7GXnjoW@orome>
References: <20230405181854.42355-1-jonathanh@nvidia.com>
 <ZC59VDIEYzbR1YKF@orome>
 <de55706b-f632-b921-a6f8-dc107601977a@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="rVeus4oWA/KaMLWC"
Content-Disposition: inline
In-Reply-To: <de55706b-f632-b921-a6f8-dc107601977a@nvidia.com>
User-Agent: Mutt/2.2.10 (2023-03-25)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--rVeus4oWA/KaMLWC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 06, 2023 at 10:35:15AM +0100, Jon Hunter wrote:
>=20
> On 06/04/2023 09:05, Thierry Reding wrote:
> > On Wed, Apr 05, 2023 at 07:18:53PM +0100, Jon Hunter wrote:
> > > Commit ac82b56bda5f ("usb: gadget: tegra-xudc: Add vbus_draw support")
> > > populated the vbus_draw callback for the Tegra XUDC driver. The funct=
ion
> > > tegra_xudc_gadget_vbus_draw(), that was added by this commit, assumes
> > > that the pointer 'curr_usbphy' has been initialised, which is not alw=
ays
> > > the case because this is only initialised when the USB role is update=
d.
> > > Fix this crash, by checking that the 'curr_usbphy' is valid before
> > > dereferencing.
> > >=20
> > > Fixes: ac82b56bda5f ("usb: gadget: tegra-xudc: Add vbus_draw support")
> > > Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> > > ---
> > >   drivers/usb/gadget/udc/tegra-xudc.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget=
/udc/tegra-xudc.c
> > > index 2b71b33725f1..5bccd64847ff 100644
> > > --- a/drivers/usb/gadget/udc/tegra-xudc.c
> > > +++ b/drivers/usb/gadget/udc/tegra-xudc.c
> > > @@ -2167,7 +2167,7 @@ static int tegra_xudc_gadget_vbus_draw(struct u=
sb_gadget *gadget,
> > >   	dev_dbg(xudc->dev, "%s: %u mA\n", __func__, m_a);
> > > -	if (xudc->curr_usbphy->chg_type =3D=3D SDP_TYPE)
> > > +	if (xudc->curr_usbphy && xudc->curr_usbphy->chg_type =3D=3D SDP_TYP=
E)
> > >   		ret =3D usb_phy_set_power(xudc->curr_usbphy, m_a);
> > >   	return ret;
> >=20
> > Looking at tegra_xudc_probe(), that calls tegra_xudc_update_data_role()
> > for all PHYs, so shouldn't that be enough to get curr_usbphy set? Or is
> > there perhaps a race between ->vbus_draw() and the data role update? Is
> > ->vbus_draw() perhaps called as part of usb_add_gadget_udc()? Should we
> > reorder those to make sure the role is properly updated before the
> > gadget is registered?
>=20
> Yes it does call it, but it still does not set the curr_usbphy. If you lo=
ok
> at the function it may not set it.
>=20
> In the backtrace I saw, which was happening on reboot, it was in the
> unregister of the gadget ...
>=20
> [ 1102.047896] Call trace:
> [ 1102.050402]  0xffffde9fd18c0878
> [ 1102.053602]  usb_gadget_vbus_draw+0x28/0x50
> [ 1102.057879]  composite_disconnect+0x1c/0x40 [libcomposite]
> [ 1102.063509]  usb_get_function_instance+0x1808/0x27b0 [libcomposite]
> [ 1102.069935]  usb_gadget_disconnect+0x64/0xa0
> [ 1102.074304]  usb_gadget_remove_driver+0x2c/0xc0
> [ 1102.078942]  usb_gadget_unregister_driver+0x70/0xf0
> [ 1102.083927]  usb_get_function_instance+0x2774/0x27b0 [libcomposite]
> [ 1102.090339]  unregister_gadget_item+0x280/0x470 [libcomposite]
> [ 1102.096314]  configfs_write_iter+0xc4/0x120
> [ 1102.100609]  new_sync_write+0xe8/0x190
> [ 1102.104461]  vfs_write+0x234/0x380
> [ 1102.107938]  ksys_write+0x6c/0x100
> [ 1102.111417]  __arm64_sys_write+0x1c/0x30
> [ 1102.115427]  invoke_syscall.constprop.0+0x4c/0xe0
> [ 1102.120245]  do_el0_svc+0x50/0x150
> [ 1102.123723]  el0_svc+0x28/0xc0
> [ 1102.126854]  el0t_64_sync_handler+0xb0/0xc0
> [ 1102.131138]  el0t_64_sync+0x1a0/0x1a4
> [ 1102.134889] Code: 910003fd a90153f3 f94ce413 f100027f (b9409a60)
> [ 1102.141139] ---[ end trace cdf6612bd43fcbf2 ]---

Alright. There are a lot of cases where we can run into this and it all
looks a little complicated, so I think it would be good to unwind this
at some point. But I can't think of an easy way to do that, so for a fix
this looks good:

Reviewed-by: Thierry Reding <treding@nvidia.com>

--rVeus4oWA/KaMLWC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmQutEgACgkQ3SOs138+
s6EP7w/+O9phEFdV6jsE+2t9a6tqTsHwrBgoHRerpwx+fOyzuwyLXcuWTnyRPEbf
rYs/r63G/KuMuBMJwht95KM4cCypDBjaepBLYPLnhdsGelK59rxgPdHL4ijYzm5y
yOuSuf2PHfMecnQYPEQTks5zO8xnsEEYmsXPyzbWsgJuwB2Ew5NggUNh8Ec+XH2r
lrWbSt6udSs4Ze+6sL3958ecERWV4AJlXF+A9qLhpAI41cwxSXbyGf+w+Jbxd45G
x6gSbJxv9tzkvoauoR3sPkfcyEzRr7yo1hkOfjdWOSU0shITtGMTm8utCo1HLPOG
mPYJEHFrVVaUYODeZo+pmQ2MMzXEi6KZYwjEy9hU/cQ35nFhUDbv2Ej+qKkZeUvF
DUk52kVxA5Exm5U7hzkSrQ0If+aVQgQjjAVTBgd68madNRiH0Z9wdTg9JMlUzHzS
GIGOYgXJPlP420s9SxaRmZJ/uwO5aTPFX6Qckg+btdSKrxlIMUz/KqrjsVAarIGY
ffdu9jYyUvAIDwvW1VTk3hw6DOqfstiSY1BK6PMoT6KHsQem+OmLPCigTqW4hbtL
NSNKBIYxx6/7sENIxhieyJWm5Z4pjU+eIJP+3u3GbvxtwClXVghxGl661cLtKOAV
WljRODk3zR9USBDxWIWKwCa6sFG3Ok49iwTOVNPpO7OhL7RLOp8=
=9LSU
-----END PGP SIGNATURE-----

--rVeus4oWA/KaMLWC--
