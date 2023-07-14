Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC8AAC0015E
	for <linux-tegra@archiver.kernel.org>; Fri, 14 Jul 2023 02:51:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232372AbjGNCvU (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 13 Jul 2023 22:51:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234066AbjGNCvS (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 13 Jul 2023 22:51:18 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA2D52D6B;
        Thu, 13 Jul 2023 19:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689303067; x=1720839067;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=3ItH7GDLekgA6ZJq1QFTHSD2GE2/QqQMe4ZG5EQNPz4=;
  b=CN0vSYmwiDh3p/zuVm9jZrfAgRkn3uE4+MtK38IGFFHvuSxbunmr1mqB
   ihzdjfe8wrOR57eYoL/LT0x7tZpZZbazas3utxTqj9WUEuIYUBjgEm8G+
   svehUu4ndn/JT/n2G3XaYWvQrXpsuZzx9AzV+g9guhR+H2/HqbVj0tYF0
   JDqf7+84rPDIj6VO5yZ9lnztGz++XdiaGIXtx28t2ISAkpzk2pcVxVbUw
   QId3loo1EjEqxYHGFnErVJeVNWSMqRQmq4fAUOR2g8kshnimEBGTuWIwn
   u7MRiwbRhOrzi94czmLr2DOQDexxZCS60I1TZEZWLvFni7p4PO8xfOTcv
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="362837721"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; 
   d="scan'208";a="362837721"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2023 19:51:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="716174394"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; 
   d="scan'208";a="716174394"
Received: from blu2-mobl.ccr.corp.intel.com (HELO [10.252.191.49]) ([10.252.191.49])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2023 19:51:01 -0700
Message-ID: <ed4200bb-d7e8-b8b5-bfb6-510bebbb8808@linux.intel.com>
Date:   Fri, 14 Jul 2023 10:50:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Cc:     baolu.lu@linux.intel.com,
        "opensource.kernel" <opensource.kernel@vivo.com>,
        Thierry Reding <treding@nvidia.com>
Subject: =?UTF-8?B?UmU6IOWbnuWkjTogW1BBVENIIHY0XSBpb21tdTogcmVtb3ZlIHJlZHVu?=
 =?UTF-8?Q?dant_parameter_check_in_tegra=5fsmmu=5fdebugfs=5finit=28=29?=
Content-Language: en-US
To:     =?UTF-8?B?5p2c5pWP5p2w?= <duminjie@vivo.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "open list:TEGRA IOMMU DRIVERS" <linux-tegra@vger.kernel.org>,
        "open list:IOMMU SUBSYSTEM" <iommu@lists.linux.dev>,
        open list <linux-kernel@vger.kernel.org>
References: <20230713072825.10348-1-duminjie@vivo.com>
 <61f31b3e-b618-88db-a07c-f6761c1c7d06@linux.intel.com>
 <SG2PR06MB5288E9FC9B6EA21E20BB011EAE34A@SG2PR06MB5288.apcprd06.prod.outlook.com>
From:   Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <SG2PR06MB5288E9FC9B6EA21E20BB011EAE34A@SG2PR06MB5288.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 2023/7/14 10:38, 杜敏杰 wrote:
> Hi baolu!
> 
> Thanks for your suggestion!
> 
> You say:
>> Next time when you send a new version of a patch, please don't forget to add the change log after the tear line. This way, people can know how the patch evolved into this way.
> Do I need to submit a new patch?

Oh no. Just a kind remind. :-)

Best regards,
baolu
