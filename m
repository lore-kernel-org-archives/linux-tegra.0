Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3A74C48BE5
	for <linux-tegra@archiver.kernel.org>; Wed, 23 Jun 2021 06:43:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 843C861350
	for <linux-tegra@archiver.kernel.org>; Wed, 23 Jun 2021 06:43:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229844AbhFWGp1 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 23 Jun 2021 02:45:27 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:37996 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229660AbhFWGp1 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 23 Jun 2021 02:45:27 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
        (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 7EC9E1FD67;
        Wed, 23 Jun 2021 06:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1624430589; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=TlGZRZ99uCIt4JDAjOFXnswm4yaCa3ZMTl87RK83waE=;
        b=UL41/fdqkxp8KiBTP5sNgkK3QzSU6SjtYTCEKYkWMnVzCi0BsNO6N7H6Z/xHRP1nMXJTSK
        uAOvfeYpPY7ReQoGYz0BeGd1DtemAc5QyqOXIZOtYXgrkn7Ds1VLptp+gjp1TLwppTBvXC
        xy1xTFf1031DvsP89g+ewUEcPYWmU8w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1624430589;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=TlGZRZ99uCIt4JDAjOFXnswm4yaCa3ZMTl87RK83waE=;
        b=hrob67bWMmViAg5CAyhvDg8xtRHrAUBAM0VSFniEqSI0myWGdc/UaBO6QCSVllrliNsDjF
        D7AeOlonnA0UfzBQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
        by imap.suse.de (Postfix) with ESMTP id 7CE9211A97;
        Wed, 23 Jun 2021 06:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1624430589; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=TlGZRZ99uCIt4JDAjOFXnswm4yaCa3ZMTl87RK83waE=;
        b=UL41/fdqkxp8KiBTP5sNgkK3QzSU6SjtYTCEKYkWMnVzCi0BsNO6N7H6Z/xHRP1nMXJTSK
        uAOvfeYpPY7ReQoGYz0BeGd1DtemAc5QyqOXIZOtYXgrkn7Ds1VLptp+gjp1TLwppTBvXC
        xy1xTFf1031DvsP89g+ewUEcPYWmU8w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1624430589;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=TlGZRZ99uCIt4JDAjOFXnswm4yaCa3ZMTl87RK83waE=;
        b=hrob67bWMmViAg5CAyhvDg8xtRHrAUBAM0VSFniEqSI0myWGdc/UaBO6QCSVllrliNsDjF
        D7AeOlonnA0UfzBQ==
Received: from director2.suse.de ([192.168.254.72])
        by imap3-int with ESMTPSA
        id RGKAHfzX0mBnawAALh3uQQ
        (envelope-from <tzimmermann@suse.de>); Wed, 23 Jun 2021 06:43:08 +0000
To:     Liviu Dudau <liviu.dudau@arm.com>
Cc:     daniel@ffwll.ch, airlied@linux.ie, alexander.deucher@amd.com,
        christian.koenig@amd.com, Xinhui.Pan@amd.com,
        james.qian.wang@arm.com, mihail.atanassov@arm.com,
        brian.starkey@arm.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, inki.dae@samsung.com, jy0922.shim@samsung.com,
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
        michal.simek@xilinx.com, amd-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-mediatek@lists.infradead.org, nouveau@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org
References: <20210622141002.11590-1-tzimmermann@suse.de>
 <20210622141002.11590-5-tzimmermann@suse.de>
 <20210622152504.2sw6khajwydsoaqa@e110455-lin.cambridge.arm.com>
From:   Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 04/22] drm: Don't test for IRQ support in VBLANK ioctls
Message-ID: <f7e72a3c-df86-2d4b-2caa-bf91442290a9@suse.de>
Date:   Wed, 23 Jun 2021 08:43:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210622152504.2sw6khajwydsoaqa@e110455-lin.cambridge.arm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="7jLGShJWLlf8CSqVlOcnyBWWcy9Lp6Rkb"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--7jLGShJWLlf8CSqVlOcnyBWWcy9Lp6Rkb
Content-Type: multipart/mixed; boundary="3ihYu1sFcNnMMAMmUEcEMG76YaQ22m49E";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Liviu Dudau <liviu.dudau@arm.com>
Cc: daniel@ffwll.ch, airlied@linux.ie, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, james.qian.wang@arm.com,
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
 michal.simek@xilinx.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org,
 nouveau@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org
Message-ID: <f7e72a3c-df86-2d4b-2caa-bf91442290a9@suse.de>
Subject: Re: [PATCH v2 04/22] drm: Don't test for IRQ support in VBLANK ioctls
References: <20210622141002.11590-1-tzimmermann@suse.de>
 <20210622141002.11590-5-tzimmermann@suse.de>
 <20210622152504.2sw6khajwydsoaqa@e110455-lin.cambridge.arm.com>
