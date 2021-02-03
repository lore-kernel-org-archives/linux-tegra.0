Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79F29C433E9
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Feb 2021 11:19:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 40DE664F61
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Feb 2021 11:19:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233957AbhBCLTt (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 3 Feb 2021 06:19:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233970AbhBCLTr (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 3 Feb 2021 06:19:47 -0500
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E88F8C06174A
        for <linux-tegra@vger.kernel.org>; Wed,  3 Feb 2021 03:19:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=Gl7sCApRFJtBXnfga0Dh5hI1R8/2+lI2ntQWVhdy+mk=; b=E27X9izTmzcQzga6jy2dEuNoJO
        9MC7V9W+sA/8ivSdgpSXPWzoAhHveywclwtujxBF+BwIxQL3OO2RLE1ZOLGN4uZj+6PrvmKY41Cbf
        w7plO+Jp/n71PlrKVTOgF/vTzID9hU+8Zt5lFby27hAuF41U06A8ugWWusc+D5iI4PDI3pyN8CGUc
        1wMWJ591IOM436tTXIc8rxg0zkK0iASMgcy85K5m0C91mN8diIBINrYrL7ZJQ6oim44JAaFyObAtj
        VTc8SLc4YvXdOBw39mQNMuGl+M1jCTRXrL/SYEhITBTXTRw8gS2ZX8plZchRcTAg1qsUtWfYgyN6z
        mkDdil6g==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <cyndis@kapsi.fi>)
        id 1l7GBU-0008Nz-CH; Wed, 03 Feb 2021 13:18:56 +0200
Subject: Re: [PATCH v5 00/21] Host1x sync point UAPI should not be used for
 tracking DRM jobs
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Mikko Perttunen <mperttunen@nvidia.com>, jonathanh@nvidia.com,
        airlied@linux.ie, daniel@ffwll.ch, linux-tegra@vger.kernel.org,
        dri-devel@lists.freedesktop.org, talho@nvidia.com,
        bhuntsman@nvidia.com
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <da085c38-4ac1-19dd-7706-caf323c969d2@gmail.com>
 <2f999b6d-d781-503a-78f4-d444bce72c58@kapsi.fi>
 <2ee12338-bd5a-4b99-f86d-13da0d2a899b@gmail.com>
 <8504c239-d5df-3033-934c-7b3fab52e387@kapsi.fi> <YBLtPv/1mGXwtibX@ulmo>
 <1ff922b2-161d-c8b9-7b08-4454ff7329f8@gmail.com>
From:   Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <25248139-5487-a15b-8965-1a29a71eacd7@kapsi.fi>
Date:   Wed, 3 Feb 2021 13:18:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <1ff922b2-161d-c8b9-7b08-4454ff7329f8@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 1/29/21 7:30 PM, Dmitry Osipenko wrote:
> 28.01.2021 19:58, Thierry Reding пишет:
>> On Thu, Jan 28, 2021 at 01:08:54PM +0200, Mikko Perttunen wrote:
>>> On 1/27/21 11:20 PM, Dmitry Osipenko wrote:
>>>> 26.01.2021 05:45, Mikko Perttunen пишет:
>>>>>> 2. We will probably need a dedicated drm_tegra_submit_cmd for sync point
>>>>>> increments.  The job's sync point will be allocated dynamically when job
>>>>>> is submitted.  We will need a fag for the sync_incr and wait_syncpt
>>>>>> commands, saying "it's a job's sync point increment/wait"
>>>>>
>>>>> Negative. Like I have explained in previous discussions, with the
>>>>> current way the usage of hardware resources is much more deterministic
>>>>> and obvious. I disagree on the point that this is much more complicated
>>>>> for the userspace. Separating syncpoint and channel allocation is one of
>>>>> the primary motivations of this series for me.
>>>>
>>>> Sync points are a limited resource. The most sensible way to work around
>>>> it is to keep sync points within kernel as much as possible. This is not
>>>> only much simpler for user space, but also allows to utilize DRM API
>>>> properly without re-inventing what already exists and it's easier to
>>>> maintain hardware in a good state.
>>>
>>> I've spent the last few years designing for automotive and industrial
>>> products, where we don't want to at runtime notice that the system is out of
>>> free syncpoints and because of that we can only process the next camera
>>> frame in a second or two instead of 16 milliseconds. We need to know that
>>> once we have allocated the resource, it is there. The newer chips are also
>>> designed to support this.
>>>
>>> Considering Linux is increasingly being used for such applications, and they
>>> are important target markets for NVIDIA, these need to be supported.
>>>
>>> Because of the above design constraint the userspace software that runs in
>>> these environments also expects resources to be allocated up front. This
>>> isn't a matter of having to design that software according to what kind of
>>> allocation API we decide do at Linux level -- it's no use designing for
>>> dynamic allocation if it leads to you not meeting the safety requirement of
>>> needing to ensure you have all resources allocated up front.
>>>
>>> This isn't a good design feature just in a car, but in anything that needs
>>> to be reliable. However, it does pose some tradeoffs, and if you think that
>>> running out of syncpoints on T20-T114 because of upfront allocation is an
>>> actual problem, I'm not opposed to having both options available.
> 
> The word "reliable" contradicts to the error-prone approach. On the
> other hand, it should be very difficult to change the stubborn
> downstream firmware and we want driver to be usable as much as possible,
> so in reality not much can be done about it.

Depends on the perspective.

> 
>> I think that's a fair point. I don't see why we can't support both
>> implicit and explicit syncpoint requests. If most of the use-cases can
>> work with implicit syncpoints and let the kernel handle all aspects of
>> it, that's great. But there's no reason we can't provide more explicit
>> controls for cases where it's really important that all the resources
>> are allocated upfront.
>>
>> Ultimately this is very specific to each use-case, so I think having
>> both options will provide us with the most flexibility.
> It should be fine to support both. This will add complexity to the
> driver, thus it needs to be done wisely.
> 
> I'll need more time to think about it.
> 

How about something like this:

Turn the syncpt_incr field back into an array of structs like

#define DRM_TEGRA_SUBMIT_SYNCPT_INCR_REPLACE_SYNCOBJ		(1<<0)
#define DRM_TEGRA_SUBMIT_SYNCPT_INCR_PATCH_DYNAMIC_SYNCPT	(1<<1)

struct drm_tegra_submit_syncpt_incr {
	/* can be left as zero if using dynamic syncpt */
	__u32 syncpt_id;
	__u32 flags;

	struct {
		__u32 syncobj;
		__u32 value;
	} fence;

	/* patch word as such:
          * *word = *word | (syncpt_id << shift)
          */
	struct {
		__u32 gather_offset_words;
		__u32 shift;
	} patch;
};

So this will work similarly to the buffer reloc system; the kernel 
driver will allocate a job syncpoint and patch in the syncpoint ID if 
requested, and allows outputting syncobjs for each increment.

Mikko
