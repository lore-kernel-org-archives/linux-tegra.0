Return-Path: <SRS0=WsFM=DI=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2E89C4727E
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Oct 2020 21:02:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 67DC920848
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Oct 2020 21:02:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AN/J5VwA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727891AbgJAVC0 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 1 Oct 2020 17:02:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726606AbgJAVC0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 1 Oct 2020 17:02:26 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A1F0C0613D0;
        Thu,  1 Oct 2020 14:02:26 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id u4so22995ljd.10;
        Thu, 01 Oct 2020 14:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=SSNs0bfnfbFBTT00Scc/o2Q4LHQ5DSHk1qEp/Pz4D8E=;
        b=AN/J5VwADYA76Pgb1ILLs3QyvSdQKgGFA89Kz1paL/SRfryKOCMqk6zlKdaD9gorXU
         J6emBupStWrUuHgxUd0ww5/fdlFRlQyxd1neUPsaveIVpE0dt2+73cC53ynTFyE0UsmB
         U8RJikjArbMo3qKrJTvHtpZs4Excgn57IjeA4/1C2UIr/6khVCfA+1+BiNiMQymXXmeN
         o9BxJZZFMEyg6yEhKd1tYGb6efUxGNjV94/zCuNqpYeWxswaFQKxUbpH4IE/bixZgC5c
         bWO2pnew4qNYuc8wobT909+iNWVACvta0ikYoM4I9HyjMRWs4GyCNC38Hrj0Cp/Z0qNA
         8MBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SSNs0bfnfbFBTT00Scc/o2Q4LHQ5DSHk1qEp/Pz4D8E=;
        b=l3pYDtZYUBStPzqtVwKgckNls5XDK0r7UMPDc3evKkH8knZCSJRV0rs99Bvif2VNXZ
         DvXl9az9h9xU/RHRXX7fCyy6PUCVILn3ziXDWPwmWwvCHJmXNuje9TC1+oPjiRXoOMB+
         l95qQNhDfCaCUx2pUF3n/BZ4pw01N47/u4emL/wYF48v0lUQV/rqo7NexoyL4Smt9EC6
         /2Ld+VAGurNbR+w4KOIryD6w4QR4aN7l5Kzxnx9MQEYas5EZ+8uVJeWM9rs9oI9rY3LV
         1bTYUUaIyoyeFjgZokTsDIirJ5JmOyQCjQdkubt/eGJDL9aT4F0zBHDzPHhSVl4hzRa1
         Y0Fg==
X-Gm-Message-State: AOAM531vBdCyXx6sSw/aWZUVNJ2R6o3xd4yTRqpDi2DE5B15xm7qCAZ3
        G/zex34Y8deq7ZBvEPVTg5p2oTLT2Cg=
X-Google-Smtp-Source: ABdhPJz5XnRfga60sGw0/6zljLrglpxtNc3A59nAJ7RuHN1rqqluDt0t8vcaChmCNLiNImD8glh2Mg==
X-Received: by 2002:a05:651c:200b:: with SMTP id s11mr2830951ljo.196.1601586144655;
        Thu, 01 Oct 2020 14:02:24 -0700 (PDT)
Received: from [192.168.2.145] ([109.252.91.252])
        by smtp.googlemail.com with ESMTPSA id h24sm560686lja.32.2020.10.01.14.02.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2020 14:02:23 -0700 (PDT)
Subject: Re: [PATCH v3 10/13] ASoC: tegra: Add audio graph based card driver
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Sameer Pujar <spujar@nvidia.com>, broonie@kernel.org,
        lgirdwood@gmail.com, robh+dt@kernel.org,
        kuninori.morimoto.gx@renesas.com,
        pierre-louis.bossart@linux.intel.com, perex@perex.cz,
        tiwai@suse.com, thierry.reding@gmail.com, jonathanh@nvidia.com
Cc:     alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        sharadg@nvidia.com, mkumard@nvidia.com, viswanathl@nvidia.com,
        rlokhande@nvidia.com, dramesh@nvidia.com, atalambedu@nvidia.com,
        nwartikar@nvidia.com, swarren@nvidia.com, nicoleotsuka@gmail.com
References: <1601573587-15288-1-git-send-email-spujar@nvidia.com>
 <1601573587-15288-11-git-send-email-spujar@nvidia.com>
 <98f01f9e-96f8-6867-1af3-475294e81a9d@gmail.com>
Message-ID: <352b5f57-baa5-8905-4ac9-1281268270a8@gmail.com>
Date:   Fri, 2 Oct 2020 00:02:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <98f01f9e-96f8-6867-1af3-475294e81a9d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

01.10.2020 23:57, Dmitry Osipenko пишет:
> 01.10.2020 20:33, Sameer Pujar пишет:
>> +/* Setup PLL clock as per the given sample rate */
>> +static int tegra_audio_graph_update_pll(struct snd_pcm_substream *substream,
>> +					struct snd_pcm_hw_params *params)
>> +{
>> +	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
>> +	struct asoc_simple_priv *priv = snd_soc_card_get_drvdata(rtd->card);
>> +	struct device *dev = rtd->card->dev;
>> +	struct tegra_audio_graph_data *graph_data =
>> +		(struct tegra_audio_graph_data *)priv->data;
>> +	struct tegra_audio_chip_data *chip_data =
>> +		(struct tegra_audio_chip_data *)of_device_get_match_data(dev);
> 
> void* doesn't need casting
> 

There are several similar places in the code. Not a big deal, but this
makes code less readable than it could be.
