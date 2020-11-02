Return-Path: <SRS0=G4SC=EI=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F226EC00A89
	for <linux-tegra@archiver.kernel.org>; Mon,  2 Nov 2020 18:10:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B0CD32222B
	for <linux-tegra@archiver.kernel.org>; Mon,  2 Nov 2020 18:10:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S5Tw8ARa"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725852AbgKBSKb (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 2 Nov 2020 13:10:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725789AbgKBSKb (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 2 Nov 2020 13:10:31 -0500
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4513C0617A6
        for <linux-tegra@vger.kernel.org>; Mon,  2 Nov 2020 10:10:30 -0800 (PST)
Received: by mail-lf1-x143.google.com with SMTP id l28so18578361lfp.10
        for <linux-tegra@vger.kernel.org>; Mon, 02 Nov 2020 10:10:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=jH2h4AzrLCY8Cr4EGY2NRKkTBfLlg5dVubVCWiCHnQ4=;
        b=S5Tw8ARaEIx6aMJBIDFVSik12TMat+DBB9OyVXKA492I08ZS/gS4xE6oycmAYOGjGo
         orvIeaTUQ9Rrd6IYDyPwSHfTucWRAD/bG0THqKth2Le+hnAMT9LFVzz6sFZvolbv459+
         h6sd5QyELTj+eQT4KeABXW0xPeHF4OOh90D+NLnRTZLVa9+d64OUu8QYe4jRsz6EjeVx
         IS+0eMn0eMv3rn8uuTRdDVJrYfshMUhCfwE8bjWCo3Y87e+vnbGUmY/CyVfu5nGeeBPJ
         gWuS8fsDK9pVw+9uEpOILljgXcX+HfoSb/RccaD62au6BkuN0RSa5lmVAImIHXE3Y6dX
         R9mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jH2h4AzrLCY8Cr4EGY2NRKkTBfLlg5dVubVCWiCHnQ4=;
        b=OtdnpEmyWxTfrPrWqZQ9Y7nQq45WyEFeOEyDoQQyWRPg8fOAQGu1S8eE8pHmU32BTn
         PLUjM/MhwSZPmB1JxIwMjCLW3dUrKHfh6kd1rNHmqmE7okHMK9FdYcKcNTiTv/cQa2tN
         4nzOf7Fdrdtv+jzF+nzUTt/CPmSndLqZtRPpbbOXlpfu3WxY0zzLN1BD1L43nLBj06CQ
         4bZB56ja3KbbBQD8c7x0388a+kB04mLoi84NsuFR96k3vJQxX+IeLg2jcXVz57Ys3a1t
         JS1Q6eVSyp+IeiEY7/sLsmvLVdS8xGYs2K/5R3G5gPOCfs7OEGwdN0gE/y0980qSBAnN
         qbuQ==
X-Gm-Message-State: AOAM532xyguE8jV62VMbXBqI+H0mqrzG1hSv9HZGr36Dn3Wf+W+K9bf8
        zEMaw0aXzqeyINcRxzqxqrY=
X-Google-Smtp-Source: ABdhPJxB0qDyyHGVUGSHuLXLLyOgrFaSJYjHP5DAWm+YOhcwLmsX/SZa5HOh70q2t/O7JcQIrFIFaQ==
X-Received: by 2002:a19:e04e:: with SMTP id g14mr5801169lfj.590.1604340629445;
        Mon, 02 Nov 2020 10:10:29 -0800 (PST)
Received: from [192.168.2.145] (109-252-193-177.dynamic.spd-mgts.ru. [109.252.193.177])
        by smtp.googlemail.com with ESMTPSA id l1sm2410098lfg.259.2020.11.02.10.10.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2020 10:10:28 -0800 (PST)
Subject: Re: [PATCH 0/5 v16] KASan for Arm
To:     Ard Biesheuvel <ardb@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Abbott Liu <liuwenliang@huawei.com>,
        Russell King <linux@armlinux.org.uk>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        Peter Chen <Peter.Chen@nxp.com>
