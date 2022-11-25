Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2514EC43219
	for <linux-tegra@archiver.kernel.org>; Fri, 25 Nov 2022 14:02:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229628AbiKYOCl (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 25 Nov 2022 09:02:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229788AbiKYOCl (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 25 Nov 2022 09:02:41 -0500
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75F54B1E9;
        Fri, 25 Nov 2022 06:02:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1669384957; x=1700920957;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bwzanIl/v6qmT0yR6agyAZBv5LYJ5TTsBNdzUdFwLBY=;
  b=CpJTZ1/hsmlTyRMTKIwaqPMlhMwUxJ8ROm+ptS/LwvnRM4/NP7RYM7QF
   O9tR+iQF7ZyUrVuXo/GdCcDlf8Rwhm4CfTHd4ynCih3b9q4cH9p+HauLc
   UReR70tjvhhOrqHJhgn/m8zH8h13z/sJPsbpyOV+F3kHgxwraFYEJAGZE
   4dVolVls82405ZMDBJL1QSkUxtzBL6iF3AjZXSRuxj8SbL4eutwz5mXJA
   l+Gb8WRIOs50mxA6TLi1mGronyJ6jDCzMj7DkTdbr1Js++hWhderPW6Ud
   XbrZ9pQjI8AEEHMh5tuI4+Q8RA6/9HlupQ+nV4q8asZZb3ckd/nsIKf/Z
   A==;
X-IronPort-AV: E=Sophos;i="5.96,193,1665471600"; 
   d="scan'208";a="190524179"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 25 Nov 2022 07:02:08 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 25 Nov 2022 07:02:07 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Fri, 25 Nov 2022 07:02:05 -0700
Date:   Fri, 25 Nov 2022 14:01:47 +0000
From:   Conor Dooley <conor.dooley@microchip.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh@kernel.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Wayne Chang <waynec@nvidia.com>, <devicetree@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH v2] dt-bindings: usb: tegra-xusb: Convert to json-schema
Message-ID: <Y4DKy1xUjCGYUySM@wendy>
References: <20221103144200.1479640-1-thierry.reding@gmail.com>
 <Y4C4Cp1D+QEKWiaf@wendy>
 <Y4C8JvSQuNZiDmJb@wendy>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Y4C8JvSQuNZiDmJb@wendy>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Nov 25, 2022 at 12:59:18PM +0000, Conor Dooley wrote:
> On Fri, Nov 25, 2022 at 12:41:46PM +0000, Conor Dooley wrote:
> > Hi Thierry,
> > 
> > On Thu, Nov 03, 2022 at 03:42:00PM +0100, Thierry Reding wrote:
> > > From: Thierry Reding <treding@nvidia.com>
> > > 
> > > Convert the Tegra XUSB controller bindings from the free-form text
> > > format to json-schema.
> > > 
> > > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > 
> > > +        phys = <&{/padctl@0,7009f000/pads/usb2/lanes/usb2-1}>, /* mini-PCIe USB */
> > > +               <&{/padctl@0,7009f000/pads/usb2/lanes/usb2-2}>, /* USB A */
> > > +               <&{/padctl@0,7009f000/pads/pcie/lanes/pcie-0}>; /* USB A */
> > 
> > This seems to be breaking dt_binding_check in today's linux-next:
> > FATAL ERROR: Can't generate fixup for reference to path &{/padctl@0,7009f000/pads/usb2/lanes/usb2-1}
> > 
> > Am I missing something? My dt-schema is today's main.
> 
> Apologies for the noise, it appears to have broken several days ago and
> is not caused by this patch.
> 
> I'll go bisect :)

ea3723a541c198c84e81a0e975dba6c18764393e is the first bad commit

> > commit ea3723a541c198c84e81a0e975dba6c18764393e
> > Author: Rob Herring <robh@kernel.org>
> > Date:   Tue Nov 1 12:54:44 2022 -0500
> > 
> >     scripts/dtc: Update to upstream version v1.6.1-63-g55778a03df61
> >     
> >     It's been a while since the last sync and Lee needs commit 73590342fc85
> >     ("libfdt: prevent integer overflow in fdt_next_tag").
> >     
> >     This adds the following commits from upstream:
> >     
> >     55778a03df61 libfdt: tests: add get_next_tag_invalid_prop_len
> >     73590342fc85 libfdt: prevent integer overflow in fdt_next_tag
> >     035fb90d5375 libfdt: add fdt_get_property_by_offset_w helper
> >     98a07006c48d Makefile: fix infinite recursion by dropping non-existent `%.output`
> >     a036cc7b0c10 Makefile: limit make re-execution to avoid infinite spin
> >     c6e92108bcd9 libdtc: remove duplicate judgments
> >     e37c25677dc9 Don't generate erroneous fixups from reference to path

I have not bisected the dtc, but this one seems like it could be the
culprit? Just going off the $subject, not looked at the content at
all...

> >    50454658f2b5 libfdt: Don't mask fdt_get_name() returned error
> >    e64a204196c9 manual.txt: Follow README.md and remove Jon
> >    f508c83fe6f0 Update README in MANIFEST.in and setup.py to README.md
> >    c2ccf8a77dd2 Add description of Signed-off-by lines
> >    90b9d9de42ca Split out information for contributors to CONTRIBUTING.md
> >    0ee1d479b23a Remove Jon Loeliger from maintainers list
> >    b33a73c62c1c Convert README to README.md
> >    7ad60734b1c1 Allow static building with meson
> >    fd9b8c96c780 Allow static building with make
> >    fda71da26e7f libfdt: Handle failed get_name() on BEGIN_NODE
> >    c7c7f17a83d5 Fix test script to run also on dash shell
> >    01f23ffe1679 Add missing relref_merge test to meson test list
> >    ed310803ea89 pylibfdt: add FdtRo.get_path()
> >    c001fc01a43e pylibfdt: fix swig build in install
> >    26c54f840d23 tests: add test cases for label-relative path references
> >    ec7986e682cf dtc: introduce label relative path references
> >    651410e54cb9 util: introduce xstrndup helper
> >    4048aed12b81 setup.py: fix out of tree build
> >    ff5afb96d0c0 Handle integer overflow in check_property_phandle_args()
> >    ca7294434309 README: Explain how to add a new API function
> >    c0c2e115f82e Fix a UB when fdt_get_string return null
> >    cd5f69cbc0d4 tests: setprop_inplace: use xstrdup instead of unchecked strdup
> >    a04f69025003 pylibfdt: add Property.as_*int*_array()
> >    83102717d7c4 pylibfdt: add Property.as_stringlist()
> >    d152126bb029 Fix Python crash on getprop deallocation
> >    17739b7ef510 Support 'r' format for printing raw bytes with fdtget
> >    45f3d1a095dd libfdt: overlay: make overlay_get_target() public
> >    c19a4bafa514 libfdt: fix an incorrect integer promotion
> >    1cc41b1c969f pylibfdt: Add packaging metadata
> >    db72398cd437 README: Update pylibfdt install instructions
> >    383e148b70a4 pylibfdt: fix with Python 3.10
> >    23b56cb7e189 pylibfdt: Move setup.py to the top level
> >    69a760747d8d pylibfdt: Split setup.py author name and email
> >    0b106a77dbdc pylibfdt: Use setuptools_scm for the version
> >    c691776ddb26 pylibfdt: Use setuptools instead of distutils
> >    5216f3f1bbb7 libfdt: Add static lib to meson build
> >    4eda2590f481 CI: Cirrus: bump used FreeBSD from 12.1 to 13.0
> >    
> >    Link: https://lore.kernel.org/r/20221101181427.1808703-1-robh@kernel.org/
> >    Signed-off-by: Rob Herring <robh@kernel.org>

