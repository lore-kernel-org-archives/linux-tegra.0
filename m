From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 5/6] include/linux/platform_data/tegra_emc.h: Remove unused
 header
Date: Tue, 24 Jun 2014 13:21:23 -0600
Message-ID: <53A9CFB3.6080501@wwwdotorg.org>
References: <1403630855-29186-1-git-send-email-linux@rasmusvillemoes.dk> <1403630855-29186-6-git-send-email-linux@rasmusvillemoes.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1403630855-29186-6-git-send-email-linux@rasmusvillemoes.dk>
Sender: linux-kernel-owner@vger.kernel.org
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On 06/24/2014 11:27 AM, Rasmus Villemoes wrote:
> The header file include/linux/platform_data/tegra_emc.h does not seem
> to be used anywhere. It was orphaned by a7cbe92c "ARM: tegra: remove
> tegra EMC scaling driver". Remove it.

Acked-by: Stephen Warren <swarren@nvidia.com>

Perhaps this should go through the arm-soc tree like the original
commit, but it doesn't really matter either way.
