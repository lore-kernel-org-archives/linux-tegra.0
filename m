From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 2/4] ARM: tegra: add SDHCI support for Dalmore
Date: Wed, 06 Mar 2013 14:19:56 -0700
Message-ID: <5137B2FC.3060800@wwwdotorg.org>
References: <1361385317-6020-1-git-send-email-rklein@nvidia.com> <1361385317-6020-3-git-send-email-rklein@nvidia.com> <51251EF3.4050901@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-mmc-owner@vger.kernel.org>
In-Reply-To: <51251EF3.4050901@wwwdotorg.org>
Sender: linux-mmc-owner@vger.kernel.org
To: Rhyland Klein <rklein@nvidia.com>
Cc: Chris Ball <cjb@laptop.org>, linux-tegra@vger.kernel.org, linux-mmc@vger.kernel.org, Pritesh Raithatha <praithatha@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On 02/20/2013 12:07 PM, Stephen Warren wrote:
> On 02/20/2013 11:35 AM, Rhyland Klein wrote:
>> Based on changes by: Pritesh Raithatha <praithatha@nvidia.com>
>> Signed-off-by: Rhyland Klein <rklein@nvidia.com>
> 
> A patch description would be useful here. Something simple like:
> 
> Dalmore has a built-in eMMC device and a user-accessible SD card slot.
> Add device tree nodes to enable these.
> 
> The same rebasing comment will apply here too.

I went ahead and applied patches 1/2 and 2/2 to Tegra's for-3.10/dt
branch. I added the commit description I mentioned above.

I think what I'll do for the dtc+cpp usage is to apply patches that come
in before all the dependencies for dtc+cpp are in place, then rebase and
repost my series that converts to use dtc+cpp. That'll save blocking any
other patches on dtc+cpp availability, and save everyone rebasing.
