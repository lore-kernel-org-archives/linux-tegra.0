From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH] selinux: avc: mark avc node as not a leak
Date: Wed, 9 Jan 2019 11:31:26 +0000
Message-ID: <20190109113126.nzpmb7xx4xqtn37w@mbp>
References: <1547023162-6381-1-git-send-email-prpatel@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1547023162-6381-1-git-send-email-prpatel@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Prateek Patel <prpatel@nvidia.com>
Cc: paul@paul-moore.com, sds@tycho.nsa.gov, eparis@parisplace.org, linux-kernel@vger.kernel.org, selinux@vger.kernel.org, linux-tegra@vger.kernel.org, talho@nvidia.com, swarren@nvidia.com, linux-mm@kvack.org, snikam@nvidia.com, vdumpa@nvidia.com, Sri Krishna chowdary <schowdary@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Hi Prateek,

On Wed, Jan 09, 2019 at 02:09:22PM +0530, Prateek Patel wrote:
> From: Sri Krishna chowdary <schowdary@nvidia.com>
> 
> kmemleak detects allocated objects as leaks if not accessed for
> default scan time. The memory allocated using avc_alloc_node
> is freed using rcu mechanism when nodes are reclaimed or on
> avc_flush. So, there is no real leak here and kmemleak_scan
> detects it as a leak which is false positive. Hence, mark it as
> kmemleak_not_leak.

In theory, kmemleak should detect the node->rhead in the lists used by
call_rcu() and not report it as a leak. Which RCU options do you have
enabled (just to check whether kmemleak tracks the RCU internal lists)?

Also, does this leak eventually disappear without your patch? Does

  echo dump=0xffffffc0dd1a0e60 > /sys/kernel/debug/kmemleak

still display this object?

Thanks.

-- 
Catalin
