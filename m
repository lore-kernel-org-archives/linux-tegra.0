From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 21/31] staging: nvec: use reset framework
Date: Tue, 19 Nov 2013 15:23:35 -0800
Message-ID: <20131119232335.GA24947@kroah.com>
References: <1384548866-13141-1-git-send-email-swarren@wwwdotorg.org>
 <1384548866-13141-22-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <1384548866-13141-22-git-send-email-swarren@wwwdotorg.org>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: driverdev-devel-bounces@linuxdriverproject.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: devel@driverdev.osuosl.org, Stephen Warren <swarren@nvidia.com>, pdeschrijver@nvidia.com, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, treding@nvidia.com, ac100@lists.launchpad.net
List-Id: linux-tegra@vger.kernel.org

On Fri, Nov 15, 2013 at 01:54:16PM -0700, Stephen Warren wrote:
> From: Stephen Warren <swarren@nvidia.com>
> 
> Tegra's clock driver now provides an implementation of the common
> reset API (include/linux/reset.h). Use this instead of the old Tegra-
> specific API; that will soon be removed.
> 
> Cc: treding@nvidia.com
> Cc: pdeschrijver@nvidia.com
> Cc: linux-tegra@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: Julian Andres Klode <jak@jak-linux.org>
> Cc: Marc Dietrich <marvin24@gmx.de>
> Cc: ac100@lists.launchpad.net
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: devel@driverdev.osuosl.org
> Signed-off-by: Stephen Warren <swarren@nvidia.com>
> ---
> This patch is part of a series with strong internal depdendencies. I'm
> looking for an ack so that I can take the entire series through the Tegra
> and arm-soc trees. The series will be part of a stable branch that can be
> merged into other subsystems if needed to avoid/resolve dependencies.

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
