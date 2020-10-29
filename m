Return-Path: <SRS0=qFEE=EE=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C554C55179
	for <linux-tegra@archiver.kernel.org>; Thu, 29 Oct 2020 19:41:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E4E3A206DD
	for <linux-tegra@archiver.kernel.org>; Thu, 29 Oct 2020 19:41:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N9weLwbp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725902AbgJ2Tlj (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 29 Oct 2020 15:41:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725828AbgJ2Tli (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 29 Oct 2020 15:41:38 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46155C0613CF
        for <linux-tegra@vger.kernel.org>; Thu, 29 Oct 2020 12:41:38 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id m20so4413235ljj.5
        for <linux-tegra@vger.kernel.org>; Thu, 29 Oct 2020 12:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=GPv6of+1cKfDCOPkr1GTvohtUQAFp4ap1kyPWM8roPk=;
        b=N9weLwbpCwJQyaHogRulkgHBgSlLlTqd1nqhGeke32EIzf4bc8H6FyOsurQN9ewB4Y
         gYoSRo4JEJExJC+0af3UJ6+UAorm0ab7vJmzXZBK2wM0Q0npK1RVcsg1LqkHVq6a4orN
         zw+5knNBKiLVur3AANs83SMkkQmVqUJ0iXkqMTm1d5Hsh0ThfwYSTBUy2GPXtiEp5koV
         Bf8ECq3UeJPpavaUYpj7eSjTSLnSOoP7DslUCeAPldDLApxf5lsqcFpcZE04lueHFsAC
         nsHhxoCt2MHL3QxXTCBOYvO3Y1I07XbHRVIrpG/qavir06SMWxPhYyjiyVIh0aDFUHFY
         Cvqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GPv6of+1cKfDCOPkr1GTvohtUQAFp4ap1kyPWM8roPk=;
        b=KkHi69amGe1ZYbQEy5H+/gOhCLXdn68sxsttzrBhwtvP47x00mvkxvhv85qlOHZgvM
         S6E1z1K7LPEcQVz5WmVaT9MzvPiADCQRL3wG1JQ5J60/5ULPwsH/jf00y8u1Yfck32Bw
         hAM/r5vg8irt4H67qUaBz72B8Mz3eI9awpGAeDs0BVmPUagsa88m0exx/B0PRbi8fOkQ
         gYPZSWYcWlRiHCy2TcMw6YDGmamDqmzDVMWhoJZ1V0RFRq1qiD3k+jQALPMXqjd+t6o2
         GDTb3mI312UuinTsKR/FOK967teXN0DpW4TTz+MnoYK1KufExfVmc9gmXKYnB+mcCmNl
         VM1g==
X-Gm-Message-State: AOAM533LbFVaWUXYNK39iuFkkT+kjpfi+lxN+h9+cc6doKbnBxM1f1kz
        k5sIXevAtlaqVxgQE50CCKo=
X-Google-Smtp-Source: ABdhPJw3UtM9PePZa1gFSkCd+JY0GIxznM7SWCvSXx0sHStE3IBqUM5C0V9qsvGZb6ss5pSqsZJj+A==
X-Received: by 2002:a2e:9a10:: with SMTP id o16mr2418313lji.67.1604000496530;
        Thu, 29 Oct 2020 12:41:36 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-177.dynamic.spd-mgts.ru. [109.252.193.177])
        by smtp.googlemail.com with ESMTPSA id b14sm434593ljo.16.2020.10.29.12.41.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2020 12:41:35 -0700 (PDT)
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
Message-ID: <0ef7c2a5-5d8b-c5e0-63fa-31693fd4495c@gmail.com>
Date:   Thu, 29 Oct 2020 22:41:34 +0300
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

Disabling instrumentation for the stacktrace indeed fixes it, thank you.

Now there is another problem.. next-20201029 has the same trouble which
all previous versions of the KASAN series had, where tasks are hanging
in unkillable state, eating 100% CPU.

For example I never managed to get Xorg to work with the ARM32 KASAN,
this is what happens (sometimes it happens during boot, where systemd
services hang):

 INFO: task pool-nm-online:448 can't die for more than 61 seconds.
 task:pool-nm-online  state:R  running task     stack:    0 pid:  448
ppid:     1 flags:0x00000001
 [<c0e30e5f>] (__schedule) from [<c01c3699>]
(get_futex_value_locked+0xa1/0xb8)
 [<c01c3699>] (get_futex_value_locked) from [<c01c4a81>]
(futex_wait_setup+0xc1/0x150)
 [<c01c4a81>] (futex_wait_setup) from [<c01c4bc3>] (futex_wait+0xb3/0x1d0)
 [<c01c4bc3>] (futex_wait) from [<c01c66d7>] (do_futex+0xcf/0xabc)
 [<c01c66d7>] (do_futex) from [<c01c7285>] (sys_futex_time32+0xbd/0x138)
 [<c01c7285>] (sys_futex_time32) from [<c01000a1>]
(ret_fast_syscall+0x1/0x26)
 Exception stack(0xc648bfa8 to 0xc648bff0)
 bfa0:                   00000000 acb09e48 acb09e48 00000080 00000002
00000000
 bfc0: 00000000 acb09e48 acb09e48 000000f0 ad4f0990 7fffffff 00000001
00000000
 bfe0: ad4f0918 ad4f0908 aea1d087 ae924e62
 INFO: task blueman-mechani:279 can't die for more than 61 seconds.
 task:blueman-mechani state:R  running task     stack:    0 pid:  279
ppid:     1 flags:0x00000001
 [<c0e30e5f>] (__schedule) from [<c0e31581>]
(preempt_schedule_common+0x29/0x48)
 [<c0e31581>] (preempt_schedule_common) from [<c01c4a19>]
(futex_wait_setup+0x59/0x150)
 [<c01c4a19>] (futex_wait_setup) from [<c01c4bc3>] (futex_wait+0xb3/0x1d0)
 [<c01c4bc3>] (futex_wait) from [<c01c66d7>] (do_futex+0xcf/0xabc)
 [<c01c66d7>] (do_futex) from [<c01c7285>] (sys_futex_time32+0xbd/0x138)
 [<c01c7285>] (sys_futex_time32) from [<c01000a1>]
(ret_fast_syscall+0x1/0x26)
 Exception stack(0xc300bfa8 to 0xc300bff0)
 bfa0:                   00000000 00538cd0 00538cd0 00000080 00000002
00000000
 bfc0: 00000000 00538cd0 00538cd0 000000f0 b6af1320 7fffffff 00000001
00000000
 bfe0: b6af12a8 b6af1298 ae3e8087 aed00e62
 INFO: task polkitd:292 can't die for more than 61 seconds.
 task:polkitd         state:R  running task     stack:    0 pid:  292
ppid:     1 flags:0x00000001
 [<c0e30e5f>] (__schedule) from [<c0e31581>]
(preempt_schedule_common+0x29/0x48)
 [<c0e31581>] (preempt_schedule_common) from [<c01c4a19>]
(futex_wait_setup+0x59/0x150)
 [<c01c4a19>] (futex_wait_setup) from [<c01c4bc3>] (futex_wait+0xb3/0x1d0)
 [<c01c4bc3>] (futex_wait) from [<c01c66d7>] (do_futex+0xcf/0xabc)
 [<c01c66d7>] (do_futex) from [<c01c7285>] (sys_futex_time32+0xbd/0x138)
 [<c01c7285>] (sys_futex_time32) from [<c01000a1>]
(ret_fast_syscall+0x1/0x26)
 Exception stack(0xc48a3fa8 to 0xc48a3ff0)
 3fa0:                   00000000 0043a788 0043a788 00000080 00000002
00000000
 3fc0: 00000000 0043a788 0043a788 000000f0 b67eac70 7fffffff 00000001
00000000
 3fe0: b67eabf8 b67eabe8 aeadd087 ae936e62
 INFO: task pool-polkitd:315 can't die for more than 61 seconds.
 task:pool-polkitd    state:R  running task     stack:    0 pid:  315
ppid:     1 flags:0x00000001
 [<c0e30e5f>] (__schedule) from [<c0e31b73>]
(preempt_schedule_irq+0x6f/0x12c)
 [<c0e31b73>] (preempt_schedule_irq) from [<c0100b77>]
(svc_preempt+0x7/0x14)
 Exception stack(0xc7b57d30 to 0xc7b57d78)
 7d20:                                     c7b54004 00000000 c7b54004
00000007
 7d40: c7b54000 00000000 c7b54004 c7b57e20 c7b57e40 c7b57e38 c7b54000
c2c28e44
 7d60: c7b54040 c7b57d80 c0e36849 c0e3684e 20030133 ffffffff
 [<c0100b77>] (svc_preempt) from [<c0e3684e>] (_raw_spin_unlock+0x42/0x58)
 [<c0e3684e>] (_raw_spin_unlock) from [<c01c4a19>]
(futex_wait_setup+0x59/0x150)
 [<c01c4a19>] (futex_wait_setup) from [<c01c4bc3>] (futex_wait+0xb3/0x1d0)
 [<c01c4bc3>] (futex_wait) from [<c01c66d7>] (do_futex+0xcf/0xabc)
 [<c01c66d7>] (do_futex) from [<c01c7285>] (sys_futex_time32+0xbd/0x138)
 [<c01c7285>] (sys_futex_time32) from [<c01000a1>]
(ret_fast_syscall+0x1/0x26)
 Exception stack(0xc7b57fa8 to 0xc7b57ff0)
 7fa0:                   0007a120 00000000 0043cd1c 00000080 00000000
add22cec
 7fc0: 0007a120 00000000 00000000 000000f0 0043cd10 0043cd18 aeb529b0
aeb51be0
 7fe0: add22cd0 add22cc0 aeadda45 ae936e62
 INFO: task pool-udisksd:340 can't die for more than 61 seconds.
 task:pool-udisksd    state:R  running task     stack:    0 pid:  340
ppid:     1 flags:0x00000001
 [<c0e30e5f>] (__schedule) from [<c0e31b73>]
(preempt_schedule_irq+0x6f/0x12c)
 [<c0e31b73>] (preempt_schedule_irq) from [<c0100b77>]
(svc_preempt+0x7/0x14)
 Exception stack(0xc6abfd40 to 0xc6abfd88)
 fd40: c6abfe38 00000000 c6abfe38 00000003 c6abfde4 c2c28d00 00546084
c6abfe20
 fd60: c6abfe40 c6abfe38 c6abc000 c2c28d04 c6abc040 c6abfd90 c01c4aa7
c01c4aa6
 fd80: 000b0133 ffffffff
 [<c0100b77>] (svc_preempt) from [<c01c4aa6>] (futex_wait_setup+0xe6/0x150)
 [<c01c4aa6>] (futex_wait_setup) from [<c01c4bc3>] (futex_wait+0xb3/0x1d0)
 [<c01c4bc3>] (futex_wait) from [<c01c66d7>] (do_futex+0xcf/0xabc)
 [<c01c66d7>] (do_futex) from [<c01c7285>] (sys_futex_time32+0xbd/0x138)
 [<c01c7285>] (sys_futex_time32) from [<c01000a1>]
(ret_fast_syscall+0x1/0x26)
 Exception stack(0xc6abffa8 to 0xc6abfff0)
 ffa0:                   0007a120 00000000 00546084 00000080 00000000
ad8fecdc
 ffc0: 0007a120 00000000 00000000 000000f0 00546078 00546080 ae9f79b0
ae9f6be0
 ffe0: ad8fecc0 ad8fecb0 ae982a45 ae889e62
 INFO: task gdbus:433 can't die for more than 61 seconds.
 task:gdbus           state:R  running task     stack:    0 pid:  433
ppid:     1 flags:0x00000001
 [<c0e30e5f>] (__schedule) from [<c0e31581>]
(preempt_schedule_common+0x29/0x48)
 [<c0e31581>] (preempt_schedule_common) from [<c01c4a19>]
(futex_wait_setup+0x59/0x150)
 [<c01c4a19>] (futex_wait_setup) from [<c01c4bc3>] (futex_wait+0xb3/0x1d0)
 [<c01c4bc3>] (futex_wait) from [<c01c66d7>] (do_futex+0xcf/0xabc)
 [<c01c66d7>] (do_futex) from [<c01c7285>] (sys_futex_time32+0xbd/0x138)
 [<c01c7285>] (sys_futex_time32) from [<c01000a1>]
(ret_fast_syscall+0x1/0x26)
 Exception stack(0xc5b03fa8 to 0xc5b03ff0)
 3fa0:                   0054e010 aeb770bc 0054e01c 00000080 00000002
00000000
 3fc0: 0054e010 aeb770bc 0054aef0 000000f0 0054e01c 0055a150 0054aef0
00000000
 3fe0: acefec28 acefec18 ae982087 ae889e62
 INFO: task probing-thread:551 can't die for more than 61 seconds.
 task:probing-thread  state:R  running task     stack:    0 pid:  551
ppid:     1 flags:0x00000001
 [<c0e30e5f>] (__schedule) from [<c0e31b73>]
(preempt_schedule_irq+0x6f/0x12c)
 [<c0e31b73>] (preempt_schedule_irq) from [<c0100b77>]
(svc_preempt+0x7/0x14)
 Exception stack(0xc8cf3d28 to 0xc8cf3d70)
 3d20:                   c8cf0000 c8cf0003 c8cf0000 00000003 c8cf0000
00000000
 3d40: c8cf0004 c8cf3e20 c8cf3e40 c8cf3e38 c8cf0000 c2c2a484 c8cf0040
c8cf3d7c
 3d60: c0e36855 c02f2404 800b0133 ffffffff
 [<c0100b77>] (svc_preempt) from [<c02f2404>] (__asan_load4+0x14/0x60)
 [<c02f2404>] (__asan_load4) from [<c0e36855>] (_raw_spin_unlock+0x49/0x58)
 [<c0e36855>] (_raw_spin_unlock) from [<c01c4a19>]
(futex_wait_setup+0x59/0x150)
 [<c01c4a19>] (futex_wait_setup) from [<c01c4bc3>] (futex_wait+0xb3/0x1d0)
 [<c01c4bc3>] (futex_wait) from [<c01c66d7>] (do_futex+0xcf/0xabc)
 [<c01c66d7>] (do_futex) from [<c01c7285>] (sys_futex_time32+0xbd/0x138)
 [<c01c7285>] (sys_futex_time32) from [<c01000a1>]
(ret_fast_syscall+0x1/0x26)
 Exception stack(0xc8cf3fa8 to 0xc8cf3ff0)
 3fa0:                   00000000 0056410c 0056410c 00000080 00000000
00000000
 3fc0: 00000000 0056410c 00000000 000000f0 00564114 00564108 00000000
b6b5e540
 3fe0: ac2e9cf8 ac2e9ce8 ae982935 ae889e62
 INFO: task pool:364 can't die for more than 61 seconds.
 task:pool            state:R  running task     stack:    0 pid:  364
ppid:     1 flags:0x00000081
 [<c0e30e5f>] (__schedule) from [<c0e31b73>]
(preempt_schedule_irq+0x6f/0x12c)
 [<c0e31b73>] (preempt_schedule_irq) from [<c0100b77>]
(svc_preempt+0x7/0x14)
 Exception stack(0xc73fbd40 to 0xc73fbd88)
 bd40: c2c28fc0 c16084b0 000003ff 00000001 c73fbde4 c2c28fc0 ad609e80
c73fbe20
 bd60: c73fbe40 c73fbe38 c73f8000 c2c28fc4 c73f8040 c73fbd90 c01c3bcf
c01c4a8e
 bd80: 200e0133 ffffffff
 [<c0100b77>] (svc_preempt) from [<c01c4a8e>] (futex_wait_setup+0xce/0x150)
 [<c01c4a8e>] (futex_wait_setup) from [<c01c4bc3>] (futex_wait+0xb3/0x1d0)
 [<c01c4bc3>] (futex_wait) from [<c01c66d7>] (do_futex+0xcf/0xabc)
 [<c01c66d7>] (do_futex) from [<c01c7285>] (sys_futex_time32+0xbd/0x138)
 [<c01c7285>] (sys_futex_time32) from [<c010024b>]
(__sys_trace_return+0x1/0x16)
 Exception stack(0xc73fbfa8 to 0xc73fbff0)
 bfa0:                   00000000 ad609e80 ad609e80 00000080 00000002
00000000
 bfc0: 00000000 ad609e80 ad609e80 000000f0 adf20be0 7fffffff 00000001
00000000
 bfe0: adf20b68 adf20b58 aeb84087 aea48e62
 INFO: task pool-nm-online:448 can't die for more than 122 seconds.
 task:pool-nm-online  state:R  running task     stack:    0 pid:  448
ppid:     1 flags:0x00000001
 [<c0e30e5f>] (__schedule) from [<c0e31b73>]
(preempt_schedule_irq+0x6f/0x12c)
 [<c0e31b73>] (preempt_schedule_irq) from [<c0100b77>]
(svc_preempt+0x7/0x14)
 Exception stack(0xc648bd20 to 0xc648bd68)
 bd20: c648be48 c648be4b c648be48 c648be4d c648bde4 deadcd43 acb09e48
c648be40
 bd40: c648be40 c648be38 c6488000 c2c21404 c6488040 c648bd74 c01c3bbd
c02f2400
 bd60: 80030133 ffffffff
 [<c0100b77>] (svc_preempt) from [<c02f2400>] (__asan_load4+0x10/0x60)
 [<c02f2400>] (__asan_load4) from [<c01c3bbd>] (hash_futex+0x25/0x80)
 [<c01c3bbd>] (hash_futex) from [<c01c4a81>] (futex_wait_setup+0xc1/0x150)
 [<c01c4a81>] (futex_wait_setup) from [<c01c4bc3>] (futex_wait+0xb3/0x1d0)
 [<c01c4bc3>] (futex_wait) from [<c01c66d7>] (do_futex+0xcf/0xabc)
 [<c01c66d7>] (do_futex) from [<c01c7285>] (sys_futex_time32+0xbd/0x138)
 [<c01c7285>] (sys_futex_time32) from [<c01000a1>]
(ret_fast_syscall+0x1/0x26)
 Exception stack(0xc648bfa8 to 0xc648bff0)
 bfa0:                   00000000 acb09e48 acb09e48 00000080 00000002
00000000
 bfc0: 00000000 acb09e48 acb09e48 000000f0 ad4f0990 7fffffff 00000001
00000000
 bfe0: ad4f0918 ad4f0908 aea1d087 ae924e62
