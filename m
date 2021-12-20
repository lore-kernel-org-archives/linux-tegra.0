Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48FE0C433EF
	for <linux-tegra@archiver.kernel.org>; Mon, 20 Dec 2021 16:12:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232686AbhLTQMH (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 20 Dec 2021 11:12:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232655AbhLTQMH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 20 Dec 2021 11:12:07 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04007C061574
        for <linux-tegra@vger.kernel.org>; Mon, 20 Dec 2021 08:12:07 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id cf39so22815940lfb.8
        for <linux-tegra@vger.kernel.org>; Mon, 20 Dec 2021 08:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=oUBn2j5ZTMWRGHC9KqSsW8HQb8BSjA2YarYGj1cKGbE=;
        b=i135Z7AG5QUnQ31WJkbfsL7ElDXn6R6u1nE/5cJFOgHKkFtQkxKNx2cMHQraMoU40+
         T+OK7PDgeBB8TceEY8UXtltUncWEYu/zmLe+RfO+LS9WBcUg3+JI2DuWpO/4f0Ktrwva
         NIe7tvd6vNVqjqtsVv5h7PdeL9UiqTW3cZJlHbTPSAVQ4fZXkCaahnb09We6u4Cuin6Y
         yvVOMbhIwWv6AO+ptdf/OzxpoY3jqd610NCNVJGTy0UbiRwJd0fXLQw7mKPvGN2mIFng
         bTIbIhdocdWntmSmuRTwTuidFstXy7+zzWx+Vu9K2M/FOBXWFvceCEN/tKienCbNCP92
         bjsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=oUBn2j5ZTMWRGHC9KqSsW8HQb8BSjA2YarYGj1cKGbE=;
        b=xuZAUDvbViasKFgVNIjVYOQxCssWS3rMblrygompFsKTEqR3TNnzQFmnoX5po56FP+
         4lU6V+TT3tPDsJRiNSduT00FDpELm9Wm1znrhJkeIaNwnSuMYIwsoWa/g7X57AMuJhij
         nxvJdLAMEtur7nTECO1GiMT/D4lTE3mOhzcN3z9jM6z+DGG90SaUfHYqoqbDfg/s3Gs9
         8TOV3uz9mB/Qn7H9DNsRtNRoXRIdokKfxSomhkqhwbbdJUkK/84C0+lkqp6vC1efyZC+
         xZz8t0RNjB0C7tuk2zVwKoI3q1MUcUVwTA8Fs8ZKLCkA+tB+h4ALojzBs0x+rMFfjTIX
         baUA==
X-Gm-Message-State: AOAM532e5Eyxp5qDaTD/DCNQ+EBcpqYOdsutwJmEzkvUUKstQSN3DZDr
        jrJ3D69p57bDT7dy0NFycIO+ZCdTbgg=
X-Google-Smtp-Source: ABdhPJz6g91MaukRgKReiv/FCnVTTUFie16cSK4bz9JTRLYkXxS3GrTOSQqkSFRZ+r/+U1J92GIKRw==
X-Received: by 2002:ac2:4bc1:: with SMTP id o1mr15800966lfq.666.1640016725047;
        Mon, 20 Dec 2021 08:12:05 -0800 (PST)
Received: from [192.168.2.145] (46-138-43-24.dynamic.spd-mgts.ru. [46.138.43.24])
        by smtp.googlemail.com with ESMTPSA id v9sm2445823lja.109.2021.12.20.08.12.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Dec 2021 08:12:04 -0800 (PST)
Subject: Re: [PATCH 0/2] drm/tegra: Fix panel support on Venice 2 and Nyan
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Thomas Graichen <thomas.graichen@gmail.com>,
        Douglas Anderson <dianders@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
References: <20211220104855.428290-1-thierry.reding@gmail.com>
 <dd7a2f23-00d6-9160-1e09-1d4ea5b1f5e1@gmail.com> <YcCg/xktJ2uShFRf@orome>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <e27bd5e0-51d2-875b-aa41-f198230880ac@gmail.com>
Date:   Mon, 20 Dec 2021 19:12:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YcCg/xktJ2uShFRf@orome>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

20.12.2021 18:27, Thierry Reding пишет:
> On Mon, Dec 20, 2021 at 05:45:41PM +0300, Dmitry Osipenko wrote:
>> 20.12.2021 13:48, Thierry Reding пишет:
>>> From: Thierry Reding <treding@nvidia.com>
>>>
>>> Hi,
>>>
>>> this is an alternative proposal to fix panel support on Venice 2 and
>>> Nyan. Dmitry had proposed a different solution that involved reverting
>>> the I2C/DDC registration order and would complicate things by breaking
>>> the encapsulation of the driver by introducing a global (though locally
>>> scoped) variable[0].
>>>
>>> This set of patches avoids that by using the recently introduced DP AUX
>>> bus infrastructure. The result is that the changes are actually less
>>> intrusive and not a step back. Instead they nicely remove the circular
>>> dependency that previously existed and caused these issues in the first
>>> place.
>>>
>>> To be fair, this is not perfect either because it requires a device tree
>>> change and hence isn't technically backwards-compatible. However, given
>>> that the original device tree was badly broken in the first place, I
>>> think we can make an exception, especially since it is not generally a
>>> problem to update device trees on the affected devices.
>>>
>>> Secondly, this relies on infrastructure that was introduced in v5.15 and
>>> therefore will be difficult to backport beyond that. However, since this
>>> functionality has been broken since v5.13 and all of the kernel versions
>>> between that and v5.15 are EOL anyway, there isn't much that we can do
>>> to fix the interim versions anyway.
>>>
>>> Adding Doug and Laurent since they originally designed the AUX bus
>>> patches in case they see anything in here that would be objectionable.
>>>
>>> Thierry
>>>
>>> [0]: https://lore.kernel.org/dri-devel/20211130230957.30213-1-digetx@gmail.com/
>>>
>>> Thierry Reding (2):
>>>   drm/tegra: dpaux: Populate AUX bus
>>>   ARM: tegra: Move panels to AUX bus
>>>
>>>  arch/arm/boot/dts/tegra124-nyan-big.dts   | 15 +++++++++------
>>>  arch/arm/boot/dts/tegra124-nyan-blaze.dts | 15 +++++++++------
>>>  arch/arm/boot/dts/tegra124-venice2.dts    | 14 +++++++-------
>>>  drivers/gpu/drm/tegra/Kconfig             |  1 +
>>>  drivers/gpu/drm/tegra/dpaux.c             |  7 +++++++
>>>  5 files changed, 33 insertions(+), 19 deletions(-)
>>>
>>
>> It should "work" since you removed the ddc-i2c-bus phandle from the
>> panel nodes, and thus, panel->ddc won't be used during panel-edp driver
>> probe. But this looks like a hack rather than a fix.
> 
> The AUX ->ddc will be used for panel->ddc if the ddc-i2c-bus property is
> not specified. And that makes perfect sense because we'd basically just
> be pointing back to the AUX node anyway.
> 
>> I'm not sure why and how devm_of_dp_aux_populate_ep_devices() usage
>> should be relevant here. The drm_dp_aux_register() still should to
>> invoked before devm_of_dp_aux_populate_ep_devices(), otherwise
>> panel->ddc adapter won't be registered.
> 
> drm_dp_aux_register() is only needed to expose the device to userspace
> and make the I2C adapter available to the rest of the system. But since
> we already know the AUX and I2C adapter, we can use it directly without
> doing a separate lookup. drm_dp_aux_init() should be enough to set the
> adapter up to work for what we need.
> 
> See also the kerneldoc for drm_dp_aux_register() where this is described
> in a bit more detail.

Alright, so you fixed it by removing the ddc-i2c-bus phandles and I2C
DDC will work properly anyways with that on v5.16.

But the aux-bus usage still is irrelevant for the fix. Let's not use it
then.

>> The panel->ddc isn't used by the new panel-edp driver unless panel is
>> compatible with "edp-panel". Hence the generic_edp_panel_probe() should
>> either fail or crash for a such "edp-panel" since panel->ddc isn't fully
>> instantiated, AFAICS.
> 
> I've tested this and it works fine on Venice 2. Since that was the
> reference design for Nyan, I suspect that Nyan's will also work.
> 
> It'd be great if Thomas or anyone else with access to a Nyan could
> test this to verify that.

There is no panel-edp driver in the v5.15. The EOL of v5.15 is Oct,
2023, hence we need to either use:

Approach #1:

1. apply my variant of the fix
2. backport it to v5.15
3. apply your variant without aux-bus, replacing my fix on 5.16+

Or

Approach #2:

1. remove ddc-i2c-bus phandles in DTs
2. backport (?) it to v5.15
3. apply your variant without aux-bus

Or

Approach #3:

1. ignore v5.15 and keep it screwed
2. apply your variant as is

Which approach will you prefer?

I'm not happy that older DTBs will be broken. Can we do better about it?

Is it possible to patch DT in the code by removing the ddc-i2c-bus phandle?

Or can we patch panel-simple on 5.15 and panel-edp on 5.16, making these
drivers to skip ddc-i2c-bus on Tegra+eDP? The eDP driver fixup will be
trivial, fixing older panel-simple will be more invasive.

I think the best solution will be to use Approach #1 and in the end
complete it with this panel-edp workaround below. This approach will
have minimal code impact on 5.16+ kernels and will keep older DTBs
working. Are you okay with this?

diff --git a/drivers/gpu/drm/panel/panel-edp.c
b/drivers/gpu/drm/panel/panel-edp.c
index 176ef0c3cc1d..4e5b84324659 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -793,7 +793,11 @@ static int panel_edp_probe(struct device *dev,
const struct panel_desc *desc,
 		return err;
 	}

-	ddc = of_parse_phandle(dev->of_node, "ddc-i2c-bus", 0);
+	if (of_machine_is_compatible("nvidia,tegra124"))
+		ddc = NULL;
+	else
+		ddc = of_parse_phandle(dev->of_node, "ddc-i2c-bus", 0);
+
 	if (ddc) {
 		panel->ddc = of_find_i2c_adapter_by_node(ddc);
 		of_node_put(ddc);
