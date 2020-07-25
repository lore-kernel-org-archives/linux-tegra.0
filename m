Return-Path: <SRS0=u+5c=BE=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22968C433E1
	for <linux-tegra@archiver.kernel.org>; Sat, 25 Jul 2020 12:31:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ED8E4206F6
	for <linux-tegra@archiver.kernel.org>; Sat, 25 Jul 2020 12:31:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nIWBYsW2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726944AbgGYMbZ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 25 Jul 2020 08:31:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726583AbgGYMbZ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 25 Jul 2020 08:31:25 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A512C0619D3
        for <linux-tegra@vger.kernel.org>; Sat, 25 Jul 2020 05:31:25 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id o13so6890032pgf.0
        for <linux-tegra@vger.kernel.org>; Sat, 25 Jul 2020 05:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=j29KhIrGJix5VQbo0z0xBiUNmdSYwoD3UiYGLNHhpGc=;
        b=nIWBYsW2uExLVeaoRdB8y3ebtVstNAtY8Nam+Y7dRnEvpErQ4xghiMqVLz6u3k3AW3
         CIP5EA6m8Z0uWSmkeJvNcn85erR8BPHDtvLjC07e9YTu3WLiiIhd65oqXuRJRi8W3zQj
         zY6OsT9E817O1CsFrbKbbnZh+LbPPqDWHKUhqQHLt8wOXigxzuKuupKSFtOM/e+s0he4
         AXWtH686ILo3Db9tJTx1hCc4m4DOQQRWZoEuh0VMrKge2mIgZ6oIpuHq4x1ZPfD974cD
         kcS8+7Z6m1lDhBI8E23ksnJ1aLhG/oUdwI3PoURGUlXWzAez1kqbujwZLosjwoYOKS+z
         nm9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=j29KhIrGJix5VQbo0z0xBiUNmdSYwoD3UiYGLNHhpGc=;
        b=TFqpc9Q8sEc84caDXvs+LBV5gunMzN3LD62yZ0pHYNPPGvwSHh429968TIo5KLsSAP
         SMYJ1ZukiT8wH2EIeUEs6Sd4aBFkT4gXJFcvzWtLoZVpEQWcB5fWTi8iaxUAntp+blsv
         Y0Q1mNI/bD7y0YfST0LBuR3G3x880TrJ/+c46KbVv+QUaDkLuCvx+SkaLAW93K9itBfv
         T4SVwHtzuL3S02UlpNJZ8RFZK7Q4OZyM8g5PqQGPjjoLknouujyrlMLIJKPrJQF8BRPg
         gAX548CSsD84jTFsCB4ewQeR9DJc3O4Q0AMFDOBTPTVgWmhVefOpM9d4T6g+MR7Q8gSr
         jE7w==
X-Gm-Message-State: AOAM530CT/G7yaDr+yIphkCbPThqq/8qHwDAvQ0Z9dj8ASAlX/PrB4WU
        rG3fr/icQnE+VEvLVQFzyvQ=
X-Google-Smtp-Source: ABdhPJzAkLREc+JJG24EqqpOgxwnarQaUqRjHaB6TKl782hbqkb9+zeV0TlMXC/vzbTH6PTr3aOAtQ==
X-Received: by 2002:a65:400a:: with SMTP id f10mr12004851pgp.197.1595680284652;
        Sat, 25 Jul 2020 05:31:24 -0700 (PDT)
Received: from [192.168.0.109] ([1.186.115.27])
        by smtp.gmail.com with ESMTPSA id q24sm9495169pfg.95.2020.07.25.05.31.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Jul 2020 05:31:23 -0700 (PDT)
Subject: Re: [PATCH v4] staging: nvec: change usage of slave to secondary
To:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     marvin24@posteo.de, gregkh@linuxfoundation.org,
        p.zabel@pengutronix.de, ac100@lists.launchpad.net,
        linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org,
        Dan Carpenter <dan.carpenter@oracle.com>
References: <20200724043633.7755-1-bharadwaj.rohit8@gmail.com>
 <20200725062938.15388-1-bharadwaj.rohit8@gmail.com>
 <20200725120146.GB26689@qmqm.qmqm.pl>
From:   Rohit K Bharadwaj <bharadwaj.rohit8@gmail.com>
Message-ID: <5597e949-b93c-9133-efdb-9714637f9ebc@gmail.com>
Date:   Sat, 25 Jul 2020 18:01:19 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200725120146.GB26689@qmqm.qmqm.pl>
Content-Type: text/plain; charset=iso-8859-2
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 25/07/20 5:31 pm, Micha³ Miros³aw wrote:
> On Sat, Jul 25, 2020 at 11:59:39AM +0530, Rohit K Bharadwaj wrote:
>> changed usage of slave (which is deprecated) to secondary without breaking the driver
> 
> The relevant I2C and SMBus standards use master/slave terminology. Why are
> you changing the names to something unfamiliar?
> 
> If the reason are the recent coding-style changes, then please note they
> are about avoiding introducing *NEW* uses of the specific words and not
> about blindly replacing existing occurrences.
> 
> Best Regards
> Micha³ Miros³aw
> 

I'm really sorry sir, I didn't knew about this, yes the reason for my change is according to the script checkpatch.pl to suit the coding style, I would try to fix some other coding style related issues if this patch seems to be a bad idea.
