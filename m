Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DE77C7618D
	for <linux-tegra@archiver.kernel.org>; Thu,  6 Apr 2023 08:05:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235362AbjDFIFp (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 6 Apr 2023 04:05:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234102AbjDFIFp (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 6 Apr 2023 04:05:45 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E65E10CA;
        Thu,  6 Apr 2023 01:05:44 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id i5so147491383eda.0;
        Thu, 06 Apr 2023 01:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680768342;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EsfVKEkgqZWkBGzWEFFFXWYH9yWAs1SfPsiyNzq6bhM=;
        b=k2PiMSgbceDdD+y+kiuR61uGk6eWkEiDCPPK2g27718apL0jvGfqGxSMJRqtMstxVA
         2p8qPugLsQeuGKJIaBunm7wlj9Crh5Um29AN7Xo4tCvxLJ8ueubnxdJdfmLdpgpYiHxz
         dnHTkoKwvB74ODcjrshav9vn6O59kzD4DknwmUDzu2losa9QfU5BoBB3x/doGSi8Xq6r
         ZbzBUuwgQDuO2s1gWvMJ7TvVGysO5hJ53YVL717X/Ldzn1y3rFEKm2xEZFbCxsvlflVf
         5QkHTp4UyTiZrdE/Sggcwy8gYCYB6OAYbT5KopbT6u/Vue1lnQdY1DVKVHD8Hc52/28/
         FoqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680768342;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EsfVKEkgqZWkBGzWEFFFXWYH9yWAs1SfPsiyNzq6bhM=;
        b=jlmpcRJtb5M9ysLyo1M1eiGn4c1iT7fR6/JyaJepoijks1VEslLkvu1IpFaSTBtms1
         uwSLTrzVywj/XNMKGFhU7ks1ETH0+OgVOFoprsZjpMe1kt4yoScw+sIHgp9SjVNKxAES
         u7M8+3Ilv/aqRWoIYJASst1wXRpvOtEpehvYy/Imh/QISNMBHspRPYwyIQMc23fx75M9
         CmpnDwmeVl4bA98xFOpWYr7fBO/fKIj7cLlkHjdAHclfOmKzzM5OKRcKUu6npuTx4qyz
         2UF/ZiPibX3tLwzUtv6UnpnsGwetOxyFA1WCPpKUF23RSAipyzM6oYpCr2X8BbKVsQmO
         Im1Q==
X-Gm-Message-State: AAQBX9cmly8z8X6rw8fggA/YnBMqY98lbfDtEKFBcorZy6u+jkWhjq+U
        nNdfwqH3ws2l7h5JK9fgtDL+eNNlcac=
X-Google-Smtp-Source: AKy350bAhXMCq3AWI39fx5ijaTRGgI1LLS5SzvG1ji6W4xsNfe24FLxJ2SrlazEhh8EnzRfVI25qqw==
X-Received: by 2002:a17:907:104b:b0:8a6:5720:9101 with SMTP id oy11-20020a170907104b00b008a657209101mr5525881ejb.4.1680768342274;
        Thu, 06 Apr 2023 01:05:42 -0700 (PDT)
Received: from orome (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id u2-20020a50c2c2000000b00501c96564b5sm376139edf.93.2023.04.06.01.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 01:05:41 -0700 (PDT)
Date:   Thu, 6 Apr 2023 10:05:40 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Nagarjuna Kristam <nkristam@nvidia.com>,
        linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 1/2] usb: gadget: tegra-xudc: Fix crash in vbus_draw
Message-ID: <ZC59VDIEYzbR1YKF@orome>
References: <20230405181854.42355-1-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="9DLtn6Vqa9g+9/RT"
Content-Disposition: inline
In-Reply-To: <20230405181854.42355-1-jonathanh@nvidia.com>
User-Agent: Mutt/2.2.10 (2023-03-25)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--9DLtn6Vqa9g+9/RT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 05, 2023 at 07:18:53PM +0100, Jon Hunter wrote:
> Commit ac82b56bda5f ("usb: gadget: tegra-xudc: Add vbus_draw support")
> populated the vbus_draw callback for the Tegra XUDC driver. The function
> tegra_xudc_gadget_vbus_draw(), that was added by this commit, assumes
> that the pointer 'curr_usbphy' has been initialised, which is not always
> the case because this is only initialised when the USB role is updated.
> Fix this crash, by checking that the 'curr_usbphy' is valid before
> dereferencing.
>=20
> Fixes: ac82b56bda5f ("usb: gadget: tegra-xudc: Add vbus_draw support")
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  drivers/usb/gadget/udc/tegra-xudc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc=
/tegra-xudc.c
> index 2b71b33725f1..5bccd64847ff 100644
> --- a/drivers/usb/gadget/udc/tegra-xudc.c
> +++ b/drivers/usb/gadget/udc/tegra-xudc.c
> @@ -2167,7 +2167,7 @@ static int tegra_xudc_gadget_vbus_draw(struct usb_g=
adget *gadget,
> =20
>  	dev_dbg(xudc->dev, "%s: %u mA\n", __func__, m_a);
> =20
> -	if (xudc->curr_usbphy->chg_type =3D=3D SDP_TYPE)
> +	if (xudc->curr_usbphy && xudc->curr_usbphy->chg_type =3D=3D SDP_TYPE)
>  		ret =3D usb_phy_set_power(xudc->curr_usbphy, m_a);
> =20
>  	return ret;

Looking at tegra_xudc_probe(), that calls tegra_xudc_update_data_role()
for all PHYs, so shouldn't that be enough to get curr_usbphy set? Or is
there perhaps a race between ->vbus_draw() and the data role update? Is
->vbus_draw() perhaps called as part of usb_add_gadget_udc()? Should we
reorder those to make sure the role is properly updated before the
gadget is registered?

Thierry

--9DLtn6Vqa9g+9/RT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmQufVQACgkQ3SOs138+
s6EMvA/9ETTPiV5HCEADpnc/+zxaxcjJZ1JxOY85RCUfh3aTUiE57D3oFzeJWDIv
JSurVp00DbydJyV2puCOEE6p8NQpjURBOBdoeWJZuFCKYndvsGgZ4Y5EwQBO9VLp
aLA9SLeajOvQVKp4IBQL4kSJLGqi0uXx0QWr/WI28vdEn1bguEgHdaW2woMZ4T8V
azNVKLw7IqKNQikML4exBKSI8l2aDCBDvii5XtBziUBrnovFLbD8b5dMdTW3Jlgk
+bG+NJLYcuDFcfGvqme9uK+PDB2S42eoOARe7iMM1pTaVjN8U57X3xIRN7sYpfCx
shfjE4PPnKSqtxHn02DUu80Fab+QjRsqRM2yAGaOwTHpbh82Hdt3QaqvCG16h9DT
5nn73iaMWbRrmOwd3AosxNioVHJ0PpjDqS8YKATRnphjFxqpePlYcRVy/MQrpr6t
9Ok6copiJrWzfmmtTlDCyk0IWNRegTRVR0bPjcX062g8FsOkYg9ye9ktLYpQ7tJF
t4iU5RX74r2EYPuKtJZYPERd/0CQmK7njaSuRCY86WRQ1eagMxggvEZqomSSrvhI
k0SE5iMgMv2Jlg+rkZSbGhh+deU64RBs7BkGvkY8XhbJ94mgZcFY4J3C2IwsOEI4
7+pdx6bOxTWfsR7Ai/zIJj0oirKfH4I3gUdL3UjVfAZpdUFeH14=
=bcOa
-----END PGP SIGNATURE-----

--9DLtn6Vqa9g+9/RT--
