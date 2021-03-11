Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10E52C433DB
	for <linux-tegra@archiver.kernel.org>; Thu, 11 Mar 2021 16:39:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C009564FE9
	for <linux-tegra@archiver.kernel.org>; Thu, 11 Mar 2021 16:39:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229555AbhCKQjL (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 11 Mar 2021 11:39:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229624AbhCKQjG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 11 Mar 2021 11:39:06 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B566C061574;
        Thu, 11 Mar 2021 08:39:06 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id u20so2967434lja.13;
        Thu, 11 Mar 2021 08:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/Wt6zu2wDU+WwjQUEX/ei8d5oKJH8V2SZGPKoU3it0E=;
        b=kj+VIfWtbIujvBFYLp6uMIimJvYo+cgt80RnEprvoIxikrzdReayksKM77nlrCO+gC
         YLzaMUQovkfFX2mXDQNbWrwFphUfwka9xg8MOSXS9VWHNH7rGmiDXcOjBCBMqr8uzTIm
         S+RjaWei0Ju61OB1UE5DYmeS5BDfG7tD+qb0NYndN5vVkWEB34FeOi8pldyqF0zvcYoP
         YFZCfh4whH79A4AqiFAFLoF8xwP7JlXOJFZ0HEiPyPFcqNQzZm4Nac4clu2tESD1W1+U
         c0DIP44B1ldRBbbLfK5QvWaR7swAAEztGa5goXrC4s3nauihgCei33dKEo7SrxUBxgNe
         zeow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/Wt6zu2wDU+WwjQUEX/ei8d5oKJH8V2SZGPKoU3it0E=;
        b=d9GrrKycw8fVdCWC468IcWQRFn0TjG/+dhDjbqqEjgAiGTLdSr+p6Z43ba2zo9skeM
         u8BO3atIQaYhukG2ZmQWm3y1zy/P/r+3UCfec8pz/Uup8CyeRqPqwSqWvShIRyhCKUV5
         PW4v5hiMR9lEcGd8YLTEf36X/cTJPOpCsFkoKRXehog7NdvT+rgH+av7+bOlOff6q3V7
         v6Z5aZ7bxstRiz/hMuA5SlAS47HsJqTBpqNP6G0VCXA7uj1ZMbHpf+l34zrRWYqEcKRI
         Y5wlW7PdTeKSaspet713hQWQGUoWoqBwR4fWvlRwupB3IoVKmtK+fHrpYC95w8q3u04q
         lprw==
X-Gm-Message-State: AOAM533Dra57gOc+rFY3YNA/X20t4zYgpiYQ6L2KZib70XeWJ011kZJi
        ybcMGGzTMC7S37ZrUqt/E9vieBJEZX8=
X-Google-Smtp-Source: ABdhPJwUBUe/Vd9bBYXVc+QD6912OcFAfO4NSVmbmRPYVIuhur32BgseSTAxD/4z87njIOgdD0fPRQ==
X-Received: by 2002:a2e:6e17:: with SMTP id j23mr5206586ljc.209.1615480744254;
        Thu, 11 Mar 2021 08:39:04 -0800 (PST)
Received: from [192.168.2.145] (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.googlemail.com with ESMTPSA id u11sm954944lfm.78.2021.03.11.08.39.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Mar 2021 08:39:03 -0800 (PST)
Subject: Re: [PATCH v2 4/5] reset: Add reset_control_bulk API
To:     kernel test robot <lkp@intel.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Paul Fertser <fercerpav@gmail.com>
Cc:     kbuild-all@lists.01.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20210311151554.23982-5-digetx@gmail.com>
 <202103120011.594e28Pm-lkp@intel.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <a56fce61-4601-2563-abe8-e08a855244df@gmail.com>
Date:   Thu, 11 Mar 2021 19:39:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <202103120011.594e28Pm-lkp@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

11.03.2021 19:32, kernel test robot пишет:
> Hi Dmitry,
> 
> I love your patch! Perhaps something to improve:
> 
> [auto build test WARNING on pza/reset/next]
> [also build test WARNING on asoc/for-next linus/master v5.12-rc2 next-20210311]
> [cannot apply to tegra/for-next]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:    https://github.com/0day-ci/linux/commits/Dmitry-Osipenko/Add-missing-reset-controls-to-NVIDIA-Tegra-ASoC-drivers/20210311-231938
> base:   https://git.pengutronix.de/git/pza/linux reset/next
> config: m68k-defconfig (attached as .config)
> compiler: m68k-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/0day-ci/linux/commit/082cad3274c4566ac97502fd137479791c318300
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Dmitry-Osipenko/Add-missing-reset-controls-to-NVIDIA-Tegra-ASoC-drivers/20210311-231938
>         git checkout 082cad3274c4566ac97502fd137479791c318300
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=m68k 
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
>    In file included from drivers/net/phy/mdio_bus.c:30:
>    include/linux/reset.h: In function 'reset_control_bulk_get_exclusive':
>>> include/linux/reset.h:215:9: warning: returning 'struct reset_control *' from a function with return type 'int' makes integer from pointer without a cast [-Wint-conversion]
>      215 |  return __reset_control_bulk_get(dev, num_rstcs, rstcs, false, false, true);
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/reset.h: In function 'reset_control_bulk_get_exclusive_released':
>    include/linux/reset.h:257:9: warning: returning 'struct reset_control *' from a function with return type 'int' makes integer from pointer without a cast [-Wint-conversion]
>      257 |  return __reset_control_bulk_get(dev, num_rstcs, rstcs, false, false, false);
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/reset.h: In function 'reset_control_bulk_get_optional_exclusive_released':
>    include/linux/reset.h:278:9: warning: returning 'struct reset_control *' from a function with return type 'int' makes integer from pointer without a cast [-Wint-conversion]
>      278 |  return __reset_control_bulk_get(dev, num_rstcs, rstcs, false, true, false);
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/reset.h: In function 'reset_control_bulk_get_shared':
>    include/linux/reset.h:323:9: warning: returning 'struct reset_control *' from a function with return type 'int' makes integer from pointer without a cast [-Wint-conversion]
>      323 |  return __reset_control_bulk_get(dev, num_rstcs, rstcs, true, false, false);
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/reset.h: In function 'reset_control_bulk_get_optional_exclusive':
>    include/linux/reset.h:360:9: warning: returning 'struct reset_control *' from a function with return type 'int' makes integer from pointer without a cast [-Wint-conversion]
>      360 |  return __reset_control_bulk_get(dev, num_rstcs, rstcs, false, true, true);
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/reset.h: In function 'reset_control_bulk_get_optional_shared':
>    include/linux/reset.h:397:9: warning: returning 'struct reset_control *' from a function with return type 'int' makes integer from pointer without a cast [-Wint-conversion]
>      397 |  return __reset_control_bulk_get(dev, num_rstcs, rstcs, true, true, false);
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/reset.h: In function 'devm_reset_control_bulk_get_exclusive':
>    include/linux/reset.h:522:9: warning: returning 'struct reset_control *' from a function with return type 'int' makes integer from pointer without a cast [-Wint-conversion]
>      522 |  return __devm_reset_control_bulk_get(dev, num_rstcs, rstcs, false, false, true);
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/reset.h: In function 'devm_reset_control_bulk_get_exclusive_released':
>    include/linux/reset.h:561:9: warning: returning 'struct reset_control *' from a function with return type 'int' makes integer from pointer without a cast [-Wint-conversion]
>      561 |  return __devm_reset_control_bulk_get(dev, num_rstcs, rstcs, false, false, false);
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/reset.h: In function 'devm_reset_control_bulk_get_optional_exclusive_released':
>    include/linux/reset.h:600:9: warning: returning 'struct reset_control *' from a function with return type 'int' makes integer from pointer without a cast [-Wint-conversion]
>      600 |  return __devm_reset_control_bulk_get(dev, num_rstcs, rstcs, false, true, false);
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/reset.h: In function 'devm_reset_control_bulk_get_shared':
>    include/linux/reset.h:635:9: warning: returning 'struct reset_control *' from a function with return type 'int' makes integer from pointer without a cast [-Wint-conversion]
>      635 |  return __devm_reset_control_bulk_get(dev, num_rstcs, rstcs, true, false, false);
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/reset.h: In function 'devm_reset_control_bulk_get_optional_exclusive':
>    include/linux/reset.h:673:9: warning: returning 'struct reset_control *' from a function with return type 'int' makes integer from pointer without a cast [-Wint-conversion]
>      673 |  return __devm_reset_control_bulk_get(dev, num_rstcs, rstcs, true, false, true);
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/reset.h: In function 'devm_reset_control_bulk_get_optional_shared':
>    include/linux/reset.h:711:9: warning: returning 'struct reset_control *' from a function with return type 'int' makes integer from pointer without a cast [-Wint-conversion]
>      711 |  return __devm_reset_control_bulk_get(dev, num_rstcs, rstcs, true, true, false);
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> 
> vim +215 include/linux/reset.h
> 
>    200	
>    201	/**
>    202	 * reset_control_bulk_get_exclusive - Lookup and obtain exclusive references to
>    203	 *                                    multiple reset controllers.
>    204	 * @dev: device to be reset by the controller
>    205	 * @num_rstcs: number of entries in rstcs array
>    206	 * @rstcs: array of struct reset_control_bulk_data with reset line names set
>    207	 *
>    208	 * Fills the rstcs array with pointers to exclusive reset controls and
>    209	 * returns 0, or an IS_ERR() condition containing errno.
>    210	 */
>    211	static inline int __must_check
>    212	reset_control_bulk_get_exclusive(struct device *dev, int num_rstcs,
>    213					 struct reset_control_bulk_data *rstcs)
>    214	{
>  > 215		return __reset_control_bulk_get(dev, num_rstcs, rstcs, false, false, true);
>    216	}
>    217	
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
> 

I missed to check the !CONFIG_RESET_CONTROLLER case, will make a v3.
