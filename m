From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 1/4] ARM tegra: add SDHCI nodes with common properties
Date: Wed, 20 Feb 2013 12:06:44 -0700
Message-ID: <51251EC4.9050404@wwwdotorg.org>
References: <1361385317-6020-1-git-send-email-rklein@nvidia.com> <1361385317-6020-2-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-mmc-owner@vger.kernel.org>
In-Reply-To: <1361385317-6020-2-git-send-email-rklein@nvidia.com>
Sender: linux-mmc-owner@vger.kernel.org
To: Rhyland Klein <rklein@nvidia.com>
Cc: Chris Ball <cjb@laptop.org>, linux-tegra@vger.kernel.org, linux-mmc@vger.kernel.org, Pritesh Raithatha <praithatha@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On 02/20/2013 11:35 AM, Rhyland Klein wrote:
> From: Pritesh Raithatha <praithatha@nvidia.com>
> 
> This patch adds in the SDHCI nodes for the busses supported on Tegra114
> boards.

This patch looks fine, although it'd need some modifications to rebase
it on top of the cpp usage in *.dts, which I believe I'll check in early
for 3.10.
