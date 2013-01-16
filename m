From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 1/4] arm: tegra: Add DT nodes for Tegra USB PHY
Date: Wed, 16 Jan 2013 14:49:22 -0700
Message-ID: <50F72062.7060404@wwwdotorg.org>
References: <1358343022-28919-1-git-send-email-vbyravarasu@nvidia.com> <1358343022-28919-2-git-send-email-vbyravarasu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1358343022-28919-2-git-send-email-vbyravarasu@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Venu Byravarasu <vbyravarasu@nvidia.com>
Cc: gregkh@linuxfoundation.org, balbi@ti.com, stern@rowland.harvard.edu, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 01/16/2013 06:30 AM, Venu Byravarasu wrote:
> Add DT nodes for Tegra USB PHY along with related documentation.
> Also added a phandle property to controller DT node, for referring
> to connected PHY instance.

Just a quick reminder to Greg, Felipe, Alan: Once this series passes
review, I'll need to take it through the Tegra tree. (Sorry if I'm
belabouring that point). This patch in particular will interact with the
common clock framework changes that will very soon be in the Tegra tree.
