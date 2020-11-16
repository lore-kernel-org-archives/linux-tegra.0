Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45A6BC4742C
	for <linux-tegra@archiver.kernel.org>; Mon, 16 Nov 2020 09:18:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D09732224F
	for <linux-tegra@archiver.kernel.org>; Mon, 16 Nov 2020 09:18:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JlfwS0Uv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726353AbgKPIsm (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 16 Nov 2020 03:48:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726291AbgKPIsm (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 16 Nov 2020 03:48:42 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11111C0613CF
        for <linux-tegra@vger.kernel.org>; Mon, 16 Nov 2020 00:48:41 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id r17so17776523wrw.1
        for <linux-tegra@vger.kernel.org>; Mon, 16 Nov 2020 00:48:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=WGmvI1sWi9YS1j1s8WAMZhMvIFqQdHs+K1s428Cn3EE=;
        b=JlfwS0UvNDwFmEgGMj5EpB6k4TDUTpdAm5kOcfbI5FqVOSy01Wrj58s25oJjofd/00
         bEhMrasHaeFAjOslOhnJSwDg83N0Sbn7XihT/hB2L7rsg0+lF9ndYgW/D+RZDSy9A/g+
         uz99XgdaxlyqPrOngFaf8VVq8G3bEKKI5RyTFYLUaHpfXOMo24NinVvLdTl2wkhDnt3E
         Uz2LHRzBg3lVCVoWAI2lIx0UCnBqU2bDlda4RqYQIrl3NQqw5a6s568LgOUK23mNAcYV
         pw0v+q6YAl3nc/pzEG59sxOWByT/NvFSmz+75IF2CIK6vzbsS9ey5Lbx++Xp2gOwILEr
         crKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=WGmvI1sWi9YS1j1s8WAMZhMvIFqQdHs+K1s428Cn3EE=;
        b=cdJ3B8nE2m6Hv7WMznscAIQeXqF3oq0coMFMdmUOlPIqhiSfh5etpnUEzLFvB4ncbd
         rBkbM+hJ+jZ0HFC+9+Kx3FxhFZ245i155xY3SN3DDl3EWMV4J2nDnspOl/8CVPgGH5KQ
         Wky/gcrFpMPPWCWoDStbqIKVD4LYjTQpHLbHZMzdZbaw/mFp2AeJ/aVTTHcL7I1160S2
         v8PC0T2Y7WP481YzM3ziT3kaGmPbzzoIzfl4P24JWTFpNfWQL6ixCWPIVpREQq0zG6B/
         IKU+iqcugy1lRm1zE78VygwsLT0RlARvg/LAlUlyha8sFQ2kfM57u0ECtaOZFkPpp4ko
         RgfQ==
X-Gm-Message-State: AOAM53374deoTip9AwKtRYaWw0hmvHH/YkORzg2uWWO3TyuKSmlRh9uv
        ry3dE/0tuV8X9qvnCA4olfNPyQ==
X-Google-Smtp-Source: ABdhPJxDy+rP4A3/2HyukiqNQ0qJNHNSRtosWCvndXLoFdyArjC6L6zgQXC8EIML7eOOmBOqQBT66g==
X-Received: by 2002:a5d:50c6:: with SMTP id f6mr19207527wrt.150.1605516519793;
        Mon, 16 Nov 2020 00:48:39 -0800 (PST)
Received: from dell ([91.110.221.159])
        by smtp.gmail.com with ESMTPSA id a12sm21346583wrr.31.2020.11.16.00.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 00:48:39 -0800 (PST)
Date:   Mon, 16 Nov 2020 08:48:37 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Dan Murphy <dmurphy@ti.com>,
        Sebastian Reichel <sre@kernel.org>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/4] mfd: Add driver for Embedded Controller found on
 Acer Iconia Tab A500
Message-ID: <20201116084837.GM3718728@dell>
References: <20201104203403.24937-1-digetx@gmail.com>
 <20201104203403.24937-3-digetx@gmail.com>
 <20201113093747.GJ2787115@dell>
 <3ad644fd-cd03-a1e1-36d9-014304fdfcee@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3ad644fd-cd03-a1e1-36d9-014304fdfcee@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, 16 Nov 2020, Dmitry Osipenko wrote:

> 13.11.2020 12:37, Lee Jones пишет:
> ...
> >> +config MFD_ACER_A500_EC
> >> +	tristate "Embedded Controller driver for Acer Iconia Tab A500"
> > 
> > Drop "driver".  This is meant to be describing the device.
> > 
> >> +	depends on I2C
> > 
> > depends on OF ?
> ...
> >> +	depends on ARCH_TEGRA_2x_SOC || COMPILE_TEST
> >> +	select MFD_CORE
> >> +	select REGMAP
> >> +	help
> 
> ARCH_TEGRA_2x_SOC selects OF.
> 
> For COMPILE_TEST it doesn't matter since OF framework provides stubs for
> !OF.

I always thought it was best to be explicit.

> ...
> >> +static int a500_ec_read(void *context, const void *reg_buf, size_t reg_size,
> >> +			void *val_buf, size_t val_sizel)
> >> +{
> >> +	struct i2c_client *client = context;
> >> +	unsigned int reg, retries = 5;
> >> +	u16 *ret_val = val_buf;
> >> +	s32 ret = 0;
> >> +
> >> +	if (reg_size != 1 || val_sizel != 2)
> > 
> > No magic numbers please.
> > 
> > What does this *mean*?
> 
> These are the size of address register and size of a read value, both in
> bytes.

Great.  But don't tell me that.  You need to tell the next person who
reads this code, and the next, and the next.  Defines work best for
this.  Comments are also okay.

> >> +		return -EOPNOTSUPP;
> > 
> > Why EOPNOTSUPP?
> 
> Other sizes aren't supported by embedded controller.
> 
> Although, perhaps this check isn't really needed at all since the sizes
> are already expressed in the a500_ec_regmap_config.
> 
> I'll need to take a closer look at why this size-checking was added
> because don't quite remember already. If it's not needed, then I'll
> remove it in the next revision, otherwise will add a clarifying comment.

"Operation not supported on transport endpoint" doesn't seem like a
good fit here.  If the check says, please consider changing it to
something like -EINVAL.

> >> +	reg = *(u8 *)reg_buf;
> >> +
> >> +	while (retries-- > 0) {
> >> +		ret = i2c_smbus_read_word_data(client, reg);
> >> +		if (ret >= 0)
> >> +			break;
> >> +
> >> +		msleep(A500_EC_I2C_ERR_TIMEOUT);
> >> +	}
> >> +
> >> +	if (ret < 0) {
> >> +		dev_err(&client->dev, "read 0x%x failed: %d\n", reg, ret);
> >> +		return ret;
> >> +	}
> >> +
> >> +	*ret_val = ret;
> >> +
> >> +	if (reg == REG_CURRENT_NOW)
> >> +		fsleep(10000);
> > 
> > Ooo, new toy!
> > 
> >> +	return 0;
> >> +}
> > 
> > I'm surprised there isn't a generic function which does this kind of
> > read.  Seems like pretty common/boilerplate stuff.
> 
> I'm not quite sure that this is a really very common pattern which
> deserves a generic helper.

What?  Read from I2C a few times, then sleep sounds like a pretty
common pattern to me.

> ...
> >> +static int a500_ec_restart_notify(struct notifier_block *this,
> >> +				  unsigned long reboot_mode, void *data)
> >> +{
> >> +	if (reboot_mode == REBOOT_WARM)
> >> +		i2c_smbus_write_word_data(a500_ec_client_pm_off,
> >> +					  REG_WARM_REBOOT, 0);
> >> +	else
> >> +		i2c_smbus_write_word_data(a500_ec_client_pm_off,
> >> +					  REG_COLD_REBOOT, 1);
> > 
> > What's with the magic '0' and '1's at the end?
> 
> These are the values which controller's firmware wants to see, otherwise
> it will reject command as invalid. I'll add a clarifying comment to the
> code.

Thanks.  Hopefully with a bit more information as to why the firmware
expects to see them.  Hopefully they're not random.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