In-Reply-To: <20210622152504.2sw6khajwydsoaqa@e110455-lin.cambridge.arm.com>

--3ihYu1sFcNnMMAMmUEcEMG76YaQ22m49E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Liviu

Am 22.06.21 um 17:25 schrieb Liviu Dudau:
> Hello,
>=20
> On Tue, Jun 22, 2021 at 04:09:44PM +0200, Thomas Zimmermann wrote:
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
>> v2:
>> 	* keep the old test for legacy drivers in
>> 	  drm_wait_vblank_ioctl() (Daniel)
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>   drivers/gpu/drm/drm_irq.c    | 10 +++-------
>>   drivers/gpu/drm/drm_vblank.c | 13 +++++++++----
>>   2 files changed, 12 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_irq.c b/drivers/gpu/drm/drm_irq.c
>> index c3bd664ea733..1d7785721323 100644
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
>> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank=
=2Ec
>> index 3417e1ac7918..a98a4aad5037 100644
>> --- a/drivers/gpu/drm/drm_vblank.c
>> +++ b/drivers/gpu/drm/drm_vblank.c
>> @@ -1748,8 +1748,13 @@ int drm_wait_vblank_ioctl(struct drm_device *de=
v, void *data,
>>   	unsigned int pipe_index;
>>   	unsigned int flags, pipe, high_pipe;
>>  =20
>> -	if (!dev->irq_enabled)
>> -		return -EOPNOTSUPP;
>> +	if  (drm_core_check_feature(dev, DRIVER_MODESET)) {
>> +		if (!drm_dev_has_vblank(dev))
>> +			return -EOPNOTSUPP;
>> +	} else {
>> +		if (!dev->irq_enabled)
>> +			return -EOPNOTSUPP;
>> +	}
>=20
> For a system call that is used quite a lot by userspace we have increas=
ed the code size
> in a noticeable way. Can we not cache it privately?

I'm not quite sure that I understand your concern. The additionally=20
called functions are trivial one-liners; probably inlined anyway.

However, irq_enabled is only relevant for legacy drivers and will=20
eventually disappear behind CONFIG_DRM_LEGACY. We can rewrite the test=20
like this:

ifdef CONFIG_DRM_LEGACY
   if (unlikely(check_feature(dev, DRIVER_LEGACY))) {
     if (!irq_enabled)
       return;
   } else
#endif
   {
     if (!has_vblank_support(dev))
       return;
   }

As CONFIG_DRM_LEGACY is most likely disabled on concurrent systems, we'd =

get a single test for the modern drivers. If DRM_LEGACYis on, the=20
compiler at least knows that the else branch is preferred.

Best regards
Thomas

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--3ihYu1sFcNnMMAMmUEcEMG76YaQ22m49E--

--7jLGShJWLlf8CSqVlOcnyBWWcy9Lp6Rkb
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmDS1/sFAwAAAAAACgkQlh/E3EQov+DQ
GBAAgLEWLgvBzCF5hV0mjIUdLsPzDOR+sZaMmkihftgMzVIfDXBMfZp4PON/h5XP/oa3S7zWw9+W
RaNndoHIiRezAR4dnNcXern7ByoYb3kFLVlzcdpjZYvhitX8fUEanpR8nSXzouFAPuevtw8dNzr3
pyvXZCqqdXCmGz09Qrfc48j7bCYMgZ/b21GUHjKRGIC7JFkcSnGm2JopJOCsc9EiUD7tr0l7VfwS
/H0ho3e9vLqI/p+1MdU/KMUjItmN71b2VEm8yp0KPceIEiCgsggBrW4np4kg8qoBrSVFNT+NDy1O
weBoJYVfyPVT4UJXatHhqff7l9GUVWHtk2h2JfMrPIGj4qc15wiXUAiY9Goi5+z/9MgpJLl0TkXt
GkxkK4Vdx1AdFMhNfE0PqmHjp1pOlLU/apueEhoeVslIwyatSi2cuTLKmRylHOzBYQhK9VsnS0Ip
bLKBFuKu1QNELEqow7/6jmoneBg7LQwCtrFUZZ1juJfaHqCGttl8f4SleboXZe0fb8nPAgrQPItN
TNb/u1tvc0hQhQ2DooSdMzvuCsM5qPlCi2ZLUwNNsj9uJo6rYJ49Xv7ay4pKE0TWQQN9MC+oyaa1
InbjRqUF5ubLt361DDxI0YuEq7FBhvcQ1dC0J4I/uKgXvATLllGtOvUzyK0ZAkiXQZ+UKkd0HRDx
v9w=
=aQqG
-----END PGP SIGNATURE-----

--7jLGShJWLlf8CSqVlOcnyBWWcy9Lp6Rkb--
