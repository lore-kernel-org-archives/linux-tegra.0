Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A08A5C4332F
	for <linux-tegra@archiver.kernel.org>; Wed, 23 Nov 2022 13:36:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238875AbiKWNg2 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 23 Nov 2022 08:36:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238874AbiKWNgJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 23 Nov 2022 08:36:09 -0500
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CAC827167
        for <linux-tegra@vger.kernel.org>; Wed, 23 Nov 2022 05:23:59 -0800 (PST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 03B545C0233;
        Wed, 23 Nov 2022 08:23:57 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Wed, 23 Nov 2022 08:23:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1669209836; x=1669296236; bh=RSKaBZBxM1
        0svzHkao5gL7deuhByJ/mt9VuVrlgcelA=; b=KqJXA3OzBt/hBIpwY7YNOfOsiq
        MLQy0rZ4TCLnIYaRrn8GV5SI9x/1KKmBwlhLo7cz8w74E0+uQJdATRAUB6K9MhLu
        2Qyc1tyQndUoCeh3f/jV6qbjMA4Yr07gZ1Ivs8dfm9fwS0+UrRuN94CfqJ1akAMK
        X98gWffidQd9kyxR28FA0f/L6Qn1O7FYY18IQGIcyYOJ762w9rvPhUchkpgHNVcH
        fUK3Eol79C+HPQL3hnZ4UUCOv+RCUgGB9UWnCDl9Utivg1+UCMcr0opOTbQBfITN
        eKBbdfJ0JUXsf1e1jApRRAAbUG6//od0HtDFJDdgenuEt572E7v9ufKjUOBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; t=1669209836; x=1669296236; bh=RSKaBZBxM10svzHkao5gL7deuhBy
        J/mt9VuVrlgcelA=; b=prNv1WOVPXJ38MvC/6RPHwGlL47c5Gi5FrLx75swA4RE
        jxPH3Mjg67V9jZKAOiNG0fSizGFIyj9KaYrYIfZUdGEkD8qw0eZg9gpAzess2BqK
        PPkZkoil8tLg2EBZVnMdhStoprFOV26y+/rv87LmeussinnY76DnqOTEeanAB5zv
        3/LovZ/oPS7w2ijF/MHaAxMGE7XmfoiobfOUy8gWFgs0VvyfB8rI3WghEw8w1SnD
        JPba82b2rJ7MsOVy/nXG33r4QmcAz7X8eArJ1WLiojyNsgoDNenb+dNfV+ZkDmbv
        EJHyLU4F6lmUnDudT7KaOtdmmH0eX6cnmEka2DnUdQ==
X-ME-Sender: <xms:7B5-Y6F7BsIp0Wf8wbOGoEok_S5pzVEZ3WXzX0YUM0oHVgkY1txZ1g>
    <xme:7B5-Y7VlN06wbGjAnxB1HZN80ibnn5JvOCAnfN5DUAP5toh0_5Nfdr3X2pKPMI-qp
    VL27LAq0W5Pvz0godY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedriedugdegkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeevhfffledtgeehfeffhfdtgedvheejtdfgkeeuvefgudffteettdekkeeufeeh
    udenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:7B5-Y0JEM8Me7EIr2rFzatCKmlLIMqmK2mAGA4-j2E1EW10ZWdsd3A>
    <xmx:7B5-Y0HI4pkinssRhV5kZpt3TsLAH_k_UFJ-RiMMhtyeopZdFM9_GA>
    <xmx:7B5-YwVuqXtbMQyeyEkduW3eM7PFaV-lpkVNFYNhwRdgeY7Y-LuFQA>
    <xmx:7B5-Y3QTOskXti6o3yyaT5JDl50t_htk0LFM3TagT4WS4piiLdXVQg>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id C303CB60086; Wed, 23 Nov 2022 08:23:56 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1115-g8b801eadce-fm-20221102.001-g8b801ead
Mime-Version: 1.0
Message-Id: <6476b823-b47c-461c-b948-752e2671015f@app.fastmail.com>
In-Reply-To: <Y34FCQ3xTmcjqKRT@orome>
References: <20221121171239.2041835-1-thierry.reding@gmail.com>
 <20221121171239.2041835-2-thierry.reding@gmail.com>
 <374ae4ef-2f57-4737-95af-b1bdfdb03740@app.fastmail.com>
 <Y34FCQ3xTmcjqKRT@orome>
Date:   Wed, 23 Nov 2022 14:23:36 +0100
From:   "Arnd Bergmann" <arnd@arndb.de>
To:     "Thierry Reding" <thierry.reding@gmail.com>
Cc:     arm@kernel.org, soc@kernel.org,
        "Jon Hunter" <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL v2 2/7] firmware: tegra: Changes for v6.2-rc1
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Nov 23, 2022, at 12:33, Thierry Reding wrote:
> On Tue, Nov 22, 2022 at 10:25:50PM +0100, Arnd Bergmann wrote:
>> On Mon, Nov 21, 2022, at 18:12, Thierry Reding wrote:
>> >       firmware: tegra: bpmp: Do not support big-endian
>> 
>> I pulled the branch, but I think this patch is inconsistent with
>> our normal approach: Since all ARMv7 and ARMv8 processors can
>> run with both big-endian and little-endian kernels, we normally
>> try to keep drivers portable between both ways, even though we
>> don't expect anyone to actually want a big-endian kernel any
>> more. Changing portable code to nonportable code doesn't seem
>> helpful here.
>
> The only reason I dropped this is because the driver is in itself
> inconsistent. Parts of it use byte-swapping for 32-bit values and other
> parts don't. I was originally going to fix big-endian support but it
> would've required changes to the BPMP ABI header to avoid sparse
> warnings in lots of places, then these ABI changes would've needed to
> trickle up to the canonical source, etc. All of that didn't seem worth
> the effort if we couldn't even test this in any way. So the easiest fix
> was to stop pretending and drop the partial support.

