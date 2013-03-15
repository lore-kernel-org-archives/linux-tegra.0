From: Hiroshi Doyu <hdoyu@nvidia.com>
Subject: Re: [PATCH 1/1] amba: tegra-ahb: Fix build error w/ PM_SLEEP w/o
 PM_RUNTIME
Date: Fri, 15 Mar 2013 07:56:00 +0100
Message-ID: <20130315.085600.1539318572744189496.hdoyu@nvidia.com>
References: <1363252089-4120-1-git-send-email-hdoyu@nvidia.com><5142B05A.2070408@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5142B05A.2070408@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>
Cc: "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

Stephen Warren <swarren@wwwdotorg.org> wrote @ Fri, 15 Mar 2013 06:23:38 +0100:

> On 03/14/2013 03:08 AM, Hiroshi Doyu wrote:
> > Make this depend on CONFIG_PM. This protection is necessary to not
> > cause any build errors with any combination of PM features especially
> > when supporting a new SoC where each PM features are being enabled
> > one-by-one during its depelopment.
> 
> Looks fine to me.
> 
> Acked-by: Stephen Warren <swarren@nvidia.com>
> 
> I assume Russell will want this to go through his patch tracker.

FYI: Patch has been accepted as patch 7675/1
