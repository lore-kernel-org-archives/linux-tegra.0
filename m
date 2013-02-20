From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 2/4] ARM: tegra: add SDHCI support for Dalmore
Date: Wed, 20 Feb 2013 12:07:31 -0700
Message-ID: <51251EF3.4050901@wwwdotorg.org>
References: <1361385317-6020-1-git-send-email-rklein@nvidia.com> <1361385317-6020-3-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-mmc-owner@vger.kernel.org>
In-Reply-To: <1361385317-6020-3-git-send-email-rklein@nvidia.com>
Sender: linux-mmc-owner@vger.kernel.org
To: Rhyland Klein <rklein@nvidia.com>
Cc: Chris Ball <cjb@laptop.org>, linux-tegra@vger.kernel.org, linux-mmc@vger.kernel.org, Pritesh Raithatha <praithatha@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On 02/20/2013 11:35 AM, Rhyland Klein wrote:
> Based on changes by: Pritesh Raithatha <praithatha@nvidia.com>
> Signed-off-by: Rhyland Klein <rklein@nvidia.com>

A patch description would be useful here. Something simple like:

Dalmore has a built-in eMMC device and a user-accessible SD card slot.
Add device tree nodes to enable these.

The same rebasing comment will apply here too.
