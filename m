Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45B8AC49EA5
	for <linux-tegra@archiver.kernel.org>; Thu, 24 Jun 2021 08:29:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2A66A613FF
	for <linux-tegra@archiver.kernel.org>; Thu, 24 Jun 2021 08:29:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231826AbhFXIbe (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 24 Jun 2021 04:31:34 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:60438 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231865AbhFXIbe (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 24 Jun 2021 04:31:34 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
        (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 078D721976;
        Thu, 24 Jun 2021 08:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1624523341; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=0L5nz5bVnzlvJV0RjY8gCyLPBlQHqLtg4oioZgDj7sE=;
        b=H47JB6rfcTZrnBwfDErNXWaKzTNfBpYnmnio3CIpCf8t3632jgCaxwzRMuz/mdYp9Yz/ao
        XSsgx7UAK+VYhayo4uFpTyl/3X8uoFfqI08rv4ZeVShxNVAAOQlTrHJrmV0DfbOJNybTYR
        PultKHLRqSOLL93gXfamRbzfV6CrU1E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1624523341;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=0L5nz5bVnzlvJV0RjY8gCyLPBlQHqLtg4oioZgDj7sE=;
        b=VGe9rG6so5c34BqO1pSCopzOeVyTNgfweNOXlBZdbQ53I4/7QT/vY1xqauJkC9BafqA9j+
        S6Kg5u/bUT8FLqDw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
        by imap.suse.de (Postfix) with ESMTP id BFDDD11A97;
        Thu, 24 Jun 2021 08:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1624523340; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=0L5nz5bVnzlvJV0RjY8gCyLPBlQHqLtg4oioZgDj7sE=;
        b=rfyPFlnrx0gMc6BzpqKzRr4E3RL5MMa6uTkl3g1ggRTmxlP/GEjI3N6ZCDgG/PSEW4V9I0
        CC9jy4Fmuhh7S49OTyfzuUHxDuNa2tvtlWT3wAA3WMrsIHEFs9k1tZdMvnRFdCnsdtksqQ
        RICsUBNTluOuPynz67gyFio3iP0eMNA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1624523340;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=0L5nz5bVnzlvJV0RjY8gCyLPBlQHqLtg4oioZgDj7sE=;
        b=wgWw5+iHWQ5qv3h7jV7wxXmyKHYRMe8CDc7lR0BDGQmqx/Do4XbDkNVtHpd2XiGqlnj6YX
        1A74dssIJKaSWNBw==
Received: from director2.suse.de ([192.168.254.72])
        by imap3-int with ESMTPSA
        id zwiRLUtC1GBNIQAALh3uQQ
        (envelope-from <tzimmermann@suse.de>); Thu, 24 Jun 2021 08:28:59 +0000
Subject: Re: [PATCH v3 04/27] drm: Don't test for IRQ support in VBLANK ioctls
To:     Jani Nikula <jani.nikula@linux.intel.com>, daniel@ffwll.ch,
        airlied@linux.ie, alexander.deucher@amd.com,
        christian.koenig@amd.com, Xinhui.Pan@amd.com,
        james.qian.wang@arm.com, liviu.dudau@arm.com,
        mihail.atanassov@arm.com, brian.starkey@arm.com,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        inki.dae@samsung.com, jy0922.shim@samsung.com,
        sw0312.kim@samsung.com, kyungmin.park@samsung.com,
        krzysztof.kozlowski@canonical.com, xinliang.liu@linaro.org,
        tiantao6@hisilicon.com, john.stultz@linaro.org,
        kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
        laurentiu.palcu@oss.nxp.com, l.stach@pengutronix.de,
        p.zabel@pengutronix.de, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, chunkuang.hu@kernel.org, matthias.bgg@gmail.com,
        bskeggs@redhat.com, tomba@kernel.org, hjc@rock-chips.com,
        heiko@sntech.de, benjamin.gaignard@linaro.org,
        yannick.fertre@foss.st.com, philippe.cornu@foss.st.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
        wens@csie.org, jernej.skrabec@gmail.com, thierry.reding@gmail.com,
        jonathanh@nvidia.com, jyri.sarha@iki.fi, emma@anholt.net,
        linux-graphics-maintainer@vmware.com, zackr@vmware.com,
        hyun.kwon@xilinx.com, laurent.pinchart@ideasonboard.com,
        michal.simek@xilinx.com, rodrigo.vivi@intel.com,
        linux@armlinux.org.uk, kieran.bingham+renesas@ideasonboard.com,
        rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
        hamohammed.sa@gmail.com
Cc:     linux-samsung-soc@vger.kernel.org, nouveau@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org,
        linux-mediatek@lists.infradead.org, amd-gfx@lists.freedesktop.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        linux-tegra@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20210624072916.27703-1-tzimmermann@suse.de>
 <20210624072916.27703-5-tzimmermann@suse.de> <87im23u1ok.fsf@intel.com>
From:   Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <b5e7729f-ed11-e9ca-386e-562feb2bd2b7@suse.de>
Date:   Thu, 24 Jun 2021 10:28:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87im23u1ok.fsf@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="XeS7eJ5JPg7IwjZ7mWHplNVbGBiq1dAM5"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--XeS7eJ5JPg7IwjZ7mWHplNVbGBiq1dAM5
Content-Type: multipart/mixed; boundary="zYjFVN6LbQJto7YyRvmktHhbjS3oGNxBZ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jani Nikula <jani.nikula@linux.intel.com>, daniel@ffwll.ch,
 airlied@linux.ie, alexander.deucher@amd.com, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, james.qian.wang@arm.com, liviu.dudau@arm.com,
 mihail.atanassov@arm.com, brian.starkey@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, inki.dae@samsung.com,
 jy0922.shim@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com,
 krzysztof.kozlowski@canonical.com, xinliang.liu@linaro.org,
 tiantao6@hisilicon.com, john.stultz@linaro.org,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
 laurentiu.palcu@oss.nxp.com, l.stach@pengutronix.de, p.zabel@pengutronix.de,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, chunkuang.hu@kernel.org,
 matthias.bgg@gmail.com, bskeggs@redhat.com, tomba@kernel.org,
 hjc@rock-chips.com, heiko@sntech.de, benjamin.gaignard@linaro.org,
 yannick.fertre@foss.st.com, philippe.cornu@foss.st.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, wens@csie.org,
 jernej.skrabec@gmail.com, thierry.reding@gmail.com, jonathanh@nvidia.com,
 jyri.sarha@iki.fi, emma@anholt.net, linux-graphics-maintainer@vmware.com,
 zackr@vmware.com, hyun.kwon@xilinx.com, laurent.pinchart@ideasonboard.com,
 michal.simek@xilinx.com, rodrigo.vivi@intel.com, linux@armlinux.org.uk,
 kieran.bingham+renesas@ideasonboard.com, rodrigosiqueiramelo@gmail.com,
 melissa.srw@gmail.com, hamohammed.sa@gmail.com
Cc: linux-samsung-soc@vger.kernel.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-tegra@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Message-ID: <b5e7729f-ed11-e9ca-386e-562feb2bd2b7@suse.de>
Subject: Re: [PATCH v3 04/27] drm: Don't test for IRQ support in VBLANK ioctls
References: <20210624072916.27703-1-tzimmermann@suse.de>
 <20210624072916.27703-5-tzimmermann@suse.de> <87im23u1ok.fsf@intel.com>
In-Reply-To: <87im23u1ok.fsf@intel.com>

--zYjFVN6LbQJto7YyRvmktHhbjS3oGNxBZ
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 24.06.21 um 10:06 schrieb Jani Nikula:
> On Thu, 24 Jun 2021, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>> For KMS drivers, replace the IRQ check in VBLANK ioctls with a check f=
or
>> vblank support. IRQs might be enabled wthout vblanking being supported=
=2E
>>
>> This change also removes the DRM framework's only dependency on IRQ st=
ate
>> for non-legacy drivers. For legacy drivers with userspace modesetting,=

>> the original test remains in drm_wait_vblank_ioctl().
>>
>> v3:
>> 	* optimize test in drm_wait_vblank_ioctl() for KMS case (Liviu)
>> 	* update docs for drm_irq_uninstall()
>> v2:
>> 	* keep the old test for legacy drivers in
>> 	  drm_wait_vblank_ioctl() (Daniel)
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>> ---
>>   drivers/gpu/drm/drm_irq.c    | 13 ++++---------
>>   drivers/gpu/drm/drm_vblank.c | 16 ++++++++++++----
>>   2 files changed, 16 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_irq.c b/drivers/gpu/drm/drm_irq.c
>> index c3bd664ea733..945dd82e2ea3 100644
>> --- a/drivers/gpu/drm/drm_irq.c
>> +++ b/drivers/gpu/drm/drm_irq.c
>> @@ -74,10 +74,8 @@
>>    * only supports devices with a single interrupt on the main device =
stored in
>>    * &drm_device.dev and set as the device paramter in drm_dev_alloc()=
=2E
>>    *
>> - * These IRQ helpers are strictly optional. Drivers which roll their =
own only
>> - * need to set &drm_device.irq_enabled to signal the DRM core that vb=
lank
>> - * interrupts are working. Since these helpers don't automatically cl=
ean up the
>> - * requested interrupt like e.g. devm_request_irq() they're not reall=
y
>> + * These IRQ helpers are strictly optional. Since these helpers don't=
 automatically
>> + * clean up the requested interrupt like e.g. devm_request_irq() they=
're not really
>>    * recommended.
>>    */
>>  =20
>> @@ -91,9 +89,7 @@
>>    * and after the installation.
>>    *
>>    * This is the simplified helper interface provided for drivers with=
 no special
>> - * needs. Drivers which need to install interrupt handlers for multip=
le
>> - * interrupts must instead set &drm_device.irq_enabled to signal the =
DRM core
>> - * that vblank interrupts are available.
>> + * needs.
>>    *
>>    * @irq must match the interrupt number that would be passed to requ=
est_irq(),
>>    * if called directly instead of using this helper function.
>> @@ -156,8 +152,7 @@ EXPORT_SYMBOL(drm_irq_install);
>>    *
>>    * Calls the driver's &drm_driver.irq_uninstall function and unregis=
ters the IRQ
>>    * handler.  This should only be called by drivers which used drm_ir=
q_install()
>> - * to set up their interrupt handler. Other drivers must only reset
>> - * &drm_device.irq_enabled to false.
>> + * to set up their interrupt handler.
>>    *
>>    * Note that for kernel modesetting drivers it is a bug if this func=
tion fails.
>>    * The sanity checks are only to catch buggy user modesetting driver=
s which call
>> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank=
=2Ec
>> index 3417e1ac7918..10fe16bafcb6 100644
>> --- a/drivers/gpu/drm/drm_vblank.c
>> +++ b/drivers/gpu/drm/drm_vblank.c
>> @@ -1748,8 +1748,16 @@ int drm_wait_vblank_ioctl(struct drm_device *de=
v, void *data,
>>   	unsigned int pipe_index;
>>   	unsigned int flags, pipe, high_pipe;
>>  =20
>> -	if (!dev->irq_enabled)
>> -		return -EOPNOTSUPP;
>> +#if defined(CONFIG_DRM_LEGACY)
>> +	if  (unlikely(drm_core_check_feature(dev, DRIVER_LEGACY))) {
>> +		if (!dev->irq_enabled)
>> +			return -EOPNOTSUPP;
>> +	} else /* if DRIVER_MODESET */
>> +#endif
>> +	{
>> +		if (!drm_dev_has_vblank(dev))
>> +			return -EOPNOTSUPP;
>> +	}
>=20
> Sheesh I hate this kind of inline #ifdefs.
>=20
> Two alternate suggestions that I believe should be as just efficient:

Or how about:

static bool drm_wait_vblank_supported(struct drm_device *dev)

{

if defined(CONFIG_DRM_LEGACY)
	if  (unlikely(drm_core_check_feature(dev, DRIVER_LEGACY)))

		return dev->irq_enabled;

#endif
	return drm_dev_has_vblank(dev);

}


?

It's inline, but still readable.

Best regards
Thomas

>=20
> 1) The more verbose:
>=20
> #if defined(CONFIG_DRM_LEGACY)
> static bool drm_wait_vblank_supported(struct drm_device *dev)
> {
> 	if  (unlikely(drm_core_check_feature(dev, DRIVER_LEGACY)))
> 		return dev->irq_enabled;
> 	else
> 		return drm_dev_has_vblank(dev);
> }
> #else
> static bool drm_wait_vblank_supported(struct drm_device *dev)
> {
> 	return drm_dev_has_vblank(dev);
> }
> #endif
>=20
> 2) The more compact:
>=20
> static bool drm_wait_vblank_supported(struct drm_device *dev)
> {
> 	if  (IS_ENABLED(CONFIG_DRM_LEGACY) && unlikely(drm_core_check_feature(=
dev, DRIVER_LEGACY)))
> 		return dev->irq_enabled;
> 	else
> 		return drm_dev_has_vblank(dev);
> }
>=20
> Then, in drm_wait_vblank_ioctl().
>=20
> 	if (!drm_wait_vblank_supported(dev))
> 		return -EOPNOTSUPP;
>=20
> The compiler should do the right thing without any explicit inline
> keywords etc.
>=20
> BR,
> Jani.
>=20
>>  =20
>>   	if (vblwait->request.type & _DRM_VBLANK_SIGNAL)
>>   		return -EINVAL;
>> @@ -2023,7 +2031,7 @@ int drm_crtc_get_sequence_ioctl(struct drm_devic=
e *dev, void *data,
>>   	if (!drm_core_check_feature(dev, DRIVER_MODESET))
>>   		return -EOPNOTSUPP;
>>  =20
>> -	if (!dev->irq_enabled)
>> +	if (!drm_dev_has_vblank(dev))
>>   		return -EOPNOTSUPP;
>>  =20
>>   	crtc =3D drm_crtc_find(dev, file_priv, get_seq->crtc_id);
>> @@ -2082,7 +2090,7 @@ int drm_crtc_queue_sequence_ioctl(struct drm_dev=
ice *dev, void *data,
>>   	if (!drm_core_check_feature(dev, DRIVER_MODESET))
>>   		return -EOPNOTSUPP;
>>  =20
>> -	if (!dev->irq_enabled)
>> +	if (!drm_dev_has_vblank(dev))
>>   		return -EOPNOTSUPP;
>>  =20
>>   	crtc =3D drm_crtc_find(dev, file_priv, queue_seq->crtc_id);
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--zYjFVN6LbQJto7YyRvmktHhbjS3oGNxBZ--

--XeS7eJ5JPg7IwjZ7mWHplNVbGBiq1dAM5
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmDUQksFAwAAAAAACgkQlh/E3EQov+CO
tBAAscKEApzwALsL/afbcm5uKvx5iVv2dEDtvThHqwM/vLySjYR97Sf8prBBklUa9XgOJYT3X8rC
c0t3Uzq4+VIxvZIKgYydECvLfVRwq2MJXr3y5SxsFVA1GpH0kfHj0hoXjy5PINp3GJQReIlvReTd
OmKzv5fejYkixYbEmJcn/TMilZvcevMrgBTOybnVAoC37xDEochnf9GmoofpS5HnSuGFucNn+Wqv
REeGPKDeGDFyQHtGxv4vjsFqoJSiqWtQUemnQhuTeeZoPUbxDXU6sR77LDz/S3mmTDOmCPC8IFn1
/J+8HVQi1UJLew7unH7VVMbsIzhJs08qaebBl5uWcW2qElDlKIKShgCMmp1DhkmlVaUFoWeomP6R
DYL9GXnrbQ81rcOFipoZd/MYhO0F7TtLufsHBJ2t3KOwTYfLwXkF7NCwU7Sb/ABG+WcVFIW47I9s
qwtU3BXWIy2bp19c3bqCc4HX6+V847yKXSa5k6ZMy9KaraKlFtymY/fmDGwEhprS2DPM0VIl0qg7
yU0usq5cMV5Y9uREDDb3TFT1j+8HvvA0Ghm9dnhzYc9OAl44HtGp1pVaRFq/FL8Q4mG7fdeY8cSv
Yv9Eq4DU8xhTmGJfJa5lM6MgIL0Xc9Pkni9cetDt8+WTRgcNZqcfFYIF0+M99NEvfuoboHNBTcXJ
qWc=
=qKXa
-----END PGP SIGNATURE-----

--XeS7eJ5JPg7IwjZ7mWHplNVbGBiq1dAM5--
