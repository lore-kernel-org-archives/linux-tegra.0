Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86341C48BCF
	for <linux-tegra@archiver.kernel.org>; Sat, 12 Jun 2021 13:56:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4D2B8613AA
	for <linux-tegra@archiver.kernel.org>; Sat, 12 Jun 2021 13:56:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231165AbhFLN6S (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 12 Jun 2021 09:58:18 -0400
Received: from mail-lf1-f48.google.com ([209.85.167.48]:37883 "EHLO
        mail-lf1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230191AbhFLN6Q (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 12 Jun 2021 09:58:16 -0400
Received: by mail-lf1-f48.google.com with SMTP id p7so13079828lfg.4;
        Sat, 12 Jun 2021 06:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=AEFhASB6FA/sHSDoXSCJ570NmZcT07RYolnmbpHiMTE=;
        b=Skxwgi9RubBgGnhzJqe+B/AVGoxz0CTV1XIW5b/+vwG4RVNeiNTn/DoRIPpSn7FVNA
         E45P0erFzlHW/kWbzF9qeB9aBwHkkVmoFyCKf4CHANJAXE6j+8LtU7a7UgMxUhL8WAwd
         mv3GAFD814FHCqQiMdW7WlBYHcUppewtCXdUI34OTuTubZNkdzyIrS1mCpZj/BeEkfDY
         q4gcpe8FEA9pKhMD0d1OfnehO6VKBy3qN4QhcgLbI2T485pwtHjODPloJUTaoPG1ruJ9
         hr8fpZnbYF+3F1YVy+pHGTsVlg9t/D29zWD1JiLDZTHnNQQPjI3xNYJGzVExv97jYi2q
         Uc6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=AEFhASB6FA/sHSDoXSCJ570NmZcT07RYolnmbpHiMTE=;
        b=gj6f1PJ7siTIFyUecYMKfrsTDDSye1YTzOivAivpJdgZtWH+OccJKo+GUgHpil2QMS
         O9ncwyUo0lHdnNa+SziogRDHn2Jv9w2xwpkJKpxAkcmLOwX4mplgTurvXBE1LAerqGob
         gyzEZj9wBw8/M+nyGpjrbHlay2xOD9KHViE5x0EeXkLgSqQfRiTxa8XcvnM1JKNWB1u1
         alq4aE1Q0sPjXWJrZULo3uKn5D/sRvTC/RIVf6+F77gxEYypRmoaw50mcOzE4ECpNhW8
         ZpjLNdB/SGRtaPCjOSpGMi1iqQqkhijeErSn7deq4Y9lBfOY+7yC3INfqg96T61ZqFCy
         uuGQ==
X-Gm-Message-State: AOAM5335oIRjpPPR8ocx1iyXvcKlry2q6eJIMsAbueDID18a7sUIIwWG
        2h1y3fwQybBsm5BN3H1AbU0ZZh1UDZo=
X-Google-Smtp-Source: ABdhPJwrYXbQ0qxTrcqAQSmIDmbRI3MfCeLIKbfrW3CrTrhxNUAuyQBB4QFwxUUk82IZxli2COVtZQ==
X-Received: by 2002:a05:6512:c23:: with SMTP id z35mr1210901lfu.549.1623506116048;
        Sat, 12 Jun 2021 06:55:16 -0700 (PDT)
Received: from [192.168.2.145] (94-29-21-60.dynamic.spd-mgts.ru. [94.29.21.60])
        by smtp.googlemail.com with ESMTPSA id d4sm900138lfk.295.2021.06.12.06.55.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Jun 2021 06:55:15 -0700 (PDT)
Subject: Re: [PATCH v1] usb: chipidea: tegra: Delay PHY suspending
To:     Peter Chen <peter.chen@kernel.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter Chen <Peter.Chen@nxp.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Felipe Balbi <balbi@kernel.org>,
        Maxim Schwalm <maxim.schwalm@gmail.com>,
        linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210609120404.3991-1-digetx@gmail.com>
 <20210612073450.GB4580@Peter>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <968bdb71-0c36-b8c7-3d8a-42d494c8a7cd@gmail.com>
Date:   Sat, 12 Jun 2021 16:55:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210612073450.GB4580@Peter>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

12.06.2021 10:34, Peter Chen пишет:
> On 21-06-09 15:04:04, Dmitry Osipenko wrote:
>> The ChipIdea driver enters into suspend immediately after seeing a
>> VBUS disconnection. Some devices need an extra delay after losing
>> VBUS, otherwise VBUS may be floating, preventing the PHY's suspending
>> by the VBUS detection sensors. This problem was found on Tegra30 Asus
>> Transformer TF700T tablet device, where the USB PHY wakes up immediately
>> from suspend because VBUS sensor continues to detect VBUS as active after
>> disconnection. A minimum delay of 20ms is needed in order to fix this
>> issue, hence add 25ms delay before suspending the PHY.
>>
>> Reported-by: Maxim Schwalm <maxim.schwalm@gmail.com> # Asus TF700T
>> Tested-by: Maxim Schwalm <maxim.schwalm@gmail.com> # Asus TF700T
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/usb/chipidea/ci_hdrc_tegra.c | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c b/drivers/usb/chipidea/ci_hdrc_tegra.c
>> index 60361141ac04..d1359b76a0e8 100644
>> --- a/drivers/usb/chipidea/ci_hdrc_tegra.c
>> +++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
>> @@ -4,6 +4,7 @@
>>   */
>>  
>>  #include <linux/clk.h>
>> +#include <linux/delay.h>
>>  #include <linux/io.h>
>>  #include <linux/module.h>
>>  #include <linux/of_device.h>
>> @@ -255,6 +256,13 @@ static int tegra_ehci_hub_control(struct ci_hdrc *ci, u16 typeReq, u16 wValue,
>>  
>>  static void tegra_usb_enter_lpm(struct ci_hdrc *ci, bool enable)
>>  {
>> +	/*
>> +	 * Give hardware time to settle down after VBUS disconnection,
>> +	 * otherwise PHY may wake up from suspend immediately.
>> +	 */
>> +	if (enable)
>> +		msleep(25);
>> +
> 
> How could you know 25ms is enough for other Tegra designs?

I don't know what is the maximum timeout could be, but it shouldn't be a
problem to bump the timeout if somebody will report the need to do so.

> Could you poll VBUS wakeup threshold register to ensure the
> wakeup will not occur?

We indeed can poll the wakeup threshold status in the PHY driver, it
works too. I'll make the patch for the PHY driver, thank you for the
suggestion.

> The similar design exists at function:
> hw_wait_vbus_lower_bsv.

The hw_wait_vbus_lower_bsv uses 5sec timeout, which should be too much.
I'll set the polling timeout to 100ms.
