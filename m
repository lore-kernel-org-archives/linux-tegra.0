Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F17D1C4167D
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Nov 2023 14:06:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234213AbjKIOGW (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Nov 2023 09:06:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234496AbjKIOGQ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Nov 2023 09:06:16 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7E0C30D5
        for <linux-tegra@vger.kernel.org>; Thu,  9 Nov 2023 06:06:13 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-32fadd4ad09so597335f8f.1
        for <linux-tegra@vger.kernel.org>; Thu, 09 Nov 2023 06:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699538772; x=1700143572; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pxZUWQ4F40zRqPkf9cnMN/olRVp+fQNgO/dM14V2O3A=;
        b=IHtWKIUSNgUSJiVdKCIt5E6EXgm79h03jOkYTZRsJMDQdNynyYskJpam2a7AUpv0SC
         ylFwmciHpOhgz+oPCJkuDfYdzxneK6IM4jJyCbSfmX+BYMtVW8YSNbbSUk1Kf0jDk0dB
         qHALy6ydyeKd6+BtLYCxc2NVlnygnEqKyNR/bhxF4iz7YNvFt/SEz2MomzvtKvyuo/ws
         jQ1FablBNeTte5dF0GR3TPQHMki/7KNFRbHsvk4XEGIHODyoUaJTx6V12pyYr4se3Jv0
         p/VIBp1+eo+utqbkvwWdsIOWLiD2ttX2PpfvEJrflcj/EH+Uz44JViSMhKaCj3LruPoV
         KFkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699538772; x=1700143572;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pxZUWQ4F40zRqPkf9cnMN/olRVp+fQNgO/dM14V2O3A=;
        b=ncOWDPGUaCBXFBes/DtE8Wq7BfBE7uif+2DlHIBhwycP+wa5uc8s157p7FBo3nI3KG
         0Iy/oK53u7zY7XaTfKCV4CIk1y6bzb52C2q0XVirCavF8QejbdbfZXt4+Sfqa/eqTGVC
         /3u2XzovXORVFmQPbzeJkhH2KIMVEKSioGxa6dYHsf1e3UNnyE7/bxJ9V7YdhrFIexWw
         8JHZ7R8vkpv05lV0v4qQjOMLIQSHej/ywlaZoLfKaLglzjwn5c8ERsG0PgPF/zuQXN10
         30tTo+FKsexgGvbXb0cCTnBgTC+LTdrU6wfdup3FmiuIfK6DDbdQiFGTMMQ6LqSiWuz8
         LHiA==
X-Gm-Message-State: AOJu0YxKrIbpI7imEn35RABFWJvjc4bTAKovqXYHs2rSxLQWzs/HlIC2
        SQjbtMu6TL7dilFrEdPjcvzYKg==
X-Google-Smtp-Source: AGHT+IEBMJn8yuQNTcITsBFvk/YZTg2MCsW2mv4ijJpGxjWr8pDhStQVbeG+TtEBOO6Bu98VPzpT5w==
X-Received: by 2002:a5d:5888:0:b0:32f:8181:7d39 with SMTP id n8-20020a5d5888000000b0032f81817d39mr4959176wrf.9.1699538772251;
        Thu, 09 Nov 2023 06:06:12 -0800 (PST)
Received: from localhost (h3220.n1.ips.mtn.co.ug. [41.210.178.32])
        by smtp.gmail.com with ESMTPSA id m2-20020adffe42000000b0032dab20e773sm7390443wrs.69.2023.11.09.06.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 06:06:12 -0800 (PST)
Date:   Thu, 9 Nov 2023 17:05:52 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     ttynkkynen@nvidia.com
Cc:     linux-tegra@vger.kernel.org
Subject: [bug report] clk: tegra: Add closed loop support for the DFLL
Message-ID: <254ba073-c871-4edc-bc5d-dc3a146e8761@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hello Tuomas Tynkkynen,

The patch c4fe70ada40f: "clk: tegra: Add closed loop support for the
DFLL" from May 13, 2015 (linux-next), leads to the following Smatch
static checker warning:

	drivers/clk/tegra/clk-dfll.c:1828 dfll_fetch_i2c_params()
	error: 'regmap' dereferencing possible ERR_PTR()

drivers/clk/tegra/clk-dfll.c
    1816 static int dfll_fetch_i2c_params(struct tegra_dfll *td)
    1817 {
    1818         struct regmap *regmap;
    1819         struct device *i2c_dev;
    1820         struct i2c_client *i2c_client;
    1821         int vsel_reg, vsel_mask;
    1822         int ret;
    1823 
    1824         if (!read_dt_param(td, "nvidia,i2c-fs-rate", &td->i2c_fs_rate))
    1825                 return -EINVAL;
    1826 
    1827         regmap = regulator_get_regmap(td->vdd_reg);

regulator_get_regmap() can return error pointers.  Static checkers
*love* error checking.  :P

--> 1828         i2c_dev = regmap_get_device(regmap);
    1829         i2c_client = to_i2c_client(i2c_dev);
    1830 
    1831         td->i2c_slave_addr = i2c_client->addr;
    1832 
    1833         ret = regulator_get_hardware_vsel_register(td->vdd_reg,
    1834                                                    &vsel_reg,
    1835                                                    &vsel_mask);
    1836         if (ret < 0) {
    1837                 dev_err(td->dev,
    1838                         "regulator unsuitable for DFLL I2C operation\n");
    1839                 return -EINVAL;
    1840         }
    1841         td->i2c_reg = vsel_reg;
    1842 
    1843         return 0;
    1844 }

regards,
dan carpenter