Right

>> On the other hand, there are already examples of important
>> drivers that are fundamentally incompatible with big-endian
>> mode, notably drivers/efi/, which is required on a lot of
>> machines.
>> 
>> You don't have to revert this patch, but it would be helpful
>> to mark code that is explicitly unportable with a 'depends
>> on !CPU_BIG_ENDIAN' line in Kconfig. If you agree, I can
>> add that.
>
> Yes, feel free to add that.

Added this commit to the soc/drivers branch now:

commit 4ddb1bf1a83783cebdb174b0efaf62f63ad64e0b
Author: Arnd Bergmann <arnd@arndb.de>
Date:   Wed Nov 23 14:21:16 2022 +0100

    tegra: mark BPMP driver as little-endian only
    
    The BPMP firmware driver never worked on big-endian kernels, and
    cannot easily be made portable. Add a dependency to make this clear
    in case anyone ever wants to try a big-endian kernel on this hardware.
    
    Link: https://lore.kernel.org/linux-arm-kernel/Y34FCQ3xTmcjqKRT@orome/
    Signed-off-by: Arnd Bergmann <arnd@arndb.de>

diff --git a/drivers/firmware/tegra/Kconfig b/drivers/firmware/tegra/Kconfig
index 1c8ba1f47c7c..cde1ab8bd9d1 100644
--- a/drivers/firmware/tegra/Kconfig
+++ b/drivers/firmware/tegra/Kconfig
@@ -14,6 +14,7 @@ config TEGRA_IVC
 config TEGRA_BPMP
 	bool "Tegra BPMP driver"
 	depends on ARCH_TEGRA && TEGRA_HSP_MBOX && TEGRA_IVC
+	depends on !CPU_BIG_ENDIAN
 	help
 	  BPMP (Boot and Power Management Processor) is designed to off-loading
 	  the PM functions which include clock/DVFS/thermal/power from the CPU.



>> Do you know of other tegra drivers that only work on
>> little-endian?
>
> I'm not aware of any that explicitly wouldn't work with big endian, but
> it's not something we've ever tested. I know that people have in the
> past done experiments with running emulated Tegra on QEMU in big endian
> mode, but it's probably not something that's very common.

Ok, thanks!

     Arnd
