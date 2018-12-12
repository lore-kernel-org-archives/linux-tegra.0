From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH V2] kmemleak: Add config to select auto scan
Date: Wed, 12 Dec 2018 10:14:49 +0000
Message-ID: <20181212101448.GA65138@arrakis.emea.arm.com>
References: <1540231723-7087-1-git-send-email-prpatel@nvidia.com>
 <20181029104320.GC168424@arrakis.emea.arm.com>
 <a51a7d4b-6366-ea10-f220-992525ec1d42@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <a51a7d4b-6366-ea10-f220-992525ec1d42@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Prateek Patel <prpatel@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-tegra@vger.kernel.org, snikam@nvidia.com, vdumpa@nvidia.com, talho@nvidia.com, swarren@nvidia.com, treding@nvidia.com
List-Id: linux-tegra@vger.kernel.org

On Wed, Dec 12, 2018 at 12:14:29PM +0530, Prateek Patel wrote:
> On 10/29/2018 4:13 PM, Catalin Marinas wrote:
> > On Mon, Oct 22, 2018 at 11:38:43PM +0530, Prateek Patel wrote:
> > > From: Sri Krishna chowdary <schowdary@nvidia.com>
> > > 
> > > Kmemleak scan can be cpu intensive and can stall user tasks at times.
> > > To prevent this, add config DEBUG_KMEMLEAK_AUTO_SCAN to enable/disable
> > > auto scan on boot up.
> > > Also protect first_run with DEBUG_KMEMLEAK_AUTO_SCAN as this is meant
> > > for only first automatic scan.
> > > 
> > > Signed-off-by: Sri Krishna chowdary <schowdary@nvidia.com>
> > > Signed-off-by: Sachin Nikam <snikam@nvidia.com>
> > > Signed-off-by: Prateek <prpatel@nvidia.com>
> > Looks fine to me.
> > 
> > Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> 
> Can you mark this patch as acknowledged so that it can be picked up by the
> maintainer.

I thought Reviewed-by was sufficient. Anyway:

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
