Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 290F0C433EF
	for <linux-tegra@archiver.kernel.org>; Fri, 24 Sep 2021 19:42:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0D33F611C8
	for <linux-tegra@archiver.kernel.org>; Fri, 24 Sep 2021 19:42:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346883AbhIXToI (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 24 Sep 2021 15:44:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231756AbhIXToI (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 24 Sep 2021 15:44:08 -0400
Received: from bombadil.infradead.org (unknown [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A960AC061571;
        Fri, 24 Sep 2021 12:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=VrtnSvPm9cXWNZxxVu9pZXziY5YpXzB1Cw0ZCLTkm2Q=; b=JkMxxFbzqMyUGD4ZCTX9IwhZj9
        wkseDHs4VUVZZwYv8sB2itjO0QGkJJRNnCaqVhPemo9HWpUV2OZNAX4hsUk65J7cggAmrEWOa6iY5
        q/nT8RJsSiNMujC7rFDxVAKvuqBtLOqARtw86p5nwvvlCqMt9/Haln0Ufv9mhuqWCBXDezAGx9ywW
        JFebMlcJrP1EQN7m4jT5VqFL1soNG8SBbLyIPwSzo8mnTjVut25OAFMe02iwcn0Yl8B/6wqsj7mc9
        iWe+FMfoA2ccPfLxIVe6/SHCrl0fWjCvGTo6QHMdx85Fw+OaeO+GlEicLAR2AfVyrz08wuooigBmj
        E/Gy0kcg==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mTr5c-00FP3Z-Rl; Fri, 24 Sep 2021 19:42:32 +0000
Subject: =?UTF-8?B?UmU6IEJ1aWxkIGVycm9yOiDigJhFTV9SSVNDVuKAmSB1bmRlY2xhcmVk?=
To:     Jon Hunter <jonathanh@nvidia.com>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        miles.chen@mediatek.com, Jisheng Zhang <jszhang@kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Palmer Dabbelt <palmerdabbelt@google.com>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     linux-tegra@vger.kernel.org
References: <e8965b25-f15b-c7b4-748c-d207dda9c8e8@i2se.com>
 <78cf3af71e035a79d021d17c6fd8a09dd1e4984d.camel@mediatek.com>
 <cf7eea1d-a628-c6c4-270f-fa9895192b24@nvidia.com>
 <277d1f76-c105-5fc4-6658-058286f503f0@nvidia.com>
 <e52cfbdc-40cd-9b84-036b-4c9dc8449b72@i2se.com>
 <bcf57e67-98e2-b4b1-cb62-a2d2829df142@nvidia.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <d3c8b3a4-6881-f882-3af8-1aa3a28f60c0@infradead.org>
Date:   Fri, 24 Sep 2021 12:42:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <bcf57e67-98e2-b4b1-cb62-a2d2829df142@nvidia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 9/24/21 12:01 PM, Jon Hunter wrote:
> 
> On 24/09/2021 19:05, Stefan Wahren wrote:
>> Hi,
>>
>> Am 24.09.21 um 14:55 schrieb Jon Hunter:
>>>
>>>
>>> On 24/09/2021 13:15, miles.chen@mediatek.com wrote:
>>>> From: Jon Hunter <jonathanh@nvidia.com>
>>>>
>>>>
>>>>> This is still broken in the mainline. Any plans to get this fix
>>>>> merged there? I believe it has now been broken for nearly 2 weeks.
>>>>
>>>> the fix [1] is in linux-next now, thanks.

so who merged the patch [1] into linux-next?  Andrew?

Seems to me that Andrew should be cc-ed here [added].


>>> Yes I know that. However, we need it in the mainline. It has been
>>> broken for nearly 2 weeks now and all our automation for mainline is
>>> not running because we cannot build. Please get this fix into mainline
>>> as soon as possible.
>>
>> as stated in [1], you can try to update you build environment.
> 
> These are farm build machines so not that easy or quick to update. Given the change that introduced the breakage is in the mainline, the fix also need to be merged into the mainline. Otherwise we need to revert the initial change.

Yes.

-- 
~Randy