References: <20201019084140.4532-1-linus.walleij@linaro.org>
 <c3a17f70-4c7b-55b5-a7ce-373c4ff46b29@gmail.com>
 <CAMj1kXGa9sbjQ_OBMcfV7aVoBKMv62HO5T1yEu5t2vXx=xHVEQ@mail.gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <411292ef-99ee-2290-4aba-4789d92586cd@gmail.com>
Date:   Mon, 2 Nov 2020 21:10:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMj1kXGa9sbjQ_OBMcfV7aVoBKMv62HO5T1yEu5t2vXx=xHVEQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

29.10.2020 21:10, Ard Biesheuvel пишет:
> On Thu, 29 Oct 2020 at 18:45, Dmitry Osipenko <digetx@gmail.com> wrote:
>>
>> 19.10.2020 11:41, Linus Walleij пишет:
>>> This is the 16th and final (knock on wood) version of
>>> KASan for ARM32.
>>
>> Hi,
>>
>> I tried KASAN on NVIDIA Tegra using next-20201029 and getting a (seems)
>> bogus bug report saying that the bug is in the KASAN code (note
>> udc_irq() belongs to the ChipIdea USB driver), this problem doesn't
>> happen using one of older versions of the KASAN patches.
>>
> 
> That is probably a coincidence. I ran into the same thing:
> 
> https://lore.kernel.org/linux-arm-kernel/20201029001753.717-1-ardb@kernel.org/
> 
> I am not sure this is the right fix, but it does silence the warning for me.

Spotted another similar problem, seems also bogus.

This is what happens on any driver module reload:

==================================================================
BUG: KASAN: global-out-of-bounds in load_module+0xc93/0x2c0c
Write of size 20480 at addr bf819000 by task modprobe/229

CPU: 2 PID: 229 Comm: modprobe Tainted: G        WC
5.10.0-rc1-next-20201102-00072-g37765d4f3395 #4497
Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
[<c01115e5>] (unwind_backtrace) from [<c010c181>] (show_stack+0x11/0x14)
[<c010c181>] (show_stack) from [<c0f38b6b>] (dump_stack+0x8b/0xa0)
[<c0f38b6b>] (dump_stack) from [<c031da9f>]
(print_address_description.constprop.0+0x15f/0x360)
[<c031da9f>] (print_address_description.constprop.0) from [<c031de1f>]
(kasan_report+0x103/0x11c)
[<c031de1f>] (kasan_report) from [<c031e3bb>]
(check_memory_region+0xc3/0x11c)
[<c031e3bb>] (check_memory_region) from [<c031d107>] (memset+0x13/0x24)
[<c031d107>] (memset) from [<c01e001f>] (load_module+0xc93/0x2c0c)
[<c01e001f>] (load_module) from [<c01e220b>] (sys_finit_module+0xd7/0x104)
[<c01e220b>] (sys_finit_module) from [<c01000a1>]
(ret_fast_syscall+0x1/0x24)
Exception stack(0xc377bfa8 to 0xc377bff0)
bfa0:                   0003f3e8 00000001 00000003 0002b744 00000000
b6db4e34
bfc0: 0003f3e8 00000001 6106d000 0000017b 0003f490 00000000 0003f3e8
000401c8
bfe0: b6db4db8 b6db4da8 00022534 aec9f250


Memory state around the buggy address:
 bf81b180: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 bf81b200: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>bf81b280: 00 00 00 00 00 00 00 00 00 00 00 07 f9 f9 f9 f9
                                            ^
 bf81b300: 00 00 04 f9 f9 f9 f9 f9 00 00 00 00 00 00 05 f9
 bf81b380: f9 f9 f9 f9 07 f9 f9 f9 f9 f9 f9 f9 00 00 05 f9
==================================================================
Disabling lock debugging due to kernel taint
